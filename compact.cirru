
{} (:package |app)
  :configs $ {} (:init-fn |app.client/main!) (:reload-fn |app.client/reload!) (:version nil)
    :modules $ [] |respo.calcit/ |lilac/ |recollect/ |memof/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo-markdown.calcit/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:port 6001) (:reload-fn |app.server/reload!)
      :modules $ [] |lilac/ |recollect/ |memof/ |cumulo-util.calcit/ |cumulo-reel.calcit/ |calcit.std/ |calcit-wss/
  :files $ {}
    |app.client $ {}
      :defs $ {}
        |*states $ quote
          defatom *states $ {}
            :states $ {}
              :cursor $ []
        |*store $ quote (defatom *store nil)
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
        |dispatch! $ quote
          defn dispatch! (op op-data)
            when
              and config/dev? $ not= op :states
              println "\"Dispatch" op op-data
            case-default op
              ws-send! $ {} (:kind :op) (:op op) (:data op-data)
              :states $ reset! *states (update-states @*states op-data)
              :effect/connect $ connect!
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
        |mount-target $ quote
          def mount-target $ .querySelector js/document "\".app"
        |on-server-data $ quote
          defn on-server-data (data)
            case-default (:kind data) (println "\"unknown server data kind:" data)
              :patch $ let
                  changes $ :data data
                when config/dev? $ js/console.log "\"Changes" (to-js-data changes)
                reset! *store $ patch-twig @*store changes
        |reload! $ quote
          defn reload! () $ if
            or $ some? client-errors
            hud! "\"error" $ str client-errors
            do (hud! "\"inactive" nil) (remove-watch *store :changes) (remove-watch *states :changes) (clear-cache!) (render-app!)
              add-watch *store :changes $ fn (store prev) (render-app!)
              add-watch *states :changes $ fn (states prev) (render-app!)
              println "\"Code updated."
        |render-app! $ quote
          defn render-app! () $ render! mount-target
            comp-container (:states @*states) @*store
            , dispatch!
        |simulate-login! $ quote
          defn simulate-login! () $ let
              raw $ .!getItem js/localStorage (:storage-key config/site)
            if (some? raw)
              do (println "\"Found storage.")
                dispatch! :user/log-in $ parse-cirru-edn raw
              do $ println "\"Found no storage."
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
          "\"dayjs" :default dayjs
          "\"dayjs/plugin/weekOfYear" :default week-of-year
    |app.comp.container $ {}
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
                  {} $ :class-name css-container
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
                    fn (info d!) (d! :session/remove-message info)
                  when dev? $ comp-reel (:reel-length store) ({})
        |comp-offline $ quote
          defcomp comp-offline () $ div
            {} $ :class-name css-offline
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
            div $ {} (:class-name css-status-color)
              :style $ {} (:background-color color) 
        |css-container $ quote
          defstyle css-container $ {}
            "\"$0" $ merge ui/global ui/fullscreen ui/column
        |css-offline $ quote
          defstyle css-offline $ {}
            "\"$0" $ merge ui/global ui/fullscreen ui/column-dispersive
              {} $ :background-color (:theme config/site)
        |css-status-color $ quote
          defstyle css-status-color $ {}
            "\"$0" $ {} (:width 16) (:height 16) (:position :absolute) (:bottom 16) (:right 8) (:border-radius "\"8px") (:opacity 0.8)
        |style-body $ quote
          def style-body $ {} (:padding "|8px 16px")
      :ns $ quote
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
    |app.comp.history $ {}
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
                {} (:class-name css/flex)
                  :style $ {} (:padding "\"16px 16px") (:overflow :auto)
                div
                  {} $ :style
                    {} (:max-width 800) (:margin :auto)
                  div
                    {} (:class-name css/row-parted)
                      :style $ {} (:margin "\"8px 0")
                    <> (str "\"Histories of " week "\"th week in " year)
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
                      {} (:class-name css/center)
                        :style $ {} (:height 80)
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
                              {} (:class-name css/column)
                                :style $ {} (:margin-top 16)
                              let
                                  the-day $ dayjs date-string
                                div
                                  {} $ :class-name css/row-parted
                                  span
                                    {} $ :class-name css/font-fancy
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
      :ns $ quote
        ns app.comp.history $ :require
          respo-ui.core :refer $ hsl
          respo-ui.core :as ui
          respo-ui.css :as css
          respo.comp.space :refer $ =<
          respo.core :refer $ defcomp <> >> list-> span div
          app.config :as config
          respo-alerts.core :refer $ comp-modal-menu
          "\"dayjs" :default dayjs
          feather.core :refer $ comp-icon
    |app.comp.login $ {}
      :defs $ {}
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
        |initial-state $ quote
          def initial-state $ {} (:username |) (:password |)
        |on-submit $ quote
          defn on-submit (username password signup?)
            fn (e dispatch!)
              dispatch! (if signup? :user/sign-up :user/log-in) ([] username password)
              .setItem js/localStorage (:storage-key config/site)
                format-cirru-edn $ [] username password
      :ns $ quote
        ns app.comp.login $ :require
          [] respo.core :refer $ [] defcomp <> div input button span
          [] respo.comp.space :refer $ [] =<
          [] respo.comp.inspect :refer $ [] comp-inspect
          [] respo-ui.core :as ui
          [] app.schema :as schema
          [] app.style :as style
          [] app.config :as config
    |app.comp.navigation $ {}
      :defs $ {}
        |comp-navigation $ quote
          defcomp comp-navigation (logged-in? count-members page)
            div
              {} $ :class-name css-navbar
              div
                {} (:class-name css/row-parted)
                  :style $ {} (:max-width 840) (:width "\"100%") (:margin :auto)
                div
                  {} $ :class-name css/row-center
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
                              .week $ .subtract now 7 "\"day"
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
                    :style $ {} (:cursor |pointer) (:user-select :none)
                    :tab-index 0
                    :on-click $ fn (e d!)
                      d! :router/change $ {} (:name :profile)
                  <> $ if logged-in? |Me |Guest
                  =< 8 nil
                  <> count-members
        |css-navbar $ quote
          defstyle css-navbar $ {}
            "\"$0" $ merge ui/row-center
              {} (:height 48) (:padding "\"0 16px") (:font-size 16)
                :border-bottom $ str "\"1px solid " (hsl 0 0 0 0.1)
                :font-family ui/font-fancy
                :background-color $ :theme config/site
                :color :white
        |render-entry $ quote
          defn render-entry (title get-route highlighted?)
            div
              {}
                :style $ {} (:cursor :pointer)
                :on-click $ fn (e d!)
                  d! :router/change $ get-route
                :tab-index 0
              <> title $ merge
                {} (:opacity 0.5) (:user-select :none)
                if highlighted? $ {} (:opacity 1)
      :ns $ quote
        ns app.comp.navigation $ :require
          respo-ui.core :refer $ hsl
          respo-ui.core :as ui
          respo.css :refer $ defstyle
          respo-ui.css :as css
          respo.comp.space :refer $ =<
          respo.core :refer $ defcomp <> >> span div
          app.config :as config
          respo-alerts.core :refer $ comp-prompt
          "\"dayjs" :default dayjs
    |app.comp.notes-page $ {}
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
                {} (:class-name css/column)
                  :style $ {}
                    :border-top $ str "\"1px solid " (hsl 0 0 94)
                    :padding "\"4px 8px"
                div
                  {} $ :class-name css/row-parted
                  <>
                    -> (:time note) dayjs $ .format "\"HH:mm"
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
                {} (:class-name css/expand)
                  :style $ {} (:padding 16)
                div
                  {} $ :style
                    {} (:max-width 800) (:margin :auto)
                  div
                    {} (:class-name css/row-parted)
                      :style $ {} (:margin "\"8px 0")
                    span
                      {} $ :class-name css/row-middle
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
                        str (inc month) "\"th month of " year "\"."
                        {} (:font-family ui/font-fancy)
                          :color $ hsl 0 0 50
                  if (empty? notes)
                    div
                      {} (:class-name css/center)
                        :style $ {} (:min-height 120)
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
                                {} (:class-name css/font-fancy)
                                  :style $ {} (:font-size 14) (:font-weight 500)
                                <> $ -> (str year "\"-" date) dayjs (.format "\"ddd")
                                =< 12 nil
                                <> $ str date
                              list->
                                {} $ :class-name css/column
                                -> notes-in-day
                                  .sort-by $ fn (pair)
                                    negate $ :time (last pair)
                                  .map-pair $ fn (k note)
                                    [] k $ comp-note (>> states k) note
                  =< nil 160
                .render add-plugin
      :ns $ quote
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
          "\"dayjs" :default dayjs
    |app.comp.overview $ {}
      :defs $ {}
        |comp-no-tasks $ quote
          defcomp comp-no-tasks () $ div
            {}
              :class-name $ str-spaced css/center css/font-fancy
              :style $ {}
                :color $ hsl 0 0 80
            <> "\"No tasks"
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
                cursor $ :cursor states
                state $ or (:data states)
                  {} $ :show-later? false
              div
                {} (:class-name css/expand)
                  :style $ {} (:padding 16)
                div
                  {} $ :style
                    {} (:max-width 800) (:margin :auto)
                  div
                    {} $ :class-name css/row-parted
                    comp-title "\"Doing" $ comp-icon :plus
                      &{} :font-size 14 :color (hsl 200 80 80) :cursor :pointer
                      fn (e d!)
                        .show create-plugin d! $ fn (result) (d! :task/create-working result)
                    div
                      {}
                        :class-name $ str-spaced css/row-middle css/font-fancy
                        :style $ {}
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
                    div ({})
                      comp-title "\"Later" nil $ fn (e d!)
                        d! cursor $ update state :show-later? not
                      if (:show-later? state)
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
                        div
                          {}
                            :style $ {} (:font-size 16)
                            :on-click $ fn (e d!)
                              d! cursor $ update state :show-later? not
                          <>
                            str (count pending-tasks) "\" future tasks. Click to show."
                            {} (:font-family ui/font-fancy) (:font-weight 300) (:cursor :pointer)
                  .render create-plugin
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
                {} (:class-name css-task-base)
                  :style $ merge
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
        |css-task-base $ quote
          defstyle css-task-base $ {}
            "\"$0" $ {}
              :border-bottom $ str "\"1px solid " (hsl 0 0 90)
              :line-height "\"24px"
              :padding "\"8px 8px"
              :overflow :auto
              :user-select :none
        |css-title $ quote
          defstyle css-title $ {}
            "\"$0" $ merge ui/row-middle
              {} (:margin "\"8px 0") (:font-family ui/font-fancy)
                :color $ hsl 0 0 50
                :font-size 16
                :font-weight 300
        |effect-focus $ quote
          defeffect effect-focus () (action el *local)
            case action
              :mount $ -> el (.querySelector "\"input") (.focus)
              do
      :ns $ quote
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
          "\"dayjs" :default dayjs
          "\"copy-text-to-clipboard" :default copy!
    |app.comp.profile $ {}
      :defs $ {}
        |comp-profile $ quote
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
                  <> $ str "|Hello! " (:name user)
                =< nil 16
                div
                  {} $ :class-name css/row
                  <> "\"Members:"
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
                        js/location.replace $ str js/location.origin "\"?time=" (.now js/Date)
                    <> "\"Refresh"
                  =< 16 nil
                  button
                    {} (:class-name css/button)
                      :style $ {} (:color :red) (:border-color :red)
                      :on-click $ fn (e d!) (d! :user/log-out nil)
                        js/localStorage.removeItem $ :storage-key config/site
                    <> "\"Log out"
        |css-member-label $ quote
          defstyle css-member-label $ {}
            "\"$0" $ {} (:padding "\"0 8px")
              :border $ str "\"1px solid " (hsl 0 0 80)
              :border-radius "\"16px"
              :margin "\"0 4px"
      :ns $ quote
        ns app.comp.profile $ :require
          respo-ui.core :refer $ hsl
          respo-ui.css :as css
          app.schema :as schema
          respo-ui.core :as ui
          respo.core :refer $ defcomp list-> <> span div button
          respo.css :refer $ defstyle
          respo.comp.space :refer $ =<
          app.config :as config
    |app.config $ {}
      :defs $ {}
        |dev? $ quote
          def dev? $ = "\"dev" (get-env "\"mode" "\"release")
        |site $ quote
          def site $ {} (:port 11009) (:title "\"Timegrass") (:icon "\"http://cdn.tiye.me/logo/timegrass.png") (:dev-ui "\"http://localhost:8100/main.css") (:release-ui "\"http://cdn.tiye.me/favored-fonts/main.css") (:cdn-url "\"http://cdn.tiye.me/timegrass/") (:theme "\"#51C766") (:storage-key "\"timegrass") (:storage-file "\"storage.cirru")
      :ns $ quote (ns app.config)
    |app.schema $ {}
      :defs $ {}
        |complain $ quote
          def complain $ {} (:id nil) (:text "\"") (:time nil)
        |database $ quote
          def database $ {}
            :sessions $ do session ({})
            :users $ do user ({})
            :today "\"2018-08-07"
        |note $ quote
          def note $ {} (:id nil) (:time nil) (:updated-time nil) (:text nil)
        |notification $ quote
          def notification $ {} (:id nil) (:kind nil) (:text nil)
        |router $ quote
          def router $ {} (:name nil) (:title nil)
            :data $ {}
            :router nil
        |session $ quote
          def session $ {} (:user-id nil) (:id nil) (:nickname nil)
            :router $ {} (:name :home) (:data nil) (:router nil)
            :messages $ {}
        |task $ quote
          def task $ {} (:id nil) (:text "\"") (:detail "\"") (:pending? false) (:created-time nil) (:touched-time nil) (:finished-time nil) (:archived-time nil)
        |user $ quote
          def user $ {} (:name nil) (:id nil) (:nickname nil) (:avatar nil) (:password nil)
            :tasks $ {}
              :working $ do task ({})
              :pending $ {}
              :finished $ {}
            :notes $ do note ({})
      :ns $ quote (ns app.schema)
    |app.server $ {}
      :defs $ {}
        |*client-caches $ quote
          defatom *client-caches $ {}
        |*initial-db $ quote
          defatom *initial-db $ if
            path-exists? $ w-log storage-file
            do (println "\"Found local EDN data")
              merge schema/database $ parse-cirru-edn (read-file storage-file)
            do (println "\"Found no data") schema/database
        |*reader-reel $ quote (defatom *reader-reel @*reel)
        |*reel $ quote
          defatom *reel $ merge reel-schema
            {} (:base @*initial-db) (:db @*initial-db)
        |dispatch! $ quote
          defn dispatch! (op op-data sid)
            let
                op-id $ generate-id!
                op-time $ get-timestamp (get-time!)
              if config/dev? $ println "\"Dispatch!" (str op) (; op-data) sid
              if (= op :effect/persist) (persist-db!)
                reset! *reel $ reel-reducer @*reel updater op op-data sid op-id op-time config/dev?
        |get-backup-path! $ quote
          defn get-backup-path! () $ let
              now $ extract-time (get-time!)
            join-path calcit-dirname "\"backups"
              str $ :month now
              str (:day now) "\"-snapshot.cirru"
        |main! $ quote
          defn main! ()
            println "\"Running mode:" $ if config/dev? "\"dev" "\"release"
            let
                p? $ get-env "\"port"
                port $ if (some? p?) (js/parseInt p?) (:port config/site)
              run-server! port
              println $ str "\"Server started on port:" port
            do (; "\"init it before doing multi-threading") (identity @*reader-reel)
            set-interval 200 $ fn () (render-loop!)
            on-control-c on-exit!
            set-interval 600000 $ fn () (persist-db!)
            set-interval 60000 $ fn () (set-today!)
        |on-exit! $ quote
          defn on-exit! () (persist-db!) (; println "\"exit code is...") (quit! 0)
        |persist-db! $ quote
          defn persist-db! () $ let
              file-content $ format-cirru-edn
                assoc (:db @*reel) :sessions $ {}
              storage-path storage-file
              backup-path $ get-backup-path!
            check-write-file! storage-path file-content
            check-write-file! backup-path file-content
        |reload! $ quote
          defn reload! () (println "\"Code updated..")
            if (not config/dev?) (raise "\"reloading only happens in dev mode")
            clear-twig-caches!
            reset! *reel $ refresh-reel @*reel @*initial-db updater
            sync-clients! @*reader-reel
        |render-loop! $ quote
          defn render-loop! () $ when
            not $ identical? @*reader-reel @*reel
            reset! *reader-reel @*reel
            sync-clients! @*reader-reel
        |run-server! $ quote
          defn run-server! (port)
            wss-serve! (&{} :port port)
              fn (data)
                key-match data
                    :connect sid
                    do (dispatch! :session/connect nil sid) (println "\"New client.")
                  (:message sid msg)
                    let
                        action $ parse-cirru-edn msg
                      case-default (:kind action) (println "\"unknown action:" action)
                        :op $ dispatch! (:op action) (:data action) sid
                  (:disconnect sid)
                    do (println "\"Client closed!") (dispatch! :session/disconnect nil sid)
                  _ $ println "\"unknown data:" data
        |set-today! $ quote
          defn set-today! () $ let
              today $ wo-log
                format-time (get-time!) "\"%Y-%m-%d"
              old-today $ :today (:db @*reel)
            when (not= today old-today) (dispatch! :today today "\"system")
        |storage-file $ quote
          def storage-file $ if (empty? calcit-dirname)
            str calcit-dirname $ :storage-file config/site
            str calcit-dirname "\"/" $ :storage-file config/site
        |sync-clients! $ quote
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
                ; when config/dev? $ println "\"Changes for" sid "\":" changes (count records)
                if
                  not= changes $ []
                  do
                    wss-send! sid $ format-cirru-edn
                      {} (:kind :patch) (:data changes)
                    swap! *client-caches assoc sid new-store
            new-twig-loop!
      :ns $ quote
        ns app.server $ :require (app.schema :as schema)
          app.updater :refer $ updater
          cumulo-reel.core :refer $ reel-reducer refresh-reel reel-schema
          app.config :as config
          app.twig.container :refer $ twig-container
          recollect.diff :refer $ diff-twig
          wss.core :refer $ wss-serve! wss-send! wss-each!
          recollect.twig :refer $ new-twig-loop! clear-twig-caches!
          app.$meta :refer $ calcit-dirname
          calcit.std.fs :refer $ path-exists? check-write-file!
          calcit.std.time :refer $ set-interval
          calcit.std.date :refer $ get-time! extract-time format-time get-timestamp
          calcit.std.path :refer $ join-path
    |app.style $ {}
      :defs $ {}
        |button $ quote
          def button $ merge ui/button
            {} $ :background-color :white
        |link $ quote
          def link $ {} (:text-decoration :underline) (:cursor :pointer)
            :color $ hsl 240 80 80
            :font-family ui/font-fancy
      :ns $ quote
        ns app.style $ :require
          [] respo-ui.core :refer $ [] hsl
          [] respo-ui.core :as ui
    |app.twig.container $ {}
      :defs $ {}
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
                  :color $ rand-hex-color!
                  :today $ :today db
                {}
        |twig-members $ quote
          defn twig-members (sessions users)
            -> sessions $ .map-kv
              fn (k session)
                [] k $ get-in users
                  [] (:user-id session) :name
        |twig-notes-by-month $ quote
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
        |twig-tasks-by-week $ quote
          defn twig-tasks-by-week (data tasks)
            let
                filter-year $ :year data
                filter-week $ dec (:week data)
                start-time $ .timestamp
                  from-ywd (:year data)
                    - (:week data) 1
                    , 1
                end-time $ + start-time week-millis
              ; println "\"start:" $ extract-time start-time
              ; println "\"end " $ extract-time end-time
              -> tasks (.to-map)
                .filter-kv $ fn (k task)
                  let
                      t $ :finished-time task
                    and (> t start-time) (< t end-time)
        |week-millis $ quote
          def week-millis $ * 7 24 3600 1000
      :ns $ quote
        ns app.twig.container $ :require
          [] app.twig.user :refer $ [] twig-user
          calcit.std.rand :refer $ rand-hex-color!
          calcit.std.date :refer $ Date extract-time get-time! from-ywd from-ymd
    |app.twig.user $ {}
      :defs $ {}
        |twig-user $ quote
          defn twig-user (user)
            -> user (dissoc :password) (dissoc :tasks)
      :ns $ quote
        ns app.twig.user $ :require
          [] recollect.twig :refer $ [] deftwig
    |app.updater $ {}
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
      :ns $ quote
        ns app.updater $ :require ([] app.updater.session :as session) ([] app.updater.user :as user) ([] app.updater.router :as router) ([] app.updater.misc :as misc) ([] app.updater.task :as task) ([] app.updater.note :as note) ([] app.schema :as schema)
          [] respo-message.updater :refer $ [] update-messages
    |app.updater.misc $ {}
      :defs $ {}
        |set-today $ quote
          defn set-today (db op-data sid op-id op-time) (assoc db :today op-data)
      :ns $ quote (ns app.updater.misc)
    |app.updater.note $ {}
      :defs $ {}
        |add-note $ quote
          defn add-note (db op-data sid op-id op-time)
            let
                session $ get-in db ([] :sessions sid)
                user-id $ :user-id session
                new-note $ merge schema/note
                  {} (:id op-id) (:time op-time) (:text op-data)
              assoc-in db ([] :users user-id :notes op-id) new-note
        |edit-note $ quote
          defn edit-note (db op-data sid op-id op-time)
            let
                session $ get-in db ([] :sessions sid)
                user-id $ :user-id session
                note-id $ :id op-data
                text $ :text op-data
              update-in db ([] :users user-id :notes note-id)
                fn (note) (assoc note :text text)
        |remove-note $ quote
          defn remove-note (db op-data sid op-id op-time)
            let
                session $ get-in db ([] :sessions sid)
                user-id $ :user-id session
              update-in db ([] :users user-id :notes)
                fn (notes) (dissoc notes op-data)
      :ns $ quote
        ns app.updater.note $ :require ([] app.schema :as schema)
    |app.updater.router $ {}
      :defs $ {}
        |change $ quote
          defn change (db op-data sid op-id op-time)
            assoc-in db ([] :sessions sid :router) op-data
      :ns $ quote (ns app.updater.router)
    |app.updater.session $ {}
      :defs $ {}
        |connect $ quote
          defn connect (db op-data sid op-id op-time)
            assoc-in db ([] :sessions sid)
              merge schema/session $ {} (:id sid)
        |disconnect $ quote
          defn disconnect (db op-data sid op-id op-time)
            update db :sessions $ fn (session) (dissoc session sid)
        |remove-message $ quote
          defn remove-message (db op-data sid op-id op-time)
            update-in db ([] :sessions sid :messages)
              fn (messages)
                dissoc messages $ :id op-data
      :ns $ quote
        ns app.updater.session $ :require ([] app.schema :as schema)
    |app.updater.task $ {}
      :defs $ {}
        |create-working $ quote
          defn create-working (db op-data sid op-id op-time)
            let
                user-id $ get-in db ([] :sessions sid :user-id)
              assoc-in db ([] :users user-id :tasks :working op-id)
                merge schema/task $ {} (:id op-id) (:text op-data) (:created-time op-time)
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
        |pend $ quote
          defn pend (db op-data sid op-id op-time)
            let
                user-id $ get-in db ([] :sessions sid :user-id)
              update-in db ([] :users user-id :tasks :working op-data :pending?) not
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
      :ns $ quote
        ns app.updater.task $ :require ([] app.schema :as schema)
    |app.updater.user $ {}
      :defs $ {}
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
        |log-out $ quote
          defn log-out (db op-data sid op-id op-time)
            assoc-in db ([] :sessions sid :user-id) nil
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
      :ns $ quote
        ns app.updater.user $ :require
          [] cumulo-util.core :refer $ [] find-first
          calcit.std.hash :refer $ md5
