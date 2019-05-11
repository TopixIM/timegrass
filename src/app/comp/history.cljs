
(ns app.comp.history
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.comp.space :refer [=<]]
            [respo.core :refer [defcomp <> action-> list-> cursor-> span div]]
            [app.config :as config]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            ["dayjs" :as dayjs]
            [inflow-popup.comp.dialog :refer [comp-menu-dialog]]
            [feather.core :refer [comp-icon]])
  (:require-macros [clojure.core.strint :refer [<<]]))

(defcomp
 comp-done-task
 (states task)
 (let [state (or (:data states) {:show-menu? false})]
   (div
    {:style (merge
             {:padding "4px 8px"}
             (when (:show-menu? state) {:background-color (hsl 0 0 94)})),
     :on-click (fn [e d! m!] (m! (assoc state :show-menu? true)))}
    (<>
     (.format (dayjs (:finished-time task)) "HH:mm")
     {:min-width 32, :color (hsl 0 0 80), :font-size 12, :display :inline-block})
    (=< 4 nil)
    (span {:style (merge ui/flex {:line-height "24px"})} (<> (:text task)))
    (when (:show-menu? state)
      (comp-menu-dialog
       (fn [result d! m!]
         (m! (assoc state :show-menu? false))
         (when (= :put-back result) (d! :task/put-back (:id task))))
       {:put-back (<> "Put back")})))))

(defcomp
 comp-history
 (states data finished-tasks)
 (let [year (:year data), week (:week data)]
   (div
    {:style (merge ui/flex {:padding "16px 16px", :overflow :auto})}
    (div
     {:style (merge ui/row-parted {:margin "8px 0"})}
     (<>
      (<< "Histories of ~{week}th week in ~{year}")
      {:font-family ui/font-fancy, :font-size 16, :color (hsl 0 0 50)})
     (div
      {:style ui/row}
      (comp-icon
       :arrow-left
       {:font-size 16, :color (hsl 200 80 80), :cursor :pointer}
       (fn [e d! m!]
         (d!
          :router/change
          {:name :history,
           :data (if (<= week 1)
             {:year (dec year), :week 53}
             {:year year, :week (dec week)})})))
      (=< 8 nil)
      (comp-icon
       :arrow-right
       {:font-size 16, :color (hsl 200 80 80), :cursor :pointer}
       (fn [e d! m!]
         (d!
          :router/change
          {:name :history,
           :data (if (>= week 53)
             {:year (inc year), :week 1}
             {:year year, :week (inc week)})})))))
    (if (empty? finished-tasks)
      (div
       {:style (merge ui/center {:height 80})}
       (<> "No tasks." {:font-family ui/font-fancy, :color (hsl 0 0 80)}))
      (let [grouped-tasks (->> (vals finished-tasks)
                               (group-by
                                (fn [task]
                                  (.format (dayjs (:finished-time task)) "YYYY-MM-DD"))))]
        (list->
         {}
         (->> grouped-tasks
              (sort (fn [x y] (compare (first y) (first x))))
              (map
               (fn [[date-string task-list]]
                 [date-string
                  (div
                   {:style (merge ui/column {:margin-top 16})}
                   (let [the-day (dayjs date-string)]
                     (div
                      {:style ui/row-parted}
                      (span
                       {:style {:font-family ui/font-fancy}}
                       (<> (.format the-day "ddd"))
                       (=< 12 nil)
                       (<> (.format the-day "MM-DD")))))
                   (=< nil 4)
                   (list->
                    {}
                    (->> task-list
                         (sort-by (fn [task] (unchecked-negate (:finished-time task))))
                         (map
                          (fn [task]
                            [(:id task) (cursor-> (:id task) comp-done-task states task)])))))])))))))))
