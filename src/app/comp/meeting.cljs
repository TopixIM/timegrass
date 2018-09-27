
(ns app.comp.meeting
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.comp.space :refer [=<]]
            [respo.macros :refer [defcomp list-> <> action-> cursor-> span div]]
            [app.config :as config]
            [respo-ui.comp.icon :refer [comp-icon]]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            ["dayjs" :as dayjs]))

(defcomp
 comp-task
 (task)
 (div
  {:style {:padding "4px 0px",
           :margin "0 8px",
           :border-bottom (str "1px solid " (hsl 0 0 90)),
           :line-height "24px"}}
  (<> (:text task))))

(defcomp
 comp-title
 (title)
 (div {:style {:margin-top 40, :font-family ui/font-fancy, :font-weight 300}} (<> title)))

(defcomp
 comp-meeting
 (today-date all-tasks)
 (let [yesterday (-> (dayjs today-date) (.subtract 1 "day") (.startOf "day"))
       working-tasks (:working all-tasks)
       yesterday-tasks (->> (:finished all-tasks)
                            (filter
                             (fn [[k task]]
                               (.isAfter yesterday (dayjs (:finished-time task)))))
                            (into {}))]
   (div
    {:style {:padding 16}}
    (comp-title "Todo")
    (list-> {} (->> working-tasks (map (fn [[k task]] [k (comp-task task)]))))
    (comp-title "Yesterday")
    (list-> {} (->> yesterday-tasks (map (fn [[k task]] [k (comp-task task)])))))))
