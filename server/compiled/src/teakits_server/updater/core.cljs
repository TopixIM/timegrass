
(ns teakits-server.updater.core
  (:require [teakits-server.updater.state :as state]
            [teakits-server.updater.user :as user]))

(defn no-op-updater [db op-data state-id op-id op-time] db)

(defn update-store [db op op-data state-id op-id op-time]
  (comment .log js/console "trying to update store")
  (let [hint "found no handler for:"
        update-method (case
                        op
                        :state/connect
                        state/connect
                        :state/disconnect
                        state/connect
                        :state/route
                        state/route
                        :state/buffer
                        state/buffer
                        :user/enter
                        user/enter
                        :user/rm-tag
                        user/rm-tag
                        :user/update
                        user/update-profile
                        :user/select-tag
                        user/select-tag
                        :user/logout
                        user/logout
                        (do (println hint op op-data) no-op-updater))]
    (update-method db op-data state-id op-id op-time)))
