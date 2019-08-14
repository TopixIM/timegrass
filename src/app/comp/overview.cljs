
(ns app.comp.overview
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.core
             :refer
             [defcomp list-> cursor-> list-> <> span div button textarea input a]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]
            [app.style :as style]
            [respo-alerts.comp.alerts :refer [comp-prompt]]
            [respo.util.list :refer [map-val]]
            [feather.core :refer [comp-i]]
            [inflow-popup.comp.dialog :refer [comp-menu-dialog comp-dialog]]
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
 (let [state (or (:data states)
                 {:menu? false, :show-editor? false, :draft "", :show-confirm? false})]
   (div
    {:style (merge
             {:border-bottom (str "1px solid " (hsl 0 0 90)),
              :line-height "24px",
              :padding "8px 8px",
              :overflow :auto,
              :user-select :none}
             (when (or (:menu? state) (:show-editor? state) (:show-confirm? state))
               {:background-color (hsl 0 0 94)})),
     :on-click (fn [e d! m!] (m! (assoc state :menu? true))),
     :on-dragend (fn [e d! m!] (d! :task/touch-working (:id task))),
     :draggable true}
    (div {:style ui/flex} (<> (:text task) {}))
    (when (:menu? state)
      (comp-menu-dialog
       (fn [result d! m!]
         (let [new-state (assoc state :menu? false)]
           (case result
             :done (d! :task/finish-working (:id task))
             :edit (m! (assoc new-state :show-editor? true :draft (:text task)))
             :copy (do (copy! (:text task)) (m! new-state))
             :remove (m! (assoc new-state :show-confirm? true))
             :pend (do (d! :task/pend (:id task)) (m! new-state))
             :touch (do (d! :task/touch-working (:id task)) (m! new-state))
             (m! new-state))))
       {:done "Done",
        :pend (if (= mode :pending) "Do it now" "Do it later"),
        :touch "Up",
        :copy "Copy",
        :edit "Edit",
        :remove "Remove"}))
    (when (:show-editor? state)
      (comp-dialog
       (fn [m!] (m! (assoc state :show-editor? false)))
       (let [edit! (fn [e d! m!]
                     (d! :task/update-working {:id (:id task), :text (:draft state)})
                     (m! (assoc state :show-editor? false :draft "")))]
         (div
          {:style ui/column}
          (input
           {:style (merge ui/input {:width 320}),
            :value (:draft state),
            :autofocus true,
            :on-input (fn [e d! m!] (m! (assoc state :draft (:value e)))),
            :on-keydown (fn [e d! m!] (when (= 13 (.-keyCode (:event e))) (edit! e d! m!)))})
          (=< nil 8)
          (div
           {:style ui/row-parted}
           (span {})
           (button {:style ui/button, :inner-text "Edit", :on-click edit!}))))))
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
    {:style (merge ui/flex {:padding 16, :overflow :auto})}
    (div
     {:style ui/row-parted}
     (comp-title
      "Doing"
      (cursor->
       :creater
       comp-prompt
       states
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
            (map-val (fn [task] (cursor-> (:id task) comp-task states task :working))))))
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
             (map-val (fn [task] (cursor-> (:id task) comp-task states task :pending))))))))))
