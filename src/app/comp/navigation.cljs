
(ns app.comp.navigation
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.comp.space :refer [=<]]
            [respo.core :refer [defcomp <> >> span div]]
            [app.config :as config]
            [respo-alerts.core :refer [comp-prompt]]
            ["dayjs" :as dayjs]))

(defn render-entry [title get-route highlighted?]
  (div
   {:style {:cursor :pointer}, :on-click (fn [e d!] (d! :router/change (get-route)))}
   (<> title (merge {:opacity 0.5} (if highlighted? {:opacity 1})))))

(def style-navbar
  (merge
   ui/row-center
   {:height 48,
    :padding "0 16px",
    :font-size 16,
    :border-bottom (str "1px solid " (hsl 0 0 0 0.1)),
    :font-family ui/font-fancy,
    :background-color (:theme config/site),
    :color :white}))

(defcomp
 comp-navigation
 (logged-in? count-members page)
 (let [today (dayjs)
       year (.year today)
       month (.month today)
       week (let [w (.week today)]
              (if (and (== month 11) (> (.date today) 25))
                (inc (.week (.subtract today 7 "day")))
                w))]
   (div
    {:style style-navbar}
    (div
     {:style (merge ui/row-parted {:max-width 840, :width "100%", :margin :auto})}
     (div
      {:style (merge ui/row-center)}
      (render-entry "Timegrass" (fn [] {:name :home}) (= page :home))
      (=< 16 nil)
      (render-entry
       "Finished"
       (fn [] {:name :history, :data {:year year, :week week}})
       (= page :history))
      (=< 16 nil)
      (render-entry
       "Notes"
       (fn [] {:name :notes, :data (let [now (dayjs)] {:year year, :month month})})
       (= page :notes)))
     (div
      {:style {:cursor "pointer"},
       :on-click (fn [e d!] (d! :router/change {:name :profile}))}
      (<> (if logged-in? "Me" "Guest"))
      (=< 8 nil)
      (<> count-members))))))
