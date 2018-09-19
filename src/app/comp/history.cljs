
(ns app.comp.history
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.comp.space :refer [=<]]
            [respo.macros :refer [defcomp <> action-> list-> cursor-> span div]]
            [app.config :as config]
            [respo-ui.comp.icon :refer [comp-icon]]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            ["dayjs" :as dayjs]))

(defcomp
 comp-done-task
 (task)
 (div
  {:style (merge ui/row {:padding "4px 0"})}
  (div
   {:style {:width 80, :color (hsl 0 0 80), :font-size 12}}
   (<> (.format (dayjs (:finished-time task)) "MM-DD HH:mm")))
  (div {:style (merge ui/flex {:line-height "24px"})} (<> (:text task)))))

(defcomp
 comp-history
 (finished-tasks)
 (println "finished tasks")
 (div
  {:style (merge ui/flex {:padding "8px 16px", :overflow :auto})}
  (let [grouped-tasks (->> (vals finished-tasks)
                           (group-by
                            (fn [task] (.format (dayjs (:finished-time task)) "YYYY-MM-DD"))))]
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
                      (map (fn [task] [(:id task) (comp-done-task task)])))))]))))))))
