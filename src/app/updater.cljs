
(ns app.updater
  (:require [app.updater.session :as session]
            [app.updater.user :as user]
            [app.updater.router :as router]
            [app.updater.misc :as misc]
            [app.updater.task :as task]
            [app.updater.note :as note]
            [app.schema :as schema]
            [respo-message.updater :refer [update-messages]]))

(defn updater [db op op-data sid op-id op-time]
  (let [f (case op
            :today misc/set-today
            :session/connect session/connect
            :session/disconnect session/disconnect
            :session/remove-message session/remove-message
            :user/log-in user/log-in
            :user/sign-up user/sign-up
            :user/log-out user/log-out
            :router/change router/change
            :task/create-working task/create-working
            :task/remove-working task/remove-working
            :task/finish-working task/finish-working
            :task/update-working task/update-working
            :task/touch-working task/touch-working
            :task/put-back task/put-back
            :task/pend task/pend
            :note/add note/add-note
            :note/edit note/edit-note
            :note/remove note/remove-note
            (do (println "Unknown op:" op) identity))]
    (f db op-data sid op-id op-time)))
