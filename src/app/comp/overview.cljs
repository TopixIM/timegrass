
(ns app.comp.overview
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.macros :refer [defcomp list-> cursor-> list-> <> span div button]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]
            [app.style :as style]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            [respo.util.list :refer [map-val]]))

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
           (map-val
            (fn [task]
              (div
               {}
               (<> (:text task))
               (=< 8 nil)
               (button
                {:style style/button,
                 :on-click (fn [e d! m!] (d! :task/remove-working (:id task))),
                 :inner-text "Remove"})
               (=< 8 nil)
               (button
                {:style style/button,
                 :on-click (fn [e d! m!] (d! :task/finish-working (:id task))),
                 :inner-text "Done"})))))))
    (=< nil 16)
    (div
     {}
     (list->
      {}
      (->> (or finished-tasks {}) (map-val (fn [task] (div {} (<> (:text task)))))))))))
