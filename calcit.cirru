
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --full` first. Manual edits must follow format and schema conventions, then run `calcit edit format`.") (:package |app)
  :entries $ {}
    :default $ {} (:description "||Browser client bundle") (:init-fn 'app.client/main!) (:mode :js) (:reload-fn 'app.client/reload!)
      :feature-policy $ {}
      :modules $ [] |recollect/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo-markdown.calcit/ |respo.calcit/ |js-ffi/
      :type-slots $ {}
    :server $ {} (:description "||Realtime server") (:init-fn 'app.server/main!) (:mode :native) (:reload-fn 'app.server/reload!)
      :feature-policy $ {}
      :modules $ [] |recollect/ |cumulo-util.calcit/ |cumulo-reel.calcit/ |calcit.std/ |calcit-wss/
      :type-slots $ {}
  :files $ {}
    |app.client $ %{} 'FileEntry
      :defs $ {}
        |*states $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *states $ {}
              :states $ {}
                :cursor $ []
          :examples $ []
          :schema $ :: 'Dynamic
        |*store $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *store $ :: :initial
          :examples $ []
          :schema $ :: 'Dynamic
        |connect! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn connect! () $ let
                url-obj $ unsafe-coerce (url-parse js/location.href true) 'JsObject
                query $ unsafe-coerce (.-query url-obj) 'JsObject
                host $ unsafe-coerce
                  if
                    js-present? $ .-host query
                    .-host query
                    unsafe-coerce js/location.hostname 'String
                  , 'String
                port $ unsafe-coerce
                  if
                    js-present? $ .-port query
                    .-port query
                    :port config/site
                  , 'String
              ws-connect!
                if config/dev? (str |ws:// host |: port) |wss://timegrass.topix.im/ws
                {}
                  :on-open $ fn (event) (simulate-login!)
                  :on-close $ fn (event)
                    reset! *store $ :: :offline
                    js/console.error "|Lost connection!"
                  :on-data on-server-data
          :examples $ []
          :schema $ :: 'Dynamic
        |dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn dispatch! (op)
              when
                and config/dev? $ not= (nth op 0) :states
                js/console.log |Dispatch op
              tag-match op
                (:states cursor s)
                  reset! *states $ update-states @*states cursor s
                (:effect/connect) (connect!)
                _ $ ws-send! op
          :examples $ []
          :schema $ :: 'Dynamic
        |main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () (.!extend dayjs week-of-year)
              println "|Running mode:" $ if config/dev? |dev |release
              if config/dev? $ load-console-formatter!
              render-app!
              connect!
              add-watch *store :changes $ fn (store prev) (render-app!)
              add-watch *states :changes $ fn (states prev) (render-app!)
              on-page-touch $ fn ()
                if
                  = @*store $ :: :offline
                  connect!
              visibility-heartbeat $ fn ()
                if (map? @*store)
                  ws-send! $ :: :effect/ping
              println "|App started!"
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ []
              :features $ #{} :js-ffi
        |mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def mount-target $ js/document.querySelector |.app
          :examples $ []
          :schema $ :: 'Dynamic
        |on-server-data $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn on-server-data (data)
              tag-match data
                (:patch changes)
                  do
                    when config/dev? $ js/console.log |Changes changes
                    reset! *store $ patch-twig @*store changes
                (:effect/pong) :ok
          :examples $ []
          :schema $ :: 'Dynamic
        |reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ if
              or $ some? client-errors
              hud! |error $ str client-errors
              do (hud! |inactive nil) (remove-watch *store :changes) (remove-watch *states :changes) (clear-cache!) (render-app!)
                add-watch *store :changes $ fn (store prev) (render-app!)
                add-watch *states :changes $ fn (states prev) (render-app!)
                println "|Code updated."
          :examples $ []
          :schema $ :: 'Dynamic
        |render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn render-app! () $ render! mount-target
              comp-container (&map:get @*states :states) @*store
              , dispatch!
          :examples $ []
          :schema $ :: 'Dynamic
        |simulate-login! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn simulate-login! () $ let
                raw $ js/localStorage.getItem (:storage-key config/site)
              if (js-present? raw)
                do (println "|Found storage.")
                  dispatch! $ :: :user/log-in
                    parse-cirru-edn $ unsafe-coerce raw 'String
                do $ println "|Found no storage."
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.client $ :require
            respo.core :refer $ render! clear-cache! realize-ssr!
            respo.cursor :refer $ update-states
            app.comp.container :refer $ comp-container
            app.schema :as schema
            app.config :as config
            ws-edn.client :refer $ ws-connect! ws-send!
            recollect.patch :refer $ patch-twig
            cumulo-util.core :refer $ on-page-touch visibility-heartbeat
            |url-parse :default url-parse
            |bottom-tip :default hud!
            |./calcit.build-errors :default client-errors
            |dayjs :default dayjs
            |dayjs/plugin/weekOfYear :default week-of-year
    |app.comp.container $ %{} 'FileEntry
      :defs $ {}
        |comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn comp-container (states store)
              case-default store
                let
                    state $ &map:get states :data
                    session $ &map:get store :session
                    router $ if
                      map? $ &map:get store :router
                      &map:get store :router
                      &map:get session :router
                    router-data $ &map:get router :data
                  div
                    {} $ :class-name css-container
                    comp-navigation (&map:get store :logged-in?) (&map:get store :count) (&map:get router :name)
                    if (&map:get store :logged-in?)
                      case-default (&map:get router :name)
                        <> $ str "|404 page:" router
                        :home $ comp-overview (>> states :overview) (&map:get store :today)
                          get-in router $ [] :data :tasks
                        :history $ comp-history (>> states :history)
                          get-in router $ [] :data :week
                          get-in router $ [] :data :tasks
                        :notes $ comp-notes-page (>> states :notes) (&map:get router :data)
                          get-in session $ [] :router :data
                        :profile $ comp-profile (&map:get store :user) (&map:get router :data)
                      comp-login $ >> states :login
                    comp-status-color $ &map:get store :color
                    when dev? $ comp-inspect |Store store
                      {} (:bottom 0) (:left 0) (:z-index 9999)
                    comp-messages (&map:get session :messages) ({})
                      fn (info d!) (d! :session/remove-message info)
                    when dev? $ comp-reel (&map:get store :reel-length) ({})
                (:: :initial) (comp-offline :initial)
                (:: :offline) (comp-offline :offline)
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-offline $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-offline (state)
              div
                {} $ :class-name css-offline
                div $ {}
                  :style $ {} (:height 0)
                div $ {}
                  :style $ {}
                    :background-image $ str "|url(" (:icon config/site) "|)"
                    :width 128
                    :height 128
                    :background-size :contain
                span
                  {}
                    :style $ {} (:cursor :pointer)
                    :on-click $ fn (e d!) (d! :effect/connect nil)
                  <>
                    if (= :initial state) |Loading... "|Socket broken! Click to retry."
                    {} (:font-family ui/font-fancy) (:font-weight 100) (:font-size 24)
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-status-color (color)
              div $ {} (:class-name css-status-color)
                :style $ {} (:background-color color)
          :examples $ []
          :schema $ :: 'Dynamic
        |css-container $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-container $ {}
              |$0 $ merge ui/global ui/fullscreen ui/column
          :examples $ []
          :schema $ :: 'Dynamic
        |css-offline $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-offline $ {}
              |$0 $ merge ui/global ui/fullscreen ui/column-dispersive
                {} $ :background-color (:theme config/site)
          :examples $ []
          :schema $ :: 'Dynamic
        |css-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-status-color $ {}
              |$0 $ {} (:width 16) (:height 16) (:position :absolute) (:bottom 16) (:right 8) (:border-radius |8px) (:opacity 0.8) (:transition-duration |200ms) (:opacity 0.5)
              |$0:hover $ {} (:opacity 0.7)
          :examples $ []
          :schema $ :: 'Dynamic
        |style-body $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def style-body $ {} (:padding "|8px 16px")
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.comp.container $ :require
            hsl.core :refer $ hsl
            respo-ui.core :as ui
            respo-ui.css :as css
            respo.css :refer $ defstyle
            respo.core :refer $ defcomp <> >> div span button
            respo.comp.inspect :refer $ comp-inspect
            respo.comp.space :refer $ =<
            app.comp.navigation :refer $ comp-navigation
            app.comp.profile :refer $ comp-profile
            app.comp.login :refer $ comp-login
            respo-message.comp.messages :refer $ comp-messages
            cumulo-reel.comp.reel :refer $ comp-reel
            app.config :refer $ dev?
            app.schema :as schema
            app.comp.overview :refer $ comp-overview
            app.config :as config
            app.comp.history :refer $ comp-history
            app.comp.notes-page :refer $ comp-notes-page
    |app.comp.history $ %{} 'FileEntry
      :defs $ {}
        |comp-done-task $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-done-task (states task)
              let
                  cursor $ &map:get states :cursor
                  state $ or (&map:get states :data)
                    {} $ :show-menu? false
                  finished-day $ unsafe-coerce
                    dayjs $ &map:get task :finished-time
                    , 'JsObject
                div
                  {} (:class-name css-done-task)
                    :style $ merge
                      {} $ :padding "|4px 8px"
                      if (&map:get state :show-menu?)
                        {} $ :background-color (hsl 0 0 94)
                        {}
                    :on-click $ fn (e d!)
                      d! cursor $ assoc state :show-menu? true
                  <>
                    unsafe-coerce (.!format finished-day |HH:mm) 'String
                    {} (:min-width 32)
                      :color $ hsl 0 0 80
                      :font-size 12
                      :display :inline-block
                  =< 4 nil
                  span
                    {} $ :style
                      merge ui/flex $ {} (:line-height |24px)
                    <> $ &map:get task :text
                  comp-modal-menu
                    {} (:title |Operations)
                      :style $ {} (:width 320)
                      :items $ [] (:: :item :put-back "|Put back")
                    &map:get state :show-menu?
                    fn (d!)
                      d! cursor $ assoc state :show-menu? false
                    fn (item d!)
                      d! cursor $ assoc state :show-menu? false
                      when
                        = :put-back $ option:unwrap-or (nth item 1) nil
                        d! :task/put-back $ &map:get task :id
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-history $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-history (states data finished-tasks)
              let
                  year $ &map:get data :year
                  week $ &map:get data :week
                div
                  {} (:class-name css/flex)
                    :style $ {} (:padding "|16px 16px") (:overflow :auto)
                  div
                    {} $ :style
                      {} (:max-width 800) (:margin :auto)
                    div
                      {} (:class-name css/row-parted)
                        :style $ {} (:margin "|8px 0")
                      <> (str "|Histories of " week "|th week in " year)
                        {} (:font-family ui/font-fancy) (:font-size 16)
                          :color $ hsl 0 0 50
                      div
                        {} $ :class-name css/row
                        comp-icon :arrow-left
                          {} (:font-size 16)
                            :color $ hsl 200 80 80
                            :cursor :pointer
                          fn (e d!)
                            d! :router/change $ {} (:name :history)
                              :data $ let
                                  change-year? $ <= week 1
                                  y $ if change-year? (dec year) year
                                  w $ if change-year? 53 (dec week)
                                  base-day $ unsafe-coerce (dayjs) 'JsObject
                                  year-day $ unsafe-coerce (.!year base-day y) 'JsObject
                                  d $ unsafe-coerce (.!week year-day w) 'JsObject
                                  start-day $ unsafe-coerce (.!startOf d |week) 'JsObject
                                  end-day $ unsafe-coerce (.!endOf d |week) 'JsObject
                                {} (:year y) (:week w)
                                  :start $ unsafe-coerce (.!format start-day |week) 'String
                                  :end $ unsafe-coerce (.!format end-day |week) 'String
                        =< 8 nil
                        comp-icon :arrow-right
                          {} (:font-size 16)
                            :color $ hsl 200 80 80
                            :cursor :pointer
                          fn (e d!)
                            d! :router/change $ {} (:name :history)
                              :data $ let
                                  change-year? $ >= week 53
                                  y $ if change-year? (inc year) year
                                  w $ if change-year? 1 (inc week)
                                  base-day $ unsafe-coerce (dayjs) 'JsObject
                                  year-day $ unsafe-coerce (.!year base-day y) 'JsObject
                                  d $ unsafe-coerce (.!week year-day w) 'JsObject
                                  start-day $ unsafe-coerce (.!startOf d |week) 'JsObject
                                  end-day $ unsafe-coerce (.!endOf d |week) 'JsObject
                                {} (:year y) (:week w)
                                  :start $ unsafe-coerce (.!format start-day |week) 'String
                                  :end $ unsafe-coerce (.!format end-day |week) 'String
                    if (empty? finished-tasks)
                      div
                        {} (:class-name css/center)
                          :style $ {} (:height 80)
                        <> "|No tasks." $ {} (:font-family ui/font-fancy)
                          :color $ hsl 0 0 80
                      let
                          grouped-tasks $ -> finished-tasks (.to-list) (.map last)
                            group-by $ fn (task)
                              unsafe-coerce
                                .!format
                                  unsafe-coerce
                                    dayjs $ &map:get task :finished-time
                                    , 'JsObject
                                  , |YYYY-MM-DD
                                , 'String
                        list-> ({})
                          -> grouped-tasks (.to-list)
                            .sort $ fn (x y)
                              &compare
                                option:unwrap-or (first y) |
                                option:unwrap-or (first x) |
                            .map-pair $ fn (date-string task-list)
                              [] date-string $ div
                                {} (:class-name css/column)
                                  :style $ {} (:margin-top 16)
                                let
                                    the-day $ unsafe-coerce (dayjs date-string) 'JsObject
                                  div
                                    {} $ :class-name css/row-parted
                                    span
                                      {} $ :class-name css/font-fancy
                                      <> $ unsafe-coerce (.!format the-day |ddd) 'String
                                      =< 12 nil
                                      <> $ unsafe-coerce (.!format the-day |MM-DD) 'String
                                =< nil 4
                                list-> ({})
                                  -> task-list
                                    .sort-by $ fn (task)
                                      negate $ &map:get task :finished-time
                                    .map $ fn (task)
                                      [] (&map:get task :id)
                                        comp-done-task
                                          >> states $ &map:get task :id
                                          , task
          :examples $ []
          :schema $ :: 'Dynamic
        |css-done-task $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-done-task $ {}
              |$0 $ {} (:transition-duration |200ms)
              |$0:hover $ {}
                :background-color $ hsl 0 0 80 0.2
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.comp.history $ :require
            respo-ui.core :refer $ hsl
            respo-ui.core :as ui
            respo-ui.css :as css
            respo.css :refer $ defstyle
            respo.comp.space :refer $ =<
            respo.core :refer $ defcomp <> >> list-> span div
            app.config :as config
            respo-alerts.core :refer $ comp-modal-menu
            |dayjs :default dayjs
            feather.core :refer $ comp-icon
    |app.comp.login $ %{} 'FileEntry
      :defs $ {}
        |comp-login $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-login (states)
              let
                  cursor $ &map:get states :cursor
                  state $ or (&map:get states :data) initial-state
                div
                  {} $ :style (merge ui/flex ui/center)
                  div ({})
                    div
                      {} $ :style ({})
                      div ({})
                        input $ {} (:placeholder |Username)
                          :value $ &map:get state :username
                          :style ui/input
                          :on-input $ fn (e d!)
                            d! cursor $ assoc state :username
                              str $ &map:get e :value
                      =< nil 8
                      div ({})
                        input $ {} (:placeholder |Password)
                          :value $ &map:get state :password
                          :style ui/input
                          :on-input $ fn (e d!)
                            d! cursor $ assoc state :password
                              str $ &map:get e :value
                    =< nil 8
                    div
                      {} $ :style
                        {} $ :text-align :right
                      span $ {} (:inner-text "|Sign up")
                        :style $ merge style/link
                        :on-click $ on-submit (&map:get state :username) (&map:get state :password) true
                      =< 8 nil
                      span $ {} (:inner-text "|Log in")
                        :style $ merge style/link
                        :on-click $ on-submit (&map:get state :username) (&map:get state :password) false
          :examples $ []
          :schema $ :: 'Dynamic
        |initial-state $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def initial-state $ {} (:username |) (:password |)
          :examples $ []
          :schema $ :: 'Dynamic
        |on-submit $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn on-submit (username password signup?)
              fn (e dispatch!)
                dispatch! (if signup? :user/sign-up :user/log-in) ([] username password)
                js/localStorage.setItem (:storage-key config/site)
                  format-cirru-edn $ [] username password
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.comp.login $ :require
            [] respo.core :refer $ [] defcomp <> div input button span
            [] respo.comp.space :refer $ [] =<
            [] respo.comp.inspect :refer $ [] comp-inspect
            [] respo-ui.core :as ui
            [] app.schema :as schema
            [] app.style :as style
            [] app.config :as config
    |app.comp.navigation $ %{} 'FileEntry
      :defs $ {}
        |comp-navigation $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-navigation (logged-in? count-members page)
              div
                {} $ :class-name css-navbar
                div
                  {} (:class-name css/row-parted)
                    :style $ {} (:max-width 840) (:width |100%) (:margin :auto)
                  div
                    {} $ :class-name css/row-center
                    render-entry |Timegrass
                      fn () $ {} (:name :home)
                      = page :home
                    =< 16 nil
                    render-entry |Finished
                      fn () $ {} (:name :history)
                        :data $ let
                            now $ unsafe-coerce (dayjs) 'JsObject
                            month $ .!month now
                            week-date $ unsafe-coerce now 'JsObject
                            start-day $ unsafe-coerce (.!startOf week-date |week) 'JsObject
                            end-day $ unsafe-coerce (.!endOf week-date |week) 'JsObject
                          {}
                            :year $ .!year now
                            :week $ .!week week-date
                            :start $ unsafe-coerce (.!format start-day |week) 'String
                            :end $ unsafe-coerce (.!format end-day |week) 'String
                      = page :history
                    =< 16 nil
                    render-entry |Notes
                      fn () $ {} (:name :notes)
                        :data $ let
                            now $ unsafe-coerce (dayjs) 'JsObject
                          {}
                            :year $ .!year now
                            :month $ .!month now
                      = page :notes
                  div
                    {}
                      :style $ {} (:cursor |pointer) (:user-select :none)
                      :tab-index 0
                      :on-click $ fn (e d!)
                        d! :router/change $ {} (:name :profile)
                    <> $ if logged-in? |Me |Guest
                    =< 8 nil
                    <> count-members
          :examples $ []
          :schema $ :: 'Dynamic
        |css-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-entry $ {}
              |$0 $ {} (:opacity 0.6) (:user-select :none) (:transition-duration |200ms)
              |$0:hover $ {} (:opacity 0.8)
          :examples $ []
          :schema $ :: 'Dynamic
        |css-navbar $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-navbar $ {}
              |$0 $ merge ui/row-center
                {} (:height 48) (:padding "|0 16px") (:font-size 16)
                  :border-bottom $ str "|1px solid " (hsl 0 0 0 0.1)
                  :font-family ui/font-fancy
                  :background-color $ :theme config/site
                  :color :white
          :examples $ []
          :schema $ :: 'Dynamic
        |render-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn render-entry (title get-route highlighted?)
              div
                {} (:class-name css-entry)
                  :style $ merge
                    {} $ :cursor :pointer
                    if highlighted? $ {} (:opacity 1)
                  :on-click $ fn (e d!)
                    d! :router/change $ get-route
                  :tab-index 0
                <> title nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.comp.navigation $ :require
            respo-ui.core :refer $ hsl
            respo-ui.core :as ui
            respo.css :refer $ defstyle
            respo-ui.css :as css
            respo.comp.space :refer $ =<
            respo.core :refer $ defcomp <> >> span div
            app.config :as config
            respo-alerts.core :refer $ comp-prompt
            |dayjs :default dayjs
    |app.comp.notes-page $ %{} 'FileEntry
      :defs $ {}
        |comp-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-note (states note)
              let
                  edit-plugin $ use-prompt (>> states :edit)
                    {} (:text "|Update note:") (:multiline? true)
                      :initial $ &map:get note :text
                  remove-plugin $ use-confirm (>> states :remove)
                    {} $ :text "|Sure to delete note?"
                  note-day $ unsafe-coerce
                    dayjs $ &map:get note :time
                    , 'JsObject
                div
                  {}
                    :class-name $ str-spaced css/column css-note
                    :style $ {}
                      :border-top $ str "|1px solid " (hsl 0 0 94)
                      :padding "|4px 8px"
                  div
                    {} $ :class-name css/row-parted
                    <>
                      unsafe-coerce (.!format note-day |HH:mm) 'String
                      {} (:font-family ui/font-fancy)
                        :color $ hsl 0 0 70
                        :font-size 12
                    =< 8 nil
                    div
                      {} $ :class-name css/row-middle
                      comp-icon :edit
                        &{} :font-size 16 :curspr :pointer :color $ hsl 200 80 80
                        fn (e d!)
                          .show edit-plugin d! $ fn (result)
                            d! :note/edit $ {}
                              :id $ &map:get note :id
                              :text result
                      =< 8 nil
                      comp-icon :delete
                        &{} :font-size 16 :cursor :pointer :color $ hsl 10 80 60
                        fn (e d!)
                          .show remove-plugin d! $ fn ()
                            d! :note/remove $ &map:get note :id
                  <> $ &map:get note :text
                  .render edit-plugin
                  .render remove-plugin
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-notes-page $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-notes-page (states notes info)
              let
                  year $ &map:get info :year
                  month $ &map:get info :month
                  add-plugin $ use-prompt (>> states :add)
                    {} (:text "|Add note about today's work:") (:multiline? true)
                div
                  {} (:class-name css/expand)
                    :style $ {} (:padding 16)
                  div
                    {} $ :style
                      {} (:max-width 800) (:margin :auto)
                    div
                      {} (:class-name css/row-parted)
                        :style $ {} (:margin "|8px 0")
                      span
                        {} $ :class-name css/row-middle
                        <> |Notes $ {}
                          :color $ hsl 0 0 50
                          :font-family ui/font-fancy
                          :font-size 16
                        =< 16 nil
                        comp-icon :plus
                          &{} :font-size 16 :color (hsl 200 80 80) :cursor :pointer
                          fn (e d!)
                            .show add-plugin d! $ fn (result) (d! :note/add result)
                      div
                        {} $ :class-name css/row-middle
                        comp-icon :arrow-left
                          {} (:font-size 16)
                            :color $ hsl 200 80 80
                            :cursor :pointer
                          fn (e d!)
                            d! :router/change $ {} (:name :notes)
                              :data $ if (<= month 0)
                                {}
                                  :year $ dec year
                                  :month 11
                                {} (:year year)
                                  :month $ dec month
                        =< 8 nil
                        comp-icon :arrow-right
                          {} (:font-size 16)
                            :color $ hsl 200 80 80
                            :cursor :pointer
                          fn (e d!)
                            d! :router/change $ {} (:name :notes)
                              :data $ if (>= month 11)
                                {}
                                  :year $ inc year
                                  :month 0
                                {} (:year year)
                                  :month $ inc month
                        =< 8 nil
                        <>
                          str (inc month) "|th month of " year |.
                          {} (:font-family ui/font-fancy)
                            :color $ hsl 0 0 50
                    if (empty? notes)
                      div
                        {} (:class-name css/center)
                          :style $ {} (:min-height 120)
                        <> "|No notes" $ {} (:font-family ui/font-fancy)
                          :color $ hsl 0 0 80
                      let
                          grouped-notes $ -> notes (.to-list)
                            .group-by $ fn (pair)
                              let
                                  pair-value $ unsafe-coerce (nth pair 1) 'Dynamic
                                  note-time $ &map:get pair-value :time
                                unsafe-coerce
                                  .!format
                                    unsafe-coerce (dayjs note-time) 'JsObject
                                    , |MM-DD
                                  , 'String
                            .to-list
                            .sort $ fn (x y)
                              &compare
                                option:unwrap-or (first y) |
                                option:unwrap-or (first x) |
                        list-> ({})
                          -> grouped-notes (.to-list)
                            .map-pair $ fn (date notes-in-day)
                              [] date $ div
                                {} $ :style
                                  {} $ :margin-top 16
                                div
                                  {} (:class-name css/font-fancy)
                                    :style $ {} (:font-size 14) (:font-weight 500)
                                  <> $ unsafe-coerce
                                    .!format
                                      unsafe-coerce
                                        dayjs $ str year |- date
                                        , 'JsObject
                                      , |ddd
                                    , 'String
                                  =< 12 nil
                                  <> $ str date
                                list->
                                  {} $ :class-name css/column
                                  -> notes-in-day
                                    .sort-by $ fn (pair)
                                      let
                                          note-value $ unsafe-coerce (nth pair 1) 'Dynamic
                                        negate $ &map:get note-value :time
                                    .map-pair $ fn (k note)
                                      [] k $ comp-note (>> states k) note
                    =< nil 160
                  .render add-plugin
          :examples $ []
          :schema $ :: 'Dynamic
        |css-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-note $ {}
              |$0 $ {} (:transition-duration |200ms)
              |$0:hover $ {}
                :background-color $ hsl 0 0 80 0.2
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.comp.notes-page $ :require
            respo-ui.core :refer $ hsl
            respo.css :refer $ defstyle
            respo-ui.css :as css
            app.schema :as schema
            respo-ui.core :as ui
            respo.core :refer $ defcomp list-> >> <> span div button a
            respo.comp.space :refer $ =<
            app.config :as config
            respo-alerts.core :refer $ use-prompt use-confirm
            feather.core :refer $ comp-i comp-icon
            |dayjs :default dayjs
    |app.comp.overview $ %{} 'FileEntry
      :defs $ {}
        |comp-global-keydown $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-global-keydown (options on-event)
              span $ {}
                :on-keydown $ fn (e d!) (on-event e d!)
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-no-tasks $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-no-tasks () $ div
              {}
                :class-name $ str-spaced css/center css/font-fancy
                :style $ {}
                  :color $ hsl 0 0 80
              <> "|No tasks"
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-overview $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-overview (states today tasks)
              let
                  working-tasks $ -> tasks (.to-map)
                    filter $ fn (pair)
                      not $ &map:get (last pair) :pending?
                  pending-tasks $ -> tasks (.to-map)
                    filter $ fn (pair)
                      &map:get (last pair) :pending?
                  create-plugin $ use-prompt (>> states :create)
                    {} $ :text "|Create new task:"
                  cursor $ &map:get states :cursor
                  state $ or (&map:get states :data)
                    {} $ :show-later? false
                  today-day $ unsafe-coerce (dayjs today) 'JsObject
                div
                  {} (:class-name css/expand)
                    :style $ {} (:padding 16)
                  div
                    {} $ :style
                      {} (:max-width 800) (:margin :auto)
                    div
                      {} $ :class-name css/row-parted
                      comp-title |Doing $ comp-icon :plus
                        &{} :font-size 14 :color (hsl 200 80 80) :cursor :pointer
                        fn (e d!)
                          .show create-plugin d! $ fn (result) (d! :task/create-working result)
                      comp-global-keydown ({})
                        fn (e d!)
                          if
                            and (&map:get e :meta?)
                              = |i $ &map:get e :key
                            .show create-plugin d! $ fn (result) (d! :task/create-working result)
                      div
                        {}
                          :class-name $ str-spaced css/row-middle css/font-fancy
                          :style $ {}
                            :color $ hsl 0 0 60
                        <> $ unsafe-coerce (.!format today-day |ddd) 'String
                        =< 8 nil
                        <> $ str (.!week today-day) "|th week"
                        =< 16 nil
                        <> today
                    if (empty? working-tasks) (comp-no-tasks)
                      list-> ({})
                        -> working-tasks (.to-list)
                          .sort-by $ fn (pair)
                            let
                                task $ last pair
                              negate $ or (&map:get task :touched-time) (&map:get task :created-time)
                          .map-pair $ fn (k task)
                            [] k $ comp-task
                              >> states $ &map:get task :id
                              , task :working
                    when
                      not $ empty? pending-tasks
                      div ({})
                        comp-title |Later nil $ fn (e d!)
                          d! cursor $ update state :show-later? not
                        if (&map:get state :show-later?)
                          list-> ({})
                            -> pending-tasks (.to-list)
                              .sort-by $ fn (pair)
                                let
                                    task $ last pair
                                  negate $ or (&map:get task :touched-time) (&map:get task :created-time)
                              .map-pair $ fn (k task)
                                [] k $ comp-task
                                  >> states $ &map:get task :id
                                  , task :pending
                          div
                            {}
                              :style $ {} (:font-size 16)
                              :on-click $ fn (e d!)
                                d! cursor $ update state :show-later? not
                            <>
                              str (count pending-tasks) "| future tasks. Click to show."
                              {} (:font-family ui/font-fancy) (:font-weight 300) (:cursor :pointer)
                    .render create-plugin
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-task $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-task (states task mode)
              let
                  cursor $ &map:get states :cursor
                  state $ or (&map:get states :data)
                    {} $ :menu? false
                  update-plugin $ use-prompt (>> states :drafter)
                    {} (:text "|Task content:")
                      :initial $ &map:get task :text
                      :placeholder |task...
                      :button-text |Edit
                  delete-plugin $ use-confirm (>> states :delete)
                    {} $ :text "|Sure to remove task:"
                div
                  {} (:class-name css-task-base)
                    :style $ merge
                      if (&map:get state :menu?)
                        {} $ :background-color (hsl 0 0 94)
                        {}
                    :on-click $ fn (e d!)
                      d! cursor $ assoc state :menu? true
                    :on $ {}
                      :dragend $ fn (e d!)
                        d! :task/touch-working $ &map:get task :id
                    :draggable true
                  div
                    {} $ :style ui/flex
                    <> (&map:get task :text) ({})
                  comp-modal-menu
                    {} (:title |Operations)
                      :style $ {} (:width 320)
                      :items $ [] (:: :item :done |Done)
                        :: :item :pend $ if (= mode :pending) "|Do it now" "|Do it later"
                        :: :item :touch |Up
                        :: :item :copy |Copy
                        :: :item :edit |Edit
                        :: :item :remove |Remove
                    &map:get state :menu?
                    fn (d!)
                      d! cursor $ assoc state :menu? false
                    fn (item d!)
                      let
                          new-state $ assoc state :menu? false
                          result $ nth item 1
                        js/console.log item
                        case-default result (d! cursor new-state)
                          :done $ do
                            d! :task/finish-working $ &map:get task :id
                            d! cursor new-state
                          :edit $ do (d! cursor new-state)
                            .show update-plugin d! $ fn (text)
                              d! :task/update-working $ {}
                                :id $ &map:get task :id
                                :text text
                          :copy $ do
                            copy! $ &map:get task :text
                            d! cursor new-state
                          :remove $ do (d! cursor new-state)
                            .show delete-plugin d! $ fn ()
                            d! :task/remove-working $ &map:get task :id
                          :pend $ do
                            d! :task/pend $ &map:get task :id
                            d! cursor new-state
                          :touch $ do
                            d! :task/touch-working $ &map:get task :id
                            d! cursor new-state
                  .render update-plugin
                  .render delete-plugin
          :examples $ []
          :schema $ :: 'Dynamic
        |comp-title $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-title (title child ? on-click)
              div
                {} (:class-name css-title)
                  :style $ if (fn? on-click)
                    {} $ :cursor :pointer
                  :on-click $ fn (e d!)
                    if (fn? on-click) (on-click e d!)
                <> title
                =< 16 nil
                , child
          :examples $ []
          :schema $ :: 'Dynamic
        |css-task-base $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-task-base $ {}
              |$0 $ {}
                :border-bottom $ str "|1px solid " (hsl 0 0 90)
                :line-height |24px
                :padding "|8px 8px"
                :overflow :auto
                :user-select :none
                :transition-duration |200ms
              |$0:hover $ {}
                :background-color $ hsl 0 0 80 0.1
          :examples $ []
          :schema $ :: 'Dynamic
        |css-title $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-title $ {}
              |$0 $ merge ui/row-middle
                {} (:margin "|8px 0") (:font-family ui/font-fancy)
                  :color $ hsl 0 0 50
                  :font-size 16
                  :font-weight 300
          :examples $ []
          :schema $ :: 'Dynamic
        |effect-focus $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defeffect effect-focus () (action el *local)
              case action
                :mount $ -> el (.!querySelector |input) (.!focus)
                do
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.comp.overview $ :require
            respo-ui.core :refer $ hsl
            respo-ui.css :as css
            respo.css :refer $ defstyle
            app.schema :as schema
            respo-ui.core :as ui
            respo.core :refer $ defcomp list-> >> <> span div button textarea input a defeffect
            respo.comp.space :refer $ =<
            app.config :as config
            app.style :as style
            respo-alerts.core :refer $ comp-prompt comp-modal comp-modal-menu use-prompt use-confirm
            feather.core :refer $ comp-i comp-icon
            |dayjs :default dayjs
            |copy-text-to-clipboard :default copy!
    |app.comp.profile $ %{} 'FileEntry
      :defs $ {}
        |comp-profile $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-profile (user members)
              div
                {} (:class-name css/flex)
                  :style $ {} (:padding 16)
                div
                  {} $ :style
                    {} (:max-width 800) (:margin :auto)
                  div
                    {} (:class-name css/font-fancy)
                      :style $ {} (:font-size 32) (:font-weight 100)
                    <> $ str "|Hello! " (&map:get user :name)
                  =< nil 16
                  div
                    {} $ :class-name css/row
                    <> |Members:
                    =< 8 nil
                    list->
                      {} $ :class-name css/row
                      -> members (.to-list)
                        .map-pair $ fn (k username)
                          [] k $ div
                            {} $ :class-name css-member-label
                            <> username
                  =< nil 48
                  div ({})
                    button
                      {} (:class-name css/button)
                        :on-click $ fn (e d!)
                          js/location.replace $ str js/location.origin |?time= (.now js/Date)
                      <> |Refresh
                    =< 16 nil
                    button
                      {} (:class-name css/button)
                        :style $ {} (:color :red) (:border-color :red)
                        :on-click $ fn (e d!) (d! :user/log-out nil)
                          js/localStorage.removeItem $ :storage-key config/site
                      <> "|Log out"
          :examples $ []
          :schema $ :: 'Dynamic
        |css-member-label $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-member-label $ {}
              |$0 $ {} (:padding "|0 8px")
                :border $ str "|1px solid " (hsl 0 0 80)
                :border-radius |16px
                :margin "|0 4px"
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.comp.profile $ :require
            respo-ui.core :refer $ hsl
            respo-ui.css :as css
            app.schema :as schema
            respo-ui.core :as ui
            respo.core :refer $ defcomp list-> <> span div button
            respo.css :refer $ defstyle
            respo.comp.space :refer $ =<
            app.config :as config
    |app.config $ %{} 'FileEntry
      :defs $ {}
        |dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def dev? $ = |dev
              option:unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ :: 'Dynamic
        |site $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def site $ {} (:port 11009) (:title |Timegrass) (:icon |http://cdn.tiye.me/logo/timegrass.png) (:dev-ui |http://localhost:8100/main.css) (:release-ui |http://cdn.tiye.me/favored-fonts/main.css) (:cdn-url |http://cdn.tiye.me/timegrass/) (:theme |#51C766) (:storage-key |timegrass) (:storage-file |storage.cirru)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns app.config)
    |app.schema $ %{} 'FileEntry
      :defs $ {}
        |complain $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def complain $ {} (:id nil) (:text |) (:time nil)
          :examples $ []
          :schema $ :: 'Dynamic
        |database $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def database $ {}
              :sessions $ do session ({})
              :users $ do user ({})
              :today |2018-08-07
          :examples $ []
          :schema $ :: 'Dynamic
        |note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def note $ {} (:id nil) (:time nil) (:updated-time nil) (:text nil)
          :examples $ []
          :schema $ :: 'Dynamic
        |notification $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def notification $ {} (:id nil) (:kind nil) (:text nil)
          :examples $ []
          :schema $ :: 'Dynamic
        |router $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def router $ {} (:name nil) (:title nil)
              :data $ {}
              :router nil
          :examples $ []
          :schema $ :: 'Dynamic
        |session $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def session $ {} (:user-id nil) (:id nil) (:nickname nil)
              :router $ {} (:name :home) (:data nil) (:router nil)
              :messages $ {}
          :examples $ []
          :schema $ :: 'Dynamic
        |task $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def task $ {} (:id nil) (:text |) (:detail |) (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
          :examples $ []
          :schema $ :: 'Dynamic
        |user $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def user $ {} (:name nil) (:id nil) (:nickname nil) (:avatar nil) (:password nil)
              :tasks $ {}
                :working $ do task ({})
                :pending $ {}
                :finished $ {}
              :notes $ do note ({})
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns app.schema)
    |app.server $ %{} 'FileEntry
      :defs $ {}
        |*client-caches $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *client-caches $ {}
          :examples $ []
          :schema $ :: 'Dynamic
        |*initial-db $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *initial-db $ if
              path-exists? $ w-log storage-file
              do (println "|Found local EDN data")
                merge schema/database $ parse-cirru-edn (read-file storage-file)
              do (println "|Found no data") schema/database
          :examples $ []
          :schema $ :: 'Dynamic
        |*reader-reel $ %{} 'CodeEntry (:doc |)
          :code $ quote (defatom *reader-reel @*reel)
          :examples $ []
          :schema $ :: 'Dynamic
        |*reel $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *reel $ merge reel-schema
              {} (:base @*initial-db) (:db @*initial-db)
          :examples $ []
          :schema $ :: 'Dynamic
        |dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn dispatch! (op sid)
              let
                  op-id $ generate-id!
                  op-time $ get-timestamp (get-time!)
                if config/dev? $ println |Dispatch! (str op) sid
                tag-match op
                  (:effect/persist) (persist-db!)
                  (:effect/ping)
                    wss-send! sid $ format-cirru-edn (:: :effect/pong)
                  _ $ reset! *reel (reel-reducer @*reel updater op sid op-id op-time config/dev?)
          :examples $ []
          :schema $ :: 'Dynamic
        |get-backup-path! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn get-backup-path! () $ let
                now $ extract-time (get-time!)
              join-path calcit-dirname |backups
                str $ :month now
                str (:day now) |-snapshot.cirru
          :examples $ []
          :schema $ :: 'Dynamic
        |main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! ()
              println "|Running mode:" $ if config/dev? |dev |release
              let
                  p? $ get-env |port
                  port $ if (some? p?) (parse-float p?) (:port config/site)
                run-server! port
                println $ str "|Server started on port:" port
              do (; "|init it before doing multi-threading") (identity @*reader-reel)
              set-interval 200 $ fn () (render-loop!)
              on-control-c on-exit!
              set-interval 600000 $ fn () (persist-db!)
              set-interval 60000 $ fn () (set-today!)
          :examples $ []
          :schema $ :: 'Dynamic
        |on-exit! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn on-exit! () (persist-db!) (; println "|exit code is...") (quit! 0)
          :examples $ []
          :schema $ :: 'Dynamic
        |persist-db! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn persist-db! () $ let
                file-content $ format-cirru-edn
                  assoc (:db @*reel) :sessions $ {}
                storage-path storage-file
                backup-path $ get-backup-path!
              check-write-file! storage-path file-content
              check-write-file! backup-path file-content
          :examples $ []
          :schema $ :: 'Dynamic
        |reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () (println "|Code updated..")
              if (not config/dev?) (raise "|reloading only happens in dev mode")
              clear-twig-caches!
              reset! *reel $ refresh-reel @*reel @*initial-db updater
              sync-clients! @*reader-reel
          :examples $ []
          :schema $ :: 'Dynamic
        |render-loop! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn render-loop! () $ when
              not $ identical? @*reader-reel @*reel
              reset! *reader-reel @*reel
              sync-clients! @*reader-reel
          :examples $ []
          :schema $ :: 'Dynamic
        |run-server! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn run-server! (port)
              wss-serve! (&{} :port port)
                fn (data)
                  tag-match data
                    (:connect sid)
                      do
                        dispatch! (:: :session/connect) sid
                        println "|New client."
                    (:message sid msg)
                      let
                          action $ parse-cirru-edn msg
                        dispatch! action sid
                    (:disconnect sid)
                      do (println "|Client closed!")
                        dispatch! (:: :session/disconnect) sid
                    _ $ println "|unknown data:" data
          :examples $ []
          :schema $ :: 'Dynamic
        |set-today! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn set-today! () $ let
                today $ wo-log
                  format-time (get-time!) |%Y-%m-%d
                old-today $ :today (:db @*reel)
              when (not= today old-today)
                dispatch! (:: :today today) |system
          :examples $ []
          :schema $ :: 'Dynamic
        |storage-file $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def storage-file $ if (empty? calcit-dirname)
              str calcit-dirname $ :storage-file config/site
              str calcit-dirname |/ $ :storage-file config/site
          :examples $ []
          :schema $ :: 'Dynamic
        |sync-clients! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn sync-clients! (reel)
              wss-each! $ fn (sid)
                let
                    db $ :db reel
                    records $ :records reel
                    session $ get-in db ([] :sessions sid)
                    old-store $ or (get @*client-caches sid) nil
                    new-store $ twig-container db session records
                    changes $ diff-twig old-store new-store
                      {} $ :key :id
                  ; when config/dev? $ println "|Changes for" sid |: changes (count records)
                  if
                    not= changes $ []
                    do
                      wss-send! sid $ format-cirru-edn (:: :patch changes)
                      swap! *client-caches assoc sid new-store
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.server $ :require (app.schema :as schema)
            app.updater :refer $ updater
            cumulo-reel.core :refer $ reel-reducer refresh-reel reel-schema
            app.config :as config
            app.twig.container :refer $ twig-container
            recollect.diff :refer $ diff-twig
            wss.core :refer $ wss-serve! wss-send! wss-each!
            recollect.twig :refer $ clear-twig-caches!
            app.$meta :refer $ calcit-dirname
            calcit.std.fs :refer $ path-exists? check-write-file!
            calcit.std.time :refer $ set-interval
            calcit.std.date :refer $ get-time! extract-time format-time get-timestamp
            calcit.std.path :refer $ join-path
    |app.style $ %{} 'FileEntry
      :defs $ {}
        |button $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def button $ merge ui/button
              {} $ :background-color :white
          :examples $ []
          :schema $ :: 'Dynamic
        |link $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def link $ {} (:text-decoration :underline) (:cursor :pointer)
              :color $ hsl 240 80 80
              :font-family ui/font-fancy
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.style $ :require
            [] respo-ui.core :refer $ [] hsl
            [] respo-ui.core :as ui
    |app.twig.container $ %{} 'FileEntry
      :defs $ {}
        |twig-container $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-container (db session records)
              let
                  logged-in? $ some? (:user-id session)
                  router $ :router session
                  base-data $ {} (:logged-in? logged-in?) (:session session) (:router router)
                    :reel-length $ count records
                  user $ get-in db
                    [] :users $ :user-id session
                merge base-data $ if logged-in?
                  {}
                    :user $ twig-user user
                    :router $ assoc router :data
                      case-default (:name router) ({})
                        :home $ {}
                          :tasks $ get-in user ([] :tasks :working)
                        :history $ {}
                          :week $ :data router
                          :tasks $ twig-tasks-by-week (:data router)
                            get-in user $ [] :tasks :finished
                        :notes $ twig-notes-by-month (:data router) (:notes user)
                        :profile $ twig-members (:sessions db) (:users db)
                    :count $ count (:sessions db)
                    :color $ rand-hex-color!
                    :today $ :today db
                  {}
          :examples $ []
          :schema $ :: 'Dynamic
        |twig-members $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-members (sessions users)
              -> sessions $ .map-kv
                fn (k session)
                  [] k $ get-in users
                    [] (:user-id session) :name
          :examples $ []
          :schema $ :: 'Dynamic
        |twig-notes-by-month $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-notes-by-month (data notes)
              let
                  year $ :year data
                  month $ inc (:month data)
                -> notes (.to-map)
                  .filter-kv $ fn (k task)
                    let
                        time $ extract-time
                          :: Date $ :time task
                      and
                        = year $ :year time
                        = month $ :month time
          :examples $ []
          :schema $ :: 'Dynamic
        |twig-tasks-by-week $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-tasks-by-week (data tasks)
              let
                  filter-year $ :year data
                  filter-week $ dec (:week data)
                  start-time $ parse-time (:start data) "|%Y-%m-%dT%H:%M:%S %z"
                  end-time $ parse-time (:end data) "|%Y-%m-%dT%H:%M:%S %z"
                ; println |start: $ format-time start-time "|%Y-%m-%dT%H:%M:%S %z"
                ; println "|end " $ format-time end-time "|%Y-%m-%dT%H:%M:%S %z"
                -> tasks (.to-map)
                  .filter-kv $ fn (k task)
                    let
                        t $ &map:get task :finished-time
                      and
                        &> t $ get-timestamp start-time
                        &< t $ get-timestamp end-time
          :examples $ []
          :schema $ :: 'Dynamic
        |week-millis $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def week-millis $ * 7 24 3600 1000
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.twig.container $ :require
            [] app.twig.user :refer $ [] twig-user
            calcit.std.rand :refer $ rand-hex-color!
            calcit.std.date :refer $ Date extract-time get-time! from-ywd from-ymd parse-time format-time get-timestamp
    |app.twig.user $ %{} 'FileEntry
      :defs $ {}
        |twig-user $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-user (user)
              -> user (dissoc :password) (dissoc :tasks)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.twig.user $ :require
            [] recollect.twig :refer $ [] deftwig
    |app.updater $ %{} 'FileEntry
      :defs $ {}
        |updater $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn updater (db op sid op-id op-time)
              tag-match op
                (:today op-data) (misc/set-today db op-data sid op-id op-time)
                (:session/connect) (session/connect db sid op-id op-time)
                (:session/disconnect) (session/disconnect db sid op-id op-time)
                (:session/remove-message op-data) (session/remove-message db op-data sid op-id op-time)
                (:user/log-in op-data) (user/log-in db op-data sid op-id op-time)
                (:user/sign-up op-data) (user/sign-up db op-data sid op-id op-time)
                (:user/log-out) (user/log-out db sid op-id op-time)
                (:router/change op-data) (router/change db op-data sid op-id op-time)
                (:task/create-working op-data) (task/create-working db op-data sid op-id op-time)
                (:task/remove-working op-data) (task/remove-working db op-data sid op-id op-time)
                (:task/finish-working op-data) (task/finish-working db op-data sid op-id op-time)
                (:task/update-working op-data) (task/update-working db op-data sid op-id op-time)
                (:task/touch-working op-data) (task/touch-working db op-data sid op-id op-time)
                (:task/put-back op-data) (task/put-back db op-data sid op-id op-time)
                (:task/pend op-data) (task/pend db op-data sid op-id op-time)
                (:note/add op-data) (note/add-note db op-data sid op-id op-time)
                (:note/edit op-data) (note/edit-note db op-data sid op-id op-time)
                (:note/remove op-data) (note/remove-note db op-data sid op-id op-time)
                _ $ do (eprintln "|Unknown op:" op) db
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater $ :require ([] app.updater.session :as session) ([] app.updater.user :as user) ([] app.updater.router :as router) ([] app.updater.misc :as misc) ([] app.updater.task :as task) ([] app.updater.note :as note) ([] app.schema :as schema)
            [] respo-message.updater :refer $ [] update-messages
    |app.updater.misc $ %{} 'FileEntry
      :defs $ {}
        |set-today $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn set-today (db op-data sid op-id op-time) (assoc db :today op-data)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns app.updater.misc)
    |app.updater.note $ %{} 'FileEntry
      :defs $ {}
        |add-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn add-note (db op-data sid op-id op-time)
              let
                  session $ get-in db ([] :sessions sid)
                  user-id $ :user-id session
                  new-note $ merge schema/note
                    {} (:id op-id) (:time op-time) (:text op-data)
                assoc-in db ([] :users user-id :notes op-id) new-note
          :examples $ []
          :schema $ :: 'Dynamic
        |edit-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn edit-note (db op-data sid op-id op-time)
              let
                  session $ get-in db ([] :sessions sid)
                  user-id $ :user-id session
                  note-id $ :id op-data
                  text $ :text op-data
                update-in db ([] :users user-id :notes note-id)
                  fn (note) (assoc note :text text)
          :examples $ []
          :schema $ :: 'Dynamic
        |remove-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn remove-note (db op-data sid op-id op-time)
              let
                  session $ get-in db ([] :sessions sid)
                  user-id $ :user-id session
                update-in db ([] :users user-id :notes)
                  fn (notes) (dissoc notes op-data)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater.note $ :require ([] app.schema :as schema)
    |app.updater.router $ %{} 'FileEntry
      :defs $ {}
        |change $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn change (db op-data sid op-id op-time)
              assoc-in db ([] :sessions sid :router) op-data
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns app.updater.router)
    |app.updater.session $ %{} 'FileEntry
      :defs $ {}
        |connect $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn connect (db sid op-id op-time)
              assoc-in db ([] :sessions sid)
                merge schema/session $ {} (:id sid)
          :examples $ []
          :schema $ :: 'Dynamic
        |disconnect $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn disconnect (db sid op-id op-time)
              update db :sessions $ fn (session) (dissoc session sid)
          :examples $ []
          :schema $ :: 'Dynamic
        |remove-message $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn remove-message (db op-data sid op-id op-time)
              update-in db ([] :sessions sid :messages)
                fn (messages)
                  dissoc messages $ :id op-data
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater.session $ :require ([] app.schema :as schema)
    |app.updater.task $ %{} 'FileEntry
      :defs $ {}
        |create-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn create-working (db op-data sid op-id op-time)
              let
                  user-id $ get-in db ([] :sessions sid :user-id)
                assoc-in db ([] :users user-id :tasks :working op-id)
                  merge schema/task $ {} (:id op-id) (:text op-data) (:created-time op-time)
          :examples $ []
          :schema $ :: 'Dynamic
        |finish-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn finish-working (db op-data sid op-id op-time)
              let
                  user-id $ get-in db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks)
                  fn (tasks)
                    let
                        task $ get-in tasks ([] :working op-data)
                      if (some? task)
                        -> tasks
                          update :working $ fn (tasks) (dissoc tasks op-data)
                          assoc-in ([] :finished op-data) (assoc task :finished-time op-time)
                        , tasks
          :examples $ []
          :schema $ :: 'Dynamic
        |pend $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn pend (db op-data sid op-id op-time)
              let
                  user-id $ get-in db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks :working op-data :pending?) not
          :examples $ []
          :schema $ :: 'Dynamic
        |put-back $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn put-back (db op-data sid op-id op-time)
              let
                  user-id $ get-in db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks)
                  fn (tasks)
                    let
                        task $ get-in tasks ([] :finished op-data)
                      if (some? task)
                        -> tasks
                          update :finished $ fn (tasks) (dissoc tasks op-data)
                          assoc-in ([] :working op-data) (assoc task :touched-time op-time)
                        , tasks
          :examples $ []
          :schema $ :: 'Dynamic
        |remove-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn remove-working (db op-data sid op-id op-time)
              let
                  user-id $ get-in db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks :working)
                  fn (tasks) (dissoc tasks op-data)
          :examples $ []
          :schema $ :: 'Dynamic
        |touch-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn touch-working (db op-data sid op-id op-time)
              let
                  user-id $ get-in db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks :working op-data)
                  fn (task)
                    if (some? task) (assoc task :touched-time op-time) nil
          :examples $ []
          :schema $ :: 'Dynamic
        |update-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn update-working (db op-data sid op-id op-time)
              let
                  user-id $ get-in db ([] :sessions sid :user-id)
                update-in db
                  [] :users user-id :tasks :working $ :id op-data
                  fn (task)
                    if (some? task)
                      assoc task :text $ :text op-data
                      , nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater.task $ :require ([] app.schema :as schema)
    |app.updater.user $ %{} 'FileEntry
      :defs $ {}
        |log-in $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn log-in (db op-data sid op-id op-time)
              let-sugar
                    [] username password
                    , op-data
                  maybe-user $ -> (:users db) (vals) (.to-list)
                    find $ fn (user)
                      and $ = username (:name user)
                update-in db ([] :sessions sid)
                  fn (session)
                    if (some? maybe-user)
                      if
                        = (md5 password) (:password maybe-user)
                        assoc session :user-id $ :id maybe-user
                        update session :messages $ fn (messages)
                          assoc messages op-id $ {} (:id op-id)
                            :text $ str "|Wrong password for " username
                      update session :messages $ fn (messages)
                        assoc messages op-id $ {} (:id op-id)
                          :text $ str "|No user named: " username
          :examples $ []
          :schema $ :: 'Dynamic
        |log-out $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn log-out (db sid op-id op-time)
              assoc-in db ([] :sessions sid :user-id) nil
          :examples $ []
          :schema $ :: 'Dynamic
        |sign-up $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn sign-up (db op-data sid op-id op-time)
              let-sugar
                    [] username password
                    , op-data
                  maybe-user $ find
                    vals $ :users db
                    fn (user)
                      = username $ :name user
                if (some? maybe-user)
                  update-in db ([] :sessions sid :messages)
                    fn (messages)
                      assoc messages op-id $ {} (:id op-id)
                        :text $ str "|Name is taken: " username
                  -> db
                    assoc-in ([] :sessions sid :user-id) op-id
                    assoc-in ([] :users op-id)
                      {} (:id op-id) (:name username) (:nickname username)
                        :password $ md5 password
                        :avatar nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater.user $ :require
            [] cumulo-util.core :refer $ [] find-first
            calcit.std.hash :refer $ md5
