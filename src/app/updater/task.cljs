
(ns app.updater.task (:require [app.schema :as schema]))

(defn create-working [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (assoc-in
     db
     [:users user-id :tasks :working op-id]
     (merge schema/task {:id op-id, :text op-data, :created-time op-time}))))

(defn remove-working [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (update-in db [:users user-id :tasks :working] (fn [tasks] (dissoc tasks op-data)))))
