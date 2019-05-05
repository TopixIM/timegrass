
(ns app.comp.navigation
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.comp.space :refer [=<]]
            [respo.core :refer [defcomp <> action-> cursor-> span div]]
            [app.config :as config]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            ["dayjs" :as dayjs]))

(defcomp
 comp-navigation
 (states logged-in? count-members)
 (div
  {:style (merge
           ui/row-center
           {:height 48,
            :justify-content :space-between,
            :padding "0 16px",
            :font-size 16,
            :border-bottom (str "1px solid " (hsl 0 0 0 0.1)),
            :font-family ui/font-fancy,
            :background-color (:theme config/site),
            :color :white})}
  (div
   {:style (merge ui/row-center)}
   (div
    {:style {:cursor :pointer}, :on-click (action-> :router/change {:name :home})}
    (<> "Timegrass"))
   (=< 16 nil)
   (div
    {:style {:cursor :pointer},
     :on-click (action->
                :router/change
                {:name :notes,
                 :data (let [now (dayjs)] {:year (.year now), :week (.week now)})})}
    (<> "Notes")))
  (div
   {:style {:cursor "pointer"}, :on-click (action-> :router/change {:name :profile})}
   (<> (if logged-in? "Me" "Guest"))
   (=< 8 nil)
   (<> count-members))))
