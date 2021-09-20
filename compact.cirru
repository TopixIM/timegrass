
{} (:package |app)
  :configs $ {} (:init-fn |app.server/main!) (:reload-fn |app.server/reload!)
    :modules $ [] |respo.calcit/ |lilac/ |recollect/ |memof/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo-markdown.calcit/
    :version nil
  :files $ {}
    |app.comp.container $ {}
      :ns $ quote
        ns app.comp.container $ :require
          [] hsl.core :refer $ [] hsl
          [] respo-ui.core :as ui
          [] respo.core :refer $ [] defcomp <> >> div span button
          [] respo.comp.inspect :refer $ [] comp-inspect
          [] respo.comp.space :refer $ [] =<
          [] app.comp.navigation :refer $ [] comp-navigation
          [] app.comp.profile :refer $ [] comp-profile
          [] app.comp.login :refer $ [] comp-login
          [] respo-message.comp.messages :refer $ [] comp-messages
          [] cumulo-reel.comp.reel :refer $ [] comp-reel
          [] app.config :refer $ [] dev?
          [] app.schema :as schema
          [] app.comp.overview :refer $ [] comp-overview
          [] app.config :as config
          [] app.comp.history :refer $ [] comp-history
          [] app.comp.notes-page :refer $ [] comp-notes-page
      :defs $ {}
        |comp-container $ quote
          defcomp comp-container (states store)
            let
                state $ :data states
                session $ :session store
                router $ :router store
                router-data $ :data router
              if (nil? store) (comp-offline)
                div
                  {} $ :style (merge ui/global ui/fullscreen ui/column)
                  comp-navigation (:logged-in? store) (:count store) (:name router)
                  if (:logged-in? store)
                    case-default (:name router)
                      <> $ str "\"404 page:" router
                      :home $ comp-overview (>> states :overview) (:today store)
                        get-in router $ [] :data :tasks
                      :history $ comp-history (>> states :history)
                        get-in router $ [] :data :week
                        get-in router $ [] :data :tasks
                      :notes $ comp-notes-page (>> states :notes) (:data router)
                        get-in session $ [] :router :data
                      :profile $ comp-profile (:user store) (:data router)
                    comp-login $ >> states :login
                  comp-status-color $ :color store
                  when dev? $ comp-inspect |Store store
                    {} (:bottom 0) (:left 0) (:z-index 9999)
                  comp-messages
                    get-in store $ [] :session :messages
                    {}
                    fn (info d! m!) (d! :session/remove-message info)
                  when dev? $ comp-reel (:reel-length store) ({})
        |comp-offline $ quote
          defcomp comp-offline () $ div
            {} $ :style
              merge ui/global ui/fullscreen ui/column-dispersive $ {}
                :background-color $ :theme config/site
            div $ {}
              :style $ {} (:height 0)
            div $ {}
              :style $ {}
                :background-image $ str "\"url(" (:icon config/site) "\")"
                :width 128
                :height 128
                :background-size :contain
            span
              {}
                :style $ {} (:cursor :pointer)
                :on-click $ fn (e d!) (d! :effect/connect nil)
              <> "|Socket broken! Click to retry." $ {} (:font-family ui/font-fancy) (:font-weight 100) (:font-size 24)
        |comp-status-color $ quote
          defcomp comp-status-color (color)
            div $ {}
              :style $ {} (:width 16) (:height 16) (:position :absolute) (:bottom 16) (:right 8) (:background-color color) (:border-radius "\"8px") (:opacity 0.8)
        |style-body $ quote
          def style-body $ {} (:padding "|8px 16px")
    |app.schema $ {}
      :ns $ quote (ns app.schema)
      :defs $ {}
        |notification $ quote
          def notification $ {} (:id nil) (:kind nil) (:text nil)
        |note $ quote
          def note $ {} (:id nil) (:time nil) (:updated-time nil) (:text nil)
        |task $ quote
          def task $ {} (:id nil) (:text "\"") (:detail "\"") (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
        |user $ quote
          def user $ {} (:name nil) (:id nil) (:nickname nil) (:avatar nil) (:password nil)
            :tasks $ {}
              :working $ do task ({})
              :pending $ {}
              :finished $ {}
            :notes $ do note ({})
        |session $ quote
          def session $ {} (:user-id nil) (:id nil) (:nickname nil)
            :router $ {} (:name :home) (:data nil) (:router nil)
            :messages $ {}
        |complain $ quote
          def complain $ {} (:id nil) (:text "\"") (:time nil)
        |database $ quote
          def database $ {}
            :sessions $ do session ({})
            :users $ do user ({})
            :today "\"2018-08-07"
        |router $ quote
          def router $ {} (:name nil) (:title nil)
            :data $ {}
            :router nil
    |app.server $ {}
      :ns $ quote
        ns app.server $ :require (app.schema :as schema)
          app.updater :refer $ updater
          cljs.reader :refer $ read-string
          cumulo-reel.core :refer $ reel-reducer refresh-reel reel-schema
          "\"fs" :as fs
          "\"path" :as path
          app.config :as config
          cumulo-util.file :refer $ write-mildly! get-backup-path! merge-local-edn!
          cumulo-util.core :refer $ id! repeat! unix-time! delay!
          app.twig.container :refer $ twig-container
          recollect.diff :refer $ diff-twig
          ws-edn.server :refer $ wss-serve! wss-send! wss-each!
          recollect.twig :refer $ new-twig-loop! clear-twig-caches!
          "\"dayjs" :default dayjs
          "\"dayjs/plugin/weekOfYear" :default week-of-year
      :defs $ {}
        |*initial-db $ quote
          defatom *initial-db $ merge-local-edn! schema/database storage-file
            fn (found?)
              if found? (println "\"Found local EDN data") (println "\"Found no data")
        |persist-db! $ quote
          defn persist-db! () $ let
              file-content $ format-cirru-edn
                assoc (:db @*reel) :sessions $ {}
              storage-path storage-file
              backup-path $ get-backup-path!
            write-mildly! storage-path file-content
            write-mildly! backup-path file-content
        |sync-clients! $ quote
          defn sync-clients! (reel)
            wss-each! $ fn (sid socket)
              let
                  db $ :db reel
                  records $ :records reel
                  session $ get-in db ([] :sessions sid)
                  old-store $ or (get @*client-caches sid) nil
                  new-store $ twig-container db session records
                  changes $ diff-twig old-store new-store
                    {} $ :key :id
                when config/dev? $ println "\"Changes for" sid "\":" changes (count records)
                if
                  not= changes $ []
                  do
                    wss-send! sid $ {} (:kind :patch) (:data changes)
                    swap! *client-caches assoc sid new-store
            new-twig-loop!
        |storage-file $ quote
          def storage-file $ path/join js/__dirname (:storage-file config/site)
        |*reader-reel $ quote (defatom *reader-reel @*reel)
        |set-today! $ quote
          defn set-today! () $ let
              today $ .!format (dayjs) "\"YYYY-MM-DD"
              old-today $ :today (:db @*reel)
            when (not= today old-today) (dispatch! :today today "\"system")
        |*reel $ quote
          defatom *reel $ merge reel-schema
            {} (:base @*initial-db) (:db @*initial-db)
        |*proxied-dispatch! $ quote (defatom *proxied-dispatch! dispatch!)
        |main! $ quote
          defn main! () (.!extend dayjs week-of-year)
            println "\"Running mode:" $ if config/dev? "\"dev" "\"release"
            let
                port $ if (some? js/process.env.port) (js/parseInt js/process.env.port) (:port config/site)
              run-server! port
              println $ str "\"Server started on port:" port
            render-loop! *loop-trigger
            js/process.on "\"SIGINT" on-exit!
            repeat! 600 $ fn () (persist-db!)
            set-today!
            repeat! 60 $ fn () (set-today!)
        |*loop-trigger $ quote (defatom *loop-trigger 0)
        |on-exit! $ quote
          defn on-exit! (code _) (persist-db!)
            ; println "\"exit code is:" $ pr-str code
            js/process.exit
        |dispatch! $ quote
          defn dispatch! (op op-data sid)
            let
                op-id $ id!
                op-time $ unix-time!
              if config/dev? $ println "\"Dispatch!" (str op) op-data sid
              if (= op :effect/persist) (persist-db!)
                reset! *reel $ reel-reducer @*reel updater op op-data sid op-id op-time config/dev?
        |run-server! $ quote
          defn run-server! (port)
            wss-serve! port $ {}
              :on-open $ fn (sid socket) (@*proxied-dispatch! :session/connect nil sid) (println "\"New client.")
              :on-data $ fn (sid action)
                case-default (:kind action) (println "\"unknown action:" action)
                  :op $ @*proxied-dispatch! (:op action) (:data action) sid
              :on-close $ fn (sid event) (println "\"Client closed!") (@*proxied-dispatch! :session/disconnect nil sid)
              :on-error $ fn (error) (js/console.error error)
        |render-loop! $ quote
          defn render-loop! (*loop)
            when
              not $ identical? @*reader-reel @*reel
              reset! *reader-reel @*reel
              sync-clients! @*reader-reel
            reset! *loop $ delay! 0.2
              fn () $ render-loop! *loop
        |*client-caches $ quote
          defatom *client-caches $ {}
        |reload! $ quote
          defn reload! () (println "\"Code updated.") (clear-twig-caches!) (reset! *proxied-dispatch! dispatch!)
            reset! *reel $ refresh-reel @*reel @*initial-db updater
            js/clearTimeout @*loop-trigger
            render-loop! *loop-trigger
            sync-clients! @*reader-reel
    |app.twig.container $ {}
      :ns $ quote
        ns app.twig.container $ :require
          [] app.twig.user :refer $ [] twig-user
          [] "\"randomcolor" :as color
          [] "\"dayjs" :default dayjs
      :defs $ {}
        |twig-notes-by-month $ quote
          defn twig-notes-by-month (data notes)
            let
                year $ :year data
                month $ :month data
              -> notes (.to-map)
                .map-kv $ fn (k task)
                  let
                      time $ dayjs (:time task)
                    if
                      and
                        = year $ .year time
                        = month $ .month time
                      [] k task
                      , nil
        |twig-container $ quote
          defn twig-container (db session records)
            let
                logged-in? $ some? (:user-id session)
                router $ :router session
                base-data $ {} (:logged-in? logged-in?) (:session session)
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
                  :color $ color/randomColor
                  :today $ :today db
                , nil
        |twig-tasks-by-week $ quote
          defn twig-tasks-by-week (data tasks)
            let
                filter-year $ :year data
                filter-week $ :week data
              -> tasks $ .map-kv
                fn (k task)
                  let
                      time $ dayjs (:finished-time task)
                      year $ .year time
                      month $ .month time
                      w $ .week time
                      week $ if
                        and (= month 11)
                          > (.date time) 25
                        inc $ .week (.subtract time 7 "\"day")
                        , w
                    if
                      and (= filter-year year) (= filter-week week)
                      [] k task
                      , nil
        |twig-members $ quote
          defn twig-members (sessions users)
            -> sessions $ .map-kv
              fn (k session)
                [] k $ get-in users
                  [] (:user-id session) :name
    |app.updater $ {}
      :ns $ quote
        ns app.updater $ :require ([] app.updater.session :as session) ([] app.updater.user :as user) ([] app.updater.router :as router) ([] app.updater.misc :as misc) ([] app.updater.task :as task) ([] app.updater.note :as note) ([] app.schema :as schema)
          [] respo-message.updater :refer $ [] update-messages
      :defs $ {}
        |updater $ quote
          defn updater (db op op-data sid op-id op-time)
            let
                f $ case-default op
                  do (println "\"Unknown op:" op)
                    fn (& args) db
                  :today misc/set-today
                  :session/connect session/connect
                  :session/disconnect session/disconnect
                  :session/remove-message session/remove-message
                  :user/log-in user/log-in
                  :user/sign-up user/sign-up
                  :user/log-out user/log-out
                  :router/change router/change
                  :task/create-working task/create-working
                  :task/remove-working task/remove-working
                  :task/finish-working task/finish-working
                  :task/update-working task/update-working
                  :task/touch-working task/touch-working
                  :task/put-back task/put-back
                  :task/pend task/pend
                  :note/add note/add-note
                  :note/edit note/edit-note
                  :note/remove note/remove-note
              f db op-data sid op-id op-time
    |app.twig.user $ {}
      :ns $ quote
        ns app.twig.user $ :require
          [] recollect.twig :refer $ [] deftwig
      :defs $ {}
        |twig-user $ quote
          defn twig-user (user)
            -> user (dissoc :password) (dissoc :tasks)
    |app.comp.notes-page $ {}
      :ns $ quote
        ns app.comp.notes-page $ :require
          [] respo-ui.core :refer $ [] hsl
          [] app.schema :as schema
          [] respo-ui.core :as ui
          [] respo.core :refer $ [] defcomp list-> >> <> span div button a
          [] respo.comp.space :refer $ [] =<
          [] app.config :as config
          [] respo-alerts.core :refer $ [] use-prompt use-confirm
          [] feather.core :refer $ [] comp-i comp-icon
          [] "\"dayjs" :default dayjs
      :defs $ {}
        |comp-note $ quote
          defcomp comp-note (states note)
            let
                edit-plugin $ use-prompt (>> states :edit)
                  {} (:text "\"Update note:") (:multiline? true)
                    :initial $ :text note
                remove-plugin $ use-confirm (>> states :remove)
                  {} $ :text "\"Sure to delete note?"
              div
                {} $ :style
                  merge ui/column $ {}
                    :border-top $ str "\"1px solid " (hsl 0 0 94)
                    :padding "\"4px 8px"
                div
                  {} $ :style ui/row-parted
                  <>
                    -> (:time note) dayjs $ .format "\"HH:mm"
                    {} (:font-family ui/font-fancy)
                      :color $ hsl 0 0 70
                      :font-size 12
                  =< 8 nil
                  div
                    {} $ :style ui/row-middle
                    comp-icon :edit
                      &{} :font-size 16 :curspr :pointer :color $ hsl 200 80 80
                      fn (e d!)
                        .show edit-plugin d! $ fn (result)
                          d! :note/edit $ {}
                            :id $ :id note
                            :text result
                    =< 8 nil
                    comp-icon :delete
                      &{} :font-size 16 :cursor :pointer :color $ hsl 10 80 60
                      fn (e d!)
                        .show remove-plugin d! $ fn ()
                          d! :note/remove $ :id note
                <> $ :text note
                .render edit-plugin
                .render remove-plugin
        |comp-notes-page $ quote
          defcomp comp-notes-page (states notes info)
            let
                year $ :year info
                month $ :month info
                add-plugin $ use-prompt (>> states :add)
                  {} (:text "\"Add note about today's work:") (:multiline? true)
              div
                {} $ :style
                  merge ui/expand $ {} (:padding 16)
                div
                  {} $ :style
                    {} (:max-width 800) (:margin :auto)
                  div
                    {} $ :style
                      merge ui/row-parted $ {} (:margin "\"8px 0")
                    span
                      {} $ :style ui/row-middle
                      <> "\"Notes" $ {}
                        :color $ hsl 0 0 50
                        :font-family ui/font-fancy
                        :font-size 16
                      =< 16 nil
                      comp-icon :plus
                        &{} :font-size 16 :color (hsl 200 80 80) :cursor :pointer
                        fn (e d!)
                          .show add-plugin d! $ fn (result) (d! :note/add result)
                    div
                      {} $ :style ui/row-middle
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
                        str (inc month) "\"th month of " year "\"."
                        {} (:font-family ui/font-fancy)
                          :color $ hsl 0 0 50
                  if (empty? notes)
                    div
                      {} $ :style
                        merge ui/center $ {} (:min-height 120)
                      <> "\"No notes" $ {} (:font-family ui/font-fancy)
                        :color $ hsl 0 0 80
                    let
                        grouped-notes $ -> notes (.to-list)
                          .group-by $ fn (pair)
                            ->
                              :time $ last pair
                              dayjs
                              .format "\"MM-DD"
                          .to-list
                          .sort $ fn (x y)
                            &compare (first y) (first x)
                      list-> ({})
                        -> grouped-notes (.to-list)
                          .map-pair $ fn (date notes-in-day)
                            [] date $ div
                              {} $ :style
                                {} $ :margin-top 16
                              div
                                {} $ :style
                                  {} (:font-family ui/font-fancy) (:font-size 14) (:font-weight 500)
                                <> $ -> (str year "\"-" date) dayjs (.format "\"ddd")
                                =< 12 nil
                                <> $ str date
                              list->
                                {} $ :style ui/column
                                -> notes-in-day
                                  .sort-by $ fn (pair)
                                    negate $ :time (last pair)
                                  .map-pair $ fn (k note)
                                    [] k $ comp-note (>> states k) note
                  =< nil 160
                .render add-plugin
    |app.updater.misc $ {}
      :ns $ quote (ns app.updater.misc)
      :defs $ {}
        |set-today $ quote
          defn set-today (db op-data sid op-id op-time) (assoc db :today op-data)
    |app.updater.note $ {}
      :ns $ quote
        ns app.updater.note $ :require ([] app.schema :as schema)
      :defs $ {}
        |edit-note $ quote
          defn edit-note (db op-data sid op-id op-time)
            let
                session $ get-in db ([] :sessions sid)
                user-id $ :user-id session
                note-id $ :id op-data
                text $ :text op-data
              update-in db ([] :users user-id :notes note-id)
                fn (note) (assoc note :text text)
        |add-note $ quote
          defn add-note (db op-data sid op-id op-time)
            let
                session $ get-in db ([] :sessions sid)
                user-id $ :user-id session
                new-note $ merge schema/note
                  {} (:id op-id) (:time op-time) (:text op-data)
              assoc-in db ([] :users user-id :notes op-id) new-note
        |remove-note $ quote
          defn remove-note (db op-data sid op-id op-time)
            let
                session $ get-in db ([] :sessions sid)
                user-id $ :user-id session
              update-in db ([] :users user-id :notes)
                fn (notes) (dissoc notes op-data)
    |app.updater.task $ {}
      :ns $ quote
        ns app.updater.task $ :require ([] app.schema :as schema)
      :defs $ {}
        |pend $ quote
          defn pend (db op-data sid op-id op-time)
            let
                user-id $ get-in db ([] :sessions sid :user-id)
              update-in db ([] :users user-id :tasks :working op-data :pending?) not
        |remove-working $ quote
          defn remove-working (db op-data sid op-id op-time)
            let
                user-id $ get-in db ([] :sessions sid :user-id)
              update-in db ([] :users user-id :tasks :working)
                fn (tasks) (dissoc tasks op-data)
        |touch-working $ quote
          defn touch-working (db op-data sid op-id op-time)
            let
                user-id $ get-in db ([] :sessions sid :user-id)
              update-in db ([] :users user-id :tasks :working op-data)
                fn (task)
                  if (some? task) (assoc task :touched-time op-time) nil
        |put-back $ quote
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
        |finish-working $ quote
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
        |update-working $ quote
          defn update-working (db op-data sid op-id op-time)
            let
                user-id $ get-in db ([] :sessions sid :user-id)
              update-in db
                [] :users user-id :tasks :working $ :id op-data
                fn (task)
                  if (some? task)
                    assoc task :text $ :text op-data
                    , nil
        |create-working $ quote
          defn create-working (db op-data sid op-id op-time)
            let
                user-id $ get-in db ([] :sessions sid :user-id)
              assoc-in db ([] :users user-id :tasks :working op-id)
                merge schema/task $ {} (:id op-id) (:text op-data) (:created-time op-time)
    |app.updater.user $ {}
      :ns $ quote
        ns app.updater.user $ :require
          [] cumulo-util.core :refer $ [] find-first
          [] "\"md5" :default md5
      :defs $ {}
        |sign-up $ quote
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
                      :text $ str "\"Name is taken: " username
                -> db
                  assoc-in ([] :sessions sid :user-id) op-id
                  assoc-in ([] :users op-id)
                    {} (:id op-id) (:name username) (:nickname username)
                      :password $ md5 password
                      :avatar nil
        |log-out $ quote
          defn log-out (db op-data sid op-id op-time)
            assoc-in db ([] :sessions sid :user-id) nil
        |log-in $ quote
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
                          :text $ str "\"Wrong password for " username
                    update session :messages $ fn (messages)
                      assoc messages op-id $ {} (:id op-id)
                        :text $ str "\"No user named: " username
    |app.comp.profile $ {}
      :ns $ quote
        ns app.comp.profile $ :require
          [] respo-ui.core :refer $ [] hsl
          [] app.schema :as schema
          [] respo-ui.core :as ui
          [] respo.core :refer $ [] defcomp list-> <> span div button
          [] respo.comp.space :refer $ [] =<
          [] app.config :as config
      :defs $ {}
        |comp-profile $ quote
          defcomp comp-profile (user members)
            div
              :style $ merge ui/flex
                {} $ :padding 16
              div
                {} $ :style
                  {} (:max-width 800) (:margin :auto)
                div
                  {} $ :style
                    {} (:font-family ui/font-fancy) (:font-size 32) (:font-weight 100)
                  <> $ str "|Hello! " (:name user)
                =< nil 16
                div
                  {} $ :style ui/row
                  <> "\"Members:"
                  =< 8 nil
                  list->
                    {} $ :style ui/row
                    -> members (.to-list)
                      .map-pair $ fn (k username)
                        [] k $ div
                          {} $ :style
                            {} (:padding "\"0 8px")
                              :border $ str "\"1px solid " (hsl 0 0 80)
                              :border-radius "\"16px"
                              :margin "\"0 4px"
                          <> username
                =< nil 48
                div ({})
                  button
                    {}
                      :style $ merge ui/button
                      :on-click $ fn (e d! m!)
                        .replace js/location $ str js/location.origin "\"?time=" (.now js/Date)
                    <> "\"Refresh"
                  =< 16 nil
                  button
                    {}
                      :style $ merge ui/button
                        {} (:color :red) (:border-color :red)
                      :on-click $ fn (e dispatch! mutate!) (dispatch! :user/log-out nil)
                        .removeItem js/localStorage $ :storage-key config/site
                    <> "\"Log out"
    |app.comp.login $ {}
      :ns $ quote
        ns app.comp.login $ :require
          [] respo.core :refer $ [] defcomp <> div input button span
          [] respo.comp.space :refer $ [] =<
          [] respo.comp.inspect :refer $ [] comp-inspect
          [] respo-ui.core :as ui
          [] app.schema :as schema
          [] app.style :as style
          [] app.config :as config
      :defs $ {}
        |initial-state $ quote
          def initial-state $ {} (:username |) (:password |)
        |comp-login $ quote
          defcomp comp-login (states)
            let
                cursor $ :cursor states
                state $ or (:data states) initial-state
              div
                {} $ :style (merge ui/flex ui/center)
                div ({})
                  div
                    {} $ :style ({})
                    div ({})
                      input $ {} (:placeholder |Username)
                        :value $ :username state
                        :style ui/input
                        :on-input $ fn (e d!)
                          d! cursor $ assoc state :username (:value e)
                    =< nil 8
                    div ({})
                      input $ {} (:placeholder |Password)
                        :value $ :password state
                        :style ui/input
                        :on-input $ fn (e d!)
                          d! cursor $ assoc state :password (:value e)
                  =< nil 8
                  div
                    {} $ :style
                      {} $ :text-align :right
                    span $ {} (:inner-text "|Sign up")
                      :style $ merge style/link
                      :on-click $ on-submit (:username state) (:password state) true
                    =< 8 nil
                    span $ {} (:inner-text "|Log in")
                      :style $ merge style/link
                      :on-click $ on-submit (:username state) (:password state) false
        |on-submit $ quote
          defn on-submit (username password signup?)
            fn (e dispatch!)
              dispatch! (if signup? :user/sign-up :user/log-in) ([] username password)
              .setItem js/localStorage (:storage-key config/site)
                format-cirru-edn $ [] username password
    |app.style $ {}
      :ns $ quote
        ns app.style $ :require
          [] respo-ui.core :refer $ [] hsl
          [] respo-ui.core :as ui
      :defs $ {}
        |link $ quote
          def link $ {} (:text-decoration :underline) (:cursor :pointer)
            :color $ hsl 240 80 80
            :font-family ui/font-fancy
        |button $ quote
          def button $ merge ui/button
            {} $ :background-color :white
    |app.comp.navigation $ {}
      :ns $ quote
        ns app.comp.navigation $ :require
          [] respo-ui.core :refer $ [] hsl
          [] respo-ui.core :as ui
          [] respo.comp.space :refer $ [] =<
          [] respo.core :refer $ [] defcomp <> >> span div
          [] app.config :as config
          [] respo-alerts.core :refer $ [] comp-prompt
          [] "\"dayjs" :default dayjs
      :defs $ {}
        |comp-navigation $ quote
          defcomp comp-navigation (logged-in? count-members page)
            div
              {} $ :style style-navbar
              div
                {} $ :style
                  merge ui/row-parted $ {} (:max-width 840) (:width "\"100%") (:margin :auto)
                div
                  {} $ :style (merge ui/row-center)
                  render-entry "\"Timegrass"
                    fn () $ {} (:name :home)
                    = page :home
                  =< 16 nil
                  render-entry "\"Finished"
                    fn () $ {} (:name :history)
                      :data $ let
                          now $ dayjs
                          month $ .month now
                        {}
                          :year $ .year now
                          :week $ let
                              w $ .week now
                            if
                              and (= month 11)
                                > (.date now) 25
                              inc $ .week (.subtract now 7 "\"day")
                              , w
                    = page :history
                  =< 16 nil
                  render-entry "\"Notes"
                    fn () $ {} (:name :notes)
                      :data $ let
                          now $ dayjs
                        {}
                          :year $ .year now
                          :month $ .month now
                    = page :notes
                div
                  {}
                    :style $ {} (:cursor |pointer)
                    :on-click $ fn (e d!)
                      d! :router/change $ {} (:name :profile)
                  <> $ if logged-in? |Me |Guest
                  =< 8 nil
                  <> count-members
        |render-entry $ quote
          defn render-entry (title get-route highlighted?)
            div
              {}
                :style $ {} (:cursor :pointer)
                :on-click $ fn (e d!)
                  d! :router/change $ get-route
              <> title $ merge
                {} $ :opacity 0.5
                if highlighted? $ {} (:opacity 1)
        |style-navbar $ quote
          def style-navbar $ merge ui/row-center
            {} (:height 48) (:padding "\"0 16px") (:font-size 16)
              :border-bottom $ str "\"1px solid " (hsl 0 0 0 0.1)
              :font-family ui/font-fancy
              :background-color $ :theme config/site
              :color :white
    |app.updater.router $ {}
      :ns $ quote (ns app.updater.router)
      :defs $ {}
        |change $ quote
          defn change (db op-data sid op-id op-time)
            assoc-in db ([] :sessions sid :router) op-data
    |app.comp.history $ {}
      :ns $ quote
        ns app.comp.history $ :require
          [] respo-ui.core :refer $ [] hsl
          [] respo-ui.core :as ui
          [] respo.comp.space :refer $ [] =<
          [] respo.core :refer $ [] defcomp <> >> list-> span div
          [] app.config :as config
          [] respo-alerts.core :refer $ [] comp-modal-menu
          [] "\"dayjs" :default dayjs
          [] feather.core :refer $ [] comp-icon
      :defs $ {}
        |comp-done-task $ quote
          defcomp comp-done-task (states task)
            let
                cursor $ :cursor states
                state $ or (:data states)
                  {} $ :show-menu? false
              div
                {}
                  :style $ merge
                    {} $ :padding "\"4px 8px"
                    when (:show-menu? state)
                      {} $ :background-color (hsl 0 0 94)
                  :on-click $ fn (e d!)
                    d! cursor $ assoc state :show-menu? true
                <>
                  .format
                    dayjs $ :finished-time task
                    , "\"HH:mm"
                  {} (:min-width 32)
                    :color $ hsl 0 0 80
                    :font-size 12
                    :display :inline-block
                =< 4 nil
                span
                  {} $ :style
                    merge ui/flex $ {} (:line-height "\"24px")
                  <> $ :text task
                comp-modal-menu
                  {} (:title "\"Operations")
                    :style $ {} (:width 320)
                    :items $ []
                      {} (:value :put-back) (:display "\"Put back")
                  :show-menu? state
                  fn (d!)
                    d! cursor $ assoc state :show-menu? false
                  fn (item d!)
                    d! cursor $ assoc state :show-menu? false
                    when
                      = :put-back $ :value item
                      d! :task/put-back $ :id task
        |comp-history $ quote
          defcomp comp-history (states data finished-tasks)
            let
                year $ :year data
                week $ :week data
              div
                {} $ :style
                  merge ui/flex $ {} (:padding "\"16px 16px") (:overflow :auto)
                div
                  {} $ :style
                    {} (:max-width 800) (:margin :auto)
                  div
                    {} $ :style
                      merge ui/row-parted $ {} (:margin "\"8px 0")
                    <> (str "\"Histories of " week "\"th week in " year)
                      {} (:font-family ui/font-fancy) (:font-size 16)
                        :color $ hsl 0 0 50
                    div
                      {} $ :style ui/row
                      comp-icon :arrow-left
                        {} (:font-size 16)
                          :color $ hsl 200 80 80
                          :cursor :pointer
                        fn (e d!)
                          d! :router/change $ {} (:name :history)
                            :data $ if (<= week 1)
                              {}
                                :year $ dec year
                                :week 53
                              {} (:year year)
                                :week $ dec week
                      =< 8 nil
                      comp-icon :arrow-right
                        {} (:font-size 16)
                          :color $ hsl 200 80 80
                          :cursor :pointer
                        fn (e d!)
                          d! :router/change $ {} (:name :history)
                            :data $ if (>= week 53)
                              {}
                                :year $ inc year
                                :week 1
                              {} (:year year)
                                :week $ inc week
                  if (empty? finished-tasks)
                    div
                      {} $ :style
                        merge ui/center $ {} (:height 80)
                      <> "\"No tasks." $ {} (:font-family ui/font-fancy)
                        :color $ hsl 0 0 80
                    let
                        grouped-tasks $ -> finished-tasks (.to-list) (.map last)
                          group-by $ fn (task)
                            .format
                              dayjs $ :finished-time task
                              , "\"YYYY-MM-DD"
                      list-> ({})
                        -> grouped-tasks (.to-list)
                          .sort $ fn (x y)
                            &compare (first y) (first x)
                          .map-pair $ fn (date-string task-list)
                            [] date-string $ div
                              {} $ :style
                                merge ui/column $ {} (:margin-top 16)
                              let
                                  the-day $ dayjs date-string
                                div
                                  {} $ :style ui/row-parted
                                  span
                                    {} $ :style
                                      {} $ :font-family ui/font-fancy
                                    <> $ .format the-day "\"ddd"
                                    =< 12 nil
                                    <> $ .format the-day "\"MM-DD"
                              =< nil 4
                              list-> ({})
                                -> task-list
                                  .sort-by $ fn (task)
                                    negate $ :finished-time task
                                  .map $ fn (task)
                                    [] (:id task)
                                      comp-done-task
                                        >> states $ :id task
                                        , task
    |app.updater.session $ {}
      :ns $ quote
        ns app.updater.session $ :require ([] app.schema :as schema)
      :defs $ {}
        |disconnect $ quote
          defn disconnect (db op-data sid op-id op-time)
            update db :sessions $ fn (session) (dissoc session sid)
        |remove-message $ quote
          defn remove-message (db op-data sid op-id op-time)
            update-in db ([] :sessions sid :messages)
              fn (messages)
                dissoc messages $ :id op-data
        |connect $ quote
          defn connect (db op-data sid op-id op-time)
            assoc-in db ([] :sessions sid)
              merge schema/session $ {} (:id sid)
    |app.comp.overview $ {}
      :ns $ quote
        ns app.comp.overview $ :require
          [] respo-ui.core :refer $ [] hsl
          [] app.schema :as schema
          [] respo-ui.core :as ui
          [] respo.core :refer $ [] defcomp list-> >> <> span div button textarea input a defeffect
          [] respo.comp.space :refer $ [] =<
          [] app.config :as config
          [] app.style :as style
          [] respo-alerts.core :refer $ [] comp-prompt comp-modal comp-modal-menu use-prompt use-confirm
          [] feather.core :refer $ [] comp-i comp-icon
          [] "\"dayjs" :default dayjs
          [] "\"copy-text-to-clipboard" :default copy!
      :defs $ {}
        |comp-task $ quote
          defcomp comp-task (states task mode)
            let
                cursor $ :cursor states
                state $ or (:data states)
                  {} $ :menu? false
                update-plugin $ use-prompt (>> states :drafter)
                  {} (:text "\"Task content:")
                    :initial $ :text task
                    :placeholder "\"task..."
                    :button-text "\"Edit"
                delete-plugin $ use-confirm (>> states :delete)
                  {} $ :text "\"Sure to remove task:"
              div
                {}
                  :style $ merge
                    {}
                      :border-bottom $ str "\"1px solid " (hsl 0 0 90)
                      :line-height "\"24px"
                      :padding "\"8px 8px"
                      :overflow :auto
                      :user-select :none
                    when
                      or $ :menu? state
                      {} $ :background-color (hsl 0 0 94)
                  :on-click $ fn (e d!)
                    d! cursor $ assoc state :menu? true
                  :on-dragend $ fn (e d!)
                    d! :task/touch-working $ :id task
                  :draggable true
                div
                  {} $ :style ui/flex
                  <> (:text task) ({})
                comp-modal-menu
                  {} (:title "\"Operations")
                    :style $ {} (:width 320)
                    :items $ []
                      {} (:value :done) (:display "\"Done")
                      {} (:value :pend)
                        :display $ if (= mode :pending) "\"Do it now" "\"Do it later"
                      {} (:value :touch) (:display "\"Up")
                      {} (:value :copy) (:display "\"Copy")
                      {} (:value :edit) (:display "\"Edit")
                      {} (:value :remove) (:display "\"Remove")
                  :menu? state
                  fn (d!)
                    d! cursor $ assoc state :menu? false
                  fn (item d!)
                    let
                        new-state $ assoc state :menu? false
                        result $ :value item
                      case-default result (d! cursor new-state)
                        :done $ do
                          d! :task/finish-working $ :id task
                          d! cursor new-state
                        :edit $ do (d! cursor new-state)
                          .show update-plugin d! $ fn (text)
                            d! :task/update-working $ {}
                              :id $ :id task
                              :text text
                        :copy $ do
                          copy! $ :text task
                          d! cursor new-state
                        :remove $ do (d! cursor new-state)
                          .show delete-plugin d! $ fn ()
                            d! :task/remove-working $ :id task
                        :pend $ do
                          d! :task/pend $ :id task
                          d! cursor new-state
                        :touch $ do
                          d! :task/touch-working $ :id task
                          d! cursor new-state
                .render update-plugin
                .render delete-plugin
        |comp-title $ quote
          defcomp comp-title (title child)
            div
              {} $ :style
                merge ui/row-middle $ {} (:margin "\"8px 0") (:font-family ui/font-fancy)
                  :color $ hsl 0 0 50
                  :font-size 16
                  :font-weight 300
              <> title
              =< 16 nil
              , child
        |comp-no-tasks $ quote
          defcomp comp-no-tasks () $ div
            {} $ :style
              merge ui/center $ {}
                :color $ hsl 0 0 80
                :font-family ui/font-fancy
            <> "\"No tasks"
        |effect-focus $ quote
          defeffect effect-focus () (action el *local)
            case action
              :mount $ -> el (.querySelector "\"input") (.focus)
              do
        |comp-overview $ quote
          defcomp comp-overview (states today tasks)
            let
                working-tasks $ -> tasks (.to-map)
                  filter $ fn (pair)
                    not $ :pending? (last pair)
                pending-tasks $ -> tasks (.to-map)
                  filter $ fn (pair)
                    :pending? $ last pair
                create-plugin $ use-prompt (>> states :create)
                  {} $ :text "\"Create new task:"
              div
                {} $ :style
                  merge ui/expand $ {} (:padding 16)
                div
                  {} $ :style
                    {} (:max-width 800) (:margin :auto)
                  div
                    {} $ :style ui/row-parted
                    comp-title "\"Doing" $ comp-icon :plus
                      &{} :font-size 14 :color (hsl 200 80 80) :cursor :pointer
                      fn (e d!)
                        .show create-plugin d! $ fn (result) (d! :task/create-working result)
                    div
                      {} $ :style
                        merge ui/row-middle $ {} (:font-family ui/font-fancy)
                          :color $ hsl 0 0 60
                      <> $ .format (dayjs today) "\"ddd"
                      =< 8 nil
                      <> $ str
                        .!week $ dayjs today
                        , "\"th week"
                      =< 16 nil
                      <> today
                  if (empty? working-tasks) (comp-no-tasks)
                    list-> ({})
                      -> working-tasks (.to-list)
                        .sort-by $ fn (pair)
                          let
                              task $ last pair
                            negate $ or (:touched-time task) (:created-time task)
                        .map-pair $ fn (k task)
                          [] k $ comp-task
                            >> states $ :id task
                            , task :working
                  when
                    not $ empty? pending-tasks
                    div ({}) (comp-title "\"Later" nil)
                      list-> ({})
                        -> pending-tasks (.to-list)
                          .sort-by $ fn (pair)
                            let
                                task $ last pair
                              negate $ or (:touched-time task) (:created-time task)
                          .map-pair $ fn (k task)
                            [] k $ comp-task
                              >> states $ :id task
                              , task :pending
                  .render create-plugin
    |app.client $ {}
      :ns $ quote
        ns app.client $ :require
          respo.core :refer $ render! clear-cache! realize-ssr!
          respo.cursor :refer $ update-states
          app.comp.container :refer $ comp-container
          app.schema :as schema
          app.config :as config
          ws-edn.client :refer $ ws-connect! ws-send!
          recollect.patch :refer $ patch-twig
          cumulo-util.core :refer $ on-page-touch
          "\"url-parse" :default url-parse
          "\"bottom-tip" :default hud!
          "\"./calcit.build-errors" :default client-errors
          "\"../js-out/calcit.build-errors" :default server-errors
          "\"dayjs" :default dayjs
          "\"dayjs/plugin/weekOfYear" :default week-of-year
      :defs $ {}
        |render-app! $ quote
          defn render-app! () $ render! mount-target
            comp-container (:states @*states) @*store
            , dispatch!
        |*states $ quote
          defatom *states $ {}
            :states $ {}
              :cursor $ []
        |mount-target $ quote
          def mount-target $ .querySelector js/document "\".app"
        |connect! $ quote
          defn connect! () $ let
              url-obj $ url-parse js/location.href true
              host $ either (-> url-obj .-query .-host) js/location.hostname
              port $ either (-> url-obj .-query .-port) (:port config/site)
            ws-connect! (str "\"ws://" host "\":" port)
              {}
                :on-open $ fn (event) (simulate-login!)
                :on-close $ fn (event) (reset! *store nil) (js/console.error "\"Lost connection!")
                :on-data on-server-data
        |main! $ quote
          defn main! () (.!extend dayjs week-of-year)
            println "\"Running mode:" $ if config/dev? "\"dev" "\"release"
            render-app!
            connect!
            add-watch *store :changes $ fn (store prev) (render-app!)
            add-watch *states :changes $ fn (states prev) (render-app!)
            on-page-touch $ fn ()
              if (nil? @*store) (connect!)
            println "\"App started!"
        |*store $ quote (defatom *store nil)
        |dispatch! $ quote
          defn dispatch! (op op-data)
            when
              and config/dev? $ not= op :states
              println "\"Dispatch" op op-data
            case-default op
              ws-send! $ {} (:kind :op) (:op op) (:data op-data)
              :states $ reset! *states (update-states @*states op-data)
              :effect/connect $ connect!
        |on-server-data $ quote
          defn on-server-data (data)
            case-default (:kind data) (println "\"unknown server data kind:" data)
              :patch $ let
                  changes $ :data data
                when config/dev? $ js/console.log "\"Changes" (to-js-data changes)
                reset! *store $ patch-twig @*store changes
        |simulate-login! $ quote
          defn simulate-login! () $ let
              raw $ .!getItem js/localStorage (:storage-key config/site)
            if (some? raw)
              do (println "\"Found storage.")
                dispatch! :user/log-in $ parse-cirru-edn raw
              do $ println "\"Found no storage."
        |reload! $ quote
          defn reload! () $ if
            or (some? client-errors) (some? server-errors)
            hud! "\"error" $ str client-errors &newline server-errors
            do (hud! "\"inactive" nil) (remove-watch *store :changes) (remove-watch *states :changes) (clear-cache!) (render-app!)
              add-watch *store :changes $ fn (store prev) (render-app!)
              add-watch *states :changes $ fn (states prev) (render-app!)
              println "\"Code updated."
    |app.config $ {}
      :ns $ quote (ns app.config)
      :defs $ {}
        |dev? $ quote
          def dev? $ = "\"dev" (get-env "\"mode")
        |site $ quote
          def site $ {} (:port 11009) (:title "\"Timegrass") (:icon "\"http://cdn.tiye.me/logo/timegrass.png") (:dev-ui "\"http://localhost:8100/main.css") (:release-ui "\"http://cdn.tiye.me/favored-fonts/main.css") (:cdn-url "\"http://cdn.tiye.me/timegrass/") (:theme "\"#51C766") (:storage-key "\"timegrass") (:storage-file "\"storage.cirru")