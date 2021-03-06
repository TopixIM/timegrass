
(ns app.comp.notes-page
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.core :refer [defcomp list-> >> <> span div button a]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]
            [respo-alerts.core :refer [comp-prompt comp-confirm]]
            [feather.core :refer [comp-i comp-icon]]
            ["dayjs" :as dayjs])
  (:require-macros [clojure.core.strint :refer [<<]]))

(defcomp
 comp-note
 (states note)
 (div
  {:style (merge
           ui/column
           {:border-top (str "1px solid " (hsl 0 0 94)), :padding "4px 8px"})}
  (div
   {:style ui/row-parted}
   (<>
    (-> (:time note) dayjs (.format "HH:mm"))
    {:font-family ui/font-fancy, :color (hsl 0 0 70), :font-size 12})
   (=< 8 nil)
   (div
    {:style ui/row-middle}
    (comp-prompt
     (>> states :edit)
     {:trigger (comp-i :edit 16 (hsl 200 80 80)),
      :text "Update note:",
      :multiline? true,
      :initial (:text note)}
     (fn [result d! m!] (d! :note/edit {:id (:id note), :text result})))
    (=< 8 nil)
    (comp-confirm
     (>> states :remove)
     {:trigger (comp-i :delete 16 (hsl 10 80 60)), :text "Sure to delete note?"}
     (fn [e d! m!] (d! :note/remove (:id note))))))
  (<> (:text note))))

(defcomp
 comp-notes-page
 (states notes info)
 (let [year (:year info), month (:month info)]
   (div
    {:style (merge ui/expand {:padding 16})}
    (div
     {:style {:max-width 800, :margin :auto}}
     (div
      {:style (merge ui/row-parted {:margin "8px 0"})}
      (span
       {:style ui/row-middle}
       (<> "Notes" {:color (hsl 0 0 50), :font-family ui/font-fancy, :font-size 16})
       (=< 16 nil)
       (comp-prompt
        (>> states :add)
        {:trigger (comp-i :plus 16 (hsl 200 80 80)),
         :text "Add note about today's work:",
         :multiline? true}
        (fn [result d!] (d! :note/add result))))
      (div
       {:style ui/row-middle}
       (comp-icon
        :arrow-left
        {:font-size 16, :color (hsl 200 80 80), :cursor :pointer}
        (fn [e d!]
          (d!
           :router/change
           {:name :notes,
            :data (if (<= month 0)
              {:year (dec year), :month 11}
              {:year year, :month (dec month)})})))
       (=< 8 nil)
       (comp-icon
        :arrow-right
        {:font-size 16, :color (hsl 200 80 80), :cursor :pointer}
        (fn [e d!]
          (d!
           :router/change
           {:name :notes,
            :data (if (>= month 11)
              {:year (inc year), :month 0}
              {:year year, :month (inc month)})})))
       (=< 8 nil)
       (<>
        (<< "~(inc month)th month of ~{year}.")
        {:font-family ui/font-fancy, :color (hsl 0 0 50)})))
     (if (empty? notes)
       (div
        {:style (merge ui/center {:min-height 120})}
        (<> "No notes" {:font-family ui/font-fancy, :color (hsl 0 0 80)}))
       (let [grouped-notes (->> notes
                                (group-by
                                 (fn [[k note]] (-> (:time note) (dayjs) (.format "MM-DD"))))
                                (sort
                                 (fn [x y] (unchecked-negate (compare (first x) (first y))))))]
         (list->
          {}
          (->> grouped-notes
               (map
                (fn [[date notes-in-day]]
                  [date
                   (div
                    {:style {:margin-top 16}}
                    (div
                     {:style {:font-family ui/font-fancy, :font-size 14, :font-weight 500}}
                     (<> (-> (str year "-" date) dayjs (.format "ddd")))
                     (=< 12 nil)
                     (<> (str date)))
                    (list->
                     {:style ui/column}
                     (->> notes-in-day
                          (sort-by (fn [[k note]] (unchecked-negate (:time note))))
                          (map (fn [[k note]] [k (comp-note (>> states k) note)])))))]))))))
     (=< nil 160)))))
