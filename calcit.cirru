
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {}
    :default $ {} (:description "||Browser client bundle") (:init-fn 'app.client/main!) (:mode :js) (:reload-fn 'app.client/reload!)
      :feature-policy $ {}
      :modules $ [] |recollect/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo-markdown.calcit/ |respo.calcit/ |js-ffi/
      :type-slots $ {} $ :dispatch-op |app.schema/Op
    :server $ {} (:description "||Realtime server") (:init-fn 'app.server/main!) (:mode :native) (:reload-fn 'app.server/reload!)
      :feature-policy $ {}
      :modules $ [] |recollect/ |cumulo-util.calcit/ |cumulo-reel.calcit/ |calcit.std/ |calcit-wss/
      :type-slots $ {}
  :files $ {}
    'app.client $ %{} 'FileEntry
      :defs $ {}
        '*connected? $ %{} 'CodeEntry (:doc "|Whether the active ws-edn generation is open.")
          :code $ quote $ defatom *connected? false
          :examples $ []
          :schema $ :: 'Ref 'Bool
        '*states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *states
            {} $ :states $ {}
              :cursor $ []
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *store (:: :initial)
          :examples $ []
          :schema $ :: 'Ref
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *sync-revision 0
          :examples $ []
          :schema $ :: 'Ref 'Number
        '*ws-client $ %{} 'CodeEntry
          :doc "|Current nominal ws-edn client retained across browser recovery events."
          :code $ quote $ defatom *ws-client (%none)
          :examples $ []
          :schema $ :: 'Ref $ :: 'calcit.core/Option 'ws-edn.client/WsClient
        'ClientPatchError $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum ClientPatchError (:revision-mismatch 'Number 'Number) (:invalid-patch 'recollect.patch/PatchError)
          :examples $ []
          :schema $ :: 'EnumDef
        'ConnectionRecoveryAction $ %{} 'CodeEntry (:doc "|Deterministic browser recovery choice.")
          :code $ quote $ defenum ConnectionRecoveryAction (:none) (:reconnect) (:connect)
          :examples $ []
          :schema $ :: 'EnumDef
        'DayjsFactoryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DayjsFactoryHost
            .extend! $ :: 'Fn $ {}
              :args $ [] 'app.client/DayjsFactoryHost 'JsObject
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :names $ {} $ :extend! |extend
          :schema $ :: 'Trait
        'NavigatorConnectionHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait NavigatorConnectionHost (:onLine 'Bool)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'ParsedUrlHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ParsedUrlHost (:query 'app.client/ParsedUrlQueryHost)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'ParsedUrlQueryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ParsedUrlQueryHost
            :host $ :: 'JsNullish 'String
            :port $ :: 'JsNullish 'String
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'ack-sync! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ack-sync! (revision)
            ws-send! $ schema/ClientMessage :sync/ack revision
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number
        'apply-server-patch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn apply-server-patch! (base-revision revision changes)
            match (validate-server-patch @*store @*sync-revision base-revision changes)
              (:ok next-store)
                do (reset! *store next-store) (reset! *sync-revision revision) (ack-sync! revision)
              (:err error)
                do
                  match error
                    (:revision-mismatch expected actual)
                      console-warn! $ str |Sync-revision-mismatch-expected= expected |,-actual= actual
                    (:invalid-patch patch-error)
                      console-error! $ str |Failed-to-apply-server-patch:_ $ patch-error-message patch-error
                  request-snapshot!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number $ :: 'List 'recollect.schema/change-op
        'choose-recovery-action $ %{} 'CodeEntry
          :doc "|Choose whether a visible online page should reconnect or create a client."
          :code $ quote $ defn choose-recovery-action (connected? has-client? visible? online?)
            if (and visible? online?)
              if connected? (ConnectionRecoveryAction :none)
                if has-client? (ConnectionRecoveryAction :reconnect) (ConnectionRecoveryAction :connect)
              ConnectionRecoveryAction :none
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'ConnectionRecoveryAction)
            :args $ [] 'Bool 'Bool 'Bool 'Bool
          :tests $ [] $ %{} 'TestEntry (:name |selects-deterministic-browser-recovery)
            :code $ quote $ do
              assert= (ConnectionRecoveryAction :none) (choose-recovery-action true true true true)
              assert= (ConnectionRecoveryAction :none) (choose-recovery-action false true false true)
              assert= (ConnectionRecoveryAction :none) (choose-recovery-action false true true false)
              assert= (ConnectionRecoveryAction :reconnect) (choose-recovery-action false true true true)
              assert= (ConnectionRecoveryAction :connect) (choose-recovery-action false false true true)
            :tags $ #{} :client
        'connect! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn connect! ()
            let
                url-obj $ unsafe-coerce (url-parse js/location.href true) 'app.client/ParsedUrlHost
                query $ .-query url-obj
                host-value $ .-host query
                port-value $ .-port query
                host $ if (js-present? host-value) (unsafe-coerce host-value 'String) (unsafe-coerce js/location.hostname 'String)
                port $ if (js-present? port-value) (unsafe-coerce port-value 'String)
                  str $ &map:get config/site :port
                ws-url $ if config/dev? (str |ws:// host |: port) |wss://timegrass.topix.im/ws
              js/console.info |[connection] |opening ws-url
              reset! *store $ :: :loading
              reset! *ws-client $ %some $ ws-connect! ws-url
                {}
                  :on-open $ fn (event) (js/console.info |[connection] |open ws-url) (reset! *connected? true) (request-snapshot!) (send-activity!) (simulate-login!)
                  :on-close $ fn (event) (reset! *connected? false)
                    reset! *store $ :: :offline
                    js/console.error |[connection] |closed ws-url
                  :on-data on-server-data
                  :heartbeat-timeout-ms 75000
                  :class-mapper $ {} (:ServerMessage schema/ServerMessage) (:change-op patch-schema/change-op)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            match op
              (:states ignored-cursor ignored-state) &unit
              _ $ js-ffi.shared/console-info! $ str-spaced |[operation] |sending
                str $ &enum:nth op 0
            match op
              (:states cursor s)
                reset! *states $ update-states @*states cursor s
              (:effect/connect) (connect!)
              _ $ ws-send! $ schema/ClientMessage :dispatch op
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'app.schema/Op
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            let
                dayjs-host $ unsafe-coerce dayjs DayjsFactoryHost
                plugin $ unsafe-coerce week-of-year JsObject
              dayjs-host .extend! plugin
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
              , &unit
            js/window.addEventListener |visibilitychange $ fn (event)
              when @*connected? $ send-activity!
              , &unit
            visibility-heartbeat
              fn ()
                when @*connected? $ ws-send! $ schema/ClientMessage :sync/heartbeat @*sync-revision
                , &unit
              , 3000
            println "|App started!"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mount-target
            option:unwrap $ query-selector |.app
          :examples $ []
          :schema $ :: 'js-ffi.browser/DomElementHost
        'on-server-data $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-server-data (data)
            match (schema/decode-server-message data)
              (:ok message)
                match message
                  (:snapshot revision store)
                    do (reset! *store store) (reset! *sync-revision revision) (ack-sync! revision)
                  (:patch base-revision revision changes) (apply-server-patch! base-revision revision changes)
                  (:effect/pong) &unit
              (:err error)
                js-ffi.shared/console-error! $ str-spaced "|Invalid server message:" error
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
        'recover-connection! $ %{} 'CodeEntry
          :doc "|Apply the typed browser recovery policy to the retained ws-edn client."
          :code $ quote $ defn recover-connection! ()
            let
                navigator-node $ unsafe-coerce js/navigator 'app.client/NavigatorConnectionHost
                visible? $ match (js-ffi.browser/visibility-state)
                  (:visible) true
                  _ false
                online? $ .-onLine navigator-node
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
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (some? client-errors)
              hud! |error $ str client-errors
              do (hud! |inactive nil) (remove-watch *store :changes) (remove-watch *states :changes) (clear-cache!) (render-app!)
                add-watch *store :changes $ fn (store prev) (render-app!)
                add-watch *states :changes $ fn (states prev) (render-app!)
                ws-set-on-data! on-server-data
                println "|Code updated."
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render! mount-target
              comp-container (&map:get @*states :states) @*store
              , dispatch!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'request-snapshot! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-snapshot! ()
            ws-send! $ schema/ClientMessage :sync/resume @*sync-revision
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'send-activity! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn send-activity! ()
            if (activity/page-visible?)
              ws-send! $ schema/ClientMessage :sync/active @*sync-revision
              ws-send! $ schema/ClientMessage :sync/idle @*sync-revision
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'simulate-login! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn simulate-login! ()
            let
                raw $ js/localStorage.getItem $ &map:get config/site :storage-key
              if (js-present? raw)
                do (println "|Found storage.")
                  match
                    schema/decode-operation $ :: :user/log-in $ parse-cirru-edn (unsafe-coerce raw 'String)
                    (:ok op) (dispatch! op)
                    (:err _) (println "|Invalid saved login credentials")
                println "|Found no storage."
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'validate-server-patch $ %{} 'CodeEntry
          :doc "|Apply one validated patch batch only when its base revision matches the local state."
          :code $ quote $ defn validate-server-patch (store local-revision base-revision changes)
            if (= base-revision local-revision)
              match
                patch-batch:apply-to
                  assert-traits (patch-batch changes) PatchBatchOps
                  , store
                (:ok next-store) (%ok next-store)
                (:err error)
                  %err $ ClientPatchError :invalid-patch error
              %err $ ClientPatchError :revision-mismatch base-revision local-revision
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'T 'Number 'Number $ :: 'List 'recollect.schema/change-op
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result 'T 'app.client/ClientPatchError
          :tests $ []
            %{} 'TestEntry (:name |accepts-valid-revisioned-patch)
              :code $ quote $ let
                  store $ {} $ :value 1
                  changes $ [] $ %:: patch-schema/change-op :assoc :value 2
                assert=
                  %ok $ {} $ :value 2
                  validate-server-patch store 7 7 changes
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-revision-mismatch)
              :code $ quote $ let
                  store $ {} $ :value 1
                  changes $ [] $ %:: patch-schema/change-op :assoc :value 2
                assert=
                  %err $ %:: ClientPatchError :revision-mismatch 8 7
                  validate-server-patch store 7 8 changes
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patch-atomically)
              :code $ quote $ let
                  store $ {} $ :stable 1
                  changes $ [] (%:: patch-schema/change-op :assoc :temporary 2)
                    %:: patch-schema/change-op :update :missing $ %:: patch-schema/change-op :replace 3
                  expected $ %err $ %:: ClientPatchError :invalid-patch
                    %:: PatchError :missing-node $ [] $ %:: PatchPathSegment :field :missing
                assert= expected $ validate-server-patch store 9 9 changes
                assert=
                  {} $ :stable 1
                  , store
              :tags $ #{} :client
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.client
          :require
            respo.core :refer $ render! clear-cache! realize-ssr!
            respo.cursor :refer $ update-states
            app.comp.container :refer $ comp-container
            app.schema :as schema
            app.config :as config
            ws-edn.client :refer $ ws-connect! ws-send! ws-set-on-data! WsClientOps
            cumulo-util.core :refer $ on-page-touch visibility-heartbeat
            |url-parse :default url-parse
            |bottom-tip :default hud!
            |./calcit.build-errors :default client-errors
            |dayjs :default dayjs
            |dayjs/plugin/weekOfYear :default week-of-year
            recollect.schema :as patch-schema
            cumulo-util.activity :as activity
            recollect.patch :refer $ patch-batch patch-batch:apply-to PatchBatchOps PatchError PatchPathSegment patch-error-message
            js-ffi.browser :refer $ query-selector
            js-ffi.shared :refer $ console-warn! console-error!
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container (states store)
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
                        option:unwrap-or
                          get-in router $ [] :data :tasks
                          {}
                      :history $ comp-history (>> states :history)
                        option:unwrap-or
                          get-in router $ [] :data :week
                          {}
                        option:unwrap-or
                          get-in router $ [] :data :tasks
                          {}
                      :notes $ comp-notes-page (>> states :notes) (&map:get router :data)
                        option:unwrap-or
                          get-in session $ [] :router :data
                          {}
                      :profile $ comp-profile (&map:get store :user) (&map:get router :data)
                    comp-login $ >> states :login
                  comp-status-color $ &map:get store :color
                  when dev? $ comp-inspect |Store store $ {} (:bottom 0) (:left 0) (:z-index 9999)
                  comp-messages (&map:get session :messages) ({})
                    fn (info d!)
                      match
                        schema/decode-operation $ :: :session/remove-message info
                        (:ok op) (d! op)
                        (:err _) &unit
                  when dev? $ comp-reel (&map:get store :reel-length) ({})
              (:: :initial) (comp-offline :initial)
              (:: :offline) (comp-offline :offline)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] 'Dynamic 'Dynamic
        'comp-offline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-offline (state)
            div
              {} $ :class-name css-offline
              div $ {} $ :style
                {} $ :height 0
              div $ {} $ :style
                {}
                  :background-image $ str "|url(" (&map:get config/site :icon) "|)"
                  :width 128
                  :height 128
                  :background-size :contain
              span
                {}
                  :style $ {} $ :cursor :pointer
                  :on-click $ fn (e d!)
                    d! $ :: :effect/connect
                <>
                  if (= :initial state) |Loading... "|Socket broken! Click to retry."
                  {} (:font-family ui/font-fancy) (:font-weight 100) (:font-size 24)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] 'Tag
        'comp-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-status-color (color)
            div $ {} (:class-name css-status-color)
              :style $ {} $ :background-color color
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] 'String
        'css-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-container
            {} $ |$0 $ merge ui/global ui/fullscreen ui/column
          :examples $ []
          :schema $ :: 'String
        'css-offline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-offline
            {} $ |$0 offline-style
          :examples $ []
          :schema $ :: 'String
        'css-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-status-color
            {}
              |$0 $ {} (:width 16) (:height 16) (:position :absolute) (:bottom 16) (:right 8) (:border-radius |8px) (:opacity 0.8) (:transition-duration |200ms) (:opacity 0.5)
              |$0:hover $ {} $ :opacity 0.7
          :examples $ []
          :schema $ :: 'String
        'offline-style $ %{} 'CodeEntry
          :doc "|Composes the heterogeneous offline page style before defstyle expansion."
          :code $ quote $ def offline-style
            merge-styles ui/global ui/fullscreen ui/column-dispersive $ {} $ :background-color (&map:get config/site :theme)
          :examples $ []
          :schema $ :: 'Map 'Tag 'Dynamic
        'style-body $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-body
            {} $ :padding "|8px 16px"
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require
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
          :code $ quote $ defcomp comp-done-task (states task)
            let
                cursor $ &map:get states :cursor
                state $ or (&map:get states :data)
                  {} $ :show-menu? false
                finished-time $ match
                  decode-timestamp $ &map:get task :finished-time
                  (:ok value) value
                  (:err message) (raise message)
                task-id $ decode-map-as (&map:get task :id) 'String
              div
                {} (:class-name css-done-task)
                  :style $ merge-styles
                    {} $ :padding "|4px 8px"
                    if (&map:get state :show-menu?)
                      {} $ :background-color $ hsl 0 0 94
                      {}
                  :on-click $ fn (e d!)
                    d! $ :: :states cursor $ assoc state :show-menu? true
                <> (format-timestamp finished-time |HH:mm)
                  {} (:min-width 32)
                    :color $ hsl 0 0 80
                    :font-size 12
                    :display :inline-block
                =< 4 nil
                span
                  {} $ :style $ merge-styles ui/flex
                    {} $ :line-height |24px
                  <> $ &map:get task :text
                comp-modal-menu
                  {} (:title |Operations)
                    :style $ {} $ :width 320
                    :items $ [] $ :: :item :put-back "|Put back"
                  &map:get state :show-menu?
                  fn (d!)
                    d! $ :: :states cursor $ assoc state :show-menu? false
                  fn (item d!)
                    d! $ :: :states cursor $ assoc state :show-menu? false
                    when
                      = :put-back $ option:unwrap-or (nth item 1) :unknown
                      d! $ :: :task/put-back task-id
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'Tag 'Dynamic)
        'comp-history $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-history (states data finished-tasks)
            let
                year $ &map:get data :year
                week $ &map:get data :week
              div
                {} (:class-name css/flex)
                  :style $ {} (:padding "|16px 16px") (:overflow :auto)
                div
                  {} $ :style $ {} (:max-width 800) (:margin :auto)
                  div
                    {} (:class-name css/row-parted)
                      :style $ {} $ :margin "|8px 0"
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
                          d! $ schema/route-operation $ {} (:name :history)
                            :data $ let
                                change-year? $ <= week 1
                                y $ if change-year? (dec year) year
                                w $ if change-year? 53 $ dec week
                                bounds $ week-bounds y w
                              {} (:year y) (:week w)
                                :start $ :start bounds
                                :end $ :end bounds
                      =< 8 nil
                      comp-icon :arrow-right
                        {} (:font-size 16)
                          :color $ hsl 200 80 80
                          :cursor :pointer
                        fn (e d!)
                          d! $ schema/route-operation $ {} (:name :history)
                            :data $ let
                                change-year? $ >= week 53
                                y $ if change-year? (inc year) year
                                w $ if change-year? 1 $ inc week
                                bounds $ week-bounds y w
                              {} (:year y) (:week w)
                                :start $ :start bounds
                                :end $ :end bounds
                  if (empty? finished-tasks)
                    div
                      {} (:class-name css/center)
                        :style $ {} $ :height 80
                      <> "|No tasks." $ {} (:font-family ui/font-fancy)
                        :color $ hsl 0 0 80
                    let
                        grouped-tasks $ -> finished-tasks (&map:vals)
                          group-by $ fn (task)
                            let
                                timestamp $ match
                                  decode-timestamp $ &map:get task :finished-time
                                  (:ok value) value
                                  (:err message) (raise message)
                              format-timestamp timestamp |YYYY-MM-DD
                      list-> ({})
                        -> grouped-tasks (&map:keys) (&set:to-list)
                          sort $ fn (x y)
                            &compare
                              option:unwrap-or (first y) |
                              option:unwrap-or (first x) |
                          map $ fn (date-string)
                            let
                                task-list $ &map:get grouped-tasks date-string
                              [] date-string $ div
                                {} (:class-name css/column)
                                  :style $ {} $ :margin-top 16
                                let
                                    labels $ date-labels date-string
                                  div
                                    {} $ :class-name css/row-parted
                                    span
                                      {} $ :class-name css/font-fancy
                                      <> $ :weekday labels
                                      =< 12 nil
                                      <> $ :month-day labels
                                =< nil 4
                                list-> ({})
                                  -> task-list
                                    &list:sort-by $ fn (task)
                                      negate $ &map:get task :finished-time
                                    map $ fn (task)
                                      [] (&map:get task :id)
                                        comp-done-task
                                          >> states $ &map:get task :id
                                          , task
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'Tag 'Dynamic)
              :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
        'css-done-task $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-done-task
            {}
              |$0 $ {} $ :transition-duration |200ms
              |$0:hover $ {} $ :background-color
                hsl 0 0 80 $ %some 0.2
          :examples $ []
          :schema $ :: 'String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.history
          :require
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
            app.comp.navigation :refer $ format-timestamp decode-timestamp week-bounds date-labels
            app.schema :as schema
    'app.comp.login $ %{} 'FileEntry
      :defs $ {}
        'comp-login $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-login (states)
            let
                cursor $ &map:get states :cursor
                state $ or (&map:get states :data) initial-state
              div
                {} $ :style $ style/merge-styles ui/flex ui/center
                div ({})
                  div
                    {} $ :style $ {}
                    div ({})
                      input $ {} (:placeholder |Username)
                        :value $ &map:get state :username
                        :style ui/input
                        :on-input $ fn (e d!)
                          d! $ :: :states cursor $ assoc state :username
                            str $ &map:get e :value
                    =< nil 8
                    div ({})
                      input $ {} (:placeholder |Password)
                        :value $ &map:get state :password
                        :style ui/input
                        :on-input $ fn (e d!)
                          d! $ :: :states cursor $ assoc state :password
                            str $ &map:get e :value
                  =< nil 8
                  div
                    {} $ :style $ {} (:text-align :right)
                    span $ {} (:inner-text "|Sign up")
                      :style $ merge style/link
                      :on-click $ on-submit (&map:get state :username) (&map:get state :password) true
                    =< 8 nil
                    span $ {} (:inner-text "|Log in")
                      :style $ merge style/link
                      :on-click $ on-submit (&map:get state :username) (&map:get state :password) false
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'initial-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def initial-state
            {} (:username |) (:password |)
          :examples $ []
          :schema $ :: 'Map 'Tag 'String
        'on-submit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-submit (username password signup?)
            fn (e dispatch!)
              dispatch! $ if signup?
                :: :user/sign-up $ [] username password
                :: :user/log-in $ [] username password
              storage-set! (&map:get config/site :storage-key)
                format-cirru-edn $ [] username password
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String 'String 'Bool
            :return $ :: 'Fn $ {} (:return 'Unit)
              :args $ [] (:: 'Map 'Tag 'Dynamic)
                :: 'Fn $ {} (:return 'Unit)
                  :args $ [] 'app.schema/Op
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.login
          :require
            [] respo.core :refer $ [] defcomp <> div input button span
            [] respo.comp.space :refer $ [] =<
            [] respo.comp.inspect :refer $ [] comp-inspect
            [] respo-ui.core :as ui
            [] app.schema :as schema
            [] app.style :as style
            [] app.config :as config
            js-ffi.browser :refer $ storage-set!
    'app.comp.navigation $ %{} 'FileEntry
      :defs $ {}
        'DateLabels $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct DateLabels (:weekday 'String) (:month-day 'String) (:week 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'DayjsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DayjsHost
            .month $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost
              :return 'Number
            .year $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost
              :return 'Number
            .week $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost
              :return 'Number
            .with-year $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost 'Number
              :return 'app.comp.navigation/DayjsHost
            .with-week $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost 'Number
              :return 'app.comp.navigation/DayjsHost
            .start-of $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost 'String
              :return 'app.comp.navigation/DayjsHost
            .end-of $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost 'String
              :return 'app.comp.navigation/DayjsHost
            .format $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost 'String
              :return 'String
            .valid? $ :: 'Fn $ {}
              :args $ [] 'app.comp.navigation/DayjsHost
              :return 'Bool
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :names $ {} (:end-of |endOf) (:start-of |startOf) (:valid? |isValid) (:with-week |week) (:with-year |year)
          :schema $ :: 'Trait
        'WeekBounds $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct WeekBounds (:start 'String) (:end 'String)
          :examples $ []
          :schema $ :: 'StructDef
        'comp-navigation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-navigation (logged-in? count-members page)
            div
              {} $ :class-name css-navbar
              div
                {} (:class-name css/row-parted)
                  :style $ {} (:max-width 840) (:width |100%) (:margin :auto)
                div
                  {} $ :class-name css/row-center
                  render-entry |Timegrass
                    fn () $ {} $ :name :home
                    = page :home
                  =< 16 nil
                  render-entry |Finished current-history-route $ = page :history
                  =< 16 nil
                  render-entry |Notes current-notes-route $ = page :notes
                div
                  {}
                    :style $ {} (:cursor |pointer) (:user-select :none)
                    :tab-index 0
                    :on-click $ fn (e d!)
                      d! $ schema/route-operation $ {} (:name :profile)
                  <> $ if logged-in? |Me |Guest
                  =< 8 nil
                  <> $ str count-members
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] 'Bool 'Number 'Tag
        'css-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-entry
            {}
              |$0 $ {} (:opacity 0.6) (:user-select :none) (:transition-duration |200ms)
              |$0:hover $ {} $ :opacity 0.8
          :examples $ []
          :schema $ :: 'String
        'css-navbar $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-navbar
            {} $ |$0 $ merge ui/row-center
              {} (:height 48) (:padding "|0 16px") (:font-size 16)
                :border-bottom $ str "|1px solid " $ hsl 0 0 0 (%some 0.1)
                :font-family ui/font-fancy
                :background-color $ &map:get config/site :theme
                :color :white
          :examples $ []
          :schema $ :: 'String
        'current-history-route $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn current-history-route ()
            let
                now $ unsafe-coerce (dayjs) 'app.comp.navigation/DayjsHost
                start-day $ .start-of now |week
                end-day $ .end-of now |week
              {} (:name :history)
                :data $ {}
                  :year $ .year now
                  :week $ .week now
                  :start $ .format start-day date-time-format
                  :end $ .format end-day date-time-format
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
            :features $ #{} :js-ffi
            :return $ :: 'Map 'Tag 'Dynamic
        'current-notes-route $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn current-notes-route ()
            let
                now $ unsafe-coerce (dayjs) 'app.comp.navigation/DayjsHost
              {} (:name :notes)
                :data $ {}
                  :year $ .year now
                  :month $ .month now
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
            :features $ #{} :js-ffi
            :return $ :: 'Map 'Tag 'Dynamic
        'date-labels $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn date-labels (date-string)
            let
                host $ unsafe-coerce (dayjs date-string) 'app.comp.navigation/DayjsHost
              if (.valid? host)
                DateLabels :weekday (.format host |ddd) :month-day (.format host |MM-DD) :week $ .week host
                raise |Invalid-dayjs-date
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.comp.navigation/DateLabels)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'date-time-format $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def date-time-format "|YYYY-MM-DDTHH:mm:ss ZZ"
          :examples $ []
          :schema $ :: 'String
        'decode-timestamp $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-timestamp (input) (try-decode-map-as input 'Number)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Input
            :generics $ [] 'Input
            :return $ :: 'calcit.core/Result 'Number 'String
          :tests $ []
            %{} 'TestEntry (:name |accepts-number)
              :code $ quote $ assert= true
                result:ok? $ decode-timestamp 1735689600000
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-non-number)
              :code $ quote $ assert= true
                result:err? $ decode-timestamp |invalid
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-nil)
              :code $ quote $ assert= true
                result:err? $ decode-timestamp nil
              :tags $ #{} :unit
        'format-timestamp $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn format-timestamp (timestamp pattern)
            let
                host $ unsafe-coerce (dayjs timestamp) 'app.comp.navigation/DayjsHost
              if (.valid? host) (.format host pattern) (raise |Invalid-dayjs-timestamp)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'Number 'String
            :features $ #{} :js-ffi
        'render-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-entry (title get-route highlighted?)
            div
              {} (:class-name css-entry)
                :style $ merge-styles
                  {} $ :cursor :pointer
                  if highlighted?
                    {} $ :opacity 1
                    {}
                :on-click $ fn (e d!)
                  d! $ schema/route-operation $ get-route
                :tab-index 0
              <> title nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Element)
            :args $ [] 'String
              :: 'Fn $ {} (:return 'Dynamic)
                :args $ []
              , 'Bool
        'week-bounds $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn week-bounds (year week)
            let
                base $ unsafe-coerce (dayjs) 'app.comp.navigation/DayjsHost
                year-day $ .with-year base year
                target $ .with-week year-day week
                start $ .start-of target |week
                end $ .end-of target |week
              if
                and (.valid? start) (.valid? end)
                WeekBounds :start (.format start date-time-format) :end $ .format end date-time-format
                raise |Invalid-dayjs-week
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.comp.navigation/WeekBounds)
            :args $ [] 'Number 'Number
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.navigation
          :require
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
            app.schema :as schema
    'app.comp.notes-page $ %{} 'FileEntry
      :defs $ {}
        'comp-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-note (states note)
            let
                edit-plugin $ use-prompt (>> states :edit)
                  {} (:text "|Update note:") (:multiline? true)
                    :initial $ &map:get note :text
                remove-plugin $ use-confirm (>> states :remove)
                  {} $ :text "|Sure to delete note?"
                note-time $ match
                  decode-timestamp $ &map:get note :time
                  (:ok value) value
                  (:err message) (raise message)
              div
                {}
                  :class-name $ str-spaced css/column css-note
                  :style $ {}
                    :border-top $ str "|1px solid " $ hsl 0 0 94
                    :padding "|4px 8px"
                div
                  {} $ :class-name css/row-parted
                  <> (format-timestamp note-time |HH:mm)
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
                          d! $ :: :note/edit $ schema/NoteEdit :id
                            decode-map-as (&map:get note :id) 'String
                            , :text (decode-map-as result 'String)
                    =< 8 nil
                    comp-icon :delete
                      &{} :font-size 16 :cursor :pointer :color $ hsl 10 80 60
                      fn (e d!)
                        .show remove-plugin d! $ fn () $ d!
                          :: :note/remove $ decode-map-as (&map:get note :id) 'String
                <> $ &map:get note :text
                .render edit-plugin
                .render remove-plugin
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'Tag 'Dynamic)
        'comp-notes-page $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-notes-page (states notes info)
            let
                year $ &map:get info :year
                month $ &map:get info :month
                add-plugin $ use-prompt (>> states :add)
                  {} (:text "|Add note about today's work:") (:multiline? true)
              div
                {} (:class-name css/expand)
                  :style $ {} $ :padding 16
                div
                  {} $ :style $ {} (:max-width 800) (:margin :auto)
                  div
                    {} (:class-name css/row-parted)
                      :style $ {} $ :margin "|8px 0"
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
                          .show add-plugin d! $ fn (result)
                            d! $ :: :note/add result
                    div
                      {} $ :class-name css/row-middle
                      comp-icon :arrow-left
                        {} (:font-size 16)
                          :color $ hsl 200 80 80
                          :cursor :pointer
                        fn (e d!)
                          d! $ schema/route-operation $ {} (:name :notes)
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
                          d! $ schema/route-operation $ {} (:name :notes)
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
                        :style $ {} $ :min-height 120
                      <> "|No notes" $ {} (:font-family ui/font-fancy)
                        :color $ hsl 0 0 80
                    let
                        grouped-notes $ -> notes (&map:keys) (&set:to-list)
                          group-by $ fn (note-key)
                            let
                                note $ &map:get notes note-key
                                note-time $ match
                                  decode-timestamp $ &map:get note :time
                                  (:ok value) value
                                  (:err message) (raise message)
                              format-timestamp note-time |MM-DD
                      list-> ({})
                        -> grouped-notes (&map:keys) (&set:to-list)
                          sort $ fn (x y) (&compare y x)
                          map $ fn (date)
                            let
                                notes-in-day $ &map:get grouped-notes date
                              [] date $ div
                                {} $ :style $ {} (:margin-top 16)
                                div
                                  {} (:class-name css/font-fancy)
                                    :style $ {} (:font-size 14) (:font-weight 500)
                                  <> $ :weekday $ app.comp.navigation/date-labels (str year |- date)
                                  =< 12 nil
                                  <> $ str date
                                list->
                                  {} $ :class-name css/column
                                  -> notes-in-day
                                    &list:sort-by $ fn (note-key)
                                      let
                                          note $ &map:get notes note-key
                                          note-time $ match
                                            decode-timestamp $ &map:get note :time
                                            (:ok value) value
                                            (:err message) (raise message)
                                        negate note-time
                                    map $ fn (k)
                                      [] k $ comp-note (>> states k) (&map:get notes k)
                  =< nil 160
                .render add-plugin
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic)
              :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
              :: 'Map 'Tag 'Number
        'css-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-note
            {}
              |$0 $ {} $ :transition-duration |200ms
              |$0:hover $ {} $ :background-color
                hsl 0 0 80 $ %some 0.2
          :examples $ []
          :schema $ :: 'String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.notes-page
          :require
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
            app.comp.navigation :refer $ format-timestamp decode-timestamp
    'app.comp.overview $ %{} 'FileEntry
      :defs $ {}
        'comp-global-keydown $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-global-keydown (on-event)
            span $ {} $ :on-keydown
              fn (e d!) (on-event e d!) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] (:: 'Map 'Tag 'Dynamic)
                  :: 'Fn $ {} (:return 'Unit)
                    :args $ [] 'app.schema/Op
        'comp-no-tasks $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-no-tasks ()
            div
              {}
                :class-name $ str-spaced css/center css/font-fancy
                :style $ {} $ :color (hsl 0 0 80)
              <> "|No tasks"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ []
        'comp-overview $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-overview (states today tasks)
            let
                working-tasks $ -> tasks (identity)
                  filter $ fn (pair)
                    not $ &map:get
                        last pair
                        , .unwrap
                      , :pending?
                pending-tasks $ -> tasks (identity)
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
                today-labels $ app.comp.navigation/date-labels today
              div
                {} (:class-name css/expand)
                  :style $ {} $ :padding 16
                div
                  {} $ :style $ {} (:max-width 800) (:margin :auto)
                  div
                    {} $ :class-name css/row-parted
                    comp-title |Doing
                      %some $ comp-icon :plus
                        &{} :font-size 14 :color (hsl 200 80 80) :cursor :pointer
                        fn (e d!)
                          .show create-plugin d! $ fn (result)
                            d! $ :: :task/create-working $ decode-map-as result 'String
                            , &unit
                          , &unit
                      assert-type (%none)
                        :: 'Option $ :: 'Fn $ {} (:return 'Unit)
                          :args $ [] (:: 'Map 'Tag 'Dynamic)
                            :: 'Fn $ {} (:return 'Unit)
                              :args $ [] 'app.schema/Op
                    comp-global-keydown $ fn (e d!)
                      when
                        and (&map:get e :meta?)
                          = |i $ &map:get e :key
                        .show create-plugin d! $ fn (result)
                          d! $ :: :task/create-working $ decode-map-as result 'String
                          , &unit
                      , &unit
                    div
                      {}
                        :class-name $ str-spaced css/row-middle css/font-fancy
                        :style $ {} $ :color (hsl 0 0 60)
                      <> $ :weekday today-labels
                      =< 8 nil
                      <> $ str (:week today-labels) "|th week"
                      =< 16 nil
                      <> today
                  if (empty? working-tasks) (comp-no-tasks)
                    list-> ({})
                      -> working-tasks (&map:to-list)
                        &list:sort-by $ fn (pair)
                          let
                              task $
                                last pair
                                , .unwrap
                            negate $ or (&map:get task :touched-time) (&map:get task :created-time)
                        &list:map-pair $ fn (k task)
                          [] k $ comp-task
                            >> states $ &map:get task :id
                            , task :working
                  when
                    not $ empty? pending-tasks
                    div ({})
                      comp-title |Later
                        assert-type (%none) (:: 'Option 'respo.schema/Component)
                        %some $ fn (e d!)
                          d! $ :: :states cursor $ update state :show-later? not
                          , &unit
                      if (&map:get state :show-later?)
                        list-> ({})
                          -> pending-tasks (&map:to-list)
                            &list:sort-by $ fn (pair)
                              let
                                  task $
                                    last pair
                                    , .unwrap
                                negate $ or (&map:get task :touched-time) (&map:get task :created-time)
                            &list:map-pair $ fn (k task)
                              [] k $ comp-task
                                >> states $ &map:get task :id
                                , task :pending
                        div
                          {}
                            :style $ {} $ :font-size 16
                            :on-click $ fn (e d!)
                              d! $ :: :states cursor $ update state :show-later? not
                              , &unit
                          <>
                            str (count pending-tasks) "| future tasks. Click to show."
                            {} (:font-family ui/font-fancy) (:font-weight 300) (:cursor :pointer)
                  .render create-plugin
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'String $ :: 'Map 'String (:: 'Map 'Tag 'Dynamic)
        'comp-task $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-task (states task mode)
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
                task-id $ decode-map-as (&map:get task :id) 'String
              div
                {} (:class-name css-task-base)
                  :style $ merge $ if (&map:get state :menu?)
                    {} $ :background-color $ hsl 0 0 94
                    {}
                  :on-click $ fn (e d!)
                    d! $ :: :states cursor $ assoc state :menu? true
                    , &unit
                  :on $ {} $ :dragend
                    fn (e d!)
                      d! $ :: :task/touch-working task-id
                      , &unit
                  :draggable true
                div
                  {} $ :style ui/flex
                  <> (&map:get task :text) ({})
                comp-modal-menu
                  {} (:title |Operations)
                    :style $ {} $ :width 320
                    :items $ [] (:: :item :done |Done)
                      :: :item :pend $ if (= mode :pending) "|Do it now" "|Do it later"
                      :: :item :touch |Up
                      :: :item :copy |Copy
                      :: :item :edit |Edit
                      :: :item :remove |Remove
                  &map:get state :menu?
                  fn (d!)
                    d! $ :: :states cursor $ assoc state :menu? false
                    , &unit
                  fn (item d!)
                    let
                        new-state $ assoc state :menu? false
                        result $ task-menu-action item
                      case-default result
                        d! $ :: :states cursor new-state
                        :done $ do
                          d! $ :: :task/finish-working task-id
                          d! $ :: :states cursor new-state
                        :edit $ do
                          d! $ :: :states cursor new-state
                          .show update-plugin d! $ fn (text)
                            d! $ :: :task/update-working $ schema/TaskEdit :id task-id :text (decode-map-as text 'String)
                            , &unit
                        :copy $ do
                          copy! $ &map:get task :text
                          d! $ :: :states cursor new-state
                        :remove $ do
                          d! $ :: :states cursor new-state
                          .show delete-plugin d! $ fn ()
                            d! $ :: :task/remove-working task-id
                            , &unit
                          , &unit
                        :pend $ do
                          d! $ :: :task/pend task-id
                          d! $ :: :states cursor new-state
                        :touch $ do
                          d! $ :: :task/touch-working task-id
                          d! $ :: :states cursor new-state
                      , &unit
                .render update-plugin
                .render delete-plugin
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'Tag 'Dynamic) 'Tag
        'comp-title $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-title (title child on-click)
            div
              {} (:class-name css-title)
                :style $ if (option:some? on-click)
                  {} $ :cursor :pointer
                :on-click $ fn (e d!)
                  when (option:some? on-click)
                    (option:unwrap on-click) e d!
                  , &unit
              <> title
              =< 16 nil
              match child
                (:some content) content
                (:none) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] 'String (:: 'calcit.core/Option 'respo.schema/Component)
              :: 'calcit.core/Option $ :: 'Fn $ {} (:return 'Unit)
                :args $ [] (:: 'Map 'Tag 'Dynamic)
                  :: 'Fn $ {} (:return 'Unit)
                    :args $ [] 'app.schema/Op
          :tests $ []
            %{} 'TestEntry (:name |absent-handler)
              :code $ quote $ let
                  component $ comp-title |Title
                  tree $ .unwrap $ :tree component
                assert-type tree respo.schema/Element
                assert= 0 $ .count $ :style tree
                assert= 2 $ .count $ :children tree
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |explicit-none)
              :code $ quote $ let
                  component $ comp-title |Title (%none) (%none)
                  tree $ .unwrap $ :tree component
                assert-type tree respo.schema/Element
                assert= 0 $ .count $ :style tree
                assert= 2 $ .count $ :children tree
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |callback-once)
              :code $ quote $ let
                  evaluations $ atom 0
                  calls $ atom 0
                  handler $ fn (e d!)
                    reset! calls $ inc @calls
                  dispatch! $ fn (op) &unit
                hint-fn handler $ {}
                  :return $ quote Unit
                  :args $ []
                    :: (quote Map) (quote Tag) (quote Dynamic)
                    :: (quote Fn)
                      {}
                        :return $ quote Unit
                        :args $ [] $ quote app.schema/Op
                hint-fn dispatch! $ {}
                  :args $ [] $ quote app.schema/Op
                  :return $ quote Unit
                let
                    component $ comp-title |Title (%none)
                      do
                        reset! evaluations $ inc @evaluations
                        %some handler
                    tree $ .unwrap $ :tree component
                  assert-type tree respo.schema/Element
                  assert= 1 @evaluations
                  assert= 0 @calls
                  let
                      click $ .unwrap $ .get (:event tree) :click
                    click ({}) dispatch!
                    assert= 1 @calls
                    click ({}) dispatch!
                    assert= 2 @calls
                    assert= 1 @evaluations
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |child-once)
              :code $ quote $ let
                  evaluations $ atom 0
                  component $ comp-title |Parent $ %some
                    do
                      reset! evaluations $ inc @evaluations
                      comp-title |Child
                  tree $ .unwrap $ :tree component
                assert-type tree respo.schema/Element
                assert= 1 @evaluations
                assert= 3 $ .count $ :children tree
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |legacy-empty-handler-values)
              :code $ quote $ let
                  evaluations $ atom 0
                  old-nil $ do
                    reset! evaluations $ inc @evaluations
                    , nil
                  old-false $ do
                    reset! evaluations $ inc @evaluations
                    , false
                  dispatch! $ fn (op) (raise |Unexpected-dispatch)
                hint-fn dispatch! $ {}
                  :args $ [] $ quote app.schema/Op
                  :return $ quote Unit
                assert= true $ nil? old-nil
                assert= false old-false
                assert= false $ fn? old-nil
                assert= false $ fn? old-false
                let
                    component $ comp-title |Title (%none) (%none)
                    tree $ .unwrap $ :tree component
                  assert-type tree respo.schema/Element
                  let
                      click $ .unwrap $ .get (:event tree) :click
                    click ({}) dispatch!
                  assert= 0 $ .count $ :style tree
                  assert= 2 @evaluations
              :tags $ #{} :js :title-contract
        'css-task-base $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-task-base
            {}
              |$0 $ {}
                :border-bottom $ str "|1px solid " $ hsl 0 0 90
                :line-height |24px
                :padding "|8px 8px"
                :overflow :auto
                :user-select :none
                :transition-duration |200ms
              |$0:hover $ {} $ :background-color
                hsl 0 0 80 $ %some 0.1
          :examples $ []
          :schema $ :: 'String
        'css-title $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-title
            {} $ |$0 $ merge ui/row-middle
              {} (:margin "|8px 0") (:font-family ui/font-fancy)
                :color $ hsl 0 0 50
                :font-size 16
                :font-weight 300
          :examples $ []
          :schema $ :: 'String
        'task-menu-action $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn task-menu-action (item) (&enum:nth item 1)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Tag)
            :args $ [] 'Enum
          :tests $ [] $ %{} 'TestEntry (:name |decodes-task-menu-actions)
            :code $ quote $ do
              assert |remove-action-should-be-decoded $ &= :remove $ task-menu-action (:: :item :remove |Remove)
              assert |done-action-should-be-decoded $ &= :done $ task-menu-action (:: :item :done |Done)
            :tags $ #{} :client
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.overview
          :require
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
          :code $ quote $ defcomp comp-profile (user members)
            div
              {} (:class-name css/flex)
                :style $ {} $ :padding 16
              div
                {} $ :style $ {} (:max-width 800) (:margin :auto)
                div
                  {} (:class-name css/font-fancy)
                    :style $ {} (:font-size 32) (:font-weight 100)
                  <> $ str "|Hello! " $ &map:get user :name
                =< nil 16
                div
                  {} $ :class-name css/row
                  <> |Members:
                  =< 8 nil
                  list->
                    {} $ :class-name css/row
                    -> members (&map:to-list)
                      &list:map-pair $ fn (k username)
                        [] k $ div
                          {} $ :class-name css-member-label
                          <> username
                =< nil 48
                div ({})
                  button
                    {} (:class-name css/button)
                      :on-click $ fn (e d!)
                        js-ffi.browser/location-replace! $ str
                          :origin $ js-ffi.browser/location-snapshot
                          , |?time= $ js-ffi.shared/now-ms
                        , &unit
                    <> |Refresh
                  =< 16 nil
                  button
                    {} (:class-name css/button)
                      :style $ {} (:color :red) (:border-color :red)
                      :on-click $ fn (e d!)
                        d! $ :: :user/log-out
                        js-ffi.browser/storage-remove! $ &map:get config/site :storage-key
                        , &unit
                    <> "|Log out"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'String 'String)
        'css-member-label $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-member-label
            {} $ |$0 $ {} (:padding "|0 8px")
              :border $ str "|1px solid " $ hsl 0 0 80
              :border-radius |16px
              :margin "|0 4px"
          :examples $ []
          :schema $ :: 'String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.profile
          :require
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
          :code $ quote $ def dev?
            = |dev $ option:unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ :: 'Bool
        'site $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def site
            {} (:port 11009) (:title |Timegrass) (:icon |http://cdn.tiye.me/logo/timegrass.png) (:dev-ui |http://localhost:8100/main.css) (:release-ui |http://cdn.tiye.me/favored-fonts/main.css) (:cdn-url |http://cdn.tiye.me/timegrass/) (:theme |#51C766) (:storage-key |timegrass) (:storage-file |storage.cirru)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.config
    'app.schema $ %{} 'FileEntry
      :defs $ {}
        'ClientMessage $ %{} 'CodeEntry
          :doc "|Typed browser-to-server synchronization and business envelope."
          :code $ quote $ defenum ClientMessage (:sync/active 'Number) (:sync/heartbeat 'Number) (:sync/idle 'Number) (:sync/resume 'Number) (:sync/ack 'Number) (:dispatch 'app.schema/Op)
          :examples $ []
          :schema $ :: 'Enum
        'DatabaseRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct DatabaseRecord (:today 'String)
            :users $ :: 'Map 'String 'app.schema/UserRecord
            :sessions $ :: 'Map 'Number 'app.schema/SessionRecord
          :examples $ []
          :schema $ :: 'StructDef
        'HistoryRoute $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct HistoryRoute (:year 'Number) (:week 'Number) (:start 'String) (:end 'String)
          :examples $ []
          :schema $ :: 'StructDef
        'MessageDecodeError $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum MessageDecodeError (:invalid 'String)
          :examples $ []
          :schema $ :: 'Enum
        'NoteEdit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NoteEdit (:id 'String) (:text 'String)
          :examples $ []
          :schema $ :: 'StructDef
        'NoteRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NoteRecord (:id 'String) (:text 'String) (:time 'Number)
            :updated-time $ :: 'Option 'Number
          :examples $ []
          :schema $ :: 'StructDef
        'NotesRoute $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NotesRoute (:year 'Number) (:month 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'NotificationRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NotificationRecord (:id 'String) (:text 'String)
          :examples $ []
          :schema $ :: 'StructDef
        'Op $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum Op (:today 'String) (:session/connect) (:session/disconnect) (:session/remove-message 'String)
            :user/log-in $ :: 'List 'String
            :user/sign-up $ :: 'List 'String
            :user/log-out
            :router/change 'app.schema/Route
            :task/create-working 'String
            :task/remove-working 'String
            :task/finish-working 'String
            :task/update-working 'app.schema/TaskEdit
            :task/touch-working 'String
            :task/put-back 'String
            :task/pend 'String
            :note/add 'String
            :note/edit 'app.schema/NoteEdit
            :note/remove 'String
            :effect/persist
            :effect/ping
            :effect/pong
            :effect/connect
            :states 'Dynamic 'Dynamic
          :examples $ []
          :schema $ :: 'Enum
        'Route $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum Route (:home) (:profile) (:history 'app.schema/HistoryRoute) (:notes 'app.schema/NotesRoute)
          :examples $ []
          :schema $ :: 'EnumDef
        'ServerMessage $ %{} 'CodeEntry
          :doc "|Typed server snapshot, patch, and heartbeat envelope."
          :code $ quote $ defenum ServerMessage (:snapshot 'Number 'Map)
            :patch 'Number 'Number $ :: 'List 'recollect.schema/change-op
            :effect/pong
          :examples $ []
          :schema $ :: 'Enum
        'SessionRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct SessionRecord (:id 'Number)
            :user-id $ :: 'Option 'String
            :nickname $ :: 'Option 'String
            :router 'app.schema/Route
            :messages $ :: 'Map 'String 'app.schema/NotificationRecord
          :examples $ []
          :schema $ :: 'StructDef
        'TaskEdit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct TaskEdit (:id 'String) (:text 'String)
          :examples $ []
          :schema $ :: 'StructDef
        'TaskRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct TaskRecord (:id 'String) (:text 'String) (:detail 'String) (:pending? 'Bool)
            :created-time $ :: 'Option 'Number
            :touched-time $ :: 'Option 'Number
            :finished-time $ :: 'Option 'Number
            :archived-time $ :: 'Option 'Number
          :examples $ []
          :schema $ :: 'StructDef
        'UserRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct UserRecord (:id 'String) (:name 'String)
            :nickname $ :: 'Option 'String
            :avatar $ :: 'Option 'String
            :password $ :: 'Option 'String
            :tasks 'app.schema/UserTasks
            :notes $ :: 'Map 'String 'app.schema/NoteRecord
          :examples $ []
          :schema $ :: 'StructDef
        'UserTasks $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct UserTasks
            :working $ :: 'Map 'String 'app.schema/TaskRecord
            :pending $ :: 'Map 'String 'app.schema/TaskRecord
            :finished $ :: 'Map 'String 'app.schema/TaskRecord
          :examples $ []
          :schema $ :: 'StructDef
        'add-session-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn add-session-message (db sid id text)
            update-session db sid $ fn (session-record)
              hint-fn $ {}
                :args $ [] 'app.schema/SessionRecord
                :return 'app.schema/SessionRecord
              struct-with session-record $ :messages $ assoc (:messages session-record) id (NotificationRecord :id id :text text)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'Number 'String 'String
        'complain $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def complain
            {} (:id nil) (:text |) (:time nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def database
            {}
              :sessions $ do session $ {}
              :users $ do user $ {}
              :today |2018-08-07
          :examples $ []
          :schema $ :: 'Map 'Tag 'Dynamic
        'database-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn database-to-map (db)
            {}
              :today $ :today db
              :users $ filter-map-kv (:users db)
                fn (k v)
                  MapEntryDecision :keep k $ user-to-map v
              :sessions $ filter-map-kv (:sessions db)
                fn (k v)
                  MapEntryDecision :keep k $ session-to-map v
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/DatabaseRecord
            :return $ :: 'Map 'Tag 'Dynamic
        'decode-client-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-client-message (data)
            let
                message $ if (enum? data)
                  assoc data 0 $ turn-tag $ option:unwrap (nth data 0)
                  , data
              match message
                (:sync/active revision)
                  if (number? revision)
                    %ok $ ClientMessage :sync/active revision
                    invalid-message $ str "|Expected numeric active revision, got: " revision
                (:sync/heartbeat revision)
                  if (number? revision)
                    %ok $ ClientMessage :sync/heartbeat revision
                    invalid-message $ str "|Expected numeric heartbeat revision, got: " revision
                (:sync/idle revision)
                  if (number? revision)
                    %ok $ ClientMessage :sync/idle revision
                    invalid-message $ str "|Expected numeric idle revision, got: " revision
                (:sync/resume revision)
                  if (number? revision)
                    %ok $ ClientMessage :sync/resume revision
                    invalid-message $ str "|Expected numeric resume revision, got: " revision
                (:sync/ack revision)
                  if (number? revision)
                    %ok $ ClientMessage :sync/ack revision
                    invalid-message $ str "|Expected numeric acknowledgement revision, got: " revision
                (:dispatch op)
                  match (decode-operation op)
                    (:ok typed-op)
                      %ok $ ClientMessage :dispatch typed-op
                    (:err error) (%err error)
                _ $ match (decode-operation message)
                  (:ok typed-op)
                    %ok $ ClientMessage :dispatch typed-op
                  (:err error) (%err error)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/ClientMessage 'app.schema/MessageDecodeError
          :tests $ []
            %{} 'TestEntry (:name |decodes-sync-control)
              :code $ quote $ assert=
                %:: Result :ok $ %:: ClientMessage :sync/ack 7
                decode-client-message $ :: :sync/ack 7
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-legacy-direct-op)
              :code $ quote $ assert=
                %:: Result :ok $ %:: ClientMessage :dispatch $ %:: Op :effect/ping
                decode-client-message $ %:: Op :effect/ping
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-invalid-revision)
              :code $ quote $ match
                decode-client-message $ :: :sync/active |bad
                (:err error)
                  match error $
                    :invalid detail
                    starts-with? detail "|Expected numeric active revision"
                _ false
              :tags $ #{} :server
            %{} 'TestEntry (:name |decodes-named-wire-operation)
              :code $ quote $ assert=
                %:: Result :ok $ %:: ClientMessage :dispatch $ %:: Op :effect/ping
                decode-client-message $ parse-cirru-edn "|%:: 'ClientMessage 'dispatch $ %:: 'Op 'effect/ping"
              :tags $ #{} :server
        'decode-database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-database (raw)
            if (map? raw)
              let
                  today $ &map:get raw :today
                  sessions $ &map:get raw :sessions
                  users $ &map:get raw :users
                cond
                    and (contains? raw :today)
                      not $ string? today
                    %err "|storage.cirru/:today expected String"
                  (and (contains? raw :sessions) (not (map? sessions)))
                    %err "|storage.cirru/:sessions expected Map"
                  (and (contains? raw :users) (not (map? users)))
                    %err "|storage.cirru/:users expected Map"
                  true $ match
                    try-decode-map-as
                      if (nil? users) ({}) users
                      :: 'Map 'String 'Dynamic
                    (:ok users-map)
                      match (validate-stored-users users-map)
                        (:ok _)
                          %ok $ assoc
                            merge database $ decode-map-as raw $ :: 'Map 'Tag 'Dynamic
                            , :sessions $ {}
                        (:err message) (%err message)
                    (:err detail)
                      %err $ str "|storage.cirru/:users " detail
              %err "|storage.cirru expected Map"
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/database 'String
          :tests $ []
            %{} 'TestEntry (:name |defaults-missing-fields)
              :code $ quote $ match
                decode-database $ {}
                (:ok db)
                  and
                    = |2018-08-07 $ &map:get db :today
                    map? $ &map:get db :users
                    empty? $ &map:get db :sessions
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-malformed-fields)
              :code $ quote $ do
                assert= (%err "|storage.cirru expected Map") (decode-database nil)
                assert= (%err "|storage.cirru/:today expected String")
                  decode-database $ {} $ :today 3
                assert= (%err "|storage.cirru/:users expected Map")
                  decode-database $ {} $ :users []
                assert= (%err "|storage.cirru/:sessions expected Map")
                  decode-database $ {} $ :sessions nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |drops-runtime-sessions-but-keeps-users)
              :code $ quote $ match
                decode-database $ {} (:today |2026-09-25)
                  :sessions $ {} $ 1
                    {} $ :user-id |u1
                  :users $ {} $ |u1
                    {} (:id |u1) (:name |Alice)
                (:ok db)
                  and
                    = |2026-09-25 $ &map:get db :today
                    empty? $ &map:get db :sessions
                    = |Alice $ &map:get
                      &map:get (&map:get db :users) |u1
                      , :name
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |loads-legacy-edn-user-with-nested-nil)
              :code $ quote $ let
                  legacy $ {} (:today |2026-09-25)
                    :sessions $ {}
                    :users $ {} $ |u1
                      {} (:id |u1) (:name |Alice) (:nickname nil) (:avatar nil) (:password nil)
                        :notes $ {} $ |n1
                          {} (:id |n1) (:text |hello) (:time 42) (:updated-time nil)
                        :tasks $ {}
                          :working $ {} $ |t1
                            {} (:id |t1) (:text |work) (:detail |) (:pending? false) (:created-time nil)
                          :pending $ {}
                          :finished $ {}
                  persisted $ format-cirru-edn legacy
                match
                  decode-database $ parse-cirru-edn persisted
                  (:ok db)
                    let
                        users $ &map:get db :users
                        user $ &map:get users |u1
                      and
                        = |2026-09-25 $ &map:get db :today
                        empty? $ &map:get db :sessions
                        map? user
                        = |Alice $ &map:get user :name
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-nested-user-error-on-load)
              :code $ quote $ match
                decode-database $ {} $ :users
                  {} $ |u1 $ {} (:id |u1) (:name |Alice)
                    :tasks $ {}
                      :working $ {} $ |t1
                        {} (:id |t1) (:text 7) (:detail |) (:pending? false)
                      :pending $ {}
                      :finished $ {}
                (:err message)
                  starts-with? message "|storage.cirru/:users/u1:decode-map-as failed at $.tasks.working.value.text:"
                (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-nonstring-user-key)
              :code $ quote $ match
                decode-database $ {} $ :users
                  {} $ 7 $ {} (:id |u1) (:name |Alice)
                (:err message) (starts-with? message "|storage.cirru/:users ")
                (:ok _) false
              :tags $ #{} :server
        'decode-note-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-note-record (raw)
            let
                normalized $ normalize-note-record raw
              try-decode-map-as normalized NoteRecord
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'T
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result 'app.schema/NoteRecord 'String
          :tests $ []
            %{} 'TestEntry (:name |legacy-nil-update-to-option)
              :code $ quote $ match
                decode-note-record $ {} (:id |n1) (:text |hello) (:time 42) (:updated-time nil)
                (:ok note)
                  and
                    = |n1 $ :id note
                    = (%none) (:updated-time note)
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-invalid-time-with-path)
              :code $ quote $ match
                decode-note-record $ {} (:id |n1) (:text |hello) (:time |bad)
                (:err message) (starts-with? message "|decode-map-as failed at $.time:")
                (:ok _) false
              :tags $ #{} :server
        'decode-operation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-operation (data)
            let
                op $ if (enum? data)
                  assoc data 0 $ turn-tag $ option:unwrap (nth data 0)
                  , data
              match op
                (:today value)
                  match (try-decode-map-as value 'String)
                    (:ok today)
                      %ok $ Op :today today
                    (:err message)
                      invalid-message $ str "|Invalid today operation: " message
                (:session/connect)
                  %ok $ Op :session/connect
                (:session/disconnect)
                  %ok $ Op :session/disconnect
                (:session/remove-message value)
                  let
                      raw-id $ if (map? value) (&map:get value :id) value
                    match (try-decode-map-as raw-id 'String)
                      (:ok message-id)
                        %ok $ Op :session/remove-message message-id
                      (:err message)
                        invalid-message $ str "|Invalid session/remove-message operation: " message
                (:user/log-in value)
                  match
                    try-decode-map-as value $ :: 'List 'String
                    (:ok credentials)
                      if
                        = 2 $ count credentials
                        %ok $ Op :user/log-in credentials
                        invalid-message "|Invalid user/log-in operation: expected two credentials"
                    (:err message)
                      invalid-message $ str "|Invalid user/log-in operation: " message
                (:user/sign-up value)
                  match
                    try-decode-map-as value $ :: 'List 'String
                    (:ok credentials)
                      if
                        = 2 $ count credentials
                        %ok $ Op :user/sign-up credentials
                        invalid-message "|Invalid user/sign-up operation: expected two credentials"
                    (:err message)
                      invalid-message $ str "|Invalid user/sign-up operation: " message
                (:user/log-out)
                  %ok $ Op :user/log-out
                (:router/change value)
                  match (decode-route value)
                    (:ok route)
                      %ok $ Op :router/change route
                    (:err message)
                      invalid-message $ str "|Invalid router/change operation: " message
                (:task/create-working value)
                  match (try-decode-map-as value 'String)
                    (:ok text)
                      %ok $ Op :task/create-working text
                    (:err message)
                      invalid-message $ str "|Invalid task/create-working operation: " message
                (:task/remove-working value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      %ok $ Op :task/remove-working task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/remove-working operation: " message
                (:task/finish-working value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      %ok $ Op :task/finish-working task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/finish-working operation: " message
                (:task/update-working value)
                  let
                      payload $ if (struct? value) (&struct:to-map value) value
                    match (try-decode-map-as payload TaskEdit)
                      (:ok edit)
                        %ok $ Op :task/update-working edit
                      (:err message)
                        invalid-message $ str "|Invalid task/update-working operation: " message
                (:task/touch-working value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      %ok $ Op :task/touch-working task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/touch-working operation: " message
                (:task/put-back value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      %ok $ Op :task/put-back task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/put-back operation: " message
                (:task/pend value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      %ok $ Op :task/pend task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/pend operation: " message
                (:note/add value)
                  match (try-decode-map-as value 'String)
                    (:ok text)
                      %ok $ Op :note/add text
                    (:err message)
                      invalid-message $ str "|Invalid note/add operation: " message
                (:note/edit value)
                  let
                      payload $ if (struct? value) (&struct:to-map value) value
                    match (try-decode-map-as payload NoteEdit)
                      (:ok edit)
                        %ok $ Op :note/edit edit
                      (:err message)
                        invalid-message $ str "|Invalid note/edit operation: " message
                (:note/remove value)
                  match (try-decode-map-as value 'String)
                    (:ok note-id)
                      %ok $ Op :note/remove note-id
                    (:err message)
                      invalid-message $ str "|Invalid note/remove operation: " message
                (:effect/persist)
                  %ok $ Op :effect/persist
                (:effect/ping)
                  %ok $ Op :effect/ping
                (:effect/pong)
                  %ok $ Op :effect/pong
                (:effect/connect)
                  %ok $ Op :effect/connect
                (:states cursor state)
                  %ok $ Op :states cursor state
                _ $ invalid-message $ str "|Unknown application operation: " op
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/Op 'app.schema/MessageDecodeError
          :tests $ []
            %{} 'TestEntry (:name |accepts-today-string)
              :code $ quote $ assert=
                %ok $ %:: Op :today |2026-09-25
                decode-operation $ :: :today |2026-09-25
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-today-number)
              :code $ quote $ assert= true
                result:err? $ decode-operation $ :: :today 7
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-today-nil)
              :code $ quote $ assert= true
                result:err? $ decode-operation $ :: :today nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-note-add-string)
              :code $ quote $ assert=
                %ok $ %:: Op :note/add |hello
                decode-operation $ :: :note/add |hello
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-note-add-number)
              :code $ quote $ assert= true
                result:err? $ decode-operation $ :: :note/add 7
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-note-add-nil)
              :code $ quote $ assert= true
                result:err? $ decode-operation $ :: :note/add nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-note-remove-string)
              :code $ quote $ assert=
                %ok $ %:: Op :note/remove |note-1
                decode-operation $ :: :note/remove |note-1
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-note-remove-number)
              :code $ quote $ assert= true
                result:err? $ decode-operation $ :: :note/remove 7
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-note-remove-nil)
              :code $ quote $ assert= true
                result:err? $ decode-operation $ :: :note/remove nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-typed-task-text-and-ids)
              :code $ quote $ do
                assert=
                  %ok $ %:: Op :task/create-working |write-docs
                  decode-operation $ :: :task/create-working |write-docs
                assert=
                  %ok $ %:: Op :task/remove-working |task-1
                  decode-operation $ :: :task/remove-working |task-1
                assert=
                  %ok $ %:: Op :task/finish-working |task-1
                  decode-operation $ :: :task/finish-working |task-1
                assert=
                  %ok $ %:: Op :task/touch-working |task-1
                  decode-operation $ :: :task/touch-working |task-1
                assert=
                  %ok $ %:: Op :task/put-back |task-1
                  decode-operation $ :: :task/put-back |task-1
                assert=
                  %ok $ %:: Op :task/pend |task-1
                  decode-operation $ :: :task/pend |task-1
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-non-string-task-payloads)
              :code $ quote $ do
                assert= true $ result:err? $ decode-operation (:: :task/create-working nil)
                assert= true $ result:err? $ decode-operation (:: :task/remove-working 7)
                assert= true $ result:err? $ decode-operation (:: :task/finish-working nil)
                assert= true $ result:err? $ decode-operation (:: :task/touch-working 7)
                assert= true $ result:err? $ decode-operation (:: :task/put-back nil)
                assert= true $ result:err? $ decode-operation (:: :task/pend 7)
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-typed-credentials)
              :code $ quote $ do
                assert=
                  %ok $ %:: Op :user/log-in $ [] |Alice |secret
                  decode-operation $ :: :user/log-in $ [] |Alice |secret
                assert=
                  %ok $ %:: Op :user/sign-up $ [] |Alice |secret
                  decode-operation $ :: :user/sign-up $ [] |Alice |secret
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-malformed-credentials)
              :code $ quote $ do
                assert= true $ result:err? $ decode-operation
                  :: :user/log-in $ [] |Alice
                assert= true $ result:err? $ decode-operation
                  :: :user/sign-up $ [] |Alice |secret |extra
                assert= true $ result:err? $ decode-operation
                  :: :user/log-in $ [] |Alice 7
                assert= true $ result:err? $ decode-operation (:: :user/sign-up nil)
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-typed-edit-payloads)
              :code $ quote $ do
                assert=
                  %ok $ %:: Op :task/update-working $ %{} TaskEdit (:id |t1) (:text |Updated)
                  decode-operation $ :: :task/update-working $ {} (:id |t1) (:text |Updated)
                assert=
                  %ok $ %:: Op :note/edit $ %{} NoteEdit (:id |n1) (:text |Updated)
                  decode-operation $ :: :note/edit $ {} (:id |n1) (:text |Updated)
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-malformed-edit-payloads)
              :code $ quote $ do
                assert= true $ result:err? $ decode-operation
                  :: :task/update-working $ {} (:id 7) (:text |Updated)
                assert= true $ result:err? $ decode-operation
                  :: :task/update-working $ {} $ :id |t1
                assert= true $ result:err? $ decode-operation
                  :: :note/edit $ {} (:id |n1) (:text nil)
                assert= true $ result:err? $ decode-operation (:: :note/edit nil)
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-serialized-edit-structs)
              :code $ quote $ do
                assert=
                  %ok $ %:: Op :task/update-working $ %{} TaskEdit (:id |t1) (:text |Updated)
                  decode-operation $ parse-cirru-edn $ format-cirru-edn
                    %:: Op :task/update-working $ %{} TaskEdit (:id |t1) (:text |Updated)
                assert=
                  %ok $ %:: Op :note/edit $ %{} NoteEdit (:id |n1) (:text |Updated)
                  decode-operation $ parse-cirru-edn $ format-cirru-edn
                    %:: Op :note/edit $ %{} NoteEdit (:id |n1) (:text |Updated)
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-message-removal-ids)
              :code $ quote $ let
                  expected $ %ok $ Op :session/remove-message |m1
                assert= expected $ decode-operation $ :: :session/remove-message |m1
                assert= expected $ decode-operation $ :: :session/remove-message
                  {} (:id |m1) (:token nil) (:index 0)
                assert= expected $ decode-operation $ parse-cirru-edn
                  format-cirru-edn $ Op :session/remove-message |m1
              :tags $ #{} :client :server
            %{} 'TestEntry (:name |rejects-invalid-message-removal-ids)
              :code $ quote $ do
                assert= true $ result:err? $ decode-operation (:: :session/remove-message nil)
                assert= true $ result:err? $ decode-operation (:: :session/remove-message 7)
                assert= true $ result:err? $ decode-operation
                  :: :session/remove-message $ {}
                assert= true $ result:err? $ decode-operation
                  :: :session/remove-message $ {} $ :id nil
                assert= true $ result:err? $ decode-operation
                  :: :session/remove-message $ {} $ :id 7
              :tags $ #{} :client :server
            %{} 'TestEntry (:name |router-wire-compatibility)
              :code $ quote $ let
                  route $ Route :notes $ NotesRoute :year 2026 :month 8
                  operation $ Op :router/change route
                assert= (%ok operation)
                  decode-operation $ :: :router/change $ {} (:name :notes)
                    :data $ {} (:year 2026) (:month 8)
                assert= (%ok operation)
                  decode-operation $ parse-cirru-edn $ format-cirru-edn operation
                assert= true $ result:err? $ decode-operation (:: :router/change nil)
                assert= true $ result:err? $ decode-operation
                  :: :router/change $ {} (:name :notes)
                    :data $ {} (:year 2026) (:month -1)
              :tags $ #{} :client :server
        'decode-route $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-route (raw)
            if (enum? raw)
              let
                  route $ assoc raw 0 $ turn-tag
                      nth raw 0
                      , .unwrap
                match route
                  (:home)
                    %ok $ Route :home
                  (:profile)
                    %ok $ Route :profile
                  (:history data)
                    decode-route-map $ {} (:name :history)
                      :data $ if (struct? data) (&struct:to-map data) data
                  (:notes data)
                    decode-route-map $ {} (:name :notes)
                      :data $ if (struct? data) (&struct:to-map data) data
                  _ $ %err |Unknown-route
              decode-route-map raw
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/Route 'String
          :tests $ [] $ %{} 'TestEntry (:name |validates-route-shapes)
            :code $ quote $ do
              assert=
                %ok $ Route :home
                decode-route $ {} $ :name :home
              assert= true $ result:ok? $ decode-route
                {} (:name :notes)
                  :data $ {} (:year 2026) (:month 8)
              assert= true $ result:err? $ decode-route
                {} (:name :notes)
                  :data $ {} (:year 2026) (:month 12)
              assert= true $ result:err? $ decode-route
                {} (:name :history)
                  :data $ {}
              assert= true $ result:err? $ decode-route
                {} $ :name :unknown
              assert= true $ result:err? $ decode-route nil
            :tags $ #{} :server
        'decode-route-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-route-map (raw)
            let
                data $ if (struct? raw) (&struct:to-map raw) raw
              if (map? data)
                case-default (&map:get data :name) (%err |Unknown-route)
                  :home $ %ok $ Route :home
                  :profile $ %ok $ Route :profile
                  :history $ match
                    try-decode-map-as (&map:get data :data) HistoryRoute
                    (:ok route)
                      if
                        and
                          >= (:week route) 1
                          <= (:week route) 53
                          =
                            round $ :year route
                            :year route
                          =
                            round $ :week route
                            :week route
                        %ok $ Route :history route
                        %err |Invalid-history-range
                    (:err message) (%err message)
                  :notes $ match
                    try-decode-map-as (&map:get data :data) NotesRoute
                    (:ok route)
                      if
                        and
                          >= (:month route) 0
                          <= (:month route) 11
                          =
                            round $ :year route
                            :year route
                          =
                            round $ :month route
                            :month route
                        %ok $ Route :notes route
                        %err |Invalid-notes-range
                    (:err message) (%err message)
                %err |Expected-route-map
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/Route 'String
        'decode-server-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-server-message (data)
            let
                message $ if (enum? data)
                  assoc data 0 $ turn-tag $ option:unwrap (nth data 0)
                  , data
              match message
                (:snapshot revision store)
                  if
                    and (number? revision) (map? store)
                    match (try-decode-map-as store 'Map)
                      (:ok decoded-store)
                        %ok $ ServerMessage :snapshot revision decoded-store
                      (:err reason)
                        invalid-message $ str "|Invalid snapshot envelope: " reason
                    invalid-message $ str "|Invalid snapshot envelope: " message
                (:patch base-revision revision changes)
                  if
                    and (number? base-revision) (number? revision)
                    match (try-decode-map-as changes 'List)
                      (:ok decoded-list)
                        if
                          every? decoded-list $ fn (change)
                            = (enum-definition change) (%some recollect.schema/change-op)
                          %ok $ ServerMessage :patch base-revision revision $ assert-type decoded-list (:: 'List 'recollect.schema/change-op)
                          invalid-message $ str "|Invalid patch envelope: " message
                      (:err reason)
                        invalid-message $ str "|Invalid patch envelope: " reason
                    invalid-message $ str "|Invalid patch envelope: " message
                (:effect/pong)
                  %ok $ ServerMessage :effect/pong
                _ $ invalid-message $ str "|Unknown server message: " message
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/ServerMessage 'app.schema/MessageDecodeError
          :tests $ []
            %{} 'TestEntry (:name |decodes-pong)
              :code $ quote $ assert=
                %:: Result :ok $ %:: ServerMessage :effect/pong
                decode-server-message $ :: :effect/pong
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patch-payload)
              :code $ quote $ match
                decode-server-message $ :: :patch 1 2 :bad
                (:err error)
                  match error $
                    :invalid detail
                    starts-with? detail "|Invalid patch envelope"
                _ false
              :tags $ #{} :client
            %{} 'TestEntry (:name |decodes-named-wire-pong)
              :code $ quote $ assert=
                %:: Result :ok $ %:: ServerMessage :effect/pong
                decode-server-message $ parse-cirru-edn "|%:: 'ServerMessage 'effect/pong"
              :tags $ #{} :client
            %{} 'TestEntry (:name |validates-nominal-patch-list)
              :code $ quote $ assert=
                %:: Result :ok $ %:: ServerMessage :patch 3 4 $ [] (%:: recollect.schema/change-op :replace 1)
                decode-server-message $ %:: ServerMessage :patch 3 4 $ [] (%:: recollect.schema/change-op :replace 1)
              :tags $ #{} :client
            %{} 'TestEntry (:name |decodes-snapshot-map)
              :code $ quote $ assert=
                %:: Result :ok $ %:: ServerMessage :snapshot 2 $ {} (:a 1)
                decode-server-message $ %:: ServerMessage :snapshot 2 $ {} (:a 1)
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-non-nominal-change)
              :code $ quote $ assert= true
                result:err? $ decode-server-message $ %:: ServerMessage :patch 3 4
                  [] $ :: :replace 1
              :tags $ #{} :client
        'decode-task-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-task-record (raw)
            let
                normalized $ normalize-task-record raw
              try-decode-map-as normalized TaskRecord
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'T
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result 'app.schema/TaskRecord 'String
          :tests $ []
            %{} 'TestEntry (:name |legacy-nil-time-to-option)
              :code $ quote $ match
                decode-task-record $ {} (:id |x) (:text |ok) (:detail |) (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
                (:ok task)
                  and
                    = |x $ :id task
                    = (%none) (:created-time task)
                    = (%none) (:archived-time task)
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-invalid-text-with-path)
              :code $ quote $ match
                decode-task-record $ {} (:id |x) (:text 3) (:detail |) (:pending? false)
                (:err message) (starts-with? message "|decode-map-as failed at $.text:")
                (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |missing-times-become-none)
              :code $ quote $ match
                decode-task-record $ {} (:id |x) (:text |ok) (:detail |) (:pending? false)
                (:ok task)
                  and
                    = (%none) (:created-time task)
                    = (%none) (:touched-time task)
                    = (%none) (:finished-time task)
                    = (%none) (:archived-time task)
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-missing-id-with-path)
              :code $ quote $ match
                decode-task-record $ {} (:text |ok) (:detail |) (:pending? false)
                (:err message) (starts-with? message "|decode-map-as failed at $.id:")
                (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-unknown-field)
              :code $ quote $ match
                decode-task-record $ {} (:id |x) (:text |ok) (:detail |) (:pending? false) (:surprise 1)
                (:err message) (starts-with? message "|decode-map-as failed at $.surprise:")
                (:ok _) false
              :tags $ #{} :server
        'decode-user-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-user-record (raw)
            let
                normalized $ if (map? raw)
                  let
                      cleaned $ foldl ([] :nickname :avatar :password) raw $ fn (entry field)
                        if
                          nil? $ &map:get entry field
                          dissoc entry field
                          , entry
                      tasks $ &map:get cleaned :tasks
                      notes $ &map:get cleaned :notes
                      empty-tasks $ {}
                        :working $ {}
                        :pending $ {}
                        :finished $ {}
                      with-tasks $ &map:assoc cleaned :tasks $ if (nil? tasks) empty-tasks (normalize-user-tasks tasks)
                    &map:assoc with-tasks :notes $ if (nil? notes) ({}) (normalize-note-map notes)
                  , raw
              try-decode-map-as normalized UserRecord
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'T
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result 'app.schema/UserRecord 'String
          :tests $ []
            %{} 'TestEntry (:name |defaults-legacy-optional-fields)
              :code $ quote $ match
                decode-user-record $ {} (:id |u1) (:name |Alice) (:nickname nil) (:avatar nil) (:password nil)
                (:ok user)
                  and
                    = |u1 $ :id user
                    = (%none) (:password user)
                    = (%none) (:nickname user)
                    empty? $ :notes user
                    empty? $ :working $ :tasks user
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |migrates-nested-legacy-task)
              :code $ quote $ match
                decode-user-record $ {} (:id |u1) (:name |Alice)
                  :tasks $ {}
                    :working $ {} $ |t1
                      {} (:id |t1) (:text |work) (:detail |) (:pending? false) (:created-time nil)
                    :pending $ {}
                    :finished $ {}
                (:ok user)
                  = (%none)
                    :created-time $ &map:get
                      :working $ :tasks user
                      , |t1
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |migrates-nested-legacy-note)
              :code $ quote $ match
                decode-user-record $ {} (:id |u1) (:name |Alice)
                  :notes $ {} $ |n1
                    {} (:id |n1) (:text |hello) (:time 42) (:updated-time nil)
                (:ok user)
                  = (%none)
                    :updated-time $ &map:get (:notes user) |n1
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-bad-nested-task-with-path)
              :code $ quote $ match
                decode-user-record $ {} (:id |u1) (:name |Alice)
                  :tasks $ {}
                    :working $ {} $ |t1
                      {} (:id |t1) (:text 7) (:detail |) (:pending? false)
                    :pending $ {}
                    :finished $ {}
                (:err message)
                  starts-with? message "|decode-map-as failed at $.tasks.working.value.text:"
                (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |typed-edn-roundtrip)
              :code $ quote $ match
                decode-user-record $ {} (:id |u1) (:name |Alice)
                (:ok user)
                  match
                    try-parse-cirru-edn-as (format-cirru-edn user) UserRecord
                    (:ok again)
                      = |u1 $ :id again
                    (:err _) false
                (:err _) false
              :tags $ #{} :server
        'empty-database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def empty-database
            DatabaseRecord :today |2018-08-07 :users ({}) :sessions $ {}
          :examples $ []
          :schema $ :: 'app.schema/DatabaseRecord
        'invalid-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn invalid-message (detail)
            %:: Result :err $ MessageDecodeError :invalid detail
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result 'app.schema/MessageDecodeError 'T
        'load-database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-database (raw)
            match (decode-database raw)
              (:err message) (%err message)
              (:ok legacy)
                let
                    users $ decode-map-as (&map:get legacy :users) (:: 'Map 'String 'Dynamic)
                    decoded $ foldl (users .to-list)
                      %ok $ {}
                      fn (acc entry)
                        match acc
                          (:err message) (%err message)
                          (:ok result)
                            let-sugar
                                  [] id raw-user
                                  , entry
                              match (decode-user-record raw-user)
                                (:ok user)
                                  %ok $ assoc result id user
                                (:err message)
                                  %err $ str |storage.cirru/:users/ id |: message
                  match decoded
                    (:err message) (%err message)
                    (:ok records)
                      %ok $ DatabaseRecord :today
                        decode-map-as (&map:get legacy :today) 'String
                        , :users records :sessions $ {}
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/DatabaseRecord 'String
          :tests $ []
            %{} 'TestEntry (:name |empty-legacy)
              :code $ quote $ assert= (%ok empty-database)
                load-database $ {}
              :tags $ #{} :server
            %{} 'TestEntry (:name |legacy-round-trip)
              :code $ quote $ let
                  db $ struct-with (test-database)
                    :sessions $ {}
                  text $ format-cirru-edn $ database-to-map db
                assert= (%ok db)
                  load-database $ parse-cirru-edn text
              :tags $ #{} :server
        'new-session $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn new-session (sid)
            SessionRecord :id sid :user-id (%none) :nickname (%none) :router (Route :home) :messages $ {}
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/SessionRecord)
            :args $ [] 'Number
        'normalize-note-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-note-map (raw)
            if (map? raw)
              .map raw $ fn (pair)
                [] (&list:nth pair 0)
                  normalize-note-record $ &list:nth pair 1
              , raw
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'T)
            :args $ [] 'T
            :generics $ [] 'T
        'normalize-note-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-note-record (raw)
            if
              and (map? raw)
                nil? $ &map:get raw :updated-time
              dissoc raw :updated-time
              , raw
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'T)
            :args $ [] 'T
            :generics $ [] 'T
        'normalize-task-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-task-map (raw)
            if (map? raw)
              .map raw $ fn (pair)
                [] (&list:nth pair 0)
                  normalize-task-record $ &list:nth pair 1
              , raw
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'T)
            :args $ [] 'T
            :generics $ [] 'T
        'normalize-task-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-task-record (raw)
            if (map? raw)
              foldl ([] :created-time :touched-time :finished-time :archived-time) raw $ fn (entry field)
                if
                  nil? $ &map:get entry field
                  dissoc entry field
                  , entry
              , raw
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'T)
            :args $ [] 'T
            :generics $ [] 'T
        'normalize-user-tasks $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-user-tasks (raw)
            if (map? raw)
              .map raw $ fn (pair)
                [] (&list:nth pair 0)
                  normalize-task-map $ &list:nth pair 1
              , raw
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'T)
            :args $ [] 'T
            :generics $ [] 'T
        'note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def note
            {} (:id nil) (:time nil) (:updated-time nil) (:text nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'note-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn note-to-map (note)
            {}
              :id $ :id note
              :text $ :text note
              :time $ :time note
              :updated-time $ match (:updated-time note)
                (:some t) t
                (:none) nil
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/NoteRecord
            :return $ :: 'Map 'Tag 'Dynamic
        'notification $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def notification
            {} (:id nil) (:kind nil) (:text nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'read-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-path (base path)
            list-match path
              () base
              (field tail)
                if (map? base)
                  recur (&map:get base field) tail
                  , nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |handles-non-map-boundaries)
            :code $ quote $ do
              assert= 1 $ read-path
                {} $ :a $ {} (:b 1)
                [] :a :b
              assert= nil $ read-path
                {} $ :a |not-a-map
                [] :a :b
              assert= |leaf $ read-path |leaf $ []
            :tags $ #{} :server
        'route-operation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn route-operation (data)
            match (decode-route data)
              (:ok route) (Op :router/change route)
              (:err message)
                raise $ str |Invalid-route: message
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/Op)
            :args $ [] 'Dynamic
        'route-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn route-to-map (route)
            match route
              (:home)
                {} (:name :home) (:data nil) (:router nil)
              (:profile)
                {} (:name :profile) (:data nil) (:router nil)
              (:history data)
                {} (:name :history)
                  :data $ &struct:to-map data
                  :router nil
              (:notes data)
                {} (:name :notes)
                  :data $ &struct:to-map data
                  :router nil
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/Route
            :return $ :: 'Map 'Tag 'Dynamic
        'router $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def router
            {} (:name nil) (:title nil)
              :data $ {}
              :router nil
          :examples $ []
          :schema $ :: 'Dynamic
        'session $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def session
            {} (:user-id nil) (:id nil) (:nickname nil)
              :router $ {} (:name :home) (:data nil) (:router nil)
              :messages $ {}
          :examples $ []
          :schema $ :: 'Dynamic
        'session-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn session-to-map (session)
            {}
              :id $ :id session
              :user-id $ match (:user-id session)
                (:some v) v
                (:none) nil
              :nickname $ match (:nickname session)
                (:some v) v
                (:none) nil
              :router $ route-to-map $ :router session
              :messages $ filter-map-kv (:messages session)
                fn (k v)
                  MapEntryDecision :keep k $ &struct:to-map v
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/SessionRecord
            :return $ :: 'Map 'Tag 'Dynamic
        'task $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def task
            {} (:id nil) (:text |) (:detail |) (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
          :examples $ []
          :schema $ :: 'Dynamic
        'task-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn task-to-map (task)
            {}
              :id $ :id task
              :text $ :text task
              :detail $ :detail task
              :pending? $ :pending? task
              :created-time $ match (:created-time task)
                (:some t) t
                (:none) nil
              :touched-time $ match (:touched-time task)
                (:some t) t
                (:none) nil
              :finished-time $ match (:finished-time task)
                (:some t) t
                (:none) nil
              :archived-time $ match (:archived-time task)
                (:some t) t
                (:none) nil
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/TaskRecord
            :return $ :: 'Map 'Tag 'Dynamic
        'test-database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn test-database ()
            let
                tasks $ UserTasks :working
                  {}
                    |t1 $ TaskRecord :id |t1 :text |one :detail | :pending? false
                    |t2 $ TaskRecord :id |t2 :text |two :detail | :pending? true
                  , :pending ({}) :finished $ {}
                user-record $ UserRecord :id |u1 :name |Alice :nickname (%none) :avatar (%none) :password (%none) :tasks tasks :notes $ {}
                session-record $ struct-with (new-session 7)
                  :user-id $ %some |u1
                  :messages $ {}
                    |m1 $ NotificationRecord :id |m1 :text |remove
                    |m2 $ NotificationRecord :id |m2 :text |keep
              DatabaseRecord :today |2026-09-26 :users
                {} $ |u1 user-record
                , :sessions $ {} (7 session-record)
                  8 $ new-session 8
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ []
        'update-session $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-session (db sid f)
            match
              get (:sessions db) sid
              (:none) db
              (:some session-record)
                struct-with db $ :sessions $ assoc (:sessions db) sid (f session-record)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'Number $ :: 'Fn
              {} (:return 'app.schema/SessionRecord)
                :args $ [] 'app.schema/SessionRecord
        'update-user $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-user (db sid f)
            match
              get (:sessions db) sid
              (:none) db
              (:some session-record)
                match (:user-id session-record)
                  (:none) db
                  (:some uid)
                    match
                      get (:users db) uid
                      (:none) db
                      (:some user-record)
                        struct-with db $ :users $ assoc (:users db) uid (f user-record)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'Number $ :: 'Fn
              {} (:return 'app.schema/UserRecord)
                :args $ [] 'app.schema/UserRecord
        'user $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def user
            {} (:name nil) (:id nil) (:nickname nil) (:avatar nil) (:password nil)
              :tasks $ {}
                :working $ do task $ {}
                :pending $ {}
                :finished $ {}
              :notes $ do note $ {}
          :examples $ []
          :schema $ :: 'Dynamic
        'user-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn user-to-map (user)
            {}
              :id $ :id user
              :name $ :name user
              :nickname $ match (:nickname user)
                (:some v) v
                (:none) nil
              :avatar $ match (:avatar user)
                (:some v) v
                (:none) nil
              :password $ match (:password user)
                (:some v) v
                (:none) nil
              :notes $ filter-map-kv (:notes user)
                fn (k v)
                  MapEntryDecision :keep k $ note-to-map v
              :tasks $ let
                  tasks $ :tasks user
                {}
                  :working $ filter-map-kv (:working tasks)
                    fn (k v)
                      MapEntryDecision :keep k $ task-to-map v
                  :pending $ filter-map-kv (:pending tasks)
                    fn (k v)
                      MapEntryDecision :keep k $ task-to-map v
                  :finished $ filter-map-kv (:finished tasks)
                    fn (k v)
                      MapEntryDecision :keep k $ task-to-map v
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/UserRecord
            :return $ :: 'Map 'Tag 'Dynamic
        'validate-stored-users $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn validate-stored-users (users)
            foldl (-> users keys .to-list) (%ok users)
              fn (result user-id)
                match result
                  (:err message) (%err message)
                  (:ok _)
                    let
                        candidate $ &map:get users user-id
                      if (map? candidate)
                        match (decode-user-record candidate)
                          (:ok user)
                            if
                              = user-id $ :id user
                              %ok users
                              %err $ str |storage.cirru/:users/ user-id "|:id differs from map key"
                          (:err detail)
                            %err $ str |storage.cirru/:users/ user-id |: detail
                        %err $ str |storage.cirru/:users/ user-id "|:legacy user record expected Map"
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'Map 'String 'T
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result (:: 'Map 'String 'T) 'String
          :tests $ []
            %{} 'TestEntry (:name |accepts-legacy-user-map)
              :code $ quote $ match
                validate-stored-users $ {} $ |u1
                  {} (:id |u1) (:name |Alice)
                    :tasks $ {}
                      :working $ {} $ |t1
                        {} (:id |t1) (:text |work) (:detail |) (:pending? false) (:created-time nil)
                      :pending $ {}
                      :finished $ {}
                (:ok users)
                  = |Alice $ &map:get (&map:get users |u1) :name
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-nested-user-error-with-key)
              :code $ quote $ match
                validate-stored-users $ {} $ |u1
                  {} (:id |u1) (:name |Alice)
                    :tasks $ {}
                      :working $ {} $ |t1
                        {} (:id |t1) (:text 7) (:detail |) (:pending? false)
                      :pending $ {}
                      :finished $ {}
                (:err message)
                  starts-with? message "|storage.cirru/:users/u1:decode-map-as failed at $.tasks.working.value.text:"
                (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-typed-user-until-updaters-migrate)
              :code $ quote $ match
                decode-user-record $ {} (:id |u1) (:name |Alice)
                (:ok user)
                  match
                    validate-stored-users $ {} $ |u1 user
                    (:err message)
                      starts-with? message "|storage.cirru/:users/u1:legacy user record expected Map"
                    (:ok _) false
                (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-key-id-mismatch)
              :code $ quote $ match
                validate-stored-users $ {} $ |u1
                  {} (:id |different) (:name |Alice)
                (:err message) (starts-with? message "|storage.cirru/:users/u1:id differs from map key")
                (:ok _) false
              :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.schema
          :require $ recollect.schema :as patch-schema
    'app.server $ %{} 'FileEntry
      :defs $ {}
        '*client-caches $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *client-caches ({})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Number 'Dynamic
        '*client-states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *client-states ({})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Number (:: 'Map 'Tag 'Dynamic)
        '*dirty-clients $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *dirty-clients (#{})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Set 'Number
        '*initial-db $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *initial-db
            if (path-exists? storage-file)
              let
                  raw-data $ read-file storage-file
                  loaded-db $ assert-type
                    match
                      schema/load-database $ parse-cirru-edn raw-data
                      (:ok db) db
                      (:err reason) (raise reason)
                    , 'app.schema/DatabaseRecord
                println |[storage] |loading storage-file |bytes $ count raw-data
                println |[storage] |loaded storage-file |users $ count $ :users loaded-db
                , loaded-db
              do (println |[storage] |missing storage-file) schema/empty-database
          :examples $ []
          :schema $ :: 'Ref 'app.schema/DatabaseRecord
        '*reader-reel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *reader-reel @*reel
          :examples $ []
          :schema $ :: 'Ref 'cumulo-reel.core/ReelState
        '*reel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *reel
            struct-with reel-schema (:base @*initial-db) (:db @*initial-db)
          :examples $ []
          :schema $ :: 'Ref 'cumulo-reel.core/ReelState
        '*sync-metrics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *sync-metrics
            SyncMetrics :last-diff-latency-ms 0 :last-patch-bytes 0 :pending-clients 0 :slow-clients 0 :resync-count 0 :patch-attempts 0 :snapshot-attempts 0 :last-revision 0
          :examples $ []
          :schema $ :: 'Ref 'app.server/SyncMetrics
        '*sync-retry-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *sync-retry-scheduled? false
          :examples $ []
          :schema $ :: 'Ref 'Bool
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *sync-revision 0
          :examples $ []
          :schema $ :: 'Ref 'Number
        '*sync-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *sync-scheduled? false
          :examples $ []
          :schema $ :: 'Ref 'Bool
        'SyncMetrics $ %{} 'CodeEntry
          :doc "|Process-lifetime synchronization counters with read-time client gauges."
          :code $ quote $ defstruct SyncMetrics (:last-diff-latency-ms 'Number) (:last-patch-bytes 'Number) (:pending-clients 'Number) (:slow-clients 'Number) (:resync-count 'Number) (:patch-attempts 'Number) (:snapshot-attempts 'Number) (:last-revision 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'acknowledge-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn acknowledge-client! (sid revision)
            let
                state $ option:unwrap $ get @*client-states sid
              when
                = revision $ option:unwrap-or (get state :sent-rev) -1
                let
                    sent-store $ option:unwrap $ get state :sent-store
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
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number
        'current-date! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn current-date! ()
            unsafe-coerce
              %{} Date0 $ :date $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |now_bang
              , 'calcit.std.date/Date0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'calcit.std.date/Date0)
            :args $ []
            :features $ #{} :js-ffi
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op sid)
            let
                op-id $ turn-string $ generate-id!
                op-time $ get-timestamp $ current-date!
                op-tag $ &enum:nth op 0
              println |[operation] |received op-tag |sid sid |id op-id
              match op
                (:effect/persist) (persist-db!)
                (:effect/ping)
                  wss-send! sid $ format-cirru-edn $ schema/ServerMessage :effect/pong
                _ $ let
                    previous-reel @*reel
                    next-reel $ reel-reducer previous-reel updater op sid op-id op-time config/dev?
                    changed? $ not= (:db previous-reel) (:db next-reel)
                  reset! *reel next-reel
                  println |[operation] |applied op-tag |sid sid |id op-id |changed changed?
                  request-sync!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'app.schema/Op 'Number
        'get-backup-path! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn get-backup-path! ()
            let
                now $ extract-time $ current-date!
              join-path calcit-dirname |backups
                str $ &map:get now :month
                str (&map:get now :day) |-snapshot.cirru
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ []
        'handle-client-message! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-client-message! (message sid)
            match message
              (:sync/active client-revision) (mark-client-active! sid client-revision false)
              (:sync/heartbeat client-revision)
                do (touch-client! sid client-revision)
                  wss-send! sid $ format-cirru-edn $ schema/ServerMessage :effect/pong
                  , &unit
              (:sync/idle client-revision) (mark-client-idle! sid client-revision)
              (:sync/resume client-revision)
                do (record-resync!) (mark-client-active! sid client-revision true)
              (:sync/ack revision) (acknowledge-client! sid revision)
              (:dispatch op) (dispatch! op sid)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'app.schema/ClientMessage 'Number
        'handle-sync-send! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-sync-send! (sid revision new-store outcome) (swap! *client-states set-client-send-state sid revision new-store outcome)
            match outcome
              (:accepted) &unit
              (:backpressured)
                do (swap! *dirty-clients include sid) (request-sync-retry!)
              (:too-large) (println "|WebSocket sync payload is too large for client:" sid)
              (:closed) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number 'Dynamic 'wss.core/WssSendOutcome
        'invalidate-sync-caches! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn invalidate-sync-caches! ()
            reset! *client-caches $ {}
            each (keys @*client-states)
              fn (sid)
                swap! *client-states update sid $ fn (state)
                  dissoc
                    merge state $ {} (:needs-snapshot? true) (:in-flight? false)
                    , :sent-rev :sent-store
                let
                    state $ option:unwrap $ get @*client-states sid
                  when
                    = :active $ &map:get state :status
                    swap! *dirty-clients include sid
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            println "|Running mode:" $ if config/dev? |dev |release
            let
                p? $ get-env |port
                port $ option:fold p?
                  fn () 11009
                  fn (raw)
                    (parse-float raw) .unwrap-or 11009
              run-server! port
              println $ str "|Server started on port:" port
            ; "|init it before doing multi-threading"
            identity @*reader-reel
            on-control-c on-exit!
            set-interval 600000 $ fn () $ persist-db!
            set-interval 60000 $ fn () $ set-today!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ []
        'mark-client-active! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mark-client-active! (sid client-revision force-snapshot?)
            let
                state $ option:unwrap-or (get @*client-states sid) ({})
                resumed? $ or force-snapshot? $ not= :active
                  option:unwrap-or (get state :status) :idle
                next-state-base $ merge
                  {} (:status :active)
                    :last-heartbeat $ now-ms
                    :acked-rev client-revision
                    :dirty-rev @*sync-revision
                    :in-flight? false
                    :needs-snapshot? true
                  , state $ {} (:status :active)
                    :last-heartbeat $ now-ms
                    :acked-rev $ if resumed? client-revision $ option:unwrap-or (get state :acked-rev) client-revision
                    :in-flight? $ if resumed? false $ option:unwrap-or (get state :in-flight?) false
                    :needs-snapshot? $ or resumed? $ option:unwrap-or (get state :needs-snapshot?) false
                next-state $ if resumed? (dissoc next-state-base :sent-rev :sent-store) next-state-base
              swap! *client-states assoc sid next-state
              when resumed? (swap! *client-caches dissoc sid) (swap! *dirty-clients include sid) (request-sync!)
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number 'Bool
        'mark-client-idle! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mark-client-idle! (sid client-revision)
            when
              option:some? $ get @*client-states sid
              swap! *client-states update sid $ fn (state)
                dissoc
                  merge state $ {} (:status :idle) (:acked-rev client-revision) (:in-flight? false) (:needs-snapshot? true)
                  , :sent-rev :sent-store
              swap! *client-caches dissoc sid
              swap! *dirty-clients exclude sid
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number
        'mark-clients-dirty! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mark-clients-dirty! (revision)
            each (keys @*client-states)
              fn (sid)
                let
                    state $ option:unwrap $ get @*client-states sid
                  swap! *client-states set-client-dirty-revision sid revision
                  when
                    = :active $ option:unwrap $ get state :status
                    swap! *dirty-clients include sid
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number
        'next-sync-ack-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn next-sync-ack-state (current revision)
            dissoc
              merge current $ {} (:acked-rev revision) (:in-flight? false)
              , :sent-rev :sent-store
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'C)
            :args $ [] 'C 'Number
            :generics $ [] 'C
          :tests $ [] $ %{} 'TestEntry
            :name |repeated-backpressure-converges-to-latest-revision
            :code $ quote $ let
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
          :code $ quote $ defn next-sync-metrics (metrics message-kind revision diff-latency payload)
            struct-with metrics (:last-diff-latency-ms diff-latency)
              :last-patch-bytes $ if (= message-kind :patch) payload.utf8-byte-count $ :last-patch-bytes metrics
              :patch-attempts $ if (= message-kind :patch)
                inc $ :patch-attempts metrics
                :patch-attempts metrics
              :snapshot-attempts $ if (= message-kind :snapshot)
                inc $ :snapshot-attempts metrics
                :snapshot-attempts metrics
              :last-revision revision
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.server/SyncMetrics)
            :args $ [] 'app.server/SyncMetrics 'Tag 'Number 'Number 'String
          :tests $ [] $ %{} 'TestEntry (:name |advances-patch-and-snapshot-counters)
            :code $ quote $ let
                initial $ %{} SyncMetrics (:last-diff-latency-ms 0) (:last-patch-bytes 0) (:pending-clients 0) (:slow-clients 0) (:resync-count 0) (:patch-attempts 0) (:snapshot-attempts 0) (:last-revision 0)
                after-patch $ next-sync-metrics initial :patch 7 3 "|A😀"
              assert=
                %{} SyncMetrics (:last-diff-latency-ms 2) (:last-patch-bytes 5) (:pending-clients 0) (:slow-clients 0) (:resync-count 0) (:patch-attempts 1) (:snapshot-attempts 1) (:last-revision 8)
                next-sync-metrics after-patch :snapshot 8 2 |ignored
            :tags $ #{} :server
        'next-sync-send-state $ %{} 'CodeEntry
          :doc "|Advance one client synchronization state from a typed transport admission outcome."
          :code $ quote $ defn next-sync-send-state (current revision new-store outcome)
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
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'V) 'Number 'U 'wss.core/WssSendOutcome
            :generics $ [] 'V 'U
            :return $ :: 'Map 'Tag 'V
          :tests $ []
            %{} 'TestEntry (:name |accepted-records-pending-store)
              :code $ quote $ assert=
                {} (:status :active) (:sent-rev 7)
                  :sent-store $ {} $ :value 1
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
              :code $ quote $ assert=
                {} (:status :active) (:needs-snapshot? true) (:slow-client? true) (:last-send-outcome :too-large)
                next-sync-send-state
                  {} $ :status :active
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :too-large
              :tags $ #{} :server
            %{} 'TestEntry (:name |closed-clears-pending-send)
              :code $ quote $ assert=
                {} (:status :idle) (:in-flight? false) (:last-send-outcome :closed)
                next-sync-send-state
                  {} (:status :active) (:in-flight? true) (:sent-rev 7)
                    :sent-store $ {} $ :value 1
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :closed
              :tags $ #{} :server
            %{} 'TestEntry (:name |backpressure-preserves-latest-dirty-revision)
              :code $ quote $ assert=
                {} (:status :active) (:acked-rev 5) (:dirty-rev 7) (:slow-client? true) (:last-send-outcome :backpressured)
                next-sync-send-state
                  {} (:status :active) (:acked-rev 5) (:dirty-rev 6)
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :backpressured
              :tags $ #{} :server
        'now-ms $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn now-ms ()
            get-timestamp $ current-date!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
        'on-exit! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-exit! () (persist-db!) (; println "|exit code is...") (quit! 0)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'patch-operation-limit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def patch-operation-limit 64
          :examples $ []
          :schema $ :: 'Number
        'persist-db! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn persist-db! ()
            let
                db $ assert-type (:db @*reel) 'app.schema/DatabaseRecord
                file-content $ format-cirru-edn $ schema/database-to-map
                  struct-with db $ :sessions $ {}
                storage-path storage-file
                backup-path $ get-backup-path!
              println |[storage] |persisting storage-path |backup backup-path |bytes $ count file-content
              check-write-file! storage-path file-content
              check-write-file! backup-path file-content
              println |[storage] |persisted storage-path |backup backup-path
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'read-sync-metrics $ %{} 'CodeEntry
          :doc "|Read synchronization counters plus current pending and slow-client gauges."
          :code $ quote $ defn read-sync-metrics ()
            let
                states $ vals @*client-states
                pending-clients $ count $ filter states
                  fn (state)
                    option:unwrap-or (get state :in-flight?) false
                slow-clients $ count $ filter states
                  fn (state)
                    option:unwrap-or (get state :slow-client?) false
              struct-with @*sync-metrics (:pending-clients pending-clients) (:slow-clients slow-clients)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.server/SyncMetrics)
            :args $ []
          :tests $ [] $ %{} 'TestEntry (:name |typed-metrics-gauges)
            :code $ quote $ let
                metrics $ read-sync-metrics
              assert= 0 $ :pending-clients metrics
              assert= 0 $ :slow-clients metrics
            :tags $ #{} :server
        'record-resync! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn record-resync! () (swap! *sync-metrics update :resync-count inc)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'record-sync-send! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn record-sync-send! (message-kind revision diff-latency payload) (swap! *sync-metrics next-sync-metrics message-kind revision diff-latency payload)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Tag 'Number 'Number 'String
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (println "|Code updated..")
            if (not config/dev?) (raise "|reloading only happens in dev mode")
            clear-twig-caches!
            reset! *reel $ refresh-reel @*reel @*initial-db updater
            invalidate-sync-caches!
            request-sync!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'render-loop! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-loop! ()
            when
              not $ identical? @*reader-reel @*reel
              reset! *reader-reel @*reel
              swap! *sync-revision inc
              mark-clients-dirty! @*sync-revision
            sync-clients! @*reader-reel
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'request-sync! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-sync! ()
            if @*sync-scheduled? &unit $ do (reset! *sync-scheduled? true)
              set-timeout sync-coalesce-delay $ fn () (reset! *sync-scheduled? false) (render-loop!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'request-sync-retry! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-sync-retry! ()
            if @*sync-retry-scheduled? &unit $ do (reset! *sync-retry-scheduled? true)
              set-timeout sync-retry-delay $ fn () (reset! *sync-retry-scheduled? false)
                when
                  not $ empty? @*dirty-clients
                  request-sync!
                , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'run-server! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn run-server! (port)
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
                      dispatch! (schema/Op :session/connect) sid
                      println "|New client."
                  (:message sid msg)
                    match
                      schema/decode-client-message $ parse-cirru-edn msg
                      (:ok message) (handle-client-message! message sid)
                      (:err error) (eprintln "|Invalid client message:" sid error)
                  (:disconnect sid)
                    do (println "|Client closed!")
                      dispatch! (schema/Op :session/disconnect) sid
                      swap! *client-caches dissoc sid
                      swap! *client-states dissoc sid
                      swap! *dirty-clients exclude sid
                  _ $ println "|unknown data:" data
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number
        'set-client-dirty-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-client-dirty-revision (states sid revision)
            let
                state $ option:unwrap $ get states sid
              assoc states sid $ assoc state :dirty-rev revision
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'Map 'Number $ :: 'Map 'Tag 'V
              , 'Number 'Number
            :generics $ [] 'V
            :return $ :: 'Map 'Number $ :: 'Map 'Tag 'V
          :tests $ [] $ %{} 'TestEntry (:name |preserves-other-client-state)
            :code $ quote $ let
                states $ {}
                  1 $ {} (:status :active) (:dirty-rev 2)
                  2 $ {} (:status :idle) (:dirty-rev 3)
                next $ set-client-dirty-revision states 1 7
              do
                assert= 7 $ &map:get (&map:get next 1) :dirty-rev
                assert= :active $ &map:get (&map:get next 1) :status
                assert= (&map:get states 2) (&map:get next 2)
                assert= 2 $ &map:get (&map:get states 1) :dirty-rev
            :tags $ #{} :server
        'set-client-last-heartbeat $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-client-last-heartbeat (states sid timestamp)
            let
                state $ option:unwrap $ get states sid
              assoc states sid $ assoc state :last-heartbeat timestamp
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'Map 'Number $ :: 'Map 'Tag 'V
              , 'Number 'Number
            :generics $ [] 'V
            :return $ :: 'Map 'Number $ :: 'Map 'Tag 'V
          :tests $ [] $ %{} 'TestEntry (:name |preserves-other-client-state)
            :code $ quote $ let
                states $ {}
                  1 $ {} (:status :active) (:last-heartbeat 2)
                  2 $ {} (:status :idle) (:last-heartbeat 3)
                next $ set-client-last-heartbeat states 1 7
              do
                assert= 7 $ &map:get (&map:get next 1) :last-heartbeat
                assert= :active $ &map:get (&map:get next 1) :status
                assert= (&map:get states 2) (&map:get next 2)
            :tags $ #{} :server
        'set-client-send-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-client-send-state (states sid revision new-store outcome)
            match (get states sid)
              (:some current)
                assoc states sid $ next-sync-send-state current revision new-store outcome
              (:none) states
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'Map 'Number $ :: 'Map 'Tag 'V
              , 'Number 'Number 'U 'wss.core/WssSendOutcome
            :generics $ [] 'V 'U
            :return $ :: 'Map 'Number $ :: 'Map 'Tag 'V
          :tests $ []
            %{} 'TestEntry (:name |accepted-update-preserves-other-client)
              :code $ quote $ let
                  states $ {}
                    1 $ {} $ :status :active
                    2 $ {} $ :status :idle
                  next $ set-client-send-state states 1 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :accepted
                do
                  assert= 7 $ &map:get (&map:get next 1) :sent-rev
                  assert= true $ &map:get (&map:get next 1) :in-flight?
                  assert= (&map:get states 2) (&map:get next 2)
                  assert= false $ contains? (&map:get states 1) :sent-rev
              :tags $ #{} :server
            %{} 'TestEntry (:name |missing-client-is-unchanged)
              :code $ quote $ let
                  states $ {} $ 1
                    {} $ :status :active
                  next $ set-client-send-state states 3 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :accepted
                assert= states next
              :tags $ #{} :server
        'set-today! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-today! ()
            let
                today $ wo-log $ format-time (current-date!) (%some |%Y-%m-%d)
                reel @*reel
                old-today $ :today $ assert-type (:db reel) 'app.schema/DatabaseRecord
              when (not= today old-today)
                dispatch! (schema/Op :today today) 0
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'storage-file $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def storage-file
            if (empty? calcit-dirname) (&map:get config/site :storage-file)
              join-path calcit-dirname $ &map:get config/site :storage-file
          :examples $ []
          :schema $ :: 'String
        'sync-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sync-client! (sid reel revision) (swap! *dirty-clients exclude sid)
            let
                state $ option:unwrap $ get @*client-states sid
              when
                and
                  = :active $ option:unwrap $ get state :status
                  not $ option:unwrap-or (get state :in-flight?) false
                let
                    db $ schema/database-to-map $ assert-type (:db reel) 'app.schema/DatabaseRecord
                    records $ :records reel
                    session $ schema/read-path db $ [] :sessions sid
                    old-store-option $ get @*client-caches sid
                    new-store $ twig-container db session records
                    needs-snapshot? $ or
                      option:unwrap-or (get state :needs-snapshot?) true
                      option:none? old-store-option
                    diff-start $ now-ms
                    changes $ if needs-snapshot? ([])
                      diff-twig (option:unwrap old-store-option) new-store $ {} $ :key :id
                    diff-latency $ - (now-ms) diff-start
                    send-snapshot? $ or needs-snapshot? $ > (count changes) patch-operation-limit
                    base-revision $ option:unwrap-or (get state :acked-rev) 0
                  if send-snapshot?
                    let
                        payload $ format-cirru-edn $ schema/ServerMessage :snapshot revision new-store
                      record-sync-send! :snapshot revision diff-latency payload
                      handle-sync-send! sid revision new-store $ wss-send! sid payload
                    if
                      not= changes $ []
                      let
                          payload $ format-cirru-edn $ schema/ServerMessage :patch base-revision revision changes
                        record-sync-send! :patch revision diff-latency payload
                        handle-sync-send! sid revision new-store $ wss-send! sid payload
                      , &unit
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'cumulo-reel.core/ReelState 'Number
        'sync-clients! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sync-clients! (reel)
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
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'cumulo-reel.core/ReelState
        'sync-coalesce-delay $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def sync-coalesce-delay 16
          :examples $ []
          :schema $ :: 'Number
        'sync-retry-delay $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def sync-retry-delay 200
          :examples $ []
          :schema $ :: 'Number
        'touch-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn touch-client! (sid client-revision)
            let
                state $ option:unwrap $ get @*client-states sid
              if
                = :active $ option:unwrap $ get state :status
                swap! *client-states set-client-last-heartbeat sid $ now-ms
                mark-client-active! sid client-revision true
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.server
          :require (app.schema :as schema)
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
            calcit.std.path :refer $ join-path
            calcit.std.date :refer $ extract-time Date0 format-time get-timestamp
            calcit.std.util :refer $ get-dylib-path
    'app.style $ %{} 'FileEntry
      :defs $ {}
        'button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def button
            merge ui/button $ {} $ :background-color :white
          :examples $ []
          :schema $ :: 'Dynamic
        'link $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def link
            {} (:text-decoration :underline) (:cursor :pointer)
              :color $ hsl 240 80 80
              :font-family ui/font-fancy
          :examples $ []
          :schema $ :: 'Dynamic
        'merge-styles $ %{} 'CodeEntry
          :doc "|Combines heterogeneous Respo style maps at the rendering boundary."
          :code $ quote $ defn merge-styles (x0 & xs) (reduce xs x0 &merge)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :rest $ :: 'Map 'Tag 'Dynamic
            :return $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.style
          :require
            [] respo-ui.core :refer $ [] hsl
            [] respo-ui.core :as ui
    'app.twig.container $ %{} 'FileEntry
      :defs $ {}
        'parse-date $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn parse-date (time format)
            unsafe-coerce
              %{} Date0 $ :date $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |parse_time time format
              , 'calcit.std.date/Date0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'calcit.std.date/Date0)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
        'twig-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-container (db session records)
            let
                session-data $ if (map? session) session schema/session
                logged-in? $ some? $ &map:get session-data :user-id
                router $ &map:get session-data :router
                base-data $ {} (:logged-in? logged-in?) (:session session-data) (:router router)
                  :reel-length $ count records
                user $ schema/read-path db $ [] :users (&map:get session-data :user-id)
              merge base-data $ decode-map-as
                if logged-in?
                  {}
                    :user $ twig-user $ decode-map-as user (:: 'Map 'Tag 'Dynamic)
                    :router $ assoc router :data $ case-default (&map:get router :name) ({})
                      :home $ {} $ :tasks
                        schema/read-path user $ [] :tasks :working
                      :history $ {}
                        :week $ &map:get router :data
                        :tasks $ twig-tasks-by-week
                          decode-map-as (&map:get router :data) (:: 'Map 'Tag 'Dynamic)
                          decode-map-as
                            schema/read-path user $ [] :tasks :finished
                            :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                      :notes $ twig-notes-by-month
                        decode-map-as (&map:get router :data) (:: 'Map 'Tag 'Dynamic)
                        decode-map-as
                          if
                            map? $ &map:get user :notes
                            &map:get user :notes
                            {}
                          :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                      :profile $ twig-members (&map:get db :sessions) (&map:get db :users)
                    :count $ count $ &map:get db :sessions
                    :color $ rand-hex-color!
                    :today $ &map:get db :today
                  {}
                :: 'Map 'Tag 'Dynamic
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'D) 'S $ :: 'List 'R
            :generics $ [] 'D 'S 'R
            :return $ :: 'Map 'Tag 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |defaults-missing-session)
              :code $ quote $ let
                  init-db $ decode-map-as ({}) (:: 'Map 'Tag 'Dynamic)
                  init-records $ []
                  result $ twig-container init-db nil init-records
                do
                  assert= true $ map? result
                  assert= schema/session $ &map:get result :session
              :tags $ #{} :server
            %{} 'TestEntry (:name |omits-private-fields-for-logged-in-user)
              :code $ quote $ let
                  user $ -> schema/user (assoc :id |u) (assoc :name |Alice) (assoc :password |secret)
                  db $ assoc-in schema/database ([] :users |u) user
                  session $ assoc schema/session :user-id |u
                  twig $ twig-container
                    decode-map-as db $ :: 'Map 'Tag 'Dynamic
                    , session $ []
                  visible-user $ &map:get twig :user
                do
                  assert= |Alice $ &map:get visible-user :name
                  assert= false $ contains? visible-user :password
                  assert= false $ contains? visible-user :tasks
              :tags $ #{} :server
            %{} 'TestEntry (:name |legacy-user-without-notes-opens-notes)
              :code $ quote $ let
                  db $ assoc-in schema/database ([] :users |u1)
                    {} (:id |u1) (:name |Alice)
                  session0 $ assoc schema/session :user-id |u1
                  session $ assoc session0 :router $ {} (:name :notes)
                    :data $ {} (:year 2026) (:month 8)
                  twig $ twig-container
                    decode-map-as db $ :: 'Map 'Tag 'Dynamic
                    , session $ []
                  notes $ schema/read-path twig $ [] :router :data
                assert |legacy-notes-stays-map $ map? notes
                assert |legacy-notes-is-empty $ empty? notes
              :tags $ #{} :server
        'twig-members $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-members (sessions users)
            -> sessions $ filter-map-kv $ fn (k session)
              %:: MapEntryDecision :keep k $ schema/read-path users $ [] (&map:get session :user-id) :name
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'Map 'K $ :: 'Map 'Tag 'S
              :: 'Map 'String $ :: 'Map 'Tag 'U
            :generics $ [] 'K 'S 'U
            :return $ :: 'Map 'K 'Dynamic
        'twig-notes-by-month $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-notes-by-month (data notes)
            let
                year $ &map:get data :year
                month $ inc $ &map:get data :month
              -> notes (identity)
                &map:filter-kv $ fn (k task)
                  let
                      time $ extract-time $ Date0 :date (&map:get task :time)
                    and
                      = year $ &map:get time :year
                      = month $ &map:get time :month
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'D) (:: 'Map 'K 'N)
            :generics $ [] 'D 'K 'N
            :return $ :: 'Map 'K 'N
          :tests $ [] $ %{} 'TestEntry (:name |filters-persisted-note-by-month)
            :code $ quote $ let
                stamp $ get-timestamp $ from-ymd 2026 9 25
                result $ twig-notes-by-month
                  {} (:year 2026) (:month 8)
                  {} $ |n1 $ {} (:time stamp) (:text |test)
              assert= 1 $ count result
            :tags $ #{} :server
        'twig-tasks-by-week $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-tasks-by-week (data tasks)
            let
                filter-year $ &map:get data :year
                filter-week $ dec $ &map:get data :week
                start-time $ parse-date (&map:get data :start) "|%Y-%m-%dT%H:%M:%S %z"
                end-time $ parse-date (&map:get data :end) "|%Y-%m-%dT%H:%M:%S %z"
              ; println |start: $ format-time start-time "|%Y-%m-%dT%H:%M:%S %z"
              ; println "|end " $ format-time end-time "|%Y-%m-%dT%H:%M:%S %z"
              -> tasks (identity)
                &map:filter-kv $ fn (k task)
                  let
                      t $ &map:get task :finished-time
                    and
                      &> t $ get-timestamp start-time
                      &< t $ get-timestamp end-time
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'D) (:: 'Map 'K 'T)
            :generics $ [] 'D 'K 'T
            :return $ :: 'Map 'K 'T
        'week-millis $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def week-millis (* 7 24 3600 1000)
          :examples $ []
          :schema $ :: 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.twig.container
          :require
            [] app.twig.user :refer $ [] twig-user
            calcit.std.rand :refer $ rand-hex-color!
            app.schema :as schema
            calcit.std.date :refer $ Date0 extract-time from-ywd from-ymd format-time get-timestamp
            calcit.std.util :refer $ get-dylib-path
    'app.twig.user $ %{} 'FileEntry
      :defs $ {} $ 'twig-user
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-user (user)
            -> user (dissoc :password) (dissoc :tasks)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'Map 'Tag 'V
            :generics $ [] 'V
            :return $ :: 'Map 'Tag 'V
          :tests $ [] $ %{} 'TestEntry (:name |omits-private-and-task-fields)
            :code $ quote $ assert=
              {} $ :name |Alice
              twig-user $ {} (:name |Alice) (:password |secret)
                :tasks $ {}
            :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.twig.user
          :require $ [] recollect.twig :refer $ [] deftwig
    'app.updater $ %{} 'FileEntry
      :defs $ {} $ 'updater
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (db op sid op-id op-time)
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
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'app.schema/Op 'Number 'String 'Number
          :tests $ []
            %{} 'TestEntry (:name |typed-business-lifecycle)
              :code $ quote $ let
                  connected $ updater schema/empty-database (schema/Op :session/connect) 7 |connect 1
                  signed $ updater connected
                    schema/Op :user/sign-up $ [] |Alice |secret
                    , 7 |u1 2
                  created $ updater signed (schema/Op :task/create-working |first) 7 |t1 3
                  edited $ updater created
                    schema/Op :task/update-working $ schema/TaskEdit :id |t1 :text |edited
                    , 7 |edit 4
                  finished $ updater edited (schema/Op :task/finish-working |t1) 7 |finish 5
                  restored $ updater finished (schema/Op :task/put-back |t1) 7 |restore 6
                  with-note $ updater restored (schema/Op :note/add |note) 7 |n1 7
                  note-edited $ updater with-note
                    schema/Op :note/edit $ schema/NoteEdit :id |n1 :text |new-note
                    , 7 |edit-note 8
                  legacy $ schema/database-to-map note-edited
                  removed $ updater note-edited (schema/Op :note/remove |n1) 7 |remove-note 9
                  logged-out $ updater removed (schema/Op :user/log-out) 7 |logout 10
                  logged-in $ updater logged-out
                    schema/Op :user/log-in $ [] |Alice |secret
                    , 7 |login 11
                  disconnected $ updater logged-in (schema/Op :session/disconnect) 7 |disconnect 12
                assert= |edited $ schema/read-path legacy $ [] :users |u1 :tasks :working |t1 :text
                assert= 6 $ schema/read-path legacy $ [] :users |u1 :tasks :working |t1 :touched-time
                assert= |new-note $ schema/read-path legacy $ [] :users |u1 :notes |n1 :text
                assert= |u1 $ schema/read-path (schema/database-to-map logged-in) ([] :sessions 7 :user-id)
                assert= nil $ schema/read-path (schema/database-to-map removed) ([] :users |u1 :notes |n1)
                assert= logged-out $ updater logged-out (schema/Op :task/create-working |forbidden) 7 |bad 12
                assert= disconnected $ updater disconnected (schema/Op :note/add |late) 7 |bad 13
                assert= disconnected $ updater disconnected
                  schema/Op :user/sign-up $ [] |Bob |secret
                  , 7 |bad 14
              :tags $ #{} :server
            %{} 'TestEntry (:name |authentication-and-missing-records)
              :code $ quote $ let
                  connected $ updater schema/empty-database (schema/Op :session/connect) 7 |connect 1
                  signed $ updater connected
                    schema/Op :user/sign-up $ [] |Alice |secret
                    , 7 |u1 2
                  logged-out $ updater signed (schema/Op :user/log-out) 7 |logout 3
                  wrong $ updater logged-out
                    schema/Op :user/log-in $ [] |Alice |wrong
                    , 7 |wrong 4
                  duplicate $ updater wrong
                    schema/Op :user/sign-up $ [] |Alice |secret
                    , 7 |duplicate 5
                  legacy $ schema/database-to-map duplicate
                assert= nil $ schema/read-path legacy $ [] :sessions 7 :user-id
                assert= 1 $ count $ :users duplicate
                assert= "|Wrong password for Alice" $ schema/read-path legacy $ [] :sessions 7 :messages |wrong :text
                assert= "|Name is taken: Alice" $ schema/read-path legacy $ [] :sessions 7 :messages |duplicate :text
                assert= signed $ updater signed (schema/Op :task/touch-working |absent) 7 |op 6
                assert= signed $ updater signed (schema/Op :task/pend |absent) 7 |op 6
                assert= signed $ updater signed (schema/Op :task/finish-working |absent) 7 |op 6
                assert= signed $ updater signed
                  schema/Op :note/edit $ schema/NoteEdit :id |absent :text |x
                  , 7 |op 6
              :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require ([] app.updater.session :as session) ([] app.updater.user :as user) ([] app.updater.router :as router) ([] app.updater.misc :as misc) ([] app.updater.task :as task) ([] app.updater.note :as note) ([] app.schema :as schema)
            [] respo-message.updater :refer $ [] update-messages
    'app.updater.misc $ %{} 'FileEntry
      :defs $ {} $ 'set-today
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-today (db op-data sid op-id op-time)
            struct-with db $ :today op-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
          :tests $ []
            %{} 'TestEntry (:name |preserves-other-fields)
              :code $ quote $ let
                  db $ schema/test-database
                  updated $ set-today db |2026-09-27 7 |op 1
                assert= |2026-09-27 $ :today updated
                assert= (:users db) (:users updated)
                assert= (:sessions db) (:sessions updated)
              :tags $ #{} :server
            %{} 'TestEntry (:name |adds-missing-today)
              :code $ quote $ let
                  loaded $ assert-type
                    match
                      schema/load-database $ {}
                      (:ok value) value
                      (:err message) (raise message)
                    , 'app.schema/DatabaseRecord
                  updated $ set-today loaded |2026-09-27 7 |op 1
                assert= |2026-09-27 $ :today updated
              :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.misc
          :require $ app.schema :as schema
    'app.updater.note $ %{} 'FileEntry
      :defs $ {}
        'add-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn add-note (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              struct-with user-record $ :notes $ assoc (:notes user-record) op-id (schema/NoteRecord :id op-id :text op-data :time op-time)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
        'edit-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn edit-note (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              match
                get (:notes user-record) (:id op-data)
                (:none) user-record
                (:some note)
                  struct-with user-record $ :notes $ assoc (:notes user-record) (:id op-data)
                    struct-with note $ :text $ :text op-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'app.schema/NoteEdit 'Number 'String 'Number
        'remove-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-note (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              struct-with user-record $ :notes $ dissoc (:notes user-record) op-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.note
          :require $ [] app.schema :as schema
    'app.updater.router $ %{} 'FileEntry
      :defs $ {} $ 'change
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn change (db op-data sid op-id op-time)
            schema/update-session db sid $ fn (session-record)
              hint-fn $ {}
                :args $ [] 'app.schema/SessionRecord
                :return 'app.schema/SessionRecord
              struct-with session-record $ :router op-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'app.schema/Route 'Number 'String 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.router
          :require $ app.schema :as schema
    'app.updater.session $ %{} 'FileEntry
      :defs $ {}
        'connect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn connect (db sid op-id op-time)
            struct-with db $ :sessions $ assoc (:sessions db) sid (schema/new-session sid)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'Number 'String 'Number
          :tests $ [] $ %{} 'TestEntry (:name |initializes-session-and-preserves-other-fields)
            :code $ quote $ let
                db $ schema/test-database
                updated $ connect db 9 |op 1
              assert= (:users db) (:users updated)
              assert= (:today db) (:today updated)
              assert=
                get (:sessions db) 7
                get (:sessions updated) 7
              assert=
                %some $ schema/new-session 9
                get (:sessions updated) 9
            :tags $ #{} :server
        'disconnect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn disconnect (db sid op-id op-time)
            struct-with db $ :sessions $ dissoc (:sessions db) sid
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'Number 'String 'Number
          :tests $ [] $ %{} 'TestEntry (:name |removes-only-target-session)
            :code $ quote $ let
                db $ schema/test-database
                updated $ disconnect db 7 |op 1
              assert= (%none)
                get (:sessions updated) 7
              assert=
                get (:sessions db) 8
                get (:sessions updated) 8
              assert= (:users db) (:users updated)
            :tags $ #{} :server
        'remove-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-message (db op-data sid op-id op-time)
            schema/update-session db sid $ fn (session-record)
              hint-fn $ {}
                :args $ [] 'app.schema/SessionRecord
                :return 'app.schema/SessionRecord
              struct-with session-record $ :messages $ dissoc (:messages session-record) op-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
          :tests $ []
            %{} 'TestEntry (:name |removes-only-target-session-message)
              :code $ quote $ let
                  db $ schema/test-database
                  updated $ remove-message db |m1 7 |op 1
                  session-record $
                    get (:sessions updated) 7
                    , .unwrap
                assert= (%none)
                  get (:messages session-record) |m1
                assert=
                  %some $ schema/NotificationRecord :id |m2 :text |keep
                  get (:messages session-record) |m2
                assert=
                  get (:sessions db) 8
                  get (:sessions updated) 8
                assert= updated $ remove-message updated |m1 7 |op 2
              :tags $ #{} :server
            %{} 'TestEntry (:name |missing-session-is-no-op)
              :code $ quote $ let
                  db $ schema/test-database
                assert= db $ remove-message db |m1 99 |op 1
              :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.session
          :require $ [] app.schema :as schema
    'app.updater.task $ %{} 'FileEntry
      :defs $ {}
        'create-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn create-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              let
                  tasks $ :tasks user-record
                  task $ schema/TaskRecord :id op-id :text op-data :detail | :pending? false :created-time $ %some op-time
                struct-with user-record $ :tasks $ struct-with tasks
                  :working $ assoc (:working tasks) op-id task
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
        'finish-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn finish-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              let
                  tasks $ :tasks user-record
                match
                  get (:working tasks) op-data
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :working $ dissoc (:working tasks) op-data
                      :finished $ assoc (:finished tasks) op-data $ struct-with task
                        :finished-time $ %some op-time
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
        'pend $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn pend (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              let
                  tasks $ :tasks user-record
                  id op-data
                match
                  get (:working tasks) id
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :working $ assoc (:working tasks) id $ struct-with task
                        :pending? $ not $ :pending? task
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
          :tests $ [] $ %{} 'TestEntry (:name |toggles-pending-and-preserves-other-tasks)
            :code $ quote $ let
                db $ schema/test-database
                once $ pend db |t1 7 |op1 1
                twice $ pend once |t1 7 |op2 2
                legacy $ schema/database-to-map once
              assert= true $ schema/read-path legacy $ [] :users |u1 :tasks :working |t1 :pending?
              assert= db twice
              assert= true $ schema/read-path (schema/database-to-map twice) ([] :users |u1 :tasks :working |t2 :pending?)
            :tags $ #{} :server
        'put-back $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn put-back (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              let
                  tasks $ :tasks user-record
                match
                  get (:finished tasks) op-data
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :finished $ dissoc (:finished tasks) op-data
                      :working $ assoc (:working tasks) op-data $ struct-with task
                        :touched-time $ %some op-time
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
        'remove-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              let
                  tasks $ :tasks user-record
                struct-with user-record $ :tasks $ struct-with tasks
                  :working $ dissoc (:working tasks) op-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
          :tests $ [] $ %{} 'TestEntry (:name |removes-only-new-fixture-task)
            :code $ quote $ let
                db $ schema/test-database
                updated $ schema/database-to-map $ remove-working db |t1 7 |op 1
                original $ schema/database-to-map db
              assert= nil $ schema/read-path updated $ [] :users |u1 :tasks :working |t1
              assert=
                schema/read-path original $ [] :users |u1 :tasks :working |t2
                schema/read-path updated $ [] :users |u1 :tasks :working |t2
            :tags $ #{} :server
        'touch-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn touch-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              let
                  tasks $ :tasks user-record
                  id op-data
                match
                  get (:working tasks) id
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :working $ assoc (:working tasks) id $ struct-with task
                        :touched-time $ %some op-time
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'String 'Number 'String 'Number
        'update-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ {}
                :args $ [] 'app.schema/UserRecord
                :return 'app.schema/UserRecord
              let
                  tasks $ :tasks user-record
                  id $ :id op-data
                match
                  get (:working tasks) id
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :working $ assoc (:working tasks) id $ struct-with task
                        :text $ :text op-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'app.schema/TaskEdit 'Number 'String 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.task
          :require $ [] app.schema :as schema
    'app.updater.user $ %{} 'FileEntry
      :defs $ {}
        'log-in $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn log-in (db op-data sid op-id op-time)
            if
              and
                = 2 $ count op-data
                contains? (:sessions db) sid
              let
                  username $
                    nth op-data 0
                    , .unwrap
                  password $
                    nth op-data 1
                    , .unwrap
                  existing $ find
                    -> (:users db) (vals) (.to-list)
                    fn (user-record)
                      hint-fn $ {}
                        :args $ [] 'app.schema/UserRecord
                        :return 'Bool
                      = username $ :name user-record
                match existing
                  (:none)
                    schema/add-session-message db sid op-id $ str "|No user named: " username
                  (:some user-record)
                    if
                      = (:password user-record)
                        %some $ md5 password
                      schema/update-session db sid $ fn (session-record)
                        hint-fn $ {}
                          :args $ [] 'app.schema/SessionRecord
                          :return 'app.schema/SessionRecord
                        struct-with session-record $ :user-id $ %some (:id user-record)
                      schema/add-session-message db sid op-id $ str "|Wrong password for " username
              , db
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord (:: 'List 'String) 'Number 'String 'Number
        'log-out $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn log-out (db sid op-id op-time)
            schema/update-session db sid $ fn (session-record)
              hint-fn $ {}
                :args $ [] 'app.schema/SessionRecord
                :return 'app.schema/SessionRecord
              struct-with session-record $ :user-id $ %none
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'Number 'String 'Number
        'sign-up $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sign-up (db op-data sid op-id op-time)
            if
              and
                = 2 $ count op-data
                contains? (:sessions db) sid
              let
                  username $
                    nth op-data 0
                    , .unwrap
                  password $
                    nth op-data 1
                    , .unwrap
                  existing $ find
                    -> (:users db) (vals) (.to-list)
                    fn (user-record)
                      hint-fn $ {}
                        :args $ [] 'app.schema/UserRecord
                        :return 'Bool
                      = username $ :name user-record
                match existing
                  (:some _)
                    schema/add-session-message db sid op-id $ str "|Name is taken: " username
                  (:none)
                    let
                        user-record $ schema/UserRecord :id op-id :name username :nickname (%some username) :avatar (%none) :password
                          %some $ md5 password
                          , :tasks
                            schema/UserTasks :working ({}) :pending ({}) :finished $ {}
                            , :notes $ {}
                        with-user $ struct-with db $ :users
                          assoc (:users db) op-id user-record
                      schema/update-session with-user sid $ fn (session-record)
                        hint-fn $ {}
                          :args $ [] 'app.schema/SessionRecord
                          :return 'app.schema/SessionRecord
                        struct-with session-record $ :user-id $ %some op-id
              , db
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord (:: 'List 'String) 'Number 'String 'Number
          :tests $ [] $ %{} 'TestEntry (:name |new-user-retains-default-collections)
            :code $ quote $ let
                db $ struct-with schema/empty-database $ :sessions
                  {} $ 7 $ schema/new-session 7
                updated $ sign-up db ([] |Alice |secret) 7 |u1 1
                user-record $
                  get (:users updated) |u1
                  , .unwrap
                session-record $
                  get (:sessions updated) 7
                  , .unwrap
              assert= (%some |u1) (:user-id session-record)
              assert= ({}) (:notes user-record)
              assert= ({})
                :working $ :tasks user-record
              assert= ({})
                :finished $ :tasks user-record
            :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.user
          :require
            [] cumulo-util.core :refer $ [] find-first
            calcit.std.hash :refer $ md5
            app.schema :as schema
