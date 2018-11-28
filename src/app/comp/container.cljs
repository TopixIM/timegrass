
(ns app.comp.container
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.core :refer [defcomp <> div span action-> cursor-> button]]
            [respo.comp.inspect :refer [comp-inspect]]
            [respo.comp.space :refer [=<]]
            [app.comp.navigation :refer [comp-navigation]]
            [app.comp.profile :refer [comp-profile]]
            [app.comp.login :refer [comp-login]]
            [respo-message.comp.messages :refer [comp-messages]]
            [cumulo-reel.comp.reel :refer [comp-reel]]
            [app.config :refer [dev?]]
            [app.schema :as schema]
            [app.comp.overview :refer [comp-overview]]
            [app.config :as config]
            [app.comp.history :refer [comp-history]]
            [app.comp.meeting :refer [comp-meeting]]))

(defcomp
 comp-offline
 ()
 (div
  {:style (merge ui/global ui/fullscreen ui/center {:background-color (:theme config/site)})}
  (span
   {:style {:cursor :pointer}, :on-click (action-> :effect/connect nil)}
   (<>
    "Socket broken! Click to retry."
    {:font-family ui/font-fancy, :font-weight 100, :font-size 32}))))

(defcomp
 comp-status-color
 (color)
 (div
  {:style {:width 16,
           :height 16,
           :position :absolute,
           :bottom 16,
           :right 8,
           :background-color color,
           :border-radius "8px",
           :opacity 0.8}}))

(defcomp
 comp-container
 (states store)
 (let [state (:data states)
       session (:session store)
       router (:router store)
       router-data (:data router)]
   (if (nil? store)
     (comp-offline)
     (div
      {:style (merge ui/global ui/fullscreen ui/column)}
      (comp-navigation states (:logged-in? store) (:count store))
      (if (:logged-in? store)
        (case (:name router)
          :home (cursor-> :overview comp-overview states (:today store) (:tasks store))
          :history (cursor-> :history comp-history states (:finished (:tasks store)))
          :profile (comp-profile (:user store) (:data router))
          :meeting (comp-meeting (:today store) (:tasks store))
          (<> (str "404 page:" router)))
        (comp-login states))
      (comp-status-color (:color store))
      (when dev? (comp-inspect "Store" store {:bottom 0, :left 0, :z-index 9999}))
      (comp-messages
       (get-in store [:session :messages])
       {}
       (fn [info d! m!] (d! :session/remove-message info)))
      (when dev? (comp-reel (:reel-length store) {}))))))

(def style-body {:padding "8px 16px"})
