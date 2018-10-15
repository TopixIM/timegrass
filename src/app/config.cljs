
(ns app.config (:require [app.util :refer [get-env!]]))

(def bundle-builds #{"release" "local-bundle"})

(def dev?
  (if (exists? js/window)
    (do ^boolean js/goog.DEBUG)
    (not (contains? bundle-builds (get-env! "mode")))))

(def site
  {:storage-key "timegrass",
   :port 11009,
   :title "Timegrass",
   :icon "http://cdn.tiye.me/logo/timegrass.png",
   :dev-ui "http://localhost:8100/main.css",
   :release-ui "http://cdn.tiye.me/favored-fonts/main.css",
   :cdn-url "http://cdn.tiye.me/timegrass/",
   :cdn-folder "tiye.me:cdn/timegrass",
   :upload-folder "tiye.me:repo/TopixIM/timegrass/",
   :server-folder "tiye.me:servers/timegrass",
   :theme "#51C766"})
