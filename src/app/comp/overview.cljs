
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
             {:border-bottom (str "1px solid " (hsl 0 0 90)), :line-height "40px"})}
    (div {:style ui/flex} (<> (:text task) {:white-space :nowrap}))
    (=< 8 nil)
    (span
     {:on-click (fn [e d! m!] (m! (assoc state :menu? true))),
      :style (merge ui/center {:width 16})}
     (comp-icon :android-more-vertical))
    (when (:menu? state)
      (comp-menu-dialog
       (fn [result d! m!]
         (println "result" result)
         (case result
           :done (d! :task/finish-working (:id task))
           :remove (d! :task/remove-working (:id task))
           :else))
       (fn [m!] (m! %cursor (assoc state :menu? false)))
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
     {:style ui/row}
     (<> today)
     (=< 8 nil)
     (div
      {}
      (cursor->
       :create
       comp-prompt
       states
       {:trigger (button {:style style/button, :inner-text "Create"}),
        :text "Create new task:"}
       (fn [result d! m!] (d! :task/create-working result)))))
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
