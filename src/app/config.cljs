
(ns app.config (:require [cumulo-util.core :refer [get-env!]]))

(def cdn?
  (cond
    (exists? js/window) false
    (exists? js/process) (= "true" js/process.env.cdn)
    :else false))

(def dev?
  (let [debug? (do ^boolean js/goog.DEBUG)]
    (cond
      (exists? js/window) debug?
      (exists? js/process) (not= "true" js/process.env.release)
      :else true)))

(def site
  {:port 11009,
   :title "Timegrass",
   :icon "http://cdn.tiye.me/logo/timegrass.png",
   :dev-ui "http://localhost:8100/main.css",
   :release-ui "http://cdn.tiye.me/favored-fonts/main.css",
   :cdn-url "http://cdn.tiye.me/timegrass/",
   :cdn-folder "tiye.me:cdn/timegrass",
   :upload-folder "tiye.me:repo/TopixIM/timegrass/",
   :server-folder "tiye.me:servers/timegrass",
   :theme "#51C766",
   :storage-key "timegrass",
   :storage-file "storage.edn"})
