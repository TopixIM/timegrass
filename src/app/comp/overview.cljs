
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
            [inflow-popup.comp.dialog :refer [comp-menu-dialog]]))

(defcomp
 comp-active-task
 (states task)
 (let [state (or (:data states) {:menu? false})]
   (div
    {:style (merge
             ui/row-center
             {:border-bottom (str "1px solid " (hsl 0 0 90)), :line-height "32px"})}
    (div {:style ui/flex} (<> (:text task)))
    (=< 8 nil)
    (span
     {:on-click (fn [e d! m!] (m! (assoc state :menu? true)))}
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
 comp-overview
 (states today tasks)
 (let [working-tasks (:working tasks), finished-tasks (:finished tasks)]
   (div
    {:style {:padding 16}}
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
    (div
     {}
     (list->
      {}
      (->> (or working-tasks {})
           (map-val (fn [task] (cursor-> (:id task) comp-active-task states task))))))
    (=< nil 16)
    (div
     {}
     (list->
      {}
      (->> (or finished-tasks {}) (map-val (fn [task] (div {} (<> (:text task)))))))))))
