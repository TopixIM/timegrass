
(ns app.comp.notes-page
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.core :refer [defcomp list-> cursor-> <> span div button a]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]
            [respo-alerts.comp.alerts :refer [comp-prompt comp-confirm]]
            [feather.core :refer [comp-i]]
            ["dayjs" :as dayjs])
  (:require-macros [clojure.core.strint :refer [<<]]))

(defcomp
 comp-note
 (states note)
 (div
  {:style (merge
           ui/column
           {:border-bottom (str "1px solid " (hsl 0 0 90)), :padding "4px 8px"})}
  (div
   {:style ui/row-parted}
   (<> (-> (:time note) dayjs (.format "MM-DD hh:mm:ss")) {:font-family ui/font-fancy})
   (=< 8 nil)
   (div
    {:style ui/row-middle}
    (cursor->
     :edit
     comp-prompt
     states
     {:trigger (comp-i :edit 16 (hsl 200 80 80)),
      :text "Update note:",
      :multiline? true,
      :initial (:text note)}
     (fn [result d! m!] (d! :note/edit {:id (:id note), :text result})))
    (=< 8 nil)
    (cursor->
     :remove
     comp-confirm
     states
     {:trigger (comp-i :delete 16 (hsl 10 80 60)), :text "Sure to delete note?"}
     (fn [e d! m!] (d! :note/remove (:id note))))))
  (<> (:text note))))

(defcomp
 comp-notes-page
 (states notes info)
 (let [year (:year info), week (:week info)]
   (div
    {:style (merge ui/flex {:padding 8})}
    (div
     {:style ui/row-parted}
     (cursor->
      :add
      comp-prompt
      states
      {:trigger (a {:inner-text "Add note", :style (merge ui/link)}),
       :text "Add note about today's work:",
       :multiline? true}
      (fn [result d! m!] (d! :note/add result)))
     (<> (<< "~{week}th week of ~{year}.") {:font-family ui/font-fancy}))
    (if (empty? notes)
      (div
       {:style (merge ui/center {:min-height 120})}
       (<> "No notes" {:font-family ui/font-fancy, :color (hsl 0 0 80)}))
      (list->
       {:style ui/column}
       (->> notes
            (sort-by (fn [[k note]] (unchecked-negate (:time note))))
            (map (fn [[k note]] [k (cursor-> k comp-note states note)]))))))))
