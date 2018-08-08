
(ns app.comp.overview
  (:require [hsl.core :refer [hsl]]
            [app.schema :as schema]
            [respo-ui.core :as ui]
            [respo.macros :refer [defcomp list-> <> span div button]]
            [respo.comp.space :refer [=<]]
            [app.config :as config]))

(defcomp comp-overview (states today) (div {} (<> today)))
