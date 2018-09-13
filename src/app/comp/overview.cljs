
(ns app.comp.overview
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.macros :refer [defcomp list-> cursor-> list-> <> span div button]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]
            [app.style :as style]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            [respo.util.list :refer [map-val]]
            [respo-ui.comp.icon :refer [comp-icon]]
            [inflow-popup.comp.dialog :refer [comp-menu-dialog]]
            ["dayjs" :as dayjs]))

(defcomp
 comp-active-task
 (states task)
 (let [state (or (:data states) {:menu? false})]
   (div
    {:style (merge
             ui/row-center
             {:border-bottom (str "1px solid " (hsl 0 0 90)), :line-height "40px"}),
     :on-click (fn [e d! m!] (m! (assoc state :menu? true)))}
    (div {:style ui/flex} (<> (:text task) {:white-space :nowrap}))
    (when (:menu? state)
      (comp-menu-dialog
       (fn [result d! m!]
         (case result
           :done (d! :task/finish-working (:id task))
           :remove (d! :task/remove-working (:id task))
           :else)
         (m! (assoc state :menu? false)))
       {:done "Done", :remove "Remove"})))))

(defcomp
 comp-done-task
 (task)
 (div
  {:style ui/row}
  (div
   {:style {:width 80, :color (hsl 0 0 80), :font-size 12}}
   (<> (.format (dayjs (:finished-time task)) "MM-DD HH:mm")))
  (div {:style ui/flex} (<> (:text task)))))

(defcomp
 comp-overview
 (states today tasks)
 (let [working-tasks (:working tasks), finished-tasks (:finished tasks)]
   (div
    {:style (merge ui/flex {:padding 16, :overflow :auto})}
    (div
     {:style (merge ui/row {:font-family ui/font-fancy, :color (hsl 0 0 60)})}
     (<> today)
     (=< 16 nil)
     (<> (str (.week (dayjs today)) "th week")))
    (=< nil 16)
    (list->
     {}
     (->> (or working-tasks {})
          (sort-by (fn [[k task]] (unchecked-negate (:created-time task))))
          (map-val (fn [task] (cursor-> (:id task) comp-active-task states task)))))
    (=< nil 16)
    (let [grouped-tasks (->> (vals finished-tasks)
                             (group-by
                              (fn [task]
                                (.format (dayjs (:created-time task)) "YYYY-MM-DD"))))]
      (div
       {}
       (list->
        {}
        (->> grouped-tasks
             (sort (fn [x y] (compare (first y) (first x))))
             (map
              (fn [[date-string task-list]]
                [date-string
                 (div
                  {:style (merge ui/column {:margin-top 24})}
                  (<> date-string {:font-family ui/font-fancy})
                  (=< nil 4)
                  (list->
                   {}
                   (->> task-list
                        (sort-by (fn [task] (unchecked-negate (:finished-time task))))
                        (map (fn [task] [(:id task) (comp-done-task task)])))))])))))))))
