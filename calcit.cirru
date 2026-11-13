
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {}
    :default $ {} (:description "||Browser client bundle") (:init-fn 'app.client/main!) (:mode :js) (:reload-fn 'app.client/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |recollect/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo.calcit/ |js-ffi/
      :type-slots $ {} $ :dispatch-op 'app.schema/Op
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
          :schema $ quote $ Ref Bool
        '*states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *states
            {} $ :states $ {}
              :cursor $ []
          :examples $ []
          :schema $ quote $ Ref (Map Tag Dynamic)
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store (OfflineProjection :initial)
          :examples $ []
          :schema $ quote $ Ref ClientProjection
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-revision 0
          :examples $ []
          :schema $ quote $ Ref Number
        '*ws-client $ %{} 'CodeEntry
          :doc "|Current nominal ws-edn client retained across browser recovery events."
          :code $ quote $ defref *ws-client None
          :examples $ []
          :schema $ quote $ Ref (Option ws-edn.client/WsClient)
        'ClientPatchError $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum ClientPatchError (:revision-mismatch Number Number) (:invalid-patch recollect.patch/PatchError) (:invalid-projection String)
          :examples $ []
          :schema $ quote EnumDef
        'ClientProjection $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defunion ClientProjection OfflineProjection ReadyProjection
          :examples $ []
          :schema $ quote UnionDef
        'ConnectionRecoveryAction $ %{} 'CodeEntry (:doc "|Deterministic browser recovery choice.")
          :code $ quote $ defenum ConnectionRecoveryAction (:none) (:reconnect) (:connect)
          :examples $ []
          :schema $ quote EnumDef
        'DayjsFactoryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DayjsFactoryHost
            .extend! $ Fn app.client/DayjsFactoryHost JsObject $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :names $ {} $ :extend! |extend
          :schema $ quote Trait
        'NavigatorConnectionHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait NavigatorConnectionHost (:onLine 'Bool)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'OfflineProjection $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum OfflineProjection (:initial) (:offline)
          :examples $ []
          :schema $ quote EnumDef
        'ParsedUrlHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ParsedUrlHost (:query 'app.client/ParsedUrlQueryHost)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'ParsedUrlQueryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ParsedUrlQueryHost
            :host $ JsNullish String
            :port $ JsNullish String
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'ReadyProjection $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct ReadyProjection
            :store $ Map Tag Dynamic
          :examples $ []
          :schema $ quote StructDef
        'ack-sync! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ack-sync! (revision)
            ws-send! $ schema/ClientMessage :sync/ack revision
          :examples $ []
          :schema $ quote $ Fn Number (-> Unit)
        'apply-server-patch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn apply-server-patch! (base-revision revision changes)
            match @*store
              (OfflineProjection _) (request-snapshot!)
              (ReadyProjection ready)
                match
                  validate-server-patch (:store ready) @*sync-revision base-revision changes
                  (:ok decoded-store)
                    do
                      reset! *store $ ReadyProjection :store decoded-store
                      reset! *sync-revision revision
                      ack-sync! revision
                  (:err error)
                    do
                      match error
                        (:revision-mismatch expected actual)
                          console-warn! $ str |Sync-revision-mismatch-expected= expected |,-actual= actual
                        (:invalid-patch patch-error)
                          console-error! $ str |Failed-to-apply-server-patch:_ $ patch-error-message patch-error
                        (:invalid-projection reason)
                          console-error! $ str "|Invalid patched projection: " reason
                      request-snapshot!
          :examples $ []
          :schema $ quote $ Fn Number Number (List recollect.schema/change-op) (-> Unit) (:features :state)
        'choose-recovery-action $ %{} 'CodeEntry
          :doc "|Choose whether a visible online page should reconnect or create a client."
          :code $ quote $ defn choose-recovery-action (connected? has-client? visible? online?)
            if (and visible? online?)
              if connected? (ConnectionRecoveryAction :none)
                if has-client? (ConnectionRecoveryAction :reconnect) (ConnectionRecoveryAction :connect)
              ConnectionRecoveryAction :none
          :examples $ []
          :schema $ quote $ Fn Bool Bool Bool Bool (-> ConnectionRecoveryAction)
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
                host $ if (js-present? host-value) (unsafe-coerce host-value String) (unsafe-coerce js/location.hostname String)
                port $ if (js-present? port-value) (unsafe-coerce port-value String)
                  str $ :port config/site
                ws-url $ if config/dev? (str |ws:// host |: port) |wss://timegrass.topix.im/ws
              js/console.info |[connection] |opening ws-url
              reset! *store $ OfflineProjection :initial
              reset! *ws-client $ Some $ ws-connect! ws-url
                {}
                  :on-open $ fn (event) (js/console.info |[connection] |open ws-url) (reset! *connected? true) (request-snapshot!) (send-activity!) (simulate-login!)
                  :on-close $ fn (event) (reset! *connected? false)
                    reset! *store $ OfflineProjection :offline
                    js/console.error |[connection] |closed ws-url
                  :on-data on-server-data
                  :heartbeat-timeout-ms 75000
                  :class-mapper $ {} (:ServerMessage schema/ServerMessage) (:change-op patch-schema/change-op)
              , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            match op
              (:states ignored-cursor ignored-state) &unit
              _ $ js-ffi.shared/console-info! $ str-spaced |[operation] |sending
                str $ &enum:nth op 0
            match op
              (:states cursor s)
                reset! *states $ decode-map-as (update-states @*states cursor s) (Map Tag Dynamic)
              (:effect/connect) (connect!)
              _ $ ws-send! $ schema/ClientMessage :dispatch op
            , &unit
          :examples $ []
          :schema $ quote $ Fn schema/Op (-> Unit) (:features :io :state)
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
                  returned $ dispatch! $ schema/Op :states
                    decode-map-as cursor $ List app.schema/StateKey
                    , state
                  updated @*states
                reset! *states saved
                assert= &unit returned
                assert= (Result :ok |unchanged)
                  get-in updated $ [] :other
                assert= (Result :ok |untouched)
                  get-in updated $ [] :states :peer :data
                assert= (Result :ok state)
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
          :schema $ quote $ Fn Input (-> Unit) (:generics Input) (:features :io :js-ffi :state)
          :tests $ []
            %{} 'TestEntry
              :name |rejects-invalid-render-operation-without-state-change
              :code $ quote $ let
                  saved @*states
                  rejected $ try
                    do (dispatch-render-operation! nil) false
                    fn (message) (starts-with? message "|Expected application operation enum")
                assert= true rejected
                assert= true $ try
                  do
                    dispatch-render-operation! $ :: :states ([] :panel true)
                      {} $ :text |Invalid
                    , false
                  fn (message) (starts-with? message "|Invalid states cursor:")
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
                    returned $ dispatch-render-operation! $ schema/Op :states
                      decode-map-as cursor $ List app.schema/StateKey
                      , state
                    updated @*states
                  reset! *states saved
                  assert= &unit returned
                  assert= (Result :ok |unchanged)
                    get-in updated $ [] :other
                  assert= (Result :ok |untouched)
                    get-in updated $ [] :states :peer :data
                  assert= (Result :ok state)
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
                    returned $ dispatch-render-operation! $ :: :states cursor state
                    updated @*states
                  reset! *states saved
                  assert= &unit returned
                  assert= (Result :ok |unchanged)
                    get-in updated $ [] :other
                  assert= (Result :ok |untouched)
                    get-in updated $ [] :states :peer :data
                  assert= (Result :ok state)
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
              match @*store
                (OfflineProjection offline)
                  when
                    = offline $ OfflineProjection :offline
                    recover-connection!
                (ReadyProjection _) &unit
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
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mount-target
            (query-selector |.app) .unwrap
          :examples $ []
          :schema $ quote respo.dom/DomElement
        'on-server-data $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-server-data (data)
            match (schema/decode-server-message data)
              (:ok message)
                match message
                  (:snapshot revision store)
                    do
                      reset! *store $ ReadyProjection :store store
                      reset! *sync-revision revision
                      ack-sync! revision
                  (:patch base-revision revision changes) (apply-server-patch! base-revision revision changes)
                  (:effect/pong) &unit
              (:err error)
                js-ffi.shared/console-error! $ str-spaced "|Invalid server message:" error
          :examples $ []
          :schema $ quote $ Fn Input (-> Unit) (:generics Input) (:features :state)
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
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (non-nil? client-errors)
              hud! |error $ str client-errors
              do (hud! |inactive nil) (remove-watch! *store :changes) (remove-watch! *states :changes) (clear-cache!) (render-app!) (add-watch! *store :changes render-on-state-change!) (add-watch! *states :changes render-on-state-change!) (ws-set-on-data! on-server-data) (println "|Code updated.")
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'render-app! $ %{} 'CodeEntry
          :doc "|Render the selected root-state value directly at the component boundary. A missing state still reaches the existing nil/offline behavior; do not eagerly unwrap or decode before comp-container chooses its branch."
          :code $ quote $ defn render-app! ()
            render! mount-target
              match @*store
                (OfflineProjection offline)
                  match offline
                    (:initial) (app.comp.container/comp-offline :initial)
                    (:offline) (app.comp.container/comp-offline :offline)
                (ReadyProjection ready)
                  match (get @*states :states)
                    (:some value)
                      comp-container value $ :store ready
                    (:none)
                      comp-container nil $ :store ready
              fn (op)
                hint-fn $ Fn schema/Op $ -> Unit
                dispatch-render-operation! op
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :state)
        'render-on-state-change! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-on-state-change! (value previous) (render-app!)
          :examples $ []
          :schema $ quote $ Fn T T (-> Unit) (:generics T) (:features :io :js-ffi :state)
        'request-snapshot! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-snapshot! ()
            ws-send! $ schema/ClientMessage :sync/resume @*sync-revision
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :state)
        'send-activity! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn send-activity! ()
            if (activity/page-visible?)
              ws-send! $ schema/ClientMessage :sync/active @*sync-revision
              ws-send! $ schema/ClientMessage :sync/idle @*sync-revision
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :state)
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
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
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
                (:ok next-store)
                  match
                    try-decode-map-as next-store $ Map Tag Dynamic
                    (:ok decoded-store) (Result :ok decoded-store)
                    (:err reason)
                      Result :err $ ClientPatchError :invalid-projection reason
                (:err error)
                  Result :err $ ClientPatchError :invalid-patch error
              Result :err $ ClientPatchError :revision-mismatch base-revision local-revision
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) Number Number (List recollect.schema/change-op)
            -> $ Result (Map Tag Dynamic) ClientPatchError
          :tests $ []
            %{} 'TestEntry (:name |accepts-valid-revisioned-patch)
              :code $ quote $ let
                  store $ {} $ :value 1
                  changes $ [] $ %:: patch-schema/change-op :assoc :value 2
                assert=
                  Result :ok $ {} $ :value 2
                  validate-server-patch store 7 7 changes
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patched-projection)
              :code $ quote $ let
                  store $ {} $ :value 1
                  changes $ [] $ %:: patch-schema/change-op :replace 42
                match (validate-server-patch store 7 7 changes)
                  (:err error)
                    match error
                      (:invalid-projection _) &unit
                      _ $ raise |Expected-invalid-projection
                  (:ok _) (raise |Expected-invalid-projection)
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-revision-mismatch)
              :code $ quote $ let
                  store $ {} $ :value 1
                  changes $ [] $ %:: patch-schema/change-op :assoc :value 2
                assert=
                  Result :err $ ClientPatchError :revision-mismatch 8 7
                  validate-server-patch store 7 8 changes
              :tags $ #{} :client
            %{} 'TestEntry (:name |rejects-invalid-patch-atomically)
              :code $ quote $ let
                  store $ {} $ :stable 1
                  changes $ [] (%:: patch-schema/change-op :assoc :temporary 2)
                    %:: patch-schema/change-op :update :missing $ %:: patch-schema/change-op :replace 3
                  expected $ Result :err $ ClientPatchError :invalid-patch
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
                  hint-fn $ Fn $ -> respo.schema/Element
                  let
                      states $ decode-map-as states 'Map
                      store $ decode-map-as store 'Map
                      session $ match (calcit.core/get store :session)
                        (:some value) (decode-map-as value 'Map)
                        (:none)
                          raise "|decode-map-as failed at $.session: missing required Map"
                      router $ let
                          read-session-router $ fn ()
                            hint-fn $ Fn $ -> Map
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
                      count-members $ decode-map-as (get store :count) (Option Number)
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
                              .unwrap-or
                                get-in router $ [] :data :tasks
                                {}
                              Map String $ Map Tag Dynamic
                          :history $ comp-history (>> states :history)
                            decode-map-as
                              .unwrap-or
                                get-in router $ [] :data :week
                                {}
                              Map Tag Dynamic
                            decode-map-as
                              .unwrap-or
                                get-in router $ [] :data :tasks
                                {}
                              Map String $ Map Tag Dynamic
                          :notes $ comp-notes-page (>> states :notes)
                            match (calcit.core/get router :data)
                              (:some value)
                                decode-map-as value $ Map String $ Map Tag Dynamic
                              (:none)
                                decode-map-as nil $ Map String $ Map Tag Dynamic
                            decode-map-as
                              .unwrap-or
                                get-in session $ [] :router :data
                                {}
                              Map Tag Number
                          :profile $ comp-profile
                            match (calcit.core/get store :user)
                              (:some value)
                                decode-map-as value $ Map Tag Dynamic
                              (:none)
                                decode-map-as nil $ Map Tag Dynamic
                            match (calcit.core/get router :data)
                              (:some value)
                                decode-map-as value $ Map Number String
                              (:none)
                                decode-map-as nil $ Map Number String
                          _ $ <> $ str "|404 page:" router
                        comp-login $ >> states :login
                      comp-status-color $ decode-map-as (get store :color) (Option String)
                      if dev?
                        Some $ comp-inspect |Store store $ {} (:bottom 0) (:left 0) (:z-index 9999)
                        , None
                      comp-messages
                        match (calcit.core/get session :messages)
                          (:some value)
                            decode-map-as value $ Map String Dynamic
                          (:none)
                            decode-map-as nil $ Map String Dynamic
                        {}
                        fn (info d!)
                          match
                            schema/decode-operation $ :: :session/remove-message info
                            (:ok op) (d! op)
                            (:err _) &unit
                      if dev?
                        Some $ comp-reel
                          match (calcit.core/get store :reel-length)
                            (:some value) (decode-map-as value 'Number)
                            (:none) (decode-map-as nil 'Number)
                          {}
                        , None
              if (enum? store)
                match store
                  (:initial) (comp-offline :initial)
                  (:offline) (comp-offline :offline)
                  _ $ render-loaded
                render-loaded
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> respo.schema/Component)
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
                assert= (Some |preserved) (get states |extra)
                assert= (Some 7) (get route :data)
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
                assert= (Some false) (get store :logged-in?)
                assert= None $ get store :count
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
                    decode-map-as (Some |bad-count) (Option Number)
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
          :schema $ quote $ Fn Tag (-> respo.schema/Component)
        'comp-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-status-color (color)
            div $ {} (:class-name css-status-color)
              :style $ match color
                (:some value)
                  {} $ :background-color value
                (:none) ({})
          :examples $ []
          :schema $ quote $ Fn (Option String) (-> respo.schema/Component)
        'css-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-container
            {} $ |$0 $ merge ui/global ui/fullscreen ui/column
          :examples $ []
          :schema $ quote String
        'css-offline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-offline
            {} $ |$0 offline-style
          :examples $ []
          :schema $ quote String
        'css-status-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-status-color
            {}
              |$0 $ {} (:width 16) (:height 16) (:position :absolute) (:bottom 16) (:right 8) (:border-radius |8px) (:opacity 0.8) (:transition-duration |200ms) (:opacity 0.5)
              |$0:hover $ {} $ :opacity 0.7
          :examples $ []
          :schema $ quote String
        'offline-style $ %{} 'CodeEntry
          :doc "|Composes the heterogeneous offline page style before defstyle expansion."
          :code $ quote $ def offline-style
            merge-styles ui/global ui/fullscreen ui/column-dispersive $ {} $ :background-color (:theme config/site)
          :examples $ []
          :schema $ quote $ Map Tag respo-ui.schema/StyleValue
        'style-body $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-body
            {} $ :padding "|8px 16px"
          :examples $ []
          :schema $ quote $ Map Tag String
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
                  (:ok value) (decode-map-as value 'List)
                  (:err _e) (decode-map-as nil 'List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:ok value)
                      or value $ {} $ :show-menu? false
                    (:err _e)
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
                        (:some value) (if value true false)
                        (:none) false
                      {} $ :background-color $ hsl 0 0 94
                      {}
                  :on-click $ fn (e d!)
                    d! $ :: :states cursor $ assoc state :show-menu? true
                <> (format-timestamp finished-time |HH:mm)
                  {} (:min-width 32)
                    :color $ hsl 0 0 80
                    :font-size 12
                    :display :inline-block
                respo.comp.space/space-x 4
                span
                  {} $ :style $ merge-styles ui/flex
                    {} $ :line-height |24px
                  <> $ :text task
                comp-modal-menu
                  {} (:title |Operations)
                    :style $ {} $ :width 320
                    :items $ [] $ :: :item :put-back "|Put back"
                  decode-map-as
                    .unwrap-or (get state :show-menu?) false
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
          :schema $ quote $ Fn (Map StateKey Dynamic) schema/FinishedTaskView (-> respo.schema/Component) (:generics StateKey)
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
                  .unwrap $ &map:get tag-branch :cursor
                assert= ([] :root |task-1)
                  .unwrap $ &map:get string-branch :cursor
                assert= ([] :root 7)
                  .unwrap $ &map:get number-branch :cursor
                assert= ([] :root)
                  .unwrap $ calcit.core/get root :cursor
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
                    hint-fn $ Fn schema/Op $ -> Unit
                    match op
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-menu? true) payload
                      _ $ raise |Expected-state-operation
                    swap! calls inc
                    , &unit
                click
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , dispatch!
                assert= 1 @calls
                assert= false $ .unwrap $ calcit.core/get state :show-menu?
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
                    hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
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
                    hint-fn $ Fn schema/Op $ -> Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-menu? false) payload
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , dispatch!
                assert= 1 @calls
                assert= true $ .unwrap $ calcit.core/get state :show-menu?
              :tags $ #{} :js :menu-contract
            %{} 'TestEntry (:name |selection-dispatches-action-and-closes)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:show-menu? true) (|extra |preserved)
                  states $ {} (:cursor cursor) (:data state)
                  element $ fn (node)
                    hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
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
                    hint-fn $ Fn schema/Op $ -> Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-menu? false) payload
                      (:task/put-back id) (assert= |task-1 id)
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , dispatch!
                assert= 2 @calls
                assert= true $ .unwrap $ calcit.core/get state :show-menu?
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
                          d! $ schema/route-operation $ let
                              change-year? $ <= week 1
                              y $ if change-year? (dec year) year
                              w $ if change-year? 53 $ dec week
                              bounds $ week-bounds y w
                            schema/Route :history $ schema/HistoryRoute :year y :week w :start (:start bounds) :end $ :end bounds
                      respo.comp.space/space-x 8
                      comp-icon :arrow-right
                        {} (:font-size 16)
                          :color $ hsl 200 80 80
                          :cursor :pointer
                        fn (e d!)
                          d! $ schema/route-operation $ let
                              change-year? $ >= week 53
                              y $ if change-year? (inc year) year
                              w $ if change-year? 1 $ inc week
                              bounds $ week-bounds y w
                            schema/Route :history $ schema/HistoryRoute :year y :week w :start (:start bounds) :end $ :end bounds
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
                              .unwrap-or (first y) |
                              .unwrap-or (first x) |
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
                                      respo.comp.space/space-x 12
                                      <> $ :month-day labels
                                respo.comp.space/space-y 4
                                list-> ({})
                                  -> task-list (sort-finished-tasks)
                                    map $ fn (task)
                                      [] (:id task)
                                        comp-done-task
                                          >> states $ :id task
                                          , task
          :examples $ []
          :schema $ quote $ Fn (Map StateKey Dynamic) (Map Tag Dynamic)
            Map String $ Map Tag Dynamic
            -> respo.schema/Component
            :generics StateKey
          :tests $ []
            %{} 'TestEntry (:name |route-preserves-zero-and-extra-fields)
              :code $ quote $ let
                  data $ {} (:year 2026) (:week 0) (:extra 7)
                  component $ comp-history
                    {} $ :cursor $ [] :history |panel 7
                    , data $ {}
                assert= :comp-history $ :name component
                assert= (Some 0) (get data :week)
                assert= (Some 7) (get data :extra)
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
                    hint-fn $ Fn (Map Tag Dynamic) (-> Bool)
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
                hsl 0 0 80 $ Some 0.2
          :examples $ []
          :schema $ quote String
        'history-task-groups $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn history-task-groups (finished-tasks)
            -> finished-tasks (&map:vals)
              map $ fn (raw)
                match (schema/decode-finished-task-view raw)
                  (:ok task) task
                  (:err message) (raise message)
              group-by $ fn (task)
                hint-fn $ Fn schema/FinishedTaskView $ -> String
                format-timestamp (:finished-time task) |YYYY-MM-DD
          :examples $ []
          :schema $ quote $ Fn
            Map String $ Map Tag V
            -> $ Map String $ List schema/FinishedTaskView
            :generics V
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
              hint-fn $ Fn schema/FinishedTaskView $ -> Number
              negate $ :finished-time task
          :examples $ []
          :schema $ quote $ Fn (List schema/FinishedTaskView)
            -> $ List schema/FinishedTaskView
          :tests $ [] $ %{} 'TestEntry (:name |orders-newest-first)
            :code $ quote $ let
                earlier $ schema/FinishedTaskView :id |earlier :text |Earlier :finished-time 100
                later $ schema/FinishedTaskView :id |later :text |Later :finished-time 200
                empty-tasks $ slice ([] earlier later) 0 $ Some 0
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
                  (:ok raw-cursor)
                    if (list? raw-cursor) raw-cursor $ raise |Expected-state-cursor-List
                  (:err _e) (raise |Expected-state-cursor-List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:ok value) (or value initial-state)
                    (:err _e) initial-state
                  Map Tag String
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
                          hint-fn $ Fn respo.schema/RespoEvent
                            Fn schema/Op $ -> Unit
                            -> Unit
                          d! $ :: :states cursor $ assoc state :username
                            str $ :value e
                    respo.comp.space/space-y 8
                    div ({})
                      input $ {} (:placeholder |Password)
                        :value $ :password credentials
                        :style ui/input
                        :on-input $ fn (e d!)
                          hint-fn $ Fn respo.schema/RespoEvent
                            Fn schema/Op $ -> Unit
                            -> Unit
                          d! $ :: :states cursor $ assoc state :password
                            str $ :value e
                  respo.comp.space/space-y 8
                  div
                    {} $ :style $ {} (:text-align :right)
                    span $ {} (:inner-text "|Sign up")
                      :style $ merge style/link
                      :on-click $ on-submit (:username credentials) (:password credentials) true
                    respo.comp.space/space-x 8
                    span $ {} (:inner-text "|Log in")
                      :style $ merge style/link
                      :on-click $ on-submit (:username credentials) (:password credentials) false
          :examples $ []
          :schema $ quote $ Fn (Map StateKey Dynamic) (-> respo.schema/Component) (:generics StateKey)
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
                assert= (Some |preserved) (get state :extra)
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
                    hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-login-element)
                  child $ fn (parent index)
                    hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
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
                    hint-fn $ Fn respo.schema/Element respo.schema/RespoEvent Tag String $ -> Unit
                    let
                        handler $ .unwrap $ js-nullish->option
                          .unwrap $ .get (:event input) :input
                        calls $ ref 0
                        dispatch! $ fn (operation)
                          hint-fn $ Fn schema/Op $ -> Unit
                          match operation
                            (:states path payload)
                              do (assert= cursor path)
                                assert= (assoc state field expected) payload
                            _ $ raise |Expected-login-state-operation
                          swap! calls inc
                          , &unit
                      handler event dispatch!
                      assert= 1 @calls
                check-input! username
                  (fn () (hint-fn (Fn (-> respo.schema/RespoEvent) (:features :js-ffi))) (respo.util.format/event->edn (js-cast (new js/Event |click) 'respo.dom/DomEvent)))
                  , :username $ str nil
                check-input! username
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value nil
                  , :username $ str nil
                check-input! username
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value false
                  , :username $ str false
                check-input! username
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value 0
                  , :username $ str 0
                check-input! username
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value |
                  , :username $ str |
                check-input! username
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value |changed
                  , :username $ str |changed
                check-input! password
                  (fn () (hint-fn (Fn (-> respo.schema/RespoEvent) (:features :js-ffi))) (respo.util.format/event->edn (js-cast (new js/Event |click) 'respo.dom/DomEvent)))
                  , :password $ str nil
                check-input! password
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value nil
                  , :password $ str nil
                check-input! password
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value false
                  , :password $ str false
                check-input! password
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value 0
                  , :password $ str 0
                check-input! password
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value |
                  , :password $ str |
                check-input! password
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :value |changed
                  , :password $ str |changed
                assert= |existing-user $ .unwrap $ get state :username
                assert= |existing-password $ .unwrap $ get state :password
              :tags $ #{} :js :login-value-contract
        'initial-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def initial-state
            {} (:username |) (:password |)
          :examples $ []
          :schema $ quote $ Map Tag String
        'on-submit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-submit (username password signup?)
            fn (_event dispatch!)
              hint-fn $ Fn respo.schema/RespoEvent
                Fn schema/Op $ -> Unit
                -> Unit
              dispatch! $ if signup?
                schema/Op :user/sign-up $ [] username password
                schema/Op :user/log-in $ [] username password
              storage-set! (:storage-key config/site)
                format-cirru-edn $ [] username password
          :examples $ []
          :schema $ quote $ Fn String String Bool
            -> $ Fn respo.schema/RespoEvent
              Fn schema/Op $ -> Unit
              -> Unit
          :tests $ []
            %{} 'TestEntry (:name |login-dispatch-once)
              :code $ quote $ let
                  calls $ ref 0
                  handler $ on-submit |type-test-user |type-test-password false
                  event $
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  dispatch! $ fn (op)
                    hint-fn $ Fn schema/Op $ -> Unit
                    assert=
                      schema/Op :user/log-in $ [] |type-test-user |type-test-password
                      , op
                    reset! calls $ inc @calls
                    , &unit
                assert= 0 @calls
                assert= &unit $ handler event dispatch!
                assert= 1 @calls
              :tags $ #{} :js :login-contract
            %{} 'TestEntry (:name |signup-dispatch-once)
              :code $ quote $ let
                  calls $ ref 0
                  handler $ on-submit |type-test-user |type-test-password true
                  event $
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  dispatch! $ fn (op)
                    hint-fn $ Fn schema/Op $ -> Unit
                    assert=
                      schema/Op :user/sign-up $ [] |type-test-user |type-test-password
                      , op
                    reset! calls $ inc @calls
                    , &unit
                assert= 0 @calls
                assert= &unit $ handler event dispatch!
                assert= 1 @calls
              :tags $ #{} :js :login-contract
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.login
          :require
            respo.core :refer $ defcomp <> div input button span
            respo.comp.space :refer $ =<
            respo.comp.inspect :refer $ comp-inspect
            respo-ui.core :as ui
            app.schema :as schema
            app.style :as style
            app.config :as config
            js-ffi.browser :refer $ storage-set!
    'app.comp.navigation $ %{} 'FileEntry
      :defs $ {}
        'DateLabels $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct DateLabels (:weekday String) (:month-day String) (:week Number)
          :examples $ []
          :schema $ quote StructDef
        'DayjsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DayjsHost
            .month $ Fn app.comp.navigation/DayjsHost $ -> Number
            .year $ Fn app.comp.navigation/DayjsHost $ -> Number
            .week $ Fn app.comp.navigation/DayjsHost $ -> Number
            .with-year $ Fn app.comp.navigation/DayjsHost Number $ -> app.comp.navigation/DayjsHost
            .with-week $ Fn app.comp.navigation/DayjsHost Number $ -> app.comp.navigation/DayjsHost
            .start-of $ Fn app.comp.navigation/DayjsHost String $ -> app.comp.navigation/DayjsHost
            .end-of $ Fn app.comp.navigation/DayjsHost String $ -> app.comp.navigation/DayjsHost
            .format $ Fn app.comp.navigation/DayjsHost String $ -> String
            .valid? $ Fn app.comp.navigation/DayjsHost $ -> Bool
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :names $ {} (:end-of |endOf) (:start-of |startOf) (:valid? |isValid) (:with-week |week) (:with-year |year)
          :schema $ quote Trait
        'WeekBounds $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct WeekBounds (:start String) (:end String)
          :examples $ []
          :schema $ quote StructDef
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
                    fn () $ schema/Route :home
                    = page :home
                  respo.comp.space/space-x 16
                  render-entry |Finished current-history-route $ = page :history
                  respo.comp.space/space-x 16
                  render-entry |Notes current-notes-route $ = page :notes
                div
                  {}
                    :style $ {} (:cursor |pointer) (:user-select :none)
                    :tab-index 0
                    :on-click $ fn (e d!)
                      d! $ schema/Op :router/change $ schema/Route :profile
                  <> $ if logged-in? |Me |Guest
                  respo.comp.space/space-x 8
                  <> $ member-count-text count-members
          :examples $ []
          :schema $ quote $ Fn Bool (Option Number) Tag (-> respo.schema/Component)
        'css-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-entry
            {}
              |$0 $ {} (:opacity 0.6) (:user-select :none) (:transition-duration |200ms)
              |$0:hover $ {} $ :opacity 0.8
          :examples $ []
          :schema $ quote String
        'css-navbar $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-navbar
            {} $ |$0 $ merge ui/row-center
              {} (:height 48) (:padding "|0 16px") (:font-size 16)
                :border-bottom $ str "|1px solid " $ hsl 0 0 0 (Some 0.1)
                :font-family ui/font-fancy
                :background-color $ :theme config/site
                :color :white
          :examples $ []
          :schema $ quote String
        'current-history-route $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn current-history-route ()
            let
                now $ unsafe-coerce (dayjs) 'app.comp.navigation/DayjsHost
                start-day $ .start-of now |week
                end-day $ .end-of now |week
              schema/Route :history $ schema/HistoryRoute :year (.year now) :week (.week now) :start (.format start-day date-time-format) :end $ .format end-day date-time-format
          :examples $ []
          :schema $ quote $ Fn (-> schema/Route) (:features :js-ffi)
        'current-notes-route $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn current-notes-route ()
            let
                now $ unsafe-coerce (dayjs) 'app.comp.navigation/DayjsHost
              schema/Route :notes $ schema/NotesRoute :year (.year now) :month $ .month now
          :examples $ []
          :schema $ quote $ Fn (-> schema/Route) (:features :js-ffi)
        'date-labels $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn date-labels (date-string)
            let
                host $ unsafe-coerce (dayjs date-string) 'app.comp.navigation/DayjsHost
              if (.valid? host)
                DateLabels :weekday (.format host |ddd) :month-day (.format host |MM-DD) :week $ .week host
                raise |Invalid-dayjs-date
          :examples $ []
          :schema $ quote $ Fn String (-> DateLabels) (:features :js-ffi)
        'date-time-format $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def date-time-format "|YYYY-MM-DDTHH:mm:ss ZZ"
          :examples $ []
          :schema $ quote String
        'decode-timestamp $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-timestamp (input) (try-decode-map-as input 'Number)
          :examples $ []
          :schema $ quote $ Fn Input
            -> $ Result Number String
            :generics Input
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
          :schema $ quote $ Fn Number String (-> String) (:features :js-ffi)
        'member-count-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn member-count-text (count-members)
            match count-members
              (:some count) (str count)
              (:none) |
          :examples $ []
          :schema $ quote $ Fn (Option Number) (-> String)
          :tests $ []
            %{} 'TestEntry (:name |guest-count)
              :code $ quote $ assert= | (member-count-text None)
              :tags $ #{} :client
            %{} 'TestEntry (:name |member-count)
              :code $ quote $ assert= |2
                member-count-text $ Some 2
              :tags $ #{} :client
            %{} 'TestEntry (:name |zero-count)
              :code $ quote $ assert= |0
                member-count-text $ Some 0
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
                  d! $ schema/Op :router/change $ get-route
                :tab-index 0
              <> title
          :examples $ []
          :schema $ quote $ Fn String
            Fn $ -> schema/Route
            , Bool (-> respo.schema/Element)
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
          :schema $ quote $ Fn Number Number (-> WeekBounds) (:features :js-ffi)
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
        'comp-note $ %{} 'CodeEntry
          :doc "|Render a legacy note Map. Prompt options retain the old nullable initial-value validation; timestamp validation then precedes visible-text validation, and callback-only IDs are decoded only when the action runs. Do not replace the prompt boundary with an eager String decoder."
          :code $ quote $ defcomp comp-note (states note)
            let
                edit-plugin $ use-prompt (>> states :edit)
                  schema/assoc-legacy-optional
                    {} (:text "|Update note:") (:multiline? true)
                    , :initial $ get note :text
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
                  respo.comp.space/space-x 8
                  div
                    {} $ :class-name css/row-middle
                    comp-icon :edit
                      &{} :font-size 16 :curspr :pointer :color $ hsl 200 80 80
                      fn (e d!)
                        hint-fn $ Fn Dynamic
                          Fn schema/Op $ -> Unit
                          -> Unit
                        .show edit-plugin d! $ fn (result)
                          hint-fn $ Fn String $ -> Unit
                          d! $ :: :note/edit $ schema/NoteEdit :id
                            match (calcit.core/get note :id)
                              (:some value) (decode-map-as value 'String)
                              (:none) (decode-map-as nil 'String)
                            , :text (decode-map-as result 'String)
                          , &unit
                        , &unit
                    respo.comp.space/space-x 8
                    comp-icon :delete
                      &{} :font-size 16 :cursor :pointer :color $ hsl 10 80 60
                      fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn schema/Op $ -> Unit
                          -> Unit
                        .show remove-plugin d! $ fn ()
                          hint-fn $ Fn $ -> Unit
                          d! $ :: :note/remove $ match (calcit.core/get note :id)
                            (:some value) (decode-map-as value 'String)
                            (:none) (decode-map-as nil 'String)
                          , &unit
                <> $ match (calcit.core/get note :text)
                  (:some value) (decode-map-as value 'String)
                  (:none) (decode-map-as nil 'String)
                .render edit-plugin
                .render remove-plugin
          :examples $ []
          :schema $ quote $ Fn (Map StateKey Dynamic) (Map Tag Dynamic) (-> respo.schema/Component) (:generics StateKey)
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
                  .unwrap $ &map:get tag-branch :cursor
                assert= ([] :root |note-1)
                  .unwrap $ &map:get string-branch :cursor
                assert= ([] :root 7)
                  .unwrap $ &map:get number-branch :cursor
                assert= ([] :root)
                  .unwrap $ calcit.core/get root :cursor
              :tags $ #{} :js
            %{} 'TestEntry (:name |preserves-timestamp-decoder-errors)
              :code $ quote $ let
                  check-note! $ fn (note expected)
                    hint-fn $ Fn (Map Tag Dynamic) String $ -> Unit
                    assert= expected $ try
                      do
                        comp-note
                          {} $ :cursor $ []
                          , note
                        raise |Expected-timestamp-error
                      fn (message) message
                    , &unit
                  check-value! $ fn (value)
                    hint-fn $ Fn Dynamic $ -> Unit
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
            %{} 'TestEntry (:name |preserves-prompt-and-text-validation-order)
              :code $ quote $ let
                  states $ {} $ :cursor ([])
                  base $ decode-map-as
                    {} (:id |note) (:time 1735689600000)
                    Map Tag Dynamic
                  timestamp-error $ match (decode-timestamp nil)
                    (:err message) message
                    (:ok _) (raise |Expected-timestamp-error)
                  text-error $ try (decode-map-as nil 'String)
                    fn (message) message
                assert= "|respo-alerts expected text at :initial, got: :bool" $ try
                  do
                    comp-note states $ assoc (assoc base :time nil) :text false
                    raise |Expected-prompt-error
                  fn (message) message
                assert= timestamp-error $ try
                  do
                    comp-note states $ assoc base :time nil
                    raise |Expected-timestamp-error
                  fn (message) message
                assert= text-error $ try
                  do (comp-note states base) (raise |Expected-text-error)
                  fn (message) message
                assert= text-error $ try
                  do
                    comp-note states $ assoc base :text nil
                    raise |Expected-text-error
                  fn (message) message
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
                      respo.comp.space/space-x 16
                      comp-icon :plus
                        &{} :font-size 16 :color (hsl 200 80 80) :cursor :pointer
                        fn (e d!)
                          hint-fn $ Fn Dynamic
                            Fn schema/Op $ -> Unit
                            -> Unit
                          .show add-plugin d! $ fn (result)
                            hint-fn $ Fn String $ -> Unit
                            d! $ :: :note/add result
                            , &unit
                          , &unit
                    div
                      {} $ :class-name css/row-middle
                      comp-icon :arrow-left
                        {} (:font-size 16)
                          :color $ hsl 200 80 80
                          :cursor :pointer
                        fn (e d!)
                          d! $ schema/route-operation $ schema/Route :notes
                            if (<= month 0)
                              schema/NotesRoute :year (dec year) :month 11
                              schema/NotesRoute :year year :month $ dec month
                      respo.comp.space/space-x 8
                      comp-icon :arrow-right
                        {} (:font-size 16)
                          :color $ hsl 200 80 80
                          :cursor :pointer
                        fn (e d!)
                          d! $ schema/route-operation $ schema/Route :notes
                            if (>= month 11)
                              schema/NotesRoute :year (inc year) :month 0
                              schema/NotesRoute :year year :month $ inc month
                      respo.comp.space/space-x 8
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
                                  respo.comp.space/space-x 12
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
                  respo.comp.space/space-y 160
                .render add-plugin
          :examples $ []
          :schema $ quote $ Fn (Map StateKey Dynamic)
            Map String $ Map Tag Dynamic
            Map Tag Number
            -> respo.schema/Component
            :generics StateKey
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
                assert= (Some 7) (get info :extra)
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
                hsl 0 0 80 $ Some 0.2
          :examples $ []
          :schema $ quote String
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
          :schema $ quote $ Fn
            Fn respo.schema/RespoEvent
              Fn schema/Op $ -> Unit
              -> Unit
            -> respo.schema/Component
          :tests $ [] $ %{} 'TestEntry (:name |forwards-event-and-dispatch-once)
            :code $ quote $ let
                calls $ ref 0
                dispatches $ ref 0
                event $ &struct:assoc
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :key-code 13
                  , :shift? true
                op $ schema/Op :user/log-in $ [] |type-test-user |type-test-password
                handler $ fn (e d!)
                  hint-fn $ Fn respo.schema/RespoEvent
                    Fn schema/Op $ -> Unit
                    -> Unit
                  assert= event e
                  reset! calls $ inc @calls
                  d! op
                dispatch! $ fn (received)
                  hint-fn $ Fn schema/Op $ -> Unit
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
          :schema $ quote $ Fn (-> respo.schema/Component)
        'comp-overview $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-overview (states today tasks) (decode-map-as states 'Map)
            let
                working-tasks $ .filter-kv tasks $ fn (key task)
                  hint-fn $ Fn String (Map Tag Dynamic) (-> Bool)
                  not $ match (calcit.core/get task :pending?)
                    (:some value) (decode-map-as value 'Bool)
                    (:none) (decode-map-as nil 'Bool)
                pending-tasks $ .filter-kv tasks $ fn (key task)
                  hint-fn $ Fn String (Map Tag Dynamic) (-> Bool)
                  match (calcit.core/get task :pending?)
                    (:some value) (decode-map-as value 'Bool)
                    (:none) (decode-map-as nil 'Bool)
                create-plugin $ use-prompt (>> states :create)
                  {} $ :text "|Create new task:"
                cursor $ match
                  get-in states $ [] :cursor
                  (:ok value) (decode-map-as value 'List)
                  (:err _e) (decode-map-as nil 'List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:ok value)
                      or value $ {} $ :show-later? false
                    (:err _e)
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
                      Some $ comp-icon :plus
                        &{} :font-size 14 :color (hsl 200 80 80) :cursor :pointer
                        fn (e d!)
                          hint-fn $ Fn Dynamic
                            Fn schema/Op $ -> Unit
                            -> Unit
                          .show create-plugin d! $ fn (result)
                            hint-fn $ Fn String $ -> Unit
                            d! $ :: :task/create-working result
                            , &unit
                          , &unit
                      assert-type None $ Option $ Fn respo.schema/RespoEvent
                        Fn schema/Op $ -> Unit
                        -> Unit
                    comp-global-keydown $ fn (e d!)
                      hint-fn $ Fn respo.schema/RespoEvent
                        Fn schema/Op $ -> Unit
                        -> Unit
                      when
                        and
                          if (:meta? e) true false
                          = |i $ :key e
                        .show create-plugin d! $ fn (result)
                          hint-fn $ Fn String $ -> Unit
                          d! $ :: :task/create-working result
                          , &unit
                      , &unit
                    div
                      {}
                        :class-name $ str-spaced css/row-middle css/font-fancy
                        :style $ {} $ :color (hsl 0 0 60)
                      <> $ :weekday today-labels
                      respo.comp.space/space-x 8
                      <> $ str (:week today-labels) "|th week"
                      respo.comp.space/space-x 16
                      <> today
                  if (empty? working-tasks) (comp-no-tasks)
                    list-> ({})
                      -> working-tasks (&map:to-list)
                        &list:sort-by $ fn (pair)
                          let[] (_ task) pair $ task-sort-key task
                        &list:map-pair $ fn (k task)
                          let
                              task-data $ decode-map-as task $ Map Tag Dynamic
                            [] k $ comp-task
                              >> states $ match (calcit.core/get task-data :id)
                                (:some value) (decode-map-as value 'String)
                                (:none) (decode-map-as nil 'String)
                              , task-data :working
                  if
                    not $ empty? pending-tasks
                    Some $ div ({})
                      comp-title |Later
                        assert-type None $ Option respo.schema/Component
                        Some $ fn (e d!)
                          hint-fn $ Fn respo.schema/RespoEvent
                            Fn schema/Op $ -> Unit
                            -> Unit
                          d! $ :: :states cursor $ update state :show-later? not
                          , &unit
                      if
                        match (calcit.core/get state :show-later?)
                          (:some value) (if value true false)
                          (:none) false
                        list-> ({})
                          -> pending-tasks (&map:to-list)
                            &list:sort-by $ fn (pair)
                              let[] (_ task) pair $ task-sort-key task
                            &list:map-pair $ fn (k task)
                              let
                                  task-data $ decode-map-as task $ Map Tag Dynamic
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
                    , None
                  .render create-plugin
          :examples $ []
          :schema $ quote $ Fn (Map StateKey Dynamic) String
            Map String $ Map Tag Dynamic
            -> respo.schema/Component
            :generics StateKey
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
                    hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
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
                    hint-fn $ Fn schema/Op $ -> Unit
                    match op
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :show-later? false) payload
                      _ $ raise |Expected-state-operation
                    swap! calls inc
                    , &unit
                assert= 1 $ count $ :children working
                assert= 1 $ count $ :children pending
                click
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , dispatch!
                assert= 1 @calls
                assert= true $ .unwrap $ calcit.core/get state :show-later?
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
                    hint-fn $ Fn (Map Tag Dynamic) String $ -> Unit
                    assert= expected $ try
                      do
                        comp-overview state |2026-09-14 $ {}
                        raise |Expected-cursor-error
                      fn (message) message
                    , &unit
                  check-value! $ fn (value)
                    hint-fn $ Fn Dynamic $ -> Unit
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
            %{} 'TestEntry (:name |preserves-keyboard-selection-and-dispatch)
              :code $ quote $ let
                  element $ fn (node)
                    hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
                    .unwrap $ :node $ .unwrap
                      nth (:children parent) index
                  root $ element $ .unwrap
                    :tree $ comp-overview
                      {} $ :cursor $ []
                      , |2026-09-14 $ {}
                  content $ element $ child root 0
                  header $ element $ child content 0
                  global $ match (child header 1)
                    (:component value) value
                    (:element _) (raise |Expected-keydown-component)
                  tree $ element $ .unwrap (:tree global)
                  keydown $ .unwrap $ js-nullish->option
                    .unwrap $ .get (:event tree) :keydown
                  calls $ ref 0
                  dispatch! $ fn (op)
                    hint-fn $ Fn schema/Op $ -> Unit
                    swap! calls inc
                    , &unit
                  check-event! $ fn (event expected)
                    hint-fn $ Fn respo.schema/RespoEvent Number $ -> Unit
                    reset! calls 0
                    assert= &unit $ keydown event dispatch!
                    assert= expected @calls
                    , &unit
                  reject-dispatch! $ fn (op)
                    hint-fn $ Fn schema/Op $ -> Unit
                    raise |Keyboard-dispatch-error
                check-event!
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , 0
                check-event!
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :key |i
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? nil
                    , :key |i
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? false
                    , :key |i
                  , 0
                check-event!
                  &struct:assoc
                      fn ()
                        hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                        respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                    , :meta? true
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? true
                    , :key nil
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? true
                    , :key nil
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? true
                    , :key nil
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? true
                    , :key |
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? true
                    , :key |other
                  , 0
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? true
                    , :key |i
                  , 1
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? $ if 0 true false
                    , :key |i
                  , 1
                check-event!
                  &struct:assoc
                    &struct:assoc
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , :meta? $ if | true false
                    , :key |i
                  , 1
                assert= |Keyboard-dispatch-error $ try
                  keydown
                    &struct:assoc
                      &struct:assoc
                          fn ()
                            hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                            respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                        , :meta? true
                      , :key |i
                    , reject-dispatch!
                  fn (message) message
              :tags $ #{} :js :option-condition-contract
        'comp-task $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-task (states task mode) (decode-map-as states 'Map)
            let
                decoded-task $ match (schema/decode-task-record task)
                  (:ok record) record
                  (:err message) (raise message)
                cursor $ match
                  get-in states $ [] :cursor
                  (:ok value) (decode-map-as value 'List)
                  (:err _e) (decode-map-as nil 'List)
                state $ decode-map-as
                  match
                    get-in states $ [] :data
                    (:ok value)
                      or value $ {} $ :menu? false
                    (:err _e)
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
                      (:some value) (if value true false)
                      (:none) false
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
                    hint-fn $ Fn Dynamic
                      Fn schema/Op $ -> Unit
                      -> Unit
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
                                hint-fn $ Fn String $ -> Unit
                                d! $ :: :task/update-working $ schema/TaskEdit :id task-id :text (decode-map-as text 'String)
                                , &unit
                            :copy $ do
                              copy! $ :text decoded-task
                              d! $ :: :states cursor new-state
                            :remove $ do
                              d! $ :: :states cursor new-state
                              .show delete-plugin d! $ fn ()
                                hint-fn $ Fn $ -> Unit
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
          :schema $ quote $ Fn (Map StateKey Dynamic) (Map Tag Dynamic) Tag (-> respo.schema/Component) (:generics StateKey)
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
                  .unwrap $ &map:get tag-branch :cursor
                assert= ([] :root |task-1)
                  .unwrap $ &map:get string-branch :cursor
                assert= ([] :root 7)
                  .unwrap $ &map:get number-branch :cursor
                assert= ([] :root)
                  .unwrap $ calcit.core/get root :cursor
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
                    hint-fn $ Fn schema/Op $ -> Unit
                    match op
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :menu? true) payload
                      _ $ raise |Expected-state-operation
                    swap! calls inc
                    , &unit
                click
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , dispatch!
                assert= 1 @calls
                assert= false $ .unwrap $ calcit.core/get state :menu?
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
                    hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
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
                    hint-fn $ Fn schema/Op $ -> Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :menu? false) payload
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , dispatch!
                assert= 1 @calls
                assert= true $ .unwrap $ calcit.core/get state :menu?
              :tags $ #{} :js :menu-contract
            %{} 'TestEntry (:name |selection-dispatches-action-and-closes)
              :code $ quote $ let
                  cursor $ [] :panel |task-1 7
                  state $ {} (:menu? true) (|extra |preserved)
                  states $ {} (:cursor cursor) (:data state)
                  element $ fn (node)
                    hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                    match node
                      (:element value) value
                      (:component _) (raise |Expected-element)
                  child $ fn (parent index)
                    hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
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
                    hint-fn $ Fn schema/Op $ -> Unit
                    match operation
                      (:states path payload)
                        do (assert= cursor path)
                          assert= (assoc state :menu? false) payload
                      (:task/finish-working id) (assert= |task-1 id)
                      _ $ raise |Unexpected-menu-operation
                    swap! calls inc
                    , &unit
                click
                    fn ()
                      hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                      respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                  , dispatch!
                assert= 2 @calls
                assert= true $ .unwrap $ calcit.core/get state :menu?
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
                :style $ if (.some? on-click)
                  {} $ :cursor :pointer
                  {}
                :on-click $ fn (e d!)
                  hint-fn $ Fn respo.schema/RespoEvent
                    Fn schema/Op $ -> Unit
                    -> Unit
                  match on-click
                    (:some handler) (handler e d!)
                    (:none) &unit
                  , &unit
              <> title
              respo.comp.space/space-x 16
              , child
          :examples $ []
          :schema $ quote $ Fn String (Option respo.schema/Component)
            Option $ Fn respo.schema/RespoEvent
              Fn schema/Op $ -> Unit
              -> Unit
            -> respo.schema/Component
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
                  component $ comp-title |Title None None
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
                    hint-fn $ Fn respo.schema/RespoEvent
                      Fn schema/Op $ -> Unit
                      -> Unit
                    reset! calls $ inc @calls
                    , &unit
                  dispatch! $ fn (op)
                    hint-fn $ Fn schema/Op $ -> Unit
                    , &unit
                let
                    component $ comp-title |Title None $ do
                      reset! evaluations $ inc @evaluations
                      Some handler
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
                    click
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , dispatch!
                    assert= 1 @calls
                    click
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , dispatch!
                    assert= 2 @calls
                    assert= 1 @evaluations
              :tags $ #{} :js :title-contract
            %{} 'TestEntry (:name |child-once)
              :code $ quote $ let
                  evaluations $ ref 0
                  component $ comp-title |Parent $ Some
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
                  dispatch! $ fn (op)
                    hint-fn $ Fn schema/Op $ -> Unit
                    raise |Unexpected-dispatch
                assert= true $ nil? old-nil
                assert= false old-false
                assert= false $ fn? old-nil
                assert= false $ fn? old-false
                let
                    component $ comp-title |Title None None
                    tree $ match
                      .unwrap $ :tree component
                      (:element element) element
                      (:component _) (raise |Expected-title-element)
                  assert-type tree respo.schema/Element
                  let
                      click $ .unwrap $ js-nullish->option
                        .unwrap $ .get (:event tree) :click
                    click
                        fn ()
                          hint-fn $ Fn (-> respo.schema/RespoEvent) (:features :js-ffi)
                          respo.util.format/event->edn $ js-cast (new js/Event |click) 'respo.dom/DomEvent
                      , dispatch!
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
                hsl 0 0 80 $ Some 0.1
          :examples $ []
          :schema $ quote String
        'css-title $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-title
            {} $ |$0 $ merge ui/row-middle
              {} (:margin "|8px 0") (:font-family ui/font-fancy)
                :color $ hsl 0 0 50
                :font-size 16
                :font-weight 300
          :examples $ []
          :schema $ quote String
        'task-menu-action $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn task-menu-action (item)
            decode-map-as (&enum:nth item 1) 'Tag
          :examples $ []
          :schema $ quote $ Fn AnyEnum (-> Tag) (:open :decode)
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
            negate $ match (calcit.core/get task :touched-time)
              (:some value)
                if value (decode-map-as value 'Number)
                  match (calcit.core/get task :created-time)
                    (:some value) (decode-map-as value 'Number)
                    (:none) (decode-map-as nil 'Number)
              (:none)
                match (calcit.core/get task :created-time)
                  (:some value) (decode-map-as value 'Number)
                  (:none) (decode-map-as nil 'Number)
          :examples $ []
          :schema $ quote $ Fn (Map Tag V) (-> Number) (:generics V)
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
            %{} 'TestEntry
              :name |preserves-full-errors-and-unselected-created-time
              :code $ quote $ let
                  check-error! $ fn (task invalid)
                    hint-fn $ Fn (Map Tag Dynamic) Dynamic $ -> Unit
                    match (try-decode-map-as invalid 'Number)
                      (:err message)
                        assert= message $ try (task-sort-key task)
                          fn (failure) failure
                      (:ok _) (raise |Expected-invalid-time)
                    , &unit
                check-error! ({}) nil
                check-error!
                  {} (:touched-time false) (:created-time false)
                  , false
                check-error!
                  {} (:touched-time nil) (:created-time false)
                  , false
                check-error!
                  {} (:touched-time |) (:created-time 100)
                  , |
                check-error!
                  {} (:touched-time true) (:created-time 100)
                  , true
                assert= 0 $ task-sort-key $ {} (:touched-time 0) (:created-time |unselected)
                assert= 5 $ task-sort-key $ {} (:touched-time -5)
                  :created-time $ []
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
                  <> $ match (calcit.core/get user :name)
                    (:some value) (str "|Hello! " value)
                    (:none) (str "|Hello! " nil)
                respo.comp.space/space-y 16
                div
                  {} $ :class-name css/row
                  <> |Members:
                  respo.comp.space/space-x 8
                  list->
                    {} $ :class-name css/row
                    &list:map-pair
                      .to-list $ member-labels members css-member-label
                      fn (key label) ([] key label)
                respo.comp.space/space-y 48
                div ({})
                  button
                    {} (:class-name css/button)
                      :on-click $ fn (e d!)
                        js-ffi.browser/location-replace! $ str
                          :origin $ js-ffi.browser/location-snapshot
                          , |?time= $ js-ffi.shared/now-ms
                        , &unit
                    <> |Refresh
                  respo.comp.space/space-x 16
                  button
                    {} (:class-name css/button)
                      :style $ {} (:color :red) (:border-color :red)
                      :on-click $ fn (e d!)
                        d! $ :: :user/log-out
                        js-ffi.browser/storage-remove! $ :storage-key config/site
                        , &unit
                    <> "|Log out"
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (Map MemberKey String) (-> respo.schema/Component) (:generics MemberKey)
          :tests $ [] $ %{} 'TestEntry (:name |preserves-greeting-stringification)
            :code $ quote $ let
                element $ fn (node)
                  hint-fn $ Fn respo.schema/RenderNode $ -> respo.schema/Element
                  match node
                    (:element value) value
                    (:component _) (raise |Expected-profile-element)
                child $ fn (parent index)
                  hint-fn $ Fn respo.schema/Element Number $ -> respo.schema/RenderNode
                  .unwrap $ :node $ .unwrap
                    nth (:children parent) index
                members $ decode-map-as ({}) (Map Number String)
                check-user! $ fn (user expected)
                  hint-fn $ Fn (Map Tag Dynamic) String $ -> Unit
                  let
                      root $ element $ .unwrap
                        :tree $ comp-profile user members
                      content $ element $ child root 0
                      heading $ element $ child content 0
                      text $ element $ child heading 0
                    assert=
                      [] $ [] :inner-text expected
                      :attrs text
                  , &unit
              check-user! ({}) (str "|Hello! " nil)
              check-user!
                {} $ :name nil
                str "|Hello! " nil
              check-user!
                {} $ :name false
                str "|Hello! " false
              check-user!
                {} $ :name 0
                str "|Hello! " 0
              check-user!
                {} $ :name |
                str "|Hello! " |
              check-user!
                {} $ :name |Ada
                str "|Hello! " |Ada
            :tags $ #{} :js :option-leaf-contract
        'css-member-label $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-member-label
            {} $ |$0 $ {} (:padding "|0 8px")
              :border $ str "|1px solid " $ hsl 0 0 80
              :border-radius |16px
              :margin "|0 4px"
          :examples $ []
          :schema $ quote String
        'member-labels $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn member-labels (members class-name)
            .filter-map-kv members $ fn (key username)
              MapEntryDecision :keep key $ div
                {} $ :class-name class-name
                <> username
          :examples $ []
          :schema $ quote $ Fn (Map MemberKey String) String
            -> $ Map MemberKey respo.schema/Element
            :generics MemberKey
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
          :code $ quote $ defstruct SiteConfig (:port Number) (:title String) (:icon String) (:dev-ui String) (:release-ui String) (:cdn-url String) (:theme String) (:storage-key String) (:storage-file String)
          :examples $ []
          :schema $ quote StructDef
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $
              get-env |mode
              , .unwrap-or |release
          :examples $ []
          :schema $ quote Bool
        'site $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def site
            SiteConfig :port 11009 :title |Timegrass :icon |http://cdn.tiye.me/logo/timegrass.png :dev-ui |http://localhost:8100/main.css :release-ui |http://cdn.tiye.me/favored-fonts/main.css :cdn-url |http://cdn.tiye.me/timegrass/ :theme |#51C766 :storage-key |timegrass :storage-file |storage.cirru
          :examples $ []
          :schema $ quote SiteConfig
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
          :code $ quote $ defenum ClientMessage (:sync/active Number) (:sync/heartbeat Number) (:sync/idle Number) (:sync/resume Number) (:sync/ack Number) (:dispatch app.schema/Op)
          :examples $ []
          :schema $ quote EnumDef
        'DatabaseRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct DatabaseRecord (:today String)
            :users $ Map String app.schema/UserRecord
            :sessions $ Map Number app.schema/SessionRecord
          :examples $ []
          :schema $ quote StructDef
        'FinishedTaskView $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct FinishedTaskView (:id String) (:text String) (:finished-time Number)
          :examples $ []
          :schema $ quote StructDef
        'HistoryRoute $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct HistoryRoute (:year Number) (:week Number) (:start String) (:end String)
          :examples $ []
          :schema $ quote StructDef
        'HistoryRouteView $ %{} 'CodeEntry
          :doc "|历史页面的必需年份/周序视图；只校验 UI 使用的 year/week，不把服务端的 start/end 要求带入页面。"
          :code $ quote $ defstruct HistoryRouteView (:year Number) (:week Number)
          :examples $ []
          :schema $ quote StructDef
        'LegacyDatabaseView $ %{} 'CodeEntry
          :doc "|旧 Map 数据通过 decode-database 后的必需字段视图；复用既有 users 解码边界，不改变存储格式或额外元数据。"
          :code $ quote $ defstruct LegacyDatabaseView (:today String)
            :users $ Map String Dynamic
          :examples $ []
          :schema $ quote StructDef
        'LoginState $ %{} 'CodeEntry (:doc "|登录组件的必需字段视图；原始 state Map 继续保留额外字段并用于更新。")
          :code $ quote $ defstruct LoginState (:username String) (:password String)
          :examples $ []
          :schema $ quote StructDef
        'MessageDecodeError $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum MessageDecodeError (:invalid String)
          :examples $ []
          :schema $ quote EnumDef
        'NoteEdit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NoteEdit (:id String) (:text String)
          :examples $ []
          :schema $ quote StructDef
        'NoteRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NoteRecord (:id String) (:text String) (:time Number)
            :updated-time $ Option Number
          :examples $ []
          :schema $ quote StructDef
        'NotesRoute $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NotesRoute (:year Number) (:month Number)
          :examples $ []
          :schema $ quote StructDef
        'NotificationRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct NotificationRecord (:id String) (:text String)
          :examples $ []
          :schema $ quote StructDef
        'Op $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum Op (:today String) (:session/connect) (:session/disconnect) (:session/remove-message String)
            :user/log-in $ List String
            :user/sign-up $ List String
            :user/log-out
            :router/change app.schema/Route
            :task/create-working String
            :task/remove-working String
            :task/finish-working String
            :task/update-working app.schema/TaskEdit
            :task/touch-working String
            :task/put-back String
            :task/pend String
            :note/add String
            :note/edit app.schema/NoteEdit
            :note/remove String
            :effect/persist
            :effect/ping
            :effect/pong
            :effect/connect
            :states (List app.schema/StateKey) Dynamic
          :examples $ []
          :schema $ quote EnumDef
        'Route $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum Route (:home) (:profile) (:history app.schema/HistoryRoute) (:notes app.schema/NotesRoute)
          :examples $ []
          :schema $ quote EnumDef
        'ServerMessage $ %{} 'CodeEntry
          :doc "|Typed server snapshot, patch, and heartbeat envelope."
          :code $ quote $ defenum ServerMessage
            :snapshot Number $ Map Tag Dynamic
            :patch Number Number $ List recollect.schema/change-op
            :effect/pong
          :examples $ []
          :schema $ quote EnumDef
        'SessionRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct SessionRecord (:id Number)
            :user-id $ Option String
            :nickname $ Option String
            :router app.schema/Route
            :messages $ Map String app.schema/NotificationRecord
          :examples $ []
          :schema $ quote StructDef
        'StateKey $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defunion StateKey Tag String Number
          :examples $ []
          :schema $ quote UnionDef
        'TaskEdit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct TaskEdit (:id String) (:text String)
          :examples $ []
          :schema $ quote StructDef
        'TaskRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct TaskRecord (:id String) (:text String) (:detail String) (:pending? Bool)
            :created-time $ Option Number
            :touched-time $ Option Number
            :finished-time $ Option Number
            :archived-time $ Option Number
          :examples $ []
          :schema $ quote StructDef
        'UserRecord $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct UserRecord (:id String) (:name String)
            :nickname $ Option String
            :avatar $ Option String
            :password $ Option String
            :tasks app.schema/UserTasks
            :notes $ Map String app.schema/NoteRecord
          :examples $ []
          :schema $ quote StructDef
        'UserTasks $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct UserTasks
            :working $ Map String app.schema/TaskRecord
            :pending $ Map String app.schema/TaskRecord
            :finished $ Map String app.schema/TaskRecord
          :examples $ []
          :schema $ quote StructDef
        'add-session-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn add-session-message (db sid id text)
            update-session db sid $ fn (session-record)
              hint-fn $ Fn SessionRecord $ -> SessionRecord
              struct-with session-record $ :messages $ assoc (:messages session-record) id (NotificationRecord :id id :text text)
          :examples $ []
          :schema $ quote $ Fn DatabaseRecord Number String String (-> DatabaseRecord)
        'assoc-legacy-optional $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn assoc-legacy-optional (data key field)
            match field
              (:some value) (assoc data key value)
              (:none) (assoc data key nil)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) Tag (Option T)
            -> $ Map Tag Dynamic
            :generics T
        'complain $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def complain
            {} (:id nil) (:text |) (:time nil)
          :examples $ []
          :schema $ quote Dynamic
        'database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def database
            {}
              :sessions $ do session $ {}
              :users $ do user $ {}
              :today |2018-08-07
          :examples $ []
          :schema $ quote $ Map Tag Dynamic
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
          :schema $ quote $ Fn DatabaseRecord
            -> $ Map Tag Dynamic
        'decode-client-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-client-message (data)
            let
                message $ if (enum? data)
                  assoc data 0 $ turn-tag $ .unwrap (nth data 0)
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
          :schema $ quote $ Fn Input
            -> $ Result ClientMessage MessageDecodeError
            :generics Input
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
                      Map String Dynamic
                    (:ok users-map)
                      match (validate-stored-users users-map)
                        (:ok _)
                          Result :ok $ assoc
                            merge database $ decode-map-as raw $ Map Tag Dynamic
                            , :sessions $ {}
                        (:err message) (Result :err message)
                    (:err detail)
                      Result :err $ str "|storage.cirru/:users " detail
              Result :err "|storage.cirru expected Map"
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ Result (Map Tag Dynamic) String
          :tests $ []
            %{} 'TestEntry (:name |defaults-missing-fields)
              :code $ quote $ assert= true
                match
                  decode-database $ {}
                  (:ok db)
                    and
                      = |2018-08-07 $ .unwrap $ calcit.core/get db :today
                      map? $ .unwrap $ calcit.core/get db :users
                      empty? $ .unwrap $ calcit.core/get db :sessions
                  (:err _) false
              :tags $ #{} :server
            %{} 'TestEntry (:name |rejects-malformed-fields)
              :code $ quote $ do
                assert= (Result :err "|storage.cirru expected Map") (decode-database nil)
                assert= (Result :err "|storage.cirru/:today expected String")
                  decode-database $ {} $ :today 3
                assert= (Result :err "|storage.cirru/:users expected Map")
                  decode-database $ {} $ :users []
                assert= (Result :err "|storage.cirru/:sessions expected Map")
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
                      = |2026-09-25 $ .unwrap $ calcit.core/get db :today
                      empty? $ .unwrap $ calcit.core/get db :sessions
                      = |Alice $ .unwrap $ calcit.core/get
                        .unwrap $ calcit.core/get
                          .unwrap $ calcit.core/get db :users
                          , |u1
                        , :name
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
                          users $ .unwrap $ calcit.core/get db :users
                          user $ .unwrap $ calcit.core/get users |u1
                        and
                          = |2026-09-25 $ .unwrap $ calcit.core/get db :today
                          empty? $ .unwrap $ calcit.core/get db :sessions
                          map? user
                          = |Alice $ .unwrap $ calcit.core/get user :name
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
                assert= (Result :err "|storage.cirru/:today expected String")
                  decode-database $ {} (:today nil) (:sessions 7) (:users false)
                assert= (Result :err "|storage.cirru/:sessions expected Map")
                  decode-database $ {} (:today |) (:sessions nil) (:users false)
                assert= (Result :err "|storage.cirru/:users expected Map")
                  decode-database $ {} (:today |)
                    :sessions $ {}
                    :users nil
              :tags $ #{} :server
            %{} 'TestEntry (:name |preserves-present-empty-today)
              :code $ quote $ match
                decode-database $ {} $ :today |
                (:ok db)
                  assert= (Some |) (get db :today)
                (:err message) (raise message)
              :tags $ #{} :server
            %{} 'TestEntry (:name |passes-checked-map-to-typed-method-consumer)
              :code $ quote $ let
                  select-extra $ fn (data)
                    hint-fn $ Fn (Map Tag Dynamic)
                      -> $ Map Tag Dynamic
                    data.filter-kv $ fn (key value) (= key :extra)
                match
                  decode-database $ {} (:today |) (:extra 0)
                  (:ok legacy)
                    assert=
                      {} $ :extra 0
                      select-extra legacy
                  (:err message) (raise message)
              :tags $ #{} :server
            %{} 'TestEntry
              :name |preserves-opaque-root-payloads-and-session-clearing
              :code $ quote $ let
                  marker $ ref 17
                each ([] nil false 0 | marker)
                  fn (payload)
                    let
                        raw $ {} (:today |) (:extra payload)
                          :sessions $ {} $ 1
                            {} $ :user-id |u1
                          :users $ {}
                      match (decode-database raw)
                        (:ok legacy)
                          do
                            assert= (Some payload) (legacy.get :extra)
                            assert=
                              Some $ {}
                              legacy.get :sessions
                            assert= (Some |) (legacy.get :today)
                            assert= (Some payload) (raw.get :extra)
                            match (legacy.get :extra)
                              (:some actual)
                                assert= true $ identical? payload actual
                              (:none) (raise "|missing opaque root payload")
                        (:err message) (raise message)
              :tags $ #{} :server
        'decode-finished-task-view $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-finished-task-view (raw)
            try-decode-map-as
              select-keys raw $ [] :id :text :finished-time
              , FinishedTaskView
          :examples $ []
          :schema $ quote $ Fn (Map Tag V)
            -> $ Result FinishedTaskView String
            :generics V
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
                  (:err message)
                    starts-with? message "|decode-map-as failed at $: struct :FinishedTaskView is missing required field :finished-time"
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
          :schema $ quote $ Fn T
            -> $ Result NoteRecord String
            :generics T
          :tests $ []
            %{} 'TestEntry (:name |legacy-nil-update-to-option)
              :code $ quote $ assert= true
                match
                  decode-note-record $ {} (:id |n1) (:text |hello) (:time 42) (:updated-time nil)
                  (:ok note)
                    and
                      = |n1 $ :id note
                      let
                          expected-none None
                        assert-type expected-none $ Option Number
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
                  assoc data 0 $ turn-tag $ .unwrap (nth data 0)
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
                      decoded-id $ if (map? value)
                        match (calcit.core/get value :id)
                          (:some value) (try-decode-map-as value 'String)
                          (:none) (try-decode-map-as nil 'String)
                        try-decode-map-as value 'String
                    match decoded-id
                      (:ok message-id)
                        Result :ok $ Op :session/remove-message message-id
                      (:err message)
                        invalid-message $ str "|Invalid session/remove-message operation: " message
                (:user/log-in value)
                  match
                    try-decode-map-as value $ List String
                    (:ok credentials)
                      if
                        = 2 $ count credentials
                        Result :ok $ Op :user/log-in credentials
                        invalid-message "|Invalid user/log-in operation: expected two credentials"
                    (:err message)
                      invalid-message $ str "|Invalid user/log-in operation: " message
                (:user/sign-up value)
                  match
                    try-decode-map-as value $ List String
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
                    try-decode-map-as cursor $ List app.schema/StateKey
                    (:ok checked-cursor)
                      Result :ok $ Op :states checked-cursor state
                    (:err message)
                      invalid-message $ str "|Invalid states cursor: " message
                _ $ invalid-message $ str "|Unknown application operation: " op
          :examples $ []
          :schema $ quote $ Fn Input
            -> $ Result Op MessageDecodeError
            :generics Input
          :tests $ []
            %{} 'TestEntry (:name |accepts-today-string)
              :code $ quote $ assert=
                Result :ok $ Op :today |2026-09-25
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
                Result :ok $ Op :note/add |hello
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
                Result :ok $ Op :note/remove |note-1
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
                  Result :ok $ Op :task/create-working |write-docs
                  decode-operation $ :: :task/create-working |write-docs
                assert=
                  Result :ok $ Op :task/remove-working |task-1
                  decode-operation $ :: :task/remove-working |task-1
                assert=
                  Result :ok $ Op :task/finish-working |task-1
                  decode-operation $ :: :task/finish-working |task-1
                assert=
                  Result :ok $ Op :task/touch-working |task-1
                  decode-operation $ :: :task/touch-working |task-1
                assert=
                  Result :ok $ Op :task/put-back |task-1
                  decode-operation $ :: :task/put-back |task-1
                assert=
                  Result :ok $ Op :task/pend |task-1
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
                  Result :ok $ Op :user/log-in $ [] |Alice |secret
                  decode-operation $ :: :user/log-in $ [] |Alice |secret
                assert=
                  Result :ok $ Op :user/sign-up $ [] |Alice |secret
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
                  Result :ok $ Op :task/update-working $ TaskEdit :id |t1 :text |Updated
                  decode-operation $ :: :task/update-working $ {} (:id |t1) (:text |Updated)
                assert=
                  Result :ok $ Op :note/edit $ NoteEdit :id |n1 :text |Updated
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
                  Result :ok $ Op :task/update-working $ TaskEdit :id |t1 :text |Updated
                  decode-operation $ parse-cirru-edn $ format-cirru-edn
                    Op :task/update-working $ TaskEdit :id |t1 :text |Updated
                assert=
                  Result :ok $ Op :note/edit $ NoteEdit :id |n1 :text |Updated
                  decode-operation $ parse-cirru-edn $ format-cirru-edn
                    Op :note/edit $ NoteEdit :id |n1 :text |Updated
              :tags $ #{} :server
            %{} 'TestEntry (:name |accepts-message-removal-ids)
              :code $ quote $ let
                  expected $ Result :ok $ Op :session/remove-message |m1
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
                assert= (Result :ok operation)
                  decode-operation $ :: :router/change $ {} (:name :notes)
                    :data $ {} (:year 2026) (:month 8)
                assert= (Result :ok operation)
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
                  operation $ Op :states
                    decode-map-as cursor $ List app.schema/StateKey
                    , state
                assert= (Result :ok operation)
                  decode-operation $ :: :states cursor state
                assert= (Result :ok operation)
                  decode-operation $ parse-cirru-edn $ format-cirru-edn operation
                assert=
                  Result :ok $ Op :states ([]) nil
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
            %{} 'TestEntry (:name |preserves-message-id-decoder-errors)
              :code $ quote $ let
                  check-id! $ fn (value)
                    hint-fn $ Fn Dynamic $ -> Unit
                    match (try-decode-map-as value 'String)
                      (:err message)
                        assert=
                          invalid-message $ str "|Invalid session/remove-message operation: " message
                          decode-operation $ :: :session/remove-message $ {} (:id value) (:extra |kept)
                      (:ok _) (raise |Expected-invalid-message-id)
                    , &unit
                check-id! nil
                check-id! false
                check-id! 0
                check-id! true
                check-id! :invalid
                check-id! $ []
                check-id! $ {}
                match (try-decode-map-as nil 'String)
                  (:err message)
                    assert=
                      invalid-message $ str "|Invalid session/remove-message operation: " message
                      decode-operation $ :: :session/remove-message $ {}
                  (:ok _) (raise |Expected-missing-message-id)
                assert=
                  Result :ok $ Op :session/remove-message |
                  decode-operation $ :: :session/remove-message |
                assert=
                  Result :ok $ Op :session/remove-message |
                  decode-operation $ :: :session/remove-message $ {} (:id |)
              :tags $ #{} :client :option-leaf-contract :server
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
          :schema $ quote $ Fn Dynamic
            -> $ Result Route String
          :tests $ [] $ %{} 'TestEntry (:name |validates-route-shapes)
            :code $ quote $ do
              assert=
                Result :ok $ Route :home
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
                match (calcit.core/get data :name)
                  (:some selected-route-name)
                    match selected-route-name
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
                  (:none) (Result :err |Unknown-route)
                Result :err |Expected-route-map
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ Result Route String
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
                    hint-fn $ Fn Dynamic $ -> Unit
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
            %{} 'TestEntry (:name |preserves-route-name-selection)
              :code $ quote $ let
                  check-name! $ fn (value)
                    hint-fn $ Fn Dynamic $ -> Unit
                    assert= (Result :err |Unknown-route)
                      decode-route-map $ {} $ :name value
                    , &unit
                assert= (Result :err |Unknown-route)
                  decode-route-map $ {}
                check-name! nil
                check-name! false
                check-name! 0
                check-name! |
                check-name! |home
                check-name! :unknown
                check-name! $ []
                check-name! $ {}
                assert=
                  Result :ok $ Route :home
                  decode-route-map $ {} (:name :home) (:data 7)
                assert=
                  Result :ok $ Route :profile
                  decode-route-map $ {} (:name :profile) (:data false)
              :tags $ #{} :client :option-condition-contract :server
        'decode-server-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-server-message (data)
            let
                message $ if (enum? data)
                  assoc data 0 $ turn-tag $ .unwrap (nth data 0)
                  , data
              match message
                (:snapshot revision store)
                  if
                    and (number? revision) (map? store)
                    match
                      try-decode-map-as store $ Map Tag Dynamic
                      (:ok decoded-store)
                        Result :ok $ ServerMessage :snapshot revision decoded-store
                      (:err reason)
                        invalid-message $ str "|Invalid snapshot envelope: " reason
                    invalid-message $ str "|Invalid snapshot envelope: " message
                (:patch base-revision revision changes)
                  if
                    and (number? base-revision) (number? revision)
                    match
                      try-decode-map-as changes $ List recollect.schema/change-op
                      (:ok decoded-list)
                        Result :ok $ ServerMessage :patch base-revision revision decoded-list
                      (:err reason)
                        invalid-message $ str "|Invalid patch envelope: " reason
                    invalid-message $ str "|Invalid patch envelope: " message
                (:effect/pong)
                  Result :ok $ ServerMessage :effect/pong
                _ $ invalid-message $ str "|Unknown server message: " message
          :examples $ []
          :schema $ quote $ Fn Input
            -> $ Result ServerMessage MessageDecodeError
            :generics Input
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
              :code $ quote $ do
                assert=
                  Result :ok $ ServerMessage :snapshot 2 $ {} (:a 1)
                  decode-server-message $ ServerMessage :snapshot 2 $ {} (:a 1)
                assert= true $ result:err? $ decode-server-message
                  :: :snapshot 2 $ {} $ |unexpected 1
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
          :schema $ quote $ Fn T
            -> $ Result TaskRecord String
            :generics T
          :tests $ []
            %{} 'TestEntry (:name |legacy-nil-time-to-option)
              :code $ quote $ assert= true
                match
                  decode-task-record $ {} (:id |x) (:text |ok) (:detail |) (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
                  (:ok task)
                    and
                      = |x $ :id task
                      let
                          expected-none None
                        assert-type expected-none $ Option Number
                        = expected-none $ :created-time task
                      let
                          expected-none None
                        assert-type expected-none $ Option Number
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
                          expected-none None
                        assert-type expected-none $ Option Number
                        = expected-none $ :created-time task
                      let
                          expected-none None
                        assert-type expected-none $ Option Number
                        = expected-none $ :touched-time task
                      let
                          expected-none None
                        assert-type expected-none $ Option Number
                        = expected-none $ :finished-time task
                      let
                          expected-none None
                        assert-type expected-none $ Option Number
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
                            if (nil? value) (.dissoc entry field) entry
                          (:none) (.dissoc entry field)
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
          :schema $ quote $ Fn T
            -> $ Result UserRecord String
            :generics T
          :tests $ []
            %{} 'TestEntry (:name |defaults-legacy-optional-fields)
              :code $ quote $ assert= true
                match
                  decode-user-record $ {} (:id |u1) (:name |Alice) (:nickname nil) (:avatar nil) (:password nil)
                  (:ok user)
                    and
                      = |u1 $ :id user
                      let
                          expected-none None
                        assert-type expected-none $ Option String
                        = expected-none $ :password user
                      let
                          expected-none None
                        assert-type expected-none $ Option String
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
                        expected-none None
                      assert-type expected-none $ Option Number
                      = expected-none $ :created-time $ .unwrap
                        calcit.core/get
                          :working $ :tasks user
                          , |t1
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
                        expected-none None
                      assert-type expected-none $ Option Number
                      = expected-none $ :updated-time $ .unwrap
                        calcit.core/get (:notes user) |n1
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
          :schema $ quote DatabaseRecord
        'invalid-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn invalid-message (detail)
            Result :err $ MessageDecodeError :invalid detail
          :examples $ []
          :schema $ quote $ Fn String
            -> $ Result T MessageDecodeError
            :generics T
          :tests $ [] $ %{} 'TestEntry (:name |preserves-error-payload)
            :code $ quote $ let
                result $ invalid-message |invalid-envelope
              assert-type result $ Result Number MessageDecodeError
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
                      assert-type seed $ Result (Map String UserRecord) String
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
          :schema $ quote $ Fn Dynamic
            -> $ Result DatabaseRecord String
          :tests $ []
            %{} 'TestEntry (:name |empty-legacy)
              :code $ quote $ assert= (Result :ok empty-database)
                load-database $ {}
              :tags $ #{} :server
            %{} 'TestEntry (:name |legacy-round-trip)
              :code $ quote $ let
                  db $ struct-with (test-database)
                    :sessions $ {}
                  text $ format-cirru-edn $ database-to-map db
                assert= (Result :ok db)
                  load-database $ parse-cirru-edn text
              :tags $ #{} :server
            %{} 'TestEntry
              :name |ignores-extra-legacy-metadata-without-mutating-input
              :code $ quote $ let
                  db $ struct-with (test-database)
                    :sessions $ {}
                  raw $ assoc (database-to-map db) :extra 7
                assert= (Result :ok db) (load-database raw)
                assert= (Some 7) (get raw :extra)
              :tags $ #{} :server
            %{} 'TestEntry (:name |preserves-validation-error-order)
              :code $ quote $ do
                assert= (Result :err "|storage.cirru/:today expected String")
                  load-database $ {} (:today 0) (:sessions nil) (:users false)
                assert= (Result :err "|storage.cirru/:sessions expected Map")
                  load-database $ {} (:today |) (:sessions nil) (:users false)
                assert= (Result :err "|storage.cirru/:users expected Map")
                  load-database $ {} (:today |)
                    :sessions $ {}
                    :users false
              :tags $ #{} :server
        'new-session $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn new-session (sid)
            SessionRecord :id sid :user-id None :nickname None :router (Route :home) :messages $ {}
          :examples $ []
          :schema $ quote $ Fn Number (-> SessionRecord)
        'normalize-note-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-note-map (raw)
            if (map? raw)
              &map:fold-kv raw ({})
                fn (acc key value)
                  assoc acc key $ normalize-note-record value
              , raw
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic)
        'normalize-note-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-note-record (raw)
            if (map? raw)
              match (calcit.core/get raw :updated-time)
                (:some value)
                  if (nil? value) (.dissoc raw :updated-time) raw
                (:none) (.dissoc raw :updated-time)
              , raw
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic)
        'normalize-task-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-task-map (raw)
            if (map? raw)
              &map:fold-kv raw ({})
                fn (acc key value)
                  assoc acc key $ normalize-task-record value
              , raw
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic)
        'normalize-task-record $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn normalize-task-record (raw)
            if (map? raw)
              foldl ([] :created-time :touched-time :finished-time :archived-time) raw $ fn (entry field)
                match (calcit.core/get entry field)
                  (:some value)
                    if (nil? value) (.dissoc entry field) entry
                  (:none) (.dissoc entry field)
              , raw
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic)
          :tests $ []
            %{} 'TestEntry (:name |preserves-present-values-and-removes-legacy-nil)
              :code $ quote $ let
                  raw $ {} (:id |task) (:created-time 0) (:touched-time nil) (:finished-time false) (:extra |preserved)
                  normalized $ normalize-task-record raw
                assert=
                  {} (:id |task) (:created-time 0) (:finished-time false) (:extra |preserved)
                  , normalized
                assert= (Some nil) (get raw :touched-time)
                assert= None $ get normalized :touched-time
                assert= None $ get normalized :archived-time
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
              &map:fold-kv raw ({})
                fn (acc key value)
                  assoc acc key $ normalize-task-map value
              , raw
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic)
        'note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def note
            {} (:id nil) (:time nil) (:updated-time nil) (:text nil)
          :examples $ []
          :schema $ quote Dynamic
        'note-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn note-to-map (note)
            assoc-legacy-optional
              {}
                :id $ :id note
                :text $ :text note
                :time $ :time note
              , :updated-time $ :updated-time note
          :examples $ []
          :schema $ quote $ Fn NoteRecord
            -> $ Map Tag Dynamic
        'notification $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def notification
            {} (:id nil) (:kind nil) (:text nil)
          :examples $ []
          :schema $ quote Dynamic
        'read-path $ %{} 'CodeEntry
          :doc "|Legacy Map-only wire-path adapter. An empty path returns the value unchanged; missing keys and non-Map intermediates return nil, while false, zero, empty text and nil keys remain valid values/keys. Do not replace this with the throwing get-in walker or an eager concrete decoder. Callers decode at their actual typed consumer."
          :code $ quote $ defn read-path (base path)
            match (destruct-list path)
              (:none) (Some base)
              (:some field tail)
                if (map? base)
                  match (get base field)
                    (:some value) (recur value tail)
                    (:none) None
                  , None
          :examples $ []
          :schema $ quote $ Fn Dynamic (List Dynamic)
            -> $ Option Dynamic
          :tests $ []
            %{} 'TestEntry (:name |handles-non-map-boundaries)
              :code $ quote $ do
                assert= (Some 1)
                  read-path
                    {} $ :a $ {} (:b 1)
                    [] :a :b
                assert= None $ read-path
                  {} $ :a |not-a-map
                  [] :a :b
                assert= (Some |leaf)
                  read-path |leaf $ []
              :tags $ #{} :server
            %{} 'TestEntry (:name |mixed-keys-and-falsey-leaves)
              :code $ quote $ do
                assert= (Some false)
                  read-path
                    {} $ :sessions $ {}
                      7 $ {} $ |visible false
                    [] :sessions 7 |visible
                assert= (Some nil)
                  read-path
                    {} $ :sessions $ {}
                      7 $ {} $ |visible nil
                    [] :sessions 7 |visible
                assert= None $ read-path ({}) ([] :missing)
                assert= (Some false)
                  read-path false $ []
              :tags $ #{} :server
            %{} 'TestEntry (:name |preserves-nil-key-and-nil-intermediate-contract)
              :code $ quote $ do
                assert= (Some |nil-key)
                  read-path
                    {} $ :users $ {} (nil |nil-key)
                    [] :users nil
                assert= None $ read-path
                  {} $ :users nil
                  [] :users nil
                assert= (Some false)
                  read-path
                    {} $ :users $ {} (nil false)
                    [] :users nil
                assert= (Some 0)
                  read-path
                    {} $ :users $ {} (nil 0)
                    [] :users nil
                assert= (Some |)
                  read-path
                    {} $ :users $ {} (nil |)
                    [] :users nil
              :tags $ #{} :option-wire-contract :server
        'route-operation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn route-operation (data)
            match (decode-route data)
              (:ok route) (Op :router/change route)
              (:err message)
                raise $ str |Invalid-route: message
          :examples $ []
          :schema $ quote $ Fn Route (-> Op)
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
          :schema $ quote $ Fn Route
            -> $ Map Tag Dynamic
        'router $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def router
            {} (:name nil) (:title nil)
              :data $ {}
              :router nil
          :examples $ []
          :schema $ quote Dynamic
        'session $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def session
            {} (:user-id nil) (:id nil) (:nickname nil)
              :router $ {} (:name :home) (:data nil) (:router nil)
              :messages $ {}
          :examples $ []
          :schema $ quote Dynamic
        'session-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn session-to-map (session)
            assoc-legacy-optional
              assoc-legacy-optional
                {}
                  :id $ :id session
                  :router $ route-to-map $ :router session
                  :messages $ filter-map-kv (:messages session)
                    fn (k v)
                      MapEntryDecision :keep k $ &struct:to-map v
                , :user-id $ :user-id session
              , :nickname $ :nickname session
          :examples $ []
          :schema $ quote $ Fn SessionRecord
            -> $ Map Tag Dynamic
        'task $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def task
            {} (:id nil) (:text |) (:detail |) (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
          :examples $ []
          :schema $ quote Dynamic
        'task-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn task-to-map (task)
            assoc-legacy-optional
              assoc-legacy-optional
                assoc-legacy-optional
                  assoc-legacy-optional
                    {}
                      :id $ :id task
                      :text $ :text task
                      :detail $ :detail task
                      :pending? $ :pending? task
                    , :created-time $ :created-time task
                  , :touched-time $ :touched-time task
                , :finished-time $ :finished-time task
              , :archived-time $ :archived-time task
          :examples $ []
          :schema $ quote $ Fn TaskRecord
            -> $ Map Tag Dynamic
        'test-database $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn test-database ()
            let
                tasks $ UserTasks :working
                  {}
                    |t1 $ TaskRecord :id |t1 :text |one :detail | :pending? false
                    |t2 $ TaskRecord :id |t2 :text |two :detail | :pending? true
                  , :pending ({}) :finished $ {}
                user-record $ UserRecord :id |u1 :name |Alice :nickname None :avatar None :password None :tasks tasks :notes $ {}
                session-record $ struct-with (new-session 7)
                  :user-id $ Some |u1
                  :messages $ {}
                    |m1 $ NotificationRecord :id |m1 :text |remove
                    |m2 $ NotificationRecord :id |m2 :text |keep
              DatabaseRecord :today |2026-09-26 :users
                {} $ |u1 user-record
                , :sessions $ {} (7 session-record)
                  8 $ new-session 8
          :examples $ []
          :schema $ quote $ Fn (-> DatabaseRecord)
        'update-session $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-session (db sid f)
            match
              get (:sessions db) sid
              (:none) db
              (:some session-record)
                struct-with db $ :sessions $ assoc (:sessions db) sid (f session-record)
          :examples $ []
          :schema $ quote $ Fn DatabaseRecord Number
            Fn SessionRecord $ -> SessionRecord
            -> DatabaseRecord
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
          :schema $ quote $ Fn DatabaseRecord Number
            Fn UserRecord $ -> UserRecord
            -> DatabaseRecord
        'user $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def user
            {} (:name nil) (:id nil) (:nickname nil) (:avatar nil) (:password nil)
              :tasks $ {}
                :working $ do task $ {}
                :pending $ {}
                :finished $ {}
              :notes $ do note $ {}
          :examples $ []
          :schema $ quote Dynamic
        'user-to-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn user-to-map (user)
            assoc-legacy-optional
              assoc-legacy-optional
                assoc-legacy-optional
                  {}
                    :id $ :id user
                    :name $ :name user
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
                  , :nickname $ :nickname user
                , :avatar $ :avatar user
              , :password $ :password user
          :examples $ []
          :schema $ quote $ Fn UserRecord
            -> $ Map Tag Dynamic
        'validate-stored-users $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn validate-stored-users (users)
            let
                seed $ Result :ok users
              assert-type seed $ Result (Map String T) String
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
          :schema $ quote $ Fn (Map String T)
            -> $ Result (Map String T) String
            :generics T
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
          :schema $ quote $ Ref
            Map Number $ Map Tag Dynamic
        '*client-states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *client-states ({})
          :examples $ []
          :schema $ quote $ Ref (Map Number ClientSyncState)
        '*dirty-clients $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *dirty-clients (#{})
          :examples $ []
          :schema $ quote $ Ref (Set Number)
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
                    , schema/DatabaseRecord
                println |[storage] |loading storage-file |bytes $ count raw-data
                println |[storage] |loaded storage-file |users $ count $ :users loaded-db
                , loaded-db
              do (println |[storage] |missing storage-file) schema/empty-database
          :examples $ []
          :schema $ quote $ Ref schema/DatabaseRecord
        '*reader-reel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *reader-reel @*reel
          :examples $ []
          :schema $ quote $ Ref (ReelState schema/DatabaseRecord)
        '*reel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *reel
            ReelState :base @*initial-db :db @*initial-db :records ([]) :merged? false
          :examples $ []
          :schema $ quote $ Ref (ReelState schema/DatabaseRecord)
        '*sync-metrics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-metrics
            SyncMetrics :last-diff-latency-ms 0 :last-patch-bytes 0 :pending-clients 0 :slow-clients 0 :resync-count 0 :patch-attempts 0 :snapshot-attempts 0 :last-revision 0
          :examples $ []
          :schema $ quote $ Ref SyncMetrics
        '*sync-retry-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-retry-scheduled? false
          :examples $ []
          :schema $ quote $ Ref Bool
        '*sync-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-revision 0
          :examples $ []
          :schema $ quote $ Ref Number
        '*sync-scheduled? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *sync-scheduled? false
          :examples $ []
          :schema $ quote $ Ref Bool
        'ClientSyncState $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct ClientSyncState (:status Tag) (:last-heartbeat Number) (:acked-rev Number) (:dirty-rev Number) (:in-flight? Bool) (:needs-snapshot? Bool) (:slow-client? Bool)
            :sent-rev $ Option Number
            :sent-store $ Option $ Map Tag Dynamic
            :last-send-outcome $ Option Tag
          :examples $ []
          :schema $ quote StructDef
        'SyncMetrics $ %{} 'CodeEntry
          :doc "|Process-lifetime synchronization counters with read-time client gauges."
          :code $ quote $ defstruct SyncMetrics (:last-diff-latency-ms Number) (:last-patch-bytes Number) (:pending-clients Number) (:slow-clients Number) (:resync-count Number) (:patch-attempts Number) (:snapshot-attempts Number) (:last-revision Number)
          :examples $ []
          :schema $ quote StructDef
        'acknowledge-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn acknowledge-client! (sid revision)
            let
                state $
                  get @*client-states sid
                  , .unwrap
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
          :schema $ quote $ Fn Number Number (-> Unit) (:features :io :state)
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
                      assert= pending $
                        get stale-states 1
                        , .unwrap
                      assert=
                        {} $ 1 new-store
                        , accepted-caches
                      assert= (next-sync-ack-state pending 7)
                        (get accepted-states 1) .unwrap
                      assert= empty-sync-state $
                        get accepted-states 2
                        , .unwrap
                      assert= accepted-caches duplicate-caches
                      assert= accepted-states duplicate-states
              :tags $ #{} :server
        'current-date! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn current-date! ()
            unsafe-coerce
              %{} Date0 $ :date $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |now_bang
              , 'calcit.std.date/Date0
          :examples $ []
          :schema $ quote $ Fn (-> Date0) (:features :js-ffi)
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
          :schema $ quote $ Fn schema/Op Number (-> Unit) (:features :io :state)
          :tests $ [] $ %{} 'TestEntry (:name |ping-to-absent-peer-returns-unit)
            :code $ quote $ assert= &unit
              dispatch! (schema/Op :effect/ping) 2147483000
            :tags $ #{} :server
        'empty-sync-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def empty-sync-state
            ClientSyncState :status :idle :last-heartbeat 0 :acked-rev 0 :dirty-rev 0 :in-flight? false :needs-snapshot? true :slow-client? false :sent-rev None :sent-store None :last-send-outcome None
          :examples $ []
          :schema $ quote ClientSyncState
        'get-backup-path! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn get-backup-path! ()
            let
                now $ extract-time $ current-date!
              join-path calcit-dirname |backups
                match (calcit.core/get now :month)
                  (:some value) (str value)
                  (:none) (str nil)
                match (calcit.core/get now :day)
                  (:some value) (str value |-snapshot.cirru)
                  (:none) (str nil |-snapshot.cirru)
          :examples $ []
          :schema $ quote $ Fn (-> String)
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
          :schema $ quote $ Fn schema/ClientMessage Number (-> Unit) (:features :io :state)
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
          :schema $ quote $ Fn Number Number (Map Tag Dynamic) WssSendOutcome (-> Unit) (:features :io :state)
          :tests $ [] $ %{} 'TestEntry (:name |all-outcomes-return-unit)
            :code $ quote $ let
                previous-states @*client-states
                previous-dirty @*dirty-clients
                previous-retry @*sync-retry-scheduled?
                store $ decode-map-as ({}) (Map Tag Dynamic)
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
                    :sent-rev None
                    :sent-store None
                let
                    state $
                      get @*client-states sid
                      , .unwrap
                  when
                    = :active $ :status state
                    swap! *dirty-clients include sid
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :state)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            println "|Running mode:" $ if config/dev? |dev |release
            let
                p? $ get-env |port
                port $ p? .fold
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
          :schema $ quote $ Fn (-> FfiTask) (:features :io :state)
        'mark-client-active! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mark-client-active! (sid client-revision force-snapshot?)
            let
                state $
                  get @*client-states sid
                  , .unwrap-or $ struct-with empty-sync-state (:dirty-rev @*sync-revision)
                resumed? $ or force-snapshot? $ not= :active (:status state)
                next-state-base $ struct-with state (:status :active)
                  :last-heartbeat $ now-ms
                  :acked-rev $ if resumed? client-revision $ :acked-rev state
                  :in-flight? $ if resumed? false $ :in-flight? state
                  :needs-snapshot? $ or resumed? $ :needs-snapshot? state
                next-state $ if resumed?
                  struct-with next-state-base (:sent-rev None) (:sent-store None)
                  , next-state-base
              swap! *client-states assoc sid next-state
              when resumed? (swap! *client-caches dissoc sid) (swap! *dirty-clients include sid) (request-sync!)
            , &unit
          :examples $ []
          :schema $ quote $ Fn Number Number Bool (-> Unit) (:features :io :state)
        'mark-client-idle! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mark-client-idle! (sid client-revision)
            when
              .some? $ get @*client-states sid
              swap! *client-states update sid $ fn (state)
                struct-with
                  struct-with state (:status :idle) (:acked-rev client-revision) (:in-flight? false) (:needs-snapshot? true)
                  :sent-rev None
                  :sent-store None
              swap! *client-caches dissoc sid
              swap! *dirty-clients exclude sid
            , &unit
          :examples $ []
          :schema $ quote $ Fn Number Number (-> Unit) (:features :state)
        'mark-clients-dirty! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mark-clients-dirty! (revision)
            each (keys @*client-states)
              fn (sid)
                let
                    state $
                      get @*client-states sid
                      , .unwrap
                  swap! *client-states set-client-dirty-revision sid revision
                  when
                    = :active $ :status state
                    swap! *dirty-clients include sid
          :examples $ []
          :schema $ quote $ Fn Number (-> Unit) (:features :state)
        'next-sync-ack-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn next-sync-ack-state (current revision)
            struct-with
              struct-with current (:acked-rev revision) (:in-flight? false)
              :sent-rev None
              :sent-store None
          :examples $ []
          :schema $ quote $ Fn ClientSyncState Number (-> ClientSyncState)
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
                  :last-send-outcome $ Some :accepted
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
          :schema $ quote $ Fn SyncMetrics Tag Number Number String (-> SyncMetrics)
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
                  :sent-rev $ Some revision
                  :sent-store $ Some new-store
                  :in-flight? true
                  :needs-snapshot? false
                  :slow-client? false
                  :last-send-outcome $ Some :accepted
              (:backpressured)
                struct-with current
                  :dirty-rev $ let
                      current-dirty $ :dirty-rev current
                    if (> revision current-dirty) revision current-dirty
                  :slow-client? true
                  :last-send-outcome $ Some :backpressured
              (:too-large)
                struct-with current (:needs-snapshot? true) (:slow-client? true)
                  :last-send-outcome $ Some :too-large
              (:closed)
                struct-with
                  struct-with current (:status :idle) (:in-flight? false)
                    :last-send-outcome $ Some :closed
                  :sent-rev None
                  :sent-store None
          :examples $ []
          :schema $ quote $ Fn ClientSyncState Number (Map Tag Dynamic) WssSendOutcome (-> ClientSyncState)
          :tests $ []
            %{} 'TestEntry (:name |accepted-records-pending-store)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :active)
                  :sent-rev $ Some 7
                  :sent-store $ Some $ {} (:value 1)
                  :in-flight? true
                  :needs-snapshot? false
                  :slow-client? false
                  :last-send-outcome $ Some :accepted
                next-sync-send-state
                  struct-with empty-sync-state $ :status :active
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :accepted
              :tags $ #{} :server
            %{} 'TestEntry (:name |oversized-payload-requires-snapshot)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :active) (:needs-snapshot? true) (:slow-client? true)
                  :last-send-outcome $ Some :too-large
                next-sync-send-state
                  struct-with empty-sync-state $ :status :active
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :too-large
              :tags $ #{} :server
            %{} 'TestEntry (:name |closed-clears-pending-send)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :idle) (:in-flight? false)
                  :last-send-outcome $ Some :closed
                next-sync-send-state
                  struct-with empty-sync-state (:status :active) (:in-flight? true)
                    :sent-rev $ Some 7
                    :sent-store $ Some $ {} (:value 1)
                  , 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :closed
              :tags $ #{} :server
            %{} 'TestEntry (:name |backpressure-preserves-latest-dirty-revision)
              :code $ quote $ assert=
                struct-with empty-sync-state (:status :active) (:acked-rev 5) (:dirty-rev 7) (:slow-client? true)
                  :last-send-outcome $ Some :backpressured
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
          :schema $ quote $ Fn (-> Number)
        'on-exit! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-exit! () (persist-db!) (; println "|exit code is...") (quit! 0)
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :state)
        'patch-operation-limit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def patch-operation-limit 64
          :examples $ []
          :schema $ quote Number
        'persist-db! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn persist-db! ()
            let
                db $ assert-type (:db @*reel) schema/DatabaseRecord
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
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
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
          :schema $ quote $ Fn (-> SyncMetrics) (:features :state)
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
          :schema $ quote $ Fn (-> Unit) (:features :state)
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
          :schema $ quote $ Fn Tag Number Number String (-> Unit) (:features :state)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (println "|Code updated..")
            if (not config/dev?) (raise "|reloading only happens in dev mode")
            clear-twig-caches!
            reset! *reel $ refresh-reel @*reel @*initial-db replay-updater
            invalidate-sync-caches!
            request-sync!
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :state)
        'render-loop! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-loop! ()
            when
              not $ identical? @*reader-reel @*reel
              reset! *reader-reel @*reel
              swap! *sync-revision inc
              mark-clients-dirty! @*sync-revision
            sync-clients! @*reader-reel
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :state)
        'request-sync! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-sync! ()
            if @*sync-scheduled? &unit $ do (reset! *sync-scheduled? true)
              set-timeout! sync-coalesce-delay $ fn () (reset! *sync-scheduled? false) (render-loop!)
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :state)
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
          :schema $ quote $ Fn (-> Unit) (:features :io :state)
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
              (get-env |WSS_BIND_ADDRESS) .unwrap-or |0.0.0.0
            , &unit
          :examples $ []
          :schema $ quote $ Fn Number (-> Unit) (:features :io :state)
        'set-client-dirty-revision $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-client-dirty-revision (states sid revision)
            let
                state $
                  get states sid
                  , .unwrap
              assoc states sid $ struct-with state $ :dirty-rev revision
          :examples $ []
          :schema $ quote $ Fn (Map Number ClientSyncState) Number Number
            -> $ Map Number ClientSyncState
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
                state $
                  get states sid
                  , .unwrap
              assoc states sid $ struct-with state $ :last-heartbeat timestamp
          :examples $ []
          :schema $ quote $ Fn (Map Number ClientSyncState) Number Number
            -> $ Map Number ClientSyncState
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
          :schema $ quote $ Fn (Map Number ClientSyncState) Number Number (Map Tag Dynamic) WssSendOutcome
            -> $ Map Number ClientSyncState
          :tests $ []
            %{} 'TestEntry (:name |accepted-update-preserves-other-client)
              :code $ quote $ let
                  states $ {}
                    1 $ struct-with empty-sync-state $ :status :active
                    2 $ struct-with empty-sync-state $ :status :idle
                  next $ set-client-send-state states 1 7
                    {} $ :value 1
                    %:: wss.core/WssSendOutcome :accepted
                assert= 7 $ .unwrap $ :sent-rev
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
                assert= false $ .some? $ :sent-rev
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
                today $ format-time (current-date!) (Some |%Y-%m-%d)
                reel @*reel
                old-today $ :today $ assert-type (:db reel) schema/DatabaseRecord
              when (not= today old-today)
                dispatch! (schema/Op :today today) 0
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :state)
        'storage-file $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def storage-file
            if (empty? calcit-dirname) (:storage-file config/site)
              join-path calcit-dirname $ :storage-file config/site
          :examples $ []
          :schema $ quote String
        'sync-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sync-client! (sid reel revision) (swap! *dirty-clients exclude sid)
            let
                state $
                  get @*client-states sid
                  , .unwrap
              when
                and
                  = :active $ :status state
                  not $ :in-flight? state
                let
                    db $ schema/database-to-map $ :db reel
                    records $ :records reel
                    session $ .unwrap-or
                      schema/read-path db $ [] :sessions sid
                      , schema/session
                    old-store-option $ get @*client-caches sid
                    new-store $ twig-container db session records
                    needs-snapshot? $ or (:needs-snapshot? state) (.none? old-store-option)
                    diff-start $ now-ms
                    changes $ if needs-snapshot? ([])
                      diff-twig (.unwrap old-store-option) new-store $ {} $ :key :id
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
          :schema $ quote $ Fn Number (ReelState schema/DatabaseRecord) Number (-> Unit) (:features :io :state)
        'sync-clients! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sync-clients! (reel)
            when
              not $ empty? @*dirty-clients
              let
                  revision @*sync-revision
                  clients @*dirty-clients
                each clients $ fn (sid)
                  when
                    .some? $ get @*client-states sid
                    sync-client! sid reel revision
            , &unit
          :examples $ []
          :schema $ quote $ Fn (ReelState schema/DatabaseRecord) (-> Unit) (:features :io :state)
        'sync-coalesce-delay $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def sync-coalesce-delay 16
          :examples $ []
          :schema $ quote Number
        'sync-retry-delay $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def sync-retry-delay 200
          :examples $ []
          :schema $ quote Number
        'touch-client! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn touch-client! (sid client-revision)
            let
                state $
                  get @*client-states sid
                  , .unwrap
              if
                = :active $ :status state
                swap! *client-states set-client-last-heartbeat sid $ now-ms
                mark-client-active! sid client-revision true
            , &unit
          :examples $ []
          :schema $ quote $ Fn Number Number (-> Unit) (:features :io :state)
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
          :schema $ quote $ Map Tag respo-ui.schema/StyleValue
        'link $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def link
            {} (:text-decoration :underline) (:cursor :pointer)
              :color $ hsl 240 80 80
              :font-family ui/font-fancy
          :examples $ []
          :schema $ quote $ Map Tag respo.schema/CssValue
        'merge-styles $ %{} 'CodeEntry
          :doc "|Combines heterogeneous Respo style maps at the rendering boundary."
          :code $ quote $ defn merge-styles (x0 & xs) (reduce xs x0 &merge)
          :examples $ []
          :schema $ quote $ Fn (Map Tag respo-ui.schema/StyleValue)
            & $ Map Tag respo-ui.schema/StyleValue
            -> $ Map Tag respo-ui.schema/StyleValue
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.style
          :require
            respo-ui.core :refer $ hsl
            respo-ui.core :as ui
    'app.twig.container $ %{} 'FileEntry
      :defs $ {}
        'parse-date $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn parse-date (time format)
            unsafe-coerce
              %{} Date0 $ :date $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |parse_time time format
              , 'calcit.std.date/Date0
          :examples $ []
          :schema $ quote $ Fn String String (-> Date0) (:features :js-ffi)
        'twig-container $ %{} 'CodeEntry
          :doc "|Project the existing client wire Map. Retain the router Option until its consumer: logged-out wire fields preserve opaque values and explicit nil, while logged-in routing decodes Map after the user boundary. The legacy today/week fields and nil-capable user-key path remain wire/path adapters, not typed business defaults; client consumers validate them separately."
          :code $ quote $ defn twig-container (db session records)
            let
                session-data $ if (map? session) session schema/session
                user-id $ calcit.core/get session-data :user-id
                logged-in? $ match user-id
                  (:some value) (non-nil? value)
                  (:none) false
                router-option $ calcit.core/get session-data :router
                base-data $ schema/assoc-legacy-optional
                  {} (:logged-in? logged-in?) (:session session-data)
                    :reel-length $ .len records
                  , :router router-option
              merge base-data $ decode-map-as
                if logged-in?
                  let
                      user $ match
                        schema/read-path db $ [] :users $ .unwrap user-id
                        (:some value)
                          decode-map-as value $ Map Tag Dynamic
                        (:none)
                          decode-map-as nil $ Map Tag Dynamic
                      router $ match router-option
                        (:some value) (decode-map-as value 'Map)
                        (:none) (decode-map-as nil 'Map)
                    schema/assoc-legacy-optional
                      {}
                        :user $ twig-user user
                        :router $ assoc router :data $ match (calcit.core/get router :name)
                          (:some selected-route-name)
                            match selected-route-name
                              :home $ schema/assoc-legacy-optional ({}) :tasks $ schema/read-path user ([] :tasks :working)
                              :history $ schema/assoc-legacy-optional
                                {} $ :tasks $ twig-tasks-by-week
                                  match (calcit.core/get router :data)
                                    (:some value) (decode-map-as value 'app.schema/HistoryRoute)
                                    (:none) (decode-map-as nil 'app.schema/HistoryRoute)
                                  match
                                    schema/read-path user $ [] :tasks :finished
                                    (:some value)
                                      decode-map-as value $ Map String $ Map Tag Dynamic
                                    (:none)
                                      decode-map-as nil $ Map String $ Map Tag Dynamic
                                , :week $ calcit.core/get router :data
                              :notes $ twig-notes-by-month
                                match (calcit.core/get router :data)
                                  (:some value) (decode-map-as value 'app.schema/NotesRoute)
                                  (:none) (decode-map-as nil 'app.schema/NotesRoute)
                                decode-map-as
                                  match (calcit.core/get user :notes)
                                    (:some notes-value)
                                      if (map? notes-value) notes-value $ {}
                                    (:none) ({})
                                  Map String $ Map Tag Dynamic
                              :profile $ twig-members
                                match (calcit.core/get db :sessions)
                                  (:some value)
                                    decode-map-as value $ Map Dynamic $ Map Tag Dynamic
                                  (:none)
                                    decode-map-as nil $ Map Dynamic $ Map Tag Dynamic
                                match (calcit.core/get db :users)
                                  (:some value)
                                    decode-map-as value $ Map String $ Map Tag Dynamic
                                  (:none)
                                    decode-map-as nil $ Map String $ Map Tag Dynamic
                              _ $ {}
                          (:none) ({})
                        :count $ count $ match (calcit.core/get db :sessions)
                          (:some value) (decode-map-as value 'Map)
                          (:none) (decode-map-as nil 'Map)
                        :color $ rand-hex-color!
                      , :today $ get db :today
                  {}
                Map Tag Dynamic
          :examples $ []
          :schema $ quote $ Fn (Map Tag D) S (List R)
            -> $ Map Tag Dynamic
            :generics D S R
          :tests $ []
            %{} 'TestEntry (:name |defaults-missing-session)
              :code $ quote $ let
                  init-db $ decode-map-as ({}) (Map Tag Dynamic)
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
                    decode-map-as db $ Map Tag Dynamic
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
                    decode-map-as db $ Map Tag Dynamic
                    , session $ []
                  notes $ .unwrap $ schema/read-path twig ([] :router :data)
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
                    decode-map-as db $ Map Tag Dynamic
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
                    decode-map-as schema/database $ Map Tag Dynamic
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
                        decode-map-as db $ Map Tag Dynamic
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
                    decode-map-as db $ Map Tag Dynamic
                    , session $ []
                assert=
                  {} (7 |Alice) (:guest "|访客") (|legacy |Alice)
                  .unwrap $ schema/read-path twig $ [] :router :data
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
                        decode-map-as db $ Map Tag Dynamic
                        , session $ []
                      , false
                    fn (message) true
                assert= true failed?
              :tags $ #{} :server
            %{} 'TestEntry (:name |preserves-legacy-notes-map-boundary)
              :code $ quote $ let
                  base-user $ decode-map-as
                    {} (:id |u1) (:name |Alice)
                    Map Tag Dynamic
                  session $ assoc (assoc schema/session :user-id |u1) :router $ {} (:name :notes)
                    :data $ {} (:year 2026) (:month 8)
                  check-user! $ fn (user)
                    hint-fn $ Fn (Map Tag Dynamic) (-> Unit)
                    let
                        db $ decode-map-as
                          assoc-in schema/database ([] :users |u1) user
                          Map Tag Dynamic
                        twig $ twig-container db session $ []
                      assert= ({})
                        .unwrap $ schema/read-path twig $ [] :router :data
                    , &unit
                check-user! base-user
                check-user! $ assoc base-user :notes nil
                check-user! $ assoc base-user :notes false
                check-user! $ assoc base-user :notes 0
                check-user! $ assoc base-user :notes |
                check-user! $ assoc base-user :notes $ []
                check-user! $ assoc base-user :notes $ {}
              :tags $ #{} :option-leaf-contract :server
            %{} 'TestEntry (:name |preserves-logged-out-router-wire)
              :code $ quote $ let
                  db $ decode-map-as schema/database $ Map Tag Dynamic
                  base $ decode-map-as ({}) (Map Tag Dynamic)
                  check-router! $ fn (session expected)
                    hint-fn $ Fn (Map Tag Dynamic) Dynamic $ -> Unit
                    let
                        twig $ twig-container db session $ []
                      assert= (Some expected) (get twig :router)
                      assert= (Some session) (get twig :session)
                      assert= (Some false) (get twig :logged-in?)
                    , &unit
                check-router! base nil
                check-router! (assoc base :router nil) nil
                check-router! (assoc base :router false) false
                check-router! (assoc base :router 0) 0
                check-router! (assoc base :router |) |
                check-router!
                  assoc base :router $ [] 1
                  [] 1
                check-router!
                  assoc base :router $ {} $ :extension 7
                  {} $ :extension 7
              :tags $ #{} :option-wire-contract :server
            %{} 'TestEntry
              :name |preserves-router-validation-order-and-today-wire
              :code $ quote $ let
                  db $ decode-map-as
                    assoc-in schema/database ([] :users |u1) (assoc schema/user :id |u1)
                    Map Tag Dynamic
                  session $ assoc schema/session :user-id |u1
                  check-router-error! $ fn (candidate raw)
                    hint-fn $ Fn (Map Tag Dynamic) Dynamic $ -> Unit
                    let
                        map-error $ try (decode-map-as raw 'Map)
                          fn (message) message
                      assert= map-error $ try
                        do
                          twig-container db candidate $ []
                          raise |Expected-router-error
                        fn (message) message
                    , &unit
                  valid-session $ assoc session :router $ {} (:name :future-route)
                  check-today! $ fn (candidate expected)
                    hint-fn $ Fn (Map Tag Dynamic) Dynamic $ -> Unit
                    let
                        twig $ twig-container candidate valid-session $ []
                      assert= (Some expected) (get twig :today)
                    , &unit
                check-router-error! (dissoc session :router) nil
                check-router-error! (assoc session :router nil) nil
                check-router-error! (assoc session :router false) false
                check-router-error! (assoc session :router 0) 0
                check-router-error! (assoc session :router |) |
                check-router-error!
                  assoc session :router $ []
                  []
                let
                    user-error $ try
                      decode-map-as nil $ Map Tag Dynamic
                      fn (message) message
                  assert= user-error $ try
                    do
                      twig-container
                        assoc db :users $ {}
                        assoc session :router 7
                        []
                      raise |Expected-user-error
                    fn (message) message
                check-today! (dissoc db :today) nil
                check-today! (assoc db :today nil) nil
                check-today! (assoc db :today false) false
                check-today! (assoc db :today 0) 0
                check-today! (assoc db :today |) |
              :tags $ #{} :option-wire-contract :server
        'twig-members $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-members (sessions users)
            -> sessions $ filter-map-kv $ fn (k session)
              hint-fn $ Fn K (Map Tag S)
                -> $ MapEntryDecision K String
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
          :schema $ quote $ Fn
            Map K $ Map Tag S
            Map String $ Map Tag U
            -> $ Map K String
            :generics K S U
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
                    Map Number $ Map Tag Dynamic
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
                    Map String $ Map Tag Dynamic
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
                    Map Number $ Map Tag Dynamic
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
                    hint-fn $ Fn Dynamic $ -> Unit
                    assert=
                      try (decode-map-as value 'String)
                        fn (message) message
                      try
                        twig-members
                          {} $ 7 $ {} (:user-id |alice)
                          decode-map-as
                            {} $ |alice $ {} (:name value)
                            Map String $ Map Tag Dynamic
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
                      fields $ decode-map-as task $ Map Tag Dynamic
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
          :schema $ quote $ Fn schema/NotesRoute (Map K N)
            -> $ Map K N
            :generics K N
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
                      fields $ decode-map-as task $ Map Tag Dynamic
                      t $ match (calcit.core/get fields :finished-time)
                        (:some value) (decode-map-as value 'Number)
                        (:none) (decode-map-as nil 'Number)
                    and
                      &> t $ get-timestamp start-time
                      &< t $ get-timestamp end-time
          :examples $ []
          :schema $ quote $ Fn schema/HistoryRoute (Map K T)
            -> $ Map K T
            :generics K T
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
          :schema $ quote Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.twig.container
          :require
            app.twig.user :refer $ twig-user
            calcit.std.rand :refer $ rand-hex-color!
            app.schema :as schema
            calcit.std.date :refer $ Date0 extract-time from-ywd from-ymd format-time get-timestamp
            calcit.std.util :refer $ get-dylib-path
    'app.twig.user $ %{} 'FileEntry
      :defs $ {} $ 'twig-user
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn twig-user (user)
            -> user (.dissoc :password) (.dissoc :tasks)
          :examples $ []
          :schema $ quote $ Fn (Map Tag V)
            -> $ Map Tag V
            :generics V
          :tests $ [] $ %{} 'TestEntry (:name |omits-private-and-task-fields)
            :code $ quote $ assert=
              {} $ :name |Alice
              twig-user $ {} (:name |Alice) (:password |secret)
                :tasks $ {}
            :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.twig.user
          :require $ recollect.twig :refer $ deftwig
    'app.updater $ %{} 'FileEntry
      :defs $ {}
        'replay-updater $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn replay-updater (db op sid op-id op-time)
            updater db (decode-map-as op 'app.schema/Op) (decode-map-as sid 'Number) (decode-map-as op-id 'String) (decode-map-as op-time 'Number)
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord Dynamic Dynamic Dynamic Dynamic (-> schema/DatabaseRecord) (:features :io)
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
          :schema $ quote $ Fn schema/DatabaseRecord schema/Op Number String Number (-> schema/DatabaseRecord) (:features :io)
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
                assert= (Some |edited)
                  schema/read-path legacy $ [] :users |u1 :tasks :working |t1 :text
                assert= (Some 6)
                  schema/read-path legacy $ [] :users |u1 :tasks :working |t1 :touched-time
                assert= (Some |new-note)
                  schema/read-path legacy $ [] :users |u1 :notes |n1 :text
                assert= (Some |u1)
                  schema/read-path (schema/database-to-map logged-in) ([] :sessions 7 :user-id)
                assert= None $ schema/read-path (schema/database-to-map removed) ([] :users |u1 :notes |n1)
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
                assert= (Some nil)
                  schema/read-path legacy $ [] :sessions 7 :user-id
                assert= 1 $ count $ :users duplicate
                assert= (Some "|Wrong password for Alice")
                  schema/read-path legacy $ [] :sessions 7 :messages |wrong :text
                assert= (Some "|Name is taken: Alice")
                  schema/read-path legacy $ [] :sessions 7 :messages |duplicate :text
                assert= signed $ updater signed (schema/Op :task/touch-working |absent) 7 |op 6
                assert= signed $ updater signed (schema/Op :task/pend |absent) 7 |op 6
                assert= signed $ updater signed (schema/Op :task/finish-working |absent) 7 |op 6
                assert= signed $ updater signed
                  schema/Op :note/edit $ schema/NoteEdit :id |absent :text |x
                  , 7 |op 6
              :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require (app.updater.session :as session) (app.updater.user :as user) (app.updater.router :as router) (app.updater.misc :as misc) (app.updater.task :as task) (app.updater.note :as note) (app.schema :as schema)
            respo-message.updater :refer $ update-messages
    'app.updater.misc $ %{} 'FileEntry
      :defs $ {} $ 'set-today
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-today (db op-data sid op-id op-time)
            struct-with db $ :today op-data
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
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
                    , schema/DatabaseRecord
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
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              struct-with user-record $ :notes $ assoc (:notes user-record) op-id (schema/NoteRecord :id op-id :text op-data :time op-time)
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
        'edit-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn edit-note (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              match
                get (:notes user-record) (:id op-data)
                (:none) user-record
                (:some note)
                  struct-with user-record $ :notes $ assoc (:notes user-record) (:id op-data)
                    struct-with note $ :text $ :text op-data
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord schema/NoteEdit Number String Number (-> schema/DatabaseRecord)
        'remove-note $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-note (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              struct-with user-record $ :notes $ .dissoc (:notes user-record) op-data
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.note
          :require $ app.schema :as schema
    'app.updater.router $ %{} 'FileEntry
      :defs $ {} $ 'change
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn change (db op-data sid op-id op-time)
            schema/update-session db sid $ fn (session-record)
              hint-fn $ Fn schema/SessionRecord $ -> schema/SessionRecord
              struct-with session-record $ :router op-data
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord schema/Route Number String Number (-> schema/DatabaseRecord)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.router
          :require $ app.schema :as schema
    'app.updater.session $ %{} 'FileEntry
      :defs $ {}
        'connect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn connect (db sid op-id op-time)
            struct-with db $ :sessions $ assoc (:sessions db) sid (schema/new-session sid)
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord Number String Number (-> schema/DatabaseRecord)
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
                Some $ schema/new-session 9
                get (:sessions updated) 9
            :tags $ #{} :server
        'disconnect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn disconnect (db sid op-id op-time)
            struct-with db $ :sessions $ .dissoc (:sessions db) sid
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord Number String Number (-> schema/DatabaseRecord)
          :tests $ [] $ %{} 'TestEntry (:name |removes-only-target-session)
            :code $ quote $ let
                db $ schema/test-database
                updated $ disconnect db 7 |op 1
              assert= None $ get (:sessions updated) 7
              assert=
                get (:sessions db) 8
                get (:sessions updated) 8
              assert= (:users db) (:users updated)
            :tags $ #{} :server
        'remove-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-message (db op-data sid op-id op-time)
            schema/update-session db sid $ fn (session-record)
              hint-fn $ Fn schema/SessionRecord $ -> schema/SessionRecord
              struct-with session-record $ :messages $ .dissoc (:messages session-record) op-data
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
          :tests $ []
            %{} 'TestEntry (:name |removes-only-target-session-message)
              :code $ quote $ let
                  db $ schema/test-database
                  updated $ remove-message db |m1 7 |op 1
                  session-record $
                    get (:sessions updated) 7
                    , .unwrap
                assert= None $ get (:messages session-record) |m1
                assert=
                  Some $ schema/NotificationRecord :id |m2 :text |keep
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
          :require $ app.schema :as schema
    'app.updater.task $ %{} 'FileEntry
      :defs $ {}
        'create-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn create-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              let
                  tasks $ :tasks user-record
                  task $ schema/TaskRecord :id op-id :text op-data :detail | :pending? false :created-time $ Some op-time
                struct-with user-record $ :tasks $ struct-with tasks
                  :working $ assoc (:working tasks) op-id task
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
        'finish-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn finish-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              let
                  tasks $ :tasks user-record
                match
                  get (:working tasks) op-data
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :working $ .dissoc (:working tasks) op-data
                      :finished $ assoc (:finished tasks) op-data $ struct-with task
                        :finished-time $ Some op-time
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
        'pend $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn pend (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
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
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
          :tests $ [] $ %{} 'TestEntry (:name |toggles-pending-and-preserves-other-tasks)
            :code $ quote $ let
                db $ schema/test-database
                once $ pend db |t1 7 |op1 1
                twice $ pend once |t1 7 |op2 2
                legacy $ schema/database-to-map once
              assert= (Some true)
                schema/read-path legacy $ [] :users |u1 :tasks :working |t1 :pending?
              assert= db twice
              assert= (Some true)
                schema/read-path (schema/database-to-map twice) ([] :users |u1 :tasks :working |t2 :pending?)
            :tags $ #{} :server
        'put-back $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn put-back (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              let
                  tasks $ :tasks user-record
                match
                  get (:finished tasks) op-data
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :finished $ .dissoc (:finished tasks) op-data
                      :working $ assoc (:working tasks) op-data $ struct-with task
                        :touched-time $ Some op-time
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
        'remove-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              let
                  tasks $ :tasks user-record
                struct-with user-record $ :tasks $ struct-with tasks
                  :working $ .dissoc (:working tasks) op-data
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
          :tests $ [] $ %{} 'TestEntry (:name |removes-only-new-fixture-task)
            :code $ quote $ let
                db $ schema/test-database
                updated $ schema/database-to-map $ remove-working db |t1 7 |op 1
                original $ schema/database-to-map db
              assert= None $ schema/read-path updated $ [] :users |u1 :tasks :working |t1
              assert=
                schema/read-path original $ [] :users |u1 :tasks :working |t2
                schema/read-path updated $ [] :users |u1 :tasks :working |t2
            :tags $ #{} :server
        'touch-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn touch-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
              let
                  tasks $ :tasks user-record
                  id op-data
                match
                  get (:working tasks) id
                  (:none) user-record
                  (:some task)
                    struct-with user-record $ :tasks $ struct-with tasks
                      :working $ assoc (:working tasks) id $ struct-with task
                        :touched-time $ Some op-time
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord String Number String Number (-> schema/DatabaseRecord)
        'update-working $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-working (db op-data sid op-id op-time)
            schema/update-user db sid $ fn (user-record)
              hint-fn $ Fn schema/UserRecord $ -> schema/UserRecord
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
          :schema $ quote $ Fn schema/DatabaseRecord schema/TaskEdit Number String Number (-> schema/DatabaseRecord)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.task
          :require $ app.schema :as schema
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
                      hint-fn $ Fn schema/UserRecord $ -> Bool
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
                        hint-fn $ Fn schema/SessionRecord $ -> schema/SessionRecord
                        struct-with session-record $ :user-id $ Some (:id user-record)
                      schema/add-session-message db sid op-id $ str "|Wrong password for " username
              , db
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord (List String) Number String Number (-> schema/DatabaseRecord)
        'log-out $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn log-out (db sid op-id op-time)
            schema/update-session db sid $ fn (session-record)
              hint-fn $ Fn schema/SessionRecord $ -> schema/SessionRecord
              struct-with session-record $ :user-id None
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord Number String Number (-> schema/DatabaseRecord)
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
                      hint-fn $ Fn schema/UserRecord $ -> Bool
                      = username $ :name user-record
                match existing
                  (:some _)
                    schema/add-session-message db sid op-id $ str "|Name is taken: " username
                  (:none)
                    let
                        user-record $ schema/UserRecord :id op-id :name username :nickname (Some username) :avatar None :password
                          Some $ md5 password
                          , :tasks
                            schema/UserTasks :working ({}) :pending ({}) :finished $ {}
                            , :notes $ {}
                        with-user $ struct-with db $ :users
                          assoc (:users db) op-id user-record
                      schema/update-session with-user sid $ fn (session-record)
                        hint-fn $ Fn schema/SessionRecord $ -> schema/SessionRecord
                        struct-with session-record $ :user-id $ Some op-id
              , db
          :examples $ []
          :schema $ quote $ Fn schema/DatabaseRecord (List String) Number String Number (-> schema/DatabaseRecord)
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
              assert= (Some |u1) (:user-id session-record)
              assert= ({}) (:notes user-record)
              assert= ({})
                :working $ :tasks user-record
              assert= ({})
                :finished $ :tasks user-record
            :tags $ #{} :server
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater.user
          :require
            cumulo-util.core :refer $ find-first
            calcit.std.hash :refer $ md5
            app.schema :as schema
