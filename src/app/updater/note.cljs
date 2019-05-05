
(ns app.updater.note (:require [app.schema :as schema]))

(defn add-note [db op-data sid op-id op-time]
  (let [session (get-in db [:sessions sid])
        user-id (:user-id session)
        new-note (merge schema/note {:id op-id, :time op-time, :text op-data})]
    (assoc-in db [:users user-id :notes op-id] new-note)))

(defn edit-note [db op-data sid op-id op-time]
  (let [session (get-in db [:sessions sid])
        user-id (:user-id session)
        note-id (:id op-data)
        text (:text op-data)]
    (update-in db [:users user-id :notes note-id] (fn [note] (assoc note :text text)))))

(defn remove-note [db op-data sid op-id op-time]
  (let [session (get-in db [:sessions sid]), user-id (:user-id session)]
    (update-in db [:users user-id :notes] (fn [notes] (dissoc notes op-data)))))
