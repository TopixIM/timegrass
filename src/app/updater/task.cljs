
(ns app.updater.task (:require [app.schema :as schema]))

(defn create-working [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (assoc-in
     db
     [:users user-id :tasks :working op-id]
     (merge schema/task {:id op-id, :text op-data, :created-time op-time}))))

(defn finish-working [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (update-in
     db
     [:users user-id :tasks]
     (fn [tasks]
       (let [task (get-in tasks [:working op-data])]
         (if (some? task)
           (-> tasks
               (update :working (fn [tasks] (dissoc tasks op-data)))
               (assoc-in [:finished op-data] (assoc task :finished-time op-time)))
           tasks))))))

(defn pend [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (update-in db [:users user-id :tasks :working op-data :pending?] not)))

(defn remove-working [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (update-in db [:users user-id :tasks :working] (fn [tasks] (dissoc tasks op-data)))))

(defn touch-working [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (update-in
     db
     [:users user-id :tasks :working op-data]
     (fn [task] (if (some? task) (assoc task :touched-time op-time) nil)))))

(defn update-working [db op-data sid op-id op-time]
  (let [user-id (get-in db [:sessions sid :user-id])]
    (update-in
     db
     [:users user-id :tasks :working (:id op-data)]
     (fn [task] (if (some? task) (assoc task :text (:text op-data)) nil)))))
