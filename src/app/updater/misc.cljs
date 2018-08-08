
(ns app.updater.misc )

(defn set-today [db op-data sid op-id op-time] (assoc db :today op-data))
