
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
    'app.client $ %{} 'FileEntry
      :defs $ {}
        '*connected? $ %{} 'CodeEntry (:doc "|Whether the active ws-edn generation is open.")
          :code $ quote (defatom *connected? false)
          :examples $ []
          :schema $ :: 'Ref 'Bool
        '*states $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *states $ {}
              :states $ {}
                :cursor $ []
          :examples $ []
          :schema $ :: 'Dynamic
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *store $ :: :initial
          :examples $ []
          :schema $ :: 'Dynamic
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote (defatom *sync-revision 0)
          :examples $ []
          :schema $ :: 'Ref 'Number
        '*ws-client $ %{} 'CodeEntry (:doc "|Current nominal ws-edn client retained across browser recovery events.")
          :code $ quote
            defatom *ws-client $ %none
          :examples $ []
          :schema $ :: 'Ref (:: 'Option 'ws-edn.client/WsClient)
        'ClientPatchError $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defenum ClientPatchError (:revision-mismatch 'Number 'Number) (:invalid-patch 'recollect.patch/PatchError)
          :examples $ []
          :schema $ :: 'EnumDef
        'ConnectionRecoveryAction $ %{} 'CodeEntry (:doc "|Deterministic browser recovery choice.")
          :code $ quote
            defenum ConnectionRecoveryAction (:none) (:reconnect) (:connect)
          :examples $ []
          :schema $ :: 'EnumDef
        'ack-sync! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn ack-sync! (revision)
              ws-send! $ %:: schema/ClientMessage :sync/ack revision
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number
        'apply-server-patch! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn apply-server-patch! (base-revision revision changes)
              match (validate-server-patch @*store @*sync-revision base-revision changes)
                (:ok next-store)
                  do (reset! *store next-store) (reset! *sync-revision revision) (ack-sync! revision)
                (:err error)
                  do
                    match error
                      (:revision-mismatch expected actual) (js/console.warn |Sync-revision-mismatch expected actual)
                      (:invalid-patch patch-error)
                        js/console.error |Failed-to-apply-server-patch $ patch-error-message patch-error
                    request-snapshot!
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number 'Number (:: 'List 'recollect.schema/change-op)
        'choose-recovery-action $ %{} 'CodeEntry (:doc "|Choose whether a visible online page should reconnect or create a client.")
          :code $ quote
            defn choose-recovery-action (connected? has-client? visible? online?)
              if (and visible? online?)
                if connected? (ConnectionRecoveryAction :none)
                  if has-client? (ConnectionRecoveryAction :reconnect) (ConnectionRecoveryAction :connect)
                ConnectionRecoveryAction :none
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'ConnectionRecoveryAction)
              :args $ [] 'Bool 'Bool 'Bool 'Bool
          :tests $ []
            %{} 'TestEntry (:name |selects-deterministic-browser-recovery)
              :code $ quote
                do
                  assert= (ConnectionRecoveryAction :none) (choose-recovery-action true true true true)
                  assert= (ConnectionRecoveryAction :none) (choose-recovery-action false true false true)
                  assert= (ConnectionRecoveryAction :none) (choose-recovery-action false true true false)
                  assert= (ConnectionRecoveryAction :reconnect) (choose-recovery-action false true true true)
                  assert= (ConnectionRecoveryAction :connect) (choose-recovery-action false false true true)
              :tags $ #{} :client
        'connect! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn connect! () $ let
                url-obj $ unsafe-coerce (url-parse js/location.href true) 'JsObject
                query $ unsafe-coerce (.-query url-obj) 'JsObject
                host-value $ .-host query
                port-value $ .-port query
                host $ if (js-present? host-value) (unsafe-coerce host-value 'String) (unsafe-coerce js/location.hostname 'String)
                port $ if (js-present? port-value) (unsafe-coerce port-value 'String)
                  str $ &map:get config/site :port
              reset! *store $ :: :loading
              reset! *ws-client $ %some
                ws-connect!
                  if config/dev? (str |ws:// host |: port) |wss://timegrass.topix.im/ws
                  {}
                    :on-open $ fn (event)
                      do (reset! *connected? true) (request-snapshot!) (send-activity!) (simulate-login!)
                    :on-close $ fn (event) (reset! *connected? false)
                      reset! *store $ :: :offline
                      js/console.error "|Lost connection!"
                    :on-data on-server-data
                    :heartbeat-timeout-ms 75000
                    :class-mapper $ {} (:ServerMessage schema/ServerMessage) (:change-op patch-schema/change-op)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn dispatch! (op ? op-data)
              when config/dev? $ if (tag? op)
                when (not= op :states) (js/console.log |Dispatch op op-data)
                match op
                  (:states ignored-cursor ignored-state) &unit
                  _ $ js/console.log |Dispatch op op-data
              if (tag? op)
                recur $ :: op op-data
                match op
                  (:states cursor s)
                    reset! *states $ update-states @*states cursor s
                  (:effect/connect) (connect!)
                  _ $ ws-send! (%:: schema/ClientMessage :dispatch op)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ [] 'app.schema/Op 'Dynamic
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () $ do (.!extend dayjs week-of-year)
              println "|Running mode:" $ if config/dev? |dev |release
              if config/dev? $ load-console-formatter!
              render-app!
              connect!
              add-watch *store :changes $ fn (store prev) (render-app!)
              add-watch *states :changes $ fn (states prev) (render-app!)
              on-page-touch $ fn ()
                if
                  = @*store $ :: :offline
                  recover-connection!
              js/window.addEventListener |visibilitychange $ fn (event)
                when @*connected? $ send-activity!
              visibility-heartbeat $ fn ()
                when @*connected? $ ws-send! (%:: schema/ClientMessage :sync/heartbeat @*sync-revision)
              println "|App started!"
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def mount-target $ js/document.querySelector |.app
          :examples $ []
          :schema $ :: 'Dynamic
        'on-server-data $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn on-server-data (data)
              match (schema/decode-server-message data)
                (:ok message)
                  match message
                    (:snapshot revision store)
                      do (reset! *store store) (reset! *sync-revision revision) (ack-sync! revision)
                    (:patch base-revision revision changes)
                      do
                        when config/dev? $ js/console.log |Changes changes
                        apply-server-patch! base-revision revision changes
                    (:effect/pong) &unit
                (:err error) (js/console.error "|Invalid server message:" error)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Dynamic
        'recover-connection! $ %{} 'CodeEntry (:doc "|Apply the typed browser recovery policy to the retained ws-edn client.")
          :code $ quote
            defn recover-connection! () $ let
                document-node $ unsafe-coerce js/document 'JsObject
                navigator-node $ unsafe-coerce js/navigator 'JsObject
                visible? $ = |visible
                  unsafe-coerce (.-visibilityState document-node) 'String
                online? $ unsafe-coerce (.-onLine navigator-node) 'Bool
                client-option @*ws-client
                has-client? $ match client-option
                  (:some client) true
                  (:none) false
                action $ choose-recovery-action @*connected? has-client? visible? online?
              match action
                (:none) &unit
                (:connect) (connect!)
                (:reconnect)
                  match client-option
                    (:some client)
                      do (assert-traits client WsClientOps) (client .reconnect)
                    (:none) &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ if (some? client-errors)
              hud! |error $ str client-errors
              do (hud! |inactive nil) (remove-watch *store :changes) (remove-watch *states :changes) (clear-cache!) (render-app!)
                add-watch *store :changes $ fn (store prev) (render-app!)
                add-watch *states :changes $ fn (states prev) (render-app!)
                ws-set-on-data! on-server-data
                println "|Code updated."
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn render-app! () $ render! mount-target
              comp-container (&map:get @*states :states) @*store
              , dispatch!
          :examples $ []
          :schema $ :: 'Dynamic
        'request-snapshot! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn request-snapshot! () $ ws-send! (%:: schema/ClientMessage :sync/resume @*sync-revision)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'send-activity! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn send-activity! () $ if (activity/page-visible?)
              ws-send! $ %:: schema/ClientMessage :sync/active @*sync-revision
              ws-send! $ %:: schema/ClientMessage :sync/idle @*sync-revision
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'simulate-login! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn simulate-login! () $ let
                raw $ js/localStorage.getItem (:storage-key config/site)
              if (js-present? raw)
                do (println "|Found storage.")
                  dispatch! $ :: :user/log-in
                    parse-cirru-edn $ unsafe-coerce raw 'String
                do $ println "|Found no storage."
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        'validate-server-patch $ %{} 'CodeEntry (:doc "|Apply one validated patch batch only when its base revision matches the local state.")
          :code $ quote
            defn validate-server-patch (store local-revision base-revision changes)
              if (= base-revision local-revision)
                match
                  .apply-to
                    assert-traits (patch-batch changes) PatchBatchOps
                    , store
                  (:ok next-store) (%ok next-store)
                  (:err error)
                    %err $ %:: ClientPatchError :invalid-patch error
                %err $ %:: ClientPatchError :revision-mismatch base-revision local-revision
          :examples $ []
          :schema $ :: 'Fn
            {}
              :args $ [] 'T 'Number 'Number (:: 'List 'recollect.schema/change-op)
              :generics $ [] 'T
              :return $ :: 'Result 'T 'app.client/ClientPatchError
          :tests $ []
            %{} 'TestEntry (:name |accepts-valid-revisioned-patch)
              :code $ quote
                let
                    store $ {} (:value 1)
                    changes $ [] (%:: patch-schema/change-op :assoc :value 2)
                  assert=
                    %ok $ {} (:value 2)
                    validate-server-patch store 7 7 changes
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-revision-mismatch)
              :code $ quote
                let
                    store $ {} (:value 1)
                    changes $ []
                  assert=
                    %err $ %:: ClientPatchError :revision-mismatch 8 7
                    validate-server-patch store 7 8 changes
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patch-atomically)
              :code $ quote
                let
                    store $ {} (:stable 1)
                    changes $ [] (%:: patch-schema/change-op :assoc :temporary 2)
                      %:: patch-schema/change-op :update :missing $ %:: patch-schema/change-op :replace 3
                    expected $ %err
                      %:: ClientPatchError :invalid-patch $ %:: PatchError :missing-node
                        [] $ %:: PatchPathSegment :field :missing
                  assert= expected $ validate-server-patch store 9 9 changes
                  assert=
                    {} $ :stable 1
                    , store
              :tags $ #{} :client
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.client $ :require
            respo.core :refer $ render! clear-cache! realize-ssr!
            respo.cursor :refer $ update-states
            app.comp.container :refer $ comp-container
            app.schema :as schema
            app.config :as config
            ws-edn.client :refer $ ws-connect! ws-send! ws-set-on-data! WsClientOps
            recollect.patch :refer $ patch-batch PatchBatchOps PatchError PatchPathSegment patch-error-message
            cumulo-util.core :refer $ on-page-touch visibility-heartbeat
            |url-parse :default url-parse
            |bottom-tip :default hud!
            |./calcit.build-errors :default client-errors
            |dayjs :default dayjs
            |dayjs/plugin/weekOfYear :default week-of-year
            recollect.schema :as patch-schema
            cumulo-util.activity :as activity
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'comp-container $ %{} 'CodeEntry (:doc |)
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
        'comp-offline $ %{} 'CodeEntry (:doc |)
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
        'comp-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-status-color (color)
              div $ {} (:class-name css-status-color)
                :style $ {} (:background-color color)
          :examples $ []
          :schema $ :: 'Dynamic
        'css-container $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-container $ {}
              |$0 $ merge ui/global ui/fullscreen ui/column
          :examples $ []
          :schema $ :: 'Dynamic
        'css-offline $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-offline $ {} (|$0 offline-style)
          :examples $ []
          :schema $ :: 'Dynamic
        'css-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-status-color $ {}
              |$0 $ {} (:width 16) (:height 16) (:position :absolute) (:bottom 16) (:right 8) (:border-radius |8px) (:opacity 0.8) (:transition-duration |200ms) (:opacity 0.5)
              |$0:hover $ {} (:opacity 0.7)
          :examples $ []
          :schema $ :: 'Dynamic
        'offline-style $ %{} 'CodeEntry (:doc "|Composes the heterogeneous offline page style before defstyle expansion.")
          :code $ quote
            def offline-style $ merge-styles ui/global ui/fullscreen ui/column-dispersive
              {} $ :background-color (:theme config/site)
          :examples $ []
          :schema $ :: 'Map 'Tag 'Dynamic
        'style-body $ %{} 'CodeEntry (:doc |)
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
            app.style :refer $ merge-styles
    'app.comp.history $ %{} 'FileEntry
      :defs $ {}
        'comp-done-task $ %{} 'CodeEntry (:doc |)
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
                    :style $ merge-styles
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
                      merge-styles ui/flex $ {} (:line-height |24px)
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
        'comp-history $ %{} 'CodeEntry (:doc |)
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
        'css-done-task $ %{} 'CodeEntry (:doc |)
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
            app.style :refer $ merge-styles
    'app.comp.login $ %{} 'FileEntry
      :defs $ {}
        'comp-login $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-login (states)
              let
                  cursor $ &map:get states :cursor
                  state $ or (&map:get states :data) initial-state
                div
                  {} $ :style (style/merge-styles ui/flex ui/center)
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
        'initial-state $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def initial-state $ {} (:username |) (:password |)
          :examples $ []
          :schema $ :: 'Dynamic
        'on-submit $ %{} 'CodeEntry (:doc |)
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
    'app.comp.navigation $ %{} 'FileEntry
      :defs $ {}
        'comp-navigation $ %{} 'CodeEntry (:doc |)
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
        'css-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-entry $ {}
              |$0 $ {} (:opacity 0.6) (:user-select :none) (:transition-duration |200ms)
              |$0:hover $ {} (:opacity 0.8)
          :examples $ []
          :schema $ :: 'Dynamic
        'css-navbar $ %{} 'CodeEntry (:doc |)
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
        'render-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn render-entry (title get-route highlighted?)
              div
                {} (:class-name css-entry)
                  :style $ merge-styles
                    {} $ :cursor :pointer
                    if highlighted?
                      {} $ :opacity 1
                      {}
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
            app.style :refer $ merge-styles
    'app.comp.notes-page $ %{} 'FileEntry
      :defs $ {}
        'comp-note $ %{} 'CodeEntry (:doc |)
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
        'comp-notes-page $ %{} 'CodeEntry (:doc |)
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
        'css-note $ %{} 'CodeEntry (:doc |)
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
    'app.comp.overview $ %{} 'FileEntry
      :defs $ {}
        'comp-global-keydown $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-global-keydown (options on-event)
              span $ {}
                :on-keydown $ fn (e d!) (on-event e d!) &unit
          :examples $ []
          :schema $ :: 'Dynamic
        'comp-no-tasks $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-no-tasks () $ div
              {}
                :class-name $ str-spaced css/center css/font-fancy
                :style $ {}
                  :color $ hsl 0 0 80
              <> "|No tasks"
          :examples $ []
          :schema $ :: 'Dynamic
        'comp-overview $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-overview (states today tasks)
              let
                  working-tasks $ -> tasks (.to-map)
                    filter $ fn (pair)
                      not $ &map:get
                          last pair
                          , .unwrap
                        , :pending?
                  pending-tasks $ -> tasks (.to-map)
                    filter $ fn (pair)
                      &map:get
                          last pair
                          , .unwrap
                        , :pending?
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
                          .show create-plugin d! $ fn (result) (d! :task/create-working result) &unit
                          , &unit
                      comp-global-keydown ({})
                        fn (e d!)
                          when
                            and (&map:get e :meta?)
                              = |i $ &map:get e :key
                            .show create-plugin d! $ fn (result) (d! :task/create-working result) &unit
                          , &unit
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
                                task $
                                  last pair
                                  , .unwrap
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
                          , &unit
                        if (&map:get state :show-later?)
                          list-> ({})
                            -> pending-tasks (.to-list)
                              .sort-by $ fn (pair)
                                let
                                    task $
                                      last pair
                                      , .unwrap
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
                                , &unit
                            <>
                              str (count pending-tasks) "| future tasks. Click to show."
                              {} (:font-family ui/font-fancy) (:font-weight 300) (:cursor :pointer)
                    .render create-plugin
          :examples $ []
          :schema $ :: 'Dynamic
        'comp-task $ %{} 'CodeEntry (:doc |)
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
                      , &unit
                    :on $ {}
                      :dragend $ fn (e d!)
                        d! :task/touch-working $ &map:get task :id
                        , &unit
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
                      , &unit
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
                              , &unit
                          :copy $ do
                            copy! $ &map:get task :text
                            d! cursor new-state
                          :remove $ do (d! cursor new-state)
                            .show delete-plugin d! $ fn ()
                              d! :task/remove-working $ &map:get task :id
                              , &unit
                            , &unit
                          :pend $ do
                            d! :task/pend $ &map:get task :id
                            d! cursor new-state
                          :touch $ do
                            d! :task/touch-working $ &map:get task :id
                            d! cursor new-state
                        , &unit
                  .render update-plugin
                  .render delete-plugin
          :examples $ []
          :schema $ :: 'Dynamic
        'comp-title $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defcomp comp-title (title child ? on-click)
              div
                {} (:class-name css-title)
                  :style $ if (fn? on-click)
                    {} $ :cursor :pointer
                  :on-click $ fn (e d!)
                    when (fn? on-click) (on-click e d!)
                    , &unit
                <> title
                =< 16 nil
                , child
          :examples $ []
          :schema $ :: 'Dynamic
        'css-task-base $ %{} 'CodeEntry (:doc |)
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
        'css-title $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstyle css-title $ {}
              |$0 $ merge ui/row-middle
                {} (:margin "|8px 0") (:font-family ui/font-fancy)
                  :color $ hsl 0 0 50
                  :font-size 16
                  :font-weight 300
          :examples $ []
          :schema $ :: 'Dynamic
        'effect-focus $ %{} 'CodeEntry (:doc |)
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
    'app.comp.profile $ %{} 'FileEntry
      :defs $ {}
        'comp-profile $ %{} 'CodeEntry (:doc |)
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
                          , &unit
                      <> |Refresh
                    =< 16 nil
                    button
                      {} (:class-name css/button)
                        :style $ {} (:color :red) (:border-color :red)
                        :on-click $ fn (e d!) (d! :user/log-out nil)
                          js/localStorage.removeItem $ &map:get config/site :storage-key
                          , &unit
                      <> "|Log out"
          :examples $ []
          :schema $ :: 'Dynamic
        'css-member-label $ %{} 'CodeEntry (:doc |)
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
    'app.config $ %{} 'FileEntry
      :defs $ {}
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def dev? $ = |dev
              option:unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ :: 'Dynamic
        'site $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def site $ {} (:port 11009) (:title |Timegrass) (:icon |http://cdn.tiye.me/logo/timegrass.png) (:dev-ui |http://localhost:8100/main.css) (:release-ui |http://cdn.tiye.me/favored-fonts/main.css) (:cdn-url |http://cdn.tiye.me/timegrass/) (:theme |#51C766) (:storage-key |timegrass) (:storage-file |storage.cirru)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns app.config)
    'app.schema $ %{} 'FileEntry
      :defs $ {}
        'ClientMessage $ %{} 'CodeEntry (:doc "|Typed browser-to-server synchronization and business envelope.")
          :code $ quote
            defenum ClientMessage (:sync/active 'Number) (:sync/heartbeat 'Number) (:sync/idle 'Number) (:sync/resume 'Number) (:sync/ack 'Number) (:dispatch 'app.schema/Op)
          :examples $ []
          :schema $ :: 'Enum
        'MessageDecodeError $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defenum MessageDecodeError $ :invalid 'String
          :examples $ []
          :schema $ :: 'Enum
        'Op $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defenum Op (:today 'Dynamic) (:session/connect) (:session/disconnect) (:session/remove-message 'Dynamic) (:user/log-in 'Dynamic) (:user/sign-up 'Dynamic) (:user/log-out) (:router/change 'Dynamic) (:task/create-working 'Dynamic) (:task/remove-working 'Dynamic) (:task/finish-working 'Dynamic) (:task/update-working 'Dynamic) (:task/touch-working 'Dynamic) (:task/put-back 'Dynamic) (:task/pend 'Dynamic) (:note/add 'Dynamic) (:note/edit 'Dynamic) (:note/remove 'Dynamic) (:effect/persist) (:effect/ping) (:effect/pong) (:effect/connect) (:states 'Dynamic 'Dynamic)
          :examples $ []
          :schema $ :: 'Enum
        'ServerMessage $ %{} 'CodeEntry (:doc "|Typed server snapshot, patch, and heartbeat envelope.")
          :code $ quote
            defenum ServerMessage (:snapshot 'Number 'Map)
              :patch 'Number 'Number $ :: 'List 'recollect.schema/change-op
              :effect/pong
          :examples $ []
          :schema $ :: 'Enum
        'complain $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def complain $ {} (:id nil) (:text |) (:time nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'database $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def database $ {}
              :sessions $ do session ({})
              :users $ do user ({})
              :today |2018-08-07
          :examples $ []
          :schema $ :: 'Dynamic
        'decode-client-message $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn decode-client-message (data)
              let
                  message $ if (enum? data)
                    assoc data 0 $ turn-tag
                      option:unwrap $ nth data 0
                    , data
                match message
                  (:sync/active revision)
                    if (number? revision)
                      %ok $ %:: ClientMessage :sync/active revision
                      invalid-message $ str "|Expected numeric active revision, got: " revision
                  (:sync/heartbeat revision)
                    if (number? revision)
                      %ok $ %:: ClientMessage :sync/heartbeat revision
                      invalid-message $ str "|Expected numeric heartbeat revision, got: " revision
                  (:sync/idle revision)
                    if (number? revision)
                      %ok $ %:: ClientMessage :sync/idle revision
                      invalid-message $ str "|Expected numeric idle revision, got: " revision
                  (:sync/resume revision)
                    if (number? revision)
                      %ok $ %:: ClientMessage :sync/resume revision
                      invalid-message $ str "|Expected numeric resume revision, got: " revision
                  (:sync/ack revision)
                    if (number? revision)
                      %ok $ %:: ClientMessage :sync/ack revision
                      invalid-message $ str "|Expected numeric acknowledgement revision, got: " revision
                  (:dispatch op)
                    match (decode-operation op)
                      (:ok typed-op)
                        %ok $ %:: ClientMessage :dispatch typed-op
                      (:err error) (%err error)
                  _ $ match (decode-operation message)
                    (:ok typed-op)
                      %ok $ %:: ClientMessage :dispatch typed-op
                    (:err error) (%err error)
          :examples $ []
          :schema $ :: 'Fn
            {}
              :args $ [] 'Dynamic
              :return $ :: 'Result 'app.schema/MessageDecodeError 'app.schema/ClientMessage
          :tests $ []
            %{} 'TestEntry (:name |decodes-sync-control)
              :code $ quote
                assert=
                  %:: Result :ok $ %:: ClientMessage :sync/ack 7
                  decode-client-message $ :: :sync/ack 7
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-legacy-direct-op)
              :code $ quote
                assert=
                  %:: Result :ok $ %:: ClientMessage :dispatch (%:: Op :effect/ping)
                  decode-client-message $ %:: Op :effect/ping
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-invalid-revision)
              :code $ quote
                match
                  decode-client-message $ :: :sync/active |bad
                  (:err error)
                    match error $
                      :invalid detail
                      starts-with? detail "|Expected numeric active revision"
                  _ false
              :tags $ #{} :server
            %{} 'TestEntry (:name |decodes-named-wire-operation)
              :code $ quote
                assert=
                  %:: Result :ok $ %:: ClientMessage :dispatch (%:: Op :effect/ping)
                  decode-client-message $ parse-cirru-edn "|%:: 'ClientMessage 'dispatch $ %:: 'Op 'effect/ping"
              :tags $ #{} :server
        'decode-operation $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn decode-operation (data)
              let
                  op $ if (enum? data)
                    assoc data 0 $ turn-tag
                      option:unwrap $ nth data 0
                    , data
                match op
                  (:today value)
                    %ok $ %:: Op :today value
                  (:session/connect)
                    %ok $ %:: Op :session/connect
                  (:session/disconnect)
                    %ok $ %:: Op :session/disconnect
                  (:session/remove-message value)
                    %ok $ %:: Op :session/remove-message value
                  (:user/log-in value)
                    %ok $ %:: Op :user/log-in value
                  (:user/sign-up value)
                    %ok $ %:: Op :user/sign-up value
                  (:user/log-out)
                    %ok $ %:: Op :user/log-out
                  (:router/change value)
                    %ok $ %:: Op :router/change value
                  (:task/create-working value)
                    %ok $ %:: Op :task/create-working value
                  (:task/remove-working value)
                    %ok $ %:: Op :task/remove-working value
                  (:task/finish-working value)
                    %ok $ %:: Op :task/finish-working value
                  (:task/update-working value)
                    %ok $ %:: Op :task/update-working value
                  (:task/touch-working value)
                    %ok $ %:: Op :task/touch-working value
                  (:task/put-back value)
                    %ok $ %:: Op :task/put-back value
                  (:task/pend value)
                    %ok $ %:: Op :task/pend value
                  (:note/add value)
                    %ok $ %:: Op :note/add value
                  (:note/edit value)
                    %ok $ %:: Op :note/edit value
                  (:note/remove value)
                    %ok $ %:: Op :note/remove value
                  (:effect/persist)
                    %ok $ %:: Op :effect/persist
                  (:effect/ping)
                    %ok $ %:: Op :effect/ping
                  (:effect/pong)
                    %ok $ %:: Op :effect/pong
                  (:effect/connect)
                    %ok $ %:: Op :effect/connect
                  (:states cursor state)
                    %ok $ %:: Op :states cursor state
                  _ $ invalid-message (str "|Unknown application operation: " op)
          :examples $ []
          :schema $ :: 'Fn
            {}
              :args $ [] 'Dynamic
              :return $ :: 'Result 'app.schema/MessageDecodeError 'app.schema/Op
        'decode-server-message $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn decode-server-message (data)
              let
                  message $ if (enum? data)
                    assoc data 0 $ turn-tag
                      option:unwrap $ nth data 0
                    , data
                match message
                  (:snapshot revision store)
                    if
                      and (number? revision) (map? store)
                      %ok $ %:: ServerMessage :snapshot revision (unsafe-coerce store 'Map)
                      invalid-message $ str "|Invalid snapshot envelope: " message
                  (:patch base-revision revision changes)
                    let
                        valid-changes? $ if (list? changes)
                          every? (unsafe-coerce changes 'List)
                            fn (change)
                              = (enum-definition change) (%some recollect.schema/change-op)
                          , false
                      if
                        and (number? base-revision) (number? revision) valid-changes?
                        %ok $ %:: ServerMessage :patch base-revision revision
                          unsafe-coerce changes $ :: 'List 'recollect.schema/change-op
                        invalid-message $ str "|Invalid patch envelope: " message
                  (:effect/pong)
                    %ok $ %:: ServerMessage :effect/pong
                  _ $ invalid-message (str "|Unknown server message: " message)
          :examples $ []
          :schema $ :: 'Fn
            {}
              :args $ [] 'Dynamic
              :return $ :: 'Result 'app.schema/MessageDecodeError 'app.schema/ServerMessage
          :tests $ []
            %{} 'TestEntry (:name |decodes-pong)
              :code $ quote
                assert=
                  %:: Result :ok $ %:: ServerMessage :effect/pong
                  decode-server-message $ :: :effect/pong
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patch-payload)
              :code $ quote
                match
                  decode-server-message $ :: :patch 1 2 :bad
                  (:err error)
                    match error $
                      :invalid detail
                      starts-with? detail "|Invalid patch envelope"
                  _ false
              :tags $ #{} :client
            %{} 'TestEntry (:name |decodes-named-wire-pong)
              :code $ quote
                assert=
                  %:: Result :ok $ %:: ServerMessage :effect/pong
                  decode-server-message $ parse-cirru-edn "|%:: 'ServerMessage 'effect/pong"
              :tags $ #{} :client
            %{} 'TestEntry (:name |validates-nominal-patch-list)
              :code $ quote
                assert=
                  %:: Result :ok $ %:: ServerMessage :patch 3 4
                    [] $ %:: recollect.schema/change-op :replace 1
                  decode-server-message $ %:: ServerMessage :patch 3 4
                    [] $ %:: recollect.schema/change-op :replace 1
              :tags $ #{} :client
        'invalid-message $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn invalid-message (detail)
              %:: Result :err $ %:: MessageDecodeError :invalid detail
          :examples $ []
          :schema $ :: 'Fn
            {}
              :args $ [] 'String
              :generics $ [] 'T
              :return $ :: 'Result 'app.schema/MessageDecodeError 'T
        'note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def note $ {} (:id nil) (:time nil) (:updated-time nil) (:text nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'notification $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def notification $ {} (:id nil) (:kind nil) (:text nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'read-path $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn read-path (base path)
              list-match path
                () base
                (field tail)
                  if (map? base)
                    recur (&map:get base field) tail
                    , nil
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ [] 'Dynamic 'List
          :tests $ []
            %{} 'TestEntry (:name |handles-non-map-boundaries)
              :code $ quote
                do
                  assert= 1 $ read-path
                    {} $ :a
                      {} $ :b 1
                    [] :a :b
                  assert= nil $ read-path
                    {} $ :a |not-a-map
                    [] :a :b
                  assert= |leaf $ read-path |leaf ([])
              :tags $ #{} :server
        'router $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def router $ {} (:name nil) (:title nil)
              :data $ {}
              :router nil
          :examples $ []
          :schema $ :: 'Dynamic
        'session $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def session $ {} (:user-id nil) (:id nil) (:nickname nil)
              :router $ {} (:name :home) (:data nil) (:router nil)
              :messages $ {}
          :examples $ []
          :schema $ :: 'Dynamic
        'task $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def task $ {} (:id nil) (:text |) (:detail |) (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'user $ %{} 'CodeEntry (:doc |)
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
        :code $ quote
          ns app.schema $ :require (recollect.schema :as patch-schema)
    'app.server $ %{} 'FileEntry
      :defs $ {}
        '*client-caches $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *client-caches $ {}
          :examples $ []
          :schema $ :: 'Ref (:: 'Map 'Number 'Dynamic)
        '*client-states $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *client-states $ {}
          :examples $ []
          :schema $ :: 'Ref (:: 'Map 'Number 'Dynamic)
        '*dirty-clients $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *dirty-clients $ #{}
          :examples $ []
          :schema $ :: 'Ref (:: 'Set 'Number)
        '*initial-db $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *initial-db $ if
              path-exists? $ w-log storage-file
              do (println "|Found local EDN data")
                merge schema/database $ parse-cirru-edn (read-file storage-file)
              do (println "|Found no data") schema/database
          :examples $ []
          :schema $ :: 'Ref 'Map
        '*reader-reel $ %{} 'CodeEntry (:doc |)
          :code $ quote (defatom *reader-reel @*reel)
          :examples $ []
          :schema $ :: 'Ref 'cumulo-reel.core/ReelState
        '*reel $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *reel $ struct-with reel-schema (:base @*initial-db) (:db @*initial-db)
          :examples $ []
          :schema $ :: 'Ref 'cumulo-reel.core/ReelState
        '*sync-metrics $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defatom *sync-metrics $ %{} SyncMetrics (:last-diff-latency-ms 0) (:last-patch-bytes 0) (:pending-clients 0) (:slow-clients 0) (:resync-count 0) (:patch-attempts 0) (:snapshot-attempts 0) (:last-revision 0)
          :examples $ []
          :schema $ :: 'Ref 'app.server/SyncMetrics
        '*sync-retry-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote (defatom *sync-retry-scheduled? false)
          :examples $ []
          :schema $ :: 'Ref 'Bool
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote (defatom *sync-revision 0)
          :examples $ []
          :schema $ :: 'Ref 'Number
        '*sync-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote (defatom *sync-scheduled? false)
          :examples $ []
          :schema $ :: 'Ref 'Bool
        'SyncMetrics $ %{} 'CodeEntry (:doc "|Process-lifetime synchronization counters with read-time client gauges.")
          :code $ quote
            defstruct SyncMetrics (:last-diff-latency-ms 'Number) (:last-patch-bytes 'Number) (:pending-clients 'Number) (:slow-clients 'Number) (:resync-count 'Number) (:patch-attempts 'Number) (:snapshot-attempts 'Number) (:last-revision 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'acknowledge-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn acknowledge-client! (sid revision)
              let
                  state $ option:unwrap (get @*client-states sid)
                when
                  = revision $ option:unwrap-or (get state :sent-rev) -1
                  let
                      sent-store $ option:unwrap (get state :sent-store)
                    swap! *client-caches assoc sid sent-store
                  swap! *client-states update sid $ fn (current) (next-sync-ack-state current revision)
                  when
                    >
                      option:unwrap-or (get state :dirty-rev) 0
                      , revision
                    swap! *dirty-clients include sid
                    request-sync!
              , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number 'Number
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn dispatch! (op sid)
              let
                  op-id $ turn-string (generate-id!)
                  op-time $ get-timestamp (get-time!)
                if config/dev? $ println |Dispatch! (str op) sid
                match op
                  (:effect/persist) (persist-db!)
                  (:effect/ping)
                    wss-send! sid $ format-cirru-edn (%:: schema/ServerMessage :effect/pong)
                  _ $ do
                    reset! *reel $ reel-reducer @*reel updater op sid op-id op-time config/dev?
                    request-sync!
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'app.schema/Op 'Number
        'get-backup-path! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn get-backup-path! () $ let
                now $ extract-time (get-time!)
              join-path calcit-dirname |backups
                str $ &map:get now :month
                str (&map:get now :day) |-snapshot.cirru
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'String)
              :args $ []
        'handle-client-message! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn handle-client-message! (message sid)
              match message
                (:sync/active client-revision) (mark-client-active! sid client-revision false)
                (:sync/heartbeat client-revision)
                  do (touch-client! sid client-revision)
                    wss-send! sid $ format-cirru-edn (%:: schema/ServerMessage :effect/pong)
                    , &unit
                (:sync/idle client-revision) (mark-client-idle! sid client-revision)
                (:sync/resume client-revision)
                  do (record-resync!) (mark-client-active! sid client-revision true)
                (:sync/ack revision) (acknowledge-client! sid revision)
                (:dispatch op) (dispatch! op sid)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'app.schema/ClientMessage 'Number
        'handle-sync-send! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn handle-sync-send! (sid revision new-store outcome)
              swap! *client-states update sid $ fn (current) (next-sync-send-state current revision new-store outcome)
              match outcome
                (:accepted) &unit
                (:backpressured)
                  do (swap! *dirty-clients include sid) (request-sync-retry!)
                (:too-large) (println "|WebSocket sync payload is too large for client:" sid)
                (:closed) &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number 'Number 'Dynamic 'wss.core/WssSendOutcome
        'invalidate-sync-caches! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn invalidate-sync-caches! ()
              reset! *client-caches $ {}
              each (keys @*client-states)
                fn (sid)
                  swap! *client-states update sid $ fn (state)
                    dissoc
                      merge state $ {} (:needs-snapshot? true) (:in-flight? false)
                      , :sent-rev :sent-store
                  when
                    = :active $ option:unwrap
                      get
                        option:unwrap $ get @*client-states sid
                        , :status
                    swap! *dirty-clients include sid
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! ()
              println "|Running mode:" $ if config/dev? |dev |release
              let
                  p? $ get-env |port
                  port $ option:fold p?
                    fn () $ &map:get config/site :port
                    fn (raw)
                      (parse-float raw) .unwrap-or $ &map:get config/site :port
                run-server! port
                println $ str "|Server started on port:" port
              do (; "|init it before doing multi-threading") (identity @*reader-reel)
              on-control-c on-exit!
              set-interval 600000 $ fn () (persist-db!)
              set-interval 60000 $ fn () (set-today!)
          :examples $ []
          :schema $ :: 'Dynamic
        'mark-client-active! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn mark-client-active! (sid client-revision force-snapshot?)
              let
                  state $ option:unwrap-or (get @*client-states sid) ({})
                  resumed? $ or force-snapshot?
                    not= :active $ option:unwrap-or (get state :status) :idle
                  next-state-base $ merge
                    {} (:status :active)
                      :last-heartbeat $ now-ms
                      :acked-rev client-revision
                      :dirty-rev @*sync-revision
                      :in-flight? false
                      :needs-snapshot? true
                    , state
                      {} (:status :active)
                        :last-heartbeat $ now-ms
                        :acked-rev $ if resumed? client-revision
                          option:unwrap-or (get state :acked-rev) client-revision
                        :in-flight? $ if resumed? false
                          option:unwrap-or (get state :in-flight?) false
                        :needs-snapshot? $ or resumed?
                          option:unwrap-or (get state :needs-snapshot?) false
                  next-state $ if resumed? (dissoc next-state-base :sent-rev :sent-store) next-state-base
                swap! *client-states assoc sid next-state
                when resumed? (swap! *client-caches dissoc sid) (swap! *dirty-clients include sid) (request-sync!)
              , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number 'Number 'Bool
        'mark-client-idle! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn mark-client-idle! (sid client-revision)
              when
                option:some? $ get @*client-states sid
                swap! *client-states update sid $ fn (state)
                  dissoc
                    merge state $ {} (:status :idle) (:acked-rev client-revision) (:in-flight? false) (:needs-snapshot? true)
                    , :sent-rev :sent-store
                swap! *client-caches dissoc sid
                swap! *dirty-clients exclude sid
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number 'Number
        'mark-clients-dirty! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn mark-clients-dirty! (revision)
              each (keys @*client-states)
                fn (sid)
                  let
                      state $ option:unwrap (get @*client-states sid)
                    swap! *client-states assoc-in ([] sid :dirty-rev) revision
                    when
                      = :active $ option:unwrap (get state :status)
                      swap! *dirty-clients include sid
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number
        'next-sync-ack-state $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn next-sync-ack-state (current revision)
              dissoc
                merge current $ {} (:acked-rev revision) (:in-flight? false)
                , :sent-rev :sent-store
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'C)
              :args $ [] 'C 'Number
              :generics $ [] 'C
          :tests $ []
            %{} 'TestEntry (:name |repeated-backpressure-converges-to-latest-revision)
              :code $ quote
                let
                    initial $ {} (:status :active) (:acked-rev 3) (:dirty-rev 4) (:in-flight? false) (:needs-snapshot? false)
                    after-first-backpressure $ next-sync-send-state initial 4
                      {} $ :value 4
                      %:: wss.core/WssSendOutcome :backpressured
                    after-latest-backpressure $ next-sync-send-state (assoc after-first-backpressure :dirty-rev 7) 7
                      {} $ :value 7
                      %:: wss.core/WssSendOutcome :backpressured
                    accepted-latest $ next-sync-send-state (assoc after-latest-backpressure :dirty-rev 9) 9
                      {} $ :value 9
                      %:: wss.core/WssSendOutcome :accepted
                  assert=
                    {} (:status :active) (:acked-rev 9) (:dirty-rev 9) (:in-flight? false) (:needs-snapshot? false) (:slow-client? false) (:last-send-outcome :accepted)
                    next-sync-ack-state accepted-latest 9
              :tags $ #{} :server
        'next-sync-metrics $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn next-sync-metrics (metrics message-kind revision diff-latency payload)
              struct-with metrics (:last-diff-latency-ms diff-latency)
                :last-patch-bytes $ if (= message-kind :patch) payload.utf8-byte-count (:last-patch-bytes metrics)
                :patch-attempts $ if (= message-kind :patch)
                  inc $ :patch-attempts metrics
                  :patch-attempts metrics
                :snapshot-attempts $ if (= message-kind :snapshot)
                  inc $ :snapshot-attempts metrics
                  :snapshot-attempts metrics
                :last-revision revision
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'app.server/SyncMetrics)
              :args $ [] 'app.server/SyncMetrics 'Tag 'Number 'Number 'String
          :tests $ []
            %{} 'TestEntry (:name |advances-patch-and-snapshot-counters)
              :code $ quote
                let
                    initial $ %{} SyncMetrics (:last-diff-latency-ms 0) (:last-patch-bytes 0) (:pending-clients 0) (:slow-clients 0) (:resync-count 0) (:patch-attempts 0) (:snapshot-attempts 0) (:last-revision 0)
                    after-patch $ next-sync-metrics initial :patch 7 3 "|A😀"
                  assert=
                    %{} SyncMetrics (:last-diff-latency-ms 2) (:last-patch-bytes 5) (:pending-clients 0) (:slow-clients 0) (:resync-count 0) (:patch-attempts 1) (:snapshot-attempts 1) (:last-revision 8)
                    next-sync-metrics after-patch :snapshot 8 2 |ignored
              :tags $ #{} :server
        'next-sync-send-state $ %{} 'CodeEntry (:doc "|Advance one client synchronization state from a typed transport admission outcome.")
          :code $ quote
            defn next-sync-send-state (current revision new-store outcome)
              match outcome
                (:accepted)
                  merge current $ {} (:sent-rev revision) (:sent-store new-store) (:in-flight? true) (:needs-snapshot? false) (:slow-client? false) (:last-send-outcome :accepted)
                (:backpressured)
                  merge current $ {}
                    :dirty-rev $ let
                        current-dirty $ option:unwrap-or (get current :dirty-rev) 0
                      if (> revision current-dirty) revision current-dirty
                    :slow-client? true
                    :last-send-outcome :backpressured
                (:too-large)
                  merge current $ {} (:needs-snapshot? true) (:slow-client? true) (:last-send-outcome :too-large)
                (:closed)
                  dissoc
                    merge current $ {} (:status :idle) (:in-flight? false) (:last-send-outcome :closed)
                    , :sent-rev :sent-store
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'C)
              :args $ [] 'C 'Number 'U 'wss.core/WssSendOutcome
              :generics $ [] 'C 'U
          :tests $ []
            %{} 'TestEntry (:name |accepted-records-pending-store)
              :code $ quote
                assert=
                  {} (:status :active) (:sent-rev 7)
                    :sent-store $ {} (:value 1)
                    :in-flight? true
                    :needs-snapshot? false
                    :slow-client? false
                    :last-send-outcome :accepted
                  next-sync-send-state
                    {} $ :status :active
                    , 7
                      {} $ :value 1
                      %:: wss.core/WssSendOutcome :accepted
              :tags $ #{} :server
            %{} 'TestEntry (:name |oversized-payload-requires-snapshot)
              :code $ quote
                assert=
                  {} (:status :active) (:needs-snapshot? true) (:slow-client? true) (:last-send-outcome :too-large)
                  next-sync-send-state
                    {} $ :status :active
                    , 7
                      {} $ :value 1
                      %:: wss.core/WssSendOutcome :too-large
              :tags $ #{} :server
            %{} 'TestEntry (:name |closed-clears-pending-send)
              :code $ quote
                assert=
                  {} (:status :idle) (:in-flight? false) (:last-send-outcome :closed)
                  next-sync-send-state
                    {} (:status :active) (:in-flight? true) (:sent-rev 7)
                      :sent-store $ {} (:value 1)
                    , 7
                      {} $ :value 1
                      %:: wss.core/WssSendOutcome :closed
              :tags $ #{} :server
            %{} 'TestEntry (:name |backpressure-preserves-latest-dirty-revision)
              :code $ quote
                assert=
                  {} (:status :active) (:acked-rev 5) (:dirty-rev 7) (:slow-client? true) (:last-send-outcome :backpressured)
                  next-sync-send-state
                    {} (:status :active) (:acked-rev 5) (:dirty-rev 6)
                    , 7
                      {} $ :value 1
                      %:: wss.core/WssSendOutcome :backpressured
              :tags $ #{} :server
        'now-ms $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn now-ms () $ get-timestamp (get-time!)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Number)
              :args $ []
        'on-exit! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn on-exit! () (persist-db!) (; println "|exit code is...") (quit! 0)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'patch-operation-limit $ %{} 'CodeEntry (:doc |)
          :code $ quote (def patch-operation-limit 64)
          :examples $ []
          :schema $ :: 'Dynamic
        'persist-db! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn persist-db! () $ let
                file-content $ format-cirru-edn
                  assoc
                    :db $ unsafe-coerce @*reel 'cumulo-reel.core/ReelState
                    , :sessions $ {}
                storage-path storage-file
                backup-path $ get-backup-path!
              do (check-write-file! storage-path file-content) (check-write-file! backup-path file-content)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'read-sync-metrics $ %{} 'CodeEntry (:doc "|Read synchronization counters plus current pending and slow-client gauges.")
          :code $ quote
            defn read-sync-metrics () $ let
                states $ vals @*client-states
                pending-clients $ count
                  filter states $ fn (state)
                    option:unwrap-or (get state :in-flight?) false
                slow-clients $ count
                  filter states $ fn (state)
                    option:unwrap-or (get state :slow-client?) false
              merge @*sync-metrics $ {} (:pending-clients pending-clients) (:slow-clients slow-clients)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'app.server/SyncMetrics)
              :args $ []
        'record-resync! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn record-resync! () $ swap! *sync-metrics update :resync-count inc
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'record-sync-send! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn record-sync-send! (message-kind revision diff-latency payload)
              swap! *sync-metrics $ fn (metrics) (next-sync-metrics metrics message-kind revision diff-latency payload)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Tag 'Number 'Number 'String
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () (println "|Code updated..")
              if (not config/dev?) (raise "|reloading only happens in dev mode")
              clear-twig-caches!
              reset! *reel $ refresh-reel @*reel @*initial-db updater
              invalidate-sync-caches!
              request-sync!
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'render-loop! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn render-loop! ()
              when
                not $ identical? @*reader-reel @*reel
                reset! *reader-reel @*reel
                swap! *sync-revision inc
                mark-clients-dirty! @*sync-revision
              sync-clients! @*reader-reel
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'request-sync! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn request-sync! () $ if @*sync-scheduled? &unit
              do (reset! *sync-scheduled? true)
                set-timeout sync-coalesce-delay $ fn () (reset! *sync-scheduled? false) (render-loop!)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'request-sync-retry! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn request-sync-retry! () $ if @*sync-retry-scheduled? &unit
              do (reset! *sync-retry-scheduled? true)
                set-timeout sync-retry-delay $ fn () (reset! *sync-retry-scheduled? false)
                  when
                    not $ empty? @*dirty-clients
                    request-sync!
                  , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'run-server! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn run-server! (port)
              wss-serve!
                {} $ :port port
                fn (data)
                  match data
                    (:connect sid)
                      do
                        swap! *client-states assoc sid $ {} (:status :idle)
                          :last-heartbeat $ now-ms
                          :acked-rev 0
                          :dirty-rev @*sync-revision
                          :in-flight? false
                          :needs-snapshot? true
                        dispatch! (%:: schema/Op :session/connect) sid
                        println "|New client."
                    (:message sid msg)
                      match
                        schema/decode-client-message $ parse-cirru-edn msg
                        (:ok message) (handle-client-message! message sid)
                        (:err error) (eprintln "|Invalid client message:" sid error)
                    (:disconnect sid)
                      do (println "|Client closed!")
                        dispatch! (%:: schema/Op :session/disconnect) sid
                        swap! *client-caches dissoc sid
                        swap! *client-states dissoc sid
                        swap! *dirty-clients exclude sid
                    _ $ println "|unknown data:" data
              , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number
        'set-today! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn set-today! ()
              let
                  today $ wo-log
                    format-time (get-time!) (%some |%Y-%m-%d)
                  reel $ unsafe-coerce @*reel 'cumulo-reel.core/ReelState
                  old-today $ &map:get (:db reel) :today
                when (not= today old-today)
                  dispatch! (%:: schema/Op :today today) 0
              , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
        'storage-file $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def storage-file $ if (empty? calcit-dirname) (&map:get config/site :storage-file)
              join-path calcit-dirname $ &map:get config/site :storage-file
          :examples $ []
          :schema $ :: 'String
        'sync-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn sync-client! (sid reel revision) (swap! *dirty-clients exclude sid)
              let
                  state $ option:unwrap (get @*client-states sid)
                when
                  and
                    = :active $ option:unwrap (get state :status)
                    not $ option:unwrap-or (get state :in-flight?) false
                  let
                      db $ :db reel
                      records $ :records reel
                      session $ schema/read-path db ([] :sessions sid)
                      old-store-option $ get @*client-caches sid
                      new-store $ twig-container db session records
                      needs-snapshot? $ or
                        option:unwrap-or (get state :needs-snapshot?) true
                        option:none? old-store-option
                      diff-start $ now-ms
                      changes $ if needs-snapshot? ([])
                        diff-twig (option:unwrap old-store-option) new-store $ {} (:key :id)
                      diff-latency $ - (now-ms) diff-start
                      send-snapshot? $ or needs-snapshot?
                        > (count changes) patch-operation-limit
                      base-revision $ option:unwrap-or (get state :acked-rev) 0
                    if send-snapshot?
                      let
                          payload $ format-cirru-edn (%:: schema/ServerMessage :snapshot revision new-store)
                        record-sync-send! :snapshot revision diff-latency payload
                        handle-sync-send! sid revision new-store $ wss-send! sid payload
                      if
                        not= changes $ []
                        let
                            payload $ format-cirru-edn (%:: schema/ServerMessage :patch base-revision revision changes)
                          record-sync-send! :patch revision diff-latency payload
                          handle-sync-send! sid revision new-store $ wss-send! sid payload
                        , &unit
              , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number 'cumulo-reel.core/ReelState 'Number
        'sync-clients! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn sync-clients! (reel)
              when
                not $ empty? @*dirty-clients
                let
                    revision @*sync-revision
                    clients @*dirty-clients
                  each clients $ fn (sid)
                    when
                      option:some? $ get @*client-states sid
                      sync-client! sid reel revision
              , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'cumulo-reel.core/ReelState
        'sync-coalesce-delay $ %{} 'CodeEntry (:doc |)
          :code $ quote (def sync-coalesce-delay 16)
          :examples $ []
          :schema $ :: 'Dynamic
        'sync-retry-delay $ %{} 'CodeEntry (:doc |)
          :code $ quote (def sync-retry-delay 200)
          :examples $ []
          :schema $ :: 'Dynamic
        'touch-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn touch-client! (sid client-revision)
              let
                  state $ option:unwrap (get @*client-states sid)
                if
                  = :active $ option:unwrap (get state :status)
                  swap! *client-states assoc-in ([] sid :last-heartbeat) (now-ms)
                  mark-client-active! sid client-revision true
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Number 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.server $ :require (app.schema :as schema)
            app.updater :refer $ updater
            cumulo-reel.core :refer $ reel-reducer refresh-reel reel-schema
            app.config :as config
            app.twig.container :refer $ twig-container
            recollect.diff :refer $ diff-twig
            wss.core :refer $ WssSendOutcome wss-serve! wss-send!
            recollect.twig :refer $ clear-twig-caches!
            app.$meta :refer $ calcit-dirname
            calcit.std.fs :refer $ path-exists? check-write-file!
            calcit.std.time :refer $ set-interval set-timeout
            calcit.std.date :refer $ get-time! extract-time format-time get-timestamp
            calcit.std.path :refer $ join-path
    'app.style $ %{} 'FileEntry
      :defs $ {}
        'button $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def button $ merge ui/button
              {} $ :background-color :white
          :examples $ []
          :schema $ :: 'Dynamic
        'link $ %{} 'CodeEntry (:doc |)
          :code $ quote
            def link $ {} (:text-decoration :underline) (:cursor :pointer)
              :color $ hsl 240 80 80
              :font-family ui/font-fancy
          :examples $ []
          :schema $ :: 'Dynamic
        'merge-styles $ %{} 'CodeEntry (:doc "|Combines heterogeneous Respo style maps at the rendering boundary.")
          :code $ quote
            defn merge-styles (x0 & xs) (reduce xs x0 &merge)
          :examples $ []
          :schema $ :: 'Fn
            {} (:rest 'Map) (:return 'Map)
              :args $ [] 'Map
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.style $ :require
            [] respo-ui.core :refer $ [] hsl
            [] respo-ui.core :as ui
    'app.twig.container $ %{} 'FileEntry
      :defs $ {}
        'twig-container $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-container (db session records)
              let
                  session-data $ if (map? session) session schema/session
                  logged-in? $ some? (&map:get session-data :user-id)
                  router $ &map:get session-data :router
                  base-data $ {} (:logged-in? logged-in?) (:session session-data) (:router router)
                    :reel-length $ count records
                  user $ schema/read-path db
                    [] :users $ &map:get session-data :user-id
                merge base-data $ if logged-in?
                  {}
                    :user $ twig-user user
                    :router $ assoc router :data
                      case-default (&map:get router :name) ({})
                        :home $ {}
                          :tasks $ schema/read-path user ([] :tasks :working)
                        :history $ {}
                          :week $ &map:get router :data
                          :tasks $ twig-tasks-by-week (&map:get router :data)
                            schema/read-path user $ [] :tasks :finished
                        :notes $ twig-notes-by-month (&map:get router :data) (&map:get user :notes)
                        :profile $ twig-members (&map:get db :sessions) (&map:get db :users)
                    :count $ count (&map:get db :sessions)
                    :color $ rand-hex-color!
                    :today $ &map:get db :today
                  {}
          :examples $ []
          :schema $ :: 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |defaults-missing-session)
              :code $ quote
                let
                    init-db $ {}
                    init-records $ []
                    result $ twig-container init-db nil init-records
                  do
                    assert= true $ map? result
                    assert= schema/session $ &map:get result :session
              :tags $ #{} :server
        'twig-members $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-members (sessions users)
              -> sessions $ .map-kv
                fn (k session)
                  [] k $ schema/read-path users
                    [] (&map:get session :user-id) :name
          :examples $ []
          :schema $ :: 'Dynamic
        'twig-notes-by-month $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-notes-by-month (data notes)
              let
                  year $ &map:get data :year
                  month $ inc (&map:get data :month)
                -> notes (.to-map)
                  .filter-kv $ fn (k task)
                    let
                        time $ extract-time
                          :: Date $ &map:get task :time
                      and
                        = year $ &map:get time :year
                        = month $ &map:get time :month
          :examples $ []
          :schema $ :: 'Dynamic
        'twig-tasks-by-week $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-tasks-by-week (data tasks)
              let
                  filter-year $ &map:get data :year
                  filter-week $ dec (&map:get data :week)
                  start-time $ parse-time (&map:get data :start) "|%Y-%m-%dT%H:%M:%S %z"
                  end-time $ parse-time (&map:get data :end) "|%Y-%m-%dT%H:%M:%S %z"
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
        'week-millis $ %{} 'CodeEntry (:doc |)
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
            app.schema :as schema
    'app.twig.user $ %{} 'FileEntry
      :defs $ {}
        'twig-user $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn twig-user (user)
              -> user (dissoc :password) (dissoc :tasks)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.twig.user $ :require
            [] recollect.twig :refer $ [] deftwig
    'app.updater $ %{} 'FileEntry
      :defs $ {}
        'updater $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn updater (db op sid op-id op-time)
              match op
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
    'app.updater.misc $ %{} 'FileEntry
      :defs $ {}
        'set-today $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn set-today (db op-data sid op-id op-time) (assoc db :today op-data)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns app.updater.misc)
    'app.updater.note $ %{} 'FileEntry
      :defs $ {}
        'add-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn add-note (db op-data sid op-id op-time)
              let
                  session $ schema/read-path db ([] :sessions sid)
                  user-id $ &map:get session :user-id
                  new-note $ merge schema/note
                    {} (:id op-id) (:time op-time) (:text op-data)
                assoc-in db ([] :users user-id :notes op-id) new-note
          :examples $ []
          :schema $ :: 'Dynamic
        'edit-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn edit-note (db op-data sid op-id op-time)
              let
                  session $ schema/read-path db ([] :sessions sid)
                  user-id $ &map:get session :user-id
                  note-id $ &map:get op-data :id
                  text $ &map:get op-data :text
                update-in db ([] :users user-id :notes note-id)
                  fn (note-option)
                    match note-option
                      (:some note) (assoc note :text text)
                      (:none) nil
          :examples $ []
          :schema $ :: 'Dynamic
        'remove-note $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn remove-note (db op-data sid op-id op-time)
              let
                  session $ schema/read-path db ([] :sessions sid)
                  user-id $ &map:get session :user-id
                update-in db ([] :users user-id :notes)
                  fn (notes-option)
                    let
                        notes $ option:unwrap-or notes-option ({})
                      dissoc notes op-data
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater.note $ :require ([] app.schema :as schema)
    'app.updater.router $ %{} 'FileEntry
      :defs $ {}
        'change $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn change (db op-data sid op-id op-time)
              assoc-in db ([] :sessions sid :router) op-data
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns app.updater.router)
    'app.updater.session $ %{} 'FileEntry
      :defs $ {}
        'connect $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn connect (db sid op-id op-time)
              assoc-in db ([] :sessions sid)
                merge schema/session $ {} (:id sid)
          :examples $ []
          :schema $ :: 'Dynamic
        'disconnect $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn disconnect (db sid op-id op-time)
              update db :sessions $ fn (session) (dissoc session sid)
          :examples $ []
          :schema $ :: 'Dynamic
        'remove-message $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn remove-message (db op-data sid op-id op-time)
              update-in db ([] :sessions sid :messages)
                fn (messages-option)
                  let
                      messages $ option:unwrap-or messages-option ({})
                    dissoc messages $ &map:get op-data :id
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater.session $ :require ([] app.schema :as schema)
    'app.updater.task $ %{} 'FileEntry
      :defs $ {}
        'create-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn create-working (db op-data sid op-id op-time)
              let
                  user-id $ schema/read-path db ([] :sessions sid :user-id)
                assoc-in db ([] :users user-id :tasks :working op-id)
                  merge schema/task $ {} (:id op-id) (:text op-data) (:created-time op-time)
          :examples $ []
          :schema $ :: 'Dynamic
        'finish-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn finish-working (db op-data sid op-id op-time)
              let
                  user-id $ schema/read-path db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks)
                  fn (tasks-option)
                    let
                        tasks $ option:unwrap-or tasks-option ({})
                        task $ schema/read-path tasks ([] :working op-data)
                      if
                        not $ nil? task
                        -> tasks
                          update :working $ fn (items) (dissoc items op-data)
                          assoc-in ([] :finished op-data) (assoc task :finished-time op-time)
                        , tasks
          :examples $ []
          :schema $ :: 'Dynamic
        'pend $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn pend (db op-data sid op-id op-time)
              let
                  user-id $ schema/read-path db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks :working op-data :pending?) not
          :examples $ []
          :schema $ :: 'Dynamic
        'put-back $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn put-back (db op-data sid op-id op-time)
              let
                  user-id $ schema/read-path db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks)
                  fn (tasks-option)
                    let
                        tasks $ option:unwrap-or tasks-option ({})
                        task $ schema/read-path tasks ([] :finished op-data)
                      if
                        not $ nil? task
                        -> tasks
                          update :finished $ fn (items) (dissoc items op-data)
                          assoc-in ([] :working op-data) (assoc task :touched-time op-time)
                        , tasks
          :examples $ []
          :schema $ :: 'Dynamic
        'remove-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn remove-working (db op-data sid op-id op-time)
              let
                  user-id $ schema/read-path db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks :working)
                  fn (tasks-option)
                    let
                        tasks $ option:unwrap-or tasks-option ({})
                      dissoc tasks op-data
          :examples $ []
          :schema $ :: 'Dynamic
        'touch-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn touch-working (db op-data sid op-id op-time)
              let
                  user-id $ schema/read-path db ([] :sessions sid :user-id)
                update-in db ([] :users user-id :tasks :working op-data)
                  fn (task-option)
                    match task-option
                      (:some task) (assoc task :touched-time op-time)
                      (:none) nil
          :examples $ []
          :schema $ :: 'Dynamic
        'update-working $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn update-working (db op-data sid op-id op-time)
              let
                  user-id $ schema/read-path db ([] :sessions sid :user-id)
                update-in db
                  [] :users user-id :tasks :working $ &map:get op-data :id
                  fn (task-option)
                    match task-option
                      (:some task)
                        assoc task :text $ &map:get op-data :text
                      (:none) nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns app.updater.task $ :require ([] app.schema :as schema)
    'app.updater.user $ %{} 'FileEntry
      :defs $ {}
        'log-in $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn log-in (db op-data sid op-id op-time)
              let-sugar
                    [] username password
                    , op-data
                  maybe-user $ -> (&map:get db :users) (vals) (.to-list)
                    find $ fn (user)
                      and $ = username (&map:get user :name)
                update-in db ([] :sessions sid)
                  fn (session-option)
                    let
                        session $ option:unwrap-or session-option schema/session
                      match maybe-user
                        (:some user)
                          if
                            = (md5 password) (&map:get user :password)
                            assoc session :user-id $ &map:get user :id
                            assoc session :messages $ assoc (&map:get session :messages) op-id
                              {} (:id op-id)
                                :text $ str "|Wrong password for " username
                        (:none)
                          assoc session :messages $ assoc (&map:get session :messages) op-id
                            {} (:id op-id)
                              :text $ str "|No user named: " username
          :examples $ []
          :schema $ :: 'Dynamic
        'log-out $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn log-out (db sid op-id op-time)
              assoc-in db ([] :sessions sid :user-id) nil
          :examples $ []
          :schema $ :: 'Dynamic
        'sign-up $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn sign-up (db op-data sid op-id op-time)
              let-sugar
                    [] username password
                    , op-data
                  maybe-user $ find
                      vals $ &map:get db :users
                      , .to-list
                    fn (user)
                      = username $ &map:get user :name
                match maybe-user
                  (:some _user)
                    update-in db ([] :sessions sid :messages)
                      fn (messages-option)
                        let
                            messages $ option:unwrap-or messages-option ({})
                          assoc messages op-id $ {} (:id op-id)
                            :text $ str "|Name is taken: " username
                  (:none)
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
            app.schema :as schema
