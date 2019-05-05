
(ns app.comp.meeting
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.comp.space :refer [=<]]
            [respo.core :refer [defcomp list-> <> action-> cursor-> span div]]
            [app.config :as config]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            ["dayjs" :as dayjs]))

(defcomp
 comp-empty
 ()
 (div
  {:style (merge
           ui/center
           {:font-family ui/font-fancy, :border-bottom (str "1px solid " (hsl 0 0 93))})}
  (<> "No tasks")))

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
                               (.isBefore yesterday (dayjs (:finished-time task)))))
                            (into {}))]
   (div
    {:style {:padding 16}}
    (div
     {:style {:font-family ui/font-fancy,
              :font-size 24,
              :line-height "24px",
              :color (hsl 0 0 80)}}
     (<> "Meeting Mode"))
    (comp-title "Just did:")
    (if (empty? yesterday-tasks)
      (comp-empty)
      (list-> {} (->> yesterday-tasks (map (fn [[k task]] [k (comp-task task)])))))
    (comp-title "Todo today:")
    (if (empty? working-tasks)
      (comp-empty)
      (list-> {} (->> working-tasks (map (fn [[k task]] [k (comp-task task)]))))))))
