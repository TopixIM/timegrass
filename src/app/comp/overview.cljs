
(ns app.comp.overview
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.macros
             :refer
             [defcomp list-> cursor-> list-> <> span div button textarea a]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]
            [app.style :as style]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            [respo.util.list :refer [map-val]]
            [respo-ui.comp.icon :refer [comp-icon]]
            [inflow-popup.comp.dialog :refer [comp-menu-dialog comp-dialog]]
            ["dayjs" :as dayjs]))

(defcomp
 comp-active-task
 (states task)
 (let [state (or (:data states)
                 {:menu? false, :show-editor? false, :draft "", :show-confirm? false})]
   (div
    {:style (merge
             {:border-bottom (str "1px solid " (hsl 0 0 90)),
              :line-height "24px",
              :padding "8px 8px",
              :overflow :auto}
             (when (or (:menu? state) (:show-editor? state) (:show-confirm? state))
               {:background-color (hsl 0 0 94)})),
     :on-click (fn [e d! m!] (m! (assoc state :menu? true)))}
    (div {:style ui/flex} (<> (:text task) {}))
    (when (:menu? state)
      (comp-menu-dialog
       (fn [result d! m!]
         (let [new-state (assoc state :menu? false)]
           (case result
             :done (d! :task/finish-working (:id task))
             :edit (m! (assoc new-state :show-editor? true :draft (:text task)))
             :remove (m! (assoc new-state :show-confirm? true))
             (m! new-state))))
       {:done "Done", :edit "Edit", :remove "Remove"}))
    (when (:show-editor? state)
      (comp-dialog
       (fn [m!] (m! (assoc state :show-editor? false)))
       (div
        {:style ui/column}
        (textarea
         {:style (merge ui/textarea {:width 320}),
          :value (:draft state),
          :on-input (fn [e d! m!] (m! (assoc state :draft (:value e))))})
        (=< nil 8)
        (div
         {:style ui/row-parted}
         (span {})
         (button
          {:style ui/button,
           :inner-text "Edit",
           :on-click (fn [e d! m!]
             (d! :task/update-working {:id (:id task), :text (:draft state)})
             (m! (assoc state :show-editor? false :draft "")))})))))
    (when (:show-confirm? state)
      (comp-dialog
       (fn [m!] (m! (assoc state :show-confirm? false)))
       (div
        {:style (merge ui/column {:width 320})}
        (div {} (<> "Sure to delete?"))
        (=< nil 8)
        (div
         {:style ui/row-parted}
         (span {})
         (button
          {:style ui/button,
           :inner-text "Confirm",
           :on-click (fn [e d! m!]
             (d! :task/remove-working (:id task))
             (m! (assoc state :show-confirm? false)))}))))))))

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
    (div
     {:style ui/center}
     (a
      {:style {:color (hsl 200 80 60), :font-family ui/font-fancy},
       :on-click (fn [e d! m!] (d! :router/change {:name :history}))}
      (<> "View older"))))))
