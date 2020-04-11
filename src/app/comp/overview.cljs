
(ns app.comp.overview
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.core
             :refer
             [defcomp list-> >> <> span div button textarea input a defeffect]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]
            [app.style :as style]
            [respo-alerts.core
             :refer
             [comp-prompt comp-modal comp-modal-menu use-prompt use-confirm]]
            [respo.util.list :refer [map-val]]
            [feather.core :refer [comp-i]]
            ["dayjs" :as dayjs]
            ["copy-text-to-clipboard" :as copy!]))

(defcomp
 comp-no-tasks
 ()
 (div
  {:style (merge ui/center {:color (hsl 0 0 80), :font-family ui/font-fancy})}
  (<> "No tasks")))

(defcomp
 comp-task
 (states task mode)
 (let [cursor (:cursor states)
       state (or (:data states) {:menu? false})
       update-plugin (use-prompt
                      (>> states :drafter)
                      {:text "Task content:",
                       :initial (:text task),
                       :placeholder "task...",
                       :button-text "Edit"})
       delete-plugin (use-confirm (>> states :delete) {:text "Sure to remove task:"})]
   (div
    {:style (merge
             {:border-bottom (str "1px solid " (hsl 0 0 90)),
              :line-height "24px",
              :padding "8px 8px",
              :overflow :auto,
              :user-select :none}
             (when (or (:menu? state)) {:background-color (hsl 0 0 94)})),
     :on-click (fn [e d!] (d! cursor (assoc state :menu? true))),
     :on-dragend (fn [e d!] (d! :task/touch-working (:id task))),
     :draggable true}
    (div {:style ui/flex} (<> (:text task) {}))
    (comp-modal-menu
     {:title "Operations",
      :style {:width 320},
      :items [{:value :done, :display "Done"}
              {:value :pend, :display (if (= mode :pending) "Do it now" "Do it later")}
              {:value :touch, :display "Up"}
              {:value :copy, :display "Copy"}
              {:value :edit, :display "Edit"}
              {:value :remove, :display "Remove"}]}
     (:menu? state)
     (fn [d!] (d! cursor (assoc state :menu? false)))
     (fn [item d!]
       (let [new-state (assoc state :menu? false), result (:value item)]
         (case result
           :done (do (d! :task/finish-working (:id task)) (d! cursor new-state))
           :edit
             (do
              (d! cursor new-state)
              ((:show update-plugin)
               d!
               (fn [text] (d! :task/update-working {:id (:id task), :text text}))))
           :copy (do (copy! (:text task)) (d! cursor new-state))
           :remove
             (do
              (d! cursor new-state)
              ((:show delete-plugin) d! (fn [] (d! :task/remove-working (:id task)))))
           :pend (do (d! :task/pend (:id task)) (d! cursor new-state))
           :touch (do (d! :task/touch-working (:id task)) (d! cursor new-state))
           (d! cursor new-state)))))
    (:ui update-plugin)
    (:ui delete-plugin))))

(defcomp
 comp-title
 (title child)
 (div
  {:style (merge
           ui/row-middle
           {:margin "8px 0",
            :font-family ui/font-fancy,
            :color (hsl 0 0 50),
            :font-size 16,
            :font-weight 300})}
  (<> title)
  (=< 16 nil)
  child))

(defcomp
 comp-overview
 (states today tasks)
 (let [working-tasks (->> tasks (filter (fn [[k task]] (not (:pending? task)))) (into {}))
       pending-tasks (->> tasks (filter (fn [[k task]] (:pending? task))) (into {}))]
   (div
    {:style (merge ui/expand {:padding 16})}
    (div
     {:style {:max-width 800, :margin :auto}}
     (div
      {:style ui/row-parted}
      (comp-title
       "Doing"
       (comp-prompt
        (>> states :creater)
        {:trigger (comp-i :plus 14 (hsl 200 80 80)), :text "Create new task:"}
        (fn [result d! m!] (d! :task/create-working result))))
      (div
       {:style (merge ui/row-middle {:font-family ui/font-fancy, :color (hsl 0 0 60)})}
       (<> (.format (dayjs today) "ddd"))
       (=< 8 nil)
       (<> (str (.week (dayjs today)) "th week"))
       (=< 16 nil)
       (<> today)))
     (if (empty? working-tasks)
       (comp-no-tasks)
       (list->
        {}
        (->> working-tasks
             (sort-by
              (fn [[k task]]
                (unchecked-negate (or (:touched-time task) (:created-time task)))))
             (map-val (fn [task] (comp-task (>> states (:id task)) task :working))))))
     (when (not (empty? pending-tasks))
       (div
        {}
        (comp-title "Later" nil)
        (list->
         {}
         (->> pending-tasks
              (sort-by
               (fn [[k task]]
                 (unchecked-negate (or (:touched-time task) (:created-time task)))))
              (map-val (fn [task] (comp-task (>> states (:id task)) task :pending)))))))))))

(defeffect
 effect-focus
 ()
 (action el *local)
 (case action :mount (-> el (.querySelector "input") (.focus)) (do)))
