
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {}
    :default $ {} (:description "||Browser client bundle") (:init-fn 'app.client/main!) (:mode :js) (:reload-fn 'app.client/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |recollect/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo-markdown.calcit/ |respo.calcit/ |js-ffi/
      :type-slots $ {} $ :dispatch-op |app.schema/Op
    :server $ {} (:description "||Realtime server") (:init-fn 'app.server/main!) (:mode :native) (:reload-fn 'app.server/reload!) (:target :native)
      :feature-policy $ {}
      :modules $ [] |recollect/ |cumulo-util.calcit/ |cumulo-reel.calcit/ |calcit.std/ |calcit-wss/
      :type-slots $ {}
  :files $ {}
    'app.client $ %{} 'FileEntry
      :defs $ {}
        '*connected? $ %{} 'CodeEntry (:doc "|Whether the active ws-edn generation is open.")
          :code $ quote $ defref *connected? false
          :examples $ []
          :schema $ :: 'Ref 'Bool
        '*states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *states
            {} $ :states $ {}
              :cursor $ []
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Tag 'Dynamic
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store (:: :initial)
          :examples $ []
          :schema $ :: 'Ref
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-revision 0
          :examples $ []
          :schema $ :: 'Ref 'Number
        '*ws-client $ %{} 'CodeEntry
          :doc "|Current nominal ws-edn client retained across browser recovery events."
          :code $ quote $ defref *ws-client (Option :none)
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
                  str $ :port config/site
                ws-url $ if config/dev? (str |ws:// host |: port) |wss://timegrass.topix.im/ws
              js/console.info |[connection] |opening ws-url
              reset! *store $ :: :loading
              reset! *ws-client $ Option :some $ ws-connect! ws-url
                {}
                  :on-open $ fn (event) (js/console.info |[connection] |open ws-url) (reset! *connected? true) (request-snapshot!) (send-activity!) (simulate-login!)
                  :on-close $ fn (event) (reset! *connected? false)
                    reset! *store $ :: :offline
                    js/console.error |[connection] |closed ws-url
                  :on-data on-server-data
                  :heartbeat-timeout-ms 75000
                  :class-mapper $ {} (:ServerMessage schema/ServerMessage) (:change-op patch-schema/change-op)
              , &unit
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
                reset! *states $ decode-map-as (update-states @*states cursor s) (:: 'Map 'Tag 'Dynamic)
              (:effect/connect) (connect!)
              _ $ ws-send! $ schema/ClientMessage :dispatch op
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'app.schema/Op
          :tests $ [] $ %{} 'TestEntry
            :name |state-update-preserves-mixed-cursor-and-returns-unit
            :code $ quote $ let
                saved @*states
                cursor $ [] :panel |task-1 7
                state $ {} $ :text |Draft
                initial $ {} (:other |unchanged)
                  :states $ {} $ :peer
                    {} $ :data |untouched
              reset! *states initial
              let
                  returned $ dispatch! $ schema/Op :states cursor state
                  updated @*states
                reset! *states saved
                assert= &unit returned
                assert= (Option :some |unchanged)
                  get-in updated $ [] :other
                assert= (Option :some |untouched)
                  get-in updated $ [] :states :peer :data
                assert= (Option :some state)
                  get-in updated $ [] :states :panel |task-1 7 :data
            :tags $ #{} :client :js
        'dispatch-render-operation! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch-render-operation! (raw)
            if (enum? raw)
              match (schema/decode-operation raw)
                (:ok operation) (dispatch! operation)
                (:err error)
                  match error $
                    :invalid message
                    raise message
              raise "|Expected application operation enum"
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
          :tests $ []
            %{} 'TestEntry
              :name |rejects-invalid-render-operation-without-state-change
              :code $ quote $ let
                  saved @*states
                  rejected $ try
                    do (dispatch-render-operation! nil) false
                    fn (message) (starts-with? message "|Expected application operation enum")
                assert= true rejected
                assert= saved @*states
              :tags $ #{} :client :js
            %{} 'TestEntry
              :name |checked-render-operation-preserves-mixed-cursor-and-returns-unit
              :code $ quote $ let
                  saved @*states
                  cursor $ [] :panel |task-1 7
                  state $ {} $ :text |Draft
                  initial $ {} (:other |unchanged)
                    :states $ {} $ :peer
                      {} $ :data |untouched
                reset! *states initial
                let
                    returned $ dispatch-render-operation! $ schema/Op :states cursor state
                    updated @*states
                  reset! *states saved
                  assert= &unit returned
                  assert= (Option :some |unchanged)
                    get-in updated $ [] :other
                  assert= (Option :some |untouched)
                    get-in updated $ [] :states :peer :data
                  assert= (Option :some state)
                    get-in updated $ [] :states :panel |task-1 7 :data
              :tags $ #{} :client :js
            %{} 'TestEntry (:name |accepts-framework-list-cursor-dispatch)
              :code $ quote $ let
                  saved @*states
                  cursor $ [] :panel |task-1 7
                  state $ {} $ :text |Draft
                  initial $ {} (:other |unchanged)
                    :states $ {} $ :peer
                      {} $ :data |untouched
                reset! *states initial
                let
                    returned $ let
                        forward $ respo.controller.client/wrap-dispatch $ ref dispatch-render-operation!
                      forward cursor state
                    updated @*states
                  reset! *states saved
                  assert= &unit returned
                  assert= (Option :some |unchanged)
                    get-in updated $ [] :other
                  assert= (Option :some |untouched)
                    get-in updated $ [] :states :peer :data
                  assert= (Option :some state)
                    get-in updated $ [] :states :panel |task-1 7 :data
              :tags $ #{} :client :js
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
            add-watch! *store :changes render-on-state-change!
            add-watch! *states :changes render-on-state-change!
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
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mount-target
            option:unwrap $ query-selector |.app
          :examples $ []
          :schema $ :: 'respo.dom/DomElement
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
            if (non-nil? client-errors)
              hud! |error $ str client-errors
              do (hud! |inactive nil) (remove-watch! *store :changes) (remove-watch! *states :changes) (clear-cache!) (render-app!) (add-watch! *store :changes render-on-state-change!) (add-watch! *states :changes render-on-state-change!) (ws-set-on-data! on-server-data) (println "|Code updated.")
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render! mount-target
              comp-container
                match (calcit.core/get @*states :states)
                  (:some value) value
                  (:none) nil
                , @*store
              , dispatch-render-operation!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'render-on-state-change! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-on-state-change! (value previous) (render-app!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'T 'T
            :features $ #{} :js-ffi
            :generics $ [] 'T
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
            match
              storage-get $ :storage-key config/site
              (:some raw)
                do (println "|Found storage.")
                  match
                    schema/decode-operation $ :: :user/log-in $ parse-cirru-edn raw
                    (:ok op) (dispatch! op)
                    (:err _) (println "|Invalid saved login credentials")
              (:none) (println "|Found no storage.")
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |returns-unit-with-isolated-storage)
            :code $ quote $ assert= &unit (simulate-login!)
            :tags $ #{} :auto-login-contract :js
        'validate-server-patch $ %{} 'CodeEntry
          :doc "|Apply one validated patch batch only when its base revision matches the local state."
          :code $ quote $ defn validate-server-patch (store local-revision base-revision changes)
            if (= base-revision local-revision)
              match
                patch-batch:apply-to
                  assert-traits (patch-batch changes) PatchBatchOps
                  , store
                (:ok next-store) (Result :ok next-store)
                (:err error)
                  Result :err $ ClientPatchError :invalid-patch error
              Result :err $ ClientPatchError :revision-mismatch base-revision local-revision
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
                  %err $ ClientPatchError :revision-mismatch 8 7
                  validate-server-patch store 7 8 changes
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patch-atomically)
              :code $ quote $ let
                  store $ {} $ :stable 1
                  changes $ [] (%:: patch-schema/change-op :assoc :temporary 2)
                    %:: patch-schema/change-op :update :missing $ %:: patch-schema/change-op :replace 3
                  expected $ %err $ ClientPatchError :invalid-patch
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
            |dayjs :default dayjs
            recollect.schema :as patch-schema
            cumulo-util.activity :as activity
            recollect.patch :refer $ patch-batch patch-batch:apply-to PatchBatchOps PatchError PatchPathSegment patch-error-message
            js-ffi.shared :refer $ console-warn! console-error!
            respo.ffi.browser :refer $ query-selector
            js-ffi.browser :refer $ storage-get
            |./calcit.build-errors.mjs :default client-errors
            |dayjs/plugin/weekOfYear.js :default week-of-year
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container (states store)
            let
                render-loaded $ fn ()
                  hint-fn $ {}
                    :args $ []
                    :return 'respo.schema/Element
                  let
                      states $ decode-map-as states 'Map
                      store $ decode-map-as store 'Map
                      session $ match (calcit.core/get store :session)
                        (:some value) (decode-map-as value 'Map)
                        (:none)
                          raise "|decode-map-as failed at $.session: missing required Map"
                      router $ let
                          read-session-router $ fn ()
                            hint-fn $ {}
                              :args $ []
                              :return 'Map
                            match (calcit.core/get session :router)
                              (:some value) (decode-map-as value 'Map)
                              (:none)
                                raise "|decode-map-as failed at $.session.router: missing required Map"
                        match (calcit.core/get store :router)
                          (:some value)
                            if (map? value) (decode-map-as value 'Map) (read-session-router)
                          (:none) (read-session-router)
                      logged-in? $ match (calcit.core/get store :logged-in?)
                        (:some value) (decode-map-as value 'Bool)
                        (:none) (decode-map-as nil 'Bool)
                      count-members $ decode-map-as (get store :count) (:: 'Option 'Number)
                      route-name $ match (calcit.core/get router :name)
                        (:some value) (decode-map-as value 'Tag)
                        (:none) (decode-map-as nil 'Tag)
                    div
                      {} $ :class-name css-container
                      comp-navigation logged-in? count-members route-name
                      if logged-in?
                        match route-name
                          :home $ comp-overview (>> states :overview)
                            match (calcit.core/get store :today)
                              (:some value) (decode-map-as value 'String)
                              (:none) (decode-map-as nil 'String)
                            decode-map-as
                              option:unwrap-or
                                get-in router $ [] :data :tasks
                                {}
                              :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                          :history $ comp-history (>> states :history)
                            decode-map-as
                              option:unwrap-or
                                get-in router $ [] :data :week
                                {}
                              :: 'Map 'Tag 'Dynamic
                            decode-map-as
                              option:unwrap-or
                                get-in router $ [] :data :tasks
                                {}
                              :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                          :notes $ comp-notes-page (>> states :notes)
                            match (calcit.core/get router :data)
                              (:some value)
                                decode-map-as value $ :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                              (:none)
                                decode-map-as nil $ :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                            decode-map-as
                              option:unwrap-or
                                get-in session $ [] :router :data
                                {}
                              :: 'Map 'Tag 'Number
                          :profile $ comp-profile
                            match (calcit.core/get store :user)
                              (:some value)
                                decode-map-as value $ :: 'Map 'Tag 'Dynamic
                              (:none)
                                decode-map-as nil $ :: 'Map 'Tag 'Dynamic
                            match (calcit.core/get router :data)
                              (:some value)
                                decode-map-as value $ :: 'Map 'Number 'String
                              (:none)
                                decode-map-as nil $ :: 'Map 'Number 'String
                          _ $ <> $ str "|404 page:" router
                        comp-login $ >> states :login
                      comp-status-color $ decode-map-as (get store :color) (:: 'Option 'String)
                      when dev? $ comp-inspect |Store store $ {} (:bottom 0) (:left 0) (:z-index 9999)
                      comp-messages
                        match (calcit.core/get session :messages)
                          (:some value)
                            decode-map-as value $ :: 'Map 'String 'Dynamic
                          (:none)
                            decode-map-as nil $ :: 'Map 'String 'Dynamic
                        {}
                        fn (info d!)
                          match
                            schema/decode-operation $ :: :session/remove-message info
                            (:ok op) (d! op)
                            (:err _) &unit
                      when dev? $ comp-reel
                        match (calcit.core/get store :reel-length)
                          (:some value) (decode-map-as value 'Number)
                          (:none) (decode-map-as nil 'Number)
                        {}
              if (enum? store)
                match store
                  (:initial) (comp-offline :initial)
                  (:offline) (comp-offline :offline)
                  _ $ render-loaded
                render-loaded
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] 'Dynamic 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |offline-skips-store-boundary)
              :code $ quote $ let
                  check-offline $ fn (states status expected)
                    let
                        child $ match
                          .unwrap $ :tree $ comp-container states status
                          (:component value) value
                          (:element _) (raise |Expected-offline-component)
                        root $ match
                          .unwrap $ :tree child
                          (:element value) value
                          (:component _) (raise |Expected-offline-element)
                        link $ match
                          .unwrap $ :node $ .unwrap
                            nth (:children root) 2
                          (:element value) value
                          (:component _) (raise |Expected-reconnect-element)
                        label $ match
                          .unwrap $ :node $ .unwrap
                            nth (:children link) 0
                          (:element value) value
                          (:component _) (raise |Expected-offline-label)
                      assert= :comp-offline $ :name child
                      assert=
                        [] $ [] :inner-text expected
                        :attrs label
                check-offline nil (:: :initial) |Loading...
                check-offline 7 (:: :offline) "|Socket broken! Click to retry."
              :tags $ #{} :container-contract :js
            %{} 'TestEntry (:name |preserves-unknown-route-and-extra-fields)
              :code $ quote $ let
                  route $ {} (:name :unknown) (:data 7) (|extra |preserved)
                  store $ {} (:logged-in? true) (:count 1) (:router route)
                    :session $ {}
                      :messages $ {}
                      :router $ {} (:name :ignored)
                        :data $ {}
                  states $ {}
                    :cursor $ []
                    |extra |preserved
                  component $ comp-container states store
                  root $ match
                    .unwrap $ :tree component
                    (:element value) value
                    (:component _) (raise |Expected-container-element)
                  content $ match
                    .unwrap $ :node $ .unwrap
                      nth (:children root) 1
                    (:element value) value
                    (:component _) (raise |Expected-fallback-element)
                assert=
                  <> $ str "|404 page:" route
                  , content
                assert= (Option :some |preserved) (get states |extra)
                assert= (Option :some 7) (get route :data)
              :tags $ #{} :container-contract :js
            %{} 'TestEntry (:name |preserves-session-router-fallback)
              :code $ quote $ let
                  route $ {} (:name :unknown-session)
                    :data $ []
                  store $ {} (:logged-in? true) (:count 1) (:router :not-a-map)
                    :session $ {}
                      :messages $ {}
                      :router route
                  component $ comp-container
                    {} $ :cursor $ []
                    , store
                  root $ match
                    .unwrap $ :tree component
                    (:element value) value
                    (:component _) (raise |Expected-container-element)
                  content $ match
                    .unwrap $ :node $ .unwrap
                      nth (:children root) 1
                    (:element value) value
                    (:component _) (raise |Expected-fallback-element)
                assert=
                  <> $ str "|404 page:" route
                  , content
              :tags $ #{} :container-contract :js
            %{} 'TestEntry (:name |rejects-non-map-loaded-boundaries)
              :code $ quote $ let
                  store $ {} (:logged-in? true) (:count 1)
                    :router $ {} (:name :unknown)
                      :data $ {}
                    :session $ {} $ :messages ({})
                assert= true $ try
                  do
                    comp-container ({}) 7
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do (comp-container 7 store) false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-container ({}) (assoc store :session 7)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :container-contract :js
            %{} 'TestEntry
              :name |router-fallback-is-lazy-and-handles-absent-nil-false
              :code $ quote $ let
                  route $ {} (:name :fallback-route) (:data 7)
                  base $ {} (:logged-in? true) (:count 1)
                    :session $ {}
                      :messages $ {}
                      :router route
                  check-route $ fn (store expected-route)
                    let
                        root $ match
                          .unwrap $ :tree $ comp-container
                            {} $ :cursor $ []
                            , store
                          (:element value) value
                          (:component _) (raise |Expected-container-element)
                        content $ match
                          .unwrap $ :node $ .unwrap
                            nth (:children root) 1
                          (:element value) value
                          (:component _) (raise |Expected-fallback-element)
                      assert=
                        <> $ str "|404 page:" expected-route
                        , content
                check-route base route
                check-route (assoc base :router nil) route
                check-route (assoc base :router false) route
                check-route
                  assoc (assoc base :router route) :session $ {} (:router 7)
                    :messages $ {}
                  , route
              :tags $ #{} :container-contract :js
            %{} 'TestEntry
              :name |missing-required-session-and-router-have-field-paths
              :code $ quote $ let
                  states $ {} $ :cursor ([])
                assert= true $ try
                  do
                    comp-container states $ {}
                    , false
                  fn (message)
                    = "|decode-map-as failed at $.session: missing required Map" message
                assert= true $ try
                  do
                    comp-container states $ {} (:logged-in? true) (:count 1)
                      :session $ {} $ :messages ({})
                    , false
                  fn (message)
                    = "|decode-map-as failed at $.session.router: missing required Map" message
              :tags $ #{} :container-contract :js
            %{} 'TestEntry (:name |preserves-logged-out-false-and-optional-count)
              :code $ quote $ let
                  states $ {} $ :cursor ([] :container |panel 7)
                  store $ {} (:logged-in? false)
                    :router $ {} $ :name :unknown
                    :session $ {} $ :messages ({})
                  check-login $ fn (candidate)
                    let
                        root $ match
                          .unwrap $ :tree $ comp-container states candidate
                          (:element value) value
                          (:component _) (raise |Expected-container-element)
                        content $ match
                          .unwrap $ :node $ .unwrap
                            nth (:children root) 1
                          (:component value) value
                          (:element _) (raise |Expected-login-component)
                      assert= :comp-login $ :name content
                check-login store
                check-login $ assoc store :count 0
                assert= (Option :some false) (get store :logged-in?)
                assert= (Option :none) (get store :count)
              :tags $ #{} :container-contract :js
            %{} 'TestEntry (:name |preserves-navigation-scalar-validation-order)
              :code $ quote $ let
                  states $ {} $ :cursor ([])
                  store $ {} (:logged-in? 7) (:count |bad-count)
                    :router $ {} $ :name 7
                    :session $ {} $ :messages ({})
                  logged-in-error $ try (decode-map-as 7 'Bool)
                    fn (message) message
                  count-error $ try
                    decode-map-as (Option :some |bad-count) (:: 'Option 'Number)
                    fn (message) message
                  name-error $ try (decode-map-as 7 'Tag)
                    fn (message) message
                assert= logged-in-error $ try (comp-container states store)
                  fn (message) message
                assert= count-error $ try
                  comp-container states $ assoc store :logged-in? false
                  fn (message) message
                assert= name-error $ try
                  comp-container states $ dissoc (assoc store :logged-in? false) :count
                  fn (message) message
              :tags $ #{} :container-contract :js
        'comp-offline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-offline (state)
            div
              {} $ :class-name css-offline
              div $ {} $ :style
                {} $ :height 0
              div $ {} $ :style
                {}
                  :background-image $ str "|url(" (:icon config/site) "|)"
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
              :style $ {} $ :background-color
                match color
                  (:some value) value
                  (:none) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] $ :: 'Option 'String
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
            merge-styles ui/global ui/fullscreen ui/column-dispersive $ {} $ :background-color (:theme config/site)
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
          :code $ quote $ defcomp comp-done-task (states task) (decode-map-as states 'Map)
            let
                cursor $ match
                  get-in states $ [] :cursor
                  (:some value) (decode-map-as value 'List)
                  (:none) (decode-map-as nil 'List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:some value)
                      or value $ {} $ :show-menu? false
                    (:none)
                      {} $ :show-menu? false
                  , 'Map
                finished-time $ :finished-time task
                task-id $ :id task
              div
                {} (:class-name css-done-task)
                  :style $ merge-styles
                    {} $ :padding "|4px 8px"
                    if
                      match (calcit.core/get state :show-menu?)
                        (:some value) value
                        (:none) nil
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
                  <> $ :text task
                comp-modal-menu
                  {} (:title |Operations)
                    :style $ {} $ :width 320
                    :items $ [] $ :: :item :put-back "|Put back"
                  decode-map-as
                    option:unwrap-or (get state :show-menu?) false
                    , 'Bool
                  fn (d!)
                    d! $ :: :states cursor $ assoc state :show-menu? false
                  fn (item d!)
                    d! $ :: :states cursor $ assoc state :show-menu? false
                    if (nil? item) &unit $ if (enum? item)
                      let
                          action $ decode-map-as (&enum:nth item 1) 'Tag
                        when (= :put-back action)
                          d! $ :: :task/put-back task-id
                      raise "|Menu selection must be an item enum"
                    , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'StateKey 'Dynamic) 'app.schema/FinishedTaskView
            :generics $ [] 'StateKey
          :tests $ []
            %{} 'TestEntry (:name |accepts-tag-string-number-state-branches)
              :code $ quote $ let
                  task $ schema/FinishedTaskView :id |task-1 :text |Done :finished-time 1735689600000
                  root $ {}
                    :cursor $ [] :root
                    :panel $ {} $ :data ({})
                    |task-1 $ {} $ :data ({})
                    7 $ {} $ :data ({})
                  tag-branch $ >> root :panel
                  string-branch $ >> root |task-1
                  number-branch $ >> root 7
                assert= :comp-done-task $ :name $ comp-done-task tag-branch task
                assert= :comp-done-task $ :name $ comp-done-task string-branch task
                assert= :comp-done-task $ :name $ comp-done-task number-branch task
                assert= ([] :root :panel)
                  match (calcit.core/get tag-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root |task-1)
                  match (calcit.core/get string-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root 7)
                  match (calcit.core/get number-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root)
                  match (calcit.core/get root :cursor)
                    (:some value) value
                    (:none) nil
              :tags $ #{} :js
            %{} 'TestEntry (:name |click-preserves-state-and-mixed-cursor)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:show-menu? false) (|extra |preserved)
                  task $ schema/FinishedTaskView :id |task-1 :text |Done :finished-time 1735689600000
                  component $ comp-done-task
                    {} (:cursor cursor) (:data state)
                    , task
                  tree $ match
                    .unwrap $ :tree component
                    (:element value) value
                    (:component _) (raise |Expected-task-element)
                  click $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event tree) :click
                  calls $ ref 0
                  dispatch! $ fn (op)
                    hint-fn $ {} (:return 'Unit)
                      :args $ [] 'app.schema/Op
                    match op
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-menu? true) payload
                      _ $ raise |Expected-state-operation
                    swap! calls inc
                    , &unit
                click ({}) dispatch!
                assert= 1 @calls
                assert= false $ match (calcit.core/get state :show-menu?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :js :task-state-contract
            %{} 'TestEntry (:name |rejects-invalid-state-containers)
              :code $ quote $ let
                  task $ schema/FinishedTaskView :id |task-1 :text |Done :finished-time 1735689600000
                assert= true $ try
                  do
                    comp-done-task
                      {}
                        :cursor $ []
                        :data 7
                      , task
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-done-task
                      {} (:cursor |invalid)
                        :data $ {} $ :show-menu? false
                      , task
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :js :task-state-contract
            %{} 'TestEntry (:name |clear-closes-without-changing-task)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:show-menu? true) (|extra |preserved)
                  states $ {} (:cursor cursor) (:data state)
                  element $ fn (node)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/RenderNode
                      :return 'respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/Element 'Number
                      :return 'respo.schema/RenderNode
                    .unwrap $ :node $ .unwrap
                      nth (:children parent) index
                  root $ element $ .unwrap
                    :tree $ comp-done-task states $ schema/FinishedTaskView :id |task-1 :text |Done :finished-time 1735689600000
                  menu $ match (child root 3)
                    (:component value) value
                    (:element _) (raise |Expected-menu-component)
                  menu-root $ element $ .unwrap (:tree menu)
                  backdrop $ element $ child menu-root 0
                  card $ element $ child backdrop 0
                  header $ element $ child card 0
                  button $ element $ child header 2
                  click $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event button) :click
                  calls $ ref 0
                  dispatch! $ fn (operation)
                    hint-fn $ {}
                      :args $ [] 'app.schema/Op
                      :return 'Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-menu? false) payload
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click ({}) dispatch!
                assert= 1 @calls
                assert= true $ match (calcit.core/get state :show-menu?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :js :menu-contract
            %{} 'TestEntry (:name |selection-dispatches-action-and-closes)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:show-menu? true) (|extra |preserved)
                  states $ {} (:cursor cursor) (:data state)
                  element $ fn (node)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/RenderNode
                      :return 'respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/Element 'Number
                      :return 'respo.schema/RenderNode
                    .unwrap $ :node $ .unwrap
                      nth (:children parent) index
                  root $ element $ .unwrap
                    :tree $ comp-done-task states $ schema/FinishedTaskView :id |task-1 :text |Done :finished-time 1735689600000
                  menu $ match (child root 3)
                    (:component value) value
                    (:element _) (raise |Expected-menu-component)
                  menu-root $ element $ .unwrap (:tree menu)
                  backdrop $ element $ child menu-root 0
                  card $ element $ child backdrop 0
                  header $ element $ child card 0
                  button $ element $ child
                    element $ child card 1
                    , 0
                  click $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event button) :click
                  calls $ ref 0
                  dispatch! $ fn (operation)
                    hint-fn $ {}
                      :args $ [] 'app.schema/Op
                      :return 'Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-menu? false) payload
                      (:task/put-back id) (assert= |task-1 id)
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click ({}) dispatch!
                assert= 2 @calls
                assert= true $ match (calcit.core/get state :show-menu?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :js :menu-contract
            %{} 'TestEntry (:name |preserves-absent-nil-and-false-state-default)
              :code $ quote $ let
                  task $ app.schema/FinishedTaskView :id |task-1 :text |Task :finished-time 0
                assert= :comp-done-task $ :name $ comp-done-task
                  {} $ :cursor $ []
                  , task
                assert= :comp-done-task $ :name $ comp-done-task
                  {}
                    :cursor $ []
                    :data nil
                  , task
                assert= :comp-done-task $ :name $ comp-done-task
                  {}
                    :cursor $ []
                    :data false
                  , task
              :tags $ #{} :js :task-state-contract
        'comp-history $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-history (states data finished-tasks)
            let
                route $ decode-map-as
                  .filter-kv data $ fn (key value)
                    or (= key :year) (= key :week)
                  , 'app.schema/HistoryRouteView
                year $ :year route
                week $ :week route
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
                        grouped-tasks $ history-task-groups finished-tasks
                      list-> ({})
                        -> grouped-tasks (&map:keys) (&set:to-list)
                          sort $ fn (x y)
                            &compare
                              option:unwrap-or (first y) |
                              option:unwrap-or (first x) |
                          map $ fn (date-string)
                            let
                                task-list $ .unwrap $ get grouped-tasks date-string
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
                                  -> task-list (sort-finished-tasks)
                                    map $ fn (task)
                                      [] (:id task)
                                        comp-done-task
                                          >> states $ :id task
                                          , task
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'StateKey 'Dynamic) (:: 'Map 'Tag 'Dynamic)
              :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
            :generics $ [] 'StateKey
          :tests $ []
            %{} 'TestEntry (:name |route-preserves-zero-and-extra-fields)
              :code $ quote $ let
                  data $ {} (:year 2026) (:week 0) (:extra 7)
                  component $ comp-history
                    {} $ :cursor $ [] :history |panel 7
                    , data $ {}
                assert= :comp-history $ :name component
                assert= (Option :some 0) (get data :week)
                assert= (Option :some 7) (get data :extra)
              :tags $ #{} :history-route-contract :js
            %{} 'TestEntry (:name |route-rejects-missing-year)
              :code $ quote $ assert= true
                try
                  do
                    comp-history
                      {} $ :cursor $ []
                      {} $ :week 0
                      {}
                    , false
                  fn (message)
                    and (starts-with? message "|decode-map-as failed") (.includes? message |year)
              :tags $ #{} :history-route-contract :js
            %{} 'TestEntry (:name |route-rejects-missing-week)
              :code $ quote $ assert= true
                try
                  do
                    comp-history
                      {} $ :cursor $ []
                      {} $ :year 2026
                      {}
                    , false
                  fn (message)
                    and (starts-with? message "|decode-map-as failed") (.includes? message |week)
              :tags $ #{} :history-route-contract :js
            %{} 'TestEntry (:name |route-rejects-nonnumeric-fields)
              :code $ quote $ let
                  rejects? $ fn (data)
                    try
                      do
                        comp-history
                          {} $ :cursor $ []
                          , data $ {}
                        , false
                      fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ rejects? $ {} (:year nil) (:week 0)
                assert= true $ rejects? $ {} (:year false) (:week 0)
                assert= true $ rejects? $ {} (:year |2026) (:week 0)
                assert= true $ rejects? $ {} (:year 2026) (:week nil)
                assert= true $ rejects? $ {} (:year 2026) (:week false)
                assert= true $ rejects? $ {} (:year 2026) (:week |0)
              :tags $ #{} :history-route-contract :js
        'css-done-task $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-done-task
            {}
              |$0 $ {} $ :transition-duration |200ms
              |$0:hover $ {} $ :background-color
                hsl 0 0 80 $ Option :some 0.2
          :examples $ []
          :schema $ :: 'String
        'history-task-groups $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn history-task-groups (finished-tasks)
            -> finished-tasks (&map:vals)
              map $ fn (raw)
                match (schema/decode-finished-task-view raw)
                  (:ok task) task
                  (:err message) (raise message)
              group-by $ fn (task)
                hint-fn $ {}
                  :args $ [] 'app.schema/FinishedTaskView
                  :return 'String
                format-timestamp (:finished-time task) |YYYY-MM-DD
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'Map 'String (:: 'Map 'Tag 'Dynamic)
            :return $ :: 'Map 'String $ :: 'List 'app.schema/FinishedTaskView
          :tests $ []
            %{} 'TestEntry (:name |groups-validated-tasks-by-day)
              :code $ quote $ let
                  first-time 1735732800000
                  second-time $ + first-time 3600000
                  other-time $ + first-time 86400000
                  first-view $ schema/FinishedTaskView :id |first :text |First :finished-time first-time
                  second-view $ schema/FinishedTaskView :id |second :text |Second :finished-time second-time
                  other-view $ schema/FinishedTaskView :id |other :text |Other :finished-time other-time
                  groups $ history-task-groups $ {}
                    |first $ {} (:id |first) (:text |First) (:finished-time first-time) (:extra |ignored)
                    |second $ {} (:id |second) (:text |Second) (:finished-time second-time)
                    |other $ {} (:id |other) (:text |Other) (:finished-time other-time)
                  same-day $ .unwrap $ get groups (format-timestamp first-time |YYYY-MM-DD)
                  other-day $ .unwrap $ get groups (format-timestamp other-time |YYYY-MM-DD)
                assert= 2 $ count groups
                assert= ([] second-view first-view) (sort-finished-tasks same-day)
                assert= ([] other-view) other-day
                assert= ({})
                  history-task-groups $ {}
              :tags $ #{} :history-view-contract :js
            %{} 'TestEntry (:name |rejects-invalid-history-at-entry)
              :code $ quote $ assert= true
                try
                  do
                    history-task-groups $ {} $ |bad
                      {} (:id |bad) (:text |Bad) (:finished-time nil)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed at $.finished-time:")
              :tags $ #{} :history-view-contract :js
        'sort-finished-tasks $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sort-finished-tasks (tasks)
            &list:sort-by tasks $ fn (task)
              hint-fn $ {}
                :args $ [] 'app.schema/FinishedTaskView
                :return 'Number
              negate $ :finished-time task
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List 'app.schema/FinishedTaskView
            :return $ :: 'List 'app.schema/FinishedTaskView
          :tests $ [] $ %{} 'TestEntry (:name |orders-newest-first)
            :code $ quote $ let
                earlier $ schema/FinishedTaskView :id |earlier :text |Earlier :finished-time 100
                later $ schema/FinishedTaskView :id |later :text |Later :finished-time 200
                empty-tasks $ slice ([] earlier later) 0 0
              assert= ([] later earlier)
                sort-finished-tasks $ [] earlier later
              assert= empty-tasks $ sort-finished-tasks empty-tasks
            :tags $ #{} :client :history-view-contract
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
          :code $ quote $ defcomp comp-login (states) (decode-map-as states 'Map)
            let
                cursor $ match
                  get-in states $ [] :cursor
                  (:some raw-cursor)
                    if (list? raw-cursor) raw-cursor $ raise |Expected-state-cursor-List
                  (:none) (raise |Expected-state-cursor-List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:some value) (or value initial-state)
                    (:none) initial-state
                  :: 'Map 'Tag 'String
                credentials $ decode-map-as
                  .filter-kv state $ fn (key value)
                    or (= key :username) (= key :password)
                  , 'app.schema/LoginState
              div
                {} $ :style $ style/merge-styles ui/flex ui/center
                div ({})
                  div
                    {} $ :style $ {}
                    div ({})
                      input $ {} (:placeholder |Username)
                        :value $ :username credentials
                        :style ui/input
                        :on-input $ fn (e d!)
                          hint-fn $ {}
                            :args $ [] (:: 'Map 'Tag 'Dynamic)
                              :: 'Fn $ {} (:return 'Unit)
                                :args $ [] 'app.schema/Op
                            :return 'Unit
                          d! $ :: :states cursor $ assoc state :username
                            match (calcit.core/get e :value)
                              (:some value) (str value)
                              (:none) (str nil)
                    =< nil 8
                    div ({})
                      input $ {} (:placeholder |Password)
                        :value $ :password credentials
                        :style ui/input
                        :on-input $ fn (e d!)
                          hint-fn $ {}
                            :args $ [] (:: 'Map 'Tag 'Dynamic)
                              :: 'Fn $ {} (:return 'Unit)
                                :args $ [] 'app.schema/Op
                            :return 'Unit
                          d! $ :: :states cursor $ assoc state :password
                            match (calcit.core/get e :value)
                              (:some value) (str value)
                              (:none) (str nil)
                  =< nil 8
                  div
                    {} $ :style $ {} (:text-align :right)
                    span $ {} (:inner-text "|Sign up")
                      :style $ merge style/link
                      :on-click $ on-submit (:username credentials) (:password credentials) true
                    =< 8 nil
                    span $ {} (:inner-text "|Log in")
                      :style $ merge style/link
                      :on-click $ on-submit (:username credentials) (:password credentials) false
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] $ :: 'Map 'StateKey 'Dynamic
            :generics $ [] 'StateKey
          :tests $ []
            %{} 'TestEntry (:name |mixed-cursor-input-tree)
              :code $ quote $ let
                  component $ comp-login $ {}
                    :cursor $ [] :login |panel 7
                    :data $ {} (:username |existing-user) (:password |existing-password)
                  tree $ match
                    .unwrap $ :tree component
                    (:element element) element
                    (:component _) (raise |Expected-login-element)
                assert= :div $ :name tree
                assert= 1 $ .len $ :children tree
              :tags $ #{} :js :login-input-contract
            %{} 'TestEntry
              :name |required-fields-allow-empty-strings-and-extra-state
              :code $ quote $ let
                  state $ {} (:username |) (:password |) (:extra |preserved)
                  component $ comp-login $ {}
                    :cursor $ [] :login |panel 7
                    :data state
                assert= :div $ :name $ match
                  .unwrap $ :tree component
                  (:element element) element
                  (:component _) (raise |Expected-component-element)
                assert= (Option :some |preserved) (get state :extra)
              :tags $ #{} :js :login-required-contract
            %{} 'TestEntry (:name |required-fields-reject-missing-username)
              :code $ quote $ assert= true
                try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} $ :password |password
                    , false
                  fn (message)
                    and (starts-with? message "|decode-map-as failed") (.includes? message |username)
              :tags $ #{} :js :login-required-contract
            %{} 'TestEntry (:name |required-fields-reject-missing-password)
              :code $ quote $ assert= true
                try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} $ :username |user
                    , false
                  fn (message)
                    and (starts-with? message "|decode-map-as failed") (.includes? message |password)
              :tags $ #{} :js :login-required-contract
            %{} 'TestEntry (:name |required-fields-reject-invalid-values)
              :code $ quote $ do
                assert= true $ try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} (:username nil) (:password |password)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} (:username 7) (:password |password)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} (:username false) (:password |password)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} (:username |user) (:password nil)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} (:username |user) (:password 7)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-login $ {}
                      :cursor $ [] :login |panel 7
                      :data $ {} (:username |user) (:password false)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :js :login-required-contract
            %{} 'TestEntry (:name |input-values-preserve-stringification-and-state)
              :code $ quote $ let
                  cursor $ [] :login |panel 7
                  state $ {} (:username |existing-user) (:password |existing-password) (:extra |preserved)
                  element $ fn (node)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/RenderNode
                      :return 'respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-login-element)
                  child $ fn (parent index)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/Element 'Number
                      :return 'respo.schema/RenderNode
                    .unwrap $ :node $ .unwrap
                      nth (:children parent) index
                  root $ element $ .unwrap
                    :tree $ comp-login $ {} (:cursor cursor) (:data state)
                  outer $ element $ child root 0
                  content $ element $ child outer 0
                  username $ element $ child
                    element $ child content 0
                    , 0
                  password $ element $ child
                    element $ child content 2
                    , 0
                  check-input! $ fn (input event field expected)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/Element (:: 'Map 'Tag 'Dynamic) 'Tag 'String
                      :return 'Unit
                    let
                        handler $ .unwrap $ js-nullish->option
                          .unwrap $ .get (:event input) :input
                        calls $ ref 0
                        dispatch! $ fn (operation)
                          hint-fn $ {}
                            :args $ [] 'app.schema/Op
                            :return 'Unit
                          match operation
                            (:states path payload)
                              do (assert= cursor path)
                                assert= (assoc state field expected) payload
                            _ $ raise |Expected-login-state-operation
                          swap! calls inc
                          , &unit
                      handler event dispatch!
                      assert= 1 @calls
                check-input! username ({}) :username $ str nil
                check-input! username
                  {} $ :value nil
                  , :username $ str nil
                check-input! username
                  {} $ :value false
                  , :username $ str false
                check-input! username
                  {} $ :value 0
                  , :username $ str 0
                check-input! username
                  {} $ :value |
                  , :username $ str |
                check-input! username
                  {} $ :value |changed
                  , :username $ str |changed
                check-input! password ({}) :password $ str nil
                check-input! password
                  {} $ :value nil
                  , :password $ str nil
                check-input! password
                  {} $ :value false
                  , :password $ str false
                check-input! password
                  {} $ :value 0
                  , :password $ str 0
                check-input! password
                  {} $ :value |
                  , :password $ str |
                check-input! password
                  {} $ :value |changed
                  , :password $ str |changed
                assert= |existing-user $ .unwrap $ get state :username
                assert= |existing-password $ .unwrap $ get state :password
              :tags $ #{} :js :login-value-contract
        'initial-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def initial-state
            {} (:username |) (:password |)
          :examples $ []
          :schema $ :: 'Map 'Tag 'String
        'on-submit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-submit (username password signup?)
            fn (e dispatch!)
              hint-fn $ {}
                :args $ [] (:: 'Map 'Tag 'Dynamic)
                  :: 'Fn $ {} (:return 'Unit)
                    :args $ [] 'app.schema/Op
                :return 'Unit
              dispatch! $ if signup?
                schema/Op :user/sign-up $ [] username password
                schema/Op :user/log-in $ [] username password
              storage-set! (:storage-key config/site)
                format-cirru-edn $ [] username password
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String 'String 'Bool
            :return $ :: 'Fn $ {} (:return 'Unit)
              :args $ [] (:: 'Map 'Tag 'Dynamic)
                :: 'Fn $ {} (:return 'Unit)
                  :args $ [] 'app.schema/Op
          :tests $ []
            %{} 'TestEntry (:name |login-dispatch-once)
              :code $ quote $ let
                  calls $ ref 0
                  handler $ on-submit |type-test-user |type-test-password false
                  dispatch! $ fn (op)
                    hint-fn $ {} (:return 'Unit)
                      :args $ [] 'app.schema/Op
                    assert=
                      schema/Op :user/log-in $ [] |type-test-user |type-test-password
                      , op
                    reset! calls $ inc @calls
                    , &unit
                assert= 0 @calls
                assert= &unit $ handler ({}) dispatch!
                assert= 1 @calls
              :tags $ #{} :js :login-contract
            %{} 'TestEntry (:name |signup-dispatch-once)
              :code $ quote $ let
                  calls $ ref 0
                  handler $ on-submit |type-test-user |type-test-password true
                  dispatch! $ fn (op)
                    hint-fn $ {} (:return 'Unit)
                      :args $ [] 'app.schema/Op
                    assert=
                      schema/Op :user/sign-up $ [] |type-test-user |type-test-password
                      , op
                    reset! calls $ inc @calls
                    , &unit
                assert= 0 @calls
                assert= &unit $ handler ({}) dispatch!
                assert= 1 @calls
              :tags $ #{} :js :login-contract
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
                  <> $ member-count-text count-members
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] 'Bool (:: 'Option 'Number) 'Tag
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
                :border-bottom $ str "|1px solid " $ hsl 0 0 0 (Option :some 0.1)
                :font-family ui/font-fancy
                :background-color $ :theme config/site
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
        'member-count-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn member-count-text (count-members)
            match count-members
              (:some count) (str count)
              (:none) |
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] $ :: 'Option 'Number
          :tests $ []
            %{} 'TestEntry (:name |guest-count)
              :code $ quote $ assert= |
                member-count-text $ Option :none
              :tags $ #{} :client
            %{} 'TestEntry (:name |member-count)
              :code $ quote $ assert= |2
                member-count-text $ Option :some 2
              :tags $ #{} :client
            %{} 'TestEntry (:name |zero-count)
              :code $ quote $ assert= |0
                member-count-text $ Option :some 0
              :tags $ #{} :client
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
                    :initial $ match (calcit.core/get note :text)
                      (:some value) value
                      (:none) nil
                remove-plugin $ use-confirm (>> states :remove)
                  {} $ :text "|Sure to delete note?"
                note-time $ match
                  match (calcit.core/get note :time)
                    (:some value) (decode-timestamp value)
                    (:none) (decode-timestamp nil)
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
                            match (calcit.core/get note :id)
                              (:some value) (decode-map-as value 'String)
                              (:none) (decode-map-as nil 'String)
                            , :text (decode-map-as result 'String)
                    =< 8 nil
                    comp-icon :delete
                      &{} :font-size 16 :cursor :pointer :color $ hsl 10 80 60
                      fn (e d!)
                        .show remove-plugin d! $ fn () $ d!
                          :: :note/remove $ match (calcit.core/get note :id)
                            (:some value) (decode-map-as value 'String)
                            (:none) (decode-map-as nil 'String)
                <> $ match (calcit.core/get note :text)
                  (:some value) (decode-map-as value 'String)
                  (:none) (decode-map-as nil 'String)
                .render edit-plugin
                .render remove-plugin
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'StateKey 'Dynamic) (:: 'Map 'Tag 'Dynamic)
            :generics $ [] 'StateKey
          :tests $ []
            %{} 'TestEntry (:name |accepts-tag-string-number-state-branches)
              :code $ quote $ let
                  note $ {} (:id |note-1) (:text |Note) (:time 1735689600000)
                  root $ {}
                    :cursor $ [] :root
                    :panel $ {} $ :data ({})
                    |note-1 $ {} $ :data ({})
                    7 $ {} $ :data ({})
                  tag-branch $ >> root :panel
                  string-branch $ >> root |note-1
                  number-branch $ >> root 7
                assert= :comp-note $ :name $ comp-note tag-branch note
                assert= :comp-note $ :name $ comp-note string-branch note
                assert= :comp-note $ :name $ comp-note number-branch note
                assert= ([] :root :panel)
                  match (calcit.core/get tag-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root |note-1)
                  match (calcit.core/get string-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root 7)
                  match (calcit.core/get number-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root)
                  match (calcit.core/get root :cursor)
                    (:some value) value
                    (:none) nil
              :tags $ #{} :js
            %{} 'TestEntry (:name |preserves-timestamp-decoder-errors)
              :code $ quote $ let
                  check-note! $ fn (note expected)
                    hint-fn $ {}
                      :args $ [] (:: 'Map 'Tag 'Dynamic) 'String
                      :return 'Unit
                    assert= expected $ try
                      do
                        comp-note
                          {} $ :cursor $ []
                          , note
                        raise |Expected-timestamp-error
                      fn (message) message
                    , &unit
                  check-value! $ fn (value)
                    hint-fn $ {}
                      :args $ [] 'Dynamic
                      :return 'Unit
                    match (decode-timestamp value)
                      (:err message)
                        check-note!
                          {} (:id |note) (:text |Note) (:time value)
                          , message
                      (:ok _) (raise |Expected-invalid-timestamp)
                    , &unit
                match (decode-timestamp nil)
                  (:err message)
                    check-note!
                      {} (:id |note) (:text |Note)
                      , message
                  (:ok _) (raise |Expected-missing-timestamp-error)
                check-value! nil
                check-value! false
                check-value! |
                check-value! :invalid
                check-value! $ []
                check-value! $ {}
              :tags $ #{} :js :option-consumer-contract
        'comp-notes-page $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-notes-page (states notes info)
            let
                route $ decode-map-as
                  .filter-kv info $ fn (key value)
                    or (= key :year) (= key :month)
                  , 'app.schema/NotesRoute
                year $ :year route
                month $ :month route
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
                                note $ .unwrap $ calcit.core/get notes note-key
                                note-time $ match
                                  match (calcit.core/get note :time)
                                    (:some value) (decode-timestamp value)
                                    (:none) (decode-timestamp nil)
                                  (:ok value) value
                                  (:err message) (raise message)
                              format-timestamp note-time |MM-DD
                      list-> ({})
                        -> grouped-notes (&map:keys) (&set:to-list)
                          sort $ fn (x y) (&compare y x)
                          map $ fn (date)
                            let
                                notes-in-day $ .unwrap $ calcit.core/get grouped-notes date
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
                                          note $ .unwrap $ calcit.core/get notes note-key
                                          note-time $ match
                                            match (calcit.core/get note :time)
                                              (:some value) (decode-timestamp value)
                                              (:none) (decode-timestamp nil)
                                            (:ok value) value
                                            (:err message) (raise message)
                                        negate note-time
                                    map $ fn (k)
                                      [] k $ comp-note (>> states k)
                                        .unwrap $ calcit.core/get notes k
                  =< nil 160
                .render add-plugin
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'StateKey 'Dynamic)
              :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
              :: 'Map 'Tag 'Number
            :generics $ [] 'StateKey
          :tests $ []
            %{} 'TestEntry
              :name |required-route-fields-preserve-zero-and-extra-fields
              :code $ quote $ let
                  info $ {} (:year 2026) (:month 0) (:extra 7)
                  component $ comp-notes-page
                    {} $ :cursor $ [] :notes |panel 7
                    {}
                    , info
                assert= :div $ :name $ match
                  .unwrap $ :tree component
                  (:element element) element
                  (:component _) (raise |Expected-component-element)
                assert= (Option :some 7) (get info :extra)
              :tags $ #{} :js :notes-route-contract
            %{} 'TestEntry (:name |required-route-fields-reject-missing-year)
              :code $ quote $ assert= true
                try
                  do
                    comp-notes-page
                      {} $ :cursor $ [] :notes |panel 7
                      {}
                      {} $ :month 0
                    , false
                  fn (message)
                    and (starts-with? message "|decode-map-as failed") (includes? message |year)
              :tags $ #{} :js :notes-route-contract
            %{} 'TestEntry (:name |required-route-fields-reject-missing-month)
              :code $ quote $ assert= true
                try
                  do
                    comp-notes-page
                      {} $ :cursor $ [] :notes |panel 7
                      {}
                      {} $ :year 2026
                    , false
                  fn (message)
                    and (starts-with? message "|decode-map-as failed") (includes? message |month)
              :tags $ #{} :js :notes-route-contract
        'css-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-note
            {}
              |$0 $ {} $ :transition-duration |200ms
              |$0:hover $ {} $ :background-color
                hsl 0 0 80 $ Option :some 0.2
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
            span $ {} $ :on-keydown on-event
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] (:: 'Map 'Tag 'Dynamic)
                  :: 'Fn $ {} (:return 'Unit)
                    :args $ [] 'app.schema/Op
          :tests $ [] $ %{} 'TestEntry (:name |forwards-event-and-dispatch-once)
            :code $ quote $ let
                calls $ ref 0
                dispatches $ ref 0
                event $ {} (:key-code 13) (:shift? true)
                op $ schema/Op :user/log-in $ [] |type-test-user |type-test-password
                handler $ fn (e d!)
                  hint-fn $ {} (:return 'Unit)
                    :args $ [] (:: 'Map 'Tag 'Dynamic)
                      :: 'Fn $ {} (:return 'Unit)
                        :args $ [] 'app.schema/Op
                  assert= event e
                  reset! calls $ inc @calls
                  d! op
                dispatch! $ fn (received)
                  hint-fn $ {} (:return 'Unit)
                    :args $ [] 'app.schema/Op
                  assert= op received
                  reset! dispatches $ inc @dispatches
                  , &unit
                component $ comp-global-keydown handler
                tree $ match
                  .unwrap $ :tree component
                  (:element element) element
                  (:component _) (raise |Expected-keydown-element)
                keydown $ .unwrap $ js-nullish->option
                  .unwrap $ .get (:event tree) :keydown
              assert= 0 @calls
              assert= 0 @dispatches
              assert= &unit $ keydown event dispatch!
              assert= 1 @calls
              assert= 1 @dispatches
            :tags $ #{} :js :keydown-contract
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
          :code $ quote $ defcomp comp-overview (states today tasks) (decode-map-as states 'Map)
            let
                working-tasks $ .filter-kv tasks $ fn (key task)
                  hint-fn $ {}
                    :args $ [] 'String $ :: 'Map 'Tag 'Dynamic
                    :return 'Bool
                  not $ match (calcit.core/get task :pending?)
                    (:some value) (decode-map-as value 'Bool)
                    (:none) (decode-map-as nil 'Bool)
                pending-tasks $ .filter-kv tasks $ fn (key task)
                  hint-fn $ {}
                    :args $ [] 'String $ :: 'Map 'Tag 'Dynamic
                    :return 'Bool
                  match (calcit.core/get task :pending?)
                    (:some value) (decode-map-as value 'Bool)
                    (:none) (decode-map-as nil 'Bool)
                create-plugin $ use-prompt (>> states :create)
                  {} $ :text "|Create new task:"
                cursor $ match
                  get-in states $ [] :cursor
                  (:some value) (decode-map-as value 'List)
                  (:none) (decode-map-as nil 'List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:some value)
                      or value $ {} $ :show-later? false
                    (:none)
                      {} $ :show-later? false
                  , 'Map
                today-labels $ app.comp.navigation/date-labels today
              div
                {} (:class-name css/expand)
                  :style $ {} $ :padding 16
                div
                  {} $ :style $ {} (:max-width 800) (:margin :auto)
                  div
                    {} $ :class-name css/row-parted
                    comp-title |Doing
                      Option :some $ comp-icon :plus
                        &{} :font-size 14 :color (hsl 200 80 80) :cursor :pointer
                        fn (e d!)
                          .show create-plugin d! $ fn (result)
                            d! $ :: :task/create-working $ decode-map-as result 'String
                            , &unit
                          , &unit
                      assert-type (Option :none)
                        :: 'Option $ :: 'Fn $ {} (:return 'Unit)
                          :args $ [] (:: 'Map 'Tag 'Dynamic)
                            :: 'Fn $ {} (:return 'Unit)
                              :args $ [] 'app.schema/Op
                    comp-global-keydown $ fn (e d!)
                      when
                        and
                          match (calcit.core/get e :meta?)
                            (:some value) value
                            (:none) nil
                          = |i $ match (calcit.core/get e :key)
                            (:some value) value
                            (:none) nil
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
                          task-sort-key $ decode-map-as
                            .unwrap $ last pair
                            :: 'Map 'Tag 'Dynamic
                        &list:map-pair $ fn (k task)
                          let
                              task-data $ decode-map-as task $ :: 'Map 'Tag 'Dynamic
                            [] k $ comp-task
                              >> states $ match (calcit.core/get task-data :id)
                                (:some value) (decode-map-as value 'String)
                                (:none) (decode-map-as nil 'String)
                              , task-data :working
                  when
                    not $ empty? pending-tasks
                    div ({})
                      comp-title |Later
                        assert-type (Option :none) (:: 'Option 'respo.schema/Component)
                        Option :some $ fn (e d!)
                          hint-fn $ {} (:return 'Unit)
                            :args $ [] (:: 'Map 'Tag 'Dynamic)
                              :: 'Fn $ {} (:return 'Unit)
                                :args $ [] 'app.schema/Op
                          d! $ :: :states cursor $ update state :show-later? not
                          , &unit
                      if
                        match (calcit.core/get state :show-later?)
                          (:some value) value
                          (:none) nil
                        list-> ({})
                          -> pending-tasks (&map:to-list)
                            &list:sort-by $ fn (pair)
                              task-sort-key $ decode-map-as
                                .unwrap $ last pair
                                :: 'Map 'Tag 'Dynamic
                            &list:map-pair $ fn (k task)
                              let
                                  task-data $ decode-map-as task $ :: 'Map 'Tag 'Dynamic
                                [] k $ comp-task
                                  >> states $ match (calcit.core/get task-data :id)
                                    (:some value) (decode-map-as value 'String)
                                    (:none) (decode-map-as nil 'String)
                                  , task-data :pending
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
            :args $ [] (:: 'Map 'StateKey 'Dynamic) 'String $ :: 'Map 'String (:: 'Map 'Tag 'Dynamic)
            :generics $ [] 'StateKey
          :tests $ []
            %{} 'TestEntry (:name |keeps-working-and-pending-and-toggle-state)
              :code $ quote $ let
                  cursor $ [] :root |board 7
                  state $ {} (:show-later? true) (|extra |preserved)
                  states $ {} (:cursor cursor) (:data state)
                  tasks $ {}
                    |working $ {} (:id |working) (:text |Working) (:detail |) (:pending? false) (:created-time 100)
                    |pending $ {} (:id |pending) (:text |Pending) (:detail |) (:pending? true) (:created-time 200)
                  element $ fn (node)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/RenderNode
                      :return 'respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/Element 'Number
                      :return 'respo.schema/RenderNode
                    .unwrap $ :node $ .unwrap
                      nth (:children parent) index
                  root $ element $ .unwrap
                    :tree $ comp-overview states |2026-09-14 tasks
                  content $ element $ child root 0
                  working $ element $ child content 1
                  later $ element $ child content 2
                  pending $ element $ child later 1
                  title $ match (child later 0)
                    (:component value) value
                    (:element _) (raise |Expected-title-component)
                  title-tree $ element $ .unwrap (:tree title)
                  click $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event title-tree) :click
                  calls $ ref 0
                  dispatch! $ fn (op)
                    hint-fn $ {}
                      :args $ [] 'app.schema/Op
                      :return 'Unit
                    match op
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-later? false) payload
                      _ $ raise |Expected-state-operation
                    swap! calls inc
                    , &unit
                assert= 1 $ count $ :children working
                assert= 1 $ count $ :children pending
                click ({}) dispatch!
                assert= 1 @calls
                assert= true $ match (calcit.core/get state :show-later?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :js :overview-state-contract
            %{} 'TestEntry (:name |rejects-invalid-overview-state)
              :code $ quote $ assert= true
                try
                  do
                    comp-overview
                      {}
                        :cursor $ []
                        :data 7
                      , |2026-09-14 $ {}
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :js :overview-state-contract
            %{} 'TestEntry (:name |rejects-non-bool-pending)
              :code $ quote $ assert= true
                try
                  do
                    comp-overview
                      {} $ :cursor $ []
                      , |2026-09-14 $ {} $ |bad
                        {} (:id |bad) (:text |Bad) (:detail |) (:pending? |true) (:created-time 100)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :js :overview-state-contract
            %{} 'TestEntry (:name |preserves-absent-nil-and-false-state-default)
              :code $ quote $ do
                assert= :comp-overview $ :name $ comp-overview
                  {} $ :cursor $ []
                  , |2026-09-14 ({})
                assert= :comp-overview $ :name $ comp-overview
                  {}
                    :cursor $ []
                    :data nil
                  , |2026-09-14 ({})
                assert= :comp-overview $ :name $ comp-overview
                  {}
                    :cursor $ []
                    :data false
                  , |2026-09-14 ({})
              :tags $ #{} :js :task-state-contract
            %{} 'TestEntry (:name |preserves-required-cursor-decoder-errors)
              :code $ quote $ let
                  check-state! $ fn (state expected)
                    hint-fn $ {}
                      :args $ [] (:: 'Map 'Tag 'Dynamic) 'String
                      :return 'Unit
                    assert= expected $ try
                      do
                        comp-overview state |2026-09-14 $ {}
                        raise |Expected-cursor-error
                      fn (message) message
                    , &unit
                  check-value! $ fn (value)
                    hint-fn $ {}
                      :args $ [] 'Dynamic
                      :return 'Unit
                    check-state!
                      {} $ :cursor value
                      str "|[Respo] expected states cursor as a list, got: " $ type-of value
                    , &unit
                match (try-decode-map-as nil 'List)
                  (:err message)
                    do
                      check-state! ({}) message
                      check-state!
                        {} $ :cursor nil
                        , message
                  (:ok _) (raise |Expected-missing-cursor-error)
                check-value! false
                check-value! 0
                check-value! |
                check-value! $ {}
              :tags $ #{} :js :option-consumer-contract
        'comp-task $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-task (states task mode) (decode-map-as states 'Map)
            let
                decoded-task $ match (schema/decode-task-record task)
                  (:ok record) record
                  (:err message) (raise message)
                cursor $ match
                  get-in states $ [] :cursor
                  (:some value) (decode-map-as value 'List)
                  (:none) (decode-map-as nil 'List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:some value)
                      or value $ {} $ :menu? false
                    (:none)
                      {} $ :menu? false
                  , 'Map
                update-plugin $ use-prompt (>> states :drafter)
                  {} (:text "|Task content:")
                    :initial $ :text decoded-task
                    :placeholder |task...
                    :button-text |Edit
                delete-plugin $ use-confirm (>> states :delete)
                  {} $ :text "|Sure to remove task:"
                task-id $ :id decoded-task
              div
                {} (:class-name css-task-base)
                  :style $ merge $ if
                    match (calcit.core/get state :menu?)
                      (:some value) value
                      (:none) nil
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
                  <> (:text decoded-task) ({})
                comp-modal-menu
                  {} (:title |Operations)
                    :style $ {} $ :width 320
                    :items $ [] (:: :item :done |Done)
                      :: :item :pend $ if (= mode :pending) "|Do it now" "|Do it later"
                      :: :item :touch |Up
                      :: :item :copy |Copy
                      :: :item :edit |Edit
                      :: :item :remove |Remove
                  match (calcit.core/get state :menu?)
                    (:some value) (decode-map-as value 'Bool)
                    (:none) (decode-map-as nil 'Bool)
                  fn (d!)
                    d! $ :: :states cursor $ assoc state :menu? false
                    , &unit
                  fn (item d!)
                    if (nil? item)
                      d! $ :: :states cursor $ assoc state :menu? false
                      if (enum? item)
                        let
                            new-state $ assoc state :menu? false
                            result $ task-menu-action item
                          match result
                            :done $ do
                              d! $ :: :task/finish-working task-id
                              d! $ :: :states cursor new-state
                            :edit $ do
                              d! $ :: :states cursor new-state
                              .show update-plugin d! $ fn (text)
                                d! $ :: :task/update-working $ schema/TaskEdit :id task-id :text (decode-map-as text 'String)
                                , &unit
                            :copy $ do
                              copy! $ :text decoded-task
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
                            _ $ d! $ :: :states cursor new-state
                          , &unit
                        raise "|Menu selection must be an item enum"
                    , &unit
                .render update-plugin
                .render delete-plugin
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'StateKey 'Dynamic) (:: 'Map 'Tag 'Dynamic) 'Tag
            :generics $ [] 'StateKey
          :tests $ []
            %{} 'TestEntry (:name |accepts-tag-string-number-state-branches)
              :code $ quote $ let
                  task $ {} (:id |task-1) (:text |example) (:detail |) (:pending? false)
                  root $ {}
                    :cursor $ [] :root
                    :panel $ {} $ :data
                      {} $ :menu? false
                    |task-1 $ {} $ :data
                      {} $ :menu? false
                    7 $ {} $ :data
                      {} $ :menu? false
                  tag-branch $ >> root :panel
                  string-branch $ >> root |task-1
                  number-branch $ >> root 7
                assert= :comp-task $ :name $ comp-task tag-branch task :working
                assert= :comp-task $ :name $ comp-task string-branch task :working
                assert= :comp-task $ :name $ comp-task number-branch task :working
                assert= ([] :root :panel)
                  match (calcit.core/get tag-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root |task-1)
                  match (calcit.core/get string-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root 7)
                  match (calcit.core/get number-branch :cursor)
                    (:some value) value
                    (:none) nil
                assert= ([] :root)
                  match (calcit.core/get root :cursor)
                    (:some value) value
                    (:none) nil
              :tags $ #{} :js
            %{} 'TestEntry (:name |click-preserves-state-and-mixed-cursor)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:menu? false) (|extra |preserved)
                  task $ {} (:id |task-1) (:text |Task) (:detail |) (:pending? false)
                  component $ comp-task
                    {} (:cursor cursor) (:data state)
                    , task :working
                  tree $ match
                    .unwrap $ :tree component
                    (:element value) value
                    (:component _) (raise |Expected-task-element)
                  click $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event tree) :click
                  calls $ ref 0
                  dispatch! $ fn (op)
                    hint-fn $ {} (:return 'Unit)
                      :args $ [] 'app.schema/Op
                    match op
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :menu? true) payload
                      _ $ raise |Expected-state-operation
                    swap! calls inc
                    , &unit
                click ({}) dispatch!
                assert= 1 @calls
                assert= false $ match (calcit.core/get state :menu?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :js :task-state-contract
            %{} 'TestEntry (:name |rejects-invalid-state-containers)
              :code $ quote $ let
                  task $ {} (:id |task-1) (:text |Task) (:detail |) (:pending? false)
                assert= true $ try
                  do
                    comp-task
                      {}
                        :cursor $ []
                        :data 7
                      , task :working
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    comp-task
                      {} (:cursor |invalid)
                        :data $ {} $ :menu? false
                      , task :working
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :js :task-state-contract
            %{} 'TestEntry (:name |clear-closes-without-changing-task)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:menu? true) (|extra |preserved)
                  states $ {} (:cursor cursor) (:data state)
                  element $ fn (node)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/RenderNode
                      :return 'respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/Element 'Number
                      :return 'respo.schema/RenderNode
                    .unwrap $ :node $ .unwrap
                      nth (:children parent) index
                  root $ element $ .unwrap
                    :tree $ comp-task states
                      {} (:id |task-1) (:text |Task) (:detail |) (:pending? false)
                      , :working
                  menu $ match (child root 1)
                    (:component value) value
                    (:element _) (raise |Expected-menu-component)
                  menu-root $ element $ .unwrap (:tree menu)
                  backdrop $ element $ child menu-root 0
                  card $ element $ child backdrop 0
                  header $ element $ child card 0
                  button $ element $ child header 2
                  click $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event button) :click
                  calls $ ref 0
                  dispatch! $ fn (operation)
                    hint-fn $ {}
                      :args $ [] 'app.schema/Op
                      :return 'Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :menu? false) payload
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click ({}) dispatch!
                assert= 1 @calls
                assert= true $ match (calcit.core/get state :menu?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :js :menu-contract
            %{} 'TestEntry (:name |selection-dispatches-action-and-closes)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:menu? true) (|extra |preserved)
                  states $ {} (:cursor cursor) (:data state)
                  element $ fn (node)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/RenderNode
                      :return 'respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ {}
                      :args $ [] 'respo.schema/Element 'Number
                      :return 'respo.schema/RenderNode
                    .unwrap $ :node $ .unwrap
                      nth (:children parent) index
                  root $ element $ .unwrap
                    :tree $ comp-task states
                      {} (:id |task-1) (:text |Task) (:detail |) (:pending? false)
                      , :working
                  menu $ match (child root 1)
                    (:component value) value
                    (:element _) (raise |Expected-menu-component)
                  menu-root $ element $ .unwrap (:tree menu)
                  backdrop $ element $ child menu-root 0
                  card $ element $ child backdrop 0
                  header $ element $ child card 0
                  button $ element $ child
                    element $ child card 1
                    , 0
                  click $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event button) :click
                  calls $ ref 0
                  dispatch! $ fn (operation)
                    hint-fn $ {}
                      :args $ [] 'app.schema/Op
                      :return 'Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :menu? false) payload
                      (:task/finish-working id) (assert= |task-1 id)
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click ({}) dispatch!
                assert= 2 @calls
                assert= true $ match (calcit.core/get state :menu?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :js :menu-contract
            %{} 'TestEntry (:name |preserves-absent-nil-and-false-state-default)
              :code $ quote $ let
                  task $ {} (:id |task-1) (:text |Task) (:detail |) (:pending? false)
                assert= :comp-task $ :name $ comp-task
                  {} $ :cursor $ []
                  , task :working
                assert= :comp-task $ :name $ comp-task
                  {}
                    :cursor $ []
                    :data nil
                  , task :working
                assert= :comp-task $ :name $ comp-task
                  {}
                    :cursor $ []
                    :data false
                  , task :working
              :tags $ #{} :js :task-state-contract
        'comp-title $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-title (title child on-click)
            div
              {} (:class-name css-title)
                :style $ if (option:some? on-click)
                  {} $ :cursor :pointer
                :on-click $ fn (e d!)
                  hint-fn $ {}
                    :args $ [] (:: 'Map 'Tag 'Dynamic)
                      :: 'Fn $ {} (:return 'Unit)
                        :args $ [] 'app.schema/Op
                    :return 'Unit
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
                  tree $ match
                    .unwrap $ :tree component
                    (:element element) element
                    (:component _) (raise |Expected-title-element)
                assert-type tree respo.schema/Element
                assert= 0 $ .len $ :style tree
                assert= 2 $ .len $ :children tree
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |explicit-none)
              :code $ quote $ let
                  component $ comp-title |Title (%none) (%none)
                  tree $ match
                    .unwrap $ :tree component
                    (:element element) element
                    (:component _) (raise |Expected-title-element)
                assert-type tree respo.schema/Element
                assert= 0 $ .len $ :style tree
                assert= 2 $ .len $ :children tree
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |callback-once)
              :code $ quote $ let
                  evaluations $ ref 0
                  calls $ ref 0
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
                    tree $ match
                      .unwrap $ :tree component
                      (:element element) element
                      (:component _) (raise |Expected-title-element)
                  assert-type tree respo.schema/Element
                  assert= 1 @evaluations
                  assert= 0 @calls
                  let
                      click $ .unwrap $ js-nullish->option
                        .unwrap $ .get (:event tree) :click
                    click ({}) dispatch!
                    assert= 1 @calls
                    click ({}) dispatch!
                    assert= 2 @calls
                    assert= 1 @evaluations
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |child-once)
              :code $ quote $ let
                  evaluations $ ref 0
                  component $ comp-title |Parent $ %some
                    do
                      reset! evaluations $ inc @evaluations
                      comp-title |Child
                  tree $ match
                    .unwrap $ :tree component
                    (:element element) element
                    (:component _) (raise |Expected-title-element)
                assert-type tree respo.schema/Element
                assert= 1 @evaluations
                assert= 3 $ .len $ :children tree
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |legacy-empty-handler-values)
              :code $ quote $ let
                  evaluations $ ref 0
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
                    tree $ match
                      .unwrap $ :tree component
                      (:element element) element
                      (:component _) (raise |Expected-title-element)
                  assert-type tree respo.schema/Element
                  let
                      click $ .unwrap $ js-nullish->option
                        .unwrap $ .get (:event tree) :click
                    click ({}) dispatch!
                  assert= 0 $ .len $ :style tree
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
                hsl 0 0 80 $ Option :some 0.1
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
          :code $ quote $ defn task-menu-action (item)
            decode-map-as (&enum:nth item 1) 'Tag
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Tag)
            :args $ [] 'Enum
          :tests $ []
            %{} 'TestEntry (:name |decodes-task-menu-actions)
              :code $ quote $ do
                assert |remove-action-should-be-decoded $ &= :remove $ task-menu-action (:: :item :remove |Remove)
                assert |done-action-should-be-decoded $ &= :done $ task-menu-action (:: :item :done |Done)
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-non-tag-action)
              :code $ quote $ assert= true
                try
                  do
                    task-menu-action $ :: :item 1 |Invalid
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :client
        'task-sort-key $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn task-sort-key (task)
            negate $ decode-map-as
              or
                match (calcit.core/get task :touched-time)
                  (:some value) value
                  (:none) nil
                match (calcit.core/get task :created-time)
                  (:some value) value
                  (:none) nil
              , 'Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |preserves-effective-timestamp)
              :code $ quote $ do
                assert= -200 $ task-sort-key $ {} (:touched-time 200) (:created-time 100)
                assert= 0 $ task-sort-key $ {} (:touched-time 0) (:created-time 100)
                assert= 5 $ task-sort-key $ {} (:touched-time -5) (:created-time 100)
                assert= -100 $ task-sort-key $ {} (:touched-time nil) (:created-time 100)
                assert= -100 $ task-sort-key $ {} (:touched-time false) (:created-time 100)
                assert= -100 $ task-sort-key $ {} (:created-time 100)
                assert= -200 $ task-sort-key $ {} (:touched-time 200) (:created-time |unused)
              :tags $ #{} :client :task-sort-contract
            %{} 'TestEntry (:name |rejects-invalid-effective-timestamp)
              :code $ quote $ do
                assert= true $ try
                  do
                    task-sort-key $ {} (:touched-time |invalid) (:created-time 100)
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    task-sort-key $ {} $ :created-time |invalid
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
                assert= true $ try
                  do
                    task-sort-key $ {}
                    , false
                  fn (message) (starts-with? message "|decode-map-as failed")
              :tags $ #{} :client :task-sort-contract
            %{} 'TestEntry (:name |preserves-descending-task-order)
              :code $ quote $ let
                  older $ {} (:id |older) (:created-time 100)
                  newer $ {} (:id |newer) (:created-time 200)
                  touched $ {} (:id |touched) (:created-time 10) (:touched-time 300)
                assert= ([] touched newer older)
                  &list:sort-by ([] older touched newer) task-sort-key
              :tags $ #{} :client :task-sort-contract
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
                  <> $ str "|Hello! " $ match (calcit.core/get user :name)
                    (:some value) value
                    (:none) nil
                =< nil 16
                div
                  {} $ :class-name css/row
                  <> |Members:
                  =< 8 nil
                  list->
                    {} $ :class-name css/row
                    .to-list $ member-labels members css-member-label
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
                        js-ffi.browser/storage-remove! $ :storage-key config/site
                        , &unit
                    <> "|Log out"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'MemberKey 'String)
            :generics $ [] 'MemberKey
        'css-member-label $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-member-label
            {} $ |$0 $ {} (:padding "|0 8px")
              :border $ str "|1px solid " $ hsl 0 0 80
              :border-radius |16px
              :margin "|0 4px"
          :examples $ []
          :schema $ :: 'String
        'member-labels $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn member-labels (members class-name)
            .filter-map-kv members $ fn (key username)
              MapEntryDecision :keep key $ div
                {} $ :class-name class-name
                <> username
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'MemberKey 'String) 'String
            :generics $ [] 'MemberKey
            :return $ :: 'Map 'MemberKey 'respo.schema/Element
          :tests $ []
            %{} 'TestEntry (:name |preserves-number-key-and-guest)
              :code $ quote $ assert=
                {} $ 7 $ div
                  {} $ :class-name |member-label
                  <> "|访客"
                member-labels
                  {} $ 7 "|访客"
                  , |member-label
              :tags $ #{} :client
            %{} 'TestEntry (:name |preserves-string-key-and-empty-name)
              :code $ quote $ assert=
                {} $ |session $ div
                  {} $ :class-name |member-label
                  <> |
                member-labels
                  {} $ |session |
                  , |member-label
              :tags $ #{} :client
            %{} 'TestEntry (:name |preserves-tag-key-and-member-name)
              :code $ quote $ assert=
                {} $ :session $ div
                  {} $ :class-name |member-label
                  <> |Ada
                member-labels
                  {} $ :session |Ada
                  , |member-label
              :tags $ #{} :client
            %{} 'TestEntry (:name |empty-members)
              :code $ quote $ assert= ({})
                member-labels ({}) |member-label
              :tags $ #{} :client
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
        'SiteConfig $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct SiteConfig (:port 'Number) (:title 'String) (:icon 'String) (:dev-ui 'String) (:release-ui 'String) (:cdn-url 'String) (:theme 'String) (:storage-key 'String) (:storage-file 'String)
          :examples $ []
          :schema $ :: 'StructDef
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $ option:unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ :: 'Bool
        'site $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def site
            SiteConfig :port 11009 :title |Timegrass :icon |http://cdn.tiye.me/logo/timegrass.png :dev-ui |http://localhost:8100/main.css :release-ui |http://cdn.tiye.me/favored-fonts/main.css :cdn-url |http://cdn.tiye.me/timegrass/ :theme |#51C766 :storage-key |timegrass :storage-file |storage.cirru
          :examples $ []
          :schema $ :: 'app.config/SiteConfig
          :tests $ [] $ %{} 'TestEntry (:name |keeps-storage-and-port-contract)
            :code $ quote $ do
              assert= 11009 $ :port site
              assert= |timegrass $ :storage-key site
              assert= |storage.cirru $ :storage-file site
            :tags $ #{} :client :server
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
        'FinishedTaskView $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct FinishedTaskView (:id 'String) (:text 'String) (:finished-time 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'HistoryRoute $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct HistoryRoute (:year 'Number) (:week 'Number) (:start 'String) (:end 'String)
          :examples $ []
          :schema $ :: 'StructDef
        'HistoryRouteView $ %{} 'CodeEntry
          :doc "|历史页面的必需年份/周序视图；只校验 UI 使用的 year/week，不把服务端的 start/end 要求带入页面。"
          :code $ quote $ defstruct HistoryRouteView (:year 'Number) (:week 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'LegacyDatabaseView $ %{} 'CodeEntry
          :doc "|旧 Map 数据通过 decode-database 后的必需字段视图；复用既有 users 解码边界，不改变存储格式或额外元数据。"
          :code $ quote $ defstruct LegacyDatabaseView (:today 'String)
            :users $ :: 'Map 'String 'Dynamic
          :examples $ []
          :schema $ :: 'StructDef
        'LoginState $ %{} 'CodeEntry (:doc "|登录组件的必需字段视图；原始 state Map 继续保留额外字段并用于更新。")
          :code $ quote $ defstruct LoginState (:username 'String) (:password 'String)
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
            :states (:: 'List 'Dynamic) 'Dynamic
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
                    Result :ok $ ClientMessage :sync/active revision
                    invalid-message $ str "|Expected numeric active revision, got: " revision
                (:sync/heartbeat revision)
                  if (number? revision)
                    Result :ok $ ClientMessage :sync/heartbeat revision
                    invalid-message $ str "|Expected numeric heartbeat revision, got: " revision
                (:sync/idle revision)
                  if (number? revision)
                    Result :ok $ ClientMessage :sync/idle revision
                    invalid-message $ str "|Expected numeric idle revision, got: " revision
                (:sync/resume revision)
                  if (number? revision)
                    Result :ok $ ClientMessage :sync/resume revision
                    invalid-message $ str "|Expected numeric resume revision, got: " revision
                (:sync/ack revision)
                  if (number? revision)
                    Result :ok $ ClientMessage :sync/ack revision
                    invalid-message $ str "|Expected numeric acknowledgement revision, got: " revision
                (:dispatch op)
                  match (decode-operation op)
                    (:ok typed-op)
                      Result :ok $ ClientMessage :dispatch typed-op
                    (:err error) (Result :err error)
                _ $ match (decode-operation message)
                  (:ok typed-op)
                    Result :ok $ ClientMessage :dispatch typed-op
                  (:err error) (Result :err error)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/ClientMessage 'app.schema/MessageDecodeError
          :tests $ []
            %{} 'TestEntry (:name |decodes-sync-control)
              :code $ quote $ assert=
                Result :ok $ ClientMessage :sync/ack 7
                decode-client-message $ :: :sync/ack 7
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-legacy-direct-op)
              :code $ quote $ assert=
                Result :ok $ ClientMessage :dispatch $ Op :effect/ping
                decode-client-message $ Op :effect/ping
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-invalid-revision)
              :code $ quote $ assert= true
                match
                  decode-client-message $ :: :sync/active |bad
                  (:err error)
                    match error $
                      :invalid detail
                      starts-with? detail "|Expected numeric active revision"
                  _ false
              :tags $ #{} :server
            %{} 'TestEntry (:name |decodes-named-wire-operation)
              :code $ quote $ assert=
                Result :ok $ ClientMessage :dispatch $ Op :effect/ping
                decode-client-message $ parse-cirru-edn "|%:: 'ClientMessage 'dispatch $ %:: 'Op 'effect/ping"
              :tags $ #{} :server
        'decode-database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-database (raw)
            if (map? raw)
              let
                  today $ calcit.core/get raw :today
                  sessions $ calcit.core/get raw :sessions
                  users $ calcit.core/get raw :users
                cond
                    match today
                      (:some value)
                        not $ string? value
                      (:none) false
                    Result :err "|storage.cirru/:today expected String"
                  (match sessions ((:some value) (not (map? value))) ((:none) false))
                    Result :err "|storage.cirru/:sessions expected Map"
                  (match users ((:some value) (not (map? value))) ((:none) false))
                    Result :err "|storage.cirru/:users expected Map"
                  true $ match
                    try-decode-map-as
                      match users
                        (:some value) value
                        (:none) ({})
                      :: 'Map 'String 'Dynamic
                    (:ok users-map)
                      match (validate-stored-users users-map)
                        (:ok _)
                          Result :ok $ assoc
                            merge database $ decode-map-as raw $ :: 'Map 'Tag 'Dynamic
                            , :sessions $ {}
                        (:err message) (Result :err message)
                    (:err detail)
                      Result :err $ str "|storage.cirru/:users " detail
              Result :err "|storage.cirru expected Map"
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/database 'String
          :tests $ []
            %{} 'TestEntry (:name |defaults-missing-fields)
              :code $ quote $ assert= true
                match
                  decode-database $ {}
                  (:ok db)
                    and
                      = |2018-08-07 $ match (calcit.core/get db :today)
                        (:some value) value
                        (:none) nil
                      map? $ match (calcit.core/get db :users)
                        (:some value) value
                        (:none) nil
                      empty? $ match (calcit.core/get db :sessions)
                        (:some value) value
                        (:none) nil
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
              :code $ quote $ assert= true
                match
                  decode-database $ {} (:today |2026-09-25)
                    :sessions $ {} $ 1
                      {} $ :user-id |u1
                    :users $ {} $ |u1
                      {} (:id |u1) (:name |Alice)
                  (:ok db)
                    and
                      = |2026-09-25 $ match (calcit.core/get db :today)
                        (:some value) value
                        (:none) nil
                      empty? $ match (calcit.core/get db :sessions)
                        (:some value) value
                        (:none) nil
                      = |Alice $ match
                        calcit.core/get
                          match
                            calcit.core/get
                              match (calcit.core/get db :users)
                                (:some value) value
                                (:none) nil
                              , |u1
                            (:some value) value
                            (:none) nil
                          , :name
                        (:some value) value
                        (:none) nil
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |loads-legacy-edn-user-with-nested-nil)
              :code $ quote $ assert= true
                let
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
                          users $ match (calcit.core/get db :users)
                            (:some value) value
                            (:none) nil
                          user $ match (calcit.core/get users |u1)
                            (:some value) value
                            (:none) nil
                        and
                          = |2026-09-25 $ match (calcit.core/get db :today)
                            (:some value) value
                            (:none) nil
                          empty? $ match (calcit.core/get db :sessions)
                            (:some value) value
                            (:none) nil
                          map? user
                          = |Alice $ match (calcit.core/get user :name)
                            (:some value) value
                            (:none) nil
                    (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-nested-user-error-on-load)
              :code $ quote $ assert= true
                match
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
              :code $ quote $ assert= true
                match
                  decode-database $ {} $ :users
                    {} $ 7 $ {} (:id |u1) (:name |Alice)
                  (:err message) (starts-with? message "|storage.cirru/:users ")
                  (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-present-nil-in-original-field-order)
              :code $ quote $ do
                assert= (%err "|storage.cirru/:today expected String")
                  decode-database $ {} (:today nil) (:sessions 7) (:users false)
                assert= (%err "|storage.cirru/:sessions expected Map")
                  decode-database $ {} (:today |) (:sessions nil) (:users false)
                assert= (%err "|storage.cirru/:users expected Map")
                  decode-database $ {} (:today |)
                    :sessions $ {}
                    :users nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |preserves-present-empty-today)
              :code $ quote $ match
                decode-database $ {} $ :today |
                (:ok db)
                  assert= (Option :some |) (get db :today)
                (:err message) (raise message)
              :tags $ #{} :server
        'decode-finished-task-view $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-finished-task-view (raw)
            try-decode-map-as
              select-keys raw $ [] :id :text :finished-time
              , FinishedTaskView
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :return $ :: 'Result 'app.schema/FinishedTaskView 'String
          :tests $ []
            %{} 'TestEntry (:name |keeps-only-history-fields)
              :code $ quote $ assert= true
                match
                  decode-finished-task-view $ {} (:id |task-1) (:text |Done) (:finished-time 1735689600000) (:detail |unrelated) (:pending? false) (:created-time nil)
                  (:ok task)
                    and
                      = |task-1 $ :id task
                      = |Done $ :text task
                      = 1735689600000 $ :finished-time task
                  (:err _) false
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-missing-finished-time)
              :code $ quote $ assert= true
                match
                  decode-finished-task-view $ {} (:id |task-1) (:text |Done)
                  (:err message) (starts-with? message "|decode-map-as failed at $.finished-time:")
                  (:ok _) false
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-nil-finished-time)
              :code $ quote $ assert= true
                match
                  decode-finished-task-view $ {} (:id |task-1) (:text |Done) (:finished-time nil)
                  (:err message) (starts-with? message "|decode-map-as failed at $.finished-time:")
                  (:ok _) false
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-string-finished-time)
              :code $ quote $ assert= true
                match
                  decode-finished-task-view $ {} (:id |task-1) (:text |Done) (:finished-time |1735689600000)
                  (:err message) (starts-with? message "|decode-map-as failed at $.finished-time:")
                  (:ok _) false
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-numeric-id)
              :code $ quote $ assert= true
                match
                  decode-finished-task-view $ {} (:id 7) (:text |Done) (:finished-time 1735689600000)
                  (:err message) (starts-with? message "|decode-map-as failed at $.id:")
                  (:ok _) false
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-numeric-text)
              :code $ quote $ assert= true
                match
                  decode-finished-task-view $ {} (:id |task-1) (:text 7) (:finished-time 1735689600000)
                  (:err message) (starts-with? message "|decode-map-as failed at $.text:")
                  (:ok _) false
              :tags $ #{} :client
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
              :code $ quote $ assert= true
                match
                  decode-note-record $ {} (:id |n1) (:text |hello) (:time 42) (:updated-time nil)
                  (:ok note)
                    and
                      = |n1 $ :id note
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'Number
                        = expected-none $ :updated-time note
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-invalid-time-with-path)
              :code $ quote $ assert= true
                match
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
                      Result :ok $ Op :today today
                    (:err message)
                      invalid-message $ str "|Invalid today operation: " message
                (:session/connect)
                  Result :ok $ Op :session/connect
                (:session/disconnect)
                  Result :ok $ Op :session/disconnect
                (:session/remove-message value)
                  let
                      raw-id $ if (map? value)
                        match (calcit.core/get value :id)
                          (:some value) value
                          (:none) nil
                        , value
                    match (try-decode-map-as raw-id 'String)
                      (:ok message-id)
                        Result :ok $ Op :session/remove-message message-id
                      (:err message)
                        invalid-message $ str "|Invalid session/remove-message operation: " message
                (:user/log-in value)
                  match
                    try-decode-map-as value $ :: 'List 'String
                    (:ok credentials)
                      if
                        = 2 $ count credentials
                        Result :ok $ Op :user/log-in credentials
                        invalid-message "|Invalid user/log-in operation: expected two credentials"
                    (:err message)
                      invalid-message $ str "|Invalid user/log-in operation: " message
                (:user/sign-up value)
                  match
                    try-decode-map-as value $ :: 'List 'String
                    (:ok credentials)
                      if
                        = 2 $ count credentials
                        Result :ok $ Op :user/sign-up credentials
                        invalid-message "|Invalid user/sign-up operation: expected two credentials"
                    (:err message)
                      invalid-message $ str "|Invalid user/sign-up operation: " message
                (:user/log-out)
                  Result :ok $ Op :user/log-out
                (:router/change value)
                  match (decode-route value)
                    (:ok route)
                      Result :ok $ Op :router/change route
                    (:err message)
                      invalid-message $ str "|Invalid router/change operation: " message
                (:task/create-working value)
                  match (try-decode-map-as value 'String)
                    (:ok text)
                      Result :ok $ Op :task/create-working text
                    (:err message)
                      invalid-message $ str "|Invalid task/create-working operation: " message
                (:task/remove-working value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      Result :ok $ Op :task/remove-working task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/remove-working operation: " message
                (:task/finish-working value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      Result :ok $ Op :task/finish-working task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/finish-working operation: " message
                (:task/update-working value)
                  let
                      payload $ if (struct? value) (&struct:to-map value) value
                    match (try-decode-map-as payload TaskEdit)
                      (:ok edit)
                        Result :ok $ Op :task/update-working edit
                      (:err message)
                        invalid-message $ str "|Invalid task/update-working operation: " message
                (:task/touch-working value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      Result :ok $ Op :task/touch-working task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/touch-working operation: " message
                (:task/put-back value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      Result :ok $ Op :task/put-back task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/put-back operation: " message
                (:task/pend value)
                  match (try-decode-map-as value 'String)
                    (:ok task-id)
                      Result :ok $ Op :task/pend task-id
                    (:err message)
                      invalid-message $ str "|Invalid task/pend operation: " message
                (:note/add value)
                  match (try-decode-map-as value 'String)
                    (:ok text)
                      Result :ok $ Op :note/add text
                    (:err message)
                      invalid-message $ str "|Invalid note/add operation: " message
                (:note/edit value)
                  let
                      payload $ if (struct? value) (&struct:to-map value) value
                    match (try-decode-map-as payload NoteEdit)
                      (:ok edit)
                        Result :ok $ Op :note/edit edit
                      (:err message)
                        invalid-message $ str "|Invalid note/edit operation: " message
                (:note/remove value)
                  match (try-decode-map-as value 'String)
                    (:ok note-id)
                      Result :ok $ Op :note/remove note-id
                    (:err message)
                      invalid-message $ str "|Invalid note/remove operation: " message
                (:effect/persist)
                  Result :ok $ Op :effect/persist
                (:effect/ping)
                  Result :ok $ Op :effect/ping
                (:effect/pong)
                  Result :ok $ Op :effect/pong
                (:effect/connect)
                  Result :ok $ Op :effect/connect
                (:states cursor state)
                  match
                    try-decode-map-as cursor $ :: 'List 'Dynamic
                    (:ok checked-cursor)
                      Result :ok $ Op :states checked-cursor state
                    (:err message)
                      invalid-message $ str "|Invalid states cursor: " message
                _ $ invalid-message $ str "|Unknown application operation: " op
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/Op 'app.schema/MessageDecodeError
          :tests $ []
            %{} 'TestEntry (:name |accepts-today-string)
              :code $ quote $ assert=
                %ok $ Op :today |2026-09-25
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
                %ok $ Op :note/add |hello
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
                %ok $ Op :note/remove |note-1
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
                  %ok $ Op :task/create-working |write-docs
                  decode-operation $ :: :task/create-working |write-docs
                assert=
                  %ok $ Op :task/remove-working |task-1
                  decode-operation $ :: :task/remove-working |task-1
                assert=
                  %ok $ Op :task/finish-working |task-1
                  decode-operation $ :: :task/finish-working |task-1
                assert=
                  %ok $ Op :task/touch-working |task-1
                  decode-operation $ :: :task/touch-working |task-1
                assert=
                  %ok $ Op :task/put-back |task-1
                  decode-operation $ :: :task/put-back |task-1
                assert=
                  %ok $ Op :task/pend |task-1
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
                  %ok $ Op :user/log-in $ [] |Alice |secret
                  decode-operation $ :: :user/log-in $ [] |Alice |secret
                assert=
                  %ok $ Op :user/sign-up $ [] |Alice |secret
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
                  %ok $ Op :task/update-working $ TaskEdit :id |t1 :text |Updated
                  decode-operation $ :: :task/update-working $ {} (:id |t1) (:text |Updated)
                assert=
                  %ok $ Op :note/edit $ NoteEdit :id |n1 :text |Updated
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
                  %ok $ Op :task/update-working $ TaskEdit :id |t1 :text |Updated
                  decode-operation $ parse-cirru-edn $ format-cirru-edn
                    Op :task/update-working $ TaskEdit :id |t1 :text |Updated
                assert=
                  %ok $ Op :note/edit $ NoteEdit :id |n1 :text |Updated
                  decode-operation $ parse-cirru-edn $ format-cirru-edn
                    Op :note/edit $ NoteEdit :id |n1 :text |Updated
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
            %{} 'TestEntry (:name |preserves-mixed-state-cursor)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:editing? true) (:text |Draft)
                  operation $ Op :states cursor state
                assert= (%ok operation)
                  decode-operation $ :: :states cursor state
                assert= (%ok operation)
                  decode-operation $ parse-cirru-edn $ format-cirru-edn operation
                assert=
                  %ok $ Op :states ([]) nil
                  decode-operation $ :: :states ([]) nil
              :tags $ #{} :client :server
            %{} 'TestEntry (:name |rejects-non-list-state-cursor)
              :code $ quote $ do
                assert= true $ result:err? $ decode-operation (:: :states nil nil)
                assert= true $ result:err? $ decode-operation (:: :states 7 nil)
                assert= true $ result:err? $ decode-operation (:: :states |panel nil)
                assert= true $ result:err? $ decode-operation
                  :: :states ({}) nil
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
                    Result :ok $ Route :home
                  (:profile)
                    Result :ok $ Route :profile
                  (:history data)
                    decode-route-map $ {} (:name :history)
                      :data $ if (struct? data) (&struct:to-map data) data
                  (:notes data)
                    decode-route-map $ {} (:name :notes)
                      :data $ if (struct? data) (&struct:to-map data) data
                  _ $ Result :err |Unknown-route
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
                match
                  match (calcit.core/get data :name)
                    (:some value) value
                    (:none) nil
                  :home $ Result :ok $ Route :home
                  :profile $ Result :ok $ Route :profile
                  :history $ match
                    match (calcit.core/get data :data)
                      (:some value) (try-decode-map-as value HistoryRoute)
                      (:none) (try-decode-map-as nil HistoryRoute)
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
                        Result :ok $ Route :history route
                        Result :err |Invalid-history-range
                    (:err message) (Result :err message)
                  :notes $ match
                    match (calcit.core/get data :data)
                      (:some value) (try-decode-map-as value NotesRoute)
                      (:none) (try-decode-map-as nil NotesRoute)
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
                        Result :ok $ Route :notes route
                        Result :err |Invalid-notes-range
                    (:err message) (Result :err message)
                  _ $ Result :err |Unknown-route
                Result :err |Expected-route-map
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/Route 'String
          :tests $ []
            %{} 'TestEntry (:name |preserves-absent-route-payload-errors)
              :code $ quote $ do
                match (try-decode-map-as nil HistoryRoute)
                  (:err message)
                    assert= (Result :err message)
                      decode-route-map $ {} $ :name :history
                  (:ok _) (raise |Expected-history-payload-error)
                match (try-decode-map-as nil NotesRoute)
                  (:err message)
                    assert= (Result :err message)
                      decode-route-map $ {} $ :name :notes
                  (:ok _) (raise |Expected-notes-payload-error)
                assert=
                  Result :ok $ Route :history $ HistoryRoute :year 2026 :week 1 :start |2026-01-01 :end |2026-01-07
                  decode-route-map $ {} (:name :history)
                    :data $ {} (:year 2026) (:week 1) (:start |2026-01-01) (:end |2026-01-07)
                assert=
                  Result :ok $ Route :notes $ NotesRoute :year 2026 :month 0
                  decode-route-map $ {} (:name :notes)
                    :data $ {} (:year 2026) (:month 0)
              :tags $ #{} :client :option-consumer-contract :server
            %{} 'TestEntry (:name |preserves-invalid-route-payload-errors)
              :code $ quote $ let
                  check-payload! $ fn (value)
                    hint-fn $ {}
                      :args $ [] 'Dynamic
                      :return 'Unit
                    match (try-decode-map-as value HistoryRoute)
                      (:err message)
                        assert= (Result :err message)
                          decode-route-map $ {} (:name :history) (:data value)
                      (:ok _) (raise |Expected-history-payload-error)
                    match (try-decode-map-as value NotesRoute)
                      (:err message)
                        assert= (Result :err message)
                          decode-route-map $ {} (:name :notes) (:data value)
                      (:ok _) (raise |Expected-notes-payload-error)
                    , &unit
                check-payload! nil
                check-payload! false
                check-payload! 0
                check-payload! |
                check-payload! :invalid
                check-payload! $ []
                check-payload! $ {}
              :tags $ #{} :client :option-consumer-contract :server
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
                        Result :ok $ ServerMessage :snapshot revision decoded-store
                      (:err reason)
                        invalid-message $ str "|Invalid snapshot envelope: " reason
                    invalid-message $ str "|Invalid snapshot envelope: " message
                (:patch base-revision revision changes)
                  if
                    and (number? base-revision) (number? revision)
                    match
                      try-decode-map-as changes $ :: 'List 'recollect.schema/change-op
                      (:ok decoded-list)
                        Result :ok $ ServerMessage :patch base-revision revision decoded-list
                      (:err reason)
                        invalid-message $ str "|Invalid patch envelope: " reason
                    invalid-message $ str "|Invalid patch envelope: " message
                (:effect/pong)
                  Result :ok $ ServerMessage :effect/pong
                _ $ invalid-message $ str "|Unknown server message: " message
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'calcit.core/Result 'app.schema/ServerMessage 'app.schema/MessageDecodeError
          :tests $ []
            %{} 'TestEntry (:name |decodes-pong)
              :code $ quote $ assert=
                Result :ok $ ServerMessage :effect/pong
                decode-server-message $ :: :effect/pong
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patch-payload)
              :code $ quote $ assert= true
                match
                  decode-server-message $ :: :patch 1 2 :bad
                  (:err error)
                    match error $
                      :invalid detail
                      starts-with? detail "|Invalid patch envelope"
                  _ false
              :tags $ #{} :client
            %{} 'TestEntry (:name |decodes-named-wire-pong)
              :code $ quote $ assert=
                Result :ok $ ServerMessage :effect/pong
                decode-server-message $ parse-cirru-edn "|%:: 'ServerMessage 'effect/pong"
              :tags $ #{} :client
            %{} 'TestEntry (:name |validates-nominal-patch-list)
              :code $ quote $ assert=
                Result :ok $ ServerMessage :patch 3 4 $ [] (%:: recollect.schema/change-op :replace 1)
                decode-server-message $ ServerMessage :patch 3 4 $ [] (%:: recollect.schema/change-op :replace 1)
              :tags $ #{} :client
            %{} 'TestEntry (:name |decodes-snapshot-map)
              :code $ quote $ assert=
                Result :ok $ ServerMessage :snapshot 2 $ {} (:a 1)
                decode-server-message $ ServerMessage :snapshot 2 $ {} (:a 1)
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-non-nominal-change)
              :code $ quote $ assert= true
                result:err? $ decode-server-message $ parse-cirru-edn "|%:: 'ServerMessage 'patch 3 4 $ [] (:: :replace 1)"
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-non-enum-patch-elements)
              :code $ quote $ do
                assert= true $ result:err? $ decode-server-message
                  :: :patch 1 2 $ [] 1
                assert= true $ result:err? $ decode-server-message
                  :: :patch 1 2 $ [] nil
                assert= true $ result:err? $ decode-server-message
                  :: :patch 1 2 $ [] $ {} (:kind :replace)
              :tags $ #{} :client
            %{} 'TestEntry (:name |accepts-recursive-nominal-patch)
              :code $ quote $ let
                  change $ recollect.schema/change-op :update :profile $ recollect.schema/change-op :replace
                    {} $ :name |Ada
                  message $ ServerMessage :patch 1 2 $ [] change
                assert= (Result :ok message) (decode-server-message message)
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-wrong-nominal-patch-element)
              :code $ quote $ assert= true
                result:err? $ decode-server-message $ :: :patch 1 2
                  [] $ MessageDecodeError :invalid |not-a-change
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
              :code $ quote $ assert= true
                match
                  decode-task-record $ {} (:id |x) (:text |ok) (:detail |) (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
                  (:ok task)
                    and
                      = |x $ :id task
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'Number
                        = expected-none $ :created-time task
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'Number
                        = expected-none $ :archived-time task
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-invalid-text-with-path)
              :code $ quote $ assert= true
                match
                  decode-task-record $ {} (:id |x) (:text 3) (:detail |) (:pending? false)
                  (:err message) (starts-with? message "|decode-map-as failed at $.text:")
                  (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |missing-times-become-none)
              :code $ quote $ assert= true
                match
                  decode-task-record $ {} (:id |x) (:text |ok) (:detail |) (:pending? false)
                  (:ok task)
                    and
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'Number
                        = expected-none $ :created-time task
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'Number
                        = expected-none $ :touched-time task
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'Number
                        = expected-none $ :finished-time task
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'Number
                        = expected-none $ :archived-time task
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-missing-id-with-path)
              :code $ quote $ assert= true
                match
                  decode-task-record $ {} (:text |ok) (:detail |) (:pending? false)
                  (:err message)
                    = message "|decode-map-as failed at $: struct :TaskRecord is missing required field :id"
                  (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-unknown-field)
              :code $ quote $ assert= true
                match
                  decode-task-record $ {} (:id |x) (:text |ok) (:detail |) (:pending? false) (:surprise 1)
                  (:err message)
                    = message "|decode-map-as failed at $: struct :TaskRecord has unknown field :surprise"
                  (:ok _) false
              :tags $ #{} :server
        'decode-user-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-user-record (raw)
            let
                normalized $ if (map? raw)
                  let
                      cleaned $ foldl ([] :nickname :avatar :password) raw $ fn (entry field)
                        match (calcit.core/get entry field)
                          (:some value)
                            if (nil? value) (dissoc entry field) entry
                          (:none) (dissoc entry field)
                      tasks $ calcit.core/get cleaned :tasks
                      notes $ calcit.core/get cleaned :notes
                      empty-tasks $ {}
                        :working $ {}
                        :pending $ {}
                        :finished $ {}
                      with-tasks $ &map:assoc cleaned :tasks $ match tasks
                        (:some value)
                          if (nil? value) empty-tasks $ normalize-user-tasks value
                        (:none) empty-tasks
                    &map:assoc with-tasks :notes $ match notes
                      (:some value)
                        if (nil? value) ({}) (normalize-note-map value)
                      (:none) ({})
                  , raw
              try-decode-map-as normalized UserRecord
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'T
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result 'app.schema/UserRecord 'String
          :tests $ []
            %{} 'TestEntry (:name |defaults-legacy-optional-fields)
              :code $ quote $ assert= true
                match
                  decode-user-record $ {} (:id |u1) (:name |Alice) (:nickname nil) (:avatar nil) (:password nil)
                  (:ok user)
                    and
                      = |u1 $ :id user
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'String
                        = expected-none $ :password user
                      let
                          expected-none $ Option :none
                        assert-type expected-none $ :: 'Option 'String
                        = expected-none $ :nickname user
                      empty? $ :notes user
                      empty? $ :working $ :tasks user
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |migrates-nested-legacy-task)
              :code $ quote $ assert= true
                match
                  decode-user-record $ {} (:id |u1) (:name |Alice)
                    :tasks $ {}
                      :working $ {} $ |t1
                        {} (:id |t1) (:text |work) (:detail |) (:pending? false) (:created-time nil)
                      :pending $ {}
                      :finished $ {}
                  (:ok user)
                    let
                        expected-none $ Option :none
                      assert-type expected-none $ :: 'Option 'Number
                      = expected-none $ :created-time $ match
                        calcit.core/get
                          :working $ :tasks user
                          , |t1
                        (:some value) value
                        (:none) nil
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |migrates-nested-legacy-note)
              :code $ quote $ assert= true
                match
                  decode-user-record $ {} (:id |u1) (:name |Alice)
                    :notes $ {} $ |n1
                      {} (:id |n1) (:text |hello) (:time 42) (:updated-time nil)
                  (:ok user)
                    let
                        expected-none $ Option :none
                      assert-type expected-none $ :: 'Option 'Number
                      = expected-none $ :updated-time $ match
                        calcit.core/get (:notes user) |n1
                        (:some value) value
                        (:none) nil
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-bad-nested-task-with-path)
              :code $ quote $ assert= true
                match
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
              :code $ quote $ assert= true
                match
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
            Result :err $ MessageDecodeError :invalid detail
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result 'T 'app.schema/MessageDecodeError
          :tests $ [] $ %{} 'TestEntry (:name |preserves-error-payload)
            :code $ quote $ let
                result $ invalid-message |invalid-envelope
              assert-type result $ :: 'Result 'Number 'MessageDecodeError
              match result
                (:ok _) (raise |Expected-decode-error)
                (:err error)
                  assert= (MessageDecodeError :invalid |invalid-envelope) error
            :tags $ #{} :client :server
        'load-database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-database (raw)
            match (decode-database raw)
              (:err message) (Result :err message)
              (:ok legacy)
                let
                    decoded-legacy $ decode-map-as
                      .filter-kv legacy $ fn (key value)
                        or (= key :today) (= key :users)
                      , LegacyDatabaseView
                    users $ :users decoded-legacy
                    decoded $ let
                        seed $ Result :ok $ {}
                      assert-type seed $ :: 'Result (:: 'Map 'String 'app.schema/UserRecord) 'String
                      fold (map-entries users) seed $ fn (acc entry)
                        match acc
                          (:err message) (Result :err message)
                          (:ok result)
                            let
                                id $ :key entry
                                raw-user $ :value entry
                              match (decode-user-record raw-user)
                                (:ok user)
                                  Result :ok $ .assoc result id user
                                (:err message)
                                  Result :err $ str |storage.cirru/:users/ id |: message
                  match decoded
                    (:err message) (Result :err message)
                    (:ok records)
                      Result :ok $ DatabaseRecord :today (:today decoded-legacy) :users records :sessions $ {}
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
            %{} 'TestEntry
              :name |ignores-extra-legacy-metadata-without-mutating-input
              :code $ quote $ let
                  db $ struct-with (test-database)
                    :sessions $ {}
                  raw $ assoc (database-to-map db) :extra 7
                assert= (%ok db) (load-database raw)
                assert= (Option :some 7) (get raw :extra)
              :tags $ #{} :server
            %{} 'TestEntry (:name |preserves-validation-error-order)
              :code $ quote $ do
                assert= (%err "|storage.cirru/:today expected String")
                  load-database $ {} (:today 0) (:sessions nil) (:users false)
                assert= (%err "|storage.cirru/:sessions expected Map")
                  load-database $ {} (:today |) (:sessions nil) (:users false)
                assert= (%err "|storage.cirru/:users expected Map")
                  load-database $ {} (:today |)
                    :sessions $ {}
                    :users false
              :tags $ #{} :server
        'new-session $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn new-session (sid)
            SessionRecord :id sid :user-id (Option :none) :nickname (Option :none) :router (Route :home) :messages $ {}
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
            if (map? raw)
              match (calcit.core/get raw :updated-time)
                (:some value)
                  if (nil? value) (dissoc raw :updated-time) raw
                (:none) (dissoc raw :updated-time)
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
                match (calcit.core/get entry field)
                  (:some value)
                    if (nil? value) (dissoc entry field) entry
                  (:none) (dissoc entry field)
              , raw
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'T)
            :args $ [] 'T
            :generics $ [] 'T
          :tests $ []
            %{} 'TestEntry (:name |preserves-present-values-and-removes-legacy-nil)
              :code $ quote $ let
                  raw $ {} (:id |task) (:created-time 0) (:touched-time nil) (:finished-time false) (:extra |preserved)
                  normalized $ normalize-task-record raw
                assert=
                  {} (:id |task) (:created-time 0) (:finished-time false) (:extra |preserved)
                  , normalized
                assert= (Option :some nil) (get raw :touched-time)
                assert= (Option :none) (get normalized :touched-time)
                assert= (Option :none) (get normalized :archived-time)
              :tags $ #{} :server
            %{} 'TestEntry (:name |preserves-non-map-input-for-decoder)
              :code $ quote $ do
                assert= nil $ normalize-task-record nil
                assert= false $ normalize-task-record false
                assert= 0 $ normalize-task-record 0
                assert= | $ normalize-task-record |
              :tags $ #{} :server
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
            match (destruct-list path)
              (:none) base
              (:some field tail)
                if (map? base)
                  match (calcit.core/get base field)
                    (:some value) (recur value tail)
                    (:none) nil
                  , nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic $ :: 'List 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |handles-non-map-boundaries)
              :code $ quote $ do
                assert= 1 $ read-path
                  {} $ :a $ {} (:b 1)
                  [] :a :b
                assert= nil $ read-path
                  {} $ :a |not-a-map
                  [] :a :b
                assert= |leaf $ read-path |leaf $ []
              :tags $ #{} :server
            %{} 'TestEntry (:name |mixed-keys-and-falsey-leaves)
              :code $ quote $ do
                assert= false $ read-path
                  {} $ :sessions $ {}
                    7 $ {} $ |visible false
                  [] :sessions 7 |visible
                assert= nil $ read-path
                  {} $ :sessions $ {}
                    7 $ {} $ |visible nil
                  [] :sessions 7 |visible
                assert= nil $ read-path ({}) ([] :missing)
                assert= false $ read-path false $ []
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
                user-record $ UserRecord :id |u1 :name |Alice :nickname (Option :none) :avatar (Option :none) :password (Option :none) :tasks tasks :notes $ {}
                session-record $ struct-with (new-session 7)
                  :user-id $ Option :some |u1
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
            let
                seed $ Result :ok users
              assert-type seed $ :: 'Result (:: 'Map 'String 'T) 'String
              foldl (-> users keys .to-list) seed $ fn (result user-id)
                match result
                  (:err message) (Result :err message)
                  (:ok _)
                    let
                        candidate $ .unwrap $ calcit.core/get users user-id
                      if (map? candidate)
                        match (decode-user-record candidate)
                          (:ok user)
                            if
                              = user-id $ :id user
                              Result :ok users
                              Result :err $ str |storage.cirru/:users/ user-id "|:id differs from map key"
                          (:err detail)
                            Result :err $ str |storage.cirru/:users/ user-id |: detail
                        Result :err $ str |storage.cirru/:users/ user-id "|:legacy user record expected Map"
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'Map 'String 'T
            :generics $ [] 'T
            :return $ :: 'calcit.core/Result (:: 'Map 'String 'T) 'String
          :tests $ []
            %{} 'TestEntry (:name |accepts-legacy-user-map)
              :code $ quote $ assert= true
                match
                  validate-stored-users $ {} $ |u1
                    {} (:id |u1) (:name |Alice)
                      :tasks $ {}
                        :working $ {} $ |t1
                          {} (:id |t1) (:text |work) (:detail |) (:pending? false) (:created-time nil)
                        :pending $ {}
                        :finished $ {}
                  (:ok users)
                    match
                      calcit.core/get
                        .unwrap $ calcit.core/get users |u1
                        , :name
                      (:some value) (= |Alice value)
                      (:none) false
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-nested-user-error-with-key)
              :code $ quote $ assert= true
                match
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
              :code $ quote $ assert= true
                match
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
              :code $ quote $ assert= true
                match
                  validate-stored-users $ {} $ |u1
                    {} (:id |different) (:name |Alice)
                  (:err message) (starts-with? message "|storage.cirru/:users/u1:id differs from map key")
                  (:ok _) false
              :tags $ #{} :server
            %{} 'TestEntry
              :name |rejects-non-map-payloads-without-changing-empty-map
              :code $ quote $ do
                assert=
                  Result :err "|storage.cirru/:users/u1:legacy user record expected Map"
                  validate-stored-users $ {} $ |u1 nil
                assert=
                  Result :err "|storage.cirru/:users/u1:legacy user record expected Map"
                  validate-stored-users $ {} $ |u1 false
                assert=
                  Result :err "|storage.cirru/:users/u1:legacy user record expected Map"
                  validate-stored-users $ {} $ |u1 0
                assert=
                  Result :err "|storage.cirru/:users/u1:legacy user record expected Map"
                  validate-stored-users $ {} $ |u1 |
                assert=
                  Result :ok $ {}
                  validate-stored-users $ {}
              :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.schema
          :require $ recollect.schema :as patch-schema
    'app.server $ %{} 'FileEntry
      :defs $ {}
        '*client-caches $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *client-caches ({})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Number (:: 'Map 'Tag 'Dynamic)
        '*client-states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *client-states ({})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Number 'app.server/ClientSyncState
        '*dirty-clients $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *dirty-clients (#{})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Set 'Number
        '*initial-db $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *initial-db
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
          :code $ quote $ defref *reader-reel @*reel
          :examples $ []
          :schema $ :: 'Ref $ :: 'cumulo-reel.core/ReelState 'app.schema/DatabaseRecord
        '*reel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *reel
            ReelState :base @*initial-db :db @*initial-db :records ([]) :merged? false
          :examples $ []
          :schema $ :: 'Ref $ :: 'cumulo-reel.core/ReelState 'app.schema/DatabaseRecord
        '*sync-metrics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-metrics
            SyncMetrics :last-diff-latency-ms 0 :last-patch-bytes 0 :pending-clients 0 :slow-clients 0 :resync-count 0 :patch-attempts 0 :snapshot-attempts 0 :last-revision 0
          :examples $ []
          :schema $ :: 'Ref 'app.server/SyncMetrics
        '*sync-retry-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-retry-scheduled? false
          :examples $ []
          :schema $ :: 'Ref 'Bool
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-revision 0
          :examples $ []
          :schema $ :: 'Ref 'Number
        '*sync-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-scheduled? false
          :examples $ []
          :schema $ :: 'Ref 'Bool
        'ClientSyncState $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct ClientSyncState (:status 'Tag) (:last-heartbeat 'Number) (:acked-rev 'Number) (:dirty-rev 'Number) (:in-flight? 'Bool) (:needs-snapshot? 'Bool) (:slow-client? 'Bool)
            :sent-rev $ :: 'Option 'Number
            :sent-store $ :: 'Option $ :: 'Map 'Tag 'Dynamic
            :last-send-outcome $ :: 'Option 'Tag
          :examples $ []
          :schema $ :: 'StructDef
        'SyncMetrics $ %{} 'CodeEntry
          :doc "|Process-lifetime synchronization counters with read-time client gauges."
          :code $ quote $ defstruct SyncMetrics (:last-diff-latency-ms 'Number) (:last-patch-bytes 'Number) (:pending-clients 'Number) (:slow-clients 'Number) (:resync-count 'Number) (:patch-attempts 'Number) (:snapshot-attempts 'Number) (:last-revision 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'acknowledge-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn acknowledge-client! (sid revision)
            let
                state $ option:unwrap $ get @*client-states sid
              match (:sent-rev state)
                (:some sent-revision)
                  when (= revision sent-revision)
                    match (:sent-store state)
                      (:some sent-store)
                        do (swap! *client-caches assoc sid sent-store)
                          swap! *client-states update sid $ fn (current) (next-sync-ack-state current revision)
                          when
                            > (:dirty-rev state) revision
                            swap! *dirty-clients include sid
                            request-sync!
                      (:none) &unit
                (:none) &unit
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number
          :tests $ []
            %{} 'TestEntry (:name |ignores-negative-ack-without-pending-send)
              :code $ quote $ let
                  previous-states @*client-states
                  previous-caches @*client-caches
                reset! *client-states $ {} $ 1 empty-sync-state
                reset! *client-caches $ {}
                let
                    failed? $ try
                      do (acknowledge-client! 1 -1) false
                      fn (message) true
                    observed-states @*client-states
                    observed-caches @*client-caches
                  reset! *client-states previous-states
                  reset! *client-caches previous-caches
                  assert= false failed?
                  assert=
                    {} $ 1 empty-sync-state
                    , observed-states
                  assert= ({}) observed-caches
              :tags $ #{} :server
            %{} 'TestEntry (:name |promotes-cache-only-after-matching-ack)
              :code $ quote $ let
                  previous-states @*client-states
                  previous-caches @*client-caches
                  old-store $ {} $ :value |old
                  new-store $ {} $ :value |new
                  pending $ next-sync-send-state
                    struct-with empty-sync-state (:status :active) (:dirty-rev 7)
                    , 7 new-store $ wss.core/WssSendOutcome :accepted
                reset! *client-states $ {} (1 pending) (2 empty-sync-state)
                reset! *client-caches $ {} $ 1 old-store
                acknowledge-client! 1 6
                let
                    stale-caches @*client-caches
                    stale-states @*client-states
                  acknowledge-client! 1 7
                  let
                      accepted-caches @*client-caches
                      accepted-states @*client-states
                    acknowledge-client! 1 7
                    let
                        duplicate-caches @*client-caches
                        duplicate-states @*client-states
                      reset! *client-states previous-states
                      reset! *client-caches previous-caches
                      assert=
                        {} $ 1 old-store
                        , stale-caches
                      assert= pending $ option:unwrap $ get stale-states 1
                      assert=
                        {} $ 1 new-store
                        , accepted-caches
                      assert= (next-sync-ack-state pending 7)
                        option:unwrap $ get accepted-states 1
                      assert= empty-sync-state $ option:unwrap $ get accepted-states 2
                      assert= accepted-caches duplicate-caches
                      assert= accepted-states duplicate-states
              :tags $ #{} :server
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
                op-id $ .to-string $ generate-id!
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
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'app.schema/Op 'Number
          :tests $ [] $ %{} 'TestEntry (:name |ping-to-absent-peer-returns-unit)
            :code $ quote $ assert= &unit
              dispatch! (schema/Op :effect/ping) 2147483000
            :tags $ #{} :server
        'empty-sync-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def empty-sync-state
            ClientSyncState :status :idle :last-heartbeat 0 :acked-rev 0 :dirty-rev 0 :in-flight? false :needs-snapshot? true :slow-client? false :sent-rev (Option :none) :sent-store (Option :none) :last-send-outcome $ Option :none
          :examples $ []
          :schema $ :: 'app.server/ClientSyncState
        'get-backup-path! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn get-backup-path! ()
            let
                now $ extract-time $ current-date!
              join-path calcit-dirname |backups
                str $ match (calcit.core/get now :month)
                  (:some value) value
                  (:none) nil
                str
                  match (calcit.core/get now :day)
                    (:some value) value
                    (:none) nil
                  , |-snapshot.cirru
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
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number (:: 'Map 'Tag 'Dynamic) 'wss.core/WssSendOutcome
          :tests $ [] $ %{} 'TestEntry (:name |all-outcomes-return-unit)
            :code $ quote $ let
                previous-states @*client-states
                previous-dirty @*dirty-clients
                previous-retry @*sync-retry-scheduled?
                store $ decode-map-as ({}) (:: 'Map 'Tag 'Dynamic)
              reset! *client-states $ {}
              reset! *dirty-clients $ #{}
              reset! *sync-retry-scheduled? true
              let
                  accepted $ handle-sync-send! 7 1 store $ WssSendOutcome :accepted
                  backpressured $ handle-sync-send! 7 1 store $ WssSendOutcome :backpressured
                  too-large $ handle-sync-send! 7 1 store $ WssSendOutcome :too-large
                  closed $ handle-sync-send! 7 1 store $ WssSendOutcome :closed
                  dirty @*dirty-clients
                reset! *client-states previous-states
                reset! *dirty-clients previous-dirty
                reset! *sync-retry-scheduled? previous-retry
                assert= &unit accepted
                assert= &unit backpressured
                assert= &unit too-large
                assert= &unit closed
                assert= (#{} 7) dirty
            :tags $ #{} :server
        'invalidate-sync-caches! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn invalidate-sync-caches! ()
            reset! *client-caches $ {}
            each (keys @*client-states)
              fn (sid)
                swap! *client-states update sid $ fn (state)
                  struct-with
                    struct-with state (:needs-snapshot? true) (:in-flight? false)
                    :sent-rev $ Option :none
                    :sent-store $ Option :none
                let
                    state $ option:unwrap $ get @*client-states sid
                  when
                    = :active $ :status state
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
            set-interval! 600000 $ fn () $ persist-db!
            set-interval! 60000 $ fn () $ set-today!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ []
        'mark-client-active! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mark-client-active! (sid client-revision force-snapshot?)
            let
                state $ option:unwrap-or (get @*client-states sid)
                  struct-with empty-sync-state $ :dirty-rev @*sync-revision
                resumed? $ or force-snapshot? $ not= :active (:status state)
                next-state-base $ struct-with state (:status :active)
                  :last-heartbeat $ now-ms
                  :acked-rev $ if resumed? client-revision $ :acked-rev state
                  :in-flight? $ if resumed? false $ :in-flight? state
                  :needs-snapshot? $ or resumed? $ :needs-snapshot? state
                next-state $ if resumed?
                  struct-with next-state-base
                    :sent-rev $ Option :none
                    :sent-store $ Option :none
                  , next-state-base
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
                struct-with
                  struct-with state (:status :idle) (:acked-rev client-revision) (:in-flight? false) (:needs-snapshot? true)
                  :sent-rev $ Option :none
                  :sent-store $ Option :none
              swap! *client-caches dissoc sid
              swap! *dirty-clients exclude sid
            , &unit
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
                    = :active $ :status state
                    swap! *dirty-clients include sid
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number
        'next-sync-ack-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn next-sync-ack-state (current revision)
            struct-with
              struct-with current (:acked-rev revision) (:in-flight? false)
              :sent-rev $ Option :none
              :sent-store $ Option :none
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.server/ClientSyncState)
            :args $ [] 'app.server/ClientSyncState 'Number
          :tests $ [] $ %{} 'TestEntry
            :name |repeated-backpressure-converges-to-latest-revision
            :code $ quote $ let
                initial $ struct-with empty-sync-state (:status :active) (:acked-rev 3) (:dirty-rev 4) (:in-flight? false) (:needs-snapshot? false)
                after-first-backpressure $ next-sync-send-state initial 4
                  {} $ :value 4
                  %:: wss.core/WssSendOutcome :backpressured
                after-latest-backpressure $ next-sync-send-state
                  struct-with after-first-backpressure $ :dirty-rev 7
                  , 7
                    {} $ :value 7
                    %:: wss.core/WssSendOutcome :backpressured
                accepted-latest $ next-sync-send-state
                  struct-with after-latest-backpressure $ :dirty-rev 9
                  , 9
                    {} $ :value 9
                    %:: wss.core/WssSendOutcome :accepted
              assert=
                struct-with empty-sync-state (:status :active) (:acked-rev 9) (:dirty-rev 9) (:in-flight? false) (:needs-snapshot? false) (:slow-client? false)
                  :last-send-outcome $ Option :some :accepted
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
                initial $ SyncMetrics :last-diff-latency-ms 0 :last-patch-bytes 0 :pending-clients 0 :slow-clients 0 :resync-count 0 :patch-attempts 0 :snapshot-attempts 0 :last-revision 0
                after-patch $ next-sync-metrics initial :patch 7 3 "|A😀"
              assert=
                SyncMetrics :last-diff-latency-ms 2 :last-patch-bytes 5 :pending-clients 0 :slow-clients 0 :resync-count 0 :patch-attempts 1 :snapshot-attempts 1 :last-revision 8
                next-sync-metrics after-patch :snapshot 8 2 |ignored
            :tags $ #{} :server
        'next-sync-send-state $ %{} 'CodeEntry
          :doc "|Advance one client synchronization state from a typed transport admission outcome."
          :code $ quote $ defn next-sync-send-state (current revision new-store outcome)
            match outcome
              (:accepted)
                struct-with current
                  :sent-rev $ Option :some revision
                  :sent-store $ Option :some new-store
                  :in-flight? true
                  :needs-snapshot? false
                  :slow-client? false
                  :last-send-outcome $ Option :some :accepted
              (:backpressured)
                struct-with current
                  :dirty-rev $ let
                      current-dirty $ :dirty-rev current
                    if (> revision current-dirty) revision current-dirty
                  :slow-client? true
                  :last-send-outcome $ Option :some :backpressured
              (:too-large)
                struct-with current (:needs-snapshot? true) (:slow-client? true)
                  :last-send-outcome $ Option :some :too-large
              (:closed)
                struct-with
                  struct-with current (:status :idle) (:in-flight? false)
                    :last-send-outcome $ Option :some :closed
                  :sent-rev $ Option :none
                  :sent-store $ Option :none
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.server/ClientSyncState)
            :args $ [] 'app.server/ClientSyncState 'Number (:: 'Map 'Tag 'Dynamic) 'wss.core/WssSendOutcome
          :tests $ []
            %{} 'TestEntry (:name |accepted-records-pending-store)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :active)
                  :sent-rev $ Option :some 7
                  :sent-store $ Option :some $ {} (:value 1)
                  :in-flight? true
                  :needs-snapshot? false
                  :slow-client? false
                  :last-send-outcome $ Option :some :accepted
                next-sync-send-state
                  struct-with empty-sync-state $ :status :active
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :accepted
              :tags $ #{} :server
            %{} 'TestEntry (:name |oversized-payload-requires-snapshot)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :active) (:needs-snapshot? true) (:slow-client? true)
                  :last-send-outcome $ Option :some :too-large
                next-sync-send-state
                  struct-with empty-sync-state $ :status :active
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :too-large
              :tags $ #{} :server
            %{} 'TestEntry (:name |closed-clears-pending-send)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :idle) (:in-flight? false)
                  :last-send-outcome $ Option :some :closed
                next-sync-send-state
                  struct-with empty-sync-state (:status :active) (:in-flight? true)
                    :sent-rev $ Option :some 7
                    :sent-store $ Option :some $ {} (:value 1)
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :closed
              :tags $ #{} :server
            %{} 'TestEntry (:name |backpressure-preserves-latest-dirty-revision)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :active) (:acked-rev 5) (:dirty-rev 7) (:slow-client? true)
                  :last-send-outcome $ Option :some :backpressured
                next-sync-send-state
                  struct-with empty-sync-state (:status :active) (:acked-rev 5) (:dirty-rev 6)
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
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'read-sync-metrics $ %{} 'CodeEntry
          :doc "|Read synchronization counters plus current pending and slow-client gauges."
          :code $ quote $ defn read-sync-metrics ()
            let
                states @*client-states
                pending-clients $ .len $ .filter-kv states
                  fn (sid state) (:in-flight? state)
                slow-clients $ .len $ .filter-kv states
                  fn (sid state) (:slow-client? state)
              struct-with @*sync-metrics (:pending-clients pending-clients) (:slow-clients slow-clients)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.server/SyncMetrics)
            :args $ []
          :tests $ []
            %{} 'TestEntry (:name |typed-metrics-gauges)
              :code $ quote $ let
                  metrics $ read-sync-metrics
                assert= 0 $ :pending-clients metrics
                assert= 0 $ :slow-clients metrics
              :tags $ #{} :server
            %{} 'TestEntry (:name |counts-clients-with-identical-state)
              :code $ quote $ let
                  previous @*client-states
                  pending $ struct-with empty-sync-state (:in-flight? true) (:slow-client? true)
                reset! *client-states $ {} (1 pending) (2 pending) (3 empty-sync-state)
                let
                    observed $ read-sync-metrics
                  reset! *client-states previous
                  assert= 2 $ :pending-clients observed
                  assert= 2 $ :slow-clients observed
              :tags $ #{} :server
        'record-resync! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn record-resync! ()
            swap! *sync-metrics $ fn (metrics)
              struct-with metrics $ :resync-count $ inc (:resync-count metrics)
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
          :tests $ [] $ %{} 'TestEntry (:name |increments-only-resync-counter)
            :code $ quote $ let
                previous @*sync-metrics
                first-result $ record-resync!
                second-result $ record-resync!
                observed @*sync-metrics
              reset! *sync-metrics previous
              assert= &unit first-result
              assert= &unit second-result
              assert=
                struct-with previous $ :resync-count $ + 2 (:resync-count previous)
                , observed
            :tags $ #{} :server
        'record-sync-send! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn record-sync-send! (message-kind revision diff-latency payload) (swap! *sync-metrics next-sync-metrics message-kind revision diff-latency payload) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Tag 'Number 'Number 'String
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (println "|Code updated..")
            if (not config/dev?) (raise "|reloading only happens in dev mode")
            clear-twig-caches!
            reset! *reel $ refresh-reel @*reel @*initial-db replay-updater
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
              set-timeout! sync-coalesce-delay $ fn () (reset! *sync-scheduled? false) (render-loop!)
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
          :tests $ [] $ %{} 'TestEntry (:name |already-scheduled-returns-unit)
            :code $ quote $ let
                previous @*sync-scheduled?
              reset! *sync-scheduled? true
              let
                  result $ request-sync!
                  scheduled? @*sync-scheduled?
                reset! *sync-scheduled? previous
                assert= &unit result
                assert= true scheduled?
            :tags $ #{} :server
        'request-sync-retry! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-sync-retry! ()
            if @*sync-retry-scheduled? &unit $ do (reset! *sync-retry-scheduled? true)
              set-timeout! sync-retry-delay $ fn () (reset! *sync-retry-scheduled? false)
                when
                  not $ empty? @*dirty-clients
                  request-sync!
                , &unit
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
          :tests $ [] $ %{} 'TestEntry (:name |already-scheduled-returns-unit)
            :code $ quote $ let
                previous @*sync-retry-scheduled?
              reset! *sync-retry-scheduled? true
              let
                  result $ request-sync-retry!
                  scheduled? @*sync-retry-scheduled?
                reset! *sync-retry-scheduled? previous
                assert= &unit result
                assert= true scheduled?
            :tags $ #{} :server
        'run-server! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn run-server! (port)
            wss-serve!
              {} $ :port port
              fn (data)
                match data
                  (:connect sid)
                    do
                      swap! *client-states assoc sid $ struct-with empty-sync-state (:status :idle)
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
              option:unwrap-or (get-env |WSS_BIND_ADDRESS) |0.0.0.0
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number
        'set-client-dirty-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-client-dirty-revision (states sid revision)
            let
                state $ option:unwrap $ get states sid
              assoc states sid $ struct-with state $ :dirty-rev revision
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Number 'app.server/ClientSyncState) 'Number 'Number
            :return $ :: 'Map 'Number 'app.server/ClientSyncState
          :tests $ [] $ %{} 'TestEntry (:name |preserves-other-client-state)
            :code $ quote $ let
                states $ {}
                  1 $ struct-with empty-sync-state (:status :active) (:dirty-rev 2)
                  2 $ struct-with empty-sync-state (:status :idle) (:dirty-rev 3)
                next $ set-client-dirty-revision states 1 7
              assert= 7 $ :dirty-rev $ match (calcit.core/get next 1)
                (:some value) value
                (:none) nil
              assert= :active $ :status $ match (calcit.core/get next 1)
                (:some value) value
                (:none) nil
              assert=
                match (calcit.core/get states 2)
                  (:some value) value
                  (:none) nil
                match (calcit.core/get next 2)
                  (:some value) value
                  (:none) nil
              assert= 2 $ :dirty-rev $ match (calcit.core/get states 1)
                (:some value) value
                (:none) nil
            :tags $ #{} :server
        'set-client-last-heartbeat $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-client-last-heartbeat (states sid timestamp)
            let
                state $ option:unwrap $ get states sid
              assoc states sid $ struct-with state $ :last-heartbeat timestamp
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Number 'app.server/ClientSyncState) 'Number 'Number
            :return $ :: 'Map 'Number 'app.server/ClientSyncState
          :tests $ [] $ %{} 'TestEntry (:name |preserves-other-client-state)
            :code $ quote $ let
                states $ {}
                  1 $ struct-with empty-sync-state (:status :active) (:last-heartbeat 2)
                  2 $ struct-with empty-sync-state (:status :idle) (:last-heartbeat 3)
                next $ set-client-last-heartbeat states 1 7
              assert= 7 $ :last-heartbeat $ match (calcit.core/get next 1)
                (:some value) value
                (:none) nil
              assert= :active $ :status $ match (calcit.core/get next 1)
                (:some value) value
                (:none) nil
              assert=
                match (calcit.core/get states 2)
                  (:some value) value
                  (:none) nil
                match (calcit.core/get next 2)
                  (:some value) value
                  (:none) nil
            :tags $ #{} :server
        'set-client-send-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-client-send-state (states sid revision new-store outcome)
            match (get states sid)
              (:some current)
                assoc states sid $ next-sync-send-state current revision new-store outcome
              (:none) states
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Number 'app.server/ClientSyncState) 'Number 'Number (:: 'Map 'Tag 'Dynamic) 'wss.core/WssSendOutcome
            :return $ :: 'Map 'Number 'app.server/ClientSyncState
          :tests $ []
            %{} 'TestEntry (:name |accepted-update-preserves-other-client)
              :code $ quote $ let
                  states $ {}
                    1 $ struct-with empty-sync-state $ :status :active
                    2 $ struct-with empty-sync-state $ :status :idle
                  next $ set-client-send-state states 1 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :accepted
                assert= 7 $ option:unwrap $ :sent-rev
                  match (calcit.core/get next 1)
                    (:some value) value
                    (:none) nil
                assert= true $ :in-flight? $ match (calcit.core/get next 1)
                  (:some value) value
                  (:none) nil
                assert=
                  match (calcit.core/get states 2)
                    (:some value) value
                    (:none) nil
                  match (calcit.core/get next 2)
                    (:some value) value
                    (:none) nil
                assert= false $ option:some? $ :sent-rev
                  match (calcit.core/get states 1)
                    (:some value) value
                    (:none) nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |missing-client-is-unchanged)
              :code $ quote $ let
                  states $ {} $ 1
                    struct-with empty-sync-state $ :status :active
                  next $ set-client-send-state states 3 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :accepted
                assert= states next
              :tags $ #{} :server
        'set-today! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-today! ()
            let
                today $ format-time (current-date!) (Option :some |%Y-%m-%d)
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
            if (empty? calcit-dirname) (:storage-file config/site)
              join-path calcit-dirname $ :storage-file config/site
          :examples $ []
          :schema $ :: 'String
        'sync-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sync-client! (sid reel revision) (swap! *dirty-clients exclude sid)
            let
                state $ option:unwrap $ get @*client-states sid
              when
                and
                  = :active $ :status state
                  not $ :in-flight? state
                let
                    db $ schema/database-to-map $ :db reel
                    records $ :records reel
                    session $ schema/read-path db $ [] :sessions sid
                    old-store-option $ get @*client-caches sid
                    new-store $ twig-container db session records
                    needs-snapshot? $ or (:needs-snapshot? state) (option:none? old-store-option)
                    diff-start $ now-ms
                    changes $ if needs-snapshot? ([])
                      diff-twig (option:unwrap old-store-option) new-store $ {} $ :key :id
                    diff-latency $ - (now-ms) diff-start
                    send-snapshot? $ or needs-snapshot? $ > (count changes) patch-operation-limit
                    base-revision $ :acked-rev state
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
            :args $ [] 'Number (:: 'cumulo-reel.core/ReelState 'app.schema/DatabaseRecord) 'Number
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
            :args $ [] $ :: 'cumulo-reel.core/ReelState 'app.schema/DatabaseRecord
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
                = :active $ :status state
                swap! *client-states set-client-last-heartbeat sid $ now-ms
                mark-client-active! sid client-revision true
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'Number
          :tests $ [] $ %{} 'TestEntry
            :name |active-heartbeat-returns-unit-and-preserves-peers
            :code $ quote $ let
                previous @*client-states
                active $ struct-with empty-sync-state (:status :active) (:last-heartbeat 0)
                other $ struct-with empty-sync-state $ :last-heartbeat 42
              reset! *client-states $ {} (7 active) (8 other)
              let
                  result $ touch-client! 7 0
                  updated @*client-states
                reset! *client-states previous
                assert= &unit result
                assert= other $ match (calcit.core/get updated 8)
                  (:some value) value
                  (:none) nil
                assert= :active $ :status $ match (calcit.core/get updated 7)
                  (:some value) value
                  (:none) nil
                assert |heartbeat-advanced $ >
                  :last-heartbeat $ match (calcit.core/get updated 7)
                    (:some value) value
                    (:none) nil
                  , 0
            :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.server
          :require (app.schema :as schema)
            app.updater :refer $ updater replay-updater
            cumulo-reel.core :refer $ reel-reducer refresh-reel ReelState
            app.config :as config
            app.twig.container :refer $ twig-container
            recollect.diff :refer $ diff-twig
            wss.core :refer $ WssSendOutcome wss-serve! wss-send!
            recollect.twig :refer $ clear-twig-caches!
            app.$meta :refer $ calcit-dirname
            calcit.std.fs :refer $ path-exists? check-write-file!
            calcit.std.time :refer $ set-interval! set-timeout!
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
                logged-in? $ match (calcit.core/get session-data :user-id)
                  (:some value) (non-nil? value)
                  (:none) false
                router $ match (calcit.core/get session-data :router)
                  (:some value) value
                  (:none) nil
                base-data $ {} (:logged-in? logged-in?) (:session session-data) (:router router)
                  :reel-length $ count records
                user $ schema/read-path db $ [] :users
                  match (calcit.core/get session-data :user-id)
                    (:some value) value
                    (:none) nil
              merge base-data $ decode-map-as
                if logged-in?
                  let
                      user $ decode-map-as user $ :: 'Map 'Tag 'Dynamic
                      router $ decode-map-as router 'Map
                    {}
                      :user $ twig-user user
                      :router $ assoc router :data $ match
                        match (calcit.core/get router :name)
                          (:some value) value
                          (:none) nil
                        :home $ {} $ :tasks
                          schema/read-path user $ [] :tasks :working
                        :history $ {}
                          :week $ match (calcit.core/get router :data)
                            (:some value) value
                            (:none) nil
                          :tasks $ twig-tasks-by-week
                            match (calcit.core/get router :data)
                              (:some value) (decode-map-as value 'app.schema/HistoryRoute)
                              (:none) (decode-map-as nil 'app.schema/HistoryRoute)
                            decode-map-as
                              schema/read-path user $ [] :tasks :finished
                              :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                        :notes $ twig-notes-by-month
                          match (calcit.core/get router :data)
                            (:some value) (decode-map-as value 'app.schema/NotesRoute)
                            (:none) (decode-map-as nil 'app.schema/NotesRoute)
                          decode-map-as
                            if
                              map? $ match (calcit.core/get user :notes)
                                (:some value) value
                                (:none) nil
                              match (calcit.core/get user :notes)
                                (:some value) value
                                (:none) nil
                              {}
                            :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                        :profile $ twig-members
                          match (calcit.core/get db :sessions)
                            (:some value)
                              decode-map-as value $ :: 'Map 'Dynamic $ :: 'Map 'Tag 'Dynamic
                            (:none)
                              decode-map-as nil $ :: 'Map 'Dynamic $ :: 'Map 'Tag 'Dynamic
                          match (calcit.core/get db :users)
                            (:some value)
                              decode-map-as value $ :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                            (:none)
                              decode-map-as nil $ :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                        _ $ {}
                      :count $ count $ match (calcit.core/get db :sessions)
                        (:some value) (decode-map-as value 'Map)
                        (:none) (decode-map-as nil 'Map)
                      :color $ rand-hex-color!
                      :today $ match (calcit.core/get db :today)
                        (:some value) value
                        (:none) nil
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
                assert= true $ map? result
                assert= schema/session $ match (calcit.core/get result :session)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |omits-private-fields-for-logged-in-user)
              :code $ quote $ let
                  user $ -> schema/user (assoc :id |u) (assoc :name |Alice) (assoc :password |secret)
                  db $ assoc-in schema/database ([] :users |u) user
                  session $ assoc schema/session :user-id |u
                  twig $ twig-container
                    decode-map-as db $ :: 'Map 'Tag 'Dynamic
                    , session $ []
                  visible-user $ match (calcit.core/get twig :user)
                    (:some value) value
                    (:none) nil
                assert= |Alice $ match (calcit.core/get visible-user :name)
                  (:some value) value
                  (:none) nil
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
            %{} 'TestEntry (:name |preserves-unknown-route-and-extra-fields)
              :code $ quote $ let
                  user $ assoc schema/user :id |u1
                  db $ assoc-in schema/database ([] :users |u1) user
                  route $ {} (:name :future-route) (:data |old-data) (|extension 42)
                  session $ assoc (assoc schema/session :user-id |u1) :router route
                  twig $ twig-container
                    decode-map-as db $ :: 'Map 'Tag 'Dynamic
                    , session $ []
                assert=
                  assoc route :data $ {}
                  match (calcit.core/get twig :router)
                    (:some value) value
                    (:none) nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |logged-out-router-is-not-consumed)
              :code $ quote $ let
                  session $ assoc schema/session :router |opaque-router
                  twig $ twig-container
                    decode-map-as schema/database $ :: 'Map 'Tag 'Dynamic
                    , session $ []
                assert= |opaque-router $ match (calcit.core/get twig :router)
                  (:some value) value
                  (:none) nil
                assert= session $ match (calcit.core/get twig :session)
                  (:some value) value
                  (:none) nil
                assert= false $ match (calcit.core/get twig :logged-in?)
                  (:some value) value
                  (:none) nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-non-map-router-when-logged-in)
              :code $ quote $ let
                  db $ assoc-in schema/database ([] :users |u1) (assoc schema/user :id |u1)
                  session $ assoc (assoc schema/session :user-id |u1) :router |invalid-router
                  failed? $ try
                    do
                      twig-container
                        decode-map-as db $ :: 'Map 'Tag 'Dynamic
                        , session $ []
                      , false
                    fn (message) true
                assert= true failed?
              :tags $ #{} :server
            %{} 'TestEntry (:name |profile-preserves-mixed-session-keys)
              :code $ quote $ let
                  user $ assoc (assoc schema/user :id |u1) :name |Alice
                  sessions $ {}
                    7 $ {} $ :user-id |u1
                    :guest $ {} $ :user-id nil
                    |legacy $ {} $ :user-id |u1
                  db $ assoc
                    assoc-in schema/database ([] :users |u1) user
                    , :sessions sessions
                  session $ assoc (assoc schema/session :user-id |u1) :router $ {} (:name :profile) (:data nil)
                  twig $ twig-container
                    decode-map-as db $ :: 'Map 'Tag 'Dynamic
                    , session $ []
                assert=
                  {} (7 |Alice) (:guest "|访客") (|legacy |Alice)
                  schema/read-path twig $ [] :router :data
              :tags $ #{} :server
            %{} 'TestEntry (:name |profile-rejects-non-map-session)
              :code $ quote $ let
                  user $ assoc schema/user :id |u1
                  db $ assoc
                    assoc-in schema/database ([] :users |u1) user
                    , :sessions $ {} (7 42)
                  session $ assoc (assoc schema/session :user-id |u1) :router $ {} (:name :profile) (:data nil)
                  failed? $ try
                    do
                      twig-container
                        decode-map-as db $ :: 'Map 'Tag 'Dynamic
                        , session $ []
                      , false
                    fn (message) true
                assert= true failed?
              :tags $ #{} :server
        'twig-members $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-members (sessions users)
            -> sessions $ filter-map-kv $ fn (k session)
              let
                  username $ match (.get session :user-id)
                    (:some user-id)
                      if (string? user-id)
                        match (.get users user-id)
                          (:some user)
                            match (.get user :name)
                              (:some value)
                                if (nil? value) "|访客" $ decode-map-as value 'String
                              (:none) "|访客"
                          (:none) "|访客"
                        , "|访客"
                    (:none) "|访客"
                MapEntryDecision :keep k username
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'Map 'K $ :: 'Map 'Tag 'S
              :: 'Map 'String $ :: 'Map 'Tag 'U
            :generics $ [] 'K 'S 'U
            :return $ :: 'Map 'K 'String
          :tests $ []
            %{} 'TestEntry (:name |keeps-guests-and-original-session-keys)
              :code $ quote $ let
                  users $ {}
                    |alice $ {} $ :name |Alice
                    |empty $ {} $ :name |
                  numeric-sessions $ decode-map-as
                    {}
                      7 $ {} $ :user-id |alice
                      8 $ {} $ :user-id nil
                      9 $ {} $ :user-id |missing
                      10 $ {} $ :user-id |empty
                    :: 'Map 'Number $ :: 'Map 'Tag 'Dynamic
                  string-sessions $ {} $ |guest
                    {} $ :user-id nil
                assert=
                  {} (7 |Alice) (8 "|访客") (9 "|访客") (10 |)
                  twig-members numeric-sessions users
                assert=
                  {} $ |guest "|访客"
                  twig-members string-sessions users
            %{} 'TestEntry (:name |rejects-non-string-member-names)
              :code $ quote $ assert= true
                try
                  do
                    twig-members
                      {} $ 7 $ {} (:user-id |alice)
                      {} $ |alice $ {} (:name 42)
                    , false
                  fn (message) true
            %{} 'TestEntry (:name |preserves-guest-and-string-user-key-boundaries)
              :code $ quote $ let
                  users $ decode-map-as
                    {}
                      |alice $ {} $ :name |Alice
                      |empty $ {} $ :name |
                      | $ {} $ :name |Empty-id
                      |nil-name $ {} $ :name nil
                      |missing-name $ {}
                    :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                  sessions $ decode-map-as
                    {}
                      1 $ {}
                      2 $ {} $ :user-id nil
                      3 $ {} $ :user-id false
                      4 $ {} $ :user-id 0
                      5 $ {} $ :user-id |
                      6 $ {} $ :user-id |alice
                      7 $ {} $ :user-id |empty
                      8 $ {} $ :user-id |nil-name
                      9 $ {} $ :user-id |missing-name
                      10 $ {} $ :user-id |unknown
                      11 $ {} $ :user-id true
                      12 $ {} $ :user-id :alice
                    :: 'Map 'Number $ :: 'Map 'Tag 'Dynamic
                assert=
                  {} (1 "|访客") (2 "|访客") (3 "|访客") (4 "|访客") (5 |Empty-id) (6 |Alice) (7 |) (8 "|访客") (9 "|访客") (10 "|访客") (11 "|访客") (12 "|访客")
                  twig-members sessions users
                assert=
                  {} $ |session |Alice
                  twig-members
                    {} $ |session $ {} (:user-id |alice)
                    , users
              :tags $ #{} :member-key-contract :server
            %{} 'TestEntry (:name |preserves-invalid-name-decoder-errors)
              :code $ quote $ let
                  check-name! $ fn (value)
                    hint-fn $ {}
                      :args $ [] 'Dynamic
                      :return 'Unit
                    assert=
                      try (decode-map-as value 'String)
                        fn (message) message
                      try
                        twig-members
                          {} $ 7 $ {} (:user-id |alice)
                          decode-map-as
                            {} $ |alice $ {} (:name value)
                            :: 'Map 'String $ :: 'Map 'Tag 'Dynamic
                        fn (message) message
                    , &unit
                check-name! false
                check-name! true
                check-name! 0
                check-name! :invalid
                check-name! $ []
                check-name! $ {}
              :tags $ #{} :member-key-contract :server
        'twig-notes-by-month $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-notes-by-month (data notes)
            let
                year $ :year data
                month $ inc $ :month data
              -> notes (identity)
                &map:filter-kv $ fn (k task)
                  let
                      fields $ decode-map-as task $ :: 'Map 'Tag 'Dynamic
                      time $ extract-time $ Date0 :date
                        match (calcit.core/get fields :time)
                          (:some value) (decode-map-as value 'Number)
                          (:none) (decode-map-as nil 'Number)
                    and
                      match (calcit.core/get time :year)
                        (:some value) (= year value)
                        (:none) false
                      match (calcit.core/get time :month)
                        (:some value) (= month value)
                        (:none) false
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/NotesRoute $ :: 'Map 'K 'N
            :generics $ [] 'K 'N
            :return $ :: 'Map 'K 'N
          :tests $ [] $ %{} 'TestEntry (:name |filters-persisted-note-by-month)
            :code $ quote $ let
                stamp $ get-timestamp $ from-ymd 2026 9 25
                result $ twig-notes-by-month (schema/NotesRoute :year 2026 :month 8)
                  {} $ |n1 $ {} (:time stamp) (:text |test)
              assert= 1 $ count result
            :tags $ #{} :server
        'twig-tasks-by-week $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-tasks-by-week (data tasks)
            let
                start-time $ parse-date (:start data) "|%Y-%m-%dT%H:%M:%S %z"
                end-time $ parse-date (:end data) "|%Y-%m-%dT%H:%M:%S %z"
              -> tasks (identity)
                &map:filter-kv $ fn (k task)
                  let
                      fields $ decode-map-as task $ :: 'Map 'Tag 'Dynamic
                      t $ match (calcit.core/get fields :finished-time)
                        (:some value) (decode-map-as value 'Number)
                        (:none) (decode-map-as nil 'Number)
                    and
                      &> t $ get-timestamp start-time
                      &< t $ get-timestamp end-time
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'app.schema/HistoryRoute $ :: 'Map 'K 'T
            :generics $ [] 'K 'T
            :return $ :: 'Map 'K 'T
          :tests $ [] $ %{} 'TestEntry (:name |preserves-exclusive-range-and-task-data)
            :code $ quote $ let
                route $ schema/HistoryRoute :year 2026 :week 40 :start "|2026-09-21T00:00:00 +0000" :end "|2026-09-28T00:00:00 +0000"
                start $ get-timestamp $ parse-date (:start route) "|%Y-%m-%dT%H:%M:%S %z"
                end $ get-timestamp $ parse-date (:end route) "|%Y-%m-%dT%H:%M:%S %z"
                task $ {}
                  :finished-time $ + start 1
                  :text |kept
                  :extra |preserved
                tasks $ {}
                  |start $ {} (:finished-time start) (:text |start)
                  |middle task
                  |end $ {} (:finished-time end) (:text |end)
              assert=
                {} $ |middle task
                twig-tasks-by-week route tasks
            :tags $ #{} :server
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
      :defs $ {}
        'replay-updater $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn replay-updater (db op sid op-id op-time)
            updater db (decode-map-as op 'app.schema/Op) (decode-map-as sid 'Number) (decode-map-as op-id 'String) (decode-map-as op-time 'Number)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.schema/DatabaseRecord)
            :args $ [] 'app.schema/DatabaseRecord 'Dynamic 'Dynamic 'Dynamic 'Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |replay-today)
            :code $ quote $ let
                op $ schema/Op :today |2026-10-12
              assert= (updater schema/empty-database op 1 |op-1 1) (replay-updater schema/empty-database op 1 |op-1 1)
            :tags $ #{} :unit
        'updater $ %{} 'CodeEntry (:doc |)
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
                  task $ schema/TaskRecord :id op-id :text op-data :detail | :pending? false :created-time $ Option :some op-time
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
                        :finished-time $ Option :some op-time
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
                        :touched-time $ Option :some op-time
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
                        :touched-time $ Option :some op-time
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
                    -> (:users db) (.distinct-values) (.to-list)
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
                      match (:password user-record)
                        (:some digest)
                          = digest $ md5 password
                        (:none) false
                      schema/update-session db sid $ fn (session-record)
                        hint-fn $ {}
                          :args $ [] 'app.schema/SessionRecord
                          :return 'app.schema/SessionRecord
                        struct-with session-record $ :user-id $ Option :some (:id user-record)
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
              struct-with session-record $ :user-id $ Option :none
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
                    -> (:users db) (.distinct-values) (.to-list)
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
                        user-record $ schema/UserRecord :id op-id :name username :nickname (Option :some username) :avatar (Option :none) :password
                          Option :some $ md5 password
                          , :tasks
                            schema/UserTasks :working ({}) :pending ({}) :finished $ {}
                            , :notes $ {}
                        with-user $ struct-with db $ :users
                          assoc (:users db) op-id user-record
                      schema/update-session with-user sid $ fn (session-record)
                        hint-fn $ {}
                          :args $ [] 'app.schema/SessionRecord
                          :return 'app.schema/SessionRecord
                        struct-with session-record $ :user-id $ Option :some op-id
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
