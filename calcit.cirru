
{}
  :configs $ {} (:init-fn |app.client/main!) (:port 6001) (:reload-fn |app.client/reload!)
    :modules $ [] |respo.calcit/ |lilac/ |recollect/ |memof/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo-markdown.calcit/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:port 6001) (:reload-fn |app.server/reload!)
      :modules $ [] |lilac/ |recollect/ |memof/ |cumulo-util.calcit/ |cumulo-reel.calcit/ |calcit.std/ |calcit-wss/
  :ir $ {} (:package |app)
    :files $ {}
      |app.client $ {}
        :defs $ {}
          |*states $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:cursor) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
          |*store $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
          |connect! $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-obj) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-parse) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/location.href) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |true) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |host) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |either) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |->) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-obj) (:type :leaf)
                                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-query) (:type :leaf)
                                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-host) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/location.hostname) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |port) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |either) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |->) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-obj) (:type :leaf)
                                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-query) (:type :leaf)
                                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-port) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:port) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/site) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-connect!) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"ws://") (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |host) (:type :leaf)
                          |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\":") (:type :leaf)
                          |x $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |port) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:on-open) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |event) (:type :leaf)
                                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |simulate-login!) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:on-close) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |event) (:type :leaf)
                                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store) (:type :leaf)
                                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
                                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/console.error) (:type :leaf)
                                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Lost connection!") (:type :leaf)
                          |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:on-data) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-server-data) (:type :leaf)
          |dispatch! $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
              |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |and) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |not=) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677346452151) (:by |B1y7Rc-Zz) (:text |js/console.log) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Dispatch") (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                      |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
              |x $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |case-default) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-send!) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:kind) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:op) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:op) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                          |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:data) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |update-states) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*states) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                  |x $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:effect/connect) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!) (:type :leaf)
          |main! $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |main!) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |t $ {} (:at 1629965585623) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629965585623) (:by |B1y7Rc-Zz) (:text |.!extend) (:type :leaf)
                  |j $ {} (:at 1629965585623) (:by |B1y7Rc-Zz) (:text |dayjs) (:type :leaf)
                  |r $ {} (:at 1629965585623) (:by |B1y7Rc-Zz) (:text |week-of-year) (:type :leaf)
              |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Running mode:") (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"dev") (:type :leaf)
                      |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"release") (:type :leaf)
              |w $ {} (:at 1677335250984) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677335251378) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                  |b $ {} (:at 1677335253087) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                  |h $ {} (:at 1677335267443) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677335258704) (:by |B1y7Rc-Zz) (:text |load-console-formatter!) (:type :leaf)
              |x $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!) (:type :leaf)
              |y $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!) (:type :leaf)
              |yT $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes) (:type :leaf)
                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |store) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!) (:type :leaf)
              |yj $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes) (:type :leaf)
                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!) (:type :leaf)
              |yr $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-page-touch) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |nil?) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*store) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!) (:type :leaf)
              |yv $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"App started!") (:type :leaf)
          |mount-target $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |def) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |mount-target) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.querySelector) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/document) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\".app") (:type :leaf)
          |on-server-data $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-server-data) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
              |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |case-default) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:kind) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"unknown server data kind:") (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:patch) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |changes) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:data) (:type :leaf)
                                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/console.log) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Changes") (:type :leaf)
                                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |changes) (:type :leaf)
                          |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |patch-twig) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*store) (:type :leaf)
                                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |changes) (:type :leaf)
          |reload! $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |reload!) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |or) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |some?) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |client-errors) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |hud!) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"error") (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |client-errors) (:type :leaf)
                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |hud!) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"inactive") (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |remove-watch) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes) (:type :leaf)
                      |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |remove-watch) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes) (:type :leaf)
                      |x $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |clear-cache!) (:type :leaf)
                      |y $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!) (:type :leaf)
                      |yT $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes) (:type :leaf)
                          |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |store) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!) (:type :leaf)
                      |yj $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states) (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes) (:type :leaf)
                          |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!) (:type :leaf)
                      |yr $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Code updated.") (:type :leaf)
          |render-app! $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render!) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |mount-target) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |comp-container) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*states) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*store) (:type :leaf)
                  |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
          |simulate-login! $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |simulate-login!) (:type :leaf)
              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |raw) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.!getItem) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/localStorage) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:storage-key) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/site) (:type :leaf)
                  |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                      |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |some?) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |raw) (:type :leaf)
                      |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Found storage.") (:type :leaf)
                          |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:user/log-in) (:type :leaf)
                              |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn) (:type :leaf)
                                  |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |raw) (:type :leaf)
                      |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                          |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                              |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Found no storage.") (:type :leaf)
        :ns $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
            |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ns) (:type :leaf)
            |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.client) (:type :leaf)
            |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
              :data $ {}
                |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:require) (:type :leaf)
                |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |respo.core) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render!) (:type :leaf)
                        |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |clear-cache!) (:type :leaf)
                        |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |realize-ssr!) (:type :leaf)
                |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |respo.cursor) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |update-states) (:type :leaf)
                |v $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.comp.container) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |comp-container) (:type :leaf)
                |x $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.schema) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |schema) (:type :leaf)
                |y $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.config) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config) (:type :leaf)
                |yT $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-edn.client) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-connect!) (:type :leaf)
                        |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-send!) (:type :leaf)
                |yj $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |recollect.patch) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |patch-twig) (:type :leaf)
                |yr $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |cumulo-util.core) (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-page-touch) (:type :leaf)
                |yv $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"url-parse") (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:default) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-parse) (:type :leaf)
                |yx $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"bottom-tip") (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:default) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |hud!) (:type :leaf)
                |yy $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"./calcit.build-errors") (:type :leaf)
                    |j $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:default) (:type :leaf)
                    |r $ {} (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |client-errors) (:type :leaf)
                |yyj $ {} (:at 1629965592877) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629965594109) (:by |B1y7Rc-Zz) (:text "|\"dayjs") (:type :leaf)
                    |j $ {} (:at 1629965598037) (:by |B1y7Rc-Zz) (:text |:default) (:type :leaf)
                    |r $ {} (:at 1629965599257) (:by |B1y7Rc-Zz) (:text |dayjs) (:type :leaf)
                |yyr $ {} (:at 1629965620406) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629965620406) (:by |B1y7Rc-Zz) (:text "|\"dayjs/plugin/weekOfYear") (:type :leaf)
                    |j $ {} (:at 1629965620406) (:by |B1y7Rc-Zz) (:text |:default) (:type :leaf)
                    |r $ {} (:at 1629965620406) (:by |B1y7Rc-Zz) (:text |week-of-year) (:type :leaf)
      |app.comp.container $ {}
        :defs $ {}
          |comp-container $ {} (:at 1500541010211) (:by nil) (:id |rJcN9Iee0Bb) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |ryo4cIlgAHZ) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |H1hV5IlxCH-) (:text |comp-container) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |r1aE9IglCB-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |B1CV9UxeCBb) (:text |states) (:type :leaf)
                  |j $ {} (:at 1500541010211) (:by |root) (:id |SkyrqIglCr-) (:text |store) (:type :leaf)
              |v $ {} (:at 1500541010211) (:by nil) (:id |HyxSq8llRHb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |ByZB58exAB-) (:text |let) (:type :leaf)
                  |j $ {} (:at 1500541010211) (:by nil) (:id |rkzr9UggCHW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by nil) (:id |HJmS5IllASW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |rJVBcUxx0Bb) (:text |state) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |ByrH5IggAHW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |S1LScUglRSW) (:text |:data) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by |root) (:id |SJvHc8eeAB-) (:text |states) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by nil) (:id |ryuSqIllABW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |rkYrq8lgCHb) (:text |session) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |BycSqLllCSW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |Hksr5IxlCSZ) (:text |:session) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by |root) (:id |SJhS5UxeRBb) (:text |store) (:type :leaf)
                      |r $ {} (:at 1525106928554) (:by |root) (:id |HyYgtpEaG) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1525106929232) (:by |root) (:id |HyYgtpEaGleaf) (:text |router) (:type :leaf)
                          |j $ {} (:at 1525106929915) (:by |root) (:id |Skg5etaNTM) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1525106930860) (:by |root) (:id |HyLFeYpEaG) (:text |:router) (:type :leaf)
                              |j $ {} (:at 1525106931558) (:by |root) (:id |HkNigK646z) (:text |store) (:type :leaf)
                      |v $ {} (:at 1525106933346) (:by |root) (:id |Sye6lY64aM) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1525106935393) (:by |root) (:id |Sye6lY64aMleaf) (:text |router-data) (:type :leaf)
                          |j $ {} (:at 1525106935675) (:by |root) (:id |H1eWtaNTz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1525106936827) (:by |root) (:id |r1u1WKTNTz) (:text |:data) (:type :leaf)
                              |j $ {} (:at 1525106937665) (:by |root) (:id |SkMW-tpE6M) (:text |router) (:type :leaf)
                  |r $ {} (:at 1500541010211) (:by nil) (:id |ByaHq8gxCSW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |S10HqUelASb) (:text |if) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by nil) (:id |rJJIc8gg0BZ) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |ryeLc8egCS-) (:text |nil?) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by |root) (:id |r1-LcUggCrZ) (:text |store) (:type :leaf)
                      |r $ {} (:at 1521951403873) (:by |root) (:id |rJE2zoVqz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1521951417580) (:by |root) (:id |HyYZehIDnvM) (:text |comp-offline) (:type :leaf)
                      |v $ {} (:at 1500541010211) (:by nil) (:id |BJGP9LlxRB-) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |r1mvc8lgRH-) (:text |div) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |r1VPqLxxRrb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |HJHD5UxeCHZ) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |B1Uwq8gxArb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790530286) (:by |B1y7Rc-Zz) (:id |HkwD58ggCr-) (:text |:class-name) (:type :leaf)
                                  |b $ {} (:at 1657790534305) (:by |B1y7Rc-Zz) (:text |css-container) (:type :leaf)
                          |r $ {} (:at 1500541010211) (:by nil) (:id |r1pw9LelCr-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1523120265747) (:by |root) (:id |SyAvc8lgCB-) (:text |comp-navigation) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |rkyu9UglRHZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkedq8xxAB-) (:text |:logged-in?) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |rJ-_cLge0SW) (:text |store) (:type :leaf)
                              |r $ {} (:at 1523120353961) (:by |root) (:id |BkW5yKdLjM) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1523120357277) (:by |root) (:id |SJx9JF_Ljz) (:text |:count) (:type :leaf)
                                  |j $ {} (:at 1523120358953) (:by |root) (:id |rkf6kYOIiM) (:text |store) (:type :leaf)
                              |v $ {} (:at 1557246874445) (:by |B1y7Rc-Zz) (:id |bHectOoMM) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246876606) (:by |B1y7Rc-Zz) (:id |mEb6wZVjqp) (:text |:name) (:type :leaf)
                                  |j $ {} (:at 1557246880841) (:by |B1y7Rc-Zz) (:id |y6cspZJscV) (:text |router) (:type :leaf)
                          |v $ {} (:at 1500541010211) (:by nil) (:id |rkXYc8ll0SW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |HJVYcUxlRrZ) (:text |if) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |S1rK5UggABZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkUtqUxg0HZ) (:text |:logged-in?) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |r1Dtq8lxArb) (:text |store) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |BJl4-FpETz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964984819) (:by |B1y7Rc-Zz) (:id |rkbqq8xgAHb) (:text |case-default) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |rkz5q8eeRH-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |HJX958ggAS-) (:text |:name) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by |root) (:id |HkE558leAH-) (:text |router) (:type :leaf)
                                  |l $ {} (:at 1629964985625) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964985625) (:by |B1y7Rc-Zz) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1629964985625) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964985625) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                                          |j $ {} (:at 1629964985625) (:by |B1y7Rc-Zz) (:text "|\"404 page:") (:type :leaf)
                                          |r $ {} (:at 1629964985625) (:by |B1y7Rc-Zz) (:text |router) (:type :leaf)
                                  |n $ {} (:at 1525106918943) (:by |root) (:id |H11lKp4Tz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1525106921967) (:by |root) (:id |H11lKp4Tzleaf) (:text |:home) (:type :leaf)
                                      |j $ {} (:at 1533576677525) (:by |B1y7Rc-Zz) (:id |PZd2PXVab) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1533618647136) (:by |root) (:id |m_saaGcMW8) (:text |comp-overview) (:type :leaf)
                                          |j $ {} (:at 1584878872186) (:by |B1y7Rc-Zz) (:id |2vpnWkT7o) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1584878872993) (:by |B1y7Rc-Zz) (:id |4hB5zDjugJ) (:text |>>) (:type :leaf)
                                              |T $ {} (:at 1533618654830) (:by |root) (:id |yzaKGpsYjh) (:text |states) (:type :leaf)
                                              |j $ {} (:at 1584878873693) (:by |B1y7Rc-Zz) (:id |xL7PROxAgw) (:text |:overview) (:type :leaf)
                                          |r $ {} (:at 1533695015966) (:by |root) (:id |ByNCD2xrm) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1533695017123) (:by |root) (:id |otAAklap_) (:text |:today) (:type :leaf)
                                              |j $ {} (:at 1533695018164) (:by |root) (:id |6lI2r0HK4) (:text |store) (:type :leaf)
                                          |t $ {} (:at 1545874880725) (:by |root) (:id |DHKqKbB4bt) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1545874880725) (:by |root) (:id |WYrbb654wb) (:text |get-in) (:type :leaf)
                                              |j $ {} (:at 1545874880725) (:by |root) (:id |EVgjSYV5Yk) (:text |router) (:type :leaf)
                                              |r $ {} (:at 1545874880725) (:by |root) (:id |EoHHoG5YPG) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1545874880725) (:by |root) (:id |6hNXnb-bG_) (:text |[]) (:type :leaf)
                                                  |j $ {} (:at 1545874880725) (:by |root) (:id |Fs_LlbXo5m) (:text |:data) (:type :leaf)
                                                  |n $ {} (:at 1545874901155) (:by |root) (:id |Y2TygHNiQ2) (:text |:tasks) (:type :leaf)
                                  |p $ {} (:at 1537204674404) (:by |root) (:id |mX0oOTlll8) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1537204679897) (:by |root) (:id |mX0oOTlll8leaf) (:text |:history) (:type :leaf)
                                      |j $ {} (:at 1537204680148) (:by |root) (:id |3W28k5J51a) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1537204689017) (:by |root) (:id |HuWQ_xj7t) (:text |comp-history) (:type :leaf)
                                          |b $ {} (:at 1584878878225) (:by |B1y7Rc-Zz) (:id |L968NE3xM) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1584878878860) (:by |B1y7Rc-Zz) (:id |OdtkC3lqiO) (:text |>>) (:type :leaf)
                                              |T $ {} (:at 1538156192865) (:by |root) (:id |c8uPZOXkB) (:text |states) (:type :leaf)
                                              |j $ {} (:at 1584878879708) (:by |B1y7Rc-Zz) (:id |yfhiaknKuO) (:text |:history) (:type :leaf)
                                          |d $ {} (:at 1545875984082) (:by |root) (:id |k59YtGCXt) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1545876043549) (:by |root) (:id |E3JXJjn02b) (:text |get-in) (:type :leaf)
                                              |j $ {} (:at 1545876044776) (:by |root) (:id |_F5OahxRzV) (:text |router) (:type :leaf)
                                              |r $ {} (:at 1545876044993) (:by |root) (:id |8dp3quvFcT) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1545876045241) (:by |root) (:id |EAO1jzZB0L) (:text |[]) (:type :leaf)
                                                  |j $ {} (:at 1545876047027) (:by |root) (:id |v5y_yiGN7N) (:text |:data) (:type :leaf)
                                                  |r $ {} (:at 1545876048412) (:by |root) (:id |-_8Hek-HtP) (:text |:week) (:type :leaf)
                                          |f $ {} (:at 1545876357748) (:by |root) (:id |1TAAYFK5oV) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1545876357748) (:by |root) (:id |pE33dT4t12) (:text |get-in) (:type :leaf)
                                              |j $ {} (:at 1545876357748) (:by |root) (:id |2SbvHyUyrR) (:text |router) (:type :leaf)
                                              |r $ {} (:at 1545876357748) (:by |root) (:id |CDw6rHYUlS) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1545876357748) (:by |root) (:id |nuDsnIGkhK) (:text |[]) (:type :leaf)
                                                  |j $ {} (:at 1545876357748) (:by |root) (:id |xjnIqTK0VP) (:text |:data) (:type :leaf)
                                                  |r $ {} (:at 1545876357748) (:by |root) (:id |Vmv9d4-D0B) (:text |:tasks) (:type :leaf)
                                  |q $ {} (:at 1556645411943) (:by |B1y7Rc-Zz) (:id |n6DpyjIGP9) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556645413312) (:by |B1y7Rc-Zz) (:id |n6DpyjIGP9leaf) (:text |:notes) (:type :leaf)
                                      |j $ {} (:at 1556645414027) (:by |B1y7Rc-Zz) (:id |ZXKeV91Jsw) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556645425472) (:by |B1y7Rc-Zz) (:id |pAynXvbK2) (:text |comp-notes-page) (:type :leaf)
                                          |X $ {} (:at 1584878885507) (:by |B1y7Rc-Zz) (:id |y-PXp_19sh) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1584878886316) (:by |B1y7Rc-Zz) (:id |pUDja-80nE) (:text |>>) (:type :leaf)
                                              |T $ {} (:at 1556646846053) (:by |B1y7Rc-Zz) (:id |FVw1fvZcDp) (:text |states) (:type :leaf)
                                              |j $ {} (:at 1584878887439) (:by |B1y7Rc-Zz) (:id |ydeONmiBj) (:text |:notes) (:type :leaf)
                                          |b $ {} (:at 1556645559872) (:by |B1y7Rc-Zz) (:id |IdCoESKUoa) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556645570643) (:by |B1y7Rc-Zz) (:id |uh0h9ynJS5) (:text |:data) (:type :leaf)
                                              |j $ {} (:at 1556645571408) (:by |B1y7Rc-Zz) (:id |vHe44wT3sT) (:text |router) (:type :leaf)
                                          |j $ {} (:at 1556645548308) (:by |B1y7Rc-Zz) (:id |3pmIWVTrRi) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556645550979) (:by |B1y7Rc-Zz) (:id |LX_0mrp2k) (:text |get-in) (:type :leaf)
                                              |j $ {} (:at 1556645553182) (:by |B1y7Rc-Zz) (:id |sqq03NXXrb) (:text |session) (:type :leaf)
                                              |r $ {} (:at 1556645553765) (:by |B1y7Rc-Zz) (:id |Hachwh_XKN) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1556645554723) (:by |B1y7Rc-Zz) (:id |5ipes3FML) (:text |[]) (:type :leaf)
                                                  |j $ {} (:at 1556645556715) (:by |B1y7Rc-Zz) (:id |CySm9wfoXU) (:text |:router) (:type :leaf)
                                                  |r $ {} (:at 1556645557747) (:by |B1y7Rc-Zz) (:id |L4WitJh--3) (:text |:data) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by nil) (:id |rJH998xlAH-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |H1LqqUexArZ) (:text |:profile) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |B1v5cLxgASb) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |BJd95UxlRHZ) (:text |comp-profile) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by nil) (:id |ByF99IxlCBZ) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |BJq558xxRBZ) (:text |:user) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by |root) (:id |HJo558lxAH-) (:text |store) (:type :leaf)
                                          |r $ {} (:at 1524070838527) (:by |root) (:id |rykaYxH2G) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1524070840507) (:by |root) (:id |BJxAhYgHnG) (:text |:data) (:type :leaf)
                                              |j $ {} (:at 1524070841286) (:by |root) (:id |rJbaYlH2z) (:text |router) (:type :leaf)
                              |v $ {} (:at 1500541010211) (:by nil) (:id |BkciqUxgRrZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |BysicIxgAHW) (:text |comp-login) (:type :leaf)
                                  |j $ {} (:at 1584878892631) (:by |B1y7Rc-Zz) (:id |_DYmG5C_A3) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1584878893583) (:by |B1y7Rc-Zz) (:id |bPNGvqIhqm) (:text |>>) (:type :leaf)
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |rkhocIleRrb) (:text |states) (:type :leaf)
                                      |j $ {} (:at 1584878894894) (:by |B1y7Rc-Zz) (:id |vxV7v0r0oV) (:text |:login) (:type :leaf)
                          |w $ {} (:at 1524279203814) (:by |root) (:id |S1hsPmOnM) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524279211924) (:by |root) (:id |S1hsPmOnMleaf) (:text |comp-status-color) (:type :leaf)
                              |j $ {} (:at 1524279213788) (:by |root) (:id |Bk83D7Ohf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1524279214588) (:by |root) (:id |H1BhwXu3M) (:text |:color) (:type :leaf)
                                  |j $ {} (:at 1524279215366) (:by |root) (:id |SyevnPQ_nf) (:text |store) (:type :leaf)
                          |x $ {} (:at 1521911488967) (:by |root) (:id |B1gKaUWV5M) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1521911509225) (:by |root) (:id |Sk-tpU-Vcf) (:text |when) (:type :leaf)
                              |L $ {} (:at 1521911495407) (:by |root) (:id |H1xk08W4cG) (:text |dev?) (:type :leaf)
                              |T $ {} (:at 1500541010211) (:by nil) (:id |S16oqUeeASb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkAi58lx0S-) (:text |comp-inspect) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |HJkhq8gxRrb) (:text ||Store) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by |root) (:id |Skln58ge0rb) (:text |store) (:type :leaf)
                                  |v $ {} (:at 1500541010211) (:by nil) (:id |r1fqzo4cM) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |SyeT5UllASZ) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |SJZ6qUleRS-) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |ryfp9IxgABW) (:text |:bottom) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by |root) (:id |Skma9UglRr-) (:text |0) (:type :leaf)
                                      |r $ {} (:at 1500541010211) (:by nil) (:id |r1V65Ixl0HW) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |HkBp9LllArb) (:text |:left) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by |root) (:id |ryIpcIggCrb) (:text |0) (:type :leaf)
                                      |x $ {} (:at 1537204818489) (:by |root) (:id |2r0ctJypZs) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1537204820951) (:by |root) (:id |2r0ctJypZsleaf) (:text |:z-index) (:type :leaf)
                                          |j $ {} (:at 1537204821972) (:by |root) (:id |efaZkq6AEN) (:text |9999) (:type :leaf)
                          |y $ {} (:at 1500541010211) (:by nil) (:id |H1G3c8ll0S-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1529230769433) (:by |root) (:id |HkQnqIex0Sb) (:text |comp-messages) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |Bk429LxgCS-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |S1B2cLgxCHZ) (:text |get-in) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |ryInqUelCHb) (:text |store) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by nil) (:id |SJw25Uge0BW) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |rJd398el0rZ) (:text |[]) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by |root) (:id |B1Yn98xlRrZ) (:text |:session) (:type :leaf)
                                      |r $ {} (:at 1529230765972) (:by |root) (:id |SJqh5UlgRB-) (:text |:messages) (:type :leaf)
                              |n $ {} (:at 1529230771518) (:by |root) (:id |H122BnXW7) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1529230771976) (:by |root) (:id |H122BnXW7leaf) (:text |{}) (:type :leaf)
                              |p $ {} (:at 1529230772453) (:by |root) (:id |H1m2hB2Q-Q) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1529230773090) (:by |root) (:id |H1m2hB2Q-Qleaf) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1529230773925) (:by |root) (:id |H1gA2B3mWQ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1529230775135) (:by |root) (:id |Sk0hr3X-Q) (:text |info) (:type :leaf)
                                      |j $ {} (:at 1529230778336) (:by |root) (:id |Bybgar2m-m) (:text |d!) (:type :leaf)
                                  |r $ {} (:at 1529230780551) (:by |root) (:id |HyraS3Q-m) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1529230781631) (:by |root) (:id |HyraS3Q-mleaf) (:text |d!) (:type :leaf)
                                      |j $ {} (:at 1529231458145) (:by |root) (:id |SygIaH3Xb7) (:text |:session/remove-message) (:type :leaf)
                                      |r $ {} (:at 1529230813335) (:by |root) (:id |r1eSJU2XZm) (:text |info) (:type :leaf)
                          |yT $ {} (:at 1521911502552) (:by |root) (:id |rkvCI-NcM) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1521911507241) (:by |root) (:id |rkgPCLW49z) (:text |when) (:type :leaf)
                              |L $ {} (:at 1521911504664) (:by |root) (:id |S1-_CLWN5M) (:text |dev?) (:type :leaf)
                              |T $ {} (:at 1507828710405) (:by |root) (:id |BJgRkVX62W) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1507828712159) (:by |root) (:id |BJgRkVX62Wleaf) (:text |comp-reel) (:type :leaf)
                                  |j $ {} (:at 1507829101137) (:by |root) (:id |HylruBmT3-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1507830262253) (:by |root) (:id |HyBgV7T2Z) (:text |:reel-length) (:type :leaf)
                                      |j $ {} (:at 1507829104010) (:by |root) (:id |S1MvOr7a2Z) (:text |store) (:type :leaf)
                                  |r $ {} (:at 1507828721052) (:by |root) (:id |ByteVmTnZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1507828722268) (:by |root) (:id |ByxdeN7anb) (:text |{}) (:type :leaf)
          |comp-offline $ {} (:at 1519314599832) (:by |root) (:id |rJlxhID3DM) (:type :expr)
            :data $ {}
              |T $ {} (:at 1521951399872) (:by |root) (:id |HkWenLP2vM) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1519314599832) (:by |root) (:id |BJGx2Iv2Pz) (:text |comp-offline) (:type :leaf)
              |n $ {} (:at 1521951400852) (:by |root) (:id |r1lZnMsV9z) (:type :expr)
                :data $ {}
              |r $ {} (:at 1519314599832) (:by |root) (:id |rkQx2Lv3vz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1519314599832) (:by |root) (:id |S14ghIw3Pf) (:text |div) (:type :leaf)
                  |j $ {} (:at 1519314599832) (:by |root) (:id |H1Sx2Lw3PM) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1519314599832) (:by |root) (:id |ByIghIvhwG) (:text |{}) (:type :leaf)
                      |j $ {} (:at 1519314599832) (:by |root) (:id |rkDg2ID3DM) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790464234) (:by |B1y7Rc-Zz) (:id |HJueh8whDf) (:text |:class-name) (:type :leaf)
                          |b $ {} (:at 1657790468410) (:by |B1y7Rc-Zz) (:text |css-offline) (:type :leaf)
                  |n $ {} (:at 1560786556478) (:by |B1y7Rc-Zz) (:id |By0AcDGpy) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1560786594923) (:by |B1y7Rc-Zz) (:id |By0AcDGpyleaf) (:text |div) (:type :leaf)
                      |j $ {} (:at 1560786595198) (:by |B1y7Rc-Zz) (:id |VYlX_jGWOr) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1560786595561) (:by |B1y7Rc-Zz) (:id |LuSYIaqn8c) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1560786606462) (:by |B1y7Rc-Zz) (:id |gIkHvYc_Zh) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1560786608137) (:by |B1y7Rc-Zz) (:id |VL4pg5Fxtp) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1560786608374) (:by |B1y7Rc-Zz) (:id |UU4z1XSHGc) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1560786608727) (:by |B1y7Rc-Zz) (:id |iPozwpKXVh) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1560786609168) (:by |B1y7Rc-Zz) (:id |w0yfgWlGXb) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1560786610154) (:by |B1y7Rc-Zz) (:id |Dr8MbF6inI) (:text |:height) (:type :leaf)
                                      |j $ {} (:at 1560786610806) (:by |B1y7Rc-Zz) (:id |EqpKwCcXVJ) (:text |0) (:type :leaf)
                  |p $ {} (:at 1560786615473) (:by |B1y7Rc-Zz) (:id |VpdG5aH6z) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1560786616047) (:by |B1y7Rc-Zz) (:id |VpdG5aH6zleaf) (:text |div) (:type :leaf)
                      |j $ {} (:at 1560786616276) (:by |B1y7Rc-Zz) (:id |qOAn9bHZc3) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1560786616651) (:by |B1y7Rc-Zz) (:id |UvHKrDnv5T) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1560786616885) (:by |B1y7Rc-Zz) (:id |xqd3MOL9_h) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1560786617650) (:by |B1y7Rc-Zz) (:id |kvr2hqKivJ) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1560786618399) (:by |B1y7Rc-Zz) (:id |8DQZKKYL92) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1560786618745) (:by |B1y7Rc-Zz) (:id |0UjI4ooL7d) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1560786619084) (:by |B1y7Rc-Zz) (:id |r1Ji2jon3a) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1560786623896) (:by |B1y7Rc-Zz) (:id |Uj4I5n6zx9) (:text |:background-image) (:type :leaf)
                                      |j $ {} (:at 1560786624593) (:by |B1y7Rc-Zz) (:id |zdr1eAw0A) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1560786649894) (:by |B1y7Rc-Zz) (:id |ESNfd_aD9z) (:text |str) (:type :leaf)
                                          |j $ {} (:at 1560786684090) (:by |B1y7Rc-Zz) (:id |PwLKE900Zj) (:text "|\"url(") (:type :leaf)
                                          |n $ {} (:at 1560786653991) (:by |B1y7Rc-Zz) (:id |Thuff1jEvH) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1560786655147) (:by |B1y7Rc-Zz) (:id |WR2NkDoBSM) (:text |:icon) (:type :leaf)
                                              |j $ {} (:at 1560786662127) (:by |B1y7Rc-Zz) (:id |enfsDlvZq) (:text |config/site) (:type :leaf)
                                          |r $ {} (:at 1560786652861) (:by |B1y7Rc-Zz) (:id |EylPP1kDO_) (:text "|\")") (:type :leaf)
                                  |r $ {} (:at 1560786626567) (:by |B1y7Rc-Zz) (:id |N1XtkxpMx) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1560786629509) (:by |B1y7Rc-Zz) (:id |N1XtkxpMxleaf) (:text |:width) (:type :leaf)
                                      |j $ {} (:at 1560786631277) (:by |B1y7Rc-Zz) (:id |R3BTGWsTy) (:text |128) (:type :leaf)
                                  |v $ {} (:at 1560786631801) (:by |B1y7Rc-Zz) (:id |gwzOURJUjj) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1560786633270) (:by |B1y7Rc-Zz) (:id |gwzOURJUjjleaf) (:text |:height) (:type :leaf)
                                      |j $ {} (:at 1560786639326) (:by |B1y7Rc-Zz) (:id |f--2pj9rXf) (:text |128) (:type :leaf)
                                  |x $ {} (:at 1560786640079) (:by |B1y7Rc-Zz) (:id |2JP_MiN5qH) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1560786643359) (:by |B1y7Rc-Zz) (:id |2JP_MiN5qHleaf) (:text |:background-size) (:type :leaf)
                                      |j $ {} (:at 1560786644360) (:by |B1y7Rc-Zz) (:id |GEGy4FADVa) (:text |:contain) (:type :leaf)
                  |r $ {} (:at 1519314599832) (:by |root) (:id |HyRx3IDnPM) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1519314599832) (:by |root) (:id |SJkll2LP2wM) (:text |span) (:type :leaf)
                      |j $ {} (:at 1519314599832) (:by |root) (:id |BJgex3Lw3Pf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1519314599832) (:by |root) (:id |HkbeenIw3wf) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1519314599832) (:by |root) (:id |Syfgx28wnPf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1519314599832) (:by |root) (:id |Symgxn8v2vG) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1519314599832) (:by |root) (:id |rkVlg3LDnDG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1519314599832) (:by |root) (:id |SkHxlhUv2vz) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1519314599832) (:by |root) (:id |H1Lgg3UwhPz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1519314599832) (:by |root) (:id |S1Pee2UD3wz) (:text |:cursor) (:type :leaf)
                                      |j $ {} (:at 1519314599832) (:by |root) (:id |HyOgl2IvnPM) (:text |:pointer) (:type :leaf)
                          |r $ {} (:at 1519314599832) (:by |root) (:id |SkKle2LPnvf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1519314599832) (:by |root) (:id |Hy9xl28D2PG) (:text |:on-click) (:type :leaf)
                              |j $ {} (:at 1584879193836) (:by |B1y7Rc-Zz) (:id |gsUmLl4TCo) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1584879194365) (:by |B1y7Rc-Zz) (:id |_yE9HN8b7) (:text |fn) (:type :leaf)
                                  |L $ {} (:at 1584879194596) (:by |B1y7Rc-Zz) (:id |u_VWZ3MiaM) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584879194821) (:by |B1y7Rc-Zz) (:id |PF39FtsRT3) (:text |e) (:type :leaf)
                                      |j $ {} (:at 1584879195763) (:by |B1y7Rc-Zz) (:id |YHqmb0dVgj) (:text |d!) (:type :leaf)
                                  |T $ {} (:at 1519314599832) (:by |root) (:id |S1mufs49z) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584879193434) (:by |B1y7Rc-Zz) (:id |r1GZl2Lw2wG) (:text |d!) (:type :leaf)
                                      |j $ {} (:at 1519314599832) (:by |root) (:id |rkmZln8v2wG) (:text |:effect/connect) (:type :leaf)
                                      |r $ {} (:at 1519314599832) (:by |root) (:id |HJNWe28w3wG) (:text |nil) (:type :leaf)
                      |r $ {} (:at 1519314599832) (:by |root) (:id |r1r-lhLPnvf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1519314599832) (:by |root) (:id |r1Ube2LP2PM) (:text |<>) (:type :leaf)
                          |j $ {} (:at 1521911618586) (:by |root) (:id |r1DWxhIP3wG) (:text "||Socket broken! Click to retry.") (:type :leaf)
                          |r $ {} (:at 1500541010211) (:by nil) (:id |ryuSziE9f) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |HkxN5IggCSZ) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |BkZ4qUxgABZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |ByzE9Lxe0BW) (:text |:font-family) (:type :leaf)
                                  |j $ {} (:at 1521951303103) (:by |root) (:id |Skm4cUlgRrZ) (:text |ui/font-fancy) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |rk4NcIlxRBb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkrV9Ile0BZ) (:text |:font-weight) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |r18N9UlxASZ) (:text |100) (:type :leaf)
                              |v $ {} (:at 1500541010211) (:by nil) (:id |ByvVqIxlCBW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |HkuNcLlxRrW) (:text |:font-size) (:type :leaf)
                                  |j $ {} (:at 1560786711494) (:by |B1y7Rc-Zz) (:id |SJYNcUxxASZ) (:text |24) (:type :leaf)
          |comp-status-color $ {} (:at 1524279216692) (:by |root) (:id |Sket2DQd3f) (:type :expr)
            :data $ {}
              |T $ {} (:at 1524279218316) (:by |root) (:id |S1ZK3DXd3G) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1524279216692) (:by |root) (:id |SkzYhwm_3f) (:text |comp-status-color) (:type :leaf)
              |r $ {} (:at 1524279216692) (:by |root) (:id |SkmYnwXdnM) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1524279220380) (:by |root) (:id |HkWi3Dmd2G) (:text |color) (:type :leaf)
              |v $ {} (:at 1524279221052) (:by |root) (:id |rJgTnPmu2G) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1524279221503) (:by |root) (:id |rJgTnPmu2Gleaf) (:text |div) (:type :leaf)
                  |j $ {} (:at 1524279221753) (:by |root) (:id |rJlA3DXOhf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1524279222145) (:by |root) (:id |ByA3Dm_2f) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1657791384447) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657791387640) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                          |b $ {} (:at 1657791395605) (:by |B1y7Rc-Zz) (:text |css-status-color) (:type :leaf)
                      |j $ {} (:at 1524279222434) (:by |root) (:id |r1ER2vQ_3G) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1524279223333) (:by |root) (:id |BJmAnP7_nz) (:text |:style) (:type :leaf)
                          |j $ {} (:at 1524279223555) (:by |root) (:id |SyeTD7dnz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1657791422427) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                              |L $ {} (:at 1657791422978) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657791422978) (:by |B1y7Rc-Zz) (:text |:background-color) (:type :leaf)
                                  |b $ {} (:at 1657791422978) (:by |B1y7Rc-Zz) (:text |color) (:type :leaf)
                              |T $ {} (:at 1657791420359) (:by |B1y7Rc-Zz) (:id |H1S1TD7_2z) (:text |) (:type :leaf)
          |css-container $ {} (:at 1657790534708) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1657790536530) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1657790534708) (:by |B1y7Rc-Zz) (:text |css-container) (:type :leaf)
              |h $ {} (:at 1657790534708) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1657790537999) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1657790538277) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1657790539332) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1657790541250) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |merge) (:type :leaf)
                          |b $ {} (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |ui/global) (:type :leaf)
                          |h $ {} (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |ui/fullscreen) (:type :leaf)
                          |l $ {} (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |ui/column) (:type :leaf)
          |css-offline $ {} (:at 1657790468736) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1657790482645) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1657790472509) (:by |B1y7Rc-Zz) (:text |css-offline) (:type :leaf)
              |h $ {} (:at 1657790476345) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1657790477587) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |T $ {} (:at 1657790478056) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1657790479614) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |T $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |merge) (:type :leaf)
                          |b $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |ui/global) (:type :leaf)
                          |h $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |ui/fullscreen) (:type :leaf)
                          |l $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |ui/column-dispersive) (:type :leaf)
                          |o $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |:background-color) (:type :leaf)
                                  |b $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |:theme) (:type :leaf)
                                      |b $ {} (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |config/site) (:type :leaf)
          |css-status-color $ {} (:at 1657791400758) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1657791402160) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1657791400758) (:by |B1y7Rc-Zz) (:text |css-status-color) (:type :leaf)
              |h $ {} (:at 1657791400758) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1657791404570) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1657791405385) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1657791407061) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:width) (:type :leaf)
                              |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                          |h $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:height) (:type :leaf)
                              |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                          |l $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:position) (:type :leaf)
                              |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:absolute) (:type :leaf)
                          |o $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:bottom) (:type :leaf)
                              |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                          |q $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:right) (:type :leaf)
                              |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |8) (:type :leaf)
                          |t $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:border-radius) (:type :leaf)
                              |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text "|\"8px") (:type :leaf)
                          |u $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:opacity) (:type :leaf)
                              |b $ {} (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |0.8) (:type :leaf)
                          |v $ {} (:at 1658934754885) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658934765167) (:by |B1y7Rc-Zz) (:text |:transition-duration) (:type :leaf)
                              |b $ {} (:at 1658934769976) (:by |B1y7Rc-Zz) (:text "|\"200ms") (:type :leaf)
                          |w $ {} (:at 1658934843230) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658934845979) (:by |B1y7Rc-Zz) (:text |:opacity) (:type :leaf)
                              |b $ {} (:at 1658934947011) (:by |B1y7Rc-Zz) (:text |0.5) (:type :leaf)
                  |h $ {} (:at 1658934849400) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658934875109) (:by |B1y7Rc-Zz) (:text "|\"$0:hover") (:type :leaf)
                      |b $ {} (:at 1658934854690) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1658934855197) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |T $ {} (:at 1658934854284) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658934854284) (:by |B1y7Rc-Zz) (:text |:opacity) (:type :leaf)
                              |b $ {} (:at 1658934935912) (:by |B1y7Rc-Zz) (:text |0.7) (:type :leaf)
          |style-body $ {} (:at 1500541010211) (:by nil) (:id |ry965UlxRH-) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |rkoaq8ge0BW) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |Sk2p9UxgRBW) (:text |style-body) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |BJ66q8egCSZ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |B1ApqUxg0B-) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1500541010211) (:by nil) (:id |SJJR9Ueg0HZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |Sye0cIle0B-) (:text |:padding) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by |root) (:id |rkWR58eeCHZ) (:text "||8px 16px") (:type :leaf)
        :ns $ {} (:at 1500541010211) (:by nil) (:id |B15IxeRH-) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541010211) (:by |root) (:id |SJxc8xl0HZ) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541010211) (:by |root) (:id |SkZcLgxAB-) (:text |app.comp.container) (:type :leaf)
            |v $ {} (:at 1500541010211) (:by nil) (:id |SkCq8lx0rb) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541010211) (:by |root) (:id |HyJlqLelRBW) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541010211) (:by nil) (:id |SylgqLee0B-) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |H1Gxq8xgCB-) (:text |hsl.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |SJQlcUlgRr-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |By4lc8gxCB-) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |rJIlq8leCBb) (:text |hsl) (:type :leaf)
                |r $ {} (:at 1500541010211) (:by nil) (:id |ryvl5IllRSb) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1516547378489) (:by |root) (:id |H1Fgc8egCSW) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |Hy9x5IeeASW) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |rkoe5LxlCBW) (:text |ui) (:type :leaf)
                |u $ {} (:at 1657790485756) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790487540) (:by |B1y7Rc-Zz) (:text |respo-ui.css) (:type :leaf)
                    |b $ {} (:at 1657790488028) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1657790488602) (:by |B1y7Rc-Zz) (:text |css) (:type :leaf)
                |v $ {} (:at 1657790513065) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790514501) (:by |B1y7Rc-Zz) (:text |respo.css) (:type :leaf)
                    |b $ {} (:at 1657790516358) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1657790516716) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1657790516991) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
                |x $ {} (:at 1500541010211) (:by nil) (:id |B1gpZxc3yG) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1542907252464) (:by |B1y7Rc-Zz) (:id |H189Igg0S-) (:text |respo.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |HJw9LexRS-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |B1_98eeRSb) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |SkqqIggASZ) (:text |defcomp) (:type :leaf)
                        |r $ {} (:at 1500541010211) (:by |root) (:id |SysqUxxRH-) (:text |<>) (:type :leaf)
                        |t $ {} (:at 1584878865372) (:by |B1y7Rc-Zz) (:id |onK4_2gnon) (:text |>>) (:type :leaf)
                        |v $ {} (:at 1500541010211) (:by |root) (:id |Bkh9UglCrZ) (:text |div) (:type :leaf)
                        |x $ {} (:at 1500541010211) (:by |root) (:id |BkaqLel0H-) (:text |span) (:type :leaf)
                        |y $ {} (:at 1507815955483) (:by |root) (:id |ryjGzeahb) (:text |button) (:type :leaf)
                |y $ {} (:at 1500541010211) (:by nil) (:id |rJu-cIxlRSZ) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |By9-qLxlRHW) (:text |respo.comp.inspect) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |S1oZq8gl0r-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |rk2ZqUlx0SZ) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |SJ0bqLggCH-) (:text |comp-inspect) (:type :leaf)
                |yD $ {} (:at 1507816109319) (:by |root) (:id |Sklr2Mg6n-) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1507816117447) (:by |root) (:id |SkbLhMlp3b) (:text |respo.comp.space) (:type :leaf)
                    |r $ {} (:at 1507816112686) (:by |root) (:id |H1GOhGephb) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1507816113982) (:by |root) (:id |rk-53Mlah-) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1507816114704) (:by |root) (:id |SyN5nGgThZ) (:text |=<) (:type :leaf)
                |yT $ {} (:at 1500541010211) (:by nil) (:id |H1kGc8glRHW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1523120275079) (:by |root) (:id |B1-f5UgeABb) (:text |app.comp.navigation) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |rkzM98gxRrZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |Bymz5LglArW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1523120276563) (:by |root) (:id |rkBfcLggCBb) (:text |comp-navigation) (:type :leaf)
                |yj $ {} (:at 1500541010211) (:by nil) (:id |HJ8M5UeeCS-) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |H1_fq8geCHb) (:text |app.comp.profile) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |ryFz9LglCHb) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |r1qfqUlxASb) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |H12z9LxxCHW) (:text |comp-profile) (:type :leaf)
                |yr $ {} (:at 1500541010211) (:by nil) (:id |Bypz9LxxRSW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |Hkk7qUgxAr-) (:text |app.comp.login) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |SJg798xxAHW) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |HJ-m9Ueg0SW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |r1Qmq8gxCrW) (:text |comp-login) (:type :leaf)
                |yv $ {} (:at 1500541010211) (:by nil) (:id |SyE7qLleCHW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1529230826824) (:by |root) (:id |HkIQ9Iel0Hb) (:text |respo-message.comp.messages) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |ryv7cIgeCrZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |Hk_7c8eg0rW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1529230829559) (:by |root) (:id |BJcQcUxxASW) (:text |comp-messages) (:type :leaf)
                |yx $ {} (:at 1507828725931) (:by |root) (:id |BklAlV7a2Z) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1543426558411) (:by |B1y7Rc-Zz) (:id |ry7AeNmT3b) (:text |cumulo-reel.comp.reel) (:type :leaf)
                    |r $ {} (:at 1507828731528) (:by |root) (:id |H1bQW4762Z) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1507828731735) (:by |root) (:id |Sk-NbNmT3W) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1507828733743) (:by |root) (:id |Bk44ZNXT2Z) (:text |comp-reel) (:type :leaf)
                |yy $ {} (:at 1521911479054) (:by |root) (:id |BygkTL-EqM) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1527789167264) (:by |root) (:id |SJMe6IZ45z) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1521911483589) (:by |root) (:id |B1GaI-V5M) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1521911483778) (:by |root) (:id |BJb4T8ZNcM) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1521911485489) (:by |root) (:id |rJ4V6Lb49f) (:text |dev?) (:type :leaf)
                |yyj $ {} (:at 1529230793085) (:by |root) (:id |B1Z0rnQWm) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1529230796079) (:by |root) (:id |rJGbRHh7W7) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1529230796499) (:by |root) (:id |r1ZEAH2m-m) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1529230797248) (:by |root) (:id |ByBAH37Zm) (:text |schema) (:type :leaf)
                |yyr $ {} (:at 1533618669977) (:by |root) (:id |haxR4bEyUB) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1533618674804) (:by |root) (:id |lczb__E7Gm) (:text |app.comp.overview) (:type :leaf)
                    |r $ {} (:at 1533618675473) (:by |root) (:id |B6r98xgenb) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1533618675752) (:by |root) (:id |7sSUXGYF0J) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1533618679378) (:by |root) (:id |i82mb_7Nw6) (:text |comp-overview) (:type :leaf)
                |yyv $ {} (:at 1536733201791) (:by |B1y7Rc-Zz) (:id |aSn7nVdMGH) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1536733201791) (:by |B1y7Rc-Zz) (:id |WzRQGat2D8) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1536733201791) (:by |B1y7Rc-Zz) (:id |Y-tXZPyJj1) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1536733201791) (:by |B1y7Rc-Zz) (:id |dWmxbggPma) (:text |config) (:type :leaf)
                |yyx $ {} (:at 1537204685392) (:by |root) (:id |tPNOTRXqEV) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1537204685392) (:by |root) (:id |X0qHpBWeBi) (:text |app.comp.history) (:type :leaf)
                    |r $ {} (:at 1537204685392) (:by |root) (:id |WipVw0n-pz) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1537204685392) (:by |root) (:id |G3hxpQoqd5) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1537204685392) (:by |root) (:id |KimqXE9j5Q) (:text |comp-history) (:type :leaf)
                |yyyT $ {} (:at 1556645418463) (:by |B1y7Rc-Zz) (:id |he27h7NVQO) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1556645418463) (:by |B1y7Rc-Zz) (:id |sb_CBZQ0_w) (:text |app.comp.notes-page) (:type :leaf)
                    |r $ {} (:at 1556645418463) (:by |B1y7Rc-Zz) (:id |iEpP-dghTY) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1556645418463) (:by |B1y7Rc-Zz) (:id |rnHGF_J6Rs) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1556645418463) (:by |B1y7Rc-Zz) (:id |1pt7AYsg0l) (:text |comp-notes-page) (:type :leaf)
        :proc $ {} (:at 1500541010211) (:by nil) (:id |S1om9LgxCBZ) (:type :expr)
          :data $ {}
      |app.comp.history $ {}
        :defs $ {}
          |comp-done-task $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |1vdfPN6UBb) (:type :expr)
            :data $ {}
              |T $ {} (:at 1536732529782) (:by |B1y7Rc-Zz) (:id |RIm42vlWus) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |_vxYfzsuYo) (:text |comp-done-task) (:type :leaf)
              |n $ {} (:at 1536732530658) (:by |B1y7Rc-Zz) (:id |5MEEjCKkS) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1538156219849) (:by |root) (:id |SGSEy8rJ7v) (:text |states) (:type :leaf)
                  |T $ {} (:at 1536732532106) (:by |B1y7Rc-Zz) (:id |oeSqE6IL2) (:text |task) (:type :leaf)
              |r $ {} (:at 1538156319059) (:by |root) (:id |dN6ASClGk7) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1538156320470) (:by |root) (:id |m92gU_6GU6) (:text |let) (:type :leaf)
                  |L $ {} (:at 1538156320703) (:by |root) (:id |5SgDvr5Z9) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1584879268922) (:by |B1y7Rc-Zz) (:id |xF1cJxvu2) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584879269866) (:by |B1y7Rc-Zz) (:id |xF1cJxvu2leaf) (:text |cursor) (:type :leaf)
                          |j $ {} (:at 1584879270076) (:by |B1y7Rc-Zz) (:id |MzqoScErm) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584879271108) (:by |B1y7Rc-Zz) (:id |ySjVxjjqvc) (:text |:cursor) (:type :leaf)
                              |j $ {} (:at 1584879502137) (:by |B1y7Rc-Zz) (:id |UCJseA3fQj) (:text |states) (:type :leaf)
                      |T $ {} (:at 1538156320871) (:by |root) (:id |VK7DIzE3LW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1538156333250) (:by |root) (:id |i6UE33ZWK) (:text |state) (:type :leaf)
                          |j $ {} (:at 1538156333573) (:by |root) (:id |pVE5DtEwM) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1538156334123) (:by |root) (:id |yHMKT1NdDA) (:text |or) (:type :leaf)
                              |j $ {} (:at 1538156334350) (:by |root) (:id |D71_zrsQ8L) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538156336180) (:by |root) (:id |8cIPp9Q0LV) (:text |:data) (:type :leaf)
                                  |j $ {} (:at 1538156337585) (:by |root) (:id |Dmt0gbNyKy) (:text |states) (:type :leaf)
                              |r $ {} (:at 1538156338779) (:by |root) (:id |re61biqaxQ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538156339352) (:by |root) (:id |re61biqaxQleaf) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1538156339688) (:by |root) (:id |0H2o6BtRxg) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1538156341590) (:by |root) (:id |8FxlO72AW) (:text |:show-menu?) (:type :leaf)
                                      |j $ {} (:at 1538156806313) (:by |root) (:id |KBlDgdKVL_) (:text |false) (:type :leaf)
                  |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |Tejtjtimfw) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |r5PKsS__p8) (:text |div) (:type :leaf)
                      |j $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |SxfZ0nXXGh) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |kBrKIMKtsn) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935441660) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935443861) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                              |b $ {} (:at 1658935458653) (:by |B1y7Rc-Zz) (:text |css-done-task) (:type :leaf)
                          |j $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |uarGOQBTOg) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |DzxSAviYq9) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1537205669500) (:by |root) (:id |WdO8NLlJ_2) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1537205670912) (:by |root) (:id |3Ui21h9yz) (:text |merge) (:type :leaf)
                                  |j $ {} (:at 1537205671698) (:by |root) (:id |AIjTIE8Iy) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1537205672102) (:by |root) (:id |5dxJ9sTTaq) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1537205672381) (:by |root) (:id |Ippq5fbdMa) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1537205673542) (:by |root) (:id |rsr4OWSzw0) (:text |:padding) (:type :leaf)
                                          |j $ {} (:at 1557586705243) (:by |B1y7Rc-Zz) (:id |CKTwEgMwl4) (:text "|\"4px 8px") (:type :leaf)
                                  |r $ {} (:at 1538239935263) (:by |root) (:id |pA4zD02aji) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1538239936238) (:by |root) (:id |pA4zD02ajileaf) (:text |when) (:type :leaf)
                                      |j $ {} (:at 1538239936681) (:by |root) (:id |C9r9284Nd) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1538239940039) (:by |root) (:id |Uv2dxr4hEV) (:text |:show-menu?) (:type :leaf)
                                          |j $ {} (:at 1538239941704) (:by |root) (:id |o2j48UjIFY) (:text |state) (:type :leaf)
                                      |r $ {} (:at 1538239942769) (:by |root) (:id |0IVwV5Tyl) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1538239943120) (:by |root) (:id |0IVwV5Tylleaf) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1538239943492) (:by |root) (:id |Wsdw4Kq2sw) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1538239947358) (:by |root) (:id |TfSey4B2Zx) (:text |:background-color) (:type :leaf)
                                              |j $ {} (:at 1538239947589) (:by |root) (:id |vD20AJa4W) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1538239948699) (:by |root) (:id |s-mYco4ELy) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1538239949026) (:by |root) (:id |gq0bp_0MOX) (:text |0) (:type :leaf)
                                                  |r $ {} (:at 1538239949332) (:by |root) (:id |Fql6kApnyh) (:text |0) (:type :leaf)
                                                  |v $ {} (:at 1538239955630) (:by |root) (:id |IWQaZZ1MO) (:text |94) (:type :leaf)
                          |r $ {} (:at 1538156784826) (:by |root) (:id |zdt0V_Bsd) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1538156787336) (:by |root) (:id |zdt0V_Bsdleaf) (:text |:on-click) (:type :leaf)
                              |j $ {} (:at 1538156787736) (:by |root) (:id |y8rDJXBZu) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538156788116) (:by |root) (:id |2SwENUJzqs) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1538156788371) (:by |root) (:id |IfGA8IrNEJ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1538156788609) (:by |root) (:id |0nTnQ_8GVC) (:text |e) (:type :leaf)
                                      |j $ {} (:at 1538156789257) (:by |root) (:id |TJdzZM03m6) (:text |d!) (:type :leaf)
                                  |r $ {} (:at 1538156790942) (:by |root) (:id |aIp5gf0MZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584879275417) (:by |B1y7Rc-Zz) (:id |aIp5gf0MZleaf) (:text |d!) (:type :leaf)
                                      |b $ {} (:at 1584879276363) (:by |B1y7Rc-Zz) (:id |1ykYxvvA_w) (:text |cursor) (:type :leaf)
                                      |j $ {} (:at 1538156792315) (:by |root) (:id |ry6KoawYlu) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1538156798880) (:by |root) (:id |xa_7iIdi9N) (:text |assoc) (:type :leaf)
                                          |j $ {} (:at 1538156796795) (:by |root) (:id |eN5umMJwva) (:text |state) (:type :leaf)
                                          |r $ {} (:at 1538156803280) (:by |root) (:id |qRDdgJw1S) (:text |:show-menu?) (:type :leaf)
                                          |v $ {} (:at 1538156804543) (:by |root) (:id |itao1HxhE) (:text |true) (:type :leaf)
                      |r $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |_zTWgAYoxM) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |-J8RUPy-yV) (:text |<>) (:type :leaf)
                          |j $ {} (:at 1658935484809) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1658935485598) (:by |B1y7Rc-Zz) (:text |->) (:type :leaf)
                              |H $ {} (:at 1658935497720) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1658935497720) (:by |B1y7Rc-Zz) (:text |:finished-time) (:type :leaf)
                                  |b $ {} (:at 1658935497720) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                              |L $ {} (:at 1658935489487) (:by |B1y7Rc-Zz) (:text |dayjs) (:type :leaf)
                              |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |yJNyErIRUl) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1658935434951) (:by |B1y7Rc-Zz) (:id |9YjHt10HBe) (:text |.!format) (:type :leaf)
                                  |r $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |9OM30__XJM) (:text "|\"HH:mm") (:type :leaf)
                          |r $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |VEpJw5OPqur) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |EgDK7wNpK2H) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |a5_FHfN-Rn1) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |FOJTRJOGFp9) (:text |:min-width) (:type :leaf)
                                  |j $ {} (:at 1557586990143) (:by |B1y7Rc-Zz) (:id |FPCCgXv3-a5) (:text |32) (:type :leaf)
                              |r $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |aV-K_2D4pxt) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |58l4RNREmUo) (:text |:color) (:type :leaf)
                                  |j $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |2nqplU6YjB4) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |3uYqB5o6ZCA) (:text |hsl) (:type :leaf)
                                      |j $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |ftKmckDw2za) (:text |0) (:type :leaf)
                                      |r $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |VbQhZ3uphff) (:text |0) (:type :leaf)
                                      |v $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |1YUgrZ8xwsX) (:text |80) (:type :leaf)
                              |v $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |luHdt5O-X18) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |yJkCvDqsJAL) (:text |:font-size) (:type :leaf)
                                  |j $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |GC7NqFaxgtv) (:text |12) (:type :leaf)
                              |x $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |X0eiHLCE-9b) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |sfBt4qNsFT6) (:text |:display) (:type :leaf)
                                  |j $ {} (:at 1557586964401) (:by |B1y7Rc-Zz) (:id |3w_ceOdCdXO) (:text |:inline-block) (:type :leaf)
                      |t $ {} (:at 1557586877586) (:by |B1y7Rc-Zz) (:id |tl0HDyC9c) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557586878761) (:by |B1y7Rc-Zz) (:id |tl0HDyC9cleaf) (:text |=<) (:type :leaf)
                          |j $ {} (:at 1557586983808) (:by |B1y7Rc-Zz) (:id |b7zoZA2FXx) (:text |4) (:type :leaf)
                          |r $ {} (:at 1557586880301) (:by |B1y7Rc-Zz) (:id |z-HUBEJFp) (:text |nil) (:type :leaf)
                      |v $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |-irqbjYdPQe) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557586869174) (:by |B1y7Rc-Zz) (:id |OJeKu8iN7an) (:text |span) (:type :leaf)
                          |j $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |6IE9r5ylO6f) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |MKjvwU0nzYT) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |AF8pmZmKK1w) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |6CF5StHprt4) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1537205639633) (:by |root) (:id |w6PaLpYSg) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1537205641989) (:by |root) (:id |32irtr5GNp) (:text |merge) (:type :leaf)
                                      |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |FSMs_TRT5KN) (:text |ui/flex) (:type :leaf)
                                      |j $ {} (:at 1537205642697) (:by |root) (:id |SV3JqF7vbg) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1537205643834) (:by |root) (:id |TIFtSxjhl) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1537205644225) (:by |root) (:id |mF31afcnox) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1537205647137) (:by |root) (:id |VWN-2xQeWW) (:text |:line-height) (:type :leaf)
                                              |j $ {} (:at 1537205651787) (:by |root) (:id |n1DQ-Ir--i) (:text "|\"24px") (:type :leaf)
                          |r $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |r0HGe9DEsKz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |9MG-_uRPrXz) (:text |<>) (:type :leaf)
                              |j $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |Wh7U8ghDnlL) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |7-ExZjafdSq) (:text |:text) (:type :leaf)
                                  |j $ {} (:at 1536732528170) (:by |B1y7Rc-Zz) (:id |1vx8CSHYTKR) (:text |task) (:type :leaf)
                      |w $ {} (:at 1572937317170) (:by |B1y7Rc-Zz) (:id |IhjqElMGkm) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1572937331632) (:by |B1y7Rc-Zz) (:id |IhjqElMGkmleaf) (:text |comp-modal-menu) (:type :leaf)
                          |r $ {} (:at 1572937335855) (:by |B1y7Rc-Zz) (:id |J4pb045pH) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572937336184) (:by |B1y7Rc-Zz) (:id |iDinJLcJaH) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1572937336710) (:by |B1y7Rc-Zz) (:id |BwTslrsPWL) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572937337438) (:by |B1y7Rc-Zz) (:id |B-cSnQODF) (:text |:title) (:type :leaf)
                                  |j $ {} (:at 1572937341514) (:by |B1y7Rc-Zz) (:id |rxHkKlhBP) (:text "|\"Operations") (:type :leaf)
                              |r $ {} (:at 1572937343044) (:by |B1y7Rc-Zz) (:id |adgLV3K_2) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572937344978) (:by |B1y7Rc-Zz) (:id |adgLV3K_2leaf) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1572937345207) (:by |B1y7Rc-Zz) (:id |kaovp6BlmF) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937345532) (:by |B1y7Rc-Zz) (:id |ZPGqmp0WD1) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1572937345832) (:by |B1y7Rc-Zz) (:id |KN2vOnEPtX) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937347687) (:by |B1y7Rc-Zz) (:id |mb9brQJJIJ) (:text |:width) (:type :leaf)
                                          |j $ {} (:at 1572937350227) (:by |B1y7Rc-Zz) (:id |o5M3zz3PBL) (:text |320) (:type :leaf)
                              |v $ {} (:at 1584879757983) (:by |B1y7Rc-Zz) (:id |mYrZ6OPbWz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584879758878) (:by |B1y7Rc-Zz) (:id |mYrZ6OPbWzleaf) (:text |:items) (:type :leaf)
                                  |j $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |uLyR7iEEY_) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |u--7_JUfwB) (:text |[]) (:type :leaf)
                                      |j $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |8gfdfx33Kv) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |qiEj_0qITh) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |GNCajG6KLq) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |fX6XjFspGj) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |b0l_5RBNPU) (:text |:put-back) (:type :leaf)
                                          |r $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |WLuactJ_tk) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |W9XN0Qt9dz) (:text |:display) (:type :leaf)
                                              |j $ {} (:at 1584879759278) (:by |B1y7Rc-Zz) (:id |MlocDW13Gy) (:text "|\"Put back") (:type :leaf)
                          |u $ {} (:at 1584880091893) (:by |B1y7Rc-Zz) (:id |3-P88djIyc) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584880091893) (:by |B1y7Rc-Zz) (:id |hY7fco1dBv) (:text |:show-menu?) (:type :leaf)
                              |j $ {} (:at 1584880091893) (:by |B1y7Rc-Zz) (:id |GBwnNauM2b) (:text |state) (:type :leaf)
                          |x $ {} (:at 1572937373941) (:by |B1y7Rc-Zz) (:id |jmo1QkOvf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572937374259) (:by |B1y7Rc-Zz) (:id |jmo1QkOvfleaf) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1572937379002) (:by |B1y7Rc-Zz) (:id |UYTgQAQb7B) (:type :expr)
                                :data $ {}
                                  |r $ {} (:at 1584879279358) (:by |B1y7Rc-Zz) (:id |DaAxa7smO2) (:text |d!) (:type :leaf)
                              |r $ {} (:at 1572937382189) (:by |B1y7Rc-Zz) (:id |c4Wu0xVrqf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584879281199) (:by |B1y7Rc-Zz) (:id |S3mDpbk_d6) (:text |d!) (:type :leaf)
                                  |b $ {} (:at 1584879282365) (:by |B1y7Rc-Zz) (:id |59Rw58QGuu) (:text |cursor) (:type :leaf)
                                  |j $ {} (:at 1572937382189) (:by |B1y7Rc-Zz) (:id |NLHsaoqYQb) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937382189) (:by |B1y7Rc-Zz) (:id |eA-8PpTaBR) (:text |assoc) (:type :leaf)
                                      |j $ {} (:at 1572937382189) (:by |B1y7Rc-Zz) (:id |8trx27YglK) (:text |state) (:type :leaf)
                                      |r $ {} (:at 1572937382189) (:by |B1y7Rc-Zz) (:id |kEL05uq3Hx) (:text |:show-menu?) (:type :leaf)
                                      |v $ {} (:at 1572937382189) (:by |B1y7Rc-Zz) (:id |0OPM2NPudF) (:text |false) (:type :leaf)
                          |y $ {} (:at 1572937384057) (:by |B1y7Rc-Zz) (:id |ZHEicUQyUd) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572937384329) (:by |B1y7Rc-Zz) (:id |ZHEicUQyUdleaf) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1572937384582) (:by |B1y7Rc-Zz) (:id |1NcEs6i9y) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572937387608) (:by |B1y7Rc-Zz) (:id |kFOS82xBPA) (:text |item) (:type :leaf)
                                  |j $ {} (:at 1572937388074) (:by |B1y7Rc-Zz) (:id |kzOvuAy-Uv) (:text |d!) (:type :leaf)
                              |n $ {} (:at 1572937397821) (:by |B1y7Rc-Zz) (:id |f3qC8nJhPE) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584879288792) (:by |B1y7Rc-Zz) (:id |U1beykv3r6) (:text |d!) (:type :leaf)
                                  |b $ {} (:at 1584879289752) (:by |B1y7Rc-Zz) (:id |nZ-upRPlHe) (:text |cursor) (:type :leaf)
                                  |j $ {} (:at 1572937397821) (:by |B1y7Rc-Zz) (:id |LQb4HKktkX) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937397821) (:by |B1y7Rc-Zz) (:id |tFZUuNwE8F) (:text |assoc) (:type :leaf)
                                      |j $ {} (:at 1572937397821) (:by |B1y7Rc-Zz) (:id |pBec_QqcH_) (:text |state) (:type :leaf)
                                      |r $ {} (:at 1572937397821) (:by |B1y7Rc-Zz) (:id |Hq822MZ5yA) (:text |:show-menu?) (:type :leaf)
                                      |v $ {} (:at 1572937397821) (:by |B1y7Rc-Zz) (:id |hqVSLyZUSA) (:text |false) (:type :leaf)
                              |r $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |ZyO3DHDr0J) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |37ntcaDVlA) (:text |when) (:type :leaf)
                                  |j $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |J9_wWj9lU5) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |mLI244jbbQ) (:text |=) (:type :leaf)
                                      |j $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |jH7oyQWryg) (:text |:put-back) (:type :leaf)
                                      |r $ {} (:at 1572937598886) (:by |B1y7Rc-Zz) (:id |_3Qh53wWV) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937600845) (:by |B1y7Rc-Zz) (:id |Xruzyf6TDt) (:text |:value) (:type :leaf)
                                          |j $ {} (:at 1572937601589) (:by |B1y7Rc-Zz) (:id |F4lZ9eV0fh) (:text |item) (:type :leaf)
                                  |r $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |bIS_JgBg5q) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |RmVM54YXRU) (:text |d!) (:type :leaf)
                                      |j $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |FafAA19I04) (:text |:task/put-back) (:type :leaf)
                                      |r $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |ydBGiib5dv) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |Mur8HnAhYl) (:text |:id) (:type :leaf)
                                          |j $ {} (:at 1572937394928) (:by |B1y7Rc-Zz) (:id |mq45lu2Tfh) (:text |task) (:type :leaf)
          |comp-history $ {} (:at 1500541010211) (:by nil) (:id |Bk2vfqUxl0BZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |Sy6DG9UglCrb) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |rJRPfqLgxArb) (:text |comp-history) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |H11df58le0Bb) (:type :expr)
                :data $ {}
                  |5 $ {} (:at 1538156204907) (:by |root) (:id |gB33kITFVv) (:text |states) (:type :leaf)
                  |9 $ {} (:at 1556558370326) (:by |B1y7Rc-Zz) (:id |YxpZ5K2Ms) (:text |data) (:type :leaf)
                  |D $ {} (:at 1537205272307) (:by |root) (:id |n59xBUrwUa) (:text |finished-tasks) (:type :leaf)
              |v $ {} (:at 1556558353629) (:by |B1y7Rc-Zz) (:id |QD6h50NOc) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1556558354373) (:by |B1y7Rc-Zz) (:id |IzaLJfkCmP) (:text |let) (:type :leaf)
                  |L $ {} (:at 1556558354666) (:by |B1y7Rc-Zz) (:id |zW85PcKQK) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556558354872) (:by |B1y7Rc-Zz) (:id |3taNiT7BtG) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556558359891) (:by |B1y7Rc-Zz) (:id |jXvCa4FC1T) (:text |year) (:type :leaf)
                          |j $ {} (:at 1556558360365) (:by |B1y7Rc-Zz) (:id |XQt7PT2UiX) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556558361527) (:by |B1y7Rc-Zz) (:id |kkG0pbgYLs) (:text |:year) (:type :leaf)
                              |j $ {} (:at 1556558363487) (:by |B1y7Rc-Zz) (:id |GwBdQHeprC) (:text |data) (:type :leaf)
                      |j $ {} (:at 1556558364409) (:by |B1y7Rc-Zz) (:id |aRhodKN3nG) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556558366638) (:by |B1y7Rc-Zz) (:id |aRhodKN3nGleaf) (:text |week) (:type :leaf)
                          |j $ {} (:at 1556558366871) (:by |B1y7Rc-Zz) (:id |D_Gww8YqWZ) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556558367970) (:by |B1y7Rc-Zz) (:id |9pbK8cYDCr) (:text |:week) (:type :leaf)
                              |j $ {} (:at 1556558368576) (:by |B1y7Rc-Zz) (:id |-qt3qOD2r-) (:text |data) (:type :leaf)
                  |T $ {} (:at 1500541010211) (:by nil) (:id |rkW_zqUxlCrZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |HJM_fc8elAHW) (:text |div) (:type :leaf)
                      |j $ {} (:at 1537204652427) (:by |root) (:id |vXZpZPlQtc) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537204653957) (:by |root) (:id |-RqBlOcVk) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657791497280) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791499788) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                              |b $ {} (:at 1657791501714) (:by |B1y7Rc-Zz) (:text |css/flex) (:type :leaf)
                          |j $ {} (:at 1537204654208) (:by |root) (:id |aV5AfpXxft) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1537204658325) (:by |root) (:id |yucxShDtLH) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1537204658624) (:by |root) (:id |EMfKWECv_) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537204658961) (:by |root) (:id |s1ROrmUWS5) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1537205373359) (:by |root) (:id |XymWLuf5Zc) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1537205375822) (:by |root) (:id |WmlxdDRunO) (:text |:padding) (:type :leaf)
                                      |j $ {} (:at 1557586742256) (:by |B1y7Rc-Zz) (:id |egdjWWgvDR) (:text "|\"16px 16px") (:type :leaf)
                                  |r $ {} (:at 1537205720565) (:by |root) (:id |ZR_L5kLBh) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1537205721975) (:by |root) (:id |ZR_L5kLBhleaf) (:text |:overflow) (:type :leaf)
                                      |j $ {} (:at 1537205722912) (:by |root) (:id |GKGDOvqGR1) (:text |:auto) (:type :leaf)
                      |n $ {} (:at 1572973329851) (:by |B1y7Rc-Zz) (:id |I1mVSYnO2) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1572973331364) (:by |B1y7Rc-Zz) (:id |HKCoNv5SDr) (:text |div) (:type :leaf)
                          |L $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |2z3CijHsXS) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |NcxS7GAkvX) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |23xhD93xlV) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |VJtPQIkn74) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |Lu6g7B2o93) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |-GZRGJpFF1) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |HWRZ-rYYUQ) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |9ZFYDSRITQ) (:text |:max-width) (:type :leaf)
                                          |j $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |R2VFqb2_tH) (:text |800) (:type :leaf)
                                      |r $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |xfT6jGlx9-) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |W0UwevqdWi) (:text |:margin) (:type :leaf)
                                          |j $ {} (:at 1572973332908) (:by |B1y7Rc-Zz) (:id |grArO_1AMG) (:text |:auto) (:type :leaf)
                          |T $ {} (:at 1538240032449) (:by |root) (:id |Sb4EdL1xMv) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1538240033440) (:by |root) (:id |Sb4EdL1xMvleaf) (:text |div) (:type :leaf)
                              |j $ {} (:at 1538240033698) (:by |root) (:id |bRcFyjgFn) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538240034015) (:by |root) (:id |UylbfZbo34) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1657791507065) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657791510707) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                      |b $ {} (:at 1657791514868) (:by |B1y7Rc-Zz) (:text |css/row-parted) (:type :leaf)
                                  |j $ {} (:at 1538240043472) (:by |root) (:id |AiIrSByHTF) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1538240045559) (:by |root) (:id |TUJCAgJDHr) (:text |:style) (:type :leaf)
                                      |j $ {} (:at 1538240045887) (:by |root) (:id |J-0Irsx0Z2) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1538240046621) (:by |root) (:id |NV9GNabBwa) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1557246009103) (:by |B1y7Rc-Zz) (:id |v7GnijyTef) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557246011414) (:by |B1y7Rc-Zz) (:id |5PqHvDf6u) (:text |:margin) (:type :leaf)
                                              |j $ {} (:at 1557586755732) (:by |B1y7Rc-Zz) (:id |nshnTWtd1) (:text "|\"8px 0") (:type :leaf)
                              |r $ {} (:at 1538240034474) (:by |root) (:id |I2SP7-zVxf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538240034881) (:by |root) (:id |I2SP7-zVxfleaf) (:text |<>) (:type :leaf)
                                  |j $ {} (:at 1545875924282) (:by |root) (:id |R1C8M-XS_R) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1629964011123) (:by |B1y7Rc-Zz) (:id |rNp378Ydu) (:text |str) (:type :leaf)
                                      |T $ {} (:at 1629964023666) (:by |B1y7Rc-Zz) (:id |R027gZxHJL) (:text "|\"Histories of ") (:type :leaf)
                                      |X $ {} (:at 1629964024266) (:by |B1y7Rc-Zz) (:text |week) (:type :leaf)
                                      |b $ {} (:at 1629964020349) (:by |B1y7Rc-Zz) (:text "|\"th week in ") (:type :leaf)
                                      |j $ {} (:at 1629964016057) (:by |B1y7Rc-Zz) (:text |year) (:type :leaf)
                                  |r $ {} (:at 1546793858740) (:by |B1y7Rc-Zz) (:id |Mx2jsfbZtZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1546793858740) (:by |B1y7Rc-Zz) (:id |689hOyq7D4) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1546793858740) (:by |B1y7Rc-Zz) (:id |v5Z52Sa1WT) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1546793858740) (:by |B1y7Rc-Zz) (:id |K64OGxWOcv) (:text |:font-family) (:type :leaf)
                                          |j $ {} (:at 1546793858740) (:by |B1y7Rc-Zz) (:id |P1S7S6mxBs) (:text |ui/font-fancy) (:type :leaf)
                                      |r $ {} (:at 1546793858740) (:by |B1y7Rc-Zz) (:id |kG9VxH2-2c) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1546793858740) (:by |B1y7Rc-Zz) (:id |zspxLnnzAi) (:text |:font-size) (:type :leaf)
                                          |j $ {} (:at 1557245964252) (:by |B1y7Rc-Zz) (:id |cnLYnISxyk) (:text |16) (:type :leaf)
                                      |v $ {} (:at 1557245968601) (:by |B1y7Rc-Zz) (:id |ibzjAzNNL) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245972995) (:by |B1y7Rc-Zz) (:id |ibzjAzNNLleaf) (:text |:color) (:type :leaf)
                                          |j $ {} (:at 1557245973239) (:by |B1y7Rc-Zz) (:id |rwlBa8mCrR) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245973563) (:by |B1y7Rc-Zz) (:id |dtQY4oZ2z8) (:text |hsl) (:type :leaf)
                                              |j $ {} (:at 1557245977960) (:by |B1y7Rc-Zz) (:id |Xq-UgBPs95) (:text |0) (:type :leaf)
                                              |r $ {} (:at 1557245978580) (:by |B1y7Rc-Zz) (:id |sZFYSxAUue) (:text |0) (:type :leaf)
                                              |v $ {} (:at 1557245975383) (:by |B1y7Rc-Zz) (:id |t4zu2lzcz) (:text |50) (:type :leaf)
                              |v $ {} (:at 1545876159242) (:by |root) (:id |QjE9OViquW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1545876159696) (:by |root) (:id |QjE9OViquWleaf) (:text |div) (:type :leaf)
                                  |j $ {} (:at 1545876159971) (:by |root) (:id |gdhgKC4sQi) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1545876160260) (:by |root) (:id |FbqphZBNW7) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1545876160484) (:by |root) (:id |vSIfrtJaKO) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1657791523351) (:by |B1y7Rc-Zz) (:id |xCf3Nhw22i) (:text |:class-name) (:type :leaf)
                                          |j $ {} (:at 1657791525079) (:by |B1y7Rc-Zz) (:id |SrJoy11RPL) (:text |css/row) (:type :leaf)
                                  |rT $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |J9GWQEbN6g) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |6YgOyj1tw3) (:text |comp-icon) (:type :leaf)
                                      |j $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |KHahq6BB5l) (:text |:arrow-left) (:type :leaf)
                                      |r $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |6gxMaxGkrW) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |J4ecaNqakR) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |kQ0IFXW1GR) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |EjMdfU1zMm) (:text |:font-size) (:type :leaf)
                                              |j $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |Z_jrYkNapj) (:text |16) (:type :leaf)
                                          |r $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |xi23ABdxIo) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |3ug_od0VD8) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |53ygPiP3qZ) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |DqjDlVCo9v) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |_ieSZMe71P) (:text |200) (:type :leaf)
                                                  |r $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |cQpon4KSuW) (:text |80) (:type :leaf)
                                                  |v $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |4r4iHacjIiR) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |KZQlxgbNMUA) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |a6pd6U6MzRr) (:text |:cursor) (:type :leaf)
                                              |j $ {} (:at 1557245921153) (:by |B1y7Rc-Zz) (:id |yXVU3XZxjEn) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |genN2h7kxw) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |ZfPgYGXbAT) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |iIufMh9Wnw) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |uz-ZKqwQJv) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |IIgP4nWq-7) (:text |d!) (:type :leaf)
                                          |r $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |e7LgLs0Ywy) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |_MRlJpa2iD) (:text |d!) (:type :leaf)
                                              |j $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |S8FoY_rjHW) (:text |:router/change) (:type :leaf)
                                              |r $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |MTo1RmEIKh) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |T5HHFYHhg5) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |Azj7GBbrHX) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |-Hnj2tKDNK) (:text |:name) (:type :leaf)
                                                      |j $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |pT2eBz25AH) (:text |:history) (:type :leaf)
                                                  |r $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |E0IIF5H_-K) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |AZm007v-iZ5) (:text |:data) (:type :leaf)
                                                      |j $ {} (:at 1677346543450) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1677346544842) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                                                          |L $ {} (:at 1677346545122) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |5 $ {} (:at 1677346620328) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346629359) (:by |B1y7Rc-Zz) (:text |change-year?) (:type :leaf)
                                                                  |b $ {} (:at 1677346631948) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677346631948) (:by |B1y7Rc-Zz) (:text |<=) (:type :leaf)
                                                                      |b $ {} (:at 1677346631948) (:by |B1y7Rc-Zz) (:text |week) (:type :leaf)
                                                                      |h $ {} (:at 1677346631948) (:by |B1y7Rc-Zz) (:text |1) (:type :leaf)
                                                              |D $ {} (:at 1677346589927) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346590776) (:by |B1y7Rc-Zz) (:text |y) (:type :leaf)
                                                                  |b $ {} (:at 1677346598658) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677346599074) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                                                      |b $ {} (:at 1677346634251) (:by |B1y7Rc-Zz) (:text |change-year?) (:type :leaf)
                                                                      |h $ {} (:at 1677346605935) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346605935) (:by |B1y7Rc-Zz) (:text |dec) (:type :leaf)
                                                                          |b $ {} (:at 1677346605935) (:by |B1y7Rc-Zz) (:text |year) (:type :leaf)
                                                                      |l $ {} (:at 1677346609612) (:by |B1y7Rc-Zz) (:text |year) (:type :leaf)
                                                              |T $ {} (:at 1677346545256) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346545520) (:by |B1y7Rc-Zz) (:text |w) (:type :leaf)
                                                                  |b $ {} (:at 1677346550619) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1677346551790) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                                                      |T $ {} (:at 1677346636247) (:by |B1y7Rc-Zz) (:text |change-year?) (:type :leaf)
                                                                      |b $ {} (:at 1677346556448) (:by |B1y7Rc-Zz) (:text |53) (:type :leaf)
                                                                      |h $ {} (:at 1677346558583) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346558583) (:by |B1y7Rc-Zz) (:text |dec) (:type :leaf)
                                                                          |b $ {} (:at 1677346558583) (:by |B1y7Rc-Zz) (:text |week) (:type :leaf)
                                                              |b $ {} (:at 1677346738249) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346738710) (:by |B1y7Rc-Zz) (:text |d) (:type :leaf)
                                                                  |b $ {} (:at 1677346742437) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677346742923) (:by |B1y7Rc-Zz) (:text |->) (:type :leaf)
                                                                      |b $ {} (:at 1677346744162) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346744860) (:by |B1y7Rc-Zz) (:text |dayjs) (:type :leaf)
                                                                      |e $ {} (:at 1677346754887) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346763943) (:by |B1y7Rc-Zz) (:text |.!year) (:type :leaf)
                                                                          |b $ {} (:at 1677346760836) (:by |B1y7Rc-Zz) (:text |y) (:type :leaf)
                                                                      |h $ {} (:at 1677346747893) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346749666) (:by |B1y7Rc-Zz) (:text |.!week) (:type :leaf)
                                                                          |b $ {} (:at 1677346753440) (:by |B1y7Rc-Zz) (:text |w) (:type :leaf)
                                                          |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |EfNRjRreviD) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |x8c8g7UVacc) (:text |{}) (:type :leaf)
                                                              |j $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |Uf_ZPiuvxUG) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |1bH68t7UdHh) (:text |:year) (:type :leaf)
                                                                  |j $ {} (:at 1677346615639) (:by |B1y7Rc-Zz) (:id |1XLLeAslADc) (:text |y) (:type :leaf)
                                                              |r $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |UZuabxh5brv) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1557245925625) (:by |B1y7Rc-Zz) (:id |4Q2WBkmnhwZ) (:text |:week) (:type :leaf)
                                                                  |b $ {} (:at 1677346561798) (:by |B1y7Rc-Zz) (:text |w) (:type :leaf)
                                                              |t $ {} (:at 1677346768592) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346769815) (:by |B1y7Rc-Zz) (:text |:start) (:type :leaf)
                                                                  |b $ {} (:at 1677346837069) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1677346840116) (:by |B1y7Rc-Zz) (:text |.!format) (:type :leaf)
                                                                      |T $ {} (:at 1677346770473) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346772544) (:by |B1y7Rc-Zz) (:text |.!startOf) (:type :leaf)
                                                                          |X $ {} (:at 1677346777161) (:by |B1y7Rc-Zz) (:text |d) (:type :leaf)
                                                                          |b $ {} (:at 1677346774482) (:by |B1y7Rc-Zz) (:text "|\"week") (:type :leaf)
                                                              |u $ {} (:at 1677346768592) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346780525) (:by |B1y7Rc-Zz) (:text |:end) (:type :leaf)
                                                                  |b $ {} (:at 1677346841966) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1677346842506) (:by |B1y7Rc-Zz) (:text |.!format) (:type :leaf)
                                                                      |T $ {} (:at 1677346770473) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346782272) (:by |B1y7Rc-Zz) (:text |.!endOf) (:type :leaf)
                                                                          |X $ {} (:at 1677346777161) (:by |B1y7Rc-Zz) (:text |d) (:type :leaf)
                                                                          |b $ {} (:at 1677346774482) (:by |B1y7Rc-Zz) (:text "|\"week") (:type :leaf)
                                  |rj $ {} (:at 1557245939926) (:by |B1y7Rc-Zz) (:id |_o4dGwaGrd) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245939926) (:by |B1y7Rc-Zz) (:id |T76_PTUt7e) (:text |=<) (:type :leaf)
                                      |j $ {} (:at 1557245939926) (:by |B1y7Rc-Zz) (:id |96m_LLzUcW) (:text |8) (:type :leaf)
                                      |r $ {} (:at 1557245939926) (:by |B1y7Rc-Zz) (:id |n91mFP8oG5) (:text |nil) (:type :leaf)
                                  |s $ {} (:at 1557245884150) (:by |B1y7Rc-Zz) (:id |n0eDAmm9hX) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245886509) (:by |B1y7Rc-Zz) (:id |n0eDAmm9hXleaf) (:text |comp-icon) (:type :leaf)
                                      |j $ {} (:at 1557245936423) (:by |B1y7Rc-Zz) (:id |d2yRD1osn) (:text |:arrow-right) (:type :leaf)
                                      |r $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |wFUqXEYFI2) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |kKp6WVY5XR) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |cDAT6QB37D) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |qhu3MEr4rx) (:text |:font-size) (:type :leaf)
                                              |j $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |inPsYr6y7R) (:text |16) (:type :leaf)
                                          |r $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |pyZkpFQuCu) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |8iybu2Xjdo) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |MHtnfatQ7E) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |15rgzzUmPR) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |85hObzfhIR) (:text |200) (:type :leaf)
                                                  |r $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |IzG0WycecW) (:text |80) (:type :leaf)
                                                  |v $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |AW6yVKqFVU) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |4LMIRQ9dgR) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |drTqR1FShY) (:text |:cursor) (:type :leaf)
                                              |j $ {} (:at 1557245902904) (:by |B1y7Rc-Zz) (:id |V7GZJG_NZsA) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |3ep8vtS35b) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |hbz5HNvBax) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |3uoLQKKtcX) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |xnCimqGZqf) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |2AINWybjsG) (:text |d!) (:type :leaf)
                                          |r $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |lDbZcibTh-) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |WzIi-DdKsE) (:text |d!) (:type :leaf)
                                              |j $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |x5WdHwwjOy) (:text |:router/change) (:type :leaf)
                                              |r $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |74CBVco4Lk) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |sdgfDBZLcw) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |uDSjSCqnHV) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |G2tHGG_ZSp) (:text |:name) (:type :leaf)
                                                      |j $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |q0SYEPi5VAJ) (:text |:history) (:type :leaf)
                                                  |r $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |YznpB60ZWHv) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557245907041) (:by |B1y7Rc-Zz) (:id |Lf05kYJActC) (:text |:data) (:type :leaf)
                                                      |j $ {} (:at 1677346564499) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1677346566400) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                                                          |L $ {} (:at 1677346566711) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1677346640319) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346642479) (:by |B1y7Rc-Zz) (:text |change-year?) (:type :leaf)
                                                                  |b $ {} (:at 1677346645047) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677346645047) (:by |B1y7Rc-Zz) (:text |>=) (:type :leaf)
                                                                      |b $ {} (:at 1677346645047) (:by |B1y7Rc-Zz) (:text |week) (:type :leaf)
                                                                      |h $ {} (:at 1677346645047) (:by |B1y7Rc-Zz) (:text |53) (:type :leaf)
                                                              |L $ {} (:at 1677346665061) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346665804) (:by |B1y7Rc-Zz) (:text |y) (:type :leaf)
                                                                  |b $ {} (:at 1677346668530) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1677346669374) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                                                      |L $ {} (:at 1677346671128) (:by |B1y7Rc-Zz) (:text |change-year?) (:type :leaf)
                                                                      |T $ {} (:at 1677346667597) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346667597) (:by |B1y7Rc-Zz) (:text |inc) (:type :leaf)
                                                                          |b $ {} (:at 1677346667597) (:by |B1y7Rc-Zz) (:text |year) (:type :leaf)
                                                                      |b $ {} (:at 1677346675945) (:by |B1y7Rc-Zz) (:text |year) (:type :leaf)
                                                              |T $ {} (:at 1677346567097) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346567830) (:by |B1y7Rc-Zz) (:text |w) (:type :leaf)
                                                                  |b $ {} (:at 1677346648466) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1677346649849) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                                                      |T $ {} (:at 1677346651679) (:by |B1y7Rc-Zz) (:text |change-year?) (:type :leaf)
                                                                      |b $ {} (:at 1677346656679) (:by |B1y7Rc-Zz) (:text |1) (:type :leaf)
                                                                      |h $ {} (:at 1677346658182) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346658182) (:by |B1y7Rc-Zz) (:text |inc) (:type :leaf)
                                                                          |b $ {} (:at 1677346658182) (:by |B1y7Rc-Zz) (:text |week) (:type :leaf)
                                                              |b $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |d) (:type :leaf)
                                                                  |b $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |->) (:type :leaf)
                                                                      |b $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |dayjs) (:type :leaf)
                                                                      |h $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |.!year) (:type :leaf)
                                                                          |b $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |y) (:type :leaf)
                                                                      |l $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |.!week) (:type :leaf)
                                                                          |b $ {} (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |w) (:type :leaf)
                                                          |T $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |:year) (:type :leaf)
                                                                  |b $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |y) (:type :leaf)
                                                              |h $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |:week) (:type :leaf)
                                                                  |b $ {} (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |w) (:type :leaf)
                                                              |l $ {} (:at 1677346789645) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346789645) (:by |B1y7Rc-Zz) (:text |:start) (:type :leaf)
                                                                  |b $ {} (:at 1677346843735) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1677346844291) (:by |B1y7Rc-Zz) (:text |.!format) (:type :leaf)
                                                                      |T $ {} (:at 1677346789645) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346789645) (:by |B1y7Rc-Zz) (:text |.!startOf) (:type :leaf)
                                                                          |b $ {} (:at 1677346789645) (:by |B1y7Rc-Zz) (:text |d) (:type :leaf)
                                                                          |h $ {} (:at 1677346789645) (:by |B1y7Rc-Zz) (:text "|\"week") (:type :leaf)
                                                              |o $ {} (:at 1677346791829) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346791829) (:by |B1y7Rc-Zz) (:text |:end) (:type :leaf)
                                                                  |b $ {} (:at 1677346845124) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1677346845680) (:by |B1y7Rc-Zz) (:text |.!format) (:type :leaf)
                                                                      |T $ {} (:at 1677346791829) (:by |B1y7Rc-Zz) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677346791829) (:by |B1y7Rc-Zz) (:text |.!endOf) (:type :leaf)
                                                                          |b $ {} (:at 1677346791829) (:by |B1y7Rc-Zz) (:text |d) (:type :leaf)
                                                                          |h $ {} (:at 1677346791829) (:by |B1y7Rc-Zz) (:text "|\"week") (:type :leaf)
                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |XYXTdBUPM8) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |a37B3rofKH) (:text |if) (:type :leaf)
                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Po4-Ng1AOE) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |0DeJXYt-Py) (:text |empty?) (:type :leaf)
                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |CwJ6ErWUrB) (:text |finished-tasks) (:type :leaf)
                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |u1ftZZ7-3W) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |w6nl9W5Xk3) (:text |div) (:type :leaf)
                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |dHk982NnC8) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |DO1Ee7GBD_) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1657791543649) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1657791545542) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                          |b $ {} (:at 1657791547679) (:by |B1y7Rc-Zz) (:text |css/center) (:type :leaf)
                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |FH6hd0qL7p) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |7PnVd1kfCb) (:text |:style) (:type :leaf)
                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |lvdXEJgmS2) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |oS_0VwrV5kA) (:text |{}) (:type :leaf)
                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |KtGMrruIN3B) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |SxkGockY6m5) (:text |:height) (:type :leaf)
                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |5oGCGjYefHA) (:text |80) (:type :leaf)
                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |i6qkXgunFFZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |ruzyXUZ4EQF) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |O9lbpFgSBi8) (:text "|\"No tasks.") (:type :leaf)
                                      |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |f3hQwNh_pWF) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |D0IkEYqm3l6) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |JyH4CK7p4ya) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |93DIiyZUOMp) (:text |:font-family) (:type :leaf)
                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |undLlZhkpBi) (:text |ui/font-fancy) (:type :leaf)
                                          |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |dq7tP8L2N-5) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |pv0MmANtGvc) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |xLoP5V-Mn6o) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |MrBcA6afe-d) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |_BqtnXqHE-T) (:text |0) (:type :leaf)
                                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |WwTq39gAGV3) (:text |0) (:type :leaf)
                                                  |v $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |7HDrgz3GY_B) (:text |80) (:type :leaf)
                              |v $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |PaNNNXoTP3f) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |hx7HaYuhfcY) (:text |let) (:type :leaf)
                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |q54hfhIGLLW) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |13Jj6SylkqE) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |xv-Kj5q6arE) (:text |grouped-tasks) (:type :leaf)
                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |DPlFXZxodYL) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963710631) (:by |B1y7Rc-Zz) (:id |DWEF9xvAlib) (:text |->) (:type :leaf)
                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |AjdKR05AW0b) (:text |finished-tasks) (:type :leaf)
                                              |n $ {} (:at 1629963716810) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963719561) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                              |p $ {} (:at 1629963723311) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963724063) (:by |B1y7Rc-Zz) (:text |.map) (:type :leaf)
                                                  |j $ {} (:at 1629963725665) (:by |B1y7Rc-Zz) (:text |last) (:type :leaf)
                                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |W8kbE82g8mT) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |0s7-JQUGydK) (:text |group-by) (:type :leaf)
                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |1zGxtjlKK1V) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |ejFW2ZBnNpn) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |FosmiwYF0ju) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |_6vJXWx879L) (:text |task) (:type :leaf)
                                                      |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Px4Z48DkSUv) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1658935422444) (:by |B1y7Rc-Zz) (:id |cZPNsvR86or) (:text |.!format) (:type :leaf)
                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |mHqjYy8XSiX) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |1m7XPw_Hlmf) (:text |dayjs) (:type :leaf)
                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |ikor3AduoIl) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |krNC1Nz2UFm) (:text |:finished-time) (:type :leaf)
                                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |8XtMyavkmtM) (:text |task) (:type :leaf)
                                                          |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Xcf29gNr__3) (:text "|\"YYYY-MM-DD") (:type :leaf)
                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |XOUs8y1vI3r) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |wSgKwvPBNDF) (:text |list->) (:type :leaf)
                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |THekspFrd3i) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |wNAwlqtanOf) (:text |{}) (:type :leaf)
                                      |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |-50fY1URR_B) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963728498) (:by |B1y7Rc-Zz) (:id |jZF2WlCL9b3) (:text |->) (:type :leaf)
                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |U7GGcfGtXo1) (:text |grouped-tasks) (:type :leaf)
                                          |n $ {} (:at 1629963731486) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963732688) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                          |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |HW15C6m3GAr) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963729794) (:by |B1y7Rc-Zz) (:id |8dqvI3926_B) (:text |.sort) (:type :leaf)
                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |1YnPrH8ptP0) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |lLA0YO2VMsE) (:text |fn) (:type :leaf)
                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |l6SuErZAvuG) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |hnYesIWAV-5) (:text |x) (:type :leaf)
                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |xzhlLkvbd6v) (:text |y) (:type :leaf)
                                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |m_FoGLqiYf9) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629963734702) (:by |B1y7Rc-Zz) (:id |ZBepBBPWy6J) (:text |&compare) (:type :leaf)
                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |gF-e7uNGld8) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |jqJglApermV) (:text |first) (:type :leaf)
                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |G_gcOxcsWJC) (:text |y) (:type :leaf)
                                                      |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |jiRZGtd5VLw) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |BlKdKjqs93O) (:text |first) (:type :leaf)
                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |wY1l3K7lZeB) (:text |x) (:type :leaf)
                                          |v $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |OQk4DW8xlb3) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963739822) (:by |B1y7Rc-Zz) (:id |fPcO8Fe1GD_) (:text |.map-pair) (:type :leaf)
                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |KCB5auz3ZkN) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |8yZvp_RDa7H) (:text |fn) (:type :leaf)
                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |JdatDJSwhm_) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |dS32WcRQuWg) (:text |date-string) (:type :leaf)
                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |pAYSDsbuTXB) (:text |task-list) (:type :leaf)
                                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |WFK18NJwv8U) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |9M2Ra_9VNh0) (:text |[]) (:type :leaf)
                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |pA8oiHLGnRQ) (:text |date-string) (:type :leaf)
                                                      |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |LVFpXzxySx6) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |200pi0xo41B) (:text |div) (:type :leaf)
                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Qn8kY6A7laB) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |dfMqiBeOvvX) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1657791557018) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1657791559866) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                                                  |b $ {} (:at 1657791562179) (:by |B1y7Rc-Zz) (:text |css/column) (:type :leaf)
                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |stza4eV8Rj3) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |tjrXj5eNKA2) (:text |:style) (:type :leaf)
                                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |e5yZ3Ifn0Lp) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |0QaVDc6sDbv) (:text |{}) (:type :leaf)
                                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |JjGz8ekhUdI) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |o6xK3EwHwOw) (:text |:margin-top) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |74fsbE-7qlM) (:text |16) (:type :leaf)
                                                          |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |9XU51otNUJi) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |KGUXDGHpkJZ) (:text |let) (:type :leaf)
                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |9ixeBed2Xrg) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |iEv9lNwhyci) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |P2zR70UK8-3) (:text |the-day) (:type :leaf)
                                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |xwRPsE5Oo0H) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |J_ozRRkQlaR) (:text |dayjs) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |n-DKMxeUWEF) (:text |date-string) (:type :leaf)
                                                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |dEg3bv9jyxZ) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Uj_s7xKNCZ1) (:text |div) (:type :leaf)
                                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |C50qvJRBuKa) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |LZVEnk0xSP6) (:text |{}) (:type :leaf)
                                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |zbmuA8v_iyo) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1657791569745) (:by |B1y7Rc-Zz) (:id |s3_q8wThZy0) (:text |:class-name) (:type :leaf)
                                                                          |j $ {} (:at 1657791571507) (:by |B1y7Rc-Zz) (:id |VLB8nEsbHoK) (:text |css/row-parted) (:type :leaf)
                                                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |OPYDZ2P2rF3) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |GmzBLggBVbF) (:text |span) (:type :leaf)
                                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |4dNcwRo4FNk) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |p9iWe-_HShk) (:text |{}) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |1kpl5fm0hAv) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1657795130561) (:by |B1y7Rc-Zz) (:id |_P7g_urtNiG) (:text |:class-name) (:type :leaf)
                                                                              |b $ {} (:at 1657795134216) (:by |B1y7Rc-Zz) (:text |css/font-fancy) (:type :leaf)
                                                                      |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |U_MCdfYyNEh) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Wy9Eun19zyc) (:text |<>) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |hYuFFGAUFfg) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |tiznPBVSlSI) (:text |.format) (:type :leaf)
                                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |23j-zxJIY4x) (:text |the-day) (:type :leaf)
                                                                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |IfGWsY8d4qW) (:text "|\"ddd") (:type :leaf)
                                                                      |v $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |hTe5ODrYFJ0) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |3too39L9Pxx) (:text |=<) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |yKsbGaoe92i) (:text |12) (:type :leaf)
                                                                          |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |YB_nYlvogat) (:text |nil) (:type :leaf)
                                                                      |x $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |q7rlUO8wbfx) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |nR4dmaeQxOS) (:text |<>) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |qqrwVkQ4A6p) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |vrjE-hSlCBw) (:text |.format) (:type :leaf)
                                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |_l_LNc0o1u3) (:text |the-day) (:type :leaf)
                                                                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |M_qcWvKKiUb) (:text "|\"MM-DD") (:type :leaf)
                                                          |v $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |aokygqxlBSo) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Zb57hZ5qET1) (:text |=<) (:type :leaf)
                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |7RCNRkFZWtu) (:text |nil) (:type :leaf)
                                                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |xqj2F957eBg) (:text |4) (:type :leaf)
                                                          |x $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |RjIw1o7zBBX) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |CdaKZdjLhAx) (:text |list->) (:type :leaf)
                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |rwGM1mtF-Ib) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |KI4jyu03XM8) (:text |{}) (:type :leaf)
                                                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |fvuC1uDhOGS) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1629963745717) (:by |B1y7Rc-Zz) (:id |IydcXXqvzn_) (:text |->) (:type :leaf)
                                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |ZIkxubTyydO) (:text |task-list) (:type :leaf)
                                                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |l9eEzj8wO9s) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1629963747862) (:by |B1y7Rc-Zz) (:id |oalKIswZ0Vn) (:text |.sort-by) (:type :leaf)
                                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |Jh7nvC3GWuA) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |FJWM4V1meel) (:text |fn) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |220jVLChAqt) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |5GPWoK8ycz8) (:text |task) (:type :leaf)
                                                                          |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |TwOwPICrpIA) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1629963750254) (:by |B1y7Rc-Zz) (:id |r0fCNSZeImi) (:text |negate) (:type :leaf)
                                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |M23NUvpqLyh) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |-mkmBatBHP7) (:text |:finished-time) (:type :leaf)
                                                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |HQ5ASR7aZ0s) (:text |task) (:type :leaf)
                                                                  |v $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |K1qMSFQENFy) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1629963752883) (:by |B1y7Rc-Zz) (:id |FaZSPHtShUL) (:text |.map) (:type :leaf)
                                                                      |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |EaIClaL5FUr) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |vtrgl3mymWX) (:text |fn) (:type :leaf)
                                                                          |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |HmrA2UmMiky) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |62193lQ0VGT) (:text |task) (:type :leaf)
                                                                          |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |8J_4pAJUa9L) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |ckyYCQmo3Ze) (:text |[]) (:type :leaf)
                                                                              |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |1pHr21an1D_) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |0mQueWykdOu) (:text |:id) (:type :leaf)
                                                                                  |j $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |YSxBj_NAULK) (:text |task) (:type :leaf)
                                                                              |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |nTwOXMhMuRP) (:type :expr)
                                                                                :data $ {}
                                                                                  |r $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |YzAmeDw0AsE) (:text |comp-done-task) (:type :leaf)
                                                                                  |v $ {} (:at 1584879067792) (:by |B1y7Rc-Zz) (:id |RziNFlqE-4) (:type :expr)
                                                                                    :data $ {}
                                                                                      |D $ {} (:at 1584879068499) (:by |B1y7Rc-Zz) (:id |yGAYyKra8) (:text |>>) (:type :leaf)
                                                                                      |T $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |PDdiPZSdKHP) (:text |states) (:type :leaf)
                                                                                      |j $ {} (:at 1584879069384) (:by |B1y7Rc-Zz) (:id |uvaNtpSk8o) (:type :expr)
                                                                                        :data $ {}
                                                                                          |T $ {} (:at 1584879069384) (:by |B1y7Rc-Zz) (:id |gsqAOBUWYe) (:text |:id) (:type :leaf)
                                                                                          |j $ {} (:at 1584879069384) (:by |B1y7Rc-Zz) (:id |nCDo3DKUVV) (:text |task) (:type :leaf)
                                                                                  |x $ {} (:at 1572973338571) (:by |B1y7Rc-Zz) (:id |F2hasK8cLFH) (:text |task) (:type :leaf)
          |css-done-task $ {} (:at 1658935354557) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1658935355797) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1658935454514) (:by |B1y7Rc-Zz) (:text |css-done-task) (:type :leaf)
              |h $ {} (:at 1658935354557) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1658935356894) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |X $ {} (:at 1658935465827) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658935467110) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1658935468698) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935469039) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935469861) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935474175) (:by |B1y7Rc-Zz) (:text |:transition-duration) (:type :leaf)
                              |b $ {} (:at 1658935476005) (:by |B1y7Rc-Zz) (:text "|\"200ms") (:type :leaf)
                  |b $ {} (:at 1658935357183) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658935364141) (:by |B1y7Rc-Zz) (:text "|\"$0:hover") (:type :leaf)
                      |b $ {} (:at 1658935364463) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935364871) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935365142) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935368184) (:by |B1y7Rc-Zz) (:text |:background-color) (:type :leaf)
                              |b $ {} (:at 1658935368504) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1658935369043) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                  |b $ {} (:at 1658935369993) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                  |h $ {} (:at 1658935370307) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                  |l $ {} (:at 1658935373563) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                  |o $ {} (:at 1658935374388) (:by |B1y7Rc-Zz) (:text |0.2) (:type :leaf)
        :ns $ {} (:at 1500541010211) (:by nil) (:id |BkUXGcUegABW) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541010211) (:by |root) (:id |S1DXG98elCSb) (:text |ns) (:type :leaf)
            |j $ {} (:at 1537204636631) (:by |root) (:id |HkO7fcLel0SZ) (:text |app.comp.history) (:type :leaf)
            |v $ {} (:at 1500541010211) (:by nil) (:id |S1HVf5UxlRHZ) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541010211) (:by |root) (:id |HJLNzq8glABb) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541010211) (:by nil) (:id |BywNMcUleAHb) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1629963692715) (:by |B1y7Rc-Zz) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |BkcEM9IgxCSZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |HJsNzqLleASW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |SkTNfcLeeRBb) (:text |hsl) (:type :leaf)
                |r $ {} (:at 1500541010211) (:by nil) (:id |HkCNz98el0Bb) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1516547394445) (:by |root) (:id |HkeBG5Lgl0SW) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |rkWrzqIxx0B-) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |S1GrG5LegAHZ) (:text |ui) (:type :leaf)
                |t $ {} (:at 1657791529173) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657791533010) (:by |B1y7Rc-Zz) (:text |respo-ui.css) (:type :leaf)
                    |b $ {} (:at 1657791534046) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1657791534657) (:by |B1y7Rc-Zz) (:text |css) (:type :leaf)
                |u $ {} (:at 1658935381186) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1658935382255) (:by |B1y7Rc-Zz) (:text |respo.css) (:type :leaf)
                    |b $ {} (:at 1658935382979) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1658935383264) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1658935384526) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
                |w $ {} (:at 1523120376505) (:by |root) (:id |BkxlWtdUjM) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1523120379036) (:by |root) (:id |Sk--WFuIoG) (:text |respo.comp.space) (:type :leaf)
                    |r $ {} (:at 1523120382218) (:by |root) (:id |By4XbFu8oG) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1523120382545) (:by |root) (:id |r1DWtdUjM) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1523120383255) (:by |root) (:id |BkGPZKu8oM) (:text |=<) (:type :leaf)
                |x $ {} (:at 1500541010211) (:by nil) (:id |SkVQg5h1z) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1542907257010) (:by |B1y7Rc-Zz) (:id |HJp7zc8xxArZ) (:text |respo.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |S1AmGcLexRH-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |SyJNG5IexArb) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |BkbEz9LegRr-) (:text |defcomp) (:type :leaf)
                        |r $ {} (:at 1500541010211) (:by |root) (:id |BJM4fcLlxCrb) (:text |<>) (:type :leaf)
                        |sD $ {} (:at 1584879467100) (:by |B1y7Rc-Zz) (:id |H--ed1adf-) (:text |>>) (:type :leaf)
                        |tT $ {} (:at 1537205312821) (:by |root) (:id |h6qOArMwYR) (:text |list->) (:type :leaf)
                        |v $ {} (:at 1500541010211) (:by |root) (:id |SyQ4McIex0HZ) (:text |span) (:type :leaf)
                        |x $ {} (:at 1500541010211) (:by |root) (:id |HkNEM9Lee0HZ) (:text |div) (:type :leaf)
                |y $ {} (:at 1536860674775) (:by |root) (:id |sd197CFAUl) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1536860674775) (:by |root) (:id |KHeI882KsR) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1536860674775) (:by |root) (:id |PIbF-a_ipe) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1536860674775) (:by |root) (:id |KTf8qeft93) (:text |config) (:type :leaf)
                |yj $ {} (:at 1536861056679) (:by |root) (:id |SJOhXEVL1) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1572937587408) (:by |B1y7Rc-Zz) (:id |-L09Mo6C7B) (:text |respo-alerts.core) (:type :leaf)
                    |r $ {} (:at 1536861065872) (:by |root) (:id |ci9RasPZMC) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1536861066155) (:by |root) (:id |LLF19Vc6J-) (:type :expr)
                      :data $ {}
                        |r $ {} (:at 1572937588899) (:by |B1y7Rc-Zz) (:id |bGxv8PXOA) (:text |comp-modal-menu) (:type :leaf)
                |yr $ {} (:at 1537205302342) (:by |root) (:id |k8BCWqBK-A) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1537205304265) (:by |root) (:id |QlsaxBnGbw) (:text "|\"dayjs") (:type :leaf)
                    |r $ {} (:at 1629963697318) (:by |B1y7Rc-Zz) (:id |E5KXpQLTG2) (:text |:default) (:type :leaf)
                    |v $ {} (:at 1537205306754) (:by |root) (:id |rowedDrLZu) (:text |dayjs) (:type :leaf)
                |yx $ {} (:at 1557245874705) (:by |B1y7Rc-Zz) (:id |pjzyEAjCB) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1557245877780) (:by |B1y7Rc-Zz) (:id |MG5Aiu6C_Z) (:text |feather.core) (:type :leaf)
                    |r $ {} (:at 1557245879751) (:by |B1y7Rc-Zz) (:id |ZZJD6q44vd) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1557245879951) (:by |B1y7Rc-Zz) (:id |_YHAGgcN7b) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1557245881467) (:by |B1y7Rc-Zz) (:id |222a5RM6WS) (:text |comp-icon) (:type :leaf)
        :proc $ {} (:at 1500541010211) (:by nil) (:id |SJ1Uz9LeeAB-) (:type :expr)
          :data $ {}
      |app.comp.login $ {}
        :defs $ {}
          |comp-login $ {} (:at 1500541010211) (:by nil) (:id |HkN1-cUxxRB-) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |SJBy-qUle0SW) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |S1LyWcUxe0rZ) (:text |comp-login) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |HkPy-qLxlRHb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |Sy_yZ5LxlCBZ) (:text |states) (:type :leaf)
              |v $ {} (:at 1500541010211) (:by nil) (:id |ryK1bqLeg0rZ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |ry9JbqLlgRHb) (:text |let) (:type :leaf)
                  |j $ {} (:at 1500541010211) (:by nil) (:id |H1j1WcUxxRSb) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1584878970582) (:by |B1y7Rc-Zz) (:id |F9l4gChu0W) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584878971306) (:by |B1y7Rc-Zz) (:id |F9l4gChu0Wleaf) (:text |cursor) (:type :leaf)
                          |j $ {} (:at 1584878971558) (:by |B1y7Rc-Zz) (:id |2QPTuRqAFy) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584878973262) (:by |B1y7Rc-Zz) (:id |f-bpWKCFMw) (:text |:cursor) (:type :leaf)
                              |j $ {} (:at 1584878974144) (:by |B1y7Rc-Zz) (:id |dJrJ4RrHYC) (:text |states) (:type :leaf)
                      |T $ {} (:at 1500541010211) (:by nil) (:id |HynkWcIee0Hb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |HkT1bqUxlASZ) (:text |state) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |Hy0yb98gxABW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |rkJxWc8lxCBW) (:text |or) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |BJllZ5Lle0Sb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |Hy-eb9Uxx0HZ) (:text |:data) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |S1GeZq8glCrW) (:text |states) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by |root) (:id |B1Xeb9UleCrW) (:text |initial-state) (:type :leaf)
                  |r $ {} (:at 1519368111046) (:by |root) (:id |HyxD3wVpvM) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1519368111912) (:by |root) (:id |rJZPnw4TvG) (:text |div) (:type :leaf)
                      |L $ {} (:at 1519368112156) (:by |root) (:id |SJXO3vNaDM) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1519368113787) (:by |root) (:id |S1fd3wN6Dz) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1519368114295) (:by |root) (:id |SyGqhw46wG) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1519368116587) (:by |root) (:id |SJ-9hDETDf) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1519368119982) (:by |root) (:id |Byg6DV6wz) (:type :expr)
                                :data $ {}
                                  |5 $ {} (:at 1519368124581) (:by |root) (:id |H1lV6vNaPf) (:text |merge) (:type :leaf)
                                  |D $ {} (:at 1519368123630) (:by |root) (:id |BJxe6vNavM) (:text |ui/flex) (:type :leaf)
                                  |T $ {} (:at 1519368119197) (:by |root) (:id |rJlpnDVawM) (:text |ui/center) (:type :leaf)
                      |T $ {} (:at 1500541010211) (:by nil) (:id |ryEx-5IxlRSW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |HJrgZ5Llg0Sb) (:text |div) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |BJIg-9Ule0rZ) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |SJvxZcIxlASZ) (:text |{}) (:type :leaf)
                          |r $ {} (:at 1500541010211) (:by nil) (:id |BJOg-5Igx0S-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |S1Fx-cUegRrb) (:text |div) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |ry5gWc8exRSZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |BkixZ9LxgRBZ) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |SJhlW5Ugl0rb) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |r1Te-58xeAHb) (:text |:style) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |H1AgbqLleRrW) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |Bk1WZq8lgCS-) (:text |{}) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |BkxZZ98xeCH-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |BJWb-5UlxRrZ) (:text |div) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |H1M-WcUggRHZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |Hym-ZqLleAS-) (:text |{}) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by nil) (:id |SJNWb9UexCSZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |H1H-WqIle0rZ) (:text |input) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |rkU-bcUleASZ) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |S1wbZqLeeASW) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by nil) (:id |rJObbc8leRS-) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |BJYWWcLxx0rW) (:text |:placeholder) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by |root) (:id |H15Wb9Ugg0r-) (:text ||Username) (:type :leaf)
                                          |r $ {} (:at 1500541010211) (:by nil) (:id |SyoWb5UleCSW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |Hy2bWqIlg0rW) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by nil) (:id |HJpWZc8ggRH-) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |BkRZ-cIle0H-) (:text |:username) (:type :leaf)
                                                  |j $ {} (:at 1500541010211) (:by |root) (:id |HyyM-9UglArZ) (:text |state) (:type :leaf)
                                          |v $ {} (:at 1500541010211) (:by nil) (:id |rklGb9LxlRSW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |Sy-fW58glCSZ) (:text |:style) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by |root) (:id |SJGf-5Llx0SW) (:text |ui/input) (:type :leaf)
                                          |x $ {} (:at 1500541010211) (:by nil) (:id |rJFis1lQM) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1514302367311) (:by |root) (:id |H1_f-5UlxAr-) (:text |:on-input) (:type :leaf)
                                              |j $ {} (:at 1584878937260) (:by |B1y7Rc-Zz) (:id |esoOmFiTd) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1584878937919) (:by |B1y7Rc-Zz) (:id |NPV-d7ARom) (:text |fn) (:type :leaf)
                                                  |L $ {} (:at 1584878938450) (:by |B1y7Rc-Zz) (:id |QYP_YrYdY0) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1584878938663) (:by |B1y7Rc-Zz) (:id |xy9NsOBb4) (:text |e) (:type :leaf)
                                                      |j $ {} (:at 1584878939257) (:by |B1y7Rc-Zz) (:id |4D4Op2ggVB) (:text |d!) (:type :leaf)
                                                  |f $ {} (:at 1584878940724) (:by |B1y7Rc-Zz) (:id |dxczz8zTVx) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1584878941345) (:by |B1y7Rc-Zz) (:id |dxczz8zTVxleaf) (:text |d!) (:type :leaf)
                                                      |j $ {} (:at 1584878942506) (:by |B1y7Rc-Zz) (:id |a6ADwphuF-) (:text |cursor) (:type :leaf)
                                                      |r $ {} (:at 1584878944231) (:by |B1y7Rc-Zz) (:id |kShCYGHE4) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1584878946740) (:by |B1y7Rc-Zz) (:id |F03kLn2oYk) (:text |assoc) (:type :leaf)
                                                          |j $ {} (:at 1584878953964) (:by |B1y7Rc-Zz) (:id |DyMZLkjbu) (:text |state) (:type :leaf)
                                                          |r $ {} (:at 1584878957010) (:by |B1y7Rc-Zz) (:id |4f_-wl1tV) (:text |:username) (:type :leaf)
                                                          |v $ {} (:at 1584878962151) (:by |B1y7Rc-Zz) (:id |THXboIPV6) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1584878962807) (:by |B1y7Rc-Zz) (:id |VtLouii3n) (:text |:value) (:type :leaf)
                                                              |j $ {} (:at 1584878963013) (:by |B1y7Rc-Zz) (:id |S8U4Kba_m5) (:text |e) (:type :leaf)
                              |v $ {} (:at 1500541010211) (:by nil) (:id |rJ6MW9IxgAH-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |S1RzbqIxl0Sb) (:text |=<) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |Sy17-5Iex0SW) (:text |nil) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by |root) (:id |B1gQWqUxe0rZ) (:text |8) (:type :leaf)
                              |x $ {} (:at 1500541010211) (:by nil) (:id |rybQZcLeeABW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkfm-5IxgASW) (:text |div) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |SJX7ZqIeeCB-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |Hk4mZ5IxgASW) (:text |{}) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by nil) (:id |rJHQb58xxRBW) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |rJU7Zc8xlCSW) (:text |input) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |SyPX-qIxxRBb) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |ry_XZ5UglRrZ) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by nil) (:id |HyK7bcIexCS-) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |Bk9XZqLglArZ) (:text |:placeholder) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by |root) (:id |HkomWcUlxCBb) (:text ||Password) (:type :leaf)
                                          |r $ {} (:at 1500541010211) (:by nil) (:id |S1hmb98glRSZ) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |H16XZc8ee0rb) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by nil) (:id |r1C7bcLel0BZ) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |BykV-cLlgAHW) (:text |:password) (:type :leaf)
                                                  |j $ {} (:at 1500541010211) (:by |root) (:id |rylNWcLelArZ) (:text |state) (:type :leaf)
                                          |v $ {} (:at 1500541010211) (:by nil) (:id |rkb4Zq8le0BW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |S1zEb9Leg0H-) (:text |:style) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by |root) (:id |r174W9LllRB-) (:text |ui/input) (:type :leaf)
                                          |x $ {} (:at 1500541010211) (:by nil) (:id |S1Znooygmf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1514302370752) (:by |root) (:id |SkYEbqUleRr-) (:text |:on-input) (:type :leaf)
                                              |j $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |Z_akno9W3a) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |pgJZA6Clhu) (:text |fn) (:type :leaf)
                                                  |j $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |r69BP5N6UZ) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |nh0ymsnXJU) (:text |e) (:type :leaf)
                                                      |j $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |XCwEJ9vo7I) (:text |d!) (:type :leaf)
                                                  |r $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |6RCS9EnREr) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |-o9Ox8j-n0) (:text |d!) (:type :leaf)
                                                      |j $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |tGhHBkIhUv) (:text |cursor) (:type :leaf)
                                                      |r $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |3VZHTnNIZi) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |8TqwSKlHvP) (:text |assoc) (:type :leaf)
                                                          |j $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |tKaWUPwIi9) (:text |state) (:type :leaf)
                                                          |r $ {} (:at 1584878968508) (:by |B1y7Rc-Zz) (:id |ZFEqOzh1mb) (:text |:password) (:type :leaf)
                                                          |v $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |cv-kR-3_0b) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |zp6cz7Dhbc) (:text |:value) (:type :leaf)
                                                              |j $ {} (:at 1584878966316) (:by |B1y7Rc-Zz) (:id |XNqeZH5YWk4) (:text |e) (:type :leaf)
                          |v $ {} (:at 1500541010211) (:by nil) (:id |HkCEZcIegCSb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |SJyBZc8xgCSZ) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by |root) (:id |BJlHZ98eg0SZ) (:text |nil) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by |root) (:id |B1WSZ58lxArb) (:text |8) (:type :leaf)
                          |x $ {} (:at 1500541010211) (:by nil) (:id |rJfHW98egCSb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |ByXH-cLlx0S-) (:text |div) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |r1NBZ5Uxg0BZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |HyHSb58leCHb) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |BJLSb9LxeASZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |HkDrZqUlxRBb) (:text |:style) (:type :leaf)
                                      |j $ {} (:at 1519368067092) (:by |root) (:id |SyGsFwVaDf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1519368067501) (:by |root) (:id |HyWoFDNaDf) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1519368135916) (:by |root) (:id |B1xl0wE6wf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1519368141461) (:by |root) (:id |HyeAv4TPf) (:text |:text-align) (:type :leaf)
                                              |j $ {} (:at 1519368142240) (:by |root) (:id |B1I0wN6DG) (:text |:right) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |BJtHWq8llRSb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1519367924372) (:by |root) (:id |HJ9BZcIeeCSb) (:text |span) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |H1sBZ98geRSW) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |SkhSb5UleABb) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |rJTH-9UlgCHW) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |rJ0SZ5Ilx0SW) (:text |:inner-text) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by |root) (:id |HJyIZqUleAH-) (:text "||Sign up") (:type :leaf)
                                      |r $ {} (:at 1500541010211) (:by nil) (:id |rJeIW5Ugx0HZ) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |r1bIZ9IxxAHb) (:text |:style) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by nil) (:id |SkfLZ5UglArZ) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |H178Wq8exCSb) (:text |merge) (:type :leaf)
                                              |j $ {} (:at 1519368006916) (:by |root) (:id |rJVIb58xe0B-) (:text |style/link) (:type :leaf)
                                      |v $ {} (:at 1500541010211) (:by nil) (:id |Syxb3iJg7G) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1514302375364) (:by |root) (:id |SkMP-cIgl0rb) (:text |:on-click) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by nil) (:id |rJ7wZ9Lxx0S-) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |Sy4PbcUxgRHZ) (:text |on-submit) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by nil) (:id |ryBvWcUgeCBb) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkLPZ9Lgx0rW) (:text |:username) (:type :leaf)
                                                  |j $ {} (:at 1500541010211) (:by |root) (:id |ryPv-5UgxAHZ) (:text |state) (:type :leaf)
                                              |r $ {} (:at 1500541010211) (:by nil) (:id |Byuw-cLxgCBb) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |HyFvW5LglAH-) (:text |:password) (:type :leaf)
                                                  |j $ {} (:at 1500541010211) (:by |root) (:id |r1qDZ98geRSW) (:text |state) (:type :leaf)
                                              |v $ {} (:at 1500541010211) (:by |root) (:id |HkjwbqLxlAHb) (:text |true) (:type :leaf)
                              |v $ {} (:at 1500541010211) (:by nil) (:id |B13wW9IgxCrb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |SJTPZc8xxAHW) (:text |=<) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |ryCvbqIxlCHZ) (:text |8) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by |root) (:id |HyyO-q8glAS-) (:text |nil) (:type :leaf)
                              |x $ {} (:at 1500541010211) (:by nil) (:id |Skg_WqIxx0S-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1519367939048) (:by |root) (:id |HkWu-qIgeRrW) (:text |span) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |HkfdZ9IelABZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |S17d-5UgxCr-) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |Sk4_bq8leCHb) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |rkB_W98xxABZ) (:text |:inner-text) (:type :leaf)
                                          |j $ {} (:at 1519368084428) (:by |root) (:id |Sk8OW5LexRrW) (:text "||Log in") (:type :leaf)
                                      |r $ {} (:at 1500541010211) (:by nil) (:id |HywdZ9LeeRHb) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |rJ_OZc8lx0Bb) (:text |:style) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by nil) (:id |r1gEIv46Df) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |H178Wq8exCSb) (:text |merge) (:type :leaf)
                                              |j $ {} (:at 1519368006916) (:by |root) (:id |rJVIb58xe0B-) (:text |style/link) (:type :leaf)
                                      |v $ {} (:at 1500541010211) (:by nil) (:id |HJlw3skxQM) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1514302381488) (:by |root) (:id |BJYF-5Uxe0S-) (:text |:on-click) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by nil) (:id |rk9F-cUex0H-) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |HyoKb98elRr-) (:text |on-submit) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by nil) (:id |B1hYZcIxxASb) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |Skptbq8xeCBb) (:text |:username) (:type :leaf)
                                                  |j $ {} (:at 1500541010211) (:by |root) (:id |rJRFWc8eeRr-) (:text |state) (:type :leaf)
                                              |r $ {} (:at 1500541010211) (:by nil) (:id |Sk15Z9LleCS-) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |Bkl9-5IlxRB-) (:text |:password) (:type :leaf)
                                                  |j $ {} (:at 1500541010211) (:by |root) (:id |SJWq-58llAHW) (:text |state) (:type :leaf)
                                              |v $ {} (:at 1500541010211) (:by |root) (:id |rJfq-9Lge0B-) (:text |false) (:type :leaf)
          |initial-state $ {} (:at 1500541010211) (:by nil) (:id |BkQcW5IlxCrb) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |HJN9bcIlg0rW) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |B1B9-9Uel0Hb) (:text |initial-state) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |H1IqZcLgg0BW) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |Hyvq-qIllRrZ) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1500541010211) (:by nil) (:id |Hkd9b5UxgCBW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |ryF5b9IgxRB-) (:text |:username) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by |root) (:id |SJq5-qUll0rb) (:text ||) (:type :leaf)
                  |r $ {} (:at 1500541010211) (:by nil) (:id |SJs5-qLel0H-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |HyhcbqUggRHb) (:text |:password) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by |root) (:id |S16cbc8lx0Bb) (:text ||) (:type :leaf)
          |on-submit $ {} (:at 1500541010211) (:by nil) (:id |ryRox98ggCBW) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |H1k3e58glCr-) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |SylnxqLgg0H-) (:text |on-submit) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |Hk-2e9IglCrW) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |SkG2lqIxe0SW) (:text |username) (:type :leaf)
                  |j $ {} (:at 1500541010211) (:by |root) (:id |r172xqLexCr-) (:text |password) (:type :leaf)
                  |r $ {} (:at 1500541010211) (:by |root) (:id |SkEhlqIegRB-) (:text |signup?) (:type :leaf)
              |v $ {} (:at 1500541010211) (:by nil) (:id |SyB2gqIleArb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |BJLhecIxg0rb) (:text |fn) (:type :leaf)
                  |j $ {} (:at 1500541010211) (:by nil) (:id |HJDne5LgxASZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |SJOnxqUxx0Sb) (:text |e) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by |root) (:id |BJK2xcLglCHZ) (:text |dispatch!) (:type :leaf)
                  |r $ {} (:at 1500541010211) (:by nil) (:id |BJ93x98gg0rW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |rkshx5Lgx0HZ) (:text |dispatch!) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by nil) (:id |By22eqIxxRB-) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |SkT3gqIlgArb) (:text |if) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by |root) (:id |SJR3gqLegCr-) (:text |signup?) (:type :leaf)
                          |r $ {} (:at 1500541010211) (:by |root) (:id |r11Te5UxgABZ) (:text |:user/sign-up) (:type :leaf)
                          |v $ {} (:at 1500541010211) (:by |root) (:id |r1l6e5IgxCBb) (:text |:user/log-in) (:type :leaf)
                      |r $ {} (:at 1500541010211) (:by nil) (:id |By-Tx58xgRSW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |r1GTxcIleAHb) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by |root) (:id |Hy7ax5LexRHb) (:text |username) (:type :leaf)
                          |r $ {} (:at 1500541010211) (:by |root) (:id |S1E6l9Lle0r-) (:text |password) (:type :leaf)
                  |v $ {} (:at 1500541010211) (:by nil) (:id |BySax58xgRBb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |rJ8Te9IgeABZ) (:text |.setItem) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by |root) (:id |rkPpe9IglASZ) (:text |js/localStorage) (:type :leaf)
                      |r $ {} (:at 1500541010211) (:by nil) (:id |ryO6eq8ex0r-) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |r1Kal58gl0HZ) (:text |:storage-key) (:type :leaf)
                          |j $ {} (:at 1527788909281) (:by |root) (:id |ry5alqLglAr-) (:text |config/site) (:type :leaf)
                      |v $ {} (:at 1629965500363) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1629965502708) (:by |B1y7Rc-Zz) (:text |format-cirru-edn) (:type :leaf)
                          |T $ {} (:at 1500541010211) (:by nil) (:id |Hyj6eqIle0S-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |rkhaecLxlRBW) (:text |[]) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by |root) (:id |Hk6al98leAHZ) (:text |username) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by |root) (:id |BJ0Te9LexCHZ) (:text |password) (:type :leaf)
        :ns $ {} (:at 1500541010211) (:by nil) (:id |Hys_eqLgeAH-) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541010211) (:by |root) (:id |Hk3Ox5LleArW) (:text |ns) (:type :leaf)
            |j $ {} (:at 1510936619134) (:by |root) (:id |ry6_xqLxgCS-) (:text |app.comp.login) (:type :leaf)
            |v $ {} (:at 1500541010211) (:by nil) (:id |SJ3YeqUlxABZ) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541010211) (:by |root) (:id |By6Fe5LlgRr-) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541010211) (:by nil) (:id |rJxw4e52kz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541010211) (:by |root) (:id |r1-Yg5UelCSZ) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1542907262877) (:by |B1y7Rc-Zz) (:id |HyfFecIgxCSZ) (:text |respo.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |rkQKx5Lxg0rZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |B1VFg98ex0Sb) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1500541010211) (:by |root) (:id |r1HtxqIelASb) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1500541010211) (:by |root) (:id |BJLFecUle0S-) (:text |defcomp) (:type :leaf)
                        |r $ {} (:at 1500541010211) (:by |root) (:id |r1Dtg9Igg0rW) (:text |<>) (:type :leaf)
                        |v $ {} (:at 1500541010211) (:by |root) (:id |SydYe98xe0BW) (:text |div) (:type :leaf)
                        |x $ {} (:at 1500541010211) (:by |root) (:id |HJttec8elRrW) (:text |input) (:type :leaf)
                        |y $ {} (:at 1500541010211) (:by |root) (:id |HJ9tl98xxAHb) (:text |button) (:type :leaf)
                        |yT $ {} (:at 1500541010211) (:by |root) (:id |SyoYl9LelCBW) (:text |span) (:type :leaf)
                |r $ {} (:at 1500541010211) (:by nil) (:id |rkBqe58el0HZ) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541010211) (:by |root) (:id |S189lq8leAHW) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541010211) (:by |root) (:id |B1DcxqUexABZ) (:text |respo.comp.space) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |r1dcgc8xg0HZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |SyF5x98llCSW) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1500541010211) (:by |root) (:id |rJc9g58xg0HZ) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1500541010211) (:by |root) (:id |H1j9g98ggCB-) (:text |=<) (:type :leaf)
                |v $ {} (:at 1500541010211) (:by nil) (:id |S129ecIxeAHZ) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541010211) (:by |root) (:id |By6cgq8llCr-) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541010211) (:by |root) (:id |rJ09lqUxeRBb) (:text |respo.comp.inspect) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |BkJoxqUeg0r-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |HJxigqIex0Sb) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1500541010211) (:by |root) (:id |HkWslq8eeCH-) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1500541010211) (:by |root) (:id |S1Gsg98geRrb) (:text |comp-inspect) (:type :leaf)
                |x $ {} (:at 1500541010211) (:by nil) (:id |rk7ol9IxxABZ) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541010211) (:by |root) (:id |ry4ie5IgeArW) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1516547410331) (:by |root) (:id |B1Bjgc8gxRrW) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |BkIjeq8xxCBZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |r1vixqLll0SZ) (:text |ui) (:type :leaf)
                |y $ {} (:at 1500541010211) (:by nil) (:id |ry_sxqUeeAHZ) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541010211) (:by |root) (:id |H1Kie58xlAHb) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541010211) (:by |root) (:id |BJ9sgqLxxABW) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |SkjsgcIxeCHZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |r1niecUxlCrZ) (:text |schema) (:type :leaf)
                |yT $ {} (:at 1500541010211) (:by nil) (:id |SJdID4pPz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541010211) (:by |root) (:id |H1Kie58xlAHb) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1519368017028) (:by |root) (:id |BJ9sgqLxxABW) (:text |app.style) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |SkjsgcIxeCHZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1519368019779) (:by |root) (:id |r1niecUxlCrZ) (:text |style) (:type :leaf)
                |yj $ {} (:at 1527788911549) (:by |root) (:id |H1d_S2a1Q) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1527788911897) (:by |root) (:id |H1d_S2a1Qleaf) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1527788913217) (:by |root) (:id |HJGd_rnakm) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1527788914516) (:by |root) (:id |S1IKdB3aJQ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1527788915188) (:by |root) (:id |rJouHhpkQ) (:text |config) (:type :leaf)
        :proc $ {} (:at 1500541010211) (:by nil) (:id |Bkajg9LggCH-) (:type :expr)
          :data $ {}
      |app.comp.navigation $ {}
        :defs $ {}
          |comp-navigation $ {} (:at 1500541010211) (:by nil) (:id |Bk2vfqUxl0BZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |Sy6DG9UglCrb) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |rJRPfqLgxArb) (:text |comp-navigation) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |H11df58le0Bb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |rJxuzcLle0S-) (:text |logged-in?) (:type :leaf)
                  |j $ {} (:at 1523120365880) (:by |root) (:id |r1W-lK_Lsz) (:text |count-members) (:type :leaf)
                  |r $ {} (:at 1557246851676) (:by |B1y7Rc-Zz) (:id |-JeD7EuMng) (:text |page) (:type :leaf)
              |v $ {} (:at 1573056965569) (:by |B1y7Rc-Zz) (:id |dRdRn1ahE) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1573056966254) (:by |B1y7Rc-Zz) (:id |vvrbNE0vVn) (:text |div) (:type :leaf)
                  |L $ {} (:at 1573056966462) (:by |B1y7Rc-Zz) (:id |iq6WNYveBg) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1573056966795) (:by |B1y7Rc-Zz) (:id |Do59eValCp) (:text |{}) (:type :leaf)
                      |j $ {} (:at 1573056969309) (:by |B1y7Rc-Zz) (:id |c0NGSeb-JF) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790608030) (:by |B1y7Rc-Zz) (:id |3V0OO8Avz5) (:text |:class-name) (:type :leaf)
                          |j $ {} (:at 1657790605747) (:by |B1y7Rc-Zz) (:id |btDqWUI6_v) (:text |css-navbar) (:type :leaf)
                  |T $ {} (:at 1500541010211) (:by nil) (:id |rkW_zqUxlCrZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |HJM_fc8elAHW) (:text |div) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by nil) (:id |H1QdzqLge0SW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |BJNOG5LleABZ) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657791185632) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791188027) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                              |b $ {} (:at 1657791191465) (:by |B1y7Rc-Zz) (:text |css/row-parted) (:type :leaf)
                          |j $ {} (:at 1573056970658) (:by |B1y7Rc-Zz) (:id |8ulhiCahsw) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1573056971443) (:by |B1y7Rc-Zz) (:id |1DfQQXbQI) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1573056971638) (:by |B1y7Rc-Zz) (:id |rKW-gtNOC) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1573056971973) (:by |B1y7Rc-Zz) (:id |-yoMq9L1jH) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1573056972352) (:by |B1y7Rc-Zz) (:id |DMOSC96xrs) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1573057005108) (:by |B1y7Rc-Zz) (:id |9DZ4N2Woba) (:text |:max-width) (:type :leaf)
                                      |j $ {} (:at 1573057086054) (:by |B1y7Rc-Zz) (:id |d3IEZnQ9B) (:text |840) (:type :leaf)
                                  |n $ {} (:at 1573057028658) (:by |B1y7Rc-Zz) (:id |BvmQ0COnK) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1573057030573) (:by |B1y7Rc-Zz) (:id |BvmQ0COnKleaf) (:text |:width) (:type :leaf)
                                      |j $ {} (:at 1573057039241) (:by |B1y7Rc-Zz) (:id |QnL4QtiXqP) (:text "|\"100%") (:type :leaf)
                                  |r $ {} (:at 1573056979386) (:by |B1y7Rc-Zz) (:id |rN0tAC2J6Z) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1573056980513) (:by |B1y7Rc-Zz) (:id |rN0tAC2J6Zleaf) (:text |:margin) (:type :leaf)
                                      |j $ {} (:at 1573056981731) (:by |B1y7Rc-Zz) (:id |fLbxHtcxU) (:text |:auto) (:type :leaf)
                      |r $ {} (:at 1500541010211) (:by nil) (:id |Bkj_M9LlxCHb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |Hk3dfcUex0rW) (:text |div) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |BJT_z5UgeRB-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |rkCufcIex0rb) (:text |{}) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |ByIFGc8leCBW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657791201277) (:by |B1y7Rc-Zz) (:id |BywKzqUegArW) (:text |:class-name) (:type :leaf)
                                  |j $ {} (:at 1657791205899) (:by |B1y7Rc-Zz) (:id |NozKVCvpfn) (:text |css/row-center) (:type :leaf)
                          |r $ {} (:at 1557585916995) (:by |B1y7Rc-Zz) (:id |PkblZW2nf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |c6Rl4h5K1le) (:text |render-entry) (:type :leaf)
                              |j $ {} (:at 1557585917642) (:by |B1y7Rc-Zz) (:id |hPdDDbL3mH) (:text "|\"Timegrass") (:type :leaf)
                              |r $ {} (:at 1557586081529) (:by |B1y7Rc-Zz) (:id |HMbkewijl) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1557586082036) (:by |B1y7Rc-Zz) (:id |U4zpnucWFC) (:text |fn) (:type :leaf)
                                  |L $ {} (:at 1557586082318) (:by |B1y7Rc-Zz) (:id |eKsEeXOiAJ) (:type :expr)
                                    :data $ {}
                                  |T $ {} (:at 1557585997842) (:by |B1y7Rc-Zz) (:id |eIHTrzex8e) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557585997842) (:by |B1y7Rc-Zz) (:id |3ndvwBRfV3) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1557585997842) (:by |B1y7Rc-Zz) (:id |f94duFTgZz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557585997842) (:by |B1y7Rc-Zz) (:id |y7TxvgWc9J) (:text |:name) (:type :leaf)
                                          |j $ {} (:at 1557586119224) (:by |B1y7Rc-Zz) (:id |lTgpi60WJc) (:text |:home) (:type :leaf)
                              |v $ {} (:at 1557586000953) (:by |B1y7Rc-Zz) (:id |xW9GZrSUCI) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1557586001883) (:by |B1y7Rc-Zz) (:id |mZ6X64ISg) (:text |=) (:type :leaf)
                                  |T $ {} (:at 1557585936299) (:by |B1y7Rc-Zz) (:id |DdZSnm7ty) (:text |page) (:type :leaf)
                                  |j $ {} (:at 1557586003751) (:by |B1y7Rc-Zz) (:id |9nx0cTQ8w) (:text |:home) (:type :leaf)
                          |t $ {} (:at 1556645266340) (:by |B1y7Rc-Zz) (:id |JckFb_GpKb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556645266778) (:by |B1y7Rc-Zz) (:id |JckFb_GpKbleaf) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1556645274410) (:by |B1y7Rc-Zz) (:id |07kruAyOPF) (:text |16) (:type :leaf)
                              |r $ {} (:at 1556645267874) (:by |B1y7Rc-Zz) (:id |jt2hjM7oL) (:text |nil) (:type :leaf)
                          |w $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |RO43RWPT3v) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |Vut5wepJPw) (:text |render-entry) (:type :leaf)
                              |j $ {} (:at 1608717909853) (:by |B1y7Rc-Zz) (:id |s9Glt1o3Xi) (:text "|\"Finished") (:type :leaf)
                              |r $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |8v8710KX4Q) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |rTMSzHKzRF) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |djZqjInQ6I) (:type :expr)
                                    :data $ {}
                                  |r $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |vbk36w8Q8g) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |cexdq8dfd4) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |uRQjsP-QkT) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |bEbwfS0Y8d) (:text |:name) (:type :leaf)
                                          |j $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |x4_qRH9sVo) (:text |:history) (:type :leaf)
                                      |r $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |WM7M840DCg) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |LVF_hNQclD) (:text |:data) (:type :leaf)
                                          |j $ {} (:at 1616603095926) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1616603097296) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                                              |L $ {} (:at 1616603098288) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1616603098388) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1616603180374) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                                                      |j $ {} (:at 1616603100315) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1616603103763) (:by |B1y7Rc-Zz) (:text |dayjs) (:type :leaf)
                                                  |j $ {} (:at 1616603165085) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1616603168708) (:by |B1y7Rc-Zz) (:text |month) (:type :leaf)
                                                      |j $ {} (:at 1616603169640) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1658934967208) (:by |B1y7Rc-Zz) (:text |.!month) (:type :leaf)
                                                          |j $ {} (:at 1616603172094) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                                                  |n $ {} (:at 1677346351618) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1677346355200) (:by |B1y7Rc-Zz) (:text |week-date) (:type :leaf)
                                                      |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                                          |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |and) (:type :leaf)
                                                              |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |=) (:type :leaf)
                                                                  |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |month) (:type :leaf)
                                                                  |h $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |11) (:type :leaf)
                                                              |h $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |>) (:type :leaf)
                                                                  |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |.!date) (:type :leaf)
                                                                      |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                                                                  |h $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |25) (:type :leaf)
                                                          |h $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |.!week) (:type :leaf)
                                                              |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |.!subtract) (:type :leaf)
                                                                  |b $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                                                                  |h $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |7) (:type :leaf)
                                                                  |l $ {} (:at 1677346357166) (:by |B1y7Rc-Zz) (:text "|\"day") (:type :leaf)
                                                          |l $ {} (:at 1677346381204) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                                              |T $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |qIR70dRfL0) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |WZrAahemf1) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |p9WbxCSUQb) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |leEV-Y9RYD) (:text |:year) (:type :leaf)
                                                      |j $ {} (:at 1616603106404) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1658934968936) (:by |B1y7Rc-Zz) (:text |.!year) (:type :leaf)
                                                          |j $ {} (:at 1616603109885) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                                                  |r $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |CL8N8dfwrHg) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557586164005) (:by |B1y7Rc-Zz) (:id |bk7EESpg16L) (:text |:week) (:type :leaf)
                                                      |b $ {} (:at 1677346388084) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1677346393330) (:by |B1y7Rc-Zz) (:text |.!week) (:type :leaf)
                                                          |b $ {} (:at 1677346395715) (:by |B1y7Rc-Zz) (:text |week-date) (:type :leaf)
                                                  |t $ {} (:at 1677346398348) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1677346402043) (:by |B1y7Rc-Zz) (:text |:start) (:type :leaf)
                                                      |b $ {} (:at 1677346419087) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1677346422361) (:by |B1y7Rc-Zz) (:text |.!format) (:type :leaf)
                                                          |T $ {} (:at 1677346404382) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1677346411034) (:by |B1y7Rc-Zz) (:text |.!startOf) (:type :leaf)
                                                              |T $ {} (:at 1677346404929) (:by |B1y7Rc-Zz) (:text |week-date) (:type :leaf)
                                                              |b $ {} (:at 1677346415877) (:by |B1y7Rc-Zz) (:text "|\"week") (:type :leaf)
                                                  |u $ {} (:at 1677346398348) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1677346429424) (:by |B1y7Rc-Zz) (:text |:end) (:type :leaf)
                                                      |b $ {} (:at 1677346419087) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1677346422361) (:by |B1y7Rc-Zz) (:text |.!format) (:type :leaf)
                                                          |T $ {} (:at 1677346404382) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1677346433089) (:by |B1y7Rc-Zz) (:text |.!endOf) (:type :leaf)
                                                              |T $ {} (:at 1677346404929) (:by |B1y7Rc-Zz) (:text |week-date) (:type :leaf)
                                                              |b $ {} (:at 1677346415877) (:by |B1y7Rc-Zz) (:text "|\"week") (:type :leaf)
                              |v $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |EP13l5qMiK) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |ck1lWXm651) (:text |=) (:type :leaf)
                                  |j $ {} (:at 1557586128850) (:by |B1y7Rc-Zz) (:id |h_HBfqtf7x) (:text |page) (:type :leaf)
                                  |r $ {} (:at 1557586168120) (:by |B1y7Rc-Zz) (:id |0sUAQ0n-Tt) (:text |:history) (:type :leaf)
                          |wT $ {} (:at 1557586192266) (:by |B1y7Rc-Zz) (:id |5Jgyv51TB_) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557586192266) (:by |B1y7Rc-Zz) (:id |9h5Ob5iyhx) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1557586192266) (:by |B1y7Rc-Zz) (:id |TUHMhomGD9) (:text |16) (:type :leaf)
                              |r $ {} (:at 1557586192266) (:by |B1y7Rc-Zz) (:id |9ci6aVD2S_) (:text |nil) (:type :leaf)
                          |x $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |taQ66R5gqP) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |VvnM4seMY9) (:text |render-entry) (:type :leaf)
                              |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |xBEHw6FI7v) (:text "|\"Notes") (:type :leaf)
                              |r $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |fOWXJt44Bj) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |3gh4rjPmZe) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |cwUC1MxEjP) (:type :expr)
                                    :data $ {}
                                  |r $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |EsnZkjYvhp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |Vp5YbH3NMd) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |TjYyC-lyKt) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |XK0uZxu6pn) (:text |:name) (:type :leaf)
                                          |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |46iFNU-e4a) (:text |:notes) (:type :leaf)
                                      |r $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |pqLk5rDZUX) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |jLQ8b0vKWs) (:text |:data) (:type :leaf)
                                          |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |NZfx8IFyUNx) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |fdgjmABAS2L) (:text |let) (:type :leaf)
                                              |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |0KsDFAvUK8d) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |KPrft8ZNQVt) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |KJSeCSmR05E) (:text |now) (:type :leaf)
                                                      |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |LcF-pP3VIIM) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |nbB_MWmvapX) (:text |dayjs) (:type :leaf)
                                              |r $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |t-RD80cSlyU) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |BztR_7Yl1rn) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |DzRL_DeJJDr) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |t60oH-13K-C) (:text |:year) (:type :leaf)
                                                      |j $ {} (:at 1616603113628) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1658934982539) (:by |B1y7Rc-Zz) (:text |.!year) (:type :leaf)
                                                          |j $ {} (:at 1616603114595) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                                                  |r $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |vgtcTHKVVqo) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1591602693439) (:by |B1y7Rc-Zz) (:id |tPcbBYFk_qR) (:text |:month) (:type :leaf)
                                                      |j $ {} (:at 1616603116357) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1658934984154) (:by |B1y7Rc-Zz) (:text |.!month) (:type :leaf)
                                                          |j $ {} (:at 1616603118956) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                              |v $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |h4lC2k3Rnqt) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |JdiHXAz5tgv) (:text |=) (:type :leaf)
                                  |j $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |ip8QuqlS7Qy) (:text |page) (:type :leaf)
                                  |r $ {} (:at 1557586190349) (:by |B1y7Rc-Zz) (:id |DdY6TBKMyLT) (:text |:notes) (:type :leaf)
                      |v $ {} (:at 1500541010211) (:by nil) (:id |H10FM9IeeRBb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |ByyqzcUglRHZ) (:text |div) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |rkl5GcLglABW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |HybqMqUge0SW) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |BkfcMq8ge0HZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkX5G5Ueg0rW) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |SybUXoVcf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |SyYjz9UgxCrZ) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |B1ciG9UlxRrW) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1500541010211) (:by |root) (:id |HJjozqIgl0Sb) (:text |:cursor) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by |root) (:id |BknsM58xxRrW) (:text ||pointer) (:type :leaf)
                                      |r $ {} (:at 1643082964259) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1643082966515) (:by |B1y7Rc-Zz) (:text |:user-select) (:type :leaf)
                                          |j $ {} (:at 1643082967955) (:by |B1y7Rc-Zz) (:text |:none) (:type :leaf)
                              |n $ {} (:at 1643082970389) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1643082971951) (:by |B1y7Rc-Zz) (:text |:tab-index) (:type :leaf)
                                  |j $ {} (:at 1643082972178) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |SJeLFokgXG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1514302332444) (:by |root) (:id |Hkc5MqUgeCBb) (:text |:on-click) (:type :leaf)
                                  |j $ {} (:at 1584879567748) (:by |B1y7Rc-Zz) (:id |lVzn1Vokok) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1584879568298) (:by |B1y7Rc-Zz) (:id |EVNvy2YyU5) (:text |fn) (:type :leaf)
                                      |L $ {} (:at 1584879568715) (:by |B1y7Rc-Zz) (:id |TLIcB9smFU) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879569040) (:by |B1y7Rc-Zz) (:id |G2tN74nPIt) (:text |e) (:type :leaf)
                                          |j $ {} (:at 1584879569770) (:by |B1y7Rc-Zz) (:id |Jj_ayjfKx) (:text |d!) (:type :leaf)
                                      |T $ {} (:at 1500541010211) (:by nil) (:id |SkwUXjN5z) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879567281) (:by |B1y7Rc-Zz) (:id |HyvLfcIelAHb) (:text |d!) (:type :leaf)
                                          |j $ {} (:at 1500541010211) (:by |root) (:id |r1_8fqLxgRHZ) (:text |:router/change) (:type :leaf)
                                          |r $ {} (:at 1500541010211) (:by nil) (:id |S1KIfc8xx0Sb) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |BJqIM5LexCH-) (:text |{}) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by nil) (:id |SyjIfc8ggAHZ) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |HJ3LM5LgxABb) (:text |:name) (:type :leaf)
                                                  |j $ {} (:at 1500541010211) (:by |root) (:id |rJT8GqIgxRr-) (:text |:profile) (:type :leaf)
                          |r $ {} (:at 1500541010211) (:by nil) (:id |Hkhcfq8gx0Sb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |SJ69McLelASZ) (:text |<>) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |ByysG5UgxABb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |SkesM9IllRBZ) (:text |if) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |H1bjz98xxRSb) (:text |logged-in?) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by |root) (:id |Syziz98ggAS-) (:text ||Me) (:type :leaf)
                                  |v $ {} (:at 1500541010211) (:by |root) (:id |Hk7izqLel0rb) (:text ||Guest) (:type :leaf)
                          |v $ {} (:at 1523120369216) (:by |root) (:id |BkeFgYdUif) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1523120369974) (:by |root) (:id |BkeFgYdUifleaf) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1523120371053) (:by |root) (:id |S1lcgFd8if) (:text |8) (:type :leaf)
                              |r $ {} (:at 1523120371555) (:by |root) (:id |HyeogYO8jM) (:text |nil) (:type :leaf)
                          |x $ {} (:at 1523120371997) (:by |root) (:id |Hk-2xtuUjf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1523120372630) (:by |root) (:id |Hk-2xtuUjfleaf) (:text |<>) (:type :leaf)
                              |j $ {} (:at 1523120373023) (:by |root) (:id |HkZpxFdIiM) (:text |count-members) (:type :leaf)
          |css-entry $ {} (:at 1658935044121) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1658935045893) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1658935044121) (:by |B1y7Rc-Zz) (:text |css-entry) (:type :leaf)
              |h $ {} (:at 1658935044121) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1658935049236) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |X $ {} (:at 1658935121939) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658935123245) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1658935123663) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935123663) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |:opacity) (:type :leaf)
                              |b $ {} (:at 1658935168847) (:by |B1y7Rc-Zz) (:text |0.6) (:type :leaf)
                          |h $ {} (:at 1658935123663) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |:user-select) (:type :leaf)
                              |b $ {} (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |:none) (:type :leaf)
                          |l $ {} (:at 1658935147720) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935152001) (:by |B1y7Rc-Zz) (:text |:transition-duration) (:type :leaf)
                              |b $ {} (:at 1658935153189) (:by |B1y7Rc-Zz) (:text "|\"200ms") (:type :leaf)
                  |b $ {} (:at 1658935051118) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658935059849) (:by |B1y7Rc-Zz) (:text "|\"$0:hover") (:type :leaf)
                      |b $ {} (:at 1658935060233) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935060634) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935060985) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935076739) (:by |B1y7Rc-Zz) (:text |:opacity) (:type :leaf)
                              |b $ {} (:at 1658935126761) (:by |B1y7Rc-Zz) (:text |0.8) (:type :leaf)
          |css-navbar $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |azsnOXNnsH) (:type :expr)
            :data $ {}
              |T $ {} (:at 1657790570713) (:by |B1y7Rc-Zz) (:id |gt2fg0iVwb) (:text |defstyle) (:type :leaf)
              |j $ {} (:at 1657790568195) (:by |B1y7Rc-Zz) (:text |css-navbar) (:type :leaf)
              |r $ {} (:at 1657790571753) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1657790572277) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |T $ {} (:at 1657790572666) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1657790574351) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |7i9fvBA7BS) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |GkoXDCv4Mb) (:text |merge) (:type :leaf)
                          |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |YLWb1frisO) (:text |ui/row-center) (:type :leaf)
                          |r $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |4UwSColyT1) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |lvsrjsWhS-) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |Ynegavq7Iu) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |Yn2XfMaRjm) (:text |:height) (:type :leaf)
                                  |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |UpUg7t8zWx) (:text |48) (:type :leaf)
                              |v $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |jjIWxj-xTG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |-E5tFl5tPf9) (:text |:padding) (:type :leaf)
                                  |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |vQvyRPXpeKn) (:text "|\"0 16px") (:type :leaf)
                              |x $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |EYju2CPLzh8) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |-IIo7AcSwdF) (:text |:font-size) (:type :leaf)
                                  |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |5Chkq0KksXr) (:text |16) (:type :leaf)
                              |y $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |yY0OJ3jDoqm) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |bW1ei7kkHD_) (:text |:border-bottom) (:type :leaf)
                                  |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |CPqzHzOIcTj) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |viyq4y_s874) (:text |str) (:type :leaf)
                                      |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |s5ww9LI-hqG) (:text "|\"1px solid ") (:type :leaf)
                                      |r $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |D5sXdfJIQb9) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |8Pmbn5eI3tF) (:text |hsl) (:type :leaf)
                                          |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |6bAnQQr3os1) (:text |0) (:type :leaf)
                                          |r $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |eaFF3dCyaqo) (:text |0) (:type :leaf)
                                          |v $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |EBpCPPuHCIp) (:text |0) (:type :leaf)
                                          |x $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |Vtrh34DNCiP) (:text |0.1) (:type :leaf)
                              |yT $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |KJRugMMpD-7) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |WXkfHh2kWao) (:text |:font-family) (:type :leaf)
                                  |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |fJUXFBewfnN) (:text |ui/font-fancy) (:type :leaf)
                              |yj $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |80UoNGp8gCK) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |L17fXTt-Bb6) (:text |:background-color) (:type :leaf)
                                  |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |0_yH3rmUB8p) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |3ICCRT2m2AC) (:text |:theme) (:type :leaf)
                                      |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |vqnTwRm0qe0) (:text |config/site) (:type :leaf)
                              |yr $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |ip8XtD4O8Vh) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |mq79woP4Q5Z) (:text |:color) (:type :leaf)
                                  |j $ {} (:at 1557246924165) (:by |B1y7Rc-Zz) (:id |xp0dZc76S-4) (:text |:white) (:type :leaf)
          |render-entry $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |8fS0zKcHwE) (:type :expr)
            :data $ {}
              |T $ {} (:at 1557586060387) (:by |B1y7Rc-Zz) (:id |NFdtMAaide) (:text |defn) (:type :leaf)
              |j $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |4Rg8GNTJP_) (:text |render-entry) (:type :leaf)
              |n $ {} (:at 1557585885965) (:by |B1y7Rc-Zz) (:id |2dD1wooF6e) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1557585893737) (:by |B1y7Rc-Zz) (:id |MUzjim7qn) (:text |title) (:type :leaf)
                  |T $ {} (:at 1557586091925) (:by |B1y7Rc-Zz) (:id |YvsHvbRGb) (:text |get-route) (:type :leaf)
                  |j $ {} (:at 1557585988416) (:by |B1y7Rc-Zz) (:id |QFrWxqkUK) (:text |highlighted?) (:type :leaf)
              |r $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |4uYhTQPBxa) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |2zI5vFzFo-) (:text |div) (:type :leaf)
                  |j $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |YChT2EqSj4) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |CmNI5SeaOU) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1658935031986) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935035958) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                          |b $ {} (:at 1658935043889) (:by |B1y7Rc-Zz) (:text |css-entry) (:type :leaf)
                      |j $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |ofdQ__ELDV) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |UjX5XrabEw) (:text |:style) (:type :leaf)
                          |j $ {} (:at 1658935132492) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1658935133455) (:by |B1y7Rc-Zz) (:text |merge) (:type :leaf)
                              |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |KeCZhE1A6d) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |BZ-srIR6aP) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |DByMM9FiOK) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |hneJANbq9B) (:text |:cursor) (:type :leaf)
                                      |j $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |TzcfwORrgx) (:text |:pointer) (:type :leaf)
                              |b $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |highlighted?) (:type :leaf)
                                  |h $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |:opacity) (:type :leaf)
                                          |b $ {} (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |1) (:type :leaf)
                      |r $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |9jySNTyr1D) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |oFvwHA1VQL3) (:text |:on-click) (:type :leaf)
                          |j $ {} (:at 1584879549754) (:by |B1y7Rc-Zz) (:id |hr-I2jT48C) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1584879550849) (:by |B1y7Rc-Zz) (:id |9fmnrzQ7z-) (:text |fn) (:type :leaf)
                              |L $ {} (:at 1584879551609) (:by |B1y7Rc-Zz) (:id |sdmpZsaWH) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584879552360) (:by |B1y7Rc-Zz) (:id |QPpaAaBM_Q) (:text |e) (:type :leaf)
                                  |j $ {} (:at 1584879552989) (:by |B1y7Rc-Zz) (:id |TAIhVZYBd9) (:text |d!) (:type :leaf)
                              |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |ZJPExylORno) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584879549354) (:by |B1y7Rc-Zz) (:id |RCTFeXD49z0) (:text |d!) (:type :leaf)
                                  |j $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |HrMPezLKPrG) (:text |:router/change) (:type :leaf)
                                  |r $ {} (:at 1557586097956) (:by |B1y7Rc-Zz) (:id |DVQfz8BoX-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557586097558) (:by |B1y7Rc-Zz) (:id |GaFX4EHDI) (:text |get-route) (:type :leaf)
                      |v $ {} (:at 1643082707417) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1643082710122) (:by |B1y7Rc-Zz) (:text |:tab-index) (:type :leaf)
                          |j $ {} (:at 1643082710392) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                  |r $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |IPug7oYgcIn) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1557585882232) (:by |B1y7Rc-Zz) (:id |IShw7p13Uj-) (:text |<>) (:type :leaf)
                      |j $ {} (:at 1557585942324) (:by |B1y7Rc-Zz) (:id |8zYnY9SHojg) (:text |title) (:type :leaf)
                      |n $ {} (:at 1658935137220) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
        :ns $ {} (:at 1500541010211) (:by nil) (:id |BkUXGcUegABW) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541010211) (:by |root) (:id |S1DXG98elCSb) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541010211) (:by |root) (:id |HkO7fcLel0SZ) (:text |app.comp.navigation) (:type :leaf)
            |v $ {} (:at 1500541010211) (:by nil) (:id |S1HVf5UxlRHZ) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541010211) (:by |root) (:id |HJLNzq8glABb) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541010211) (:by nil) (:id |BywNMcUleAHb) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1629963365303) (:by |B1y7Rc-Zz) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |BkcEM9IgxCSZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |HJsNzqLleASW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |SkTNfcLeeRBb) (:text |hsl) (:type :leaf)
                |r $ {} (:at 1500541010211) (:by nil) (:id |HkCNz98el0Bb) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1516547394445) (:by |root) (:id |HkeBG5Lgl0SW) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |rkWrzqIxx0B-) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |S1GrG5LegAHZ) (:text |ui) (:type :leaf)
                |t $ {} (:at 1657790576833) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790579417) (:by |B1y7Rc-Zz) (:text |respo.css) (:type :leaf)
                    |b $ {} (:at 1657790581342) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1657790581543) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1657790583492) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
                |u $ {} (:at 1657790584607) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790589143) (:by |B1y7Rc-Zz) (:text |respo-ui.css) (:type :leaf)
                    |b $ {} (:at 1657790593353) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1657790594244) (:by |B1y7Rc-Zz) (:text |css) (:type :leaf)
                |w $ {} (:at 1523120376505) (:by |root) (:id |BkxlWtdUjM) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1523120379036) (:by |root) (:id |Sk--WFuIoG) (:text |respo.comp.space) (:type :leaf)
                    |r $ {} (:at 1523120382218) (:by |root) (:id |By4XbFu8oG) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1523120382545) (:by |root) (:id |r1DWtdUjM) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1523120383255) (:by |root) (:id |BkGPZKu8oM) (:text |=<) (:type :leaf)
                |x $ {} (:at 1500541010211) (:by nil) (:id |SkVQg5h1z) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1542907380517) (:by |B1y7Rc-Zz) (:id |HJp7zc8xxArZ) (:text |respo.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |S1AmGcLexRH-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |SyJNG5IexArb) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |BkbEz9LegRr-) (:text |defcomp) (:type :leaf)
                        |r $ {} (:at 1500541010211) (:by |root) (:id |BJM4fcLlxCrb) (:text |<>) (:type :leaf)
                        |t $ {} (:at 1584879019575) (:by |B1y7Rc-Zz) (:id |jQzlDVH_R) (:text |>>) (:type :leaf)
                        |v $ {} (:at 1500541010211) (:by |root) (:id |SyQ4McIex0HZ) (:text |span) (:type :leaf)
                        |x $ {} (:at 1500541010211) (:by |root) (:id |HkNEM9Lee0HZ) (:text |div) (:type :leaf)
                |y $ {} (:at 1536860674775) (:by |root) (:id |sd197CFAUl) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1536860674775) (:by |root) (:id |KHeI882KsR) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1536860674775) (:by |root) (:id |PIbF-a_ipe) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1536860674775) (:by |root) (:id |KTf8qeft93) (:text |config) (:type :leaf)
                |yj $ {} (:at 1536861056679) (:by |root) (:id |SJOhXEVL1) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1584878788249) (:by |B1y7Rc-Zz) (:id |-L09Mo6C7B) (:text |respo-alerts.core) (:type :leaf)
                    |r $ {} (:at 1536861065872) (:by |root) (:id |ci9RasPZMC) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1536861066155) (:by |root) (:id |LLF19Vc6J-) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1536861125556) (:by |root) (:id |Tnw7opQFJi) (:text |comp-prompt) (:type :leaf)
                |yr $ {} (:at 1556645494859) (:by |B1y7Rc-Zz) (:id |BP5FDUbN3H) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1556645496530) (:by |B1y7Rc-Zz) (:id |7VPylF3iOx) (:text "|\"dayjs") (:type :leaf)
                    |r $ {} (:at 1629963368190) (:by |B1y7Rc-Zz) (:id |oj8W6Xzlqi) (:text |:default) (:type :leaf)
                    |v $ {} (:at 1556645498794) (:by |B1y7Rc-Zz) (:id |x80TakCZXX) (:text |dayjs) (:type :leaf)
        :proc $ {} (:at 1500541010211) (:by nil) (:id |SJ1Uz9LeeAB-) (:type :expr)
          :data $ {}
      |app.comp.notes-page $ {}
        :defs $ {}
          |comp-note $ {} (:at 1556647303657) (:by |B1y7Rc-Zz) (:id |x9LD_QIUsA) (:type :expr)
            :data $ {}
              |T $ {} (:at 1556647305914) (:by |B1y7Rc-Zz) (:id |rM9S8vTAjB) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1556647303657) (:by |B1y7Rc-Zz) (:id |S8lhPBTTu4) (:text |comp-note) (:type :leaf)
              |r $ {} (:at 1556647303657) (:by |B1y7Rc-Zz) (:id |PY7OdbElLY) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1556648060198) (:by |B1y7Rc-Zz) (:id |k_GRVpWQB8) (:text |states) (:type :leaf)
                  |T $ {} (:at 1556647307853) (:by |B1y7Rc-Zz) (:id |HeEpYWV48) (:text |note) (:type :leaf)
              |v $ {} (:at 1629964535103) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1629964535723) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |L $ {} (:at 1629964535966) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964536107) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964539465) (:by |B1y7Rc-Zz) (:text |edit-plugin) (:type :leaf)
                          |j $ {} (:at 1629964540357) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964543238) (:by |B1y7Rc-Zz) (:text |use-prompt) (:type :leaf)
                              |j $ {} (:at 1629964545934) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964546481) (:by |B1y7Rc-Zz) (:text |>>) (:type :leaf)
                                  |j $ {} (:at 1629964731062) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                                  |r $ {} (:at 1629964548467) (:by |B1y7Rc-Zz) (:text |:edit) (:type :leaf)
                              |r $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text "|\"Update note:") (:type :leaf)
                                  |r $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:multiline?) (:type :leaf)
                                      |j $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |true) (:type :leaf)
                                  |v $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:initial) (:type :leaf)
                                      |j $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                          |j $ {} (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |note) (:type :leaf)
                      |j $ {} (:at 1629964550192) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964554122) (:by |B1y7Rc-Zz) (:text |remove-plugin) (:type :leaf)
                          |j $ {} (:at 1629964554861) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964558438) (:by |B1y7Rc-Zz) (:text |use-confirm) (:type :leaf)
                              |j $ {} (:at 1629964559147) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964559495) (:by |B1y7Rc-Zz) (:text |>>) (:type :leaf)
                                  |j $ {} (:at 1629964733328) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                                  |r $ {} (:at 1629964562754) (:by |B1y7Rc-Zz) (:text |:remove) (:type :leaf)
                              |r $ {} (:at 1629964725324) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964725324) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1629964725324) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964725324) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1629964725324) (:by |B1y7Rc-Zz) (:text "|\"Sure to delete note?") (:type :leaf)
                  |T $ {} (:at 1556647308232) (:by |B1y7Rc-Zz) (:id |RgA6M-l8d0) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556647309910) (:by |B1y7Rc-Zz) (:id |RgA6M-l8d0leaf) (:text |div) (:type :leaf)
                      |j $ {} (:at 1556647310151) (:by |B1y7Rc-Zz) (:id |3riQllh7OC) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647310499) (:by |B1y7Rc-Zz) (:id |X2TFXHnTSx) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657790959558) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790962178) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                              |b $ {} (:at 1658935559130) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1658935560837) (:by |B1y7Rc-Zz) (:text |str-spaced) (:type :leaf)
                                  |T $ {} (:at 1657790966773) (:by |B1y7Rc-Zz) (:text |css/column) (:type :leaf)
                                  |b $ {} (:at 1658935563780) (:by |B1y7Rc-Zz) (:text |css-note) (:type :leaf)
                          |j $ {} (:at 1556647326488) (:by |B1y7Rc-Zz) (:id |AVVKyPd_lb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647330802) (:by |B1y7Rc-Zz) (:id |qkNIKVPOA) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1556647798787) (:by |B1y7Rc-Zz) (:id |XcZaNtKFs) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647799092) (:by |B1y7Rc-Zz) (:id |bVRjKZTLQz) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1556647799421) (:by |B1y7Rc-Zz) (:id |SZ5MZQ9cmN) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557585573916) (:by |B1y7Rc-Zz) (:id |0IYUnMEqMr) (:text |:border-top) (:type :leaf)
                                      |j $ {} (:at 1556647801979) (:by |B1y7Rc-Zz) (:id |0493bKxWz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556647802559) (:by |B1y7Rc-Zz) (:id |5E7kufTtxQ) (:text |str) (:type :leaf)
                                          |j $ {} (:at 1556647806396) (:by |B1y7Rc-Zz) (:id |1CqDRzWixl) (:text "|\"1px solid ") (:type :leaf)
                                          |r $ {} (:at 1556647807123) (:by |B1y7Rc-Zz) (:id |3zaAdXvxTl) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556647807619) (:by |B1y7Rc-Zz) (:id |NgB5rL9nj) (:text |hsl) (:type :leaf)
                                              |j $ {} (:at 1556647807958) (:by |B1y7Rc-Zz) (:id |W46iukSRza) (:text |0) (:type :leaf)
                                              |r $ {} (:at 1556647808204) (:by |B1y7Rc-Zz) (:id |s-xOu4QsSt) (:text |0) (:type :leaf)
                                              |v $ {} (:at 1557585638537) (:by |B1y7Rc-Zz) (:id |308KUHMb-1) (:text |94) (:type :leaf)
                                  |r $ {} (:at 1556647825505) (:by |B1y7Rc-Zz) (:id |QRCSsdwIt0) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556647828525) (:by |B1y7Rc-Zz) (:id |QRCSsdwIt0leaf) (:text |:padding) (:type :leaf)
                                      |j $ {} (:at 1556647849827) (:by |B1y7Rc-Zz) (:id |D8vRYPGf-l) (:text "|\"4px 8px") (:type :leaf)
                      |r $ {} (:at 1556647334568) (:by |B1y7Rc-Zz) (:id |9tv0d6u20) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1556647335236) (:by |B1y7Rc-Zz) (:id |5aKQ_ILlvy) (:text |div) (:type :leaf)
                          |L $ {} (:at 1556647335464) (:by |B1y7Rc-Zz) (:id |-ZOrlaCp91) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647335772) (:by |B1y7Rc-Zz) (:id |hiMrnXqFqC) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1556647336468) (:by |B1y7Rc-Zz) (:id |dfen-tVn7T) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790973781) (:by |B1y7Rc-Zz) (:id |ZdMzZd5iuG) (:text |:class-name) (:type :leaf)
                                  |j $ {} (:at 1657790975496) (:by |B1y7Rc-Zz) (:id |hlyRHUOXD4) (:text |css/row-parted) (:type :leaf)
                          |P $ {} (:at 1556647342578) (:by |B1y7Rc-Zz) (:id |qGpn1MjHt) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647344825) (:by |B1y7Rc-Zz) (:id |qGpn1MjHtleaf) (:text |<>) (:type :leaf)
                              |j $ {} (:at 1556647570399) (:by |B1y7Rc-Zz) (:id |zKtS-VS2xB) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1556647571117) (:by |B1y7Rc-Zz) (:id |u0_5RpUVs) (:text |->) (:type :leaf)
                                  |T $ {} (:at 1556647345363) (:by |B1y7Rc-Zz) (:id |VdhVchIxqi) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556647347172) (:by |B1y7Rc-Zz) (:id |wH7aOIv6-B) (:text |:time) (:type :leaf)
                                      |j $ {} (:at 1556647347733) (:by |B1y7Rc-Zz) (:id |LA85by2eay) (:text |note) (:type :leaf)
                                  |j $ {} (:at 1556647573604) (:by |B1y7Rc-Zz) (:id |oExjHDmDWP) (:text |dayjs) (:type :leaf)
                                  |r $ {} (:at 1556647573971) (:by |B1y7Rc-Zz) (:id |Eu6K2z5X-T) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556647576673) (:by |B1y7Rc-Zz) (:id |eT28gGLOWt) (:text |.format) (:type :leaf)
                                      |j $ {} (:at 1557585523361) (:by |B1y7Rc-Zz) (:id |Jhhq-IqhCH) (:text "|\"HH:mm") (:type :leaf)
                              |r $ {} (:at 1556647638577) (:by |B1y7Rc-Zz) (:id |mmGrS3Hhk) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647640276) (:by |B1y7Rc-Zz) (:id |mmGrS3Hhkleaf) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1556647640556) (:by |B1y7Rc-Zz) (:id |0lznjgdS-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556647642435) (:by |B1y7Rc-Zz) (:id |MsNnrugmdJ) (:text |:font-family) (:type :leaf)
                                      |j $ {} (:at 1556647645296) (:by |B1y7Rc-Zz) (:id |7S-bdaxu-) (:text |ui/font-fancy) (:type :leaf)
                                  |r $ {} (:at 1557246102139) (:by |B1y7Rc-Zz) (:id |9qvgT3tcmk) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557246103076) (:by |B1y7Rc-Zz) (:id |9qvgT3tcmkleaf) (:text |:color) (:type :leaf)
                                      |j $ {} (:at 1557246103379) (:by |B1y7Rc-Zz) (:id |6FAN3LyarN) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557246103691) (:by |B1y7Rc-Zz) (:id |Z-DRNugl2B) (:text |hsl) (:type :leaf)
                                          |j $ {} (:at 1557246104022) (:by |B1y7Rc-Zz) (:id |evwY9H9p1K) (:text |0) (:type :leaf)
                                          |r $ {} (:at 1557246104251) (:by |B1y7Rc-Zz) (:id |03VXdPnVHQ) (:text |0) (:type :leaf)
                                          |v $ {} (:at 1557585535667) (:by |B1y7Rc-Zz) (:id |gPwrObgn2) (:text |70) (:type :leaf)
                                  |v $ {} (:at 1557586373775) (:by |B1y7Rc-Zz) (:id |fFqxOz_Qs) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557586376054) (:by |B1y7Rc-Zz) (:id |fFqxOz_Qsleaf) (:text |:font-size) (:type :leaf)
                                      |j $ {} (:at 1557586376703) (:by |B1y7Rc-Zz) (:id |t8OCyE9KXl) (:text |12) (:type :leaf)
                          |R $ {} (:at 1556647350064) (:by |B1y7Rc-Zz) (:id |4LBj-M4j_) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647350527) (:by |B1y7Rc-Zz) (:id |4LBj-M4j_leaf) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1556647351230) (:by |B1y7Rc-Zz) (:id |EqUhmHHRB9) (:text |8) (:type :leaf)
                              |r $ {} (:at 1556647351768) (:by |B1y7Rc-Zz) (:id |LCdGaRrGs7) (:text |nil) (:type :leaf)
                          |i $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |2pEqq1lVk1) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |9equgws5UZ) (:text |div) (:type :leaf)
                              |j $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |dhvWvGeGcZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |sn8eU5pbaI) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |ANmEgVCc-n) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657790981407) (:by |B1y7Rc-Zz) (:id |tmxCeY6jv9) (:text |:class-name) (:type :leaf)
                                      |j $ {} (:at 1657790983216) (:by |B1y7Rc-Zz) (:id |vXFSdQN_Tb) (:text |css/row-middle) (:type :leaf)
                              |n $ {} (:at 1629964596728) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964599746) (:by |B1y7Rc-Zz) (:text |comp-icon) (:type :leaf)
                                  |j $ {} (:at 1629964596728) (:by |B1y7Rc-Zz) (:text |:edit) (:type :leaf)
                                  |r $ {} (:at 1629964600687) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1629964602916) (:by |B1y7Rc-Zz) (:text |&{}) (:type :leaf)
                                      |L $ {} (:at 1629964606751) (:by |B1y7Rc-Zz) (:text |:font-size) (:type :leaf)
                                      |T $ {} (:at 1629964596728) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                                      |j $ {} (:at 1629964608669) (:by |B1y7Rc-Zz) (:text |:curspr) (:type :leaf)
                                      |r $ {} (:at 1629964610014) (:by |B1y7Rc-Zz) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1629964612056) (:by |B1y7Rc-Zz) (:text |:color) (:type :leaf)
                                      |x $ {} (:at 1629964613875) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                          |j $ {} (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |200) (:type :leaf)
                                          |r $ {} (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                  |v $ {} (:at 1629964615469) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964616059) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                      |j $ {} (:at 1629964616313) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964617187) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                          |j $ {} (:at 1629964618220) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                      |r $ {} (:at 1629964619117) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964629538) (:by |B1y7Rc-Zz) (:text |.show) (:type :leaf)
                                          |j $ {} (:at 1629966539308) (:by |B1y7Rc-Zz) (:text |edit-plugin) (:type :leaf)
                                          |r $ {} (:at 1629964636703) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                          |v $ {} (:at 1629964637339) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964637646) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1629964639717) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964639455) (:by |B1y7Rc-Zz) (:text |result) (:type :leaf)
                                              |r $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                                  |j $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:note/edit) (:type :leaf)
                                                  |r $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                                      |j $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                                          |j $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                                              |j $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |note) (:type :leaf)
                                                      |r $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                                          |j $ {} (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |result) (:type :leaf)
                              |v $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |0VOKKsbefMr) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |sVbNPVVefWJ) (:text |=<) (:type :leaf)
                                  |j $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |KVlRuc1zKuC) (:text |8) (:type :leaf)
                                  |r $ {} (:at 1556647767453) (:by |B1y7Rc-Zz) (:id |mNFthhFmIwn) (:text |nil) (:type :leaf)
                              |w $ {} (:at 1629964674759) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964678148) (:by |B1y7Rc-Zz) (:text |comp-icon) (:type :leaf)
                                  |j $ {} (:at 1629964674759) (:by |B1y7Rc-Zz) (:text |:delete) (:type :leaf)
                                  |r $ {} (:at 1629964679937) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1629964682752) (:by |B1y7Rc-Zz) (:text |&{}) (:type :leaf)
                                      |L $ {} (:at 1629964685870) (:by |B1y7Rc-Zz) (:text |:font-size) (:type :leaf)
                                      |T $ {} (:at 1629964674759) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                                      |j $ {} (:at 1629964688251) (:by |B1y7Rc-Zz) (:text |:cursor) (:type :leaf)
                                      |r $ {} (:at 1629964689345) (:by |B1y7Rc-Zz) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1629964692387) (:by |B1y7Rc-Zz) (:text |:color) (:type :leaf)
                                      |x $ {} (:at 1629964694145) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                          |j $ {} (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |10) (:type :leaf)
                                          |r $ {} (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |60) (:type :leaf)
                                  |v $ {} (:at 1629964695913) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964696526) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                      |j $ {} (:at 1629964696783) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964697191) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                          |j $ {} (:at 1629964697805) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                      |r $ {} (:at 1629964698334) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964700365) (:by |B1y7Rc-Zz) (:text |.show) (:type :leaf)
                                          |j $ {} (:at 1629966541201) (:by |B1y7Rc-Zz) (:text |remove-plugin) (:type :leaf)
                                          |r $ {} (:at 1629964705715) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                          |v $ {} (:at 1629964706336) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964706737) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1629964708032) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                              |r $ {} (:at 1629964711836) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                                  |j $ {} (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |:note/remove) (:type :leaf)
                                                  |r $ {} (:at 1629964711836) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                                      |j $ {} (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |note) (:type :leaf)
                      |t $ {} (:at 1556647762827) (:by |B1y7Rc-Zz) (:id |bHyX7nwm5p) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647762827) (:by |B1y7Rc-Zz) (:id |T9Hl8fvV-0) (:text |<>) (:type :leaf)
                          |j $ {} (:at 1556647762827) (:by |B1y7Rc-Zz) (:id |AMYpLklFhk) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647762827) (:by |B1y7Rc-Zz) (:id |I3_6LFs96P) (:text |:text) (:type :leaf)
                              |j $ {} (:at 1556647762827) (:by |B1y7Rc-Zz) (:id |o4giAUyS2g) (:text |note) (:type :leaf)
                      |w $ {} (:at 1629964569519) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964570430) (:by |B1y7Rc-Zz) (:text |.render) (:type :leaf)
                          |j $ {} (:at 1629964573670) (:by |B1y7Rc-Zz) (:text |edit-plugin) (:type :leaf)
                      |x $ {} (:at 1629964577613) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964578624) (:by |B1y7Rc-Zz) (:text |.render) (:type :leaf)
                          |j $ {} (:at 1629964583147) (:by |B1y7Rc-Zz) (:text |remove-plugin) (:type :leaf)
          |comp-notes-page $ {} (:at 1500541010211) (:by nil) (:id |HJHJG58xgASW) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |SyIkf9Uxx0Bb) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |B1vkzqLgl0H-) (:text |comp-notes-page) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |rkOyMqUexRSW) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1556646849807) (:by |B1y7Rc-Zz) (:id |guVF25Tjhs) (:text |states) (:type :leaf)
                  |T $ {} (:at 1556645576221) (:by |B1y7Rc-Zz) (:id |-wZUHM60P) (:text |notes) (:type :leaf)
                  |j $ {} (:at 1556645578023) (:by |B1y7Rc-Zz) (:id |Qob6AxCTE) (:text |info) (:type :leaf)
              |v $ {} (:at 1556645581053) (:by |B1y7Rc-Zz) (:id |MG_5L5V1K-) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1556645581721) (:by |B1y7Rc-Zz) (:id |gkMiLDWByl) (:text |let) (:type :leaf)
                  |L $ {} (:at 1556645582104) (:by |B1y7Rc-Zz) (:id |-q_eeg10VJ) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1556645588396) (:by |B1y7Rc-Zz) (:id |tI3R19Kb-F) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556645592043) (:by |B1y7Rc-Zz) (:id |tI3R19Kb-Fleaf) (:text |year) (:type :leaf)
                          |j $ {} (:at 1556645592292) (:by |B1y7Rc-Zz) (:id |FT7GkfFPne) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556645597062) (:by |B1y7Rc-Zz) (:id |a87R0l_vN9) (:text |:year) (:type :leaf)
                              |j $ {} (:at 1556645595757) (:by |B1y7Rc-Zz) (:id |ZMw61q9hr7) (:text |info) (:type :leaf)
                      |T $ {} (:at 1556645582251) (:by |B1y7Rc-Zz) (:id |vfu9TqlKUL) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1591602568367) (:by |B1y7Rc-Zz) (:id |BsE2fXR9An) (:text |month) (:type :leaf)
                          |j $ {} (:at 1556645584827) (:by |B1y7Rc-Zz) (:id |0b1rsiy9f) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1591602570391) (:by |B1y7Rc-Zz) (:id |d0ODs9d5L9) (:text |:month) (:type :leaf)
                              |j $ {} (:at 1556645587266) (:by |B1y7Rc-Zz) (:id |tHA0Ik-vaL) (:text |info) (:type :leaf)
                      |j $ {} (:at 1629964426329) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964431136) (:by |B1y7Rc-Zz) (:text |add-plugin) (:type :leaf)
                          |j $ {} (:at 1629964431991) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964438940) (:by |B1y7Rc-Zz) (:text |use-prompt) (:type :leaf)
                              |j $ {} (:at 1629964439477) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964439966) (:by |B1y7Rc-Zz) (:text |>>) (:type :leaf)
                                  |j $ {} (:at 1629964441489) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                                  |r $ {} (:at 1629964442311) (:by |B1y7Rc-Zz) (:text |:add) (:type :leaf)
                              |r $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                  |r $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:text "|\"Add note about today's work:") (:type :leaf)
                                  |v $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |:multiline?) (:type :leaf)
                                      |j $ {} (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |true) (:type :leaf)
                  |T $ {} (:at 1500541010211) (:by nil) (:id |r19kz5Uxx0B-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |HyskGcUlxRSb) (:text |div) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by nil) (:id |HJn1fqUgxABb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |Skpkzc8xgAH-) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657790843697) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790846148) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                              |b $ {} (:at 1657790848179) (:by |B1y7Rc-Zz) (:text |css/expand) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |Bk0yG5IleRHb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |SkJeG5UxlASW) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1519314674864) (:by |root) (:id |BklixPv3Pz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1519314675207) (:by |root) (:id |S1jxDD2vf) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1519314675496) (:by |root) (:id |HyVigvwnPG) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1519314677667) (:by |root) (:id |SymslwPhwG) (:text |:padding) (:type :leaf)
                                      |j $ {} (:at 1557245673542) (:by |B1y7Rc-Zz) (:id |HybAgPP2Pf) (:text |16) (:type :leaf)
                      |r $ {} (:at 1572973363171) (:by |B1y7Rc-Zz) (:id |8dLXK6zkB) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1572973364716) (:by |B1y7Rc-Zz) (:id |dbQUuFg1vl) (:text |div) (:type :leaf)
                          |L $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |j6Y_mKSVvZ) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |FXnAdUYVZq) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |_yOVD7mGW_) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |92ipUtbiX0) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |hv0wn4OWTF) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |UFhw4xA7pj) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |Jiioxo71OL) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |RZK12QtwHx) (:text |:max-width) (:type :leaf)
                                          |j $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |w55rFzJSmB) (:text |800) (:type :leaf)
                                      |r $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |5iVzcH3KWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |JOYBso16y2) (:text |:margin) (:type :leaf)
                                          |j $ {} (:at 1572973369798) (:by |B1y7Rc-Zz) (:id |26bNMK2m7d) (:text |:auto) (:type :leaf)
                          |T $ {} (:at 1556645615572) (:by |B1y7Rc-Zz) (:id |Oi29viE62) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1556645616321) (:by |B1y7Rc-Zz) (:id |uVeOJ7thfH) (:text |div) (:type :leaf)
                              |L $ {} (:at 1556645616560) (:by |B1y7Rc-Zz) (:id |BdM20KSz4) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556645617518) (:by |B1y7Rc-Zz) (:id |FdWobz-REH) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1657790885957) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657790888678) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                      |b $ {} (:at 1657790893229) (:by |B1y7Rc-Zz) (:text |css/row-parted) (:type :leaf)
                                  |j $ {} (:at 1556645618041) (:by |B1y7Rc-Zz) (:id |ijoAZIzo7I) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556645618842) (:by |B1y7Rc-Zz) (:id |UTXhXI5n0G) (:text |:style) (:type :leaf)
                                      |j $ {} (:at 1557245647003) (:by |B1y7Rc-Zz) (:id |VbfJpySZOc) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245647357) (:by |B1y7Rc-Zz) (:id |ChZZJMvGGf) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1557245647645) (:by |B1y7Rc-Zz) (:id |xRTrmMHhh) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245650544) (:by |B1y7Rc-Zz) (:id |-mnx0J25Fl) (:text |:margin) (:type :leaf)
                                              |j $ {} (:at 1557245655629) (:by |B1y7Rc-Zz) (:id |z1u_LoyF6s) (:text "|\"8px 0") (:type :leaf)
                              |P $ {} (:at 1557245696635) (:by |B1y7Rc-Zz) (:id |ZVUb9IZDq) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1557245698839) (:by |B1y7Rc-Zz) (:id |jUaXmkv8Vp) (:text |span) (:type :leaf)
                                  |L $ {} (:at 1557245699148) (:by |B1y7Rc-Zz) (:id |eiqkwlfTKS) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245699506) (:by |B1y7Rc-Zz) (:id |FF9J5IfbUL) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1557245751978) (:by |B1y7Rc-Zz) (:id |XNUVJB6qf-) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1657790881583) (:by |B1y7Rc-Zz) (:id |5xyngyMxVf) (:text |:class-name) (:type :leaf)
                                          |j $ {} (:at 1657790883425) (:by |B1y7Rc-Zz) (:id |TqioF0a99) (:text |css/row-middle) (:type :leaf)
                                  |P $ {} (:at 1557245701563) (:by |B1y7Rc-Zz) (:id |VGovJCTZW) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245702134) (:by |B1y7Rc-Zz) (:id |VGovJCTZWleaf) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1557245704618) (:by |B1y7Rc-Zz) (:id |podJZvvTiv) (:text "|\"Notes") (:type :leaf)
                                      |r $ {} (:at 1557245705607) (:by |B1y7Rc-Zz) (:id |_K93p3El8) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245705939) (:by |B1y7Rc-Zz) (:id |HiDKzUaBpq) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1557245706446) (:by |B1y7Rc-Zz) (:id |vw_goTEniQ) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245707301) (:by |B1y7Rc-Zz) (:id |bK-Kn44cS8) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1557245707569) (:by |B1y7Rc-Zz) (:id |gXbFbiAt8) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245707888) (:by |B1y7Rc-Zz) (:id |ejSx0kmYn2) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1557245711097) (:by |B1y7Rc-Zz) (:id |QCoVH-FGMi) (:text |0) (:type :leaf)
                                                  |r $ {} (:at 1557245711348) (:by |B1y7Rc-Zz) (:id |G9gyeBXVED) (:text |0) (:type :leaf)
                                                  |v $ {} (:at 1557245712790) (:by |B1y7Rc-Zz) (:id |CZSgSLFUFl) (:text |50) (:type :leaf)
                                          |r $ {} (:at 1557245713590) (:by |B1y7Rc-Zz) (:id |XrGbBeeFb) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245715661) (:by |B1y7Rc-Zz) (:id |XrGbBeeFbleaf) (:text |:font-family) (:type :leaf)
                                              |j $ {} (:at 1557245718092) (:by |B1y7Rc-Zz) (:id |YwJid71ian) (:text |ui/font-fancy) (:type :leaf)
                                          |v $ {} (:at 1557245723303) (:by |B1y7Rc-Zz) (:id |S_sKDHM3Jw) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245725312) (:by |B1y7Rc-Zz) (:id |S_sKDHM3Jwleaf) (:text |:font-size) (:type :leaf)
                                              |j $ {} (:at 1557245726136) (:by |B1y7Rc-Zz) (:id |LeV2aed4ZN) (:text |16) (:type :leaf)
                                  |R $ {} (:at 1557245760019) (:by |B1y7Rc-Zz) (:id |GDgkEQX8g5) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245761969) (:by |B1y7Rc-Zz) (:id |GDgkEQX8g5leaf) (:text |=<) (:type :leaf)
                                      |j $ {} (:at 1557245763469) (:by |B1y7Rc-Zz) (:id |9brBpOO1qs) (:text |16) (:type :leaf)
                                      |r $ {} (:at 1557245764103) (:by |B1y7Rc-Zz) (:id |0I5HaeZ6F) (:text |nil) (:type :leaf)
                                  |S $ {} (:at 1629964467245) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964469634) (:by |B1y7Rc-Zz) (:text |comp-icon) (:type :leaf)
                                      |j $ {} (:at 1629964467245) (:by |B1y7Rc-Zz) (:text |:plus) (:type :leaf)
                                      |r $ {} (:at 1629964474541) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1629964476740) (:by |B1y7Rc-Zz) (:text |&{}) (:type :leaf)
                                          |L $ {} (:at 1629964480252) (:by |B1y7Rc-Zz) (:text |:font-size) (:type :leaf)
                                          |T $ {} (:at 1629964467245) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                                          |j $ {} (:at 1629964482822) (:by |B1y7Rc-Zz) (:text |:color) (:type :leaf)
                                          |r $ {} (:at 1629964485258) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                              |j $ {} (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |200) (:type :leaf)
                                              |r $ {} (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                              |v $ {} (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1629964487409) (:by |B1y7Rc-Zz) (:text |:cursor) (:type :leaf)
                                          |x $ {} (:at 1629964488605) (:by |B1y7Rc-Zz) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1629964490410) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964490936) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1629964491235) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964491563) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1629964492875) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                          |r $ {} (:at 1629964493932) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964495324) (:by |B1y7Rc-Zz) (:text |.show) (:type :leaf)
                                              |j $ {} (:at 1629964497381) (:by |B1y7Rc-Zz) (:text |add-plugin) (:type :leaf)
                                              |r $ {} (:at 1629964498948) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                              |v $ {} (:at 1629964499454) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964499735) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                                  |b $ {} (:at 1629964519502) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629964526070) (:by |B1y7Rc-Zz) (:text |result) (:type :leaf)
                                                  |j $ {} (:at 1629964507794) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629964507794) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                                      |j $ {} (:at 1629964507794) (:by |B1y7Rc-Zz) (:text |:note/add) (:type :leaf)
                                                      |r $ {} (:at 1629964507794) (:by |B1y7Rc-Zz) (:text |result) (:type :leaf)
                              |T $ {} (:at 1556648417657) (:by |B1y7Rc-Zz) (:id |t0OuwQNx8) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1556648418437) (:by |B1y7Rc-Zz) (:id |Rr3A8ja517) (:text |div) (:type :leaf)
                                  |L $ {} (:at 1556648418665) (:by |B1y7Rc-Zz) (:id |5evnk_LL8) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556648419059) (:by |B1y7Rc-Zz) (:id |2ZJd56LQE2) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1556648420324) (:by |B1y7Rc-Zz) (:id |jKkfvaCG3P) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1657790922275) (:by |B1y7Rc-Zz) (:id |79KAmIm8L) (:text |:class-name) (:type :leaf)
                                          |j $ {} (:at 1657790923970) (:by |B1y7Rc-Zz) (:id |Kt_8u6KY3u) (:text |css/row-middle) (:type :leaf)
                                  |n $ {} (:at 1556648449500) (:by |B1y7Rc-Zz) (:id |SF3Tt9mwjX) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556648451815) (:by |B1y7Rc-Zz) (:id |SF3Tt9mwjXleaf) (:text |comp-icon) (:type :leaf)
                                      |j $ {} (:at 1556648463973) (:by |B1y7Rc-Zz) (:id |S5Tl4sTFE) (:text |:arrow-left) (:type :leaf)
                                      |r $ {} (:at 1556648469543) (:by |B1y7Rc-Zz) (:id |pTI05N8lC) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556648470626) (:by |B1y7Rc-Zz) (:id |jGErJwH9j) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1556648471018) (:by |B1y7Rc-Zz) (:id |jusIL82-aI) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648472346) (:by |B1y7Rc-Zz) (:id |Hg8vxkUUaQ) (:text |:font-size) (:type :leaf)
                                              |j $ {} (:at 1556648473358) (:by |B1y7Rc-Zz) (:id |Oxa008j_2o) (:text |16) (:type :leaf)
                                          |r $ {} (:at 1556648475636) (:by |B1y7Rc-Zz) (:id |X495P3Ylh) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648477108) (:by |B1y7Rc-Zz) (:id |X495P3Ylhleaf) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1556648477343) (:by |B1y7Rc-Zz) (:id |QNO04tdIcI) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1556648477692) (:by |B1y7Rc-Zz) (:id |stKq0aeQMT) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1556648482150) (:by |B1y7Rc-Zz) (:id |FmDxvrEBvf) (:text |200) (:type :leaf)
                                                  |r $ {} (:at 1556648482543) (:by |B1y7Rc-Zz) (:id |00VodQbR_3) (:text |80) (:type :leaf)
                                                  |v $ {} (:at 1556648482894) (:by |B1y7Rc-Zz) (:id |o2WaqG7u3X) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1556648514402) (:by |B1y7Rc-Zz) (:id |Z2IBmIlwp-) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648516307) (:by |B1y7Rc-Zz) (:id |Z2IBmIlwp-leaf) (:text |:cursor) (:type :leaf)
                                              |j $ {} (:at 1556648518901) (:by |B1y7Rc-Zz) (:id |FNaAbg1reG) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1556648487768) (:by |B1y7Rc-Zz) (:id |ypnXm4cCk) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556648488565) (:by |B1y7Rc-Zz) (:id |ypnXm4cCkleaf) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1556648488869) (:by |B1y7Rc-Zz) (:id |vnJaOtsfjW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648489094) (:by |B1y7Rc-Zz) (:id |A3guzvsAtd) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1556648489587) (:by |B1y7Rc-Zz) (:id |cwEl-mESZq) (:text |d!) (:type :leaf)
                                          |r $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |Gf9M6_MWeb) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |YwaBuJopgy) (:text |d!) (:type :leaf)
                                              |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |TApd31p2ZY) (:text |:router/change) (:type :leaf)
                                              |r $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |uHeRr9CeIE) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |OClMxClJlW) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |QWKsofs7EL) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |g5SLd-jh_h) (:text |:name) (:type :leaf)
                                                      |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |YyiGNfpa3j) (:text |:notes) (:type :leaf)
                                                  |r $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |V-gBZ5zWPH) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |3WqvQWQ5SV) (:text |:data) (:type :leaf)
                                                      |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |e3Lz3zeDPy) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |aKgAAVTZQf) (:text |if) (:type :leaf)
                                                          |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |ve1Yxw1Ndr) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |y-YYH6RG_d) (:text |<=) (:type :leaf)
                                                              |j $ {} (:at 1591602573901) (:by |B1y7Rc-Zz) (:id |Si2F7MVyxFY) (:text |month) (:type :leaf)
                                                              |r $ {} (:at 1591602769171) (:by |B1y7Rc-Zz) (:id |BL3THCWkkMs) (:text |0) (:type :leaf)
                                                          |r $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |ZbTUIJiNXUH) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |6GEFfzP2s5H) (:text |{}) (:type :leaf)
                                                              |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |3e1z1teTwrk) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |i23L5shHEqO) (:text |:year) (:type :leaf)
                                                                  |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |SFK_lfhENKx) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |MIrKBrSVs4P) (:text |dec) (:type :leaf)
                                                                      |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |rKMuzlsTTSa) (:text |year) (:type :leaf)
                                                              |r $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |2qtnMWd87cI) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1591602577681) (:by |B1y7Rc-Zz) (:id |9PgvnB1Hztd) (:text |:month) (:type :leaf)
                                                                  |j $ {} (:at 1591602767520) (:by |B1y7Rc-Zz) (:id |H9dkLjdDblp) (:text |11) (:type :leaf)
                                                          |v $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |cz702M7-4KI) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |7F2Mc0fjp-g) (:text |{}) (:type :leaf)
                                                              |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |Oae4nZmENUf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |AOTrPpbMs7y) (:text |:year) (:type :leaf)
                                                                  |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |o5v5MgKS9rR) (:text |year) (:type :leaf)
                                                              |r $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |5XZ-GnMH1fh) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1591602581848) (:by |B1y7Rc-Zz) (:id |imAhoP3SSr7) (:text |:month) (:type :leaf)
                                                                  |j $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |pBhWuHUACjo) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1556648561044) (:by |B1y7Rc-Zz) (:id |2_PW9swotOS) (:text |dec) (:type :leaf)
                                                                      |j $ {} (:at 1591602584414) (:by |B1y7Rc-Zz) (:id |vGcEbxZ0bXi) (:text |month) (:type :leaf)
                                  |r $ {} (:at 1556648429390) (:by |B1y7Rc-Zz) (:id |Z5MCcIgT4) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556648429996) (:by |B1y7Rc-Zz) (:id |OC0WT2F__xleaf) (:text |=<) (:type :leaf)
                                      |j $ {} (:at 1556648430938) (:by |B1y7Rc-Zz) (:id |HJMilyFSH) (:text |8) (:type :leaf)
                                      |r $ {} (:at 1556648431500) (:by |B1y7Rc-Zz) (:id |JzLhs99dsN) (:text |nil) (:type :leaf)
                                  |v $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |S3T17kfin7) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |Ua5GMsLQrX) (:text |comp-icon) (:type :leaf)
                                      |j $ {} (:at 1556648504959) (:by |B1y7Rc-Zz) (:id |iIJ7akh86j) (:text |:arrow-right) (:type :leaf)
                                      |r $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |YwAn1DQlGJ) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |U-Vn4gcly2) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |dm9bgY3OGX) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |cegFaaztV4) (:text |:font-size) (:type :leaf)
                                              |j $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |mLALo7uzlp) (:text |16) (:type :leaf)
                                          |r $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |6mUxlTewun) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |wU5gHNYofF) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |J3UDz6yomB) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |rdsbOWOLrN) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |K2-QP-hTByN) (:text |200) (:type :leaf)
                                                  |r $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |K-5jdjb2o1L) (:text |80) (:type :leaf)
                                                  |v $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |AjhUfhrVZAd) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1556648521088) (:by |B1y7Rc-Zz) (:id |1zN1PpsAHV) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648521088) (:by |B1y7Rc-Zz) (:id |IS_cgFWz2W) (:text |:cursor) (:type :leaf)
                                              |j $ {} (:at 1556648521088) (:by |B1y7Rc-Zz) (:id |_VSWJOi1ZH) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |9jqA6oDP81Y) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |pmwRdnrS451) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |XgM8Y086ych) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |xmYLqeKErVh) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1556648501502) (:by |B1y7Rc-Zz) (:id |wg-VKKSXNTs) (:text |d!) (:type :leaf)
                                          |v $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |2cMeTtOxGg) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |Blz38x829M) (:text |d!) (:type :leaf)
                                              |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |-G9eMovRRK) (:text |:router/change) (:type :leaf)
                                              |r $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |9L9tCJAbPN) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |GUmRQpl0WP) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |jk0YRMRA6Z) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |VXnNZJY0lB) (:text |:name) (:type :leaf)
                                                      |j $ {} (:at 1556648565143) (:by |B1y7Rc-Zz) (:id |7EbqzPTeM2) (:text |:notes) (:type :leaf)
                                                  |r $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |rPpWSKCZAy) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |0QTGT4yl_f) (:text |:data) (:type :leaf)
                                                      |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |VwpZ9J33m9) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |2p7neFOiDI) (:text |if) (:type :leaf)
                                                          |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |K-AFCRaBN-) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |ukttXUM0ol) (:text |>=) (:type :leaf)
                                                              |j $ {} (:at 1591602587225) (:by |B1y7Rc-Zz) (:id |ubATlSgdgR) (:text |month) (:type :leaf)
                                                              |r $ {} (:at 1591602762402) (:by |B1y7Rc-Zz) (:id |vaX2no6_BlL) (:text |11) (:type :leaf)
                                                          |r $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |fcELBH_YRgw) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |SwqLOdYjgBI) (:text |{}) (:type :leaf)
                                                              |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |9uogTTQv8JQ) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |HQF_pa5uqHs) (:text |:year) (:type :leaf)
                                                                  |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |2iVbbiFGWwW) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |jRorx5fQu5A) (:text |inc) (:type :leaf)
                                                                      |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |bgRMxEFAt0q) (:text |year) (:type :leaf)
                                                              |r $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |nQ7vlh0nYho) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1591602557019) (:by |B1y7Rc-Zz) (:id |sNeqUWWsl7V) (:text |:month) (:type :leaf)
                                                                  |j $ {} (:at 1591602774378) (:by |B1y7Rc-Zz) (:id |Yo6oBAhuGM6) (:text |0) (:type :leaf)
                                                          |v $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |mLG7A7sLy9D) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |WQ23EVoB4j4) (:text |{}) (:type :leaf)
                                                              |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |P3Im-YhpYa6) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |WoDFTyYtjBk) (:text |:year) (:type :leaf)
                                                                  |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |ZEJyTQw1foj) (:text |year) (:type :leaf)
                                                              |r $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |LnBrNjyh7jh) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1591602592613) (:by |B1y7Rc-Zz) (:id |H74m4rfjgZY) (:text |:month) (:type :leaf)
                                                                  |j $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |Z1YJ6pF8PxW) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1556648558975) (:by |B1y7Rc-Zz) (:id |-xYEjQGYCC9) (:text |inc) (:type :leaf)
                                                                      |j $ {} (:at 1591602594975) (:by |B1y7Rc-Zz) (:id |kKEdiSu9IxY) (:text |month) (:type :leaf)
                                  |w $ {} (:at 1557245842813) (:by |B1y7Rc-Zz) (:id |U5ugSLBpz9) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245842813) (:by |B1y7Rc-Zz) (:id |tWlDJBGNmW) (:text |=<) (:type :leaf)
                                      |j $ {} (:at 1557245842813) (:by |B1y7Rc-Zz) (:id |hRdh7sXTv4) (:text |8) (:type :leaf)
                                      |r $ {} (:at 1557245842813) (:by |B1y7Rc-Zz) (:id |V1QXqAhb6N) (:text |nil) (:type :leaf)
                                  |x $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |z93GTUPCw0) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |HwNHRzHt9V) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |4jNnkcxMY5) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964051260) (:by |B1y7Rc-Zz) (:id |80KgD1l6N1) (:text |str) (:type :leaf)
                                          |j $ {} (:at 1629964048613) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964048613) (:by |B1y7Rc-Zz) (:text |inc) (:type :leaf)
                                              |j $ {} (:at 1629964048613) (:by |B1y7Rc-Zz) (:text |month) (:type :leaf)
                                          |l $ {} (:at 1629964058024) (:by |B1y7Rc-Zz) (:text "|\"th month of ") (:type :leaf)
                                          |n $ {} (:at 1629964039567) (:by |B1y7Rc-Zz) (:text |year) (:type :leaf)
                                          |r $ {} (:at 1629964035381) (:by |B1y7Rc-Zz) (:text "|\".") (:type :leaf)
                                      |r $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |Z0uroKz7zf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |dibQZLhWGc) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |wDRO5gaveo) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |5y7ZoEqwXX) (:text |:font-family) (:type :leaf)
                                              |j $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |U-WsWndfJt) (:text |ui/font-fancy) (:type :leaf)
                                          |r $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |ITRnaTnXpT) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |BLFlNUdQt5) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |BFuwJQuO14) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |62ohzRrlRi) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |YNcszPgnmKU) (:text |0) (:type :leaf)
                                                  |r $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |tT5I3IyI9RT) (:text |0) (:type :leaf)
                                                  |v $ {} (:at 1557245838201) (:by |B1y7Rc-Zz) (:id |S6rygkSnG04) (:text |50) (:type :leaf)
                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Nn8iqFn9gp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |kxRsixDgwW) (:text |if) (:type :leaf)
                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |NRUH8FUZcz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |ePPxwe0Kjs) (:text |empty?) (:type :leaf)
                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |K8umCBvOV-) (:text |notes) (:type :leaf)
                              |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |89t373VnbG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |xH8Qkrf2bV) (:text |div) (:type :leaf)
                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |uffJrAnwUu) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |d4JdBQdCLw) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1657790933211) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1657790935527) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                          |b $ {} (:at 1657790938516) (:by |B1y7Rc-Zz) (:text |css/center) (:type :leaf)
                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |DbwB1j3M7L) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |9fizZGcj-8) (:text |:style) (:type :leaf)
                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |D87pQvoPNR) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |mDhvGHx9URC) (:text |{}) (:type :leaf)
                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |ubF2ucPiv86) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |No7_9pU3LuD) (:text |:min-height) (:type :leaf)
                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |QWOdnr71a6u) (:text |120) (:type :leaf)
                                  |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |CAYWSDHOD36) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |htNLqkquUtt) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |quz-IhdJtkN) (:text "|\"No notes") (:type :leaf)
                                      |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Pd_pCjzq2vV) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |HN0rLy0-f_m) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |_jgfRkbvP7M) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |MEH66NKKfua) (:text |:font-family) (:type :leaf)
                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |me-gn35wfjg) (:text |ui/font-fancy) (:type :leaf)
                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |sz5dVRd6FI9) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |sy4Jk7-hgmO) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |WkUc8naUTL4) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |OgbOuDniIQ3) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |R5X8H-iyUOb) (:text |0) (:type :leaf)
                                                  |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |0GB8e_gdXCS) (:text |0) (:type :leaf)
                                                  |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |u3BuBGcmsfr) (:text |80) (:type :leaf)
                              |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |qAXPsVBVl1y) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |d7cpPFKvVKp) (:text |let) (:type :leaf)
                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |T54vsTGMo_p) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |ezqeFRILfwT) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |-SXmk34SuLX) (:text |grouped-notes) (:type :leaf)
                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |nykudJj3kH2) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963786097) (:by |B1y7Rc-Zz) (:id |EkA8CIxlTgD) (:text |->) (:type :leaf)
                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |gOTNqgXbgLU) (:text |notes) (:type :leaf)
                                              |n $ {} (:at 1629966474341) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629966475920) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                              |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |IE3jGHqx7w8) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963790482) (:by |B1y7Rc-Zz) (:id |Tj8to8pxnMF) (:text |.group-by) (:type :leaf)
                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |7sN9ZGKNBNT) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |801PKXb32Ew) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |SC4Cz9qFYfX) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1629963798033) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                                      |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |IR-grAIpxYj) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |O1ON5d5ZYdy) (:text |->) (:type :leaf)
                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |AA7WoUUHZNA) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Ithy1p6dAa0) (:text |:time) (:type :leaf)
                                                              |j $ {} (:at 1629963792659) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1629963793782) (:by |B1y7Rc-Zz) (:id |7BmztWaFZAC) (:text |last) (:type :leaf)
                                                                  |j $ {} (:at 1629963795209) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Z-nCwcDNVsy) (:text |dayjs) (:type :leaf)
                                                          |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |8Dq8Jncbu_a) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |UgU1WIbomet) (:text |.format) (:type :leaf)
                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |GlTIYw3TABO) (:text "|\"MM-DD") (:type :leaf)
                                              |t $ {} (:at 1629966512329) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629966513790) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                              |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |QlrZqnPFa7w) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963799424) (:by |B1y7Rc-Zz) (:id |XfMO8uikBCW) (:text |.sort) (:type :leaf)
                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |B-gl3KsI85V) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |SjpvOZzwhri) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |3w3iumPOvMZ) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |CGuZh7PGg-Z) (:text |x) (:type :leaf)
                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |9oiRcVwIjLX) (:text |y) (:type :leaf)
                                                      |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |SVO_Cc2MJxx) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1629963811681) (:by |B1y7Rc-Zz) (:id |Rqyo0J9opGX) (:text |&compare) (:type :leaf)
                                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |2hthnGyFRmW) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |eVMKeprAXac) (:text |first) (:type :leaf)
                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |kvBgK67lxl2) (:text |y) (:type :leaf)
                                                          |v $ {} (:at 1629963814058) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1629963814058) (:by |B1y7Rc-Zz) (:text |first) (:type :leaf)
                                                              |j $ {} (:at 1629963814058) (:by |B1y7Rc-Zz) (:text |x) (:type :leaf)
                                  |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |G3RXb7_bA9b) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629963929824) (:by |B1y7Rc-Zz) (:id |w0dBGVPsit2) (:text |list->) (:type :leaf)
                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |TitQrRtJMO9) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |CLijfdBHC9F) (:text |{}) (:type :leaf)
                                      |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |o8rE1pWJ57s) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963820182) (:by |B1y7Rc-Zz) (:id |FWgwzV95uPt) (:text |->) (:type :leaf)
                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |8EmS1osobLN) (:text |grouped-notes) (:type :leaf)
                                          |n $ {} (:at 1629963821944) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963827090) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |odwwrsZLLib) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963830502) (:by |B1y7Rc-Zz) (:id |q2qkGyW3D9B) (:text |.map-pair) (:type :leaf)
                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |HOETsy356tf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Wnmk1Pv6-MI) (:text |fn) (:type :leaf)
                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Sg7jRZ8mpri) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |VHy0AK4zz-I) (:text |date) (:type :leaf)
                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |T13Hdh32wrk) (:text |notes-in-day) (:type :leaf)
                                                  |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |uDXcCSM1ulk) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |00EpQl553Ec) (:text |[]) (:type :leaf)
                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |zyGVgy8h8jn) (:text |date) (:type :leaf)
                                                      |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |bOUiTlCaTj8) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |6xI4-ukSc4d) (:text |div) (:type :leaf)
                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |aPVbMu51W7p) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |mQ7Y33ICRtw) (:text |{}) (:type :leaf)
                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |KugblSiluk7) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Dxl3LMA9lPq) (:text |:style) (:type :leaf)
                                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |l-s0QXrfYf6) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |kaUZOaIx--Z) (:text |{}) (:type :leaf)
                                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |xgDn_sMzMjC) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |N59ULKYuaKv) (:text |:margin-top) (:type :leaf)
                                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |hKJttHD4Pmo) (:text |16) (:type :leaf)
                                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |Dz__MGQZZCu) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |2buxpaffCx3) (:text |div) (:type :leaf)
                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |uklla-5Xb7P) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |XlUfTmeBI1b) (:text |{}) (:type :leaf)
                                                                  |b $ {} (:at 1657795173210) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1657795175285) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                                                      |b $ {} (:at 1657795178288) (:by |B1y7Rc-Zz) (:text |css/font-fancy) (:type :leaf)
                                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |yF5Jx_7pVpd) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |SNAyh55k61r) (:text |:style) (:type :leaf)
                                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |H49tJ5s_KJs) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |iFvHJHaks1G) (:text |{}) (:type :leaf)
                                                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |mXauu3SPO_U) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |4AFVvz0WSza) (:text |:font-size) (:type :leaf)
                                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |3R6LR8BDaCu) (:text |14) (:type :leaf)
                                                                          |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |_VoTHB0B7CA) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |FOS8lQJMFEM) (:text |:font-weight) (:type :leaf)
                                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |s4ZzLAg1f7k) (:text |500) (:type :leaf)
                                                              |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |r5FaLHqtu4M) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |76VJlO5cFAO) (:text |<>) (:type :leaf)
                                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |NcKAn0KELY5) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |x-D_jOZq-7d) (:text |->) (:type :leaf)
                                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |9YGW89hTtGy) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |3n-jmGcnmyH) (:text |str) (:type :leaf)
                                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |k6RQvqS8aD2) (:text |year) (:type :leaf)
                                                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |3JXNjER4SCN) (:text "|\"-") (:type :leaf)
                                                                          |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |hLzdn7cGanq) (:text |date) (:type :leaf)
                                                                      |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |E3WE2OpLneY) (:text |dayjs) (:type :leaf)
                                                                      |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |iUQKOmU3Wv9) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |I83Np314Wct) (:text |.format) (:type :leaf)
                                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |kr-E1TFIGwC) (:text "|\"ddd") (:type :leaf)
                                                              |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |sdNJw0xlDro) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |5a_7yH0mnLJ) (:text |=<) (:type :leaf)
                                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |y_Q1KzNQoUm) (:text |12) (:type :leaf)
                                                                  |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |jAHutTMtCUy) (:text |nil) (:type :leaf)
                                                              |x $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |3DF81OzzExS) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |xLvrXEL36FM) (:text |<>) (:type :leaf)
                                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |LkbbRnObdKb) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |6QUpYF1VaCc) (:text |str) (:type :leaf)
                                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |RKUad5QSZDp) (:text |date) (:type :leaf)
                                                          |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |44uYxi8ui0E) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |soCz2RkDlck) (:text |list->) (:type :leaf)
                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |6No3DWQ2iHa) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |J9pYlXOuq8d) (:text |{}) (:type :leaf)
                                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |6od9hGCRDp9) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1657790949451) (:by |B1y7Rc-Zz) (:id |LL5cjNfhpbN) (:text |:class-name) (:type :leaf)
                                                                      |j $ {} (:at 1657790952262) (:by |B1y7Rc-Zz) (:id |6WNOfjdWyZU) (:text |css/column) (:type :leaf)
                                                              |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |jBsa-6DvVdV) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1629963836490) (:by |B1y7Rc-Zz) (:id |CXHHd04ifvQ) (:text |->) (:type :leaf)
                                                                  |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |SR_-vKhj1_m) (:text |notes-in-day) (:type :leaf)
                                                                  |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |t6V8kgo1acB) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1629963850954) (:by |B1y7Rc-Zz) (:id |jHsW4ylpwB9) (:text |.sort-by) (:type :leaf)
                                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |9HLPvC-hwmb) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |hMtYKPdBtL-) (:text |fn) (:type :leaf)
                                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |LxwDiVzmGOW) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1629963840870) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |MyBBpGner1q) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1629964067103) (:by |B1y7Rc-Zz) (:id |ZxokZxUomDO) (:text |negate) (:type :leaf)
                                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |BCH42ua5EKM) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |7k1U5t47HnL) (:text |:time) (:type :leaf)
                                                                                  |j $ {} (:at 1629963846640) (:by |B1y7Rc-Zz) (:type :expr)
                                                                                    :data $ {}
                                                                                      |T $ {} (:at 1629963846088) (:by |B1y7Rc-Zz) (:id |herYcHIes1I) (:text |last) (:type :leaf)
                                                                                      |j $ {} (:at 1629963848239) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                                                  |v $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |B5j9DuXZg7X) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1629963859761) (:by |B1y7Rc-Zz) (:id |niq9kMZAZej) (:text |.map-pair) (:type :leaf)
                                                                      |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |VR5YPf64e5v) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |FE98vT_T1XH) (:text |fn) (:type :leaf)
                                                                          |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |xIrKVDAMups) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |agpZD793qyo) (:text |k) (:type :leaf)
                                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |ct2HLhkmZ8t) (:text |note) (:type :leaf)
                                                                          |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |bn2qVzoZsby) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |17KyCbO2zAd) (:text |[]) (:type :leaf)
                                                                              |j $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |PO0pGHuY09A) (:text |k) (:type :leaf)
                                                                              |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |RquwAUcpyqB) (:type :expr)
                                                                                :data $ {}
                                                                                  |r $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |WdzimoRfiRr) (:text |comp-note) (:type :leaf)
                                                                                  |v $ {} (:at 1584879219140) (:by |B1y7Rc-Zz) (:id |oflcoJQSA) (:type :expr)
                                                                                    :data $ {}
                                                                                      |D $ {} (:at 1584879219937) (:by |B1y7Rc-Zz) (:id |ZmsOQlXgJR) (:text |>>) (:type :leaf)
                                                                                      |T $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |8_KBfelmVnr) (:text |states) (:type :leaf)
                                                                                      |j $ {} (:at 1584879220688) (:by |B1y7Rc-Zz) (:id |UXtau8T7f2) (:text |k) (:type :leaf)
                                                                                  |x $ {} (:at 1572973376840) (:by |B1y7Rc-Zz) (:id |M_MnuoipmnW) (:text |note) (:type :leaf)
                          |r $ {} (:at 1572973379904) (:by |B1y7Rc-Zz) (:id |7xtBYHynoy) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973379904) (:by |B1y7Rc-Zz) (:id |___MN3VYkr) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1572973379904) (:by |B1y7Rc-Zz) (:id |R_RMMqyQhO) (:text |nil) (:type :leaf)
                              |r $ {} (:at 1572973379904) (:by |B1y7Rc-Zz) (:id |ObLOrIkuYk) (:text |160) (:type :leaf)
                      |v $ {} (:at 1629964453801) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964456604) (:by |B1y7Rc-Zz) (:text |.render) (:type :leaf)
                          |j $ {} (:at 1629964457260) (:by |B1y7Rc-Zz) (:text |add-plugin) (:type :leaf)
          |css-note $ {} (:at 1658935565778) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1658935567983) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1658935565778) (:by |B1y7Rc-Zz) (:text |css-note) (:type :leaf)
              |h $ {} (:at 1658935565778) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1658935569245) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |X $ {} (:at 1658935588700) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658935590738) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1658935591549) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935591861) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935592098) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935597876) (:by |B1y7Rc-Zz) (:text |:transition-duration) (:type :leaf)
                              |b $ {} (:at 1658935600683) (:by |B1y7Rc-Zz) (:text "|\"200ms") (:type :leaf)
                  |b $ {} (:at 1658935569717) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658935574327) (:by |B1y7Rc-Zz) (:text "|\"$0:hover") (:type :leaf)
                      |b $ {} (:at 1658935574731) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935575748) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935576400) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935580100) (:by |B1y7Rc-Zz) (:text |:background-color) (:type :leaf)
                              |b $ {} (:at 1658935580402) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1658935580752) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                  |b $ {} (:at 1658935581224) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                  |h $ {} (:at 1658935581443) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                  |l $ {} (:at 1658935583338) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                  |o $ {} (:at 1658935584748) (:by |B1y7Rc-Zz) (:text |0.2) (:type :leaf)
        :ns $ {} (:at 1500541010211) (:by nil) (:id |ByC9-5Lee0rW) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541010211) (:by |root) (:id |Bk1s-qLxlAH-) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541010211) (:by |root) (:id |ryljZqUglCrZ) (:text |app.comp.notes-page) (:type :leaf)
            |v $ {} (:at 1500541010211) (:by nil) (:id |HkCj-9IxgABb) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541010211) (:by |root) (:id |SyknZqIgxCBW) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541010211) (:by nil) (:id |Bkx3W5LxeRHW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1629963768267) (:by |B1y7Rc-Zz) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |H1X3W58egRrZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |BJVhZcUelRrZ) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |Sk8h-5LgxRBW) (:text |hsl) (:type :leaf)
                |n $ {} (:at 1657790853440) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790854776) (:by |B1y7Rc-Zz) (:text |respo.css) (:type :leaf)
                    |b $ {} (:at 1657790857958) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1657790858324) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1657790860099) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
                |p $ {} (:at 1657790861275) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790865573) (:by |B1y7Rc-Zz) (:text |respo-ui.css) (:type :leaf)
                    |b $ {} (:at 1657790868440) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1657790866575) (:by |B1y7Rc-Zz) (:text |css) (:type :leaf)
                |r $ {} (:at 1500541010211) (:by nil) (:id |Byw3Z9IexAB-) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |B1F2b98glCBb) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |rJq3Zc8xxCBb) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |HyjhZ9UeeRrb) (:text |schema) (:type :leaf)
                |v $ {} (:at 1500541010211) (:by nil) (:id |HJ33Z9Ill0rW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1516547419785) (:by |root) (:id |H1R2Z58eeCBZ) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |HyyaWqUee0rZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |SklpZqLgg0HZ) (:text |ui) (:type :leaf)
                |y $ {} (:at 1500541010211) (:by nil) (:id |HyxIgc3JG) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1542907291901) (:by |B1y7Rc-Zz) (:id |BJHi-5UxxCSZ) (:text |respo.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |B1LsWcIeeArW) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |HkvjWqUlgRS-) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |B1FjW9UegCSW) (:text |defcomp) (:type :leaf)
                        |n $ {} (:at 1524070875244) (:by |root) (:id |BkllkcgSnz) (:text |list->) (:type :leaf)
                        |p $ {} (:at 1584879138364) (:by |B1y7Rc-Zz) (:id |O-hB3RJW5v) (:text |>>) (:type :leaf)
                        |r $ {} (:at 1500541010211) (:by |root) (:id |ryqiZqUel0B-) (:text |<>) (:type :leaf)
                        |v $ {} (:at 1500541010211) (:by |root) (:id |SkooW9UgxRrb) (:text |span) (:type :leaf)
                        |x $ {} (:at 1500541010211) (:by |root) (:id |HJ2obqIlgCB-) (:text |div) (:type :leaf)
                        |y $ {} (:at 1556645672770) (:by |B1y7Rc-Zz) (:id |HyaiWqIgxCrZ) (:text |button) (:type :leaf)
                        |yT $ {} (:at 1556645673058) (:by |B1y7Rc-Zz) (:id |ERVt6l_zF7) (:text |a) (:type :leaf)
                |yT $ {} (:at 1500541010211) (:by nil) (:id |ryTT-cLgxABZ) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |rJJRW5UegRrW) (:text |respo.comp.space) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |H1gAZc8llRrW) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |Hy-0b58xxCrW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |H1XCWcIxlRS-) (:text |=<) (:type :leaf)
                |yj $ {} (:at 1527788936196) (:by |root) (:id |Skll5r3p1m) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1527788937835) (:by |root) (:id |rk-cB3pyQ) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1527788938747) (:by |root) (:id |H14fqShakX) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1527788939786) (:by |root) (:id |B1zm9B3T1Q) (:text |config) (:type :leaf)
                |yr $ {} (:at 1556646814337) (:by |B1y7Rc-Zz) (:id |Ycdd2u7z1J) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1584878805329) (:by |B1y7Rc-Zz) (:id |S_GBTOVIBE) (:text |respo-alerts.core) (:type :leaf)
                    |r $ {} (:at 1556646817775) (:by |B1y7Rc-Zz) (:id |uG2TICK9d) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1556646817986) (:by |B1y7Rc-Zz) (:id |oIFTQy6N0c) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1629963771401) (:by |B1y7Rc-Zz) (:id |FFqOp7WTEu) (:text |use-prompt) (:type :leaf)
                        |r $ {} (:at 1629963773079) (:by |B1y7Rc-Zz) (:id |7DmuPPqGS) (:text |use-confirm) (:type :leaf)
                |yv $ {} (:at 1556647403272) (:by |B1y7Rc-Zz) (:id |Yg1DVcH2-V) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1556647403990) (:by |B1y7Rc-Zz) (:id |uLYxV2uWNs) (:text |feather.core) (:type :leaf)
                    |r $ {} (:at 1556647406014) (:by |B1y7Rc-Zz) (:id |dxstlamX0H) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1556647406234) (:by |B1y7Rc-Zz) (:id |6xry5YMU30) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1556647408448) (:by |B1y7Rc-Zz) (:id |YgeEGkBYS) (:text |comp-i) (:type :leaf)
                        |r $ {} (:at 1556648443394) (:by |B1y7Rc-Zz) (:id |sXKTJuJTEN) (:text |comp-icon) (:type :leaf)
                |yx $ {} (:at 1556647554198) (:by |B1y7Rc-Zz) (:id |7MAtWGIh_l) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1556647557362) (:by |B1y7Rc-Zz) (:id |HZj3yRQzKw) (:text "|\"dayjs") (:type :leaf)
                    |r $ {} (:at 1629963765657) (:by |B1y7Rc-Zz) (:id |dSBTvhg5xA) (:text |:default) (:type :leaf)
                    |v $ {} (:at 1556647559680) (:by |B1y7Rc-Zz) (:id |WYXm13ec9w) (:text |dayjs) (:type :leaf)
        :proc $ {} (:at 1500541010211) (:by nil) (:id |rJ4RbcUxeCBZ) (:type :expr)
          :data $ {}
      |app.comp.overview $ {}
        :defs $ {}
          |comp-no-tasks $ {} (:at 1537291230974) (:by |root) (:id |xDTYpGdSFX) (:type :expr)
            :data $ {}
              |T $ {} (:at 1537291232141) (:by |root) (:id |4x-7M4RUOj) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1537291230974) (:by |root) (:id |7x5Zc-h4DS) (:text |comp-no-tasks) (:type :leaf)
              |r $ {} (:at 1537291230974) (:by |root) (:id |PMhm4gqwS9) (:type :expr)
                :data $ {}
              |v $ {} (:at 1537291233551) (:by |root) (:id |dwFryjEep) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1537291234532) (:by |root) (:id |dwFryjEepleaf) (:text |div) (:type :leaf)
                  |j $ {} (:at 1537291235140) (:by |root) (:id |kF4a8gdwk-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537291235434) (:by |root) (:id |_gJTUzdU8I) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1657790800289) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790803403) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                          |b $ {} (:at 1657795204236) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1657795207785) (:by |B1y7Rc-Zz) (:text |str-spaced) (:type :leaf)
                              |T $ {} (:at 1657790805324) (:by |B1y7Rc-Zz) (:text |css/center) (:type :leaf)
                              |b $ {} (:at 1657795211906) (:by |B1y7Rc-Zz) (:text |css/font-fancy) (:type :leaf)
                      |j $ {} (:at 1537291264061) (:by |root) (:id |1W1DUpkEaJ) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537291265443) (:by |root) (:id |kWldh0WMe3) (:text |:style) (:type :leaf)
                          |j $ {} (:at 1537291272604) (:by |root) (:id |Ro5oWthAE) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1537291273953) (:by |root) (:id |kg3rXPMNA9) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1537291274385) (:by |root) (:id |yH6h8Sy3rJ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537291276664) (:by |root) (:id |X2Roa1q1Iy) (:text |:color) (:type :leaf)
                                  |j $ {} (:at 1537291276939) (:by |root) (:id |HQuy26bH-4) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1537291277319) (:by |root) (:id |jH3smeRlPM) (:text |hsl) (:type :leaf)
                                      |j $ {} (:at 1537291278418) (:by |root) (:id |gdtHT68TQ) (:text |0) (:type :leaf)
                                      |r $ {} (:at 1537291278650) (:by |root) (:id |dfLC8iS78) (:text |0) (:type :leaf)
                                      |v $ {} (:at 1537291278964) (:by |root) (:id |_vuHHNlWNQ) (:text |80) (:type :leaf)
                  |r $ {} (:at 1537291235847) (:by |root) (:id |4lIxMw6r2_) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537291236191) (:by |root) (:id |4lIxMw6r2_leaf) (:text |<>) (:type :leaf)
                      |j $ {} (:at 1537291238674) (:by |root) (:id |vhQA8p4Gc5) (:text "|\"No tasks") (:type :leaf)
          |comp-overview $ {} (:at 1533618614003) (:by |root) (:id |IK45If6qwx) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533618616935) (:by |root) (:id |oercg4U3zC) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1533618614003) (:by |root) (:id |PHKByIbZpz) (:text |comp-overview) (:type :leaf)
              |r $ {} (:at 1533618614003) (:by |root) (:id |GjsgPXaI4_) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533618689785) (:by |root) (:id |6rRM9oDgk) (:text |states) (:type :leaf)
                  |j $ {} (:at 1533695021776) (:by |root) (:id |4CLqPWDQ47) (:text |today) (:type :leaf)
                  |r $ {} (:at 1533695861899) (:by |root) (:id |_Vr9pESHkl) (:text |tasks) (:type :leaf)
              |v $ {} (:at 1533695863284) (:by |root) (:id |GFANEz3U0v) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1533695863804) (:by |root) (:id |gwf83bq69) (:text |let) (:type :leaf)
                  |L $ {} (:at 1533695863995) (:by |root) (:id |FtyU1h75Hg) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533695864132) (:by |root) (:id |P99ABnkYwm) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695865878) (:by |root) (:id |8nEvyi3dGM) (:text |working-tasks) (:type :leaf)
                          |j $ {} (:at 1537291166821) (:by |root) (:id |zf0sfSObsx) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1629963383111) (:by |B1y7Rc-Zz) (:id |c41lMCGC0j) (:text |->) (:type :leaf)
                              |T $ {} (:at 1533695867966) (:by |root) (:id |b4081-yRbu) (:text |tasks) (:type :leaf)
                              |b $ {} (:at 1629965333101) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629965345693) (:by |B1y7Rc-Zz) (:text |.to-map) (:type :leaf)
                              |j $ {} (:at 1537291170985) (:by |root) (:id |5U_tTBaFmZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629965485362) (:by |B1y7Rc-Zz) (:id |5U_tTBaFmZleaf) (:text |filter) (:type :leaf)
                                  |j $ {} (:at 1537291177792) (:by |root) (:id |LVhkEePgwI) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1537291178080) (:by |root) (:id |tJ8lhyXJd) (:text |fn) (:type :leaf)
                                      |j $ {} (:at 1537291178352) (:by |root) (:id |FPH_Rrd8fB) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963404199) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                      |r $ {} (:at 1537291187804) (:by |root) (:id |0t8qroQsw) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1537291188374) (:by |root) (:id |ZnaB_0gQQ6) (:text |not) (:type :leaf)
                                          |T $ {} (:at 1537291183386) (:by |root) (:id |Zb19KFzlLc) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1537291186281) (:by |root) (:id |Zb19KFzlLcleaf) (:text |:pending?) (:type :leaf)
                                              |j $ {} (:at 1629963398450) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963399759) (:by |B1y7Rc-Zz) (:id |Mft6AmFM_) (:text |last) (:type :leaf)
                                                  |j $ {} (:at 1629963400854) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                      |r $ {} (:at 1537290757538) (:by |root) (:id |sFPUS0oZD) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537290769300) (:by |root) (:id |sFPUS0oZDleaf) (:text |pending-tasks) (:type :leaf)
                          |j $ {} (:at 1537291190680) (:by |root) (:id |Z0Yo2qwzMP) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629963405501) (:by |B1y7Rc-Zz) (:id |IrmUqqF91V) (:text |->) (:type :leaf)
                              |j $ {} (:at 1537291190680) (:by |root) (:id |T3CT9AcpUO) (:text |tasks) (:type :leaf)
                              |n $ {} (:at 1629965337632) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629965342958) (:by |B1y7Rc-Zz) (:text |.to-map) (:type :leaf)
                              |r $ {} (:at 1537291190680) (:by |root) (:id |1AxkZtEqRx) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629965483635) (:by |B1y7Rc-Zz) (:id |MXpclG9W3X) (:text |filter) (:type :leaf)
                                  |j $ {} (:at 1537291190680) (:by |root) (:id |7yWlUplhqD) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1537291190680) (:by |root) (:id |m2Ac0Exby_) (:text |fn) (:type :leaf)
                                      |j $ {} (:at 1537291190680) (:by |root) (:id |V3x6c6A7YQ) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963414777) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                      |r $ {} (:at 1537291190680) (:by |root) (:id |j5OyqxcNmsw) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1537291190680) (:by |root) (:id |tTrwxry4l-H) (:text |:pending?) (:type :leaf)
                                          |j $ {} (:at 1629963415761) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963418226) (:by |B1y7Rc-Zz) (:id |TTI9LjhgGOF) (:text |last) (:type :leaf)
                                              |j $ {} (:at 1629963419082) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                      |v $ {} (:at 1629963545234) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629963551427) (:by |B1y7Rc-Zz) (:text |create-plugin) (:type :leaf)
                          |j $ {} (:at 1629963552327) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629963563825) (:by |B1y7Rc-Zz) (:text |use-prompt) (:type :leaf)
                              |j $ {} (:at 1629963564219) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629963564958) (:by |B1y7Rc-Zz) (:text |>>) (:type :leaf)
                                  |j $ {} (:at 1629963566311) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                                  |r $ {} (:at 1629963568183) (:by |B1y7Rc-Zz) (:text |:create) (:type :leaf)
                              |r $ {} (:at 1629963573636) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629963573636) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                  |r $ {} (:at 1629963573636) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629963573636) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1629963573636) (:by |B1y7Rc-Zz) (:text "|\"Create new task:") (:type :leaf)
                      |vT $ {} (:at 1651230025326) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1651230026803) (:by |B1y7Rc-Zz) (:text |cursor) (:type :leaf)
                          |b $ {} (:at 1651230027409) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1651230029510) (:by |B1y7Rc-Zz) (:text |:cursor) (:type :leaf)
                              |b $ {} (:at 1651230030378) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                      |w $ {} (:at 1651230021746) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1651230023422) (:by |B1y7Rc-Zz) (:text |state) (:type :leaf)
                          |b $ {} (:at 1651230023745) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1651230024055) (:by |B1y7Rc-Zz) (:text |or) (:type :leaf)
                              |b $ {} (:at 1651230032427) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1651230033097) (:by |B1y7Rc-Zz) (:text |:data) (:type :leaf)
                                  |b $ {} (:at 1651230033939) (:by |B1y7Rc-Zz) (:text |states) (:type :leaf)
                              |h $ {} (:at 1651230035437) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1651230035789) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1651230036606) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1651230039919) (:by |B1y7Rc-Zz) (:text |:show-later?) (:type :leaf)
                                      |b $ {} (:at 1651230040565) (:by |B1y7Rc-Zz) (:text |false) (:type :leaf)
                  |T $ {} (:at 1533618618975) (:by |root) (:id |dE86OZP-1T) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533618621869) (:by |root) (:id |dE86OZP-1Tleaf) (:text |div) (:type :leaf)
                      |j $ {} (:at 1533618622083) (:by |root) (:id |q5bWLbCSXr) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533618622386) (:by |root) (:id |MX4iU4IYrv) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657791265240) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791268391) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                              |b $ {} (:at 1657791272680) (:by |B1y7Rc-Zz) (:text |css/expand) (:type :leaf)
                          |j $ {} (:at 1533696221337) (:by |root) (:id |JmJVmWkQlc) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533696222111) (:by |root) (:id |_McSSgfpxE) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1533696222312) (:by |root) (:id |1m8NVnhbMH) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533696223308) (:by |root) (:id |_ajrQHrgH8) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1533696223735) (:by |root) (:id |UbsdsZNiJ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1533696225506) (:by |root) (:id |3B4W6apoRP) (:text |:padding) (:type :leaf)
                                      |j $ {} (:at 1533696225963) (:by |root) (:id |YsB81Q1mZ) (:text |16) (:type :leaf)
                      |xD $ {} (:at 1572973269346) (:by |B1y7Rc-Zz) (:id |X4-JUTfwe) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1572973270203) (:by |B1y7Rc-Zz) (:id |PngaFdHAJ) (:text |div) (:type :leaf)
                          |L $ {} (:at 1572973271510) (:by |B1y7Rc-Zz) (:id |beopDZB_-N) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973271146) (:by |B1y7Rc-Zz) (:id |YO9TN7q1zC) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1572973294486) (:by |B1y7Rc-Zz) (:id |FnzjzgeStn) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973296052) (:by |B1y7Rc-Zz) (:id |Fk1d91OQtM) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1572973296274) (:by |B1y7Rc-Zz) (:id |yVIzPbpEIg) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973296563) (:by |B1y7Rc-Zz) (:id |WeQEjwmT75) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1572973296850) (:by |B1y7Rc-Zz) (:id |_VFmITA5K7) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973299425) (:by |B1y7Rc-Zz) (:id |gg4v8_lBP1) (:text |:max-width) (:type :leaf)
                                          |j $ {} (:at 1572973312440) (:by |B1y7Rc-Zz) (:id |AKPBN-pGG) (:text |800) (:type :leaf)
                                      |r $ {} (:at 1572973303302) (:by |B1y7Rc-Zz) (:id |r5RVIvQg2v) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973305105) (:by |B1y7Rc-Zz) (:id |r5RVIvQg2vleaf) (:text |:margin) (:type :leaf)
                                          |j $ {} (:at 1572973306601) (:by |B1y7Rc-Zz) (:id |xQ7kV3x-N5) (:text |:auto) (:type :leaf)
                          |T $ {} (:at 1537981319220) (:by |root) (:id |ejluVMpHc_) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1537981320101) (:by |root) (:id |akd-SwCtQ) (:text |div) (:type :leaf)
                              |L $ {} (:at 1537981320365) (:by |root) (:id |2u6f839HHy) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537981321494) (:by |root) (:id |9dLaaaH8zQ) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1537981321800) (:by |root) (:id |2JfmvNMpd5) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657791280005) (:by |B1y7Rc-Zz) (:id |BAth4lg2M) (:text |:class-name) (:type :leaf)
                                      |j $ {} (:at 1657791282524) (:by |B1y7Rc-Zz) (:id |-hGOvZm-iW) (:text |css/row-parted) (:type :leaf)
                              |T $ {} (:at 1537290124070) (:by |root) (:id |01mGqClwe) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537290126283) (:by |root) (:id |01mGqClweleaf) (:text |comp-title) (:type :leaf)
                                  |j $ {} (:at 1537290131509) (:by |root) (:id |Uid6Nlg_xt) (:text "|\"Doing") (:type :leaf)
                                  |n $ {} (:at 1629963594557) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629963597407) (:by |B1y7Rc-Zz) (:text |comp-icon) (:type :leaf)
                                      |j $ {} (:at 1629963594557) (:by |B1y7Rc-Zz) (:text |:plus) (:type :leaf)
                                      |r $ {} (:at 1629963599287) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1629963600597) (:by |B1y7Rc-Zz) (:text |&{}) (:type :leaf)
                                          |L $ {} (:at 1629963609563) (:by |B1y7Rc-Zz) (:text |:font-size) (:type :leaf)
                                          |T $ {} (:at 1629963607065) (:by |B1y7Rc-Zz) (:text |14) (:type :leaf)
                                          |j $ {} (:at 1629963611140) (:by |B1y7Rc-Zz) (:text |:color) (:type :leaf)
                                          |r $ {} (:at 1629963613940) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                              |j $ {} (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |200) (:type :leaf)
                                              |r $ {} (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                              |v $ {} (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                          |v $ {} (:at 1629963622153) (:by |B1y7Rc-Zz) (:text |:cursor) (:type :leaf)
                                          |x $ {} (:at 1629963621338) (:by |B1y7Rc-Zz) (:text |:pointer) (:type :leaf)
                                      |v $ {} (:at 1629963623571) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963624478) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1629963624577) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963625506) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1629963626528) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                          |r $ {} (:at 1629963627036) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963629226) (:by |B1y7Rc-Zz) (:text |.show) (:type :leaf)
                                              |j $ {} (:at 1629963632977) (:by |B1y7Rc-Zz) (:text |create-plugin) (:type :leaf)
                                              |r $ {} (:at 1629963634514) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                              |v $ {} (:at 1629963635149) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963635982) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                                  |b $ {} (:at 1629963653716) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1629963959950) (:by |B1y7Rc-Zz) (:text |result) (:type :leaf)
                                                  |j $ {} (:at 1629963641634) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |L $ {} (:at 1629963657554) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                                      |j $ {} (:at 1629963641634) (:by |B1y7Rc-Zz) (:text |:task/create-working) (:type :leaf)
                                                      |r $ {} (:at 1629963641634) (:by |B1y7Rc-Zz) (:text |result) (:type :leaf)
                              |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |FRzP-gyyfu) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |pXH_D96ftv) (:text |div) (:type :leaf)
                                  |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |eE2zNvgG77) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |Z6xMlLmGTm) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1657790772053) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1657790775508) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                          |b $ {} (:at 1657795236849) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1657795239996) (:by |B1y7Rc-Zz) (:text |str-spaced) (:type :leaf)
                                              |T $ {} (:at 1657790779103) (:by |B1y7Rc-Zz) (:text |css/row-middle) (:type :leaf)
                                              |b $ {} (:at 1657795243570) (:by |B1y7Rc-Zz) (:text |css/font-fancy) (:type :leaf)
                                      |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |81krLDFPxs) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |WhfAiBprzJ) (:text |:style) (:type :leaf)
                                          |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |a65MiTUl3Z) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |E6LVR4j2F6) (:text |{}) (:type :leaf)
                                              |r $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |ndlt1lrnmpY) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |VFtkz6JThJg) (:text |:color) (:type :leaf)
                                                  |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |UWW0aNTeB2i) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |tU8_LNBZ8O9) (:text |hsl) (:type :leaf)
                                                      |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |huiBRjknZrU) (:text |0) (:type :leaf)
                                                      |r $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |nAKOIR5yQLH) (:text |0) (:type :leaf)
                                                      |v $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |mhE5BBkoQyo) (:text |60) (:type :leaf)
                                  |r $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |QvnWuvCiEDp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |4vGy29ZOQOz) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |EhF_xNKJOuT) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |IbEWAnWIeoM) (:text |.format) (:type :leaf)
                                          |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |hkKv5ZoRSzH) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |UNV6pPyT-gT) (:text |dayjs) (:type :leaf)
                                              |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |O7jRRKk3E2W) (:text |today) (:type :leaf)
                                          |r $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |UCy88HgDtoU) (:text "|\"ddd") (:type :leaf)
                                  |v $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |LM331tXW44D) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |2b6cecT8R8c) (:text |=<) (:type :leaf)
                                      |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |P8-MI9s0pAg) (:text |8) (:type :leaf)
                                      |r $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |bOxjGtN2xhH) (:text |nil) (:type :leaf)
                                  |x $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |6WVcjGnnFC7) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |MeM_KyRSkkL) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |hdwYZuBn0np) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |a-Vt-1IJw9x) (:text |str) (:type :leaf)
                                          |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |F_Edn4r_yP-) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629965545054) (:by |B1y7Rc-Zz) (:id |tk1ZuNi0uEj) (:text |.!week) (:type :leaf)
                                              |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |yk2D3uw4BB-) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |hoD6jZHWWoi) (:text |dayjs) (:type :leaf)
                                                  |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |6lunIkXmMr5) (:text |today) (:type :leaf)
                                          |r $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |FN-UFnU9d39) (:text "|\"th week") (:type :leaf)
                                  |y $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |-iWKyfJIzkH) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |3Sd3ry0O-f0) (:text |=<) (:type :leaf)
                                      |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |VBgb4gc6VG6) (:text |16) (:type :leaf)
                                      |r $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |xYAKxF0QRFt) (:text |nil) (:type :leaf)
                                  |yT $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |MMOD8filPdT) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |Ar3IkzkB6Ib) (:text |<>) (:type :leaf)
                                      |j $ {} (:at 1557245445481) (:by |B1y7Rc-Zz) (:id |hlYfs9OSyCY) (:text |today) (:type :leaf)
                          |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |3XGF4zw2GI) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |Zn9li7OsRz) (:text |if) (:type :leaf)
                              |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |CDvg50eLp2) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |a3CcCzAVKR) (:text |empty?) (:type :leaf)
                                  |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |_z_iy4sbE9) (:text |working-tasks) (:type :leaf)
                              |r $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |MmnUSpSq2x) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |5enJoFoX39) (:text |comp-no-tasks) (:type :leaf)
                              |v $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |AH3lBTMngI) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |6Wq8IIae6H) (:text |list->) (:type :leaf)
                                  |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |s35Kx91Fli) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |5B_2nmnX_T) (:text |{}) (:type :leaf)
                                  |r $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |GlrJ_AU8Em) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629963424416) (:by |B1y7Rc-Zz) (:id |Rijvtj-0yB) (:text |->) (:type :leaf)
                                      |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |UCJ9PTiJMu) (:text |working-tasks) (:type :leaf)
                                      |n $ {} (:at 1629963427737) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963428706) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                      |r $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |XQ8tvk4dp4) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963430691) (:by |B1y7Rc-Zz) (:id |fWOCJG2dxkY) (:text |.sort-by) (:type :leaf)
                                          |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |L3JvRwBLbKS) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |vNBDLs7-r_p) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |-_V5kilY3Gx) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963448269) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                              |r $ {} (:at 1629963435512) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1629963436435) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                                                  |L $ {} (:at 1629963436591) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629963436646) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1629963437741) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                                                          |j $ {} (:at 1629963438226) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1629963443322) (:by |B1y7Rc-Zz) (:text |last) (:type :leaf)
                                                              |j $ {} (:at 1629963442283) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                                  |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |LY3h1v_kOEd) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629963451613) (:by |B1y7Rc-Zz) (:id |f---BV2qpns) (:text |negate) (:type :leaf)
                                                      |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |wa69ElGibZr) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |3QKCSNqjbzy) (:text |or) (:type :leaf)
                                                          |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |wQxtt97DLJy) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |ifZKcKXGewY) (:text |:touched-time) (:type :leaf)
                                                              |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |ntvv8dobiCu) (:text |task) (:type :leaf)
                                                          |r $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |Huw6-9BDT4Y) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |AtjyF-8hn7a) (:text |:created-time) (:type :leaf)
                                                              |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |06rhC7SGbBp) (:text |task) (:type :leaf)
                                      |v $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |oobeMJnSMqb) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963456625) (:by |B1y7Rc-Zz) (:id |yDSgx6SGcY5) (:text |.map-pair) (:type :leaf)
                                          |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |CanKKVuRPHP) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |xxMn8fODDgR) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |TtJQI6rzHFn) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1629963461417) (:by |B1y7Rc-Zz) (:text |k) (:type :leaf)
                                                  |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |qz5kMKqeGqO) (:text |task) (:type :leaf)
                                              |r $ {} (:at 1629963462480) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1629963463329) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                                                  |L $ {} (:at 1629963464359) (:by |B1y7Rc-Zz) (:text |k) (:type :leaf)
                                                  |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |zbFvAbst4VL) (:type :expr)
                                                    :data $ {}
                                                      |r $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |w9MAYQUfg2Q) (:text |comp-task) (:type :leaf)
                                                      |v $ {} (:at 1584879105083) (:by |B1y7Rc-Zz) (:id |LKf2PRUDA) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1584879106398) (:by |B1y7Rc-Zz) (:id |s0W72JNB-X) (:text |>>) (:type :leaf)
                                                          |T $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |pKqm45YYteR) (:text |states) (:type :leaf)
                                                          |j $ {} (:at 1584879111521) (:by |B1y7Rc-Zz) (:id |LpRpkL_isO) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1584879111521) (:by |B1y7Rc-Zz) (:id |EWFdOTpL71) (:text |:id) (:type :leaf)
                                                              |j $ {} (:at 1584879111521) (:by |B1y7Rc-Zz) (:id |4Q5OBUznbB) (:text |task) (:type :leaf)
                                                      |x $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |PlMLE_C5Ppo) (:text |task) (:type :leaf)
                                                      |y $ {} (:at 1572973276693) (:by |B1y7Rc-Zz) (:id |BfOdJ0u80k4) (:text |:working) (:type :leaf)
                          |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |dBOl-BpE0u) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |SaorrRpqrC) (:text |when) (:type :leaf)
                              |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |lQuvdG2sHN) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |5SsIkiUOfb) (:text |not) (:type :leaf)
                                  |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |sNc_lFQBaF) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |j3k72GCl-O) (:text |empty?) (:type :leaf)
                                      |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |XxMPbsfAFV) (:text |pending-tasks) (:type :leaf)
                              |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |fPNceWg2KU) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |g9cPpl5iNc) (:text |div) (:type :leaf)
                                  |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |QU7EJOz4PB) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |cHuk6jbVWf) (:text |{}) (:type :leaf)
                                  |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |6VqTRhoNcC) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |7n8EUEOn5g) (:text |comp-title) (:type :leaf)
                                      |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |gDC80O0CPn) (:text "|\"Later") (:type :leaf)
                                      |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |kgLW5KO_Y6U) (:text |nil) (:type :leaf)
                                      |t $ {} (:at 1651230150008) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1651230150306) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                          |b $ {} (:at 1651230150580) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1651230150765) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                              |b $ {} (:at 1651230151392) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                          |h $ {} (:at 1651230152215) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1651230153929) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                              |b $ {} (:at 1651230154946) (:by |B1y7Rc-Zz) (:text |cursor) (:type :leaf)
                                              |h $ {} (:at 1651230155363) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1651230156243) (:by |B1y7Rc-Zz) (:text |update) (:type :leaf)
                                                  |b $ {} (:at 1651230158235) (:by |B1y7Rc-Zz) (:text |state) (:type :leaf)
                                                  |h $ {} (:at 1651230161455) (:by |B1y7Rc-Zz) (:text |:show-later?) (:type :leaf)
                                                  |l $ {} (:at 1651230163261) (:by |B1y7Rc-Zz) (:text |not) (:type :leaf)
                                  |v $ {} (:at 1651230045674) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1651230046152) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                      |L $ {} (:at 1651230046886) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1651230052711) (:by |B1y7Rc-Zz) (:text |:show-later?) (:type :leaf)
                                          |b $ {} (:at 1651230053854) (:by |B1y7Rc-Zz) (:text |state) (:type :leaf)
                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |x77FqOL3N_l) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |j6UFRItIC2s) (:text |list->) (:type :leaf)
                                          |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |aTh8h0Z0hq4) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |g2TyvPy79e1) (:text |{}) (:type :leaf)
                                          |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |kCCS1gkQukN) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629963505166) (:by |B1y7Rc-Zz) (:id |JeBTe7M_NAf) (:text |->) (:type :leaf)
                                              |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |T_QBZ1MiI8Y) (:text |pending-tasks) (:type :leaf)
                                              |n $ {} (:at 1629963506390) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963509539) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                              |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |TJtdV69tW6W) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963511148) (:by |B1y7Rc-Zz) (:id |S_3ZZYlWXP1) (:text |.sort-by) (:type :leaf)
                                                  |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |VBmIR1JhflL) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |ZX0f73KJdsF) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |7T7w-JBYGRW) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1629963529324) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                                      |r $ {} (:at 1629963514920) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1629963518933) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                                                          |L $ {} (:at 1629963519615) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1629963520255) (:by |B1y7Rc-Zz) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1629964000410) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                                                                  |j $ {} (:at 1629963521199) (:by |B1y7Rc-Zz) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1629963522641) (:by |B1y7Rc-Zz) (:text |last) (:type :leaf)
                                                                      |j $ {} (:at 1629963523819) (:by |B1y7Rc-Zz) (:text |pair) (:type :leaf)
                                                          |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |QO8fPi5VvlV) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1629963514262) (:by |B1y7Rc-Zz) (:id |yay4ckTfuF9) (:text |negate) (:type :leaf)
                                                              |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |m8JEd9nPVI_) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |HDL4dSon77Y) (:text |or) (:type :leaf)
                                                                  |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |b37vpvVp715) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |KLp2hOfkVxi) (:text |:touched-time) (:type :leaf)
                                                                      |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |AWH9v3VpvgS) (:text |task) (:type :leaf)
                                                                  |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |4dWa7HHcuVA) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |6iAtCm7fCQ-) (:text |:created-time) (:type :leaf)
                                                                      |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |ckWNQVPu6Wz) (:text |task) (:type :leaf)
                                              |v $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |JCGbh6ty_3v) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629963532185) (:by |B1y7Rc-Zz) (:id |f7HLNoKcby2) (:text |.map-pair) (:type :leaf)
                                                  |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |1kpmQ0nZNbl) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |lSjTOEjNTiP) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |YZjOru02uVR) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1629963534515) (:by |B1y7Rc-Zz) (:text |k) (:type :leaf)
                                                          |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |a-_S8h5Y2sZ) (:text |task) (:type :leaf)
                                                      |r $ {} (:at 1629963535676) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1629963536756) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                                                          |L $ {} (:at 1629963537235) (:by |B1y7Rc-Zz) (:text |k) (:type :leaf)
                                                          |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |u9z85EoZBjQ) (:type :expr)
                                                            :data $ {}
                                                              |r $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |QPVI-fDpM2z) (:text |comp-task) (:type :leaf)
                                                              |v $ {} (:at 1584879243542) (:by |B1y7Rc-Zz) (:id |9HRT-SDX0O) (:type :expr)
                                                                :data $ {}
                                                                  |D $ {} (:at 1584879244219) (:by |B1y7Rc-Zz) (:id |5Xd7a5gNsY) (:text |>>) (:type :leaf)
                                                                  |T $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |1RiJqN8bysv) (:text |states) (:type :leaf)
                                                                  |j $ {} (:at 1584879245178) (:by |B1y7Rc-Zz) (:id |_JQPNa2Src) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1584879245178) (:by |B1y7Rc-Zz) (:id |uxmPUxd25B) (:text |:id) (:type :leaf)
                                                                      |j $ {} (:at 1584879245178) (:by |B1y7Rc-Zz) (:id |WLs0eqnuuf) (:text |task) (:type :leaf)
                                                              |x $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |6UbUmsuTkob) (:text |task) (:type :leaf)
                                                              |y $ {} (:at 1572973285854) (:by |B1y7Rc-Zz) (:id |JaUm6ZpEKA_) (:text |:pending) (:type :leaf)
                                      |b $ {} (:at 1651230057312) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1651230059054) (:by |B1y7Rc-Zz) (:text |div) (:type :leaf)
                                          |b $ {} (:at 1651230059317) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1651230059633) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1651230079800) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1651230081374) (:by |B1y7Rc-Zz) (:text |:style) (:type :leaf)
                                                  |b $ {} (:at 1651230081689) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1651230083211) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                                      |b $ {} (:at 1651230084365) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1651230088931) (:by |B1y7Rc-Zz) (:text |:font-size) (:type :leaf)
                                                          |b $ {} (:at 1651230090797) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                                              |h $ {} (:at 1651230248816) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1651230250602) (:by |B1y7Rc-Zz) (:text |:on-click) (:type :leaf)
                                                  |b $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                                          |b $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                                      |h $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                                          |b $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |cursor) (:type :leaf)
                                                          |h $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |update) (:type :leaf)
                                                              |b $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |state) (:type :leaf)
                                                              |h $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |:show-later?) (:type :leaf)
                                                              |l $ {} (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |not) (:type :leaf)
                                          |h $ {} (:at 1651230060290) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1651230060618) (:by |B1y7Rc-Zz) (:text |<>) (:type :leaf)
                                              |b $ {} (:at 1651230063570) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1651230064599) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                                                  |X $ {} (:at 1651230072629) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1651230073400) (:by |B1y7Rc-Zz) (:text |count) (:type :leaf)
                                                      |b $ {} (:at 1651230075170) (:by |B1y7Rc-Zz) (:text |pending-tasks) (:type :leaf)
                                                  |b $ {} (:at 1651230276084) (:by |B1y7Rc-Zz) (:text "|\" future tasks. Click to show.") (:type :leaf)
                                              |h $ {} (:at 1651230205470) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1651230209702) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                                  |b $ {} (:at 1651230210125) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1651230212299) (:by |B1y7Rc-Zz) (:text |:font-family) (:type :leaf)
                                                      |b $ {} (:at 1651230218747) (:by |B1y7Rc-Zz) (:text |ui/font-fancy) (:type :leaf)
                                                  |h $ {} (:at 1651230220104) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1651230224437) (:by |B1y7Rc-Zz) (:text |:font-weight) (:type :leaf)
                                                      |b $ {} (:at 1651230228132) (:by |B1y7Rc-Zz) (:text |300) (:type :leaf)
                                                  |l $ {} (:at 1651230281756) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1651230283583) (:by |B1y7Rc-Zz) (:text |:cursor) (:type :leaf)
                                                      |b $ {} (:at 1651230284577) (:by |B1y7Rc-Zz) (:text |:pointer) (:type :leaf)
                          |v $ {} (:at 1629963579383) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629963581565) (:by |B1y7Rc-Zz) (:text |.render) (:type :leaf)
                              |j $ {} (:at 1629963584645) (:by |B1y7Rc-Zz) (:text |create-plugin) (:type :leaf)
          |comp-task $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |YQvjN1xoaG) (:type :expr)
            :data $ {}
              |T $ {} (:at 1536652647724) (:by |B1y7Rc-Zz) (:id |wMZIS63OCJ) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |kNRzSG46mx) (:text |comp-task) (:type :leaf)
              |n $ {} (:at 1536652649039) (:by |B1y7Rc-Zz) (:id |yGwPmg2j8k) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1536652675934) (:by |B1y7Rc-Zz) (:id |_z2hWu6rG) (:text |states) (:type :leaf)
                  |T $ {} (:at 1536652650350) (:by |B1y7Rc-Zz) (:id |DwvlDnBxs) (:text |task) (:type :leaf)
                  |j $ {} (:at 1537982327073) (:by |root) (:id |IXX99RnFvk) (:text |mode) (:type :leaf)
              |r $ {} (:at 1536652681784) (:by |B1y7Rc-Zz) (:id |xz2_V6lae) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1536652682362) (:by |B1y7Rc-Zz) (:id |KyRjan0Y79) (:text |let) (:type :leaf)
                  |L $ {} (:at 1536652682550) (:by |B1y7Rc-Zz) (:id |bwwI66gR6) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1584879302487) (:by |B1y7Rc-Zz) (:id |TnrZ_7sacv) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584879303360) (:by |B1y7Rc-Zz) (:id |TnrZ_7sacvleaf) (:text |cursor) (:type :leaf)
                          |j $ {} (:at 1584879304168) (:by |B1y7Rc-Zz) (:id |nYHcqDbsE) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584879305359) (:by |B1y7Rc-Zz) (:id |7fbBwK9XlG) (:text |:cursor) (:type :leaf)
                              |j $ {} (:at 1584879306796) (:by |B1y7Rc-Zz) (:id |Xgz2LFlTC8) (:text |states) (:type :leaf)
                      |T $ {} (:at 1536652682705) (:by |B1y7Rc-Zz) (:id |lu-KcaJ6cX) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1536652685285) (:by |B1y7Rc-Zz) (:id |rimxi_5x-) (:text |state) (:type :leaf)
                          |j $ {} (:at 1536652685604) (:by |B1y7Rc-Zz) (:id |6bkT2LW0i) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536652686361) (:by |B1y7Rc-Zz) (:id |8f3bj8XpOo) (:text |or) (:type :leaf)
                              |j $ {} (:at 1536652686632) (:by |B1y7Rc-Zz) (:id |Q9-aswHO-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536652688217) (:by |B1y7Rc-Zz) (:id |TUWOZxxn3F) (:text |:data) (:type :leaf)
                                  |j $ {} (:at 1536652689125) (:by |B1y7Rc-Zz) (:id |nFhvVnSSVA) (:text |states) (:type :leaf)
                              |r $ {} (:at 1536652689985) (:by |B1y7Rc-Zz) (:id |bI3LJYVNom) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536652690329) (:by |B1y7Rc-Zz) (:id |gf-LBl14V) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1536652690542) (:by |B1y7Rc-Zz) (:id |lL7I7pjtF) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1536652695642) (:by |B1y7Rc-Zz) (:id |flv2EGAqPG) (:text |:menu?) (:type :leaf)
                                      |j $ {} (:at 1536652696406) (:by |B1y7Rc-Zz) (:id |vMJ5qgMKWn) (:text |false) (:type :leaf)
                      |j $ {} (:at 1586593011185) (:by |B1y7Rc-Zz) (:id |xdge9v9N7) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1586593015304) (:by |B1y7Rc-Zz) (:id |xdge9v9N7leaf) (:text |update-plugin) (:type :leaf)
                          |j $ {} (:at 1586593015658) (:by |B1y7Rc-Zz) (:id |ChsHDawvQ-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1586593083553) (:by |B1y7Rc-Zz) (:id |9NiM_vcsyY) (:text |use-prompt) (:type :leaf)
                              |j $ {} (:at 1586593084208) (:by |B1y7Rc-Zz) (:id |kiw85c6yc) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1586593084966) (:by |B1y7Rc-Zz) (:id |jmrJpq8gNL) (:text |>>) (:type :leaf)
                                  |b $ {} (:at 1586593090838) (:by |B1y7Rc-Zz) (:id |Ej4eqd_I0) (:text |states) (:type :leaf)
                                  |j $ {} (:at 1586593104582) (:by |B1y7Rc-Zz) (:id |Y7yydFGuZ) (:text |:drafter) (:type :leaf)
                              |r $ {} (:at 1586593091375) (:by |B1y7Rc-Zz) (:id |WZCBkiIEnZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1586593092366) (:by |B1y7Rc-Zz) (:id |WZCBkiIEnZleaf) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1586593144548) (:by |B1y7Rc-Zz) (:id |2UchCNhEW6) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1586593160802) (:by |B1y7Rc-Zz) (:id |nDjFEOHgq) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1586593464954) (:by |B1y7Rc-Zz) (:id |Db-HPP5Vo5) (:text "|\"Task content:") (:type :leaf)
                                  |r $ {} (:at 1586593174439) (:by |B1y7Rc-Zz) (:id |4J-HrebyF) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1586593177890) (:by |B1y7Rc-Zz) (:id |4J-HrebyFleaf) (:text |:initial) (:type :leaf)
                                      |j $ {} (:at 1586593179367) (:by |B1y7Rc-Zz) (:id |rWfoMJzmRJ) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1586593180446) (:by |B1y7Rc-Zz) (:id |h6rKUhtdp) (:text |:text) (:type :leaf)
                                          |j $ {} (:at 1586593182389) (:by |B1y7Rc-Zz) (:id |zW2_uaJeoN) (:text |task) (:type :leaf)
                                  |v $ {} (:at 1586593186498) (:by |B1y7Rc-Zz) (:id |4AwKEplvpU) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1586593188234) (:by |B1y7Rc-Zz) (:id |4AwKEplvpUleaf) (:text |:placeholder) (:type :leaf)
                                      |j $ {} (:at 1586593207002) (:by |B1y7Rc-Zz) (:id |V186bkkXt) (:text "|\"task...") (:type :leaf)
                                  |x $ {} (:at 1586593256694) (:by |B1y7Rc-Zz) (:id |y-pDFYWNiX) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1586593259551) (:by |B1y7Rc-Zz) (:id |y-pDFYWNiXleaf) (:text |:button-text) (:type :leaf)
                                      |j $ {} (:at 1586593260904) (:by |B1y7Rc-Zz) (:id |zDxIycpsth) (:text "|\"Edit") (:type :leaf)
                      |r $ {} (:at 1586593601958) (:by |B1y7Rc-Zz) (:id |STQ7XKHB9) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1586593607942) (:by |B1y7Rc-Zz) (:id |STQ7XKHB9leaf) (:text |delete-plugin) (:type :leaf)
                          |j $ {} (:at 1586593608277) (:by |B1y7Rc-Zz) (:id |zV8XouWnM4) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1586593610255) (:by |B1y7Rc-Zz) (:id |w2Hjsnllz) (:text |use-confirm) (:type :leaf)
                              |j $ {} (:at 1586593611550) (:by |B1y7Rc-Zz) (:id |gi8g5A6O5M) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1586593612109) (:by |B1y7Rc-Zz) (:id |8ZJuNaQoi) (:text |>>) (:type :leaf)
                                  |j $ {} (:at 1586593620063) (:by |B1y7Rc-Zz) (:id |K32mXLWiQ) (:text |states) (:type :leaf)
                                  |r $ {} (:at 1586593624512) (:by |B1y7Rc-Zz) (:id |XWpVJIJiT-) (:text |:delete) (:type :leaf)
                              |r $ {} (:at 1586593625555) (:by |B1y7Rc-Zz) (:id |Uh7c_kK90E) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1586593625916) (:by |B1y7Rc-Zz) (:id |2BOX_UcB8) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1586593626232) (:by |B1y7Rc-Zz) (:id |e7b-gqw7Zi) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1586593634953) (:by |B1y7Rc-Zz) (:id |fGCPPQu4v) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1586593643536) (:by |B1y7Rc-Zz) (:id |MqgE6ybtaZ) (:text "|\"Sure to remove task:") (:type :leaf)
                  |T $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |1D3JpJ48Wv) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |sBrBbSdfpF) (:text |div) (:type :leaf)
                      |j $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |tapGI0F-g5) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |foDXMsFWSy) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657790693244) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790695712) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                              |b $ {} (:at 1657790707430) (:by |B1y7Rc-Zz) (:text |css-task-base) (:type :leaf)
                          |j $ {} (:at 1536652733590) (:by |B1y7Rc-Zz) (:id |x-ffuow5k) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536652734415) (:by |B1y7Rc-Zz) (:id |ahwBACXuf4) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1536652744088) (:by |B1y7Rc-Zz) (:id |7KVjwul-xX) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1536652746010) (:by |B1y7Rc-Zz) (:id |KOD2pCYvcA) (:text |merge) (:type :leaf)
                                  |r $ {} (:at 1536946809997) (:by |root) (:id |Oj48O0Ocs) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1536946810668) (:by |root) (:id |Oj48O0Ocsleaf) (:text |when) (:type :leaf)
                                      |j $ {} (:at 1536946811005) (:by |root) (:id |lR_WOt_mMw) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1536946813361) (:by |root) (:id |6Xurn0YqxM) (:text |or) (:type :leaf)
                                          |j $ {} (:at 1536946813595) (:by |root) (:id |zOwHfqJEj) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1536946816343) (:by |root) (:id |CS7yN4YbAj) (:text |:menu?) (:type :leaf)
                                              |j $ {} (:at 1536946817436) (:by |root) (:id |KO5x5PNn4) (:text |state) (:type :leaf)
                                      |r $ {} (:at 1536946827120) (:by |root) (:id |fn22B2RVEP) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1536946827531) (:by |root) (:id |fn22B2RVEPleaf) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1536946827846) (:by |root) (:id |KE9c0Fih0E) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1536946895875) (:by |root) (:id |q-nMmragfZ) (:text |:background-color) (:type :leaf)
                                              |j $ {} (:at 1536946897482) (:by |root) (:id |bJ-Nf3faaS) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1536946897922) (:by |root) (:id |5R8tVgETsO) (:text |hsl) (:type :leaf)
                                                  |j $ {} (:at 1536946898546) (:by |root) (:id |p-YP3M6yng) (:text |0) (:type :leaf)
                                                  |r $ {} (:at 1536946899099) (:by |root) (:id |Vh4BvyI4yr) (:text |0) (:type :leaf)
                                                  |v $ {} (:at 1536946929694) (:by |root) (:id |jvkZBvRR9e) (:text |94) (:type :leaf)
                          |r $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |pgMpRBoxwR) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |gSK1tUwuss) (:text |:on-click) (:type :leaf)
                              |j $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |HtZCbyuiI9) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |QZXlDYEqMF) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |Z-R4IsSyS0) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |HJN5Pi9qiD) (:text |e) (:type :leaf)
                                      |j $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |LLJKtAIvpr) (:text |d!) (:type :leaf)
                                  |r $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |0XgwJOvMIA) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584879310925) (:by |B1y7Rc-Zz) (:id |eJA2Nm-zMy) (:text |d!) (:type :leaf)
                                      |b $ {} (:at 1584879312346) (:by |B1y7Rc-Zz) (:id |F17wYun6W) (:text |cursor) (:type :leaf)
                                      |j $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |syqwKoZHKv) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |q9vyMy0YBx) (:text |assoc) (:type :leaf)
                                          |j $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |OOzPEmmngP) (:text |state) (:type :leaf)
                                          |r $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |R1KpEzgi9f) (:text |:menu?) (:type :leaf)
                                          |v $ {} (:at 1536821311797) (:by |B1y7Rc-Zz) (:id |X18kqQ6TO3) (:text |true) (:type :leaf)
                          |x $ {} (:at 1565715970468) (:by |B1y7Rc-Zz) (:id |XGYsU5CHFh) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1565716009347) (:by |B1y7Rc-Zz) (:id |IrYHP6ysP5leaf) (:text |:on-dragend) (:type :leaf)
                              |j $ {} (:at 1565715992506) (:by |B1y7Rc-Zz) (:id |PA20ojMfwx) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1565715992827) (:by |B1y7Rc-Zz) (:id |yoFnWb575c) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1565715993797) (:by |B1y7Rc-Zz) (:id |Liai_tdrr) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1565715994047) (:by |B1y7Rc-Zz) (:id |ZzM9OY5KhM) (:text |e) (:type :leaf)
                                      |j $ {} (:at 1565715996478) (:by |B1y7Rc-Zz) (:id |Jj_FSx-IIg) (:text |d!) (:type :leaf)
                                  |r $ {} (:at 1565716042516) (:by |B1y7Rc-Zz) (:id |g0YwmB4L8y) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1565716042516) (:by |B1y7Rc-Zz) (:id |933ng8BeZl) (:text |d!) (:type :leaf)
                                      |j $ {} (:at 1565716042516) (:by |B1y7Rc-Zz) (:id |7IYpXlkJnx) (:text |:task/touch-working) (:type :leaf)
                                      |r $ {} (:at 1565716042516) (:by |B1y7Rc-Zz) (:id |iBARAiQfi7) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1565716042516) (:by |B1y7Rc-Zz) (:id |IMxEJ1OUpd) (:text |:id) (:type :leaf)
                                          |j $ {} (:at 1565716042516) (:by |B1y7Rc-Zz) (:id |cnV1H0cOy4) (:text |task) (:type :leaf)
                          |y $ {} (:at 1565716020188) (:by |B1y7Rc-Zz) (:id |_17MnipPis) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1565716022898) (:by |B1y7Rc-Zz) (:id |_17MnipPisleaf) (:text |:draggable) (:type :leaf)
                              |j $ {} (:at 1565716023613) (:by |B1y7Rc-Zz) (:id |Y2fu4oHHjX) (:text |true) (:type :leaf)
                      |r $ {} (:at 1536652712747) (:by |B1y7Rc-Zz) (:id |ueaP6Ey5Dg) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1536652713454) (:by |B1y7Rc-Zz) (:id |FXM_vNVmx9) (:text |div) (:type :leaf)
                          |L $ {} (:at 1536652714693) (:by |B1y7Rc-Zz) (:id |PZEk2NVEz4) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536652715062) (:by |B1y7Rc-Zz) (:id |KlTrOO9Sk) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1536652715273) (:by |B1y7Rc-Zz) (:id |BLq3jUJEBM) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536652716829) (:by |B1y7Rc-Zz) (:id |h9jexDVg6Q) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1536652732658) (:by |B1y7Rc-Zz) (:id |RUEU0rSiGh) (:text |ui/flex) (:type :leaf)
                          |T $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |D0CCrFX6rj) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |G6gTpvZjTr) (:text |<>) (:type :leaf)
                              |j $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |Bnk3c1WEjP) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |VyMGRdb2Kn) (:text |:text) (:type :leaf)
                                  |j $ {} (:at 1536652646384) (:by |B1y7Rc-Zz) (:id |mBSOr3z8aN) (:text |task) (:type :leaf)
                              |r $ {} (:at 1536733147145) (:by |B1y7Rc-Zz) (:id |YvV-UJuhYL) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536733147535) (:by |B1y7Rc-Zz) (:id |mic_GDvNl8) (:text |{}) (:type :leaf)
                      |xL $ {} (:at 1572936877567) (:by |B1y7Rc-Zz) (:id |kFldUtR4X) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1572936880230) (:by |B1y7Rc-Zz) (:id |kFldUtR4Xleaf) (:text |comp-modal-menu) (:type :leaf)
                          |r $ {} (:at 1572936888007) (:by |B1y7Rc-Zz) (:id |KHs_ZXUKl) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572936888850) (:by |B1y7Rc-Zz) (:id |cEc7f22DV) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1572936889987) (:by |B1y7Rc-Zz) (:id |MiST7ulgwv) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572936892587) (:by |B1y7Rc-Zz) (:id |La7ZO-Y1z) (:text |:title) (:type :leaf)
                                  |j $ {} (:at 1572936897983) (:by |B1y7Rc-Zz) (:id |_RPt3Chp_5) (:text "|\"Operations") (:type :leaf)
                              |r $ {} (:at 1572937182253) (:by |B1y7Rc-Zz) (:id |sduNuJdhYe) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572937184012) (:by |B1y7Rc-Zz) (:id |sduNuJdhYeleaf) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1572937184297) (:by |B1y7Rc-Zz) (:id |_SyjTSmjoT) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937184627) (:by |B1y7Rc-Zz) (:id |8d9ne2W9ei) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1572937200293) (:by |B1y7Rc-Zz) (:id |SOYebhKaPv) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937201061) (:by |B1y7Rc-Zz) (:id |pNnAlnCK4P) (:text |:width) (:type :leaf)
                                          |j $ {} (:at 1572937207556) (:by |B1y7Rc-Zz) (:id |BVZqdAkXjS) (:text |320) (:type :leaf)
                              |v $ {} (:at 1584879780703) (:by |B1y7Rc-Zz) (:id |Du8fnHz2Uu) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584879781618) (:by |B1y7Rc-Zz) (:id |Du8fnHz2Uuleaf) (:text |:items) (:type :leaf)
                                  |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |pCrUZLBroo) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |ZtIikLhXFk) (:text |[]) (:type :leaf)
                                      |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |DUiESR4rDS) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |pAVqWx4cpD) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |RdL32AcqGk) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |XwnJN1qwl3) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |i1bQ71uTje) (:text |:done) (:type :leaf)
                                          |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |ZuIm7Mo_Y9) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |mIRREYyYBu) (:text |:display) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |KQ5nAgJCXd) (:text "|\"Done") (:type :leaf)
                                      |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |XWDAjuAJXi) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |xH0gDR34ye) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |1HD0Mv5Vaq) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |73_ip5kFhE) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |me3b54viMK) (:text |:pend) (:type :leaf)
                                          |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |-lKFk9aL2nC) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |ivE716i9eUQ) (:text |:display) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |OEsa9gMjBgL) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |I4BdG9Efgt8) (:text |if) (:type :leaf)
                                                  |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |v7o7xig1OMV) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |VSQgBUKhL6Z) (:text |=) (:type :leaf)
                                                      |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |qpGsCpeb6nU) (:text |mode) (:type :leaf)
                                                      |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |sbnAi23GdaF) (:text |:pending) (:type :leaf)
                                                  |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |x2mJUtJqx1H) (:text "|\"Do it now") (:type :leaf)
                                                  |v $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |kecmkK6DDzj) (:text "|\"Do it later") (:type :leaf)
                                      |v $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |XvMOK5ogctk) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |_g9XRFruHX-) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |uLwwwv4fRDN) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |J3F083xXd1z) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |xY1JUoyM3Dj) (:text |:touch) (:type :leaf)
                                          |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |6528Fl0Diie) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |_PAGunytk5m) (:text |:display) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |RaZcx7nCkU-) (:text "|\"Up") (:type :leaf)
                                      |x $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |WAMdzKGixUq) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |aKfX_FYsw-o) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |9958btFToVN) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |JUVTnfNk-WK) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |5Bgb-726f4k) (:text |:copy) (:type :leaf)
                                          |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |sf5YMPn-yb0) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |9hiO7DIXd5Q) (:text |:display) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |1Du9PCY4aS-) (:text "|\"Copy") (:type :leaf)
                                      |y $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |XwrphW6mM7l) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |OfoWsDujPgq) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |8nBJWzZRXyz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |N_AESrbT3nt) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |YWOJbuS3ZOs) (:text |:edit) (:type :leaf)
                                          |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |fkkMJWsk2EA) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |GizGZ6pom7g) (:text |:display) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |pToZnxewVX4) (:text "|\"Edit") (:type :leaf)
                                      |yT $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |0lLHOfHxd_U) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |S0Rm6bUt7Ix) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |Ye2brQiAMrQ) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |I0o2HA3ziCT) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |Z_ud89kbcSn) (:text |:remove) (:type :leaf)
                                          |r $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |zQQydEIuuDT) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |WjqTO4JByDb) (:text |:display) (:type :leaf)
                                              |j $ {} (:at 1584879782378) (:by |B1y7Rc-Zz) (:id |akr0beWHBuM) (:text "|\"Remove") (:type :leaf)
                          |u $ {} (:at 1584880079008) (:by |B1y7Rc-Zz) (:id |I1lif7YrLH) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584880079008) (:by |B1y7Rc-Zz) (:id |2eI3e_78BP) (:text |:menu?) (:type :leaf)
                              |j $ {} (:at 1584880079008) (:by |B1y7Rc-Zz) (:id |DEAbYBGBlY) (:text |state) (:type :leaf)
                          |x $ {} (:at 1572936997764) (:by |B1y7Rc-Zz) (:id |cSWZxw9kO) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572936999736) (:by |B1y7Rc-Zz) (:id |cSWZxw9kOleaf) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1572937000020) (:by |B1y7Rc-Zz) (:id |G6SkFDnx0U) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584879316926) (:by |B1y7Rc-Zz) (:id |DhdxKKnVPc) (:text |d!) (:type :leaf)
                              |r $ {} (:at 1572937023863) (:by |B1y7Rc-Zz) (:id |9DHw0tjXU) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1584879318253) (:by |B1y7Rc-Zz) (:id |WM32iWDp9s) (:text |d!) (:type :leaf)
                                  |L $ {} (:at 1584879320051) (:by |B1y7Rc-Zz) (:id |MF03s_y4Kw) (:text |cursor) (:type :leaf)
                                  |T $ {} (:at 1572937022776) (:by |B1y7Rc-Zz) (:id |T82Bu4HhQE) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937022776) (:by |B1y7Rc-Zz) (:id |k_HugVOOoF) (:text |assoc) (:type :leaf)
                                      |j $ {} (:at 1572937022776) (:by |B1y7Rc-Zz) (:id |cF5GRVDoj9) (:text |state) (:type :leaf)
                                      |r $ {} (:at 1572937022776) (:by |B1y7Rc-Zz) (:id |4iKujGq67_) (:text |:menu?) (:type :leaf)
                                      |v $ {} (:at 1572937022776) (:by |B1y7Rc-Zz) (:id |1SVDWMfsEp) (:text |false) (:type :leaf)
                          |y $ {} (:at 1572937028344) (:by |B1y7Rc-Zz) (:id |zk-W1rtfRL) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572937028653) (:by |B1y7Rc-Zz) (:id |zk-W1rtfRLleaf) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1572937029098) (:by |B1y7Rc-Zz) (:id |ZaKWa9KeJ4) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572937109370) (:by |B1y7Rc-Zz) (:id |w3sRIOO7Ab) (:text |item) (:type :leaf)
                                  |j $ {} (:at 1572937030327) (:by |B1y7Rc-Zz) (:id |svr1IpKnXD) (:text |d!) (:type :leaf)
                              |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |-0XhejWTl1) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |MEh7Viiv9P) (:text |let) (:type :leaf)
                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |WtGHCQfxMZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |wkVZ6KNG8r) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |Tvs8BAsQPt) (:text |new-state) (:type :leaf)
                                          |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |vyvbHenX2L) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |-VEQtwsizp) (:text |assoc) (:type :leaf)
                                              |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |_HTa9zbxDm) (:text |state) (:type :leaf)
                                              |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |1kpgOys01x) (:text |:menu?) (:type :leaf)
                                              |v $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |JR_DnrWmiu) (:text |false) (:type :leaf)
                                      |j $ {} (:at 1572937110594) (:by |B1y7Rc-Zz) (:id |5cTi81zQg) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937111258) (:by |B1y7Rc-Zz) (:id |5cTi81zQgleaf) (:text |result) (:type :leaf)
                                          |j $ {} (:at 1572937111471) (:by |B1y7Rc-Zz) (:id |4ggZkw6iPW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572937112151) (:by |B1y7Rc-Zz) (:id |azajBu4sM3) (:text |:value) (:type :leaf)
                                              |j $ {} (:at 1572937115372) (:by |B1y7Rc-Zz) (:id |Eh2Dxk2mo) (:text |item) (:type :leaf)
                                  |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |VXOSXb26J2) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629963681589) (:by |B1y7Rc-Zz) (:id |mPCSPO3Vfn) (:text |case-default) (:type :leaf)
                                      |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |A0cwogv4-7) (:text |result) (:type :leaf)
                                      |n $ {} (:at 1629963671206) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629963671206) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                                          |j $ {} (:at 1629963671206) (:by |B1y7Rc-Zz) (:text |cursor) (:type :leaf)
                                          |r $ {} (:at 1629963671206) (:by |B1y7Rc-Zz) (:text |new-state) (:type :leaf)
                                      |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |B4sECyl1lyQ) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |UwTuDQWIph-) (:text |:done) (:type :leaf)
                                          |j $ {} (:at 1572970778617) (:by |B1y7Rc-Zz) (:id |4hwGa00-k) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1572970779664) (:by |B1y7Rc-Zz) (:id |F-7ZPztTRF) (:text |do) (:type :leaf)
                                              |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |2pXV_u9jla_) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |26GqNOVMQXh) (:text |d!) (:type :leaf)
                                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |W-YQnqAtfGC) (:text |:task/finish-working) (:type :leaf)
                                                  |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |gccVTpUzThl) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |5psUJkKGlp-) (:text |:id) (:type :leaf)
                                                      |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |GN37puyIs62) (:text |task) (:type :leaf)
                                              |j $ {} (:at 1572970780475) (:by |B1y7Rc-Zz) (:id |zI0mRb1fNU) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1584879325945) (:by |B1y7Rc-Zz) (:id |zI0mRb1fNUleaf) (:text |d!) (:type :leaf)
                                                  |b $ {} (:at 1584879327201) (:by |B1y7Rc-Zz) (:id |w20EHZROy) (:text |cursor) (:type :leaf)
                                                  |j $ {} (:at 1572970783996) (:by |B1y7Rc-Zz) (:id |6VQSRqyi75) (:text |new-state) (:type :leaf)
                                      |v $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |xngWyg3Etzj) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |3W1m6q8o1-d) (:text |:edit) (:type :leaf)
                                          |r $ {} (:at 1586593440713) (:by |B1y7Rc-Zz) (:id |RzqUs9Aa9H) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1586593441395) (:by |B1y7Rc-Zz) (:id |8KqDn0UrV) (:text |do) (:type :leaf)
                                              |L $ {} (:at 1586593444868) (:by |B1y7Rc-Zz) (:id |XgzTGx_Q_) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1586593445778) (:by |B1y7Rc-Zz) (:id |A62Q4CxdcL) (:text |d!) (:type :leaf)
                                                  |j $ {} (:at 1586593446882) (:by |B1y7Rc-Zz) (:id |4Fqsu_3JyC) (:text |cursor) (:type :leaf)
                                                  |r $ {} (:at 1586593449376) (:by |B1y7Rc-Zz) (:id |2kftO6G4y) (:text |new-state) (:type :leaf)
                                              |T $ {} (:at 1586593294582) (:by |B1y7Rc-Zz) (:id |zY82SRabF) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629965791228) (:by |B1y7Rc-Zz) (:id |81AlHkqkNn) (:text |.show) (:type :leaf)
                                                  |b $ {} (:at 1586593285868) (:by |B1y7Rc-Zz) (:id |wkUmk2S7Jleaf) (:text |update-plugin) (:type :leaf)
                                                  |j $ {} (:at 1586593296155) (:by |B1y7Rc-Zz) (:id |dNw6qPsuM) (:text |d!) (:type :leaf)
                                                  |r $ {} (:at 1586593296604) (:by |B1y7Rc-Zz) (:id |XRNaUhfljx) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1586593296872) (:by |B1y7Rc-Zz) (:id |HS1Gn6iEYz) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1586593297169) (:by |B1y7Rc-Zz) (:id |BrGdFs_40) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1586593311395) (:by |B1y7Rc-Zz) (:id |N4K1SwXDam) (:text |text) (:type :leaf)
                                                      |r $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |t4fD_mz3PX) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |-y2kMtFyrk) (:text |d!) (:type :leaf)
                                                          |j $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |0xSxWhdp7n) (:text |:task/update-working) (:type :leaf)
                                                          |r $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |bvnTCupHVG) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |Ea7zdop5gf) (:text |{}) (:type :leaf)
                                                              |j $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |xVIYeQb4yD) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |a6q_3EU0E5) (:text |:id) (:type :leaf)
                                                                  |j $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |OguviAvWOn) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |67nxySmOGQ) (:text |:id) (:type :leaf)
                                                                      |j $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |Yu48hiY8NA) (:text |task) (:type :leaf)
                                                              |r $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |8sO6DxTxAR) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1586593329666) (:by |B1y7Rc-Zz) (:id |lnxa2jHuOu) (:text |:text) (:type :leaf)
                                                                  |j $ {} (:at 1586593414634) (:by |B1y7Rc-Zz) (:id |Ap-xdPlrqo) (:text |text) (:type :leaf)
                                      |x $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |qpgmM_0OAMd) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |US8KL-uyHj8) (:text |:copy) (:type :leaf)
                                          |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |stvShE-QIor) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |1fL9qJ42CGi) (:text |do) (:type :leaf)
                                              |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |UEjf5kHpL41) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |q2a7p18gj7A) (:text |copy!) (:type :leaf)
                                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |73ZkBUgg99Z) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |oqCiio0dA15) (:text |:text) (:type :leaf)
                                                      |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |8pKCvCNRnM2) (:text |task) (:type :leaf)
                                              |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |gURceGDwqot) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1584879334750) (:by |B1y7Rc-Zz) (:id |nfNmTAalXtD) (:text |d!) (:type :leaf)
                                                  |b $ {} (:at 1584879336128) (:by |B1y7Rc-Zz) (:id |WkP-cYmPy) (:text |cursor) (:type :leaf)
                                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |JQu4ZDuOpgK) (:text |new-state) (:type :leaf)
                                      |y $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |J9ES0EBx7Qs) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |je60003LybY) (:text |:remove) (:type :leaf)
                                          |r $ {} (:at 1586593723435) (:by |B1y7Rc-Zz) (:id |yxnt7396qt) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1586593724529) (:by |B1y7Rc-Zz) (:id |dBx5Ha_zNW) (:text |do) (:type :leaf)
                                              |L $ {} (:at 1586593725322) (:by |B1y7Rc-Zz) (:id |AT8jCuBDX) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1586593726902) (:by |B1y7Rc-Zz) (:id |aTZLU-yh8q) (:text |d!) (:type :leaf)
                                                  |j $ {} (:at 1586593728867) (:by |B1y7Rc-Zz) (:id |DWV_IRqET) (:text |cursor) (:type :leaf)
                                                  |r $ {} (:at 1586593730853) (:by |B1y7Rc-Zz) (:id |Hug6ND01kS) (:text |new-state) (:type :leaf)
                                              |T $ {} (:at 1586593662655) (:by |B1y7Rc-Zz) (:id |DJJANxf4o) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629966628768) (:by |B1y7Rc-Zz) (:id |DJJANxf4oleaf) (:text |.show) (:type :leaf)
                                                  |b $ {} (:at 1586593670382) (:by |B1y7Rc-Zz) (:id |5_kYabIN2d) (:text |delete-plugin) (:type :leaf)
                                                  |j $ {} (:at 1586593672421) (:by |B1y7Rc-Zz) (:id |frK_4sBKT) (:text |d!) (:type :leaf)
                                                  |r $ {} (:at 1586593672790) (:by |B1y7Rc-Zz) (:id |0UtihHbZgf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1586593673234) (:by |B1y7Rc-Zz) (:id |D7MIrNxp3m) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1586593674520) (:by |B1y7Rc-Zz) (:id |Lx4Dw38A7P) (:type :expr)
                                                        :data $ {}
                                                      |r $ {} (:at 1586593686696) (:by |B1y7Rc-Zz) (:id |6JO-y05uz4) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1586593686696) (:by |B1y7Rc-Zz) (:id |2yCAVAb4Ds) (:text |d!) (:type :leaf)
                                                          |j $ {} (:at 1586593686696) (:by |B1y7Rc-Zz) (:id |H32o_BAKT0) (:text |:task/remove-working) (:type :leaf)
                                                          |r $ {} (:at 1586593686696) (:by |B1y7Rc-Zz) (:id |YP77WzJgUR) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1586593686696) (:by |B1y7Rc-Zz) (:id |9-zXNAfhu3) (:text |:id) (:type :leaf)
                                                              |j $ {} (:at 1586593686696) (:by |B1y7Rc-Zz) (:id |2XW3kvTkYy) (:text |task) (:type :leaf)
                                      |yT $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |om1xfFs-vYf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |wy4XUSjv532) (:text |:pend) (:type :leaf)
                                          |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |FJLqlEAqTyT) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |73Al19TpCre) (:text |do) (:type :leaf)
                                              |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |K4fc-sH8j5n) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |R1PnjNlwVw9) (:text |d!) (:type :leaf)
                                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |d1A40gBRZPh) (:text |:task/pend) (:type :leaf)
                                                  |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |3oOvw7td4IT) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |b4lKvPca4JY) (:text |:id) (:type :leaf)
                                                      |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |TulFQQMg9-P) (:text |task) (:type :leaf)
                                              |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |VvZ4GQ7EX_R) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1584879340689) (:by |B1y7Rc-Zz) (:id |hG01TuXkVrR) (:text |d!) (:type :leaf)
                                                  |b $ {} (:at 1584879342209) (:by |B1y7Rc-Zz) (:id |qaXZ45IVP) (:text |cursor) (:type :leaf)
                                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |I4v6L2NxXIU) (:text |new-state) (:type :leaf)
                                      |yj $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |7Whqy0OAGta) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |vFfn_kzSM1V) (:text |:touch) (:type :leaf)
                                          |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |uDEd3Jpz1r_) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |f-Q4GyJMCga) (:text |do) (:type :leaf)
                                              |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |ugWH6XCzmcK) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |zqDPRKpAlE4) (:text |d!) (:type :leaf)
                                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |He8xiZiTApu) (:text |:task/touch-working) (:type :leaf)
                                                  |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |IdOGYD_RVKP) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |-7GqANoEDFw) (:text |:id) (:type :leaf)
                                                      |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |vnEtz9JWX2v) (:text |task) (:type :leaf)
                                              |r $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |S8HHuqXsyp3) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1584879344138) (:by |B1y7Rc-Zz) (:id |T49o2XKhn-d) (:text |d!) (:type :leaf)
                                                  |b $ {} (:at 1584879345211) (:by |B1y7Rc-Zz) (:id |xaN60lioHd) (:text |cursor) (:type :leaf)
                                                  |j $ {} (:at 1572937035403) (:by |B1y7Rc-Zz) (:id |uTDLEL2hrWD) (:text |new-state) (:type :leaf)
                      |yn $ {} (:at 1586593222075) (:by |B1y7Rc-Zz) (:id |mZLEqhLEf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629965679833) (:by |B1y7Rc-Zz) (:id |mZLEqhLEfleaf) (:text |.render) (:type :leaf)
                          |j $ {} (:at 1586593224210) (:by |B1y7Rc-Zz) (:id |PXp4R4IrNi) (:text |update-plugin) (:type :leaf)
                      |yt $ {} (:at 1586593222075) (:by |B1y7Rc-Zz) (:id |Pd0soCKmt) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629965677036) (:by |B1y7Rc-Zz) (:id |mZLEqhLEfleaf) (:text |.render) (:type :leaf)
                          |j $ {} (:at 1586593652499) (:by |B1y7Rc-Zz) (:id |PXp4R4IrNi) (:text |delete-plugin) (:type :leaf)
          |comp-title $ {} (:at 1537290132323) (:by |root) (:id |3QE7c_gqeV) (:type :expr)
            :data $ {}
              |T $ {} (:at 1537290134044) (:by |root) (:id |G5UqoprMBT) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1537290132323) (:by |root) (:id |SCB8bLPqA4) (:text |comp-title) (:type :leaf)
              |r $ {} (:at 1537290132323) (:by |root) (:id |Z0WfnidGZs) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1537290136076) (:by |root) (:id |P8E1uStKaS) (:text |title) (:type :leaf)
                  |j $ {} (:at 1537981388110) (:by |root) (:id |anrZ_w3BLN) (:text |child) (:type :leaf)
                  |l $ {} (:at 1651230147069) (:by |B1y7Rc-Zz) (:text |?) (:type :leaf)
                  |n $ {} (:at 1651230144789) (:by |B1y7Rc-Zz) (:text |on-click) (:type :leaf)
              |v $ {} (:at 1537290136527) (:by |root) (:id |o9Lwq8c8h) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1537290139621) (:by |root) (:id |o9Lwq8c8hleaf) (:text |div) (:type :leaf)
                  |j $ {} (:at 1537290139979) (:by |root) (:id |gq9keBfdRo) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537290140374) (:by |root) (:id |Hpjt4Tzjns) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1657790637853) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790640831) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                          |b $ {} (:at 1657790643705) (:by |B1y7Rc-Zz) (:text |css-title) (:type :leaf)
                      |j $ {} (:at 1537290151300) (:by |root) (:id |IgeNZfMfoz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537290153373) (:by |root) (:id |stlhNGVWrZ) (:text |:style) (:type :leaf)
                          |n $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                              |b $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |fn?) (:type :leaf)
                                  |b $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |on-click) (:type :leaf)
                              |h $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |:cursor) (:type :leaf)
                                      |b $ {} (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |:pointer) (:type :leaf)
                      |n $ {} (:at 1651230124917) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1651230127021) (:by |B1y7Rc-Zz) (:text |:on-click) (:type :leaf)
                          |b $ {} (:at 1651230127344) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1651230127592) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                              |b $ {} (:at 1651230129134) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1651230129718) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                  |b $ {} (:at 1651230130304) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                              |h $ {} (:at 1651230131019) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1651230132633) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1651230133059) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1651230134612) (:by |B1y7Rc-Zz) (:text |fn?) (:type :leaf)
                                      |b $ {} (:at 1651230136309) (:by |B1y7Rc-Zz) (:text |on-click) (:type :leaf)
                                  |h $ {} (:at 1651230137037) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1651230138172) (:by |B1y7Rc-Zz) (:text |on-click) (:type :leaf)
                                      |X $ {} (:at 1651230140441) (:by |B1y7Rc-Zz) (:text |e) (:type :leaf)
                                      |b $ {} (:at 1651230139313) (:by |B1y7Rc-Zz) (:text |d!) (:type :leaf)
                  |r $ {} (:at 1537290141100) (:by |root) (:id |g1HtzRIQ_f) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537290141459) (:by |root) (:id |g1HtzRIQ_fleaf) (:text |<>) (:type :leaf)
                      |j $ {} (:at 1537290142994) (:by |root) (:id |hcTT6vx0R) (:text |title) (:type :leaf)
                  |t $ {} (:at 1537981379998) (:by |root) (:id |oeFrAL3Dn) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537981380564) (:by |root) (:id |oeFrAL3Dnleaf) (:text |=<) (:type :leaf)
                      |j $ {} (:at 1537981384623) (:by |root) (:id |86kQLcUYWG) (:text |16) (:type :leaf)
                      |r $ {} (:at 1537981382036) (:by |root) (:id |l5h0xmqsmq) (:text |nil) (:type :leaf)
                  |v $ {} (:at 1537981391108) (:by |root) (:id |gE77T-O-15) (:text |child) (:type :leaf)
          |css-task-base $ {} (:at 1657790710518) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1657790711720) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1657790710518) (:by |B1y7Rc-Zz) (:text |css-task-base) (:type :leaf)
              |h $ {} (:at 1657790710518) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1657790713481) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1657790714910) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1657790715988) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:border-bottom) (:type :leaf)
                              |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                                  |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text "|\"1px solid ") (:type :leaf)
                                  |h $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                      |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                      |h $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                      |l $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |90) (:type :leaf)
                          |h $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:line-height) (:type :leaf)
                              |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text "|\"24px") (:type :leaf)
                          |l $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:padding) (:type :leaf)
                              |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text "|\"8px 8px") (:type :leaf)
                          |o $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:overflow) (:type :leaf)
                              |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:auto) (:type :leaf)
                          |q $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:user-select) (:type :leaf)
                              |b $ {} (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:none) (:type :leaf)
                          |s $ {} (:at 1658935256989) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935262768) (:by |B1y7Rc-Zz) (:text |:transition-duration) (:type :leaf)
                              |b $ {} (:at 1658935269201) (:by |B1y7Rc-Zz) (:text "|\"200ms") (:type :leaf)
                  |h $ {} (:at 1658935215988) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1658935235279) (:by |B1y7Rc-Zz) (:text "|\"$0:hover") (:type :leaf)
                      |b $ {} (:at 1658935218267) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1658935218600) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1658935218968) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1658935224023) (:by |B1y7Rc-Zz) (:text |:background-color) (:type :leaf)
                              |b $ {} (:at 1658935224298) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1658935225091) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                  |b $ {} (:at 1658935225434) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                  |h $ {} (:at 1658935225748) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                  |l $ {} (:at 1658935240697) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                                  |o $ {} (:at 1658935244924) (:by |B1y7Rc-Zz) (:text |0.1) (:type :leaf)
          |css-title $ {} (:at 1657790644057) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1657790646652) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1657790644057) (:by |B1y7Rc-Zz) (:text |css-title) (:type :leaf)
              |h $ {} (:at 1657790644057) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1657790649409) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1657790649709) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1657790651502) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |merge) (:type :leaf)
                          |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |ui/row-middle) (:type :leaf)
                          |h $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:margin) (:type :leaf)
                                  |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text "|\"8px 0") (:type :leaf)
                              |h $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:font-family) (:type :leaf)
                                  |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |ui/font-fancy) (:type :leaf)
                              |l $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:color) (:type :leaf)
                                  |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                      |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                      |h $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                      |l $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |50) (:type :leaf)
                              |o $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:font-size) (:type :leaf)
                                  |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                              |q $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:font-weight) (:type :leaf)
                                  |b $ {} (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |300) (:type :leaf)
          |effect-focus $ {} (:at 1572797896281) (:by |B1y7Rc-Zz) (:id |lRA7n9CLZW) (:type :expr)
            :data $ {}
              |T $ {} (:at 1572797899532) (:by |B1y7Rc-Zz) (:id |NNfhB6d_Bv) (:text |defeffect) (:type :leaf)
              |j $ {} (:at 1572797896281) (:by |B1y7Rc-Zz) (:id |NyWvSmLS2x) (:text |effect-focus) (:type :leaf)
              |r $ {} (:at 1572797896281) (:by |B1y7Rc-Zz) (:id |KF6zERzdva) (:type :expr)
                :data $ {}
              |v $ {} (:at 1572797908761) (:by |B1y7Rc-Zz) (:id |jMiVJ5-7u) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1572797910476) (:by |B1y7Rc-Zz) (:id |jMiVJ5-7uleaf) (:text |action) (:type :leaf)
                  |j $ {} (:at 1572797911144) (:by |B1y7Rc-Zz) (:id |hY0t-iKcb) (:text |el) (:type :leaf)
                  |r $ {} (:at 1572797912603) (:by |B1y7Rc-Zz) (:id |LrtpmxDdv) (:text |*local) (:type :leaf)
              |x $ {} (:at 1572797913273) (:by |B1y7Rc-Zz) (:id |hw3roz4iwb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1572797914545) (:by |B1y7Rc-Zz) (:id |hw3roz4iwbleaf) (:text |case) (:type :leaf)
                  |j $ {} (:at 1572797915831) (:by |B1y7Rc-Zz) (:id |K1cGmSueGp) (:text |action) (:type :leaf)
                  |r $ {} (:at 1572797916787) (:by |B1y7Rc-Zz) (:id |gS0iUelfp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1572797918020) (:by |B1y7Rc-Zz) (:id |Du1B7zYMcz) (:text |:mount) (:type :leaf)
                      |j $ {} (:at 1572797921110) (:by |B1y7Rc-Zz) (:id |dyxCtrDSNj) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1572797927031) (:by |B1y7Rc-Zz) (:id |-vcbTN90v) (:text |->) (:type :leaf)
                          |T $ {} (:at 1572797928427) (:by |B1y7Rc-Zz) (:id |6xJ64emClJ) (:text |el) (:type :leaf)
                          |j $ {} (:at 1572797929111) (:by |B1y7Rc-Zz) (:id |LBhdN9f9ix) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572797932441) (:by |B1y7Rc-Zz) (:id |mhW4jwwPS) (:text |.querySelector) (:type :leaf)
                              |j $ {} (:at 1572797933645) (:by |B1y7Rc-Zz) (:id |qGrYy32mE) (:text "|\"input") (:type :leaf)
                          |r $ {} (:at 1572797935596) (:by |B1y7Rc-Zz) (:id |c03KYOkcG) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1572797958874) (:by |B1y7Rc-Zz) (:id |6jbQ3PE52) (:text |.focus) (:type :leaf)
                  |v $ {} (:at 1572797918647) (:by |B1y7Rc-Zz) (:id |rn8DEpwEZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1572797919532) (:by |B1y7Rc-Zz) (:id |rn8DEpwEZleaf) (:text |do) (:type :leaf)
        :ns $ {} (:at 1533618609466) (:by |root) (:id |Sfykm4hsqq) (:type :expr)
          :data $ {}
            |T $ {} (:at 1533618609466) (:by |root) (:id |LDiKe8xTvq) (:text |ns) (:type :leaf)
            |j $ {} (:at 1533618609466) (:by |root) (:id |YwKVa2tz9L) (:text |app.comp.overview) (:type :leaf)
            |r $ {} (:at 1500541010211) (:by nil) (:id |0OBMT5bPSS) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541010211) (:by |root) (:id |SyknZqIgxCBW) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541010211) (:by nil) (:id |Bkx3W5LxeRHW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1629963477531) (:by |B1y7Rc-Zz) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |H1X3W58egRrZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |BJVhZcUelRrZ) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |Sk8h-5LgxRBW) (:text |hsl) (:type :leaf)
                |n $ {} (:at 1657790655787) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790659447) (:by |B1y7Rc-Zz) (:text |respo-ui.css) (:type :leaf)
                    |b $ {} (:at 1657790661695) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1657790662345) (:by |B1y7Rc-Zz) (:text |css) (:type :leaf)
                |p $ {} (:at 1657790663044) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657790664882) (:by |B1y7Rc-Zz) (:text |respo.css) (:type :leaf)
                    |b $ {} (:at 1657790666478) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1657790666691) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1657790668561) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
                |r $ {} (:at 1500541010211) (:by nil) (:id |Byw3Z9IexAB-) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |B1F2b98glCBb) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |rJq3Zc8xxCBb) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |HyjhZ9UeeRrb) (:text |schema) (:type :leaf)
                |v $ {} (:at 1500541010211) (:by nil) (:id |HJ33Z9Ill0rW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1516547419785) (:by |root) (:id |H1R2Z58eeCBZ) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |HyyaWqUee0rZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |SklpZqLgg0HZ) (:text |ui) (:type :leaf)
                |y $ {} (:at 1500541010211) (:by nil) (:id |HyxIgc3JG) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1542907287136) (:by |B1y7Rc-Zz) (:id |BJHi-5UxxCSZ) (:text |respo.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |B1LsWcIeeArW) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |HkvjWqUlgRS-) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |B1FjW9UegCSW) (:text |defcomp) (:type :leaf)
                        |q $ {} (:at 1533695891715) (:by |root) (:id |8Obum8BYJ7) (:text |list->) (:type :leaf)
                        |qT $ {} (:at 1584879109458) (:by |B1y7Rc-Zz) (:id |aRJ2G703rR) (:text |>>) (:type :leaf)
                        |r $ {} (:at 1500541010211) (:by |root) (:id |ryqiZqUel0B-) (:text |<>) (:type :leaf)
                        |v $ {} (:at 1500541010211) (:by |root) (:id |SkooW9UgxRrb) (:text |span) (:type :leaf)
                        |x $ {} (:at 1500541010211) (:by |root) (:id |HJ2obqIlgCB-) (:text |div) (:type :leaf)
                        |y $ {} (:at 1529343437918) (:by |root) (:id |HyaiWqIgxCrZ) (:text |button) (:type :leaf)
                        |yT $ {} (:at 1536900646747) (:by |B1y7Rc-Zz) (:id |2EQaAG4g1) (:text |textarea) (:type :leaf)
                        |yb $ {} (:at 1542907469010) (:by |B1y7Rc-Zz) (:id |sA79vpx98Y) (:text |input) (:type :leaf)
                        |yj $ {} (:at 1537204416734) (:by |root) (:id |wL0UafpBx) (:text |a) (:type :leaf)
                        |yr $ {} (:at 1572797906528) (:by |B1y7Rc-Zz) (:id |87NpEeq4Jf) (:text |defeffect) (:type :leaf)
                |yT $ {} (:at 1500541010211) (:by nil) (:id |ryTT-cLgxABZ) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |rJJRW5UegRrW) (:text |respo.comp.space) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |H1gAZc8llRrW) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |Hy-0b58xxCrW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |H1XCWcIxlRS-) (:text |=<) (:type :leaf)
                |yj $ {} (:at 1527788936196) (:by |root) (:id |Skll5r3p1m) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1527788937835) (:by |root) (:id |rk-cB3pyQ) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1527788938747) (:by |root) (:id |H14fqShakX) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1527788939786) (:by |root) (:id |B1zm9B3T1Q) (:text |config) (:type :leaf)
                |yn $ {} (:at 1533696370133) (:by |root) (:id |Y7x6Egs-b) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1533696372081) (:by |root) (:id |E47WOz6Hkw) (:text |app.style) (:type :leaf)
                    |r $ {} (:at 1533696373313) (:by |root) (:id |jFzsxUW0uM) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1533696375162) (:by |root) (:id |Erp2XqPsLN) (:text |style) (:type :leaf)
                |yr $ {} (:at 1533695299161) (:by |root) (:id |BsjhaICw9w) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1572796411802) (:by |B1y7Rc-Zz) (:id |54iwglwQj) (:text |respo-alerts.core) (:type :leaf)
                    |r $ {} (:at 1533695306639) (:by |root) (:id |EVPwUZN3LL) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1533695306810) (:by |root) (:id |rHnBkVlDt5) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1533695309728) (:by |root) (:id |MsvywUiDyp) (:text |comp-prompt) (:type :leaf)
                        |r $ {} (:at 1572796415854) (:by |B1y7Rc-Zz) (:id |do9pIgRnMU) (:text |comp-modal) (:type :leaf)
                        |v $ {} (:at 1572937072293) (:by |B1y7Rc-Zz) (:id |D8f8YwHFI9) (:text |comp-modal-menu) (:type :leaf)
                        |x $ {} (:at 1586593020688) (:by |B1y7Rc-Zz) (:id |WTRSllnqy) (:text |use-prompt) (:type :leaf)
                        |y $ {} (:at 1586593028979) (:by |B1y7Rc-Zz) (:id |oX4XLWPwD) (:text |use-confirm) (:type :leaf)
                |yx $ {} (:at 1536652600377) (:by |B1y7Rc-Zz) (:id |c_0N1Eo6Ib) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1557036806998) (:by |B1y7Rc-Zz) (:id |H-2eunrU37) (:text |feather.core) (:type :leaf)
                    |r $ {} (:at 1536652606819) (:by |B1y7Rc-Zz) (:id |kUn33jpBUj) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1536652606993) (:by |B1y7Rc-Zz) (:id |RNJVKykZ8J) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1557036848550) (:by |B1y7Rc-Zz) (:id |Ye0j1hETrd) (:text |comp-i) (:type :leaf)
                        |r $ {} (:at 1629963947024) (:by |B1y7Rc-Zz) (:text |comp-icon) (:type :leaf)
                |yyT $ {} (:at 1536732272419) (:by |B1y7Rc-Zz) (:id |ND6ClhycuH) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1536732273888) (:by |B1y7Rc-Zz) (:id |vJ6Ij1eS0J) (:text "|\"dayjs") (:type :leaf)
                    |r $ {} (:at 1629963487991) (:by |B1y7Rc-Zz) (:id |kDwvOe3ctX) (:text |:default) (:type :leaf)
                    |v $ {} (:at 1536732276735) (:by |B1y7Rc-Zz) (:id |ui19cQaz2A) (:text |dayjs) (:type :leaf)
                |yyj $ {} (:at 1545326990268) (:by |B1y7Rc-Zz) (:id |nh_glAVdVn) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1545326991751) (:by |B1y7Rc-Zz) (:id |mIuJFRFK_a) (:text "|\"copy-text-to-clipboard") (:type :leaf)
                    |r $ {} (:at 1629963483496) (:by |B1y7Rc-Zz) (:id |zKIwJUHGNu) (:text |:default) (:type :leaf)
                    |v $ {} (:at 1545326998649) (:by |B1y7Rc-Zz) (:id |_IwvqZSoSB) (:text |copy!) (:type :leaf)
        :proc $ {} (:at 1533618609466) (:by |root) (:id |06dGOSeJd0) (:type :expr)
          :data $ {}
      |app.comp.profile $ {}
        :defs $ {}
          |comp-profile $ {} (:at 1500541010211) (:by nil) (:id |HJHJG58xgASW) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541010211) (:by |root) (:id |SyIkf9Uxx0Bb) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1500541010211) (:by |root) (:id |B1vkzqLgl0H-) (:text |comp-profile) (:type :leaf)
              |r $ {} (:at 1500541010211) (:by nil) (:id |rkOyMqUexRSW) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541010211) (:by |root) (:id |B1KyfcUggCrb) (:text |user) (:type :leaf)
                  |j $ {} (:at 1524070827396) (:by |root) (:id |SJ-ntlBnM) (:text |members) (:type :leaf)
              |v $ {} (:at 1573057099639) (:by |B1y7Rc-Zz) (:id |7kqz8R6E3) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1573057100429) (:by |B1y7Rc-Zz) (:id |wnbOqplbPT) (:text |div) (:type :leaf)
                  |H $ {} (:at 1657792286442) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1657792287064) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                      |T $ {} (:at 1657791135645) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657791138729) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                          |b $ {} (:at 1657791140148) (:by |B1y7Rc-Zz) (:text |css/flex) (:type :leaf)
                      |b $ {} (:at 1657792289550) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |:style) (:type :leaf)
                          |b $ {} (:at 1657792289550) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1657792289550) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |:padding) (:type :leaf)
                                  |b $ {} (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |16) (:type :leaf)
                  |T $ {} (:at 1500541010211) (:by nil) (:id |r19kz5Uxx0B-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541010211) (:by |root) (:id |HyskGcUlxRSb) (:text |div) (:type :leaf)
                      |j $ {} (:at 1500541010211) (:by nil) (:id |HJn1fqUgxABb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |Skpkzc8xgAH-) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |Bk0yG5IleRHb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |SkJeG5UxlASW) (:text |:style) (:type :leaf)
                              |j $ {} (:at 1573057112159) (:by |B1y7Rc-Zz) (:id |aQOFxPtqxf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1573057114462) (:by |B1y7Rc-Zz) (:id |LOKUa7jtag) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1573057114806) (:by |B1y7Rc-Zz) (:id |FklWvoN2NU) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1573057118311) (:by |B1y7Rc-Zz) (:id |0yUCWT959) (:text |:max-width) (:type :leaf)
                                      |j $ {} (:at 1573057120226) (:by |B1y7Rc-Zz) (:id |5TqHKSIAb) (:text |800) (:type :leaf)
                                  |r $ {} (:at 1573057121674) (:by |B1y7Rc-Zz) (:id |KtL3gEu_4) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1573057126061) (:by |B1y7Rc-Zz) (:id |KtL3gEu_4leaf) (:text |:margin) (:type :leaf)
                                      |j $ {} (:at 1573057127742) (:by |B1y7Rc-Zz) (:id |ptgfhRrcTz) (:text |:auto) (:type :leaf)
                      |r $ {} (:at 1524070753023) (:by |root) (:id |HJbFwYlS2f) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1524070753742) (:by |root) (:id |SyfKPFxrhM) (:text |div) (:type :leaf)
                          |L $ {} (:at 1524070753977) (:by |root) (:id |BJG9DFxBnz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524070754337) (:by |root) (:id |SkW9vFgS3f) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1657795263113) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657795265697) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                  |b $ {} (:at 1657795268530) (:by |B1y7Rc-Zz) (:text |css/font-fancy) (:type :leaf)
                              |j $ {} (:at 1524070764197) (:by |root) (:id |HJ-VuKgBnM) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1524070764960) (:by |root) (:id |SkeV_KlBhM) (:text |:style) (:type :leaf)
                                  |j $ {} (:at 1524070765167) (:by |root) (:id |BkNrOYlHnf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1524070765499) (:by |root) (:id |H17BOYeShG) (:text |{}) (:type :leaf)
                                      |r $ {} (:at 1524070772863) (:by |root) (:id |By6_YeS3M) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1524070774437) (:by |root) (:id |By6_YeS3Mleaf) (:text |:font-size) (:type :leaf)
                                          |j $ {} (:at 1524070786249) (:by |root) (:id |B1EROKlShG) (:text |32) (:type :leaf)
                                      |v $ {} (:at 1524070778614) (:by |root) (:id |SJXKFeHnM) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1524070781489) (:by |root) (:id |SJXKFeHnMleaf) (:text |:font-weight) (:type :leaf)
                                          |j $ {} (:at 1524070782585) (:by |root) (:id |Bk8KtgS2M) (:text |100) (:type :leaf)
                          |T $ {} (:at 1500541010211) (:by nil) (:id |r1bxMcIleASW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541010211) (:by |root) (:id |SkflGc8leCHW) (:text |<>) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |Hk4xfc8ex0BZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |Syrxf9Uex0S-) (:text |str) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by |root) (:id |Bk8ef9UggCH-) (:text "||Hello! ") (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by nil) (:id |SyvgGc8ge0Hb) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |HkdlMqIleCBZ) (:text |:name) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by |root) (:id |ryteG9Lgg0Bb) (:text |user) (:type :leaf)
                      |t $ {} (:at 1524070801446) (:by |root) (:id |rygF9Yer2G) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1524070803450) (:by |root) (:id |rygF9Yer2Gleaf) (:text |=<) (:type :leaf)
                          |j $ {} (:at 1524070804372) (:by |root) (:id |BJh5txHhz) (:text |nil) (:type :leaf)
                          |r $ {} (:at 1524070805591) (:by |root) (:id |r1p5KgH2z) (:text |16) (:type :leaf)
                      |u $ {} (:at 1524070806586) (:by |root) (:id |H1kotlHnM) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1524070807601) (:by |root) (:id |H1kotlHnMleaf) (:text |div) (:type :leaf)
                          |j $ {} (:at 1524070807801) (:by |root) (:id |rJZeiKlS2M) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524070808172) (:by |root) (:id |BkeesteS2G) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1524070882494) (:by |root) (:id |B1Zrlcer3z) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657791039862) (:by |B1y7Rc-Zz) (:id |Sye519lHhM) (:text |:class-name) (:type :leaf)
                                  |j $ {} (:at 1657791041484) (:by |B1y7Rc-Zz) (:id |rym0kqeB2z) (:text |css/row) (:type :leaf)
                          |r $ {} (:at 1524070808914) (:by |root) (:id |HkgZjKlHhz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524070810352) (:by |root) (:id |HkgZjKlHhzleaf) (:text |<>) (:type :leaf)
                              |j $ {} (:at 1524070906296) (:by |root) (:id |r1bfoFgr3z) (:text "|\"Members:") (:type :leaf)
                          |t $ {} (:at 1524070907095) (:by |root) (:id |B1e7-cgShM) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524070907693) (:by |root) (:id |B1e7-cgShMleaf) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1524071002316) (:by |root) (:id |BJeVbqlS2G) (:text |8) (:type :leaf)
                              |r $ {} (:at 1524070908955) (:by |root) (:id |HkSWqxB3f) (:text |nil) (:type :leaf)
                          |v $ {} (:at 1524070813822) (:by |root) (:id |Syl8oKlB3M) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629963869789) (:by |B1y7Rc-Zz) (:id |Syl8oKlB3Mleaf) (:text |list->) (:type :leaf)
                              |j $ {} (:at 1524070815884) (:by |root) (:id |ByeuiFeH2f) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1524070816388) (:by |root) (:id |SkujYgS3f) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1524070882494) (:by |root) (:id |BkW5yqxShM) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657791044681) (:by |B1y7Rc-Zz) (:id |Sye519lHhM) (:text |:class-name) (:type :leaf)
                                      |j $ {} (:at 1657791046248) (:by |B1y7Rc-Zz) (:id |rym0kqeB2z) (:text |css/row) (:type :leaf)
                              |r $ {} (:at 1524070817648) (:by |root) (:id |HkcsKlHhG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629963870999) (:by |B1y7Rc-Zz) (:id |BJltsYgrhz) (:text |->) (:type :leaf)
                                  |j $ {} (:at 1524070823331) (:by |root) (:id |BJe2jFlShG) (:text |members) (:type :leaf)
                                  |n $ {} (:at 1629963872061) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629963875349) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                                  |r $ {} (:at 1524070849620) (:by |root) (:id |BJ96txShz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629963879143) (:by |B1y7Rc-Zz) (:id |HkhaKeSnz) (:text |.map-pair) (:type :leaf)
                                      |j $ {} (:at 1524070854323) (:by |root) (:id |Bk-0aYxSnM) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1524070854836) (:by |root) (:id |ByRaYxH3M) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1524070855268) (:by |root) (:id |By-JCtgrnM) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1524070857242) (:by |root) (:id |S1fgRKeHhz) (:text |k) (:type :leaf)
                                              |j $ {} (:at 1524070860935) (:by |root) (:id |ByfbCYerhG) (:text |username) (:type :leaf)
                                          |r $ {} (:at 1524070862172) (:by |root) (:id |SyW8CFeS3z) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1524070862624) (:by |root) (:id |SyW8CFeS3zleaf) (:text |[]) (:type :leaf)
                                              |j $ {} (:at 1524070863576) (:by |root) (:id |SyWPAFgBhM) (:text |k) (:type :leaf)
                                              |r $ {} (:at 1524070863870) (:by |root) (:id |SyZuAKeB2z) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1524070935603) (:by |root) (:id |SJedAtxShG) (:text |div) (:type :leaf)
                                                  |b $ {} (:at 1524070935915) (:by |root) (:id |H1-eQ9eB3M) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1524070936321) (:by |root) (:id |ByegX5er2z) (:text |{}) (:type :leaf)
                                                      |j $ {} (:at 1524070941378) (:by |root) (:id |r1MSX5xrhG) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1657791065847) (:by |B1y7Rc-Zz) (:id |rJ-HX9eB3z) (:text |:class-name) (:type :leaf)
                                                          |b $ {} (:at 1657791073112) (:by |B1y7Rc-Zz) (:text |css-member-label) (:type :leaf)
                                                  |j $ {} (:at 1524070937486) (:by |root) (:id |ryM-XqxHnz) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1524070939626) (:by |root) (:id |BJGm9xB3M) (:text |<>) (:type :leaf)
                                                      |T $ {} (:at 1524070866665) (:by |root) (:id |HyzFRtlBnz) (:text |username) (:type :leaf)
                      |v $ {} (:at 1500541010211) (:by nil) (:id |BkseG9Lxx0SW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541010211) (:by |root) (:id |rkhlz5IglRr-) (:text |=<) (:type :leaf)
                          |r $ {} (:at 1500541010211) (:by |root) (:id |rkAefcIlgRrZ) (:text |nil) (:type :leaf)
                          |v $ {} (:at 1524070799028) (:by |root) (:id |S1JuFlHhM) (:text |48) (:type :leaf)
                      |x $ {} (:at 1524070749088) (:by |root) (:id |S1rwteS2z) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1524070749878) (:by |root) (:id |BJlrDYxBhz) (:text |div) (:type :leaf)
                          |L $ {} (:at 1524070750119) (:by |root) (:id |H17IvYlrnf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524070750478) (:by |root) (:id |HkMUvFeS2f) (:text |{}) (:type :leaf)
                          |T $ {} (:at 1500541010211) (:by nil) (:id |SyJ-M5IggAHb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1529343433304) (:by |root) (:id |S1gbfqIgl0Sb) (:text |button) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |HyWWz9UeeArW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkMWGqUxlRHb) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |SkmbM98xl0SZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657791001104) (:by |B1y7Rc-Zz) (:id |B1NbM9UllABW) (:text |:class-name) (:type :leaf)
                                      |b $ {} (:at 1657791002908) (:by |B1y7Rc-Zz) (:id |B1x0CTPS-m) (:text |css/button) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by nil) (:id |B1edqskgQf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1514302350497) (:by |root) (:id |r1i-McLxeArW) (:text |:on-click) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |HJxrymsN5z) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1521951456454) (:by |root) (:id |SkICb9UgeRSb) (:text |fn) (:type :leaf)
                                          |r $ {} (:at 1500541010211) (:by nil) (:id |HJ_C-q8llCSW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |HkK0W98geAHb) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1536860722489) (:by |root) (:id |By5CZ5Uxx0BZ) (:text |d!) (:type :leaf)
                                          |v $ {} (:at 1536860725934) (:by |root) (:id |hsEPi7XEze) (:type :expr)
                                            :data $ {}
                                              |j $ {} (:at 1643082863562) (:by |B1y7Rc-Zz) (:id |ozJ0cw3mNW) (:text |js/location.replace) (:type :leaf)
                                              |r $ {} (:at 1536860756712) (:by |root) (:id |Z3OcMheH26) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1536860757171) (:by |root) (:id |ATmrpIKuQ) (:text |str) (:type :leaf)
                                                  |j $ {} (:at 1536860763285) (:by |root) (:id |6AG_GtcSFl) (:text |js/location.origin) (:type :leaf)
                                                  |r $ {} (:at 1536860769456) (:by |root) (:id |8MOlbu4By) (:text "|\"?time=") (:type :leaf)
                                                  |v $ {} (:at 1536860770275) (:by |root) (:id |XEQSqqbqJR) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1536860771120) (:by |root) (:id |CS5Ag8FxL) (:text |.now) (:type :leaf)
                                                      |j $ {} (:at 1536860774958) (:by |root) (:id |fsWaUrisT) (:text |js/Date) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |Hy6bM58lg0r-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |HyC-MqUgeRHW) (:text |<>) (:type :leaf)
                                  |r $ {} (:at 1536860717367) (:by |root) (:id |BylzzcUllAHZ) (:text "|\"Refresh") (:type :leaf)
                          |b $ {} (:at 1536860703841) (:by |root) (:id |p4gwbQMJ2_) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536860705111) (:by |root) (:id |p4gwbQMJ2_leaf) (:text |=<) (:type :leaf)
                              |j $ {} (:at 1536860705914) (:by |root) (:id |Z3tNpWEr-S) (:text |16) (:type :leaf)
                              |r $ {} (:at 1536860706447) (:by |root) (:id |UcAguMFqFX) (:text |nil) (:type :leaf)
                          |j $ {} (:at 1500541010211) (:by nil) (:id |x0lrnFCadw) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1529343433304) (:by |root) (:id |S1gbfqIgl0Sb) (:text |button) (:type :leaf)
                              |j $ {} (:at 1500541010211) (:by nil) (:id |HyWWz9UeeArW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |rkMWGqUxlRHb) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1657791022865) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657791025000) (:by |B1y7Rc-Zz) (:text |:class-name) (:type :leaf)
                                      |b $ {} (:at 1657791028155) (:by |B1y7Rc-Zz) (:text |css/button) (:type :leaf)
                                  |j $ {} (:at 1500541010211) (:by nil) (:id |SkmbM98xl0SZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541010211) (:by |root) (:id |B1NbM9UllABW) (:text |:style) (:type :leaf)
                                      |b $ {} (:at 1529343455186) (:by |root) (:id |B1lNRPS-m) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1529343455629) (:by |root) (:id |SkxvJAvS-m) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1529343457115) (:by |root) (:id |SkWFyCDHZ7) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1529343457898) (:by |root) (:id |SkeYyCDBWX) (:text |:color) (:type :leaf)
                                              |j $ {} (:at 1529343458855) (:by |root) (:id |S1mckRvHWX) (:text |:red) (:type :leaf)
                                          |r $ {} (:at 1529343459158) (:by |root) (:id |rkXiyCPHbX) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1529343463728) (:by |root) (:id |rkXiyCPHbXleaf) (:text |:border-color) (:type :leaf)
                                              |j $ {} (:at 1529343464475) (:by |root) (:id |rkZeeAwSbX) (:text |:red) (:type :leaf)
                                  |r $ {} (:at 1500541010211) (:by nil) (:id |B1edqskgQf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1514302350497) (:by |root) (:id |r1i-McLxeArW) (:text |:on-click) (:type :leaf)
                                      |j $ {} (:at 1500541010211) (:by nil) (:id |HJxrymsN5z) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1521951456454) (:by |root) (:id |SkICb9UgeRSb) (:text |fn) (:type :leaf)
                                          |r $ {} (:at 1500541010211) (:by nil) (:id |HJ_C-q8llCSW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1500541010211) (:by |root) (:id |HkK0W98geAHb) (:text |e) (:type :leaf)
                                              |j $ {} (:at 1643082910642) (:by |B1y7Rc-Zz) (:id |By5CZ5Uxx0BZ) (:text |d!) (:type :leaf)
                                          |v $ {} (:at 1500541010211) (:by nil) (:id |Sks0Z9Ulg0rW) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1643082912419) (:by |B1y7Rc-Zz) (:id |HkhRb5LllArW) (:text |d!) (:type :leaf)
                                              |j $ {} (:at 1500541010211) (:by |root) (:id |BJaAW9UelCHb) (:text |:user/log-out) (:type :leaf)
                                              |r $ {} (:at 1500541010211) (:by |root) (:id |SyARWqLegRrW) (:text |nil) (:type :leaf)
                                          |x $ {} (:at 1500541010211) (:by nil) (:id |HkJJfc8glCHb) (:type :expr)
                                            :data $ {}
                                              |j $ {} (:at 1643082916507) (:by |B1y7Rc-Zz) (:id |HkWyM9Uxx0BZ) (:text |js/localStorage.removeItem) (:type :leaf)
                                              |r $ {} (:at 1500541010211) (:by nil) (:id |BJGJG5UxgCBb) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1500541010211) (:by |root) (:id |SymJG5IelASb) (:text |:storage-key) (:type :leaf)
                                                  |j $ {} (:at 1527788933957) (:by |root) (:id |HyNJG5LegRrb) (:text |config/site) (:type :leaf)
                              |r $ {} (:at 1500541010211) (:by nil) (:id |Hy6bM58lg0r-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541010211) (:by |root) (:id |HyC-MqUgeRHW) (:text |<>) (:type :leaf)
                                  |r $ {} (:at 1536860719375) (:by |root) (:id |BylzzcUllAHZ) (:text "|\"Log out") (:type :leaf)
          |css-member-label $ {} (:at 1657791073845) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1657791075479) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
              |b $ {} (:at 1657791073845) (:by |B1y7Rc-Zz) (:text |css-member-label) (:type :leaf)
              |h $ {} (:at 1657791073845) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1657791076676) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1657791076936) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1657791078555) (:by |B1y7Rc-Zz) (:text "|\"$0") (:type :leaf)
                      |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:padding) (:type :leaf)
                              |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"0 8px") (:type :leaf)
                          |h $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:border) (:type :leaf)
                              |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                                  |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"1px solid ") (:type :leaf)
                                  |h $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |hsl) (:type :leaf)
                                      |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                      |h $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
                                      |l $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |80) (:type :leaf)
                          |l $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:border-radius) (:type :leaf)
                              |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"16px") (:type :leaf)
                          |o $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:margin) (:type :leaf)
                              |b $ {} (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"0 4px") (:type :leaf)
        :ns $ {} (:at 1500541010211) (:by nil) (:id |ByC9-5Lee0rW) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541010211) (:by |root) (:id |Bk1s-qLxlAH-) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541010211) (:by |root) (:id |ryljZqUglCrZ) (:text |app.comp.profile) (:type :leaf)
            |v $ {} (:at 1500541010211) (:by nil) (:id |HkCj-9IxgABb) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541010211) (:by |root) (:id |SyknZqIgxCBW) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541010211) (:by nil) (:id |Bkx3W5LxeRHW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1629963888001) (:by |B1y7Rc-Zz) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |H1X3W58egRrZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |BJVhZcUelRrZ) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |Sk8h-5LgxRBW) (:text |hsl) (:type :leaf)
                |n $ {} (:at 1657791006084) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657791011085) (:by |B1y7Rc-Zz) (:text |respo-ui.css) (:type :leaf)
                    |b $ {} (:at 1657791011680) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1657791012512) (:by |B1y7Rc-Zz) (:text |css) (:type :leaf)
                |r $ {} (:at 1500541010211) (:by nil) (:id |Byw3Z9IexAB-) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |B1F2b98glCBb) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |rJq3Zc8xxCBb) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |HyjhZ9UeeRrb) (:text |schema) (:type :leaf)
                |v $ {} (:at 1500541010211) (:by nil) (:id |HJ33Z9Ill0rW) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1516547419785) (:by |root) (:id |H1R2Z58eeCBZ) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |HyyaWqUee0rZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by |root) (:id |SklpZqLgg0HZ) (:text |ui) (:type :leaf)
                |y $ {} (:at 1500541010211) (:by nil) (:id |HyxIgc3JG) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1542907291901) (:by |B1y7Rc-Zz) (:id |BJHi-5UxxCSZ) (:text |respo.core) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |B1LsWcIeeArW) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |HkvjWqUlgRS-) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |B1FjW9UegCSW) (:text |defcomp) (:type :leaf)
                        |n $ {} (:at 1524070875244) (:by |root) (:id |BkllkcgSnz) (:text |list->) (:type :leaf)
                        |r $ {} (:at 1500541010211) (:by |root) (:id |ryqiZqUel0B-) (:text |<>) (:type :leaf)
                        |v $ {} (:at 1500541010211) (:by |root) (:id |SkooW9UgxRrb) (:text |span) (:type :leaf)
                        |x $ {} (:at 1500541010211) (:by |root) (:id |HJ2obqIlgCB-) (:text |div) (:type :leaf)
                        |y $ {} (:at 1529343437918) (:by |root) (:id |HyaiWqIgxCrZ) (:text |button) (:type :leaf)
                |yD $ {} (:at 1657791086879) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1657791089372) (:by |B1y7Rc-Zz) (:text |respo.css) (:type :leaf)
                    |b $ {} (:at 1657791090181) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1657791090469) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1657791091849) (:by |B1y7Rc-Zz) (:text |defstyle) (:type :leaf)
                |yT $ {} (:at 1500541010211) (:by nil) (:id |ryTT-cLgxABZ) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1500541010211) (:by |root) (:id |rJJRW5UegRrW) (:text |respo.comp.space) (:type :leaf)
                    |r $ {} (:at 1500541010211) (:by |root) (:id |H1gAZc8llRrW) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541010211) (:by nil) (:id |Hy-0b58xxCrW) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1500541010211) (:by |root) (:id |H1XCWcIxlRS-) (:text |=<) (:type :leaf)
                |yj $ {} (:at 1527788936196) (:by |root) (:id |Skll5r3p1m) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1527788937835) (:by |root) (:id |rk-cB3pyQ) (:text |app.config) (:type :leaf)
                    |r $ {} (:at 1527788938747) (:by |root) (:id |H14fqShakX) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1527788939786) (:by |root) (:id |B1zm9B3T1Q) (:text |config) (:type :leaf)
        :proc $ {} (:at 1500541010211) (:by nil) (:id |rJ4RbcUxeCBZ) (:type :expr)
          :data $ {}
      |app.config $ {}
        :defs $ {}
          |dev? $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |def) (:type :leaf)
              |j $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |dev?) (:type :leaf)
              |r $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |=) (:type :leaf)
                  |j $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:text "|\"dev") (:type :leaf)
                  |r $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |get-env) (:type :leaf)
                      |j $ {} (:at 1629962915592) (:by |B1y7Rc-Zz) (:text "|\"mode") (:type :leaf)
                      |n $ {} (:at 1657790402406) (:by |B1y7Rc-Zz) (:text "|\"release") (:type :leaf)
          |site $ {} (:at 1500541255553) (:by nil) (:id |ryy9lUWg0BW) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |Syx9g8-l0B-) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |Hy-9x8beASZ) (:text |site) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |ByG9eLZlAB-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |r1Q5x8Zl0Hb) (:text |{}) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |H1w9gIblRHb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |rydqx8blRHW) (:text |:port) (:type :leaf)
                      |j $ {} (:at 1531716258172) (:by |root) (:id |rJF9g8-gCHZ) (:text |11009) (:type :leaf)
                  |t $ {} (:at 1527867502467) (:by |root) (:id |BkeUud1ye7) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1527867504737) (:by |root) (:id |BkeUud1ye7leaf) (:text |:title) (:type :leaf)
                      |j $ {} (:at 1531716180211) (:by |root) (:id |H1zKduykx7) (:text "|\"Timegrass") (:type :leaf)
                  |u $ {} (:at 1527867511986) (:by |root) (:id |r1gxKOykeQ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1527867512819) (:by |root) (:id |r1gxKOykeQleaf) (:text |:icon) (:type :leaf)
                      |j $ {} (:at 1539635717581) (:by |root) (:id |B1SY_yJx7) (:text "|\"http://cdn.tiye.me/logo/timegrass.png") (:type :leaf)
                  |v $ {} (:at 1527615278481) (:by |root) (:id |rJ-8EyzsyQ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1527615280984) (:by |root) (:id |rJ-8EyzsyQleaf) (:text |:dev-ui) (:type :leaf)
                      |j $ {} (:at 1527615358738) (:by |root) (:id |HklSKJMi1m) (:text "|\"http://localhost:8100/main.css") (:type :leaf)
                  |x $ {} (:at 1527615281625) (:by |root) (:id |BJ5NJGsyX) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1527615283846) (:by |root) (:id |BJ5NJGsyXleaf) (:text |:release-ui) (:type :leaf)
                      |j $ {} (:at 1527615339502) (:by |root) (:id |r1gz_kzjkQ) (:text "|\"http://cdn.tiye.me/favored-fonts/main.css") (:type :leaf)
                  |x5 $ {} (:at 1528009883995) (:by |root) (:id |ByxEoNG-lQ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1528009886059) (:by |root) (:id |ByxEoNG-lQleaf) (:text |:cdn-url) (:type :leaf)
                      |j $ {} (:at 1531716193037) (:by |root) (:id |BkPo4GbeQ) (:text "|\"http://cdn.tiye.me/timegrass/") (:type :leaf)
                  |yr $ {} (:at 1536733223200) (:by |B1y7Rc-Zz) (:id |Y_L9n57Mx4) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1536733224943) (:by |B1y7Rc-Zz) (:id |Y_L9n57Mx4leaf) (:text |:theme) (:type :leaf)
                      |j $ {} (:at 1536733304684) (:by |B1y7Rc-Zz) (:id |l6VJyAh0r) (:text "|\"#51C766") (:type :leaf)
                  |yt $ {} (:at 1544894540548) (:by |B1y7Rc-Zz) (:id |n3Hc5aEd1_) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544894540548) (:by |B1y7Rc-Zz) (:id |zWscR2_lMv) (:text |:storage-key) (:type :leaf)
                      |j $ {} (:at 1544894540548) (:by |B1y7Rc-Zz) (:id |K5WoQOIfh7) (:text "|\"timegrass") (:type :leaf)
                  |yv $ {} (:at 1544894534252) (:by |B1y7Rc-Zz) (:id |wYXL-qjwsa) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544894534252) (:by |B1y7Rc-Zz) (:id |B54Vqkkm7A) (:text |:storage-file) (:type :leaf)
                      |j $ {} (:at 1629966656084) (:by |B1y7Rc-Zz) (:id |F2JX7JF4oL) (:text "|\"storage.cirru") (:type :leaf)
        :ns $ {} (:at 1527788708227) (:by |root) (:id |HJghs43Tk7) (:type :expr)
          :data $ {}
            |T $ {} (:at 1527788708227) (:by |root) (:id |HJb3jEn6kX) (:text |ns) (:type :leaf)
            |j $ {} (:at 1527788708227) (:by |root) (:id |BJfhoN3pym) (:text |app.config) (:type :leaf)
        :proc $ {} (:at 1527788708227) (:by |root) (:id |ByX2iV3p1m) (:type :expr)
          :data $ {}
      |app.schema $ {}
        :defs $ {}
          |complain $ {} (:at 1533577158626) (:by |B1y7Rc-Zz) (:id |YUIQ4jCDG1) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533577160330) (:by |B1y7Rc-Zz) (:id |UXfa2YsfLj) (:text |def) (:type :leaf)
              |j $ {} (:at 1533577158626) (:by |B1y7Rc-Zz) (:id |snJtSfINNI) (:text |complain) (:type :leaf)
              |r $ {} (:at 1533577158626) (:by |B1y7Rc-Zz) (:id |Gnjj5ZTtIN) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533577161909) (:by |B1y7Rc-Zz) (:id |qx9LfgCbAA) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1533577162195) (:by |B1y7Rc-Zz) (:id |zlTsCOGMeb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533577162877) (:by |B1y7Rc-Zz) (:id |wGtuLfG7KZ) (:text |:id) (:type :leaf)
                      |j $ {} (:at 1533577163514) (:by |B1y7Rc-Zz) (:id |6UoSMxT4zT) (:text |nil) (:type :leaf)
                  |r $ {} (:at 1533577164045) (:by |B1y7Rc-Zz) (:id |eCSKEnCk1c) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533577165014) (:by |B1y7Rc-Zz) (:id |eCSKEnCk1cleaf) (:text |:text) (:type :leaf)
                      |j $ {} (:at 1533577165516) (:by |B1y7Rc-Zz) (:id |CQpLi_bCEV) (:text "|\"") (:type :leaf)
                  |v $ {} (:at 1533577167515) (:by |B1y7Rc-Zz) (:id |AK5BETngaf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533577171755) (:by |B1y7Rc-Zz) (:id |AK5BETngafleaf) (:text |:time) (:type :leaf)
                      |j $ {} (:at 1533577173198) (:by |B1y7Rc-Zz) (:id |zlEdgQ392r) (:text |nil) (:type :leaf)
          |database $ {} (:at 1500541255553) (:by nil) (:id |S1c5lLblCBZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |BkjcxUbgAH-) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |ryhqlIZxRSb) (:text |database) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |S169e8WeAH-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |SJCqxL-gASW) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by nil) (:id |SJJolIbeArb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |rkgjlUZxArb) (:text |:sessions) (:type :leaf)
                      |j $ {} (:at 1556559339169) (:by |B1y7Rc-Zz) (:id |okdSFg_ZOt) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1556559339729) (:by |B1y7Rc-Zz) (:id |u6UefIJ13S) (:text |do) (:type :leaf)
                          |L $ {} (:at 1556559341509) (:by |B1y7Rc-Zz) (:id |jr6yRHoMn7) (:text |session) (:type :leaf)
                          |T $ {} (:at 1500541255553) (:by nil) (:id |H1WsxIbeCSW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |r1GseIWx0S-) (:text |{}) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |Symjg8bg0BZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HJ4ix8beAB-) (:text |:users) (:type :leaf)
                      |j $ {} (:at 1556559336109) (:by |B1y7Rc-Zz) (:id |yTtvvxunXS) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1556559336660) (:by |B1y7Rc-Zz) (:id |5sktqlKyhw) (:text |do) (:type :leaf)
                          |L $ {} (:at 1556559337220) (:by |B1y7Rc-Zz) (:id |jrOcmpkF3E) (:text |user) (:type :leaf)
                          |T $ {} (:at 1500541255553) (:by nil) (:id |r1BieLbe0rZ) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |BJUjl8bg0SW) (:text |{}) (:type :leaf)
                  |v $ {} (:at 1533577343669) (:by |B1y7Rc-Zz) (:id |Bv9ai5RP8) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533577344937) (:by |B1y7Rc-Zz) (:id |Bv9ai5RP8leaf) (:text |:today) (:type :leaf)
                      |j $ {} (:at 1533577359121) (:by |B1y7Rc-Zz) (:id |62IB_g0WF) (:text "|\"2018-08-07") (:type :leaf)
          |note $ {} (:at 1556559675924) (:by |B1y7Rc-Zz) (:id |swySQDEdZU) (:type :expr)
            :data $ {}
              |T $ {} (:at 1556559676670) (:by |B1y7Rc-Zz) (:id |8GjW6yFVCW) (:text |def) (:type :leaf)
              |j $ {} (:at 1556559675924) (:by |B1y7Rc-Zz) (:id |vF8aYo69-t) (:text |note) (:type :leaf)
              |r $ {} (:at 1556559675924) (:by |B1y7Rc-Zz) (:id |fq6KXLP7GA) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1556559677659) (:by |B1y7Rc-Zz) (:id |a77D-ZvXWA) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1556559678017) (:by |B1y7Rc-Zz) (:id |CuoCNgp3LR) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556559678489) (:by |B1y7Rc-Zz) (:id |0z_9O-FLtV) (:text |:id) (:type :leaf)
                      |j $ {} (:at 1556559679142) (:by |B1y7Rc-Zz) (:id |n5hOfykod) (:text |nil) (:type :leaf)
                  |r $ {} (:at 1556559682476) (:by |B1y7Rc-Zz) (:id |iCXPi7Bxsc) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556559721564) (:by |B1y7Rc-Zz) (:id |iCXPi7Bxscleaf) (:text |:time) (:type :leaf)
                      |j $ {} (:at 1556559687115) (:by |B1y7Rc-Zz) (:id |461kP5Xqq) (:text |nil) (:type :leaf)
                  |t $ {} (:at 1556559721963) (:by |B1y7Rc-Zz) (:id |rPav_GpqlZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556559727507) (:by |B1y7Rc-Zz) (:id |rPav_GpqlZleaf) (:text |:updated-time) (:type :leaf)
                      |j $ {} (:at 1556559728073) (:by |B1y7Rc-Zz) (:id |SJKpOKEmu) (:text |nil) (:type :leaf)
                  |v $ {} (:at 1556559687583) (:by |B1y7Rc-Zz) (:id |I3okCZyhj) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556559689545) (:by |B1y7Rc-Zz) (:id |I3okCZyhjleaf) (:text |:text) (:type :leaf)
                      |j $ {} (:at 1556559691646) (:by |B1y7Rc-Zz) (:id |wC8R2o93xX) (:text |nil) (:type :leaf)
          |notification $ {} (:at 1500541255553) (:by nil) (:id |B156eIbeRS-) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |SJoalUbxCrZ) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |r1hTeLZe0rW) (:text |notification) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |r1pTlUZxABb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |rkRpeLbg0r-) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by nil) (:id |rJkCe8-l0S-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |B1eCgL-xCHW) (:text |:id) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |ryb0eUWx0BW) (:text |nil) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |B1MAgUZxAHb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HJQRe8WlRBb) (:text |:kind) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |HJN0xL-x0rb) (:text |nil) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by nil) (:id |SJSRxLWgCS-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |SJIClIWgCH-) (:text |:text) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |HJwCxIWxRBb) (:text |nil) (:type :leaf)
          |router $ {} (:at 1500541255553) (:by nil) (:id |BJaugUbeABb) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |SJR_lI-xRBZ) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |BJyFl8-l0B-) (:text |router) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |HyeKlU-gCHb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |HJbYl8bxCr-) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by nil) (:id |HyzFe8blRHZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |BJQtlI-x0rW) (:text |:name) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |Bk4teL-lRS-) (:text |nil) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |SyrYlL-lRBZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |S1IYxUWlCBW) (:text |:title) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |SJPKlIbeCBZ) (:text |nil) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by nil) (:id |Hy_tgU-eAHW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |rJtFx8ZeRr-) (:text |:data) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by nil) (:id |SJ9KlUZeCSb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |HJstxIbeAS-) (:text |{}) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by nil) (:id |Sk2YxIbg0Hb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |B1aYe8Wg0rW) (:text |:router) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |B1CteIWlCrZ) (:text |nil) (:type :leaf)
          |session $ {} (:at 1500541255553) (:by nil) (:id |HyiseLZlCB-) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |S1hseLZlCBW) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |rJpslIZxAHW) (:text |session) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |SkCilU-eCSZ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |B11neI-gAH-) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by nil) (:id |Byx2e8-e0rZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |rybnxUWe0BZ) (:text |:user-id) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |ryf2xIbxAHZ) (:text |nil) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |B1m2eIbxAHZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |S143xIblCrZ) (:text |:id) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |S1ShgL-l0rZ) (:text |nil) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by nil) (:id |HJU2gU-lRrb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HyPheIZxCSZ) (:text |:nickname) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |B1_hx8ZeRrW) (:text |nil) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by nil) (:id |rkthlU-gCHW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HycngIbeCrb) (:text |:router) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by nil) (:id |HyjhgL-xArW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |Hy23gUZgRH-) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1500541255553) (:by nil) (:id |H1T2eUZeAH-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |r1C3lUWgCHb) (:text |:name) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by |root) (:id |HJkalLZxArW) (:text |:home) (:type :leaf)
                          |r $ {} (:at 1500541255553) (:by nil) (:id |HyxTeL-gRSb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |B1baxLZeCr-) (:text |:data) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by |root) (:id |SyGpe8WgAHZ) (:text |nil) (:type :leaf)
                          |v $ {} (:at 1500541255553) (:by nil) (:id |rk7TlUWl0SW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |Bk4pe8ZgCBZ) (:text |:router) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by |root) (:id |rJB6l8-g0H-) (:text |nil) (:type :leaf)
                  |y $ {} (:at 1500541255553) (:by nil) (:id |SyL6eIbgRr-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1529230759501) (:by |root) (:id |HyPTeIZx0SZ) (:text |:messages) (:type :leaf)
                      |j $ {} (:at 1529230760396) (:by |root) (:id |HJGlhSh7Z7) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1529230760716) (:by |root) (:id |SyWg2HnQZQ) (:text |{}) (:type :leaf)
          |task $ {} (:at 1533577053360) (:by |B1y7Rc-Zz) (:id |OvpjqxFPnB) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533577055487) (:by |B1y7Rc-Zz) (:id |l9gT43dvct) (:text |def) (:type :leaf)
              |j $ {} (:at 1533577053360) (:by |B1y7Rc-Zz) (:id |cEo-tg9St5) (:text |task) (:type :leaf)
              |r $ {} (:at 1533577053360) (:by |B1y7Rc-Zz) (:id |ShYknc5mdK) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533577056600) (:by |B1y7Rc-Zz) (:id |BstP4Xv_aH) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1533577056868) (:by |B1y7Rc-Zz) (:id |3nkgKoaXv5) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533577057395) (:by |B1y7Rc-Zz) (:id |KC66cqL8uC) (:text |:id) (:type :leaf)
                      |j $ {} (:at 1533577058794) (:by |B1y7Rc-Zz) (:id |sjj3PabW9M) (:text |nil) (:type :leaf)
                  |r $ {} (:at 1533577059313) (:by |B1y7Rc-Zz) (:id |pe2ijKxKSa) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533577060256) (:by |B1y7Rc-Zz) (:id |pe2ijKxKSaleaf) (:text |:text) (:type :leaf)
                      |j $ {} (:at 1533577072317) (:by |B1y7Rc-Zz) (:id |MzJO997a-i) (:text "|\"") (:type :leaf)
                  |v $ {} (:at 1533577062031) (:by |B1y7Rc-Zz) (:id |nTXdZDaFDz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533695652376) (:by |root) (:id |nTXdZDaFDzleaf) (:text |:detail) (:type :leaf)
                      |j $ {} (:at 1533577069539) (:by |B1y7Rc-Zz) (:id |eUij5boyIJ) (:text "|\"") (:type :leaf)
                  |w $ {} (:at 1537291087208) (:by |root) (:id |yQO70YWABO) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537291089250) (:by |root) (:id |yQO70YWABOleaf) (:text |:pending?) (:type :leaf)
                      |j $ {} (:at 1537291090024) (:by |root) (:id |6JciyYt80Y) (:text |false) (:type :leaf)
                  |x $ {} (:at 1533577078768) (:by |B1y7Rc-Zz) (:id |dUxEA8fQI) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533577083001) (:by |B1y7Rc-Zz) (:id |dUxEA8fQIleaf) (:text |:created-time) (:type :leaf)
                      |j $ {} (:at 1533577085298) (:by |B1y7Rc-Zz) (:id |YZssCxt2dE) (:text |nil) (:type :leaf)
                  |xT $ {} (:at 1537289231306) (:by |root) (:id |rG40-rkAx) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537289233957) (:by |root) (:id |rG40-rkAxleaf) (:text |:touched-time) (:type :leaf)
                      |j $ {} (:at 1537289234605) (:by |root) (:id |tSynBTrlNA) (:text |nil) (:type :leaf)
                  |y $ {} (:at 1533577085848) (:by |B1y7Rc-Zz) (:id |kc1C1tX4fm) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1536731951502) (:by |B1y7Rc-Zz) (:id |kc1C1tX4fmleaf) (:text |:finished-time) (:type :leaf)
                      |j $ {} (:at 1533577093437) (:by |B1y7Rc-Zz) (:id |G6c2RnjHdl) (:text |nil) (:type :leaf)
                  |yT $ {} (:at 1543464503264) (:by |root) (:id |56tHZY3F1m) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1543464506023) (:by |root) (:id |56tHZY3F1mleaf) (:text |:archived-time) (:type :leaf)
                      |j $ {} (:at 1543464507072) (:by |root) (:id |xQc8n3fJYd) (:text |nil) (:type :leaf)
          |user $ {} (:at 1500541255553) (:by nil) (:id |BJKwxIbx0rZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |Hy9weU-x0SW) (:text |def) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |r1jDx8bx0SZ) (:text |user) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |rkhPxUWx0r-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |rkpPl8ZlRrW) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by nil) (:id |HkAPxIZxRB-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |ryJul8beCrb) (:text |:name) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |HJlOxIWgRBW) (:text |nil) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |HkbdlLZlRSW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |r1M_gIWxCSZ) (:text |:id) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |rk7_eIbxRB-) (:text |nil) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by nil) (:id |B14ug8bg0rb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HySOgLWeASW) (:text |:nickname) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |ByIue8Ze0B-) (:text |nil) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by nil) (:id |H1PulIbx0Hb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |SyudlUWeCBW) (:text |:avatar) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |rJYdlLbe0BW) (:text |nil) (:type :leaf)
                  |y $ {} (:at 1500541255553) (:by nil) (:id |HJcOxIbgAHW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |S1jOeUbxArW) (:text |:password) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |Hynug8bxCSZ) (:text |nil) (:type :leaf)
                  |yT $ {} (:at 1533576960965) (:by |B1y7Rc-Zz) (:id |p8dL9zTVA5) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533576964668) (:by |B1y7Rc-Zz) (:id |p8dL9zTVA5leaf) (:text |:tasks) (:type :leaf)
                      |j $ {} (:at 1533576965052) (:by |B1y7Rc-Zz) (:id |1L7YamInjl) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533576965357) (:by |B1y7Rc-Zz) (:id |4AfOA6tdi-) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1533576972099) (:by |B1y7Rc-Zz) (:id |-t5TzWGs0) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533576973496) (:by |B1y7Rc-Zz) (:id |XtiH9IS_Vxleaf) (:text |:working) (:type :leaf)
                              |j $ {} (:at 1556559670144) (:by |B1y7Rc-Zz) (:id |wTfZUweY8z) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1556559671265) (:by |B1y7Rc-Zz) (:id |F_htCj_5BY) (:text |do) (:type :leaf)
                                  |L $ {} (:at 1556559672202) (:by |B1y7Rc-Zz) (:id |memL54xbw) (:text |task) (:type :leaf)
                                  |T $ {} (:at 1533576974189) (:by |B1y7Rc-Zz) (:id |WWL0nuYTlH) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1533577704496) (:by |B1y7Rc-Zz) (:id |_sZ3MnVBw) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1533576969193) (:by |B1y7Rc-Zz) (:id |q_PK4JKOj4) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533576970382) (:by |B1y7Rc-Zz) (:id |zTMXs2ml06) (:text |:pending) (:type :leaf)
                              |j $ {} (:at 1533576970775) (:by |B1y7Rc-Zz) (:id |tI1vZvdbWk) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533577703499) (:by |B1y7Rc-Zz) (:id |Kr3YiwdVL) (:text |{}) (:type :leaf)
                          |v $ {} (:at 1533576976151) (:by |B1y7Rc-Zz) (:id |VJS645QFBz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533576987729) (:by |B1y7Rc-Zz) (:id |VJS645QFBzleaf) (:text |:finished) (:type :leaf)
                              |j $ {} (:at 1533576978294) (:by |B1y7Rc-Zz) (:id |xyibAJyt__) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533577702227) (:by |B1y7Rc-Zz) (:id |q_7BHq3HS) (:text |{}) (:type :leaf)
                  |yj $ {} (:at 1533576989687) (:by |B1y7Rc-Zz) (:id |L6Z2SZma8) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556559354780) (:by |B1y7Rc-Zz) (:id |L6Z2SZma8leaf) (:text |:notes) (:type :leaf)
                      |j $ {} (:at 1556559659965) (:by |B1y7Rc-Zz) (:id |M-VVaSuMn) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1556559660535) (:by |B1y7Rc-Zz) (:id |6W_OHJojXm) (:text |do) (:type :leaf)
                          |L $ {} (:at 1556559674861) (:by |B1y7Rc-Zz) (:id |--uI_B-DFO) (:text |note) (:type :leaf)
                          |T $ {} (:at 1533577014831) (:by |B1y7Rc-Zz) (:id |95GZob_w8l) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533577700926) (:by |B1y7Rc-Zz) (:id |C6L0Xk04V) (:text |{}) (:type :leaf)
        :ns $ {} (:at 1500541255553) (:by nil) (:id |B1Swe8bxAr-) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541255553) (:by |root) (:id |Bk8PgIbeCr-) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541255553) (:by |root) (:id |SyDDxIWeRrb) (:text |app.schema) (:type :leaf)
        :proc $ {} (:at 1500541255553) (:by nil) (:id |SJuPg8bxRH-) (:type :expr)
          :data $ {}
      |app.server $ {}
        :defs $ {}
          |*client-caches $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*client-caches) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
          |*initial-db $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |*initial-db) (:type :leaf)
              |r $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                  |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |path-exists?) (:type :leaf)
                      |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |w-log) (:type :leaf)
                          |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |storage-file) (:type :leaf)
                  |r $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                      |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                          |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text "|\"Found local EDN data") (:type :leaf)
                      |r $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |merge) (:type :leaf)
                          |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |schema/database) (:type :leaf)
                          |r $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn) (:type :leaf)
                              |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |read-file) (:type :leaf)
                                  |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |storage-file) (:type :leaf)
                  |v $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                      |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                          |j $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text "|\"Found no data") (:type :leaf)
                      |r $ {} (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |schema/database) (:type :leaf)
          |*reader-reel $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reader-reel) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel) (:type :leaf)
          |*reel $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reel) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |merge) (:type :leaf)
                  |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-schema) (:type :leaf)
                  |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:base) (:type :leaf)
                          |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*initial-db) (:type :leaf)
                      |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:db) (:type :leaf)
                          |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*initial-db) (:type :leaf)
          |dispatch! $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                  |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
              |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                          |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740588441) (:by |B1y7Rc-Zz) (:text |generate-id!) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-time) (:type :leaf)
                          |j $ {} (:at 1636978739413) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1636978745280) (:by |B1y7Rc-Zz) (:text |get-timestamp) (:type :leaf)
                              |T $ {} (:at 1636740597934) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740597934) (:by |B1y7Rc-Zz) (:text |get-time!) (:type :leaf)
                  |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                      |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                          |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"Dispatch!") (:type :leaf)
                          |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                          |v $ {} (:at 1636742813249) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1636742814472) (:by |B1y7Rc-Zz) (:text |;) (:type :leaf)
                              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                          |x $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |=) (:type :leaf)
                          |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                          |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:effect/persist) (:type :leaf)
                      |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |persist-db!) (:type :leaf)
                      |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                          |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reel) (:type :leaf)
                          |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-reducer) (:type :leaf)
                              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel) (:type :leaf)
                              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |updater) (:type :leaf)
                              |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                              |x $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                              |y $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                              |yT $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                              |yj $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-time) (:type :leaf)
                              |yr $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
          |get-backup-path! $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |get-backup-path!) (:type :leaf)
              |r $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                          |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |extract-time) (:type :leaf)
                              |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |get-time!) (:type :leaf)
                  |r $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |join-path) (:type :leaf)
                      |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |calcit-dirname) (:type :leaf)
                      |r $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text "|\"backups") (:type :leaf)
                      |v $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                          |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |:month) (:type :leaf)
                              |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                      |x $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                          |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |:day) (:type :leaf)
                              |j $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                          |r $ {} (:at 1636740409306) (:by |B1y7Rc-Zz) (:text "|\"-snapshot.cirru") (:type :leaf)
          |main! $ {} (:at 1629965278258) (:by |B1y7Rc-Zz) (:text |.!extend) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |main!) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"Running mode:") (:type :leaf)
                  |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                      |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"dev") (:type :leaf)
                      |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"release") (:type :leaf)
              |x $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |p?) (:type :leaf)
                          |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |get-env) (:type :leaf)
                              |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text "|\"port") (:type :leaf)
                      |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |port) (:type :leaf)
                          |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                              |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |some?) (:type :leaf)
                                  |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |p?) (:type :leaf)
                              |r $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |js/parseInt) (:type :leaf)
                                  |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |p?) (:type :leaf)
                              |v $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |:port) (:type :leaf)
                                  |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |config/site) (:type :leaf)
                  |r $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |run-server!) (:type :leaf)
                      |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |port) (:type :leaf)
                  |v $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                      |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                          |j $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text "|\"Server started on port:") (:type :leaf)
                          |r $ {} (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |port) (:type :leaf)
              |xT $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                  |j $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |;) (:type :leaf)
                      |j $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:text "|\"init it before doing multi-threading") (:type :leaf)
                  |r $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |identity) (:type :leaf)
                      |j $ {} (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |@*reader-reel) (:type :leaf)
              |y $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |set-interval) (:type :leaf)
                  |j $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |200) (:type :leaf)
                  |r $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                      |r $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |render-loop!) (:type :leaf)
              |yT $ {} (:at 1636740278939) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740278939) (:by |B1y7Rc-Zz) (:text |on-control-c) (:type :leaf)
                  |j $ {} (:at 1636740278939) (:by |B1y7Rc-Zz) (:text |on-exit!) (:type :leaf)
              |yj $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |set-interval) (:type :leaf)
                  |j $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |600000) (:type :leaf)
                  |r $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                      |r $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |persist-db!) (:type :leaf)
              |yv $ {} (:at 1629963056453) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740260808) (:by |B1y7Rc-Zz) (:text |set-interval) (:type :leaf)
                  |j $ {} (:at 1636740263078) (:by |B1y7Rc-Zz) (:text |60000) (:type :leaf)
                  |r $ {} (:at 1629963063796) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629963064023) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1629963064562) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                      |r $ {} (:at 1629963068961) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629963072978) (:by |B1y7Rc-Zz) (:text |set-today!) (:type :leaf)
          |on-exit! $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |on-exit!) (:type :leaf)
              |r $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |persist-db!) (:type :leaf)
              |x $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |;) (:type :leaf)
                  |j $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |r $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text "|\"exit code is...") (:type :leaf)
              |y $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |quit!) (:type :leaf)
                  |j $ {} (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |0) (:type :leaf)
          |persist-db! $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |persist-db!) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |file-content) (:type :leaf)
                          |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |format-cirru-edn) (:type :leaf)
                              |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |assoc) (:type :leaf)
                                  |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |:db) (:type :leaf)
                                      |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |@*reel) (:type :leaf)
                                  |r $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |:sessions) (:type :leaf)
                                  |v $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                      |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |storage-path) (:type :leaf)
                          |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |storage-file) (:type :leaf)
                      |r $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |backup-path) (:type :leaf)
                          |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |get-backup-path!) (:type :leaf)
                  |r $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |check-write-file!) (:type :leaf)
                      |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |storage-path) (:type :leaf)
                      |r $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |file-content) (:type :leaf)
                  |v $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |check-write-file!) (:type :leaf)
                      |j $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |backup-path) (:type :leaf)
                      |r $ {} (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |file-content) (:type :leaf)
          |reload! $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |reload!) (:type :leaf)
              |r $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text "|\"Code updated..") (:type :leaf)
              |x $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                  |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |not) (:type :leaf)
                      |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                  |r $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |raise) (:type :leaf)
                      |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text "|\"reloading only happens in dev mode") (:type :leaf)
              |y $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |clear-twig-caches!) (:type :leaf)
              |yT $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                  |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |*reel) (:type :leaf)
                  |r $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |refresh-reel) (:type :leaf)
                      |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |@*reel) (:type :leaf)
                      |r $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |@*initial-db) (:type :leaf)
                      |v $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |updater) (:type :leaf)
              |yj $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |sync-clients!) (:type :leaf)
                  |j $ {} (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |@*reader-reel) (:type :leaf)
          |render-loop! $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |render-loop!) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                  |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |not) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |identical?) (:type :leaf)
                          |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reader-reel) (:type :leaf)
                          |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel) (:type :leaf)
                  |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reader-reel) (:type :leaf)
                      |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel) (:type :leaf)
                  |v $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sync-clients!) (:type :leaf)
                      |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reader-reel) (:type :leaf)
          |run-server! $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |run-server!) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |port) (:type :leaf)
              |v $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |wss-serve!) (:type :leaf)
                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |&{}) (:type :leaf)
                      |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:port) (:type :leaf)
                      |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |port) (:type :leaf)
                  |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
                      |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |key-match) (:type :leaf)
                          |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
                          |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:connect) (:type :leaf)
                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                              |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
                                      |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:session/connect) (:type :leaf)
                                      |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
                                      |v $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                                  |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                      |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text "|\"New client.") (:type :leaf)
                          |v $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:message) (:type :leaf)
                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                                  |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |msg) (:type :leaf)
                              |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |action) (:type :leaf)
                                          |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn) (:type :leaf)
                                              |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |msg) (:type :leaf)
                                  |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |case-default) (:type :leaf)
                                      |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:kind) (:type :leaf)
                                          |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |action) (:type :leaf)
                                      |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                          |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text "|\"unknown action:") (:type :leaf)
                                          |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |action) (:type :leaf)
                                      |v $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:op) (:type :leaf)
                                          |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
                                              |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:op) (:type :leaf)
                                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |action) (:type :leaf)
                                              |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:data) (:type :leaf)
                                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |action) (:type :leaf)
                                              |v $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                          |x $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:disconnect) (:type :leaf)
                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                              |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                      |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text "|\"Client closed!") (:type :leaf)
                                  |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
                                      |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:session/disconnect) (:type :leaf)
                                      |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
                                      |v $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                          |y $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |_) (:type :leaf)
                              |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text "|\"unknown data:") (:type :leaf)
                                  |r $ {} (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
          |set-today! $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |set-today!) (:type :leaf)
              |r $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1636740425577) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |today) (:type :leaf)
                          |j $ {} (:at 1636744875019) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1636745315192) (:by |B1y7Rc-Zz) (:text |wo-log) (:type :leaf)
                              |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636744666224) (:by |B1y7Rc-Zz) (:text |format-time) (:type :leaf)
                                  |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636744679511) (:by |B1y7Rc-Zz) (:text |get-time!) (:type :leaf)
                                  |r $ {} (:at 1636744673848) (:by |B1y7Rc-Zz) (:text "|\"%Y-%m-%d") (:type :leaf)
                      |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |old-today) (:type :leaf)
                          |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |:today) (:type :leaf)
                              |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |:db) (:type :leaf)
                                  |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |@*reel) (:type :leaf)
                  |r $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                      |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |not=) (:type :leaf)
                          |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |today) (:type :leaf)
                          |r $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |old-today) (:type :leaf)
                      |r $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |dispatch!) (:type :leaf)
                          |j $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |:today) (:type :leaf)
                          |r $ {} (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |today) (:type :leaf)
                          |v $ {} (:at 1629965228632) (:by |B1y7Rc-Zz) (:text "|\"system") (:type :leaf)
          |storage-file $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |def) (:type :leaf)
              |j $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |storage-file) (:type :leaf)
              |r $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                  |j $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |empty?) (:type :leaf)
                      |j $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |calcit-dirname) (:type :leaf)
                  |r $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                      |j $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |calcit-dirname) (:type :leaf)
                      |r $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |:storage-file) (:type :leaf)
                          |j $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |config/site) (:type :leaf)
                  |v $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                      |j $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |calcit-dirname) (:type :leaf)
                      |r $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text "|\"/") (:type :leaf)
                      |v $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |:storage-file) (:type :leaf)
                          |j $ {} (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |config/site) (:type :leaf)
          |sync-clients! $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sync-clients!) (:type :leaf)
              |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel) (:type :leaf)
              |v $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |wss-each!) (:type :leaf)
                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                      |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                          |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:db) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |reel) (:type :leaf)
                              |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |records) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:records) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |reel) (:type :leaf)
                              |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |session) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |get-in) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                                      |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                                          |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:sessions) (:type :leaf)
                                          |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                              |v $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |old-store) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |or) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |get) (:type :leaf)
                                          |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |@*client-caches) (:type :leaf)
                                          |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                                      |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
                              |x $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |new-store) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |twig-container) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                                      |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |session) (:type :leaf)
                                      |v $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |records) (:type :leaf)
                              |y $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |changes) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |diff-twig) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |old-store) (:type :leaf)
                                      |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |new-store) (:type :leaf)
                                      |v $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:key) (:type :leaf)
                                              |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                          |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1636742843623) (:by |B1y7Rc-Zz) (:text |;) (:type :leaf)
                              |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                              |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |config/dev?) (:type :leaf)
                              |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text "|\"Changes for") (:type :leaf)
                                  |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text "|\":") (:type :leaf)
                                  |x $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |changes) (:type :leaf)
                                  |y $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |count) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |records) (:type :leaf)
                          |v $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                              |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |not=) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |changes) (:type :leaf)
                                  |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                              |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |wss-send!) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                                      |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |format-cirru-edn) (:type :leaf)
                                          |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                              |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:kind) (:type :leaf)
                                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:patch) (:type :leaf)
                                              |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:data) (:type :leaf)
                                                  |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |changes) (:type :leaf)
                                  |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |swap!) (:type :leaf)
                                      |j $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |*client-caches) (:type :leaf)
                                      |r $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |assoc) (:type :leaf)
                                      |v $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                                      |x $ {} (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |new-store) (:type :leaf)
              |x $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |new-twig-loop!) (:type :leaf)
        :ns $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
            |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |ns) (:type :leaf)
            |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.server) (:type :leaf)
            |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
              :data $ {}
                |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:require) (:type :leaf)
                |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.schema) (:type :leaf)
                    |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |schema) (:type :leaf)
                |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.updater) (:type :leaf)
                    |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |updater) (:type :leaf)
                |x $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |cumulo-reel.core) (:type :leaf)
                    |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-reducer) (:type :leaf)
                        |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |refresh-reel) (:type :leaf)
                        |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-schema) (:type :leaf)
                |yj $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.config) (:type :leaf)
                    |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config) (:type :leaf)
                |yx $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.twig.container) (:type :leaf)
                    |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |twig-container) (:type :leaf)
                |yy $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |recollect.diff) (:type :leaf)
                    |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |diff-twig) (:type :leaf)
                |yyL $ {} (:at 1636740371960) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss.core) (:type :leaf)
                    |j $ {} (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636740371960) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss-serve!) (:type :leaf)
                        |j $ {} (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss-send!) (:type :leaf)
                        |r $ {} (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss-each!) (:type :leaf)
                |yyj $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |recollect.twig) (:type :leaf)
                    |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |new-twig-loop!) (:type :leaf)
                        |j $ {} (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |clear-twig-caches!) (:type :leaf)
                |yyx $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |app.$meta) (:type :leaf)
                    |j $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit-dirname) (:type :leaf)
                |yyy $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.fs) (:type :leaf)
                    |j $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |path-exists?) (:type :leaf)
                        |j $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |check-write-file!) (:type :leaf)
                |yyyT $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.time) (:type :leaf)
                    |j $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |set-interval) (:type :leaf)
                |yyyj $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.date) (:type :leaf)
                    |j $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |get-time!) (:type :leaf)
                        |j $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |extract-time) (:type :leaf)
                        |r $ {} (:at 1636744663311) (:by |B1y7Rc-Zz) (:text |format-time) (:type :leaf)
                        |v $ {} (:at 1636978751109) (:by |B1y7Rc-Zz) (:text |get-timestamp) (:type :leaf)
                |yyyr $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.path) (:type :leaf)
                    |j $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |join-path) (:type :leaf)
      |app.style $ {}
        :defs $ {}
          |button $ {} (:at 1533696351058) (:by |root) (:id |fe82tosdBX) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533696352712) (:by |root) (:id |osxZU9_chN) (:text |def) (:type :leaf)
              |j $ {} (:at 1533696351058) (:by |root) (:id |BnmgbBIXK7) (:text |button) (:type :leaf)
              |r $ {} (:at 1533696351058) (:by |root) (:id |0__XiZZqR_) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533696354618) (:by |root) (:id |DFZSxh9d-k) (:text |merge) (:type :leaf)
                  |j $ {} (:at 1533696355914) (:by |root) (:id |FSJCTS8geR) (:text |ui/button) (:type :leaf)
                  |r $ {} (:at 1533696356374) (:by |root) (:id |MnxZ8xihcn) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533696356687) (:by |root) (:id |AQShDjtB1i) (:text |{}) (:type :leaf)
                      |j $ {} (:at 1533696356973) (:by |root) (:id |wjLSasoFYx) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533696360113) (:by |root) (:id |Y0lVqTA2OR) (:text |:background-color) (:type :leaf)
                          |j $ {} (:at 1533696360834) (:by |root) (:id |f49N4dVB3G) (:text |:white) (:type :leaf)
          |link $ {} (:at 1519367966237) (:by |root) (:id |B1eU7P4avf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1519367970413) (:by |root) (:id |SyWUQP46vz) (:text |def) (:type :leaf)
              |j $ {} (:at 1519367966237) (:by |root) (:id |H1MImvEaPG) (:text |link) (:type :leaf)
              |r $ {} (:at 1519367966237) (:by |root) (:id |BkX8QDNpPM) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1519367974187) (:by |root) (:id |HJAQwV6Df) (:text |{}) (:type :leaf)
                  |j $ {} (:at 1519367974501) (:by |root) (:id |rkQAmw4pPG) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1519367980887) (:by |root) (:id |B1M0QDE6Dz) (:text |:text-decoration) (:type :leaf)
                      |j $ {} (:at 1519367984967) (:by |root) (:id |BkQSEDNTwf) (:text |:underline) (:type :leaf)
                  |r $ {} (:at 1519367985371) (:by |root) (:id |S1QYVP4pPG) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1519367998049) (:by |root) (:id |S1QYVP4pPGleaf) (:text |:cursor) (:type :leaf)
                      |j $ {} (:at 1519367996458) (:by |root) (:id |HkzfrDEaPf) (:text |:pointer) (:type :leaf)
                  |v $ {} (:at 1519368028360) (:by |root) (:id |Bk-Nvv4aPz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1519368029579) (:by |root) (:id |Bk-Nvv4aPzleaf) (:text |:color) (:type :leaf)
                      |j $ {} (:at 1519368031142) (:by |root) (:id |SylwPvNTvf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1519368031562) (:by |root) (:id |rygIwwV6Df) (:text |hsl) (:type :leaf)
                          |j $ {} (:at 1519368032307) (:by |root) (:id |rkx_wPNTPz) (:text |240) (:type :leaf)
                          |r $ {} (:at 1519368032737) (:by |root) (:id |B1NOvw4pwM) (:text |80) (:type :leaf)
                          |v $ {} (:at 1519368033240) (:by |root) (:id |By-FwDEaPG) (:text |80) (:type :leaf)
                  |x $ {} (:at 1519368217607) (:by |root) (:id |SkfXu46vf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1519368219848) (:by |root) (:id |SkfXu46vfleaf) (:text |:font-family) (:type :leaf)
                      |j $ {} (:at 1519368227853) (:by |root) (:id |rJWVXuV6wG) (:text |ui/font-fancy) (:type :leaf)
        :ns $ {} (:at 1519367963533) (:by |root) (:id |HygVXDNTvf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1519367963533) (:by |root) (:id |rkbV7wETvz) (:text |ns) (:type :leaf)
            |j $ {} (:at 1519367963533) (:by |root) (:id |BkfNmPV6wG) (:text |app.style) (:type :leaf)
            |r $ {} (:at 1519368036923) (:by |root) (:id |S1fTDw4pDf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1519368038192) (:by |root) (:id |BJWpwDNavz) (:text |:require) (:type :leaf)
                |j $ {} (:at 1519368038575) (:by |root) (:id |S1ydDETwM) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1519368038764) (:by |root) (:id |BJSADvEpPz) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1629963906360) (:by |B1y7Rc-Zz) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1519368041713) (:by |root) (:id |rkXWdwEavf) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1519368041918) (:by |root) (:id |H1GzdP46Pz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1519368042785) (:by |root) (:id |HkWf_w46wf) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1519368043289) (:by |root) (:id |ryxQdvEpDM) (:text |hsl) (:type :leaf)
                |r $ {} (:at 1519368236509) (:by |root) (:id |HJZV4OEavG) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1519368236979) (:by |root) (:id |HJZV4OEavGleaf) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1519368258261) (:by |root) (:id |BJ-HV_VTPz) (:text |respo-ui.core) (:type :leaf)
                    |r $ {} (:at 1519368241627) (:by |root) (:id |Bkm_4d4pvG) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1519368242073) (:by |root) (:id |SyW5N_46wG) (:text |ui) (:type :leaf)
        :proc $ {} (:at 1519367963533) (:by |root) (:id |SyXN7PVpPM) (:type :expr)
          :data $ {}
      |app.twig.container $ {}
        :defs $ {}
          |twig-container $ {} (:at 1500541255553) (:by nil) (:id |ByY-eUZeAr-) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629964851786) (:by |B1y7Rc-Zz) (:id |BJ5bxLZlRBZ) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |Hkibe8Wl0S-) (:text |twig-container) (:type :leaf)
              |n $ {} (:at 1500541255553) (:by nil) (:id |Sk-PI_qp1z) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |Hkzzg8WlRBZ) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |ByXzxL-lCH-) (:text |session) (:type :leaf)
                  |r $ {} (:at 1507828952210) (:by |root) (:id |rklw6NmanW) (:text |records) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |ryl38_qaJf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |ByHzl8bgCSZ) (:text |let) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by nil) (:id |HyUflIWgRrZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by nil) (:id |HywGl8-gCHW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |H1_MlIbg0SW) (:text |logged-in?) (:type :leaf)
                          |j $ {} (:at 1500541255553) (:by nil) (:id |B1FGxLWeRHW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |ry5fe8ZlRS-) (:text |some?) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by nil) (:id |BkiGlU-e0B-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |BJnGeLZlAHb) (:text |:user-id) (:type :leaf)
                                  |j $ {} (:at 1500541255553) (:by |root) (:id |HJTMlI-eAB-) (:text |session) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by nil) (:id |rJ0GgLZlCS-) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |BkkQeLZlCHW) (:text |router) (:type :leaf)
                          |j $ {} (:at 1500541255553) (:by nil) (:id |SkemlIWxRBb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |SJWmlLWeRHZ) (:text |:router) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by |root) (:id |HJzXlLWxAHZ) (:text |session) (:type :leaf)
                      |r $ {} (:at 1507830626848) (:by |root) (:id |ryowoQp2W) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1507830630278) (:by |root) (:id |ryowoQp2Wleaf) (:text |base-data) (:type :leaf)
                          |j $ {} (:at 1507830631302) (:by |root) (:id |r1lyujmp3b) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1507830631896) (:by |root) (:id |By1djQTnb) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1507830632113) (:by |root) (:id |ryGxdimT2-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1507830641027) (:by |root) (:id |Sy-guiXp2b) (:text |:logged-in?) (:type :leaf)
                                  |j $ {} (:at 1507830639219) (:by |root) (:id |ByBusQ6hW) (:text |logged-in?) (:type :leaf)
                              |n $ {} (:at 1507830674443) (:by |root) (:id |ByecqsQ6nW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1507830677551) (:by |root) (:id |ByecqsQ6nWleaf) (:text |:session) (:type :leaf)
                                  |j $ {} (:at 1507830679311) (:by |root) (:id |BJlA5oXpn-) (:text |session) (:type :leaf)
                              |v $ {} (:at 1507830649968) (:by |root) (:id |SyxMtsm62Z) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1507830655148) (:by |root) (:id |SyxMtsm62Zleaf) (:text |:reel-length) (:type :leaf)
                                  |j $ {} (:at 1507830655987) (:by |root) (:id |B1xuKj7p3-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1507830657551) (:by |root) (:id |S1dKjma2Z) (:text |count) (:type :leaf)
                                      |j $ {} (:at 1507830658789) (:by |root) (:id |HkgcFsXT3b) (:text |records) (:type :leaf)
                      |v $ {} (:at 1533695786503) (:by |root) (:id |mhXQFmAWtB) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695787128) (:by |root) (:id |mhXQFmAWtBleaf) (:text |user) (:type :leaf)
                          |j $ {} (:at 1500541255553) (:by nil) (:id |SFTN9gI4tH) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |HkXVeL-l0Sb) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by |root) (:id |rJ4Nx8WeCrb) (:text |db) (:type :leaf)
                              |r $ {} (:at 1500541255553) (:by nil) (:id |HkrVgLZg0B-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |ByIEeLbxCHb) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1500541255553) (:by |root) (:id |H1v4xIWxArZ) (:text |:users) (:type :leaf)
                                  |r $ {} (:at 1500541255553) (:by nil) (:id |HJ_VxL-xRr-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541255553) (:by |root) (:id |rJYNgUbgCBb) (:text |:user-id) (:type :leaf)
                                      |j $ {} (:at 1500541255553) (:by |root) (:id |ryqNeLZeCHb) (:text |session) (:type :leaf)
                  |r $ {} (:at 1507830661017) (:by |root) (:id |BkxpKj76h-) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1507830661999) (:by |root) (:id |H1W6KoQ6hZ) (:text |merge) (:type :leaf)
                      |L $ {} (:at 1507830664014) (:by |root) (:id |rJVCFjmp2b) (:text |base-data) (:type :leaf)
                      |T $ {} (:at 1500541255553) (:by nil) (:id |HJQmlU-e0rW) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |rJVmgLZlAr-) (:text |if) (:type :leaf)
                          |j $ {} (:at 1500541255553) (:by |root) (:id |r1S7gUZlArb) (:text |logged-in?) (:type :leaf)
                          |r $ {} (:at 1500541255553) (:by nil) (:id |HJUQxIbx0rZ) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |rJPQl8ZgCHb) (:text |{}) (:type :leaf)
                              |v $ {} (:at 1500541255553) (:by nil) (:id |B107eU-lCHZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |Hy1VxUbeCS-) (:text |:user) (:type :leaf)
                                  |j $ {} (:at 1500541255553) (:by nil) (:id |HJlNxUbx0r-) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1500541255553) (:by |root) (:id |SyZVxIZeCS-) (:text |twig-user) (:type :leaf)
                                      |j $ {} (:at 1533695794137) (:by |root) (:id |l-9yP5tyrA) (:text |user) (:type :leaf)
                              |x $ {} (:at 1500541255553) (:by nil) (:id |SJsEe8ZgCBZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |HJ2EeUWe0SZ) (:text |:router) (:type :leaf)
                                  |j $ {} (:at 1524070628251) (:by |root) (:id |ryh1FgBhM) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1524070634499) (:by |root) (:id |rJbWgKgBhz) (:text |assoc) (:type :leaf)
                                      |T $ {} (:at 1500541255553) (:by |root) (:id |BJaEl8ZxCS-) (:text |router) (:type :leaf)
                                      |j $ {} (:at 1524070635855) (:by |root) (:id |rygQeYlH3G) (:text |:data) (:type :leaf)
                                      |r $ {} (:at 1524070636122) (:by |root) (:id |r1VNlFlHnz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629965163777) (:by |B1y7Rc-Zz) (:id |BJ74eFlB2z) (:text |case-default) (:type :leaf)
                                          |j $ {} (:at 1524070641804) (:by |root) (:id |HybcgKxB2G) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1524070642493) (:by |root) (:id |S1g9etlS2M) (:text |:name) (:type :leaf)
                                              |j $ {} (:at 1524070643351) (:by |root) (:id |HJilKgSnf) (:text |router) (:type :leaf)
                                          |l $ {} (:at 1629965164374) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629965164374) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                          |n $ {} (:at 1525108994160) (:by |root) (:id |BJxq-bAE6z) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1525108995413) (:by |root) (:id |BJxq-bAE6zleaf) (:text |:home) (:type :leaf)
                                              |j $ {} (:at 1533576741494) (:by |B1y7Rc-Zz) (:id |eRIrjodOwP) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1533576741874) (:by |B1y7Rc-Zz) (:id |IjbXGUAZGM) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1545874586802) (:by |root) (:id |Fav55dmRyV) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1545874587585) (:by |root) (:id |wPJGF7Ncx) (:text |:tasks) (:type :leaf)
                                                      |j $ {} (:at 1545874587955) (:by |root) (:id |9-OnGApG-A) (:type :expr)
                                                        :data $ {}
                                                          |5 $ {} (:at 1545874782200) (:by |root) (:id |qw-d_jkZ3) (:text |get-in) (:type :leaf)
                                                          |D $ {} (:at 1545874779504) (:by |root) (:id |6UBUuAwV3) (:text |user) (:type :leaf)
                                                          |T $ {} (:at 1545874783210) (:by |root) (:id |aT1bkNmykt) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1545874783774) (:by |root) (:id |fnF2ZZM45C) (:text |[]) (:type :leaf)
                                                              |L $ {} (:at 1545874785228) (:by |root) (:id |2uTIEH57Fd) (:text |:tasks) (:type :leaf)
                                                              |T $ {} (:at 1545874592185) (:by |root) (:id |BPja35ugxE) (:text |:working) (:type :leaf)
                                          |p $ {} (:at 1537204723306) (:by |root) (:id |WGfADecNiu) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1537204725206) (:by |root) (:id |WGfADecNiuleaf) (:text |:history) (:type :leaf)
                                              |j $ {} (:at 1537205110905) (:by |root) (:id |jUQf6lAOLM) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1537205111309) (:by |root) (:id |3bxDuMeDOv) (:text |{}) (:type :leaf)
                                                  |b $ {} (:at 1545876025762) (:by |root) (:id |rm-s1D4PT) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1545876026720) (:by |root) (:id |rm-s1D4PTleaf) (:text |:week) (:type :leaf)
                                                      |j $ {} (:at 1545876034584) (:by |root) (:id |S6rX5vfHf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1545876034296) (:by |root) (:id |seYf7TTnGR) (:text |:data) (:type :leaf)
                                                          |j $ {} (:at 1545876035843) (:by |root) (:id |p5c2CumvNe) (:text |router) (:type :leaf)
                                                  |j $ {} (:at 1545874595691) (:by |root) (:id |ubUgE_qtU) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1545874596355) (:by |root) (:id |sFdK-Xjvqr) (:text |:tasks) (:type :leaf)
                                                      |b $ {} (:at 1545875014253) (:by |root) (:id |fX5B2yItU) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1545875020580) (:by |root) (:id |q_4GTrwOI) (:text |twig-tasks-by-week) (:type :leaf)
                                                          |L $ {} (:at 1545875563139) (:by |root) (:id |n_-rNw1Hd) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1545875564605) (:by |root) (:id |JaSVr7iMM) (:text |:data) (:type :leaf)
                                                              |j $ {} (:at 1545875565438) (:by |root) (:id |lywsx3NfOr) (:text |router) (:type :leaf)
                                                          |T $ {} (:at 1545874839326) (:by |root) (:id |KZFX5gQKvm) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1545874839326) (:by |root) (:id |H2Qenc6F0W) (:text |get-in) (:type :leaf)
                                                              |j $ {} (:at 1545874839326) (:by |root) (:id |Gmu5H2B-rI) (:text |user) (:type :leaf)
                                                              |r $ {} (:at 1545874839326) (:by |root) (:id |Uf5kDLmRNa) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1545874839326) (:by |root) (:id |0jmj1hON1w) (:text |[]) (:type :leaf)
                                                                  |j $ {} (:at 1545874839326) (:by |root) (:id |DHVpekAA1k) (:text |:tasks) (:type :leaf)
                                                                  |r $ {} (:at 1545874850527) (:by |root) (:id |gnQXC73DGY) (:text |:finished) (:type :leaf)
                                          |q $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |FyC4hj2P5u) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |8W8h4_8R6y) (:text |:notes) (:type :leaf)
                                              |j $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |T-ry3hXzxB) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1591602627694) (:by |B1y7Rc-Zz) (:id |12yBGV9W3Q) (:text |twig-notes-by-month) (:type :leaf)
                                                  |j $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |EYQVp-AKoX) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |F5wFOlmmeO) (:text |:data) (:type :leaf)
                                                      |j $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |Tb6xXDAHub) (:text |router) (:type :leaf)
                                                  |r $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |c_gTDK5Bn_) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |uYYTiGsrVN) (:text |:notes) (:type :leaf)
                                                      |j $ {} (:at 1556645341376) (:by |B1y7Rc-Zz) (:id |yjmVF6bJEG) (:text |user) (:type :leaf)
                                          |r $ {} (:at 1524070643948) (:by |root) (:id |Bke3gKgB3z) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1524070646898) (:by |root) (:id |Skb6etxBhG) (:text |:profile) (:type :leaf)
                                              |j $ {} (:at 1524070654495) (:by |root) (:id |ryLWFernz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1524070662619) (:by |root) (:id |B1zJ-teBnM) (:text |twig-members) (:type :leaf)
                                                  |j $ {} (:at 1524070665615) (:by |root) (:id |B1MzFxBhz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1524070670477) (:by |root) (:id |Bk-MYxShG) (:text |:sessions) (:type :leaf)
                                                      |j $ {} (:at 1524070672563) (:by |root) (:id |SyPMtxH2G) (:text |db) (:type :leaf)
                                                  |r $ {} (:at 1524070673171) (:by |root) (:id |HyWFMYxB3G) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1524070674094) (:by |root) (:id |HyWFMYxB3Gleaf) (:text |:users) (:type :leaf)
                                                      |j $ {} (:at 1524070675166) (:by |root) (:id |HyVcztlS2f) (:text |db) (:type :leaf)
                              |y $ {} (:at 1523120222572) (:by |root) (:id |H1DPud8iG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1523120223864) (:by |root) (:id |H1DPud8iGleaf) (:text |:count) (:type :leaf)
                                  |j $ {} (:at 1523120229051) (:by |root) (:id |rygpP_OUif) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1523120230136) (:by |root) (:id |HkaDOd8iM) (:text |count) (:type :leaf)
                                      |j $ {} (:at 1523120230346) (:by |root) (:id |SJrAwd_8oM) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1523120232122) (:by |root) (:id |rJVAwd_8if) (:text |:sessions) (:type :leaf)
                                          |j $ {} (:at 1523120232500) (:by |root) (:id |BJreO_d8of) (:text |db) (:type :leaf)
                              |yT $ {} (:at 1524279105545) (:by |root) (:id |rycrDmO2f) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1524279110147) (:by |root) (:id |rycrDmO2fleaf) (:text |:color) (:type :leaf)
                                  |j $ {} (:at 1524279111422) (:by |root) (:id |Hyx1LP7d3z) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636741089272) (:by |B1y7Rc-Zz) (:id |ryJUwQd2f) (:text |rand-hex-color!) (:type :leaf)
                              |yj $ {} (:at 1533694823527) (:by |root) (:id |JJXdRiynZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533694824502) (:by |root) (:id |JJXdRiynZleaf) (:text |:today) (:type :leaf)
                                  |j $ {} (:at 1533694825249) (:by |root) (:id |fcXRHjhEmZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1533694826546) (:by |root) (:id |nWkvdoExU) (:text |:today) (:type :leaf)
                                      |j $ {} (:at 1533694827006) (:by |root) (:id |OqKZqC79eO) (:text |db) (:type :leaf)
                          |v $ {} (:at 1636740975512) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1636740975982) (:by |B1y7Rc-Zz) (:id |ryg7ssXahb) (:text |{}) (:type :leaf)
          |twig-members $ {} (:at 1524070676419) (:by |root) (:id |SkZ3zYeShG) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629964963101) (:by |B1y7Rc-Zz) (:id |rJG3GYxHhG) (:text |defn) (:type :leaf)
              |j $ {} (:at 1524070676419) (:by |root) (:id |rymhzFxH3G) (:text |twig-members) (:type :leaf)
              |r $ {} (:at 1524070676419) (:by |root) (:id |Hy4nzKerhG) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1524070680419) (:by |root) (:id |rygJQFlrnf) (:text |sessions) (:type :leaf)
                  |j $ {} (:at 1524070708862) (:by |root) (:id |r1-QYlSnf) (:text |users) (:type :leaf)
              |v $ {} (:at 1524070683188) (:by |root) (:id |SJxXQKlB2M) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629964949805) (:by |B1y7Rc-Zz) (:id |SJxXQKlB2Mleaf) (:text |->) (:type :leaf)
                  |j $ {} (:at 1629964946832) (:by |B1y7Rc-Zz) (:id |rk7F7txBnM) (:text |sessions) (:type :leaf)
                  |r $ {} (:at 1524070693234) (:by |root) (:id |ByNpmYeS3M) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964955610) (:by |B1y7Rc-Zz) (:id |Hy7T7KeH2z) (:text |.map-kv) (:type :leaf)
                      |j $ {} (:at 1524070696021) (:by |root) (:id |rkZg4tlH2M) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1524070696334) (:by |root) (:id |r1gxVYgrnz) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1524070696681) (:by |root) (:id |HyW4Flr2f) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524070697507) (:by |root) (:id |BJX-4YgrhG) (:text |k) (:type :leaf)
                              |j $ {} (:at 1524070699358) (:by |root) (:id |r1z4tgS3M) (:text |session) (:type :leaf)
                          |r $ {} (:at 1524070700350) (:by |root) (:id |B1WEVFer3z) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1524070701520) (:by |root) (:id |B1WEVFer3zleaf) (:text |[]) (:type :leaf)
                              |j $ {} (:at 1524070702142) (:by |root) (:id |BJxLVtgH3f) (:text |k) (:type :leaf)
                              |r $ {} (:at 1524070702968) (:by |root) (:id |Hklw4FlH2G) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1524070705127) (:by |root) (:id |SkPEYxB3M) (:text |get-in) (:type :leaf)
                                  |j $ {} (:at 1524070714762) (:by |root) (:id |BklA4FeS3G) (:text |users) (:type :leaf)
                                  |r $ {} (:at 1524070715457) (:by |root) (:id |rJZ7BKlBnf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1524070716715) (:by |root) (:id |r1eXHKxS2z) (:text |[]) (:type :leaf)
                                      |j $ {} (:at 1524070717257) (:by |root) (:id |HkMHSYxB2G) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1524070720176) (:by |root) (:id |SkbrHKeBhM) (:text |:user-id) (:type :leaf)
                                          |j $ {} (:at 1524070722292) (:by |root) (:id |rJMOBteH3f) (:text |session) (:type :leaf)
                                      |r $ {} (:at 1524070725752) (:by |root) (:id |r1ZiBKeB3G) (:text |:name) (:type :leaf)
          |twig-notes-by-month $ {} (:at 1556559792532) (:by |B1y7Rc-Zz) (:id |xCSSfrC2_k) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629964905512) (:by |B1y7Rc-Zz) (:id |-6L9_flI5u) (:text |defn) (:type :leaf)
              |j $ {} (:at 1556559792532) (:by |B1y7Rc-Zz) (:id |5941SRV7SB) (:text |twig-notes-by-month) (:type :leaf)
              |r $ {} (:at 1556559792532) (:by |B1y7Rc-Zz) (:id |5igiZ0N9CB) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1556559796177) (:by |B1y7Rc-Zz) (:id |yV4l3r3nQN) (:text |data) (:type :leaf)
                  |j $ {} (:at 1556559800263) (:by |B1y7Rc-Zz) (:id |mgUtqWtWM) (:text |notes) (:type :leaf)
              |v $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |BX6T6PypNv) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |quu55IbYtz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |-5WLuVYUGr) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |JEUX5-chy3) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |kB-6NgR8rc) (:text |year) (:type :leaf)
                          |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |rIVtioQX9G) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |SQD775Kbu3) (:text |:year) (:type :leaf)
                              |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |9KpHv_he-v) (:text |data) (:type :leaf)
                      |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |G6kFzLN9_H) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1591602632762) (:by |B1y7Rc-Zz) (:id |kexX5TM5H9) (:text |month) (:type :leaf)
                          |j $ {} (:at 1636776738471) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1636776739361) (:by |B1y7Rc-Zz) (:text |inc) (:type :leaf)
                              |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |8IXiRMQ2pb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1591602630909) (:by |B1y7Rc-Zz) (:id |lG4M7R3G8C) (:text |:month) (:type :leaf)
                                  |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |Q0-_3qDqbX) (:text |data) (:type :leaf)
                  |r $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |tabMGJL0cF) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964916685) (:by |B1y7Rc-Zz) (:id |SgiS9I8xYJ) (:text |->) (:type :leaf)
                      |j $ {} (:at 1556559812936) (:by |B1y7Rc-Zz) (:id |hBTVpC9ZBP4) (:text |notes) (:type :leaf)
                      |n $ {} (:at 1629966414694) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629966427520) (:by |B1y7Rc-Zz) (:text |.to-map) (:type :leaf)
                      |r $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |V6roaLPkpO6) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636795771090) (:by |B1y7Rc-Zz) (:id |xZL_sUxJZiO) (:text |.filter-kv) (:type :leaf)
                          |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |DdFGYc3Pv8b) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |vSs1jo3yKrA) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |eGYWOIH_rd1) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |rPuoQcjrlMF) (:text |k) (:type :leaf)
                                  |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |3Ntm20pgUnL) (:text |task) (:type :leaf)
                              |r $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |d74PGN_Pog0) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |QG4uN8ESYeR) (:text |let) (:type :leaf)
                                  |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |Sb1GEYIlV-K) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |or5cN40PnjM) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |AdX1X-J499h) (:text |time) (:type :leaf)
                                          |b $ {} (:at 1636742251533) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1636742256379) (:by |B1y7Rc-Zz) (:text |extract-time) (:type :leaf)
                                              |T $ {} (:at 1636978697063) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1636978697775) (:by |B1y7Rc-Zz) (:text |::) (:type :leaf)
                                                  |L $ {} (:at 1636978698784) (:by |B1y7Rc-Zz) (:text |Date) (:type :leaf)
                                                  |T $ {} (:at 1636742249593) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1636742924417) (:by |B1y7Rc-Zz) (:text |:time) (:type :leaf)
                                                      |j $ {} (:at 1636742925081) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                                  |r $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |GJDu5-emm31) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |k8Y7PfGZbWp) (:text |and) (:type :leaf)
                                      |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |dln9dCBKyCi) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |w0EwNEsFQIX) (:text |=) (:type :leaf)
                                          |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |yZ9ikVfchOz) (:text |year) (:type :leaf)
                                          |r $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |z945A6xGATs) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1636742260289) (:by |B1y7Rc-Zz) (:id |46jgEhABtC8) (:text |:year) (:type :leaf)
                                              |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |4wzhFa7mBIh) (:text |time) (:type :leaf)
                                      |r $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |6-kf0KwSJRH) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |qQJjlxC3W4K) (:text |=) (:type :leaf)
                                          |j $ {} (:at 1591602637721) (:by |B1y7Rc-Zz) (:id |j-XalSb3X8Y) (:text |month) (:type :leaf)
                                          |r $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |BagcAfOoI0t) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1636742262120) (:by |B1y7Rc-Zz) (:id |_RNFMjrAKA_) (:text |:month) (:type :leaf)
                                              |j $ {} (:at 1556559806649) (:by |B1y7Rc-Zz) (:id |qK6D-pjROZ2) (:text |time) (:type :leaf)
          |twig-tasks-by-week $ {} (:at 1545875030704) (:by |root) (:id |JOiy57gOEQ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629964873098) (:by |B1y7Rc-Zz) (:id |VHev2lq7aM) (:text |defn) (:type :leaf)
              |j $ {} (:at 1545875030704) (:by |root) (:id |MpOmGvLeHe) (:text |twig-tasks-by-week) (:type :leaf)
              |r $ {} (:at 1545875030704) (:by |root) (:id |7GkGN4QI_P) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1556558301372) (:by |B1y7Rc-Zz) (:id |bZhvgbhBDj) (:text |data) (:type :leaf)
                  |T $ {} (:at 1545875035613) (:by |root) (:id |JVmRrAMsmb) (:text |tasks) (:type :leaf)
              |v $ {} (:at 1556558285703) (:by |B1y7Rc-Zz) (:id |HVrtDWVTE) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1556558286319) (:by |B1y7Rc-Zz) (:id |JuCYBqr9N3) (:text |let) (:type :leaf)
                  |L $ {} (:at 1556558286582) (:by |B1y7Rc-Zz) (:id |8Q4XU08Uk) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1556558302808) (:by |B1y7Rc-Zz) (:id |2d2g0DCUhY) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1609150260118) (:by |B1y7Rc-Zz) (:id |2d2g0DCUhYleaf) (:text |filter-year) (:type :leaf)
                          |j $ {} (:at 1556558307323) (:by |B1y7Rc-Zz) (:id |1lv5FbQMuq) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556558309546) (:by |B1y7Rc-Zz) (:id |MGNOZ6Dh61) (:text |:year) (:type :leaf)
                              |j $ {} (:at 1556558310460) (:by |B1y7Rc-Zz) (:id |pY15JnKYdM) (:text |data) (:type :leaf)
                      |T $ {} (:at 1556558286729) (:by |B1y7Rc-Zz) (:id |7F-Ae9Js3y) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1609150262443) (:by |B1y7Rc-Zz) (:id |e2qMTsjdby) (:text |filter-week) (:type :leaf)
                          |j $ {} (:at 1636777002296) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1636777003679) (:by |B1y7Rc-Zz) (:text |dec) (:type :leaf)
                              |T $ {} (:at 1556558291677) (:by |B1y7Rc-Zz) (:id |dMIM5pYUF) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556558293727) (:by |B1y7Rc-Zz) (:id |STexh0-q3) (:text |:week) (:type :leaf)
                                  |j $ {} (:at 1556558299667) (:by |B1y7Rc-Zz) (:id |jSRwUq4whI) (:text |data) (:type :leaf)
                      |j $ {} (:at 1636795122118) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636795128406) (:by |B1y7Rc-Zz) (:text |start-time) (:type :leaf)
                          |b $ {} (:at 1677347602945) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677347608617) (:by |B1y7Rc-Zz) (:text |parse-time) (:type :leaf)
                              |b $ {} (:at 1677347617528) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677347618744) (:by |B1y7Rc-Zz) (:text |:start) (:type :leaf)
                                  |b $ {} (:at 1677347619441) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
                              |h $ {} (:at 1677347641260) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z") (:type :leaf)
                      |r $ {} (:at 1636795202529) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636795204076) (:by |B1y7Rc-Zz) (:text |end-time) (:type :leaf)
                          |j $ {} (:at 1677347650412) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677347650412) (:by |B1y7Rc-Zz) (:text |parse-time) (:type :leaf)
                              |b $ {} (:at 1677347650412) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677347652678) (:by |B1y7Rc-Zz) (:text |:end) (:type :leaf)
                                  |b $ {} (:at 1677347650412) (:by |B1y7Rc-Zz) (:text |data) (:type :leaf)
                              |h $ {} (:at 1677347650412) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z") (:type :leaf)
                  |P $ {} (:at 1636795034496) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1577815250174) (:by |B1y7Rc-Zz) (:text |;) (:type :leaf)
                      |T $ {} (:at 1636795036643) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                      |b $ {} (:at 1636795312166) (:by |B1y7Rc-Zz) (:text "|\"start:") (:type :leaf)
                      |j $ {} (:at 1677347816427) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1677347817690) (:by |B1y7Rc-Zz) (:text |format-time) (:type :leaf)
                          |T $ {} (:at 1636795150546) (:by |B1y7Rc-Zz) (:text |start-time) (:type :leaf)
                          |b $ {} (:at 1677347819531) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z") (:type :leaf)
                  |R $ {} (:at 1636795304066) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1577815247136) (:by |B1y7Rc-Zz) (:text |;) (:type :leaf)
                      |T $ {} (:at 1636795305017) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                      |j $ {} (:at 1636795306295) (:by |B1y7Rc-Zz) (:text "|\"end ") (:type :leaf)
                      |r $ {} (:at 1677347820326) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1677347820912) (:by |B1y7Rc-Zz) (:text |format-time) (:type :leaf)
                          |T $ {} (:at 1636795307204) (:by |B1y7Rc-Zz) (:text |end-time) (:type :leaf)
                          |b $ {} (:at 1677347822670) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z") (:type :leaf)
                  |T $ {} (:at 1545875036376) (:by |root) (:id |NXJq8xRIlP) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964875761) (:by |B1y7Rc-Zz) (:id |NXJq8xRIlPleaf) (:text |->) (:type :leaf)
                      |j $ {} (:at 1545875047639) (:by |root) (:id |VIsEXOtmL) (:text |tasks) (:type :leaf)
                      |l $ {} (:at 1636116052984) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636116054168) (:by |B1y7Rc-Zz) (:text |.to-map) (:type :leaf)
                      |n $ {} (:at 1545875579751) (:by |root) (:id |1ZjDI1PulJ) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1636795620594) (:by |B1y7Rc-Zz) (:id |5pi1i3i1V) (:text |.filter-kv) (:type :leaf)
                          |j $ {} (:at 1545875583153) (:by |root) (:id |ObxSIQn8T1) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1545875583536) (:by |root) (:id |dL5t-fRHgW) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1545875583794) (:by |root) (:id |lMFbOjVkoD) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964936274) (:by |B1y7Rc-Zz) (:text |k) (:type :leaf)
                                  |j $ {} (:at 1629964937202) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                              |r $ {} (:at 1556558319302) (:by |B1y7Rc-Zz) (:id |I3dhv73cHl) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1556558319932) (:by |B1y7Rc-Zz) (:id |sf3dpEBbV) (:text |let) (:type :leaf)
                                  |b $ {} (:at 1636795178443) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636795179249) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1636795180276) (:by |B1y7Rc-Zz) (:text |t) (:type :leaf)
                                          |j $ {} (:at 1636795180925) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677349621393) (:by |B1y7Rc-Zz) (:text |&map:get) (:type :leaf)
                                              |j $ {} (:at 1636795180925) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                                              |n $ {} (:at 1677349622092) (:by |B1y7Rc-Zz) (:text |:finished-time) (:type :leaf)
                                  |n $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |and) (:type :leaf)
                                      |j $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677349597392) (:by |B1y7Rc-Zz) (:text |&>) (:type :leaf)
                                          |j $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |t) (:type :leaf)
                                          |r $ {} (:at 1677347901058) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1677349722188) (:by |B1y7Rc-Zz) (:text |get-timestamp) (:type :leaf)
                                              |T $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |start-time) (:type :leaf)
                                      |r $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677349599828) (:by |B1y7Rc-Zz) (:text |&<) (:type :leaf)
                                          |j $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |t) (:type :leaf)
                                          |r $ {} (:at 1677347906057) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1677349726551) (:by |B1y7Rc-Zz) (:text |get-timestamp) (:type :leaf)
                                              |T $ {} (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |end-time) (:type :leaf)
          |week-millis $ {} (:at 1636795220485) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1636795220485) (:by |B1y7Rc-Zz) (:text |def) (:type :leaf)
              |j $ {} (:at 1636795220485) (:by |B1y7Rc-Zz) (:text |week-millis) (:type :leaf)
              |r $ {} (:at 1636795220485) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1636795221949) (:by |B1y7Rc-Zz) (:text |*) (:type :leaf)
                  |j $ {} (:at 1636795222876) (:by |B1y7Rc-Zz) (:text |7) (:type :leaf)
                  |r $ {} (:at 1636795224902) (:by |B1y7Rc-Zz) (:text |24) (:type :leaf)
                  |v $ {} (:at 1636795227299) (:by |B1y7Rc-Zz) (:text |3600) (:type :leaf)
                  |x $ {} (:at 1636795229576) (:by |B1y7Rc-Zz) (:text |1000) (:type :leaf)
        :ns $ {} (:at 1500541255553) (:by nil) (:id |rkSex8bg0S-) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541255553) (:by |root) (:id |SkIleLblAr-) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541255553) (:by |root) (:id |ByDelU-eRSZ) (:text |app.twig.container) (:type :leaf)
            |r $ {} (:at 1500541255553) (:by nil) (:id |HkOlxUZlRH-) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541255553) (:by |root) (:id |r1txeIZlRSb) (:text |:require) (:type :leaf)
                |r $ {} (:at 1500541255553) (:by nil) (:id |rkZblUblRHb) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |SkM-lUbxASW) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541255553) (:by |root) (:id |SJX-gU-e0SW) (:text |app.twig.user) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |Hy4We8bgCB-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541255553) (:by nil) (:id |r1SbgUbg0S-) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1500541255553) (:by |root) (:id |BJ8-x8WeCH-) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1500541255553) (:by |root) (:id |BJv-e8beRSW) (:text |twig-user) (:type :leaf)
                |v $ {} (:at 1636741084827) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636741084827) (:by |B1y7Rc-Zz) (:text |calcit.std.rand) (:type :leaf)
                    |j $ {} (:at 1636741084827) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636741084827) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636741084827) (:by |B1y7Rc-Zz) (:text |rand-hex-color!) (:type :leaf)
                |x $ {} (:at 1636742232008) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636742232281) (:by |B1y7Rc-Zz) (:text |calcit.std.date) (:type :leaf)
                    |j $ {} (:at 1636742234045) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636742234309) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |D $ {} (:at 1636978703305) (:by |B1y7Rc-Zz) (:text |Date) (:type :leaf)
                        |T $ {} (:at 1636742238334) (:by |B1y7Rc-Zz) (:text |extract-time) (:type :leaf)
                        |j $ {} (:at 1636742243311) (:by |B1y7Rc-Zz) (:text |get-time!) (:type :leaf)
                        |r $ {} (:at 1636795040733) (:by |B1y7Rc-Zz) (:text |from-ywd) (:type :leaf)
                        |v $ {} (:at 1636795718683) (:by |B1y7Rc-Zz) (:text |from-ymd) (:type :leaf)
                        |w $ {} (:at 1677347613109) (:by |B1y7Rc-Zz) (:text |parse-time) (:type :leaf)
                        |x $ {} (:at 1677349717123) (:by |B1y7Rc-Zz) (:text |format-time) (:type :leaf)
                        |y $ {} (:at 1677349719187) (:by |B1y7Rc-Zz) (:text |get-timestamp) (:type :leaf)
        :proc $ {} (:at 1500541255553) (:by nil) (:id |H1ubxLZx0SZ) (:type :expr)
          :data $ {}
      |app.twig.user $ {}
        :defs $ {}
          |twig-user $ {} (:at 1500541255553) (:by nil) (:id |SJxcQeIWxASZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629964865516) (:by |B1y7Rc-Zz) (:id |S1ZqXeIblCH-) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |ByzcXgUblRBW) (:text |twig-user) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |ByuqXg8ZxArZ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |SJY57eLWxAH-) (:text |user) (:type :leaf)
              |v $ {} (:at 1533695768423) (:by |root) (:id |34F4K5kSoW) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1533695769181) (:by |root) (:id |0e8E2X05s) (:text |->) (:type :leaf)
                  |L $ {} (:at 1533695769812) (:by |root) (:id |R1eLo_m7dm) (:text |user) (:type :leaf)
                  |T $ {} (:at 1500541255553) (:by nil) (:id |Hk99QgIbxAHW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |Bkjc7xUZlCSW) (:text |dissoc) (:type :leaf)
                      |r $ {} (:at 1500541255553) (:by |root) (:id |rk6cXgLZx0HZ) (:text |:password) (:type :leaf)
                  |j $ {} (:at 1533695770442) (:by |root) (:id |WncYMTp2N4) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533695772271) (:by |root) (:id |WncYMTp2N4leaf) (:text |dissoc) (:type :leaf)
                      |j $ {} (:at 1533695774102) (:by |root) (:id |w11-Hcab6Z) (:text |:tasks) (:type :leaf)
        :ns $ {} (:at 1500541255553) (:by nil) (:id |rJ7t7eU-lRrZ) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541255553) (:by |root) (:id |rkVF7xUWgASZ) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541255553) (:by |root) (:id |rkrFQxUZxRBb) (:text |app.twig.user) (:type :leaf)
            |r $ {} (:at 1500541255553) (:by nil) (:id |By8K7xL-eArW) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541255553) (:by |root) (:id |HyvKQx8WlRHW) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541255553) (:by nil) (:id |rJdKQgIbxCSW) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |rkKF7eLWgCHb) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1542907313856) (:by |B1y7Rc-Zz) (:id |BJcKXg8WgRH-) (:text |recollect.twig) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |H1iKQx8WeASZ) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541255553) (:by nil) (:id |S1nYXeLbxRHW) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1500541255553) (:by |root) (:id |Sk6Kmx8blRHW) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1511004273474) (:by |root) (:id |HJCKmgIZg0BW) (:text |deftwig) (:type :leaf)
        :proc $ {} (:at 1500541255553) (:by nil) (:id |H1JqQxLblABb) (:type :expr)
          :data $ {}
      |app.updater $ {}
        :defs $ {}
          |updater $ {} (:at 1500541255553) (:by nil) (:id |Hk7nmeIbx0SZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |SkV3Qe8WlRHb) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |Hkrn7xI-gASZ) (:text |updater) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |rk82mlUZxRB-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |Byw3XlIZg0B-) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |H1_hme8WxAr-) (:text |op) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |ByY2QgLbxArZ) (:text |op-data) (:type :leaf)
                  |v $ {} (:at 1517930722619) (:by |root) (:id |H1537x8-gABW) (:text |sid) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |Hksn7xL-gASW) (:text |op-id) (:type :leaf)
                  |y $ {} (:at 1500541255553) (:by |root) (:id |SJ22mx8ZeRBb) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1517930695338) (:by |root) (:id |rykROrP8f) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1517930698044) (:by |root) (:id |rklROHw8z) (:text |let) (:type :leaf)
                  |T $ {} (:at 1517930701054) (:by |root) (:id |SJlBRdSPUz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1517930698683) (:by |root) (:id |H1X0OSD8f) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1517930699996) (:by |root) (:id |r14RdHv8M) (:text |f) (:type :leaf)
                          |T $ {} (:at 1500541255553) (:by nil) (:id |BJ6hmlU-lASb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964835656) (:by |B1y7Rc-Zz) (:id |SJ0h7eUbg0rb) (:text |case-default) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by |root) (:id |HJyaXeU-gRBZ) (:text |op) (:type :leaf)
                              |l $ {} (:at 1629964836454) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964836454) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                                  |j $ {} (:at 1629964836454) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964836454) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                      |j $ {} (:at 1629964836454) (:by |B1y7Rc-Zz) (:text "|\"Unknown op:") (:type :leaf)
                                      |r $ {} (:at 1629964836454) (:by |B1y7Rc-Zz) (:text |op) (:type :leaf)
                                  |r $ {} (:at 1629964840488) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964840740) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                      |j $ {} (:at 1629964842276) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964842896) (:by |B1y7Rc-Zz) (:text |&) (:type :leaf)
                                          |j $ {} (:at 1629964843640) (:by |B1y7Rc-Zz) (:text |args) (:type :leaf)
                                      |r $ {} (:at 1629964844812) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                              |n $ {} (:at 1533694732714) (:by |root) (:id |Etd__pFot) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533694734051) (:by |root) (:id |Etd__pFotleaf) (:text |:today) (:type :leaf)
                                  |j $ {} (:at 1533695729184) (:by |root) (:id |4MT2Sk-BrG) (:text |misc/set-today) (:type :leaf)
                              |r $ {} (:at 1500541255553) (:by nil) (:id |HygpXe8Ze0Sb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |rJZ6XxLWe0HW) (:text |:session/connect) (:type :leaf)
                                  |j $ {} (:at 1517930788022) (:by |root) (:id |SksmtSP8z) (:text |session/connect) (:type :leaf)
                              |v $ {} (:at 1500541255553) (:by nil) (:id |r1KaQgU-xRrW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |B1cTQlUWlASW) (:text |:session/disconnect) (:type :leaf)
                                  |j $ {} (:at 1517930783929) (:by |root) (:id |r1_7FBPIM) (:text |session/disconnect) (:type :leaf)
                              |w $ {} (:at 1529231445104) (:by |root) (:id |Bkx1qO2QZm) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1529231483623) (:by |root) (:id |rJ-aIO2Q-Qleaf) (:text |:session/remove-message) (:type :leaf)
                                  |j $ {} (:at 1529231491015) (:by |root) (:id |BkrY_h7ZQ) (:text |session/remove-message) (:type :leaf)
                              |x $ {} (:at 1500541255553) (:by nil) (:id |r1fCQxUWe0rb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |Bkm0mgLZx0S-) (:text |:user/log-in) (:type :leaf)
                                  |j $ {} (:at 1517930780888) (:by |root) (:id |BkBmtrD8M) (:text |user/log-in) (:type :leaf)
                              |y $ {} (:at 1500541255553) (:by nil) (:id |rksRmlIZlCSW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |ry3Cmx8blABb) (:text |:user/sign-up) (:type :leaf)
                                  |j $ {} (:at 1517930777757) (:by |root) (:id |Bke-QtSDUM) (:text |user/sign-up) (:type :leaf)
                              |yT $ {} (:at 1500541255553) (:by nil) (:id |B1V1Nl8Zx0BZ) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |H1rJ4eIblRr-) (:text |:user/log-out) (:type :leaf)
                                  |j $ {} (:at 1500541255553) (:by |root) (:id |ryvkVgIbg0rW) (:text |user/log-out) (:type :leaf)
                              |yr $ {} (:at 1500541255553) (:by nil) (:id |HyUe4gLbxCr-) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1500541255553) (:by |root) (:id |BJDxEeLWgASb) (:text |:router/change) (:type :leaf)
                                  |j $ {} (:at 1500541255553) (:by |root) (:id |r1tl4lIZx0SW) (:text |router/change) (:type :leaf)
                              |yt $ {} (:at 1533695444543) (:by |root) (:id |ys2ZDdJJe) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533695460991) (:by |root) (:id |ys2ZDdJJeleaf) (:text |:task/create-working) (:type :leaf)
                                  |j $ {} (:at 1533695533318) (:by |root) (:id |2lhCXLYSQ) (:text |task/create-working) (:type :leaf)
                              |yu $ {} (:at 1533695444543) (:by |root) (:id |cItRtQ8E2P) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533696022787) (:by |root) (:id |ys2ZDdJJeleaf) (:text |:task/remove-working) (:type :leaf)
                                  |j $ {} (:at 1533696025051) (:by |root) (:id |2lhCXLYSQ) (:text |task/remove-working) (:type :leaf)
                              |yuT $ {} (:at 1533695444543) (:by |root) (:id |_S7ALI-Ie) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533781388982) (:by |root) (:id |ys2ZDdJJeleaf) (:text |:task/finish-working) (:type :leaf)
                                  |j $ {} (:at 1533781384988) (:by |root) (:id |2lhCXLYSQ) (:text |task/finish-working) (:type :leaf)
                              |yuj $ {} (:at 1533695444543) (:by |root) (:id |JRACSQcfu) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536901052455) (:by |B1y7Rc-Zz) (:id |ys2ZDdJJeleaf) (:text |:task/update-working) (:type :leaf)
                                  |j $ {} (:at 1536901161360) (:by |B1y7Rc-Zz) (:id |2lhCXLYSQ) (:text |task/update-working) (:type :leaf)
                              |yur $ {} (:at 1533695444543) (:by |root) (:id |2FqgfVaeiL) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537289186226) (:by |root) (:id |ys2ZDdJJeleaf) (:text |:task/touch-working) (:type :leaf)
                                  |j $ {} (:at 1537289195874) (:by |root) (:id |2lhCXLYSQ) (:text |task/touch-working) (:type :leaf)
                              |yut $ {} (:at 1533695444543) (:by |root) (:id |UKyA_6yUYW) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538156879537) (:by |root) (:id |ys2ZDdJJeleaf) (:text |:task/put-back) (:type :leaf)
                                  |j $ {} (:at 1538156883755) (:by |root) (:id |2lhCXLYSQ) (:text |task/put-back) (:type :leaf)
                              |yuv $ {} (:at 1533695444543) (:by |root) (:id |1BCskhjNw) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537290352972) (:by |root) (:id |ys2ZDdJJeleaf) (:text |:task/pend) (:type :leaf)
                                  |j $ {} (:at 1537290355655) (:by |root) (:id |2lhCXLYSQ) (:text |task/pend) (:type :leaf)
                              |yux $ {} (:at 1556646988378) (:by |B1y7Rc-Zz) (:id |QH1sPt1MKA) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556646990315) (:by |B1y7Rc-Zz) (:id |QH1sPt1MKAleaf) (:text |:note/add) (:type :leaf)
                                  |j $ {} (:at 1556646999208) (:by |B1y7Rc-Zz) (:id |pSpAEG_Jq) (:text |note/add-note) (:type :leaf)
                              |yuy $ {} (:at 1556646988378) (:by |B1y7Rc-Zz) (:id |zCqZCOGHpM) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647151611) (:by |B1y7Rc-Zz) (:id |QH1sPt1MKAleaf) (:text |:note/edit) (:type :leaf)
                                  |j $ {} (:at 1556647153575) (:by |B1y7Rc-Zz) (:id |pSpAEG_Jq) (:text |note/edit-note) (:type :leaf)
                              |yuyT $ {} (:at 1556646988378) (:by |B1y7Rc-Zz) (:id |Ual1KqArI) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647217813) (:by |B1y7Rc-Zz) (:id |QH1sPt1MKAleaf) (:text |:note/remove) (:type :leaf)
                                  |j $ {} (:at 1556647227734) (:by |B1y7Rc-Zz) (:id |pSpAEG_Jq) (:text |note/remove-note) (:type :leaf)
                  |j $ {} (:at 1517930704255) (:by |root) (:id |HyxOAOHDUM) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1517930704937) (:by |root) (:id |HyxOAOHDUMleaf) (:text |f) (:type :leaf)
                      |j $ {} (:at 1517930706635) (:by |root) (:id |SkcC_SvLM) (:text |db) (:type :leaf)
                      |r $ {} (:at 1517930709018) (:by |root) (:id |HJ2RdSPUf) (:text |op-data) (:type :leaf)
                      |v $ {} (:at 1517930725426) (:by |root) (:id |r1JytHD8G) (:text |sid) (:type :leaf)
                      |x $ {} (:at 1517930717948) (:by |root) (:id |S1z4JKSDLG) (:text |op-id) (:type :leaf)
                      |y $ {} (:at 1517930719120) (:by |root) (:id |BkGLkYrDUz) (:text |op-time) (:type :leaf)
        :ns $ {} (:at 1500541255553) (:by nil) (:id |BJR97lLZlRSZ) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541255553) (:by |root) (:id |ry1omxI-g0r-) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541255553) (:by |root) (:id |ryxjmgIZgArZ) (:text |app.updater) (:type :leaf)
            |r $ {} (:at 1500541255553) (:by nil) (:id |SJ-o7eUZlRBZ) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541255553) (:by |root) (:id |SkGj7eUZgCrZ) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541255553) (:by nil) (:id |S1momeUWgRHb) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |rkEsmx8Wg0rZ) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541255553) (:by |root) (:id |BySiQgUZxCS-) (:text |app.updater.session) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |S1Ismg8blABW) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541255553) (:by |root) (:id |BkDsme8-l0H-) (:text |session) (:type :leaf)
                |r $ {} (:at 1500541255553) (:by nil) (:id |S1uoQlLWe0HW) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |r1FoXeI-e0BZ) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541255553) (:by |root) (:id |H19oXxI-xAH-) (:text |app.updater.user) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |HyojQg8WeCH-) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541255553) (:by |root) (:id |SJ2o7eIWeAHb) (:text |user) (:type :leaf)
                |v $ {} (:at 1500541255553) (:by nil) (:id |BkTsXxUbg0S-) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |Sy0sXlLbxRBb) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541255553) (:by |root) (:id |B1J3XgIZe0SZ) (:text |app.updater.router) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |rkgnmg8-x0BZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541255553) (:by |root) (:id |HkZ3XxLZlCSW) (:text |router) (:type :leaf)
                |w $ {} (:at 1500541255553) (:by nil) (:id |UauqAFqD2) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |Sy0sXlLbxRBb) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1533695731942) (:by |root) (:id |B1J3XgIZe0SZ) (:text |app.updater.misc) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |rkgnmg8-x0BZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1533695733624) (:by |root) (:id |HkZ3XxLZlCSW) (:text |misc) (:type :leaf)
                |x $ {} (:at 1500541255553) (:by nil) (:id |QWtv44N-S) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |Sy0sXlLbxRBb) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1533695514977) (:by |root) (:id |B1J3XgIZe0SZ) (:text |app.updater.task) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |rkgnmg8-x0BZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1533695516470) (:by |root) (:id |HkZ3XxLZlCSW) (:text |task) (:type :leaf)
                |xT $ {} (:at 1500541255553) (:by nil) (:id |nvBqavRfA) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |Sy0sXlLbxRBb) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1556646980717) (:by |B1y7Rc-Zz) (:id |B1J3XgIZe0SZ) (:text |app.updater.note) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |rkgnmg8-x0BZ) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1556646983410) (:by |B1y7Rc-Zz) (:id |HkZ3XxLZlCSW) (:text |note) (:type :leaf)
                |y $ {} (:at 1529231005993) (:by |root) (:id |Ske8iUnXWm) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1529231006285) (:by |root) (:id |Ske8iUnXWmleaf) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1529231007723) (:by |root) (:id |BJXLiI2Qb7) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1529231008972) (:by |root) (:id |SyGuiI3QWX) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1529231009860) (:by |root) (:id |HkZtj8hXZQ) (:text |schema) (:type :leaf)
                |yT $ {} (:at 1529231108810) (:by |root) (:id |rkpWDhQW7) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1529231110305) (:by |root) (:id |rkpWDhQW7leaf) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1529231113905) (:by |root) (:id |HyE0bP3mWQ) (:text |respo-message.updater) (:type :leaf)
                    |r $ {} (:at 1529231114617) (:by |root) (:id |SJ7GMD27bX) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1529231114849) (:by |root) (:id |rJG7Mvn7Z7) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1529231116379) (:by |root) (:id |B1-XMPnX-7) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1529231118760) (:by |root) (:id |SyWVGD2XZQ) (:text |update-messages) (:type :leaf)
        :proc $ {} (:at 1500541255553) (:by nil) (:id |SkfhmgLbxRHb) (:type :expr)
          :data $ {}
      |app.updater.misc $ {}
        :defs $ {}
          |set-today $ {} (:at 1533694961037) (:by |root) (:id |UWQbzMVJIz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533694961037) (:by |root) (:id |XuR8jBh7Xa) (:text |defn) (:type :leaf)
              |j $ {} (:at 1533694961037) (:by |root) (:id |yJR5OlaXDU) (:text |set-today) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |y5m76kR-RD) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |HJv1Wl8WgRBZ) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |Hk_JWeLZg0Hb) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |ryYkWl8Wx0SZ) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |HyqJ-l8-lCBZ) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |r1jk-lIWlASb) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1533694962836) (:by |root) (:id |CG4IHuJ1G) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533694963737) (:by |root) (:id |CG4IHuJ1Gleaf) (:text |assoc) (:type :leaf)
                  |j $ {} (:at 1533694964744) (:by |root) (:id |XXpu1s9zCX) (:text |db) (:type :leaf)
                  |r $ {} (:at 1533694966047) (:by |root) (:id |mqkPwjDT1v) (:text |:today) (:type :leaf)
                  |v $ {} (:at 1533694968858) (:by |root) (:id |rTXnkyK58L) (:text |op-data) (:type :leaf)
        :ns $ {} (:at 1533695484743) (:by |root) (:id |aPLfIBVeMV) (:type :expr)
          :data $ {}
            |T $ {} (:at 1533695484743) (:by |root) (:id |waA1ZhKUj9) (:text |ns) (:type :leaf)
            |j $ {} (:at 1533695484743) (:by |root) (:id |wsBASq0I8L) (:text |app.updater.misc) (:type :leaf)
        :proc $ {} (:at 1533695484743) (:by |root) (:id |dTUbwp8JgS) (:type :expr)
          :data $ {}
      |app.updater.note $ {}
        :defs $ {}
          |add-note $ {} (:at 1556647000095) (:by |B1y7Rc-Zz) (:id |zAfVorA9Mb) (:type :expr)
            :data $ {}
              |T $ {} (:at 1556647000095) (:by |B1y7Rc-Zz) (:id |xbhgmjow6M) (:text |defn) (:type :leaf)
              |j $ {} (:at 1556647000095) (:by |B1y7Rc-Zz) (:id |4Rr7pWwKxP) (:text |add-note) (:type :leaf)
              |r $ {} (:at 1556647007806) (:by |B1y7Rc-Zz) (:id |Aacqnsykud) (:type :expr)
                :data $ {}
                  |j $ {} (:at 1556647007806) (:by |B1y7Rc-Zz) (:id |75_fHqZQB3) (:text |db) (:type :leaf)
                  |r $ {} (:at 1556647007806) (:by |B1y7Rc-Zz) (:id |hpiDU-w-7L) (:text |op-data) (:type :leaf)
                  |v $ {} (:at 1556647007806) (:by |B1y7Rc-Zz) (:id |D_xtwNPk6q) (:text |sid) (:type :leaf)
                  |x $ {} (:at 1556647007806) (:by |B1y7Rc-Zz) (:id |orDEnTG53f) (:text |op-id) (:type :leaf)
                  |y $ {} (:at 1556647007806) (:by |B1y7Rc-Zz) (:id |v6V2oDOK65) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1556647010025) (:by |B1y7Rc-Zz) (:id |MiUB14cVrr) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1556647010527) (:by |B1y7Rc-Zz) (:id |MiUB14cVrrleaf) (:text |let) (:type :leaf)
                  |j $ {} (:at 1556647010835) (:by |B1y7Rc-Zz) (:id |47TwAS_Ivo) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556647011433) (:by |B1y7Rc-Zz) (:id |h7jkerzo3i) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647013865) (:by |B1y7Rc-Zz) (:id |wk3LEW8J6D) (:text |session) (:type :leaf)
                          |j $ {} (:at 1556647014507) (:by |B1y7Rc-Zz) (:id |EO79RvnEW0) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647015337) (:by |B1y7Rc-Zz) (:id |RkWUZd9Uhx) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1556647016153) (:by |B1y7Rc-Zz) (:id |K_1Cez6yn6) (:text |db) (:type :leaf)
                              |r $ {} (:at 1556647017074) (:by |B1y7Rc-Zz) (:id |GOuo6cVZ7N) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647017266) (:by |B1y7Rc-Zz) (:id |XvyLXTlBQe) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1556647019573) (:by |B1y7Rc-Zz) (:id |Ya-WhHKOr6) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1556647020559) (:by |B1y7Rc-Zz) (:id |tzuAISJ_sl) (:text |sid) (:type :leaf)
                      |j $ {} (:at 1556647021931) (:by |B1y7Rc-Zz) (:id |_s4XkKrvA) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647023394) (:by |B1y7Rc-Zz) (:id |_s4XkKrvAleaf) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1556647024021) (:by |B1y7Rc-Zz) (:id |S_MsR9l7rs) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647024917) (:by |B1y7Rc-Zz) (:id |lI6nO7WKbO) (:text |:user-id) (:type :leaf)
                              |j $ {} (:at 1556647026130) (:by |B1y7Rc-Zz) (:id |oxaYTObyoH) (:text |session) (:type :leaf)
                      |r $ {} (:at 1556647033713) (:by |B1y7Rc-Zz) (:id |0NgKtj7VE) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647035088) (:by |B1y7Rc-Zz) (:id |0NgKtj7VEleaf) (:text |new-note) (:type :leaf)
                          |j $ {} (:at 1556647037210) (:by |B1y7Rc-Zz) (:id |huIjQt5uJF) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647038941) (:by |B1y7Rc-Zz) (:id |t8-eulfQz) (:text |merge) (:type :leaf)
                              |j $ {} (:at 1556647041281) (:by |B1y7Rc-Zz) (:id |QiqPVvk3Um) (:text |schema/note) (:type :leaf)
                              |r $ {} (:at 1556647042348) (:by |B1y7Rc-Zz) (:id |tXhzcHlzQg) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647042657) (:by |B1y7Rc-Zz) (:id |-Gwb81BsM) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1556647051519) (:by |B1y7Rc-Zz) (:id |tQFpmN_5R) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556647052027) (:by |B1y7Rc-Zz) (:id |rhwtLMw8G) (:text |:id) (:type :leaf)
                                      |j $ {} (:at 1556647052967) (:by |B1y7Rc-Zz) (:id |cBYY2ruY0p) (:text |op-id) (:type :leaf)
                                  |r $ {} (:at 1556647053438) (:by |B1y7Rc-Zz) (:id |QeY1kJIeAr) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556647054112) (:by |B1y7Rc-Zz) (:id |QeY1kJIeArleaf) (:text |:time) (:type :leaf)
                                      |j $ {} (:at 1556647056390) (:by |B1y7Rc-Zz) (:id |MH2w1KxZ1V) (:text |op-time) (:type :leaf)
                                  |v $ {} (:at 1556647057354) (:by |B1y7Rc-Zz) (:id |b9Ek316LYb) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1556647058447) (:by |B1y7Rc-Zz) (:id |b9Ek316LYbleaf) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1556647066310) (:by |B1y7Rc-Zz) (:id |7t8ArUhHMA) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1556647093722) (:by |B1y7Rc-Zz) (:id |qFV4LAsa7) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556647096025) (:by |B1y7Rc-Zz) (:id |qFV4LAsa7leaf) (:text |assoc-in) (:type :leaf)
                      |j $ {} (:at 1556647096666) (:by |B1y7Rc-Zz) (:id |8Zz9X9OLD0) (:text |db) (:type :leaf)
                      |r $ {} (:at 1556647097097) (:by |B1y7Rc-Zz) (:id |WquKf1BW0x) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647097328) (:by |B1y7Rc-Zz) (:id |PFhVUqhZ7M) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1556647099676) (:by |B1y7Rc-Zz) (:id |fzcEuomF1) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1556647101901) (:by |B1y7Rc-Zz) (:id |CDmJnGHhow) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1556647103015) (:by |B1y7Rc-Zz) (:id |D3qzCV9w4T) (:text |:notes) (:type :leaf)
                          |x $ {} (:at 1556647105399) (:by |B1y7Rc-Zz) (:id |YBniYki4G7) (:text |op-id) (:type :leaf)
                      |v $ {} (:at 1556647109263) (:by |B1y7Rc-Zz) (:id |Gw7hVxS-2s) (:text |new-note) (:type :leaf)
          |edit-note $ {} (:at 1556647154286) (:by |B1y7Rc-Zz) (:id |HqqGajjceU) (:type :expr)
            :data $ {}
              |T $ {} (:at 1556647154286) (:by |B1y7Rc-Zz) (:id |PI6Pl4c6bu) (:text |defn) (:type :leaf)
              |j $ {} (:at 1556647154286) (:by |B1y7Rc-Zz) (:id |UoJ__p8vIj) (:text |edit-note) (:type :leaf)
              |r $ {} (:at 1556647155922) (:by |B1y7Rc-Zz) (:id |yfjr2D1SoF) (:type :expr)
                :data $ {}
                  |j $ {} (:at 1556647155922) (:by |B1y7Rc-Zz) (:id |HqBAvOlL6t) (:text |db) (:type :leaf)
                  |r $ {} (:at 1556647155922) (:by |B1y7Rc-Zz) (:id |cCEKTuFTpy) (:text |op-data) (:type :leaf)
                  |v $ {} (:at 1556647155922) (:by |B1y7Rc-Zz) (:id |wYlwVvW7Nw) (:text |sid) (:type :leaf)
                  |x $ {} (:at 1556647155922) (:by |B1y7Rc-Zz) (:id |EmDrPBUyaf) (:text |op-id) (:type :leaf)
                  |y $ {} (:at 1556647155922) (:by |B1y7Rc-Zz) (:id |pvIP_pRoZV) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |s6KRTHpe2p) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |MszIoQ_2iP) (:text |let) (:type :leaf)
                  |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |5Ioxh-2mY9) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |zb_biQIJyT) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |f8IC5mjJ0i) (:text |session) (:type :leaf)
                          |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |ZMYcrtuhKI) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |uqiYTefSfs) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |gUfM_MRhID) (:text |db) (:type :leaf)
                              |r $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |v-fQJ3MqSi) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |ae2YnTutQY) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |gcSu0QT38X) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |cHQN61f0KM) (:text |sid) (:type :leaf)
                      |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |oKaFIlfN-9) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |Bg_mzjHuJY) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |x7W4jjWUDmt) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |w37hK5pGw_G) (:text |:user-id) (:type :leaf)
                              |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |Zw5hReiEBpW) (:text |session) (:type :leaf)
                      |r $ {} (:at 1556647169613) (:by |B1y7Rc-Zz) (:id |rzm_GYmrN) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647174210) (:by |B1y7Rc-Zz) (:id |rzm_GYmrNleaf) (:text |note-id) (:type :leaf)
                          |j $ {} (:at 1556647174684) (:by |B1y7Rc-Zz) (:id |kBydQcGrW) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647175374) (:by |B1y7Rc-Zz) (:id |f8i10-QG_2) (:text |:id) (:type :leaf)
                              |j $ {} (:at 1556647176518) (:by |B1y7Rc-Zz) (:id |jx6v0eIzHG) (:text |op-data) (:type :leaf)
                      |v $ {} (:at 1556647177434) (:by |B1y7Rc-Zz) (:id |U1V1ZMzGT-) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647178591) (:by |B1y7Rc-Zz) (:id |U1V1ZMzGT-leaf) (:text |text) (:type :leaf)
                          |j $ {} (:at 1556647178810) (:by |B1y7Rc-Zz) (:id |Lo5yvY6u4d) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556648281480) (:by |B1y7Rc-Zz) (:id |AthxS7S9Ec) (:text |:text) (:type :leaf)
                              |j $ {} (:at 1556647182418) (:by |B1y7Rc-Zz) (:id |yKKWn-wov9) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |WDGk-UjR3qc) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556647192307) (:by |B1y7Rc-Zz) (:id |ezed_HwZsKH) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |ftrkKIqPa-0) (:text |db) (:type :leaf)
                      |r $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |Ne3fh021aWY) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |CX2YvE2Y5Fn) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |bpgMqOL34pp) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |TkeCYLFfdLU) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1556647162170) (:by |B1y7Rc-Zz) (:id |r_SeJluZzmR) (:text |:notes) (:type :leaf)
                          |x $ {} (:at 1556647186750) (:by |B1y7Rc-Zz) (:id |3hdjfMY_YdN) (:text |note-id) (:type :leaf)
                      |v $ {} (:at 1556647195678) (:by |B1y7Rc-Zz) (:id |U48OmOZaR) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1556647196366) (:by |B1y7Rc-Zz) (:id |DpZ2hmhwoU) (:text |fn) (:type :leaf)
                          |L $ {} (:at 1556647196930) (:by |B1y7Rc-Zz) (:id |0TKOc_i-Uy) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647197344) (:by |B1y7Rc-Zz) (:id |65N6IRCCO) (:text |note) (:type :leaf)
                          |T $ {} (:at 1556647198425) (:by |B1y7Rc-Zz) (:id |tA2EO-igZ6) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1556647199511) (:by |B1y7Rc-Zz) (:id |PkC9bfrsS) (:text |assoc) (:type :leaf)
                              |L $ {} (:at 1556647200192) (:by |B1y7Rc-Zz) (:id |x_jAYaO8z) (:text |note) (:type :leaf)
                              |T $ {} (:at 1556647201707) (:by |B1y7Rc-Zz) (:id |xjzsGPaOmrt) (:text |:text) (:type :leaf)
                              |j $ {} (:at 1556647203038) (:by |B1y7Rc-Zz) (:id |2pJxE0_WCr) (:text |text) (:type :leaf)
          |remove-note $ {} (:at 1556647228311) (:by |B1y7Rc-Zz) (:id |5bhxNz78P1) (:type :expr)
            :data $ {}
              |T $ {} (:at 1556647228311) (:by |B1y7Rc-Zz) (:id |b-y0B4ZM6U) (:text |defn) (:type :leaf)
              |j $ {} (:at 1556647228311) (:by |B1y7Rc-Zz) (:id |BMY9nY9Jc-) (:text |remove-note) (:type :leaf)
              |n $ {} (:at 1556647237363) (:by |B1y7Rc-Zz) (:id |12up3PJe9M) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1556647237363) (:by |B1y7Rc-Zz) (:id |ZXw6Vmo8Su) (:text |db) (:type :leaf)
                  |j $ {} (:at 1556647237363) (:by |B1y7Rc-Zz) (:id |z09nrnzRBA) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1556647237363) (:by |B1y7Rc-Zz) (:id |2GHDSImV7o) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1556647237363) (:by |B1y7Rc-Zz) (:id |g1CN1F5SbN) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1556647237363) (:by |B1y7Rc-Zz) (:id |1oB8GaMglw) (:text |op-time) (:type :leaf)
              |r $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |YOBiZL7zHB) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |oitdX694m-) (:text |let) (:type :leaf)
                  |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |zRK65Kns_Y) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |Kp__kbjs6N) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |diRdLNfLXY) (:text |session) (:type :leaf)
                          |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |-sSp38oB0I) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |r6f7MiBNtZ) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |qM0JsgWGX-) (:text |db) (:type :leaf)
                              |r $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |9OuTjxvpgU) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |wdgD1szzZu) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |qqaKoYgNFO) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |JIhgEZUNyS) (:text |sid) (:type :leaf)
                      |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |bI3hZira9x) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |xsqUAqUzzw) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |skmLE63bKu) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |zajZLs3EYKn) (:text |:user-id) (:type :leaf)
                              |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |CXa82mmY4xh) (:text |session) (:type :leaf)
                  |r $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |_W-5FMlc6ZI) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1556647259946) (:by |B1y7Rc-Zz) (:id |4gogbpj7k8n) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |lEvun4nnWmz) (:text |db) (:type :leaf)
                      |r $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |ZpoFQei7oq9) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |SmT1PCNS3Xx) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |BgH77l9324v) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |Sk0WEGcEKhI) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1556647229585) (:by |B1y7Rc-Zz) (:id |6C1lH74tOLE) (:text |:notes) (:type :leaf)
                      |t $ {} (:at 1556647244163) (:by |B1y7Rc-Zz) (:id |rQufLVL96l) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1556647245471) (:by |B1y7Rc-Zz) (:id |rQufLVL96lleaf) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1556647245750) (:by |B1y7Rc-Zz) (:id |M_LJpndlxH) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647249370) (:by |B1y7Rc-Zz) (:id |Z9xoWd50T) (:text |notes) (:type :leaf)
                          |r $ {} (:at 1556647251474) (:by |B1y7Rc-Zz) (:id |h45h2MRx52) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1556647252690) (:by |B1y7Rc-Zz) (:id |VzpwM1dVn) (:text |dissoc) (:type :leaf)
                              |j $ {} (:at 1556647254405) (:by |B1y7Rc-Zz) (:id |-FavBIut3) (:text |notes) (:type :leaf)
                              |r $ {} (:at 1556647255513) (:by |B1y7Rc-Zz) (:id |74TPyp8cz) (:text |op-data) (:type :leaf)
        :ns $ {} (:at 1556646969974) (:by |B1y7Rc-Zz) (:id |gnf-sWUayR) (:type :expr)
          :data $ {}
            |T $ {} (:at 1556646969974) (:by |B1y7Rc-Zz) (:id |LZGeN3eSUa) (:text |ns) (:type :leaf)
            |j $ {} (:at 1556646969974) (:by |B1y7Rc-Zz) (:id |BWq_nrL7DC) (:text |app.updater.note) (:type :leaf)
            |r $ {} (:at 1556647044321) (:by |B1y7Rc-Zz) (:id |3YhAUWkgue) (:type :expr)
              :data $ {}
                |T $ {} (:at 1556647045030) (:by |B1y7Rc-Zz) (:id |sfdMqufMUv) (:text |:require) (:type :leaf)
                |j $ {} (:at 1556647045270) (:by |B1y7Rc-Zz) (:id |ddlIYHOGQx) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1556647045470) (:by |B1y7Rc-Zz) (:id |zNclIqk4ND) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1556647048344) (:by |B1y7Rc-Zz) (:id |GpqFPdCRf) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1556647048816) (:by |B1y7Rc-Zz) (:id |3tZqa9r7yu) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1556647049563) (:by |B1y7Rc-Zz) (:id |SmPoYc-wbb) (:text |schema) (:type :leaf)
        :proc $ {} (:at 1556646969974) (:by |B1y7Rc-Zz) (:id |rQkESjpOjG) (:type :expr)
          :data $ {}
      |app.updater.router $ {}
        :defs $ {}
          |change $ {} (:at 1500541255553) (:by nil) (:id |ryQxUbg0B-) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |Hy4gLZgABZ) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |ByBlIWg0S-) (:text |change) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |SkIxIWgAHZ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |SJvx8bxCBZ) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |HkdeLWxRBZ) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |BkYlL-xCSZ) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |HJ9eLWxRSW) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |Hkog8blRSW) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1500541255553) (:by nil) (:id |BkhgI-xCrb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |B1al8ZxAB-) (:text |assoc-in) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |H1ClU-xRB-) (:text |db) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |Hk1geLWx0H-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HklggLbxRB-) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |Hk-xxUbeRSZ) (:text |:sessions) (:type :leaf)
                      |r $ {} (:at 1500541255553) (:by |root) (:id |HyzlgIZgCSb) (:text |sid) (:type :leaf)
                      |v $ {} (:at 1500541255553) (:by |root) (:id |rkQgxU-l0Bb) (:text |:router) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |B14gg8WxCrb) (:text |op-data) (:type :leaf)
        :ns $ {} (:at 1500541255553) (:by nil) (:id |S1eLbxASW) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541255553) (:by |root) (:id |S1eeUbeCrZ) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541255553) (:by |root) (:id |r1-l8We0BW) (:text |app.updater.router) (:type :leaf)
        :proc $ {} (:at 1500541255553) (:by nil) (:id |HJzeUWeAr-) (:type :expr)
          :data $ {}
      |app.updater.session $ {}
        :defs $ {}
          |connect $ {} (:at 1500541255553) (:by nil) (:id |HyQ1WeI-xABW) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |SJ4ybe8-g0Sb) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |B1SyWx8bxABW) (:text |connect) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |ry8k-eUbgCr-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |HJv1Wl8WgRBZ) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |Hk_JWeLZg0Hb) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |ryYkWl8Wx0SZ) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |HyqJ-l8-lCBZ) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |r1jk-lIWlASb) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1500541255553) (:by nil) (:id |rJhyZe8blCHW) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |rka1blIZeRrW) (:text |assoc-in) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |B1Ry-lIZgRrZ) (:text |db) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |r1klbeIWeRSZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |BJgeZeLbe0HZ) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |HkWeWlLbl0rb) (:text |:sessions) (:type :leaf)
                      |r $ {} (:at 1500541255553) (:by |root) (:id |SyfgWx8WeAHW) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by nil) (:id |rJ7xbgI-eAHb) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |rkNeWeUWx0HW) (:text |merge) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |BkBxWxIZxArW) (:text |schema/session) (:type :leaf)
                      |r $ {} (:at 1500541255553) (:by nil) (:id |HkUxZeLZxRrb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |Skwebg8-gArb) (:text |{}) (:type :leaf)
                          |j $ {} (:at 1500541255553) (:by nil) (:id |BkdxZxL-l0S-) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1500541255553) (:by |root) (:id |ryKxZl8-x0SZ) (:text |:id) (:type :leaf)
                              |j $ {} (:at 1500541255553) (:by |root) (:id |r19ebe8WeArW) (:text |sid) (:type :leaf)
          |disconnect $ {} (:at 1500541255553) (:by nil) (:id |HJsgZx8-lCr-) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |Bknx-g8-gASW) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |ByalZeUblRB-) (:text |disconnect) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |rkCxZl8WxCH-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |r1yWZxIbxRSW) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |r1g--l8WeCHZ) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |HkWbWe8WeCSW) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |B1G--lIWg0Sb) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |HkQ-bxLZx0BZ) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1500541255553) (:by nil) (:id |rJ4ZWeUWeArb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |rkrbZe8blCrZ) (:text |update) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |HyL-Wx8WgABb) (:text |db) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |H1v-Wx8ZlCBb) (:text |:sessions) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by nil) (:id |rJ_-ZgUbx0H-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HyKZZxUbxRBb) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by nil) (:id |HyqWZlU-lCHb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |SyjWWlLWe0HW) (:text |session) (:type :leaf)
                      |r $ {} (:at 1500541255553) (:by nil) (:id |Syh-WgIZxCHZ) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1500541255553) (:by |root) (:id |Bka-Zg8beAS-) (:text |dissoc) (:type :leaf)
                          |j $ {} (:at 1500541255553) (:by |root) (:id |rJAZZl8ZgABZ) (:text |session) (:type :leaf)
                          |r $ {} (:at 1500541255553) (:by |root) (:id |S1yMbeI-e0BW) (:text |sid) (:type :leaf)
          |remove-message $ {} (:at 1529231499908) (:by |root) (:id |S1Z4cd3X-7) (:type :expr)
            :data $ {}
              |T $ {} (:at 1529231499908) (:by |root) (:id |rkMV9_nQZQ) (:text |defn) (:type :leaf)
              |j $ {} (:at 1529231499908) (:by |root) (:id |HymV5_27ZX) (:text |remove-message) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |rk5cu3XWm) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |r1yWZxIbxRSW) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |r1g--l8WeCHZ) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |HkWbWe8WeCSW) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |B1G--lIWg0Sb) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |HkQ-bxLZx0BZ) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1529231506714) (:by |root) (:id |H1icunXWQ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1529231507936) (:by |root) (:id |H1icunXWQleaf) (:text |update-in) (:type :leaf)
                  |j $ {} (:at 1529231509725) (:by |root) (:id |r1TcOh7Z7) (:text |db) (:type :leaf)
                  |r $ {} (:at 1529231509958) (:by |root) (:id |H1QCcOnQ-X) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1529231510376) (:by |root) (:id |SyMC9_2XZQ) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1529231511756) (:by |root) (:id |SkIRq_nmWm) (:text |:sessions) (:type :leaf)
                      |r $ {} (:at 1529231512509) (:by |root) (:id |HkGejd2QZX) (:text |sid) (:type :leaf)
                      |v $ {} (:at 1529231515700) (:by |root) (:id |BJZj_hQ-m) (:text |:messages) (:type :leaf)
                  |v $ {} (:at 1529231534326) (:by |root) (:id |H1bU2_hmZQ) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1529231534991) (:by |root) (:id |Syv3_27ZX) (:text |fn) (:type :leaf)
                      |L $ {} (:at 1529231535248) (:by |root) (:id |HJXvh_3XWX) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1529231536189) (:by |root) (:id |BkfPhun7bQ) (:text |messages) (:type :leaf)
                      |T $ {} (:at 1529231516827) (:by |root) (:id |r1Bi_2XZX) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1529231517957) (:by |root) (:id |r1Bi_2XZXleaf) (:text |dissoc) (:type :leaf)
                          |j $ {} (:at 1529231519342) (:by |root) (:id |S1m8sOh7ZQ) (:text |messages) (:type :leaf)
                          |r $ {} (:at 1529231521395) (:by |root) (:id |ryXYs_hXb7) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1529231522521) (:by |root) (:id |HyvvoO2QWQ) (:text |:id) (:type :leaf)
                              |j $ {} (:at 1529231524125) (:by |root) (:id |rJxjjdnQZQ) (:text |op-data) (:type :leaf)
        :ns $ {} (:at 1500541255553) (:by nil) (:id |Sy_0leLZgCrW) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541255553) (:by |root) (:id |H1t0llUZg0r-) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541255553) (:by |root) (:id |ryq0ee8Wl0BZ) (:text |app.updater.session) (:type :leaf)
            |r $ {} (:at 1500541255553) (:by nil) (:id |rJs0xxI-g0rZ) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541255553) (:by |root) (:id |B12AggIZl0rW) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541255553) (:by nil) (:id |SyaAlgIZeCSW) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |rJ00glL-xAr-) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1500541255553) (:by |root) (:id |BkyJbxUWxCH-) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |S1xyWgUWlRHb) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1500541255553) (:by |root) (:id |By-J-xU-gABb) (:text |schema) (:type :leaf)
        :proc $ {} (:at 1500541255553) (:by nil) (:id |rJGJZgL-x0rZ) (:type :expr)
          :data $ {}
      |app.updater.task $ {}
        :defs $ {}
          |create-working $ {} (:at 1533695542671) (:by |root) (:id |ffZPIB3p-G) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533695542671) (:by |root) (:id |bKpgWGHuOb) (:text |defn) (:type :leaf)
              |j $ {} (:at 1533695542671) (:by |root) (:id |aXcZ4QlpkL) (:text |create-working) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |9vhN8nkEFG) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |HJv1Wl8WgRBZ) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |Hk_JWeLZg0Hb) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |ryYkWl8Wx0SZ) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |HyqJ-l8-lCBZ) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |r1jk-lIWlASb) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1533695556729) (:by |root) (:id |N5Yj5wnld) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533695576494) (:by |root) (:id |N5Yj5wnldleaf) (:text |let) (:type :leaf)
                  |j $ {} (:at 1533695576864) (:by |root) (:id |1nShn9_Gwe) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533695577155) (:by |root) (:id |NqCrjhgFYt) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695578067) (:by |root) (:id |Se4wyO_8w) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1533695583013) (:by |root) (:id |y-JqJnTZb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533695584727) (:by |root) (:id |N6LR2Hcz0) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1533695586372) (:by |root) (:id |NVX5PrD5Tw) (:text |db) (:type :leaf)
                              |r $ {} (:at 1533695586647) (:by |root) (:id |seuKA_Uu8) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533695587168) (:by |root) (:id |WdfbBBx0yr) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1533695589180) (:by |root) (:id |x43Sftlt8p) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1533695590643) (:by |root) (:id |IjMZbXR8oO) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1533695593729) (:by |root) (:id |Qm_sckn0n) (:text |:user-id) (:type :leaf)
                  |r $ {} (:at 1533695598361) (:by |root) (:id |wEjENz5K7H) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533695601381) (:by |root) (:id |wEjENz5K7Hleaf) (:text |assoc-in) (:type :leaf)
                      |j $ {} (:at 1533695601774) (:by |root) (:id |pI0yL8re1s) (:text |db) (:type :leaf)
                      |r $ {} (:at 1533695603205) (:by |root) (:id |-HHJuBV8FA) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695602692) (:by |root) (:id |tT5ixXHn18) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1533695604513) (:by |root) (:id |UhU9DoNoa) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1533695605727) (:by |root) (:id |U53Q1SVyw) (:text |user-id) (:type :leaf)
                          |t $ {} (:at 1533695615781) (:by |root) (:id |aS6VTeI--) (:text |:tasks) (:type :leaf)
                          |v $ {} (:at 1533695608453) (:by |root) (:id |3mbFSqu4yS) (:text |:working) (:type :leaf)
                          |x $ {} (:at 1537289372312) (:by |root) (:id |0ivfKu53kO) (:text |op-id) (:type :leaf)
                      |v $ {} (:at 1533695621457) (:by |root) (:id |g6TXsBAvrn) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695624691) (:by |root) (:id |h_K-9EjDF) (:text |merge) (:type :leaf)
                          |j $ {} (:at 1533695628006) (:by |root) (:id |pd55SI8KXd) (:text |schema/task) (:type :leaf)
                          |r $ {} (:at 1533695632445) (:by |root) (:id |URwNiWw1m4) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533695632781) (:by |root) (:id |CAYgMblLd) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1533695643013) (:by |root) (:id |EQC0g7-T_4) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533695644442) (:by |root) (:id |EQC0g7-T_4leaf) (:text |:id) (:type :leaf)
                                  |j $ {} (:at 1533695645824) (:by |root) (:id |eD075RGdO) (:text |op-id) (:type :leaf)
                              |j $ {} (:at 1533695632979) (:by |root) (:id |-qI1nwK_rX) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533695633728) (:by |root) (:id |Sw33fZBw3o) (:text |:text) (:type :leaf)
                                  |j $ {} (:at 1533695635041) (:by |root) (:id |pZDy9VSGxa) (:text |op-data) (:type :leaf)
                              |r $ {} (:at 1533695659307) (:by |root) (:id |Z1O1Q6QQNl) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533695675335) (:by |root) (:id |Z1O1Q6QQNlleaf) (:text |:created-time) (:type :leaf)
                                  |j $ {} (:at 1533695667142) (:by |root) (:id |m0bhun_1n) (:text |op-time) (:type :leaf)
          |finish-working $ {} (:at 1533781390637) (:by |root) (:id |nMmzgTcb8O) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533781390637) (:by |root) (:id |WMLsBQN84j) (:text |defn) (:type :leaf)
              |j $ {} (:at 1533781390637) (:by |root) (:id |Y91lisC9oa) (:text |finish-working) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |ri_p_ubfi) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |HJv1Wl8WgRBZ) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |Hk_JWeLZg0Hb) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |ryYkWl8Wx0SZ) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |HyqJ-l8-lCBZ) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |r1jk-lIWlASb) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1533695556729) (:by |root) (:id |vdX4HB4CyG) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533695576494) (:by |root) (:id |N5Yj5wnldleaf) (:text |let) (:type :leaf)
                  |j $ {} (:at 1533695576864) (:by |root) (:id |1nShn9_Gwe) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533695577155) (:by |root) (:id |NqCrjhgFYt) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695578067) (:by |root) (:id |Se4wyO_8w) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1533695583013) (:by |root) (:id |y-JqJnTZb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533695584727) (:by |root) (:id |N6LR2Hcz0) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1533695586372) (:by |root) (:id |NVX5PrD5Tw) (:text |db) (:type :leaf)
                              |r $ {} (:at 1533695586647) (:by |root) (:id |seuKA_Uu8) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533695587168) (:by |root) (:id |WdfbBBx0yr) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1533695589180) (:by |root) (:id |x43Sftlt8p) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1533695590643) (:by |root) (:id |IjMZbXR8oO) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1533695593729) (:by |root) (:id |Qm_sckn0n) (:text |:user-id) (:type :leaf)
                  |r $ {} (:at 1533695598361) (:by |root) (:id |wEjENz5K7H) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533782065578) (:by |root) (:id |wEjENz5K7Hleaf) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1533695601774) (:by |root) (:id |pI0yL8re1s) (:text |db) (:type :leaf)
                      |r $ {} (:at 1533695603205) (:by |root) (:id |-HHJuBV8FA) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695602692) (:by |root) (:id |tT5ixXHn18) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1533695604513) (:by |root) (:id |UhU9DoNoa) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1533695605727) (:by |root) (:id |U53Q1SVyw) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1533782399689) (:by |root) (:id |HePRtgSrED) (:text |:tasks) (:type :leaf)
                      |s $ {} (:at 1533781430675) (:by |root) (:id |iFhTkwmnI) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533781431137) (:by |root) (:id |iFhTkwmnIleaf) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1533781431553) (:by |root) (:id |H_CAlTGtm) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533782403484) (:by |root) (:id |9HjqIGjsR6) (:text |tasks) (:type :leaf)
                          |r $ {} (:at 1533781516647) (:by |root) (:id |gc-HGVs7i) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1533781517351) (:by |root) (:id |TbDrhX780c) (:text |let) (:type :leaf)
                              |L $ {} (:at 1533781517924) (:by |root) (:id |_Gq5XmSDy) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533781518385) (:by |root) (:id |xPqiDkG7TZ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1533781521438) (:by |root) (:id |oiYDg9VFul) (:text |task) (:type :leaf)
                                      |j $ {} (:at 1533781463421) (:by |root) (:id |-3od3JIlf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1533781465406) (:by |root) (:id |mXPNRxuaiRleaf) (:text |get-in) (:type :leaf)
                                          |j $ {} (:at 1533782406940) (:by |root) (:id |JQVIG-q2d) (:text |tasks) (:type :leaf)
                                          |r $ {} (:at 1533781469194) (:by |root) (:id |FJtrJg9EqX) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1533781469547) (:by |root) (:id |FWJPXc6CgW) (:text |[]) (:type :leaf)
                                              |j $ {} (:at 1533781471428) (:by |root) (:id |IGY9JFRD1D) (:text |:working) (:type :leaf)
                                              |r $ {} (:at 1533781474348) (:by |root) (:id |5lkUPOghl) (:text |op-data) (:type :leaf)
                              |T $ {} (:at 1533781528491) (:by |root) (:id |W7-duoJtzG) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1533781529344) (:by |root) (:id |plv5jBM2o) (:text |if) (:type :leaf)
                                  |L $ {} (:at 1533781531168) (:by |root) (:id |IEtNlS0Giw) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1533781531006) (:by |root) (:id |7P_eqYaWP) (:text |some?) (:type :leaf)
                                      |j $ {} (:at 1533781531858) (:by |root) (:id |McjJz7iWN7) (:text |task) (:type :leaf)
                                  |T $ {} (:at 1533781434665) (:by |root) (:id |fcXtcusUv) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1533781439860) (:by |root) (:id |fcXtcusUvleaf) (:text |->) (:type :leaf)
                                      |j $ {} (:at 1533782443621) (:by |root) (:id |-E_LZ3zW9Z) (:text |tasks) (:type :leaf)
                                      |r $ {} (:at 1533781445020) (:by |root) (:id |ROppqfFHEo) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1533782410158) (:by |root) (:id |LjQ4MTCjB) (:text |update) (:type :leaf)
                                          |Z $ {} (:at 1533782414442) (:by |root) (:id |4VDHL_Ivz-) (:text |:working) (:type :leaf)
                                          |f $ {} (:at 1533781504896) (:by |root) (:id |dNO7sdDtJJ) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1533781505839) (:by |root) (:id |Xssadr4od) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1533781506098) (:by |root) (:id |2OdJVyUgdh) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1533781506676) (:by |root) (:id |MD0UfspSVV) (:text |tasks) (:type :leaf)
                                              |r $ {} (:at 1533781507183) (:by |root) (:id |ETI3OKhkPo) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1533781508234) (:by |root) (:id |ETI3OKhkPoleaf) (:text |dissoc) (:type :leaf)
                                                  |j $ {} (:at 1533781509640) (:by |root) (:id |5hY-PaQsk) (:text |tasks) (:type :leaf)
                                                  |r $ {} (:at 1533781512720) (:by |root) (:id |PSNKookFfq) (:text |op-data) (:type :leaf)
                                      |v $ {} (:at 1533781455917) (:by |root) (:id |YbEEYmXHEF) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1533781458242) (:by |root) (:id |YbEEYmXHEFleaf) (:text |assoc-in) (:type :leaf)
                                          |j $ {} (:at 1533781458562) (:by |root) (:id |_GBEKEfEr) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1533781458755) (:by |root) (:id |WTGEvD4-9n) (:text |[]) (:type :leaf)
                                              |j $ {} (:at 1533781460697) (:by |root) (:id |m43TWz6Zqz) (:text |:finished) (:type :leaf)
                                              |r $ {} (:at 1533781477429) (:by |root) (:id |pPE_QhzFRf) (:text |op-data) (:type :leaf)
                                          |r $ {} (:at 1536727177361) (:by |B1y7Rc-Zz) (:id |QG75Z5oI2F) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1536727179035) (:by |B1y7Rc-Zz) (:id |7PmvP3jAl) (:text |assoc) (:type :leaf)
                                              |T $ {} (:at 1533781535607) (:by |root) (:id |XLvN5aL3kO) (:text |task) (:type :leaf)
                                              |j $ {} (:at 1536727181751) (:by |B1y7Rc-Zz) (:id |LKfSeqSEM) (:text |:finished-time) (:type :leaf)
                                              |r $ {} (:at 1536727183356) (:by |B1y7Rc-Zz) (:id |FQqKJr3PDW) (:text |op-time) (:type :leaf)
                                  |j $ {} (:at 1533782437616) (:by |root) (:id |QRrHsX07F) (:text |tasks) (:type :leaf)
          |pend $ {} (:at 1537290357489) (:by |root) (:id |GPRqw3ypmS) (:type :expr)
            :data $ {}
              |T $ {} (:at 1537290357489) (:by |root) (:id |Ppc2rzlCgS) (:text |defn) (:type :leaf)
              |j $ {} (:at 1537290357489) (:by |root) (:id |pbUzaqORmL) (:text |pend) (:type :leaf)
              |r $ {} (:at 1537290366294) (:by |root) (:id |I6PWn3rd4z) (:type :expr)
                :data $ {}
                  |j $ {} (:at 1537290366294) (:by |root) (:id |WTIjammzOF) (:text |db) (:type :leaf)
                  |r $ {} (:at 1537290366294) (:by |root) (:id |DlmX4Y9kwA) (:text |op-data) (:type :leaf)
                  |v $ {} (:at 1537290366294) (:by |root) (:id |jS8oCcLoWb) (:text |sid) (:type :leaf)
                  |x $ {} (:at 1537290366294) (:by |root) (:id |2UQLlKVtYI) (:text |op-id) (:type :leaf)
                  |y $ {} (:at 1537290366294) (:by |root) (:id |g5h22Js1NR) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1537290374278) (:by |root) (:id |WkVimaIyww) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1537290374278) (:by |root) (:id |0kxi8I15ZJ) (:text |let) (:type :leaf)
                  |j $ {} (:at 1537290374278) (:by |root) (:id |_P4kSlUap8) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537290374278) (:by |root) (:id |Qhx4CmH8oB) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537290374278) (:by |root) (:id |bv9G5sVGfx) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1537290374278) (:by |root) (:id |F1MeLMPrZb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1537290374278) (:by |root) (:id |p2XENekvDP) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1537290374278) (:by |root) (:id |zZvxolDv4I) (:text |db) (:type :leaf)
                              |r $ {} (:at 1537290374278) (:by |root) (:id |FAdKlEuurV) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537290374278) (:by |root) (:id |frrZfPQ7Hm) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1537290374278) (:by |root) (:id |8yT_WDx352) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1537290374278) (:by |root) (:id |vbdLVg8yA2) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1537290374278) (:by |root) (:id |zNuvHrCQFb) (:text |:user-id) (:type :leaf)
                  |r $ {} (:at 1537290374278) (:by |root) (:id |utKD5-86Ah8) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537290374278) (:by |root) (:id |f1hWT-RUovU) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1537290374278) (:by |root) (:id |JbklVVr9PBS) (:text |db) (:type :leaf)
                      |r $ {} (:at 1537290374278) (:by |root) (:id |GkV2yN-HRDr) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537290374278) (:by |root) (:id |W6q03jBs6nS) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1537290374278) (:by |root) (:id |xNunZ2tUqyp) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1537290374278) (:by |root) (:id |S7IAFJKjhuj) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1537290374278) (:by |root) (:id |A-Q6zgWEjBR) (:text |:tasks) (:type :leaf)
                          |x $ {} (:at 1537291111115) (:by |root) (:id |EicSpFB-e) (:text |:working) (:type :leaf)
                          |y $ {} (:at 1537291126018) (:by |root) (:id |chLr_QTRF) (:text |op-data) (:type :leaf)
                          |yT $ {} (:at 1537291132493) (:by |root) (:id |uNH9KIev1) (:text |:pending?) (:type :leaf)
                      |t $ {} (:at 1537291135107) (:by |root) (:id |GLmAKwC3L) (:text |not) (:type :leaf)
          |put-back $ {} (:at 1538156884041) (:by |root) (:id |N2m163_uce) (:type :expr)
            :data $ {}
              |T $ {} (:at 1538156884041) (:by |root) (:id |ZtysYHAtqk) (:text |defn) (:type :leaf)
              |j $ {} (:at 1538156884041) (:by |root) (:id |RKusgx8hNM) (:text |put-back) (:type :leaf)
              |r $ {} (:at 1538156885773) (:by |root) (:id |xGgw7H20_S) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1538156885773) (:by |root) (:id |tvQzih8Ano) (:text |db) (:type :leaf)
                  |j $ {} (:at 1538156885773) (:by |root) (:id |zEvFTarvzD) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1538156885773) (:by |root) (:id |ZbzEXLmcQx) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1538156885773) (:by |root) (:id |Np2ti1LBgP) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1538156885773) (:by |root) (:id |7kz1voNLx-) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1538156885773) (:by |root) (:id |LD0oz0O0Ms) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1538156885773) (:by |root) (:id |lubq5r6vg1) (:text |let) (:type :leaf)
                  |j $ {} (:at 1538156885773) (:by |root) (:id |VTQ0Ub7huT) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1538156885773) (:by |root) (:id |krZ3MUqHzy) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1538156885773) (:by |root) (:id |q_aRVySLME) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1538156885773) (:by |root) (:id |60_nyterjY) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1538156885773) (:by |root) (:id |e8xcod3LwDh) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1538156885773) (:by |root) (:id |DWdsThkTix9) (:text |db) (:type :leaf)
                              |r $ {} (:at 1538156885773) (:by |root) (:id |OdMF9jGe6yY) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538156885773) (:by |root) (:id |MGBZhWWJYJL) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1538156885773) (:by |root) (:id |S44A7ijP7-j) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1538156885773) (:by |root) (:id |P_q4jJQKmFR) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1538156885773) (:by |root) (:id |5of393RyCKh) (:text |:user-id) (:type :leaf)
                  |r $ {} (:at 1538156920308) (:by |root) (:id |BnW1CPqkRC) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1538156920308) (:by |root) (:id |94p3Zok7pY) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1538156920308) (:by |root) (:id |l5G5jlQ42_) (:text |db) (:type :leaf)
                      |r $ {} (:at 1538156920308) (:by |root) (:id |DTDGAUBR0U) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1538156920308) (:by |root) (:id |Q5IjQIg6Kd) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1538156920308) (:by |root) (:id |QplMKyOlV4) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1538156920308) (:by |root) (:id |_ftRehzBvo) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1538156920308) (:by |root) (:id |VvfdkgBzsE) (:text |:tasks) (:type :leaf)
                      |v $ {} (:at 1538156920308) (:by |root) (:id |Sp-Dxrf7-8) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1538156920308) (:by |root) (:id |IZZK01cWvW) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1538156920308) (:by |root) (:id |tqPa_e3MW1) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1538156920308) (:by |root) (:id |f-RgGA-Lr5) (:text |tasks) (:type :leaf)
                          |r $ {} (:at 1538156920308) (:by |root) (:id |1yMH5g5kRv) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1538156920308) (:by |root) (:id |kiIbdiBu7F) (:text |let) (:type :leaf)
                              |j $ {} (:at 1538156920308) (:by |root) (:id |fgFFw1ZAO4t) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538156920308) (:by |root) (:id |UKBVb-ZNDgB) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1538156920308) (:by |root) (:id |n6X9uofyNiD) (:text |task) (:type :leaf)
                                      |j $ {} (:at 1538156920308) (:by |root) (:id |2neEDY_Wk5Q) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1538156920308) (:by |root) (:id |vBc8g_MSHEi) (:text |get-in) (:type :leaf)
                                          |j $ {} (:at 1538156920308) (:by |root) (:id |Q14ifaRGKRm) (:text |tasks) (:type :leaf)
                                          |r $ {} (:at 1538156920308) (:by |root) (:id |WJsOYPQvhdp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1538156920308) (:by |root) (:id |GEsGvUgRQEM) (:text |[]) (:type :leaf)
                                              |j $ {} (:at 1538156926467) (:by |root) (:id |DsEYMJphIkq) (:text |:finished) (:type :leaf)
                                              |r $ {} (:at 1538156920308) (:by |root) (:id |cIXoocRVs4v) (:text |op-data) (:type :leaf)
                              |r $ {} (:at 1538156920308) (:by |root) (:id |VKl_SzOZHEl) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1538156920308) (:by |root) (:id |ulcj9Xh08tR) (:text |if) (:type :leaf)
                                  |j $ {} (:at 1538156920308) (:by |root) (:id |zT3j_jIoytk) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1538156920308) (:by |root) (:id |hO21-rY_Qia) (:text |some?) (:type :leaf)
                                      |j $ {} (:at 1538156920308) (:by |root) (:id |WlIWTsWLRWj) (:text |task) (:type :leaf)
                                  |r $ {} (:at 1538156920308) (:by |root) (:id |Bh9E6cFiCgm) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1538156920308) (:by |root) (:id |wvNna1H5a7l) (:text |->) (:type :leaf)
                                      |j $ {} (:at 1538156920308) (:by |root) (:id |RCNiHvKTfkS) (:text |tasks) (:type :leaf)
                                      |r $ {} (:at 1538156920308) (:by |root) (:id |mjYgR5m0xBr) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1538156920308) (:by |root) (:id |JliEXQj3dJV) (:text |update) (:type :leaf)
                                          |j $ {} (:at 1538156936032) (:by |root) (:id |kD4WS1efsvp) (:text |:finished) (:type :leaf)
                                          |r $ {} (:at 1538156920308) (:by |root) (:id |VGyKnh5MhnG) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1538156920308) (:by |root) (:id |bK2d-4Ufc_8) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1538156920308) (:by |root) (:id |NP7F1ns2y6m) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1538156920308) (:by |root) (:id |xaTq29I-ZXQ) (:text |tasks) (:type :leaf)
                                              |r $ {} (:at 1538156920308) (:by |root) (:id |hC2aUsinyCp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1538156920308) (:by |root) (:id |XnA8Ett5KI1) (:text |dissoc) (:type :leaf)
                                                  |j $ {} (:at 1538156920308) (:by |root) (:id |5rK6xk4x9YY) (:text |tasks) (:type :leaf)
                                                  |r $ {} (:at 1538156920308) (:by |root) (:id |H9TLUOCSYIU) (:text |op-data) (:type :leaf)
                                      |v $ {} (:at 1538156920308) (:by |root) (:id |tSw0Z920XHy) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1538156920308) (:by |root) (:id |L2BQ4c2sE23) (:text |assoc-in) (:type :leaf)
                                          |j $ {} (:at 1538156920308) (:by |root) (:id |MZSMSoYNbf1) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1538156920308) (:by |root) (:id |fB2EFxTXHEe) (:text |[]) (:type :leaf)
                                              |j $ {} (:at 1538156949436) (:by |root) (:id |PmwmjSRlh7w) (:text |:working) (:type :leaf)
                                              |r $ {} (:at 1538156920308) (:by |root) (:id |v1cMG2UF3iF) (:text |op-data) (:type :leaf)
                                          |r $ {} (:at 1538156971780) (:by |root) (:id |jKoOXil5wO) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1538156971780) (:by |root) (:id |ibT5gCT8GL) (:text |assoc) (:type :leaf)
                                              |j $ {} (:at 1538156971780) (:by |root) (:id |eJ-cE1qbYU) (:text |task) (:type :leaf)
                                              |r $ {} (:at 1538156971780) (:by |root) (:id |5cI8pxCEVR) (:text |:touched-time) (:type :leaf)
                                              |v $ {} (:at 1538156971780) (:by |root) (:id |Hm_jhZMGYH) (:text |op-time) (:type :leaf)
                                  |v $ {} (:at 1538156920308) (:by |root) (:id |PmJ0A6PjPkP) (:text |tasks) (:type :leaf)
          |remove-working $ {} (:at 1533696025500) (:by |root) (:id |KVe-gX-XZZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1533696025500) (:by |root) (:id |CqXloK2KMM) (:text |defn) (:type :leaf)
              |j $ {} (:at 1533696025500) (:by |root) (:id |WbaO9OEmW0) (:text |remove-working) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |A-9Kf-s5Y) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |HJv1Wl8WgRBZ) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |Hk_JWeLZg0Hb) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |ryYkWl8Wx0SZ) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |HyqJ-l8-lCBZ) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |r1jk-lIWlASb) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1533695556729) (:by |root) (:id |IxAl_Lc4ks) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1533695576494) (:by |root) (:id |N5Yj5wnldleaf) (:text |let) (:type :leaf)
                  |j $ {} (:at 1533695576864) (:by |root) (:id |1nShn9_Gwe) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533695577155) (:by |root) (:id |NqCrjhgFYt) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695578067) (:by |root) (:id |Se4wyO_8w) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1533695583013) (:by |root) (:id |y-JqJnTZb) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533695584727) (:by |root) (:id |N6LR2Hcz0) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1533695586372) (:by |root) (:id |NVX5PrD5Tw) (:text |db) (:type :leaf)
                              |r $ {} (:at 1533695586647) (:by |root) (:id |seuKA_Uu8) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1533695587168) (:by |root) (:id |WdfbBBx0yr) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1533695589180) (:by |root) (:id |x43Sftlt8p) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1533695590643) (:by |root) (:id |IjMZbXR8oO) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1533695593729) (:by |root) (:id |Qm_sckn0n) (:text |:user-id) (:type :leaf)
                  |r $ {} (:at 1533695598361) (:by |root) (:id |wEjENz5K7H) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1533696048028) (:by |root) (:id |wEjENz5K7Hleaf) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1533695601774) (:by |root) (:id |pI0yL8re1s) (:text |db) (:type :leaf)
                      |r $ {} (:at 1533695603205) (:by |root) (:id |-HHJuBV8FA) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533695602692) (:by |root) (:id |tT5ixXHn18) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1533695604513) (:by |root) (:id |UhU9DoNoa) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1533695605727) (:by |root) (:id |U53Q1SVyw) (:text |user-id) (:type :leaf)
                          |t $ {} (:at 1533695615781) (:by |root) (:id |aS6VTeI--) (:text |:tasks) (:type :leaf)
                          |v $ {} (:at 1533695608453) (:by |root) (:id |3mbFSqu4yS) (:text |:working) (:type :leaf)
                      |t $ {} (:at 1533696052456) (:by |root) (:id |9wECaWEFRh) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1533696052872) (:by |root) (:id |8VhQc8Kf_0) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1533696053199) (:by |root) (:id |qaiquuenVy) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533696056326) (:by |root) (:id |SovF8Tv-IU) (:text |tasks) (:type :leaf)
                          |r $ {} (:at 1533696056937) (:by |root) (:id |5SymvItKqe) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1533696058733) (:by |root) (:id |5SymvItKqeleaf) (:text |dissoc) (:type :leaf)
                              |j $ {} (:at 1533696061723) (:by |root) (:id |4V538mLmdl) (:text |tasks) (:type :leaf)
                              |r $ {} (:at 1533696127557) (:by |root) (:id |Cib0n08W76) (:text |op-data) (:type :leaf)
          |touch-working $ {} (:at 1537289196108) (:by |root) (:id |a-ae0cp_qB) (:type :expr)
            :data $ {}
              |T $ {} (:at 1537289196108) (:by |root) (:id |NH4psTyH72) (:text |defn) (:type :leaf)
              |j $ {} (:at 1537289196108) (:by |root) (:id |X0R-SyybUe) (:text |touch-working) (:type :leaf)
              |r $ {} (:at 1537289203990) (:by |root) (:id |LQ32c-tFms) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1537289203990) (:by |root) (:id |7dUp-19_9X) (:text |db) (:type :leaf)
                  |j $ {} (:at 1537289203990) (:by |root) (:id |1ITTIjp429) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1537289203990) (:by |root) (:id |jvjNYar-WR) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1537289203990) (:by |root) (:id |yTVH7_bQ6Z) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1537289203990) (:by |root) (:id |N7zcIF45a4) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1537289208308) (:by |root) (:id |RBUk4VF9An) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1537289208308) (:by |root) (:id |ItHMbuiEfG) (:text |let) (:type :leaf)
                  |j $ {} (:at 1537289208308) (:by |root) (:id |jIummdaV4x) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537289208308) (:by |root) (:id |V7E4qEmHAH) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537289208308) (:by |root) (:id |OTFFAY3OD1) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1537289208308) (:by |root) (:id |4mXfFh7FtF) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1537289208308) (:by |root) (:id |bqZoZf49gb) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1537289208308) (:by |root) (:id |jD2KBMXjcy) (:text |db) (:type :leaf)
                              |r $ {} (:at 1537289208308) (:by |root) (:id |Nyp4LdfN1a) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537289208308) (:by |root) (:id |kZSkBqx0Qn) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1537289208308) (:by |root) (:id |XJH1OC2-1U) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1537289208308) (:by |root) (:id |JIRTjzUTaP) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1537289208308) (:by |root) (:id |ZUIMXnTQwC) (:text |:user-id) (:type :leaf)
                  |r $ {} (:at 1537289208308) (:by |root) (:id |-gNGSnhJ6p) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1537289251298) (:by |root) (:id |UZr_hnLvhNR) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1537289208308) (:by |root) (:id |hGKjjXFhAOW) (:text |db) (:type :leaf)
                      |r $ {} (:at 1537289208308) (:by |root) (:id |mvTsQT59T52) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537289208308) (:by |root) (:id |lOI3UOMtPhd) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1537289208308) (:by |root) (:id |_iCpZrMVnH7) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1537289208308) (:by |root) (:id |YpuNP2bBP71) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1537289208308) (:by |root) (:id |7VMCi04Ry0U) (:text |:tasks) (:type :leaf)
                          |x $ {} (:at 1537289208308) (:by |root) (:id |sCrMZAOyZai) (:text |:working) (:type :leaf)
                          |y $ {} (:at 1537289378039) (:by |root) (:id |bascuvs2Zyf) (:text |op-data) (:type :leaf)
                      |v $ {} (:at 1537289208308) (:by |root) (:id |6pGeocZyfGd) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1537289259673) (:by |root) (:id |FbHOj735-2i) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1537289259989) (:by |root) (:id |PMCBAxg8Vv) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1537289261848) (:by |root) (:id |-3J-SbxHgZ) (:text |task) (:type :leaf)
                          |r $ {} (:at 1537289264420) (:by |root) (:id |kXdwrLn68) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1537289264778) (:by |root) (:id |kXdwrLn68leaf) (:text |if) (:type :leaf)
                              |j $ {} (:at 1537289265303) (:by |root) (:id |vpJJM4nwcG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537289267084) (:by |root) (:id |2FOkNWHWl3) (:text |some?) (:type :leaf)
                                  |j $ {} (:at 1537289268407) (:by |root) (:id |lb2siqjHT-) (:text |task) (:type :leaf)
                              |r $ {} (:at 1537289269329) (:by |root) (:id |bPTHizskLT) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1537289270230) (:by |root) (:id |Li84PyfYVE) (:text |assoc) (:type :leaf)
                                  |j $ {} (:at 1537289270933) (:by |root) (:id |xAEstTSWiv) (:text |task) (:type :leaf)
                                  |r $ {} (:at 1537289273272) (:by |root) (:id |CClNRkdQ5O) (:text |:touched-time) (:type :leaf)
                                  |v $ {} (:at 1537289276032) (:by |root) (:id |HKn-ZLADD) (:text |op-time) (:type :leaf)
                              |v $ {} (:at 1537289282930) (:by |root) (:id |QstDmcxR6-) (:text |nil) (:type :leaf)
          |update-working $ {} (:at 1536901057004) (:by |B1y7Rc-Zz) (:id |WMsAnJVfnS) (:type :expr)
            :data $ {}
              |T $ {} (:at 1536901057004) (:by |B1y7Rc-Zz) (:id |nD42v6Q5fW) (:text |defn) (:type :leaf)
              |j $ {} (:at 1536901151798) (:by |B1y7Rc-Zz) (:id |T1-gHtXBiP) (:text |update-working) (:type :leaf)
              |r $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |VNkCnJjGFb) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |MjM-cJOnX3) (:text |db) (:type :leaf)
                  |j $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |U99Rs-D_Oi) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |DEIZHcc-aR) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |eY_GU8uFYK) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |gfA8RgQpRv) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |P1fLepWqd4) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |uuqmJD9Z0T) (:text |let) (:type :leaf)
                  |j $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |60r_vE_4ZO) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |RxMHnzn-Pf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |RD5cOSq8ITe) (:text |user-id) (:type :leaf)
                          |j $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |y_cXA-XLlVG) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |nisiMjkhdIU) (:text |get-in) (:type :leaf)
                              |j $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |TR3pcpiYe0b) (:text |db) (:type :leaf)
                              |r $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |lcyShUNarRz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |lfX4lH4msDy) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |WIcbyg0KO59) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |PpOTlp-Fbpd) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |E34rN-J1Ru2) (:text |:user-id) (:type :leaf)
                  |r $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |2FZtpIltZo-) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1536901120117) (:by |B1y7Rc-Zz) (:id |YWM2qfmc843) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |WKVNb3XFrRZ) (:text |db) (:type :leaf)
                      |r $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |0c4v-xNjZHt) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |q_FL0Grg9Sw) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |Q_DqcZYvHt0) (:text |:users) (:type :leaf)
                          |r $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |SzOIKR0TT6F) (:text |user-id) (:type :leaf)
                          |v $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |LkNAyl3yI5O) (:text |:tasks) (:type :leaf)
                          |x $ {} (:at 1536901058218) (:by |B1y7Rc-Zz) (:id |LzGO89gE4rY) (:text |:working) (:type :leaf)
                          |y $ {} (:at 1536901088814) (:by |B1y7Rc-Zz) (:id |9yKplnE7zf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536901090233) (:by |B1y7Rc-Zz) (:id |viljocbB1jS) (:text |:id) (:type :leaf)
                              |j $ {} (:at 1536901092292) (:by |B1y7Rc-Zz) (:id |1SkgUEvz92) (:text |op-data) (:type :leaf)
                      |t $ {} (:at 1536901116530) (:by |B1y7Rc-Zz) (:id |rOjwVbn-s) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1536901122098) (:by |B1y7Rc-Zz) (:id |rOjwVbn-sleaf) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1536901122395) (:by |B1y7Rc-Zz) (:id |bS60Q05M6X) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536901123013) (:by |B1y7Rc-Zz) (:id |WdSng4ZJ_i) (:text |task) (:type :leaf)
                          |r $ {} (:at 1536901124631) (:by |B1y7Rc-Zz) (:id |T7y8pd8Qs) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1536901124984) (:by |B1y7Rc-Zz) (:id |T7y8pd8Qsleaf) (:text |if) (:type :leaf)
                              |j $ {} (:at 1536901128993) (:by |B1y7Rc-Zz) (:id |lFhIMjAQM) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1536901130049) (:by |B1y7Rc-Zz) (:id |9UDjcprY3X) (:text |some?) (:type :leaf)
                                  |T $ {} (:at 1536901126821) (:by |B1y7Rc-Zz) (:id |mbdpPy-e47) (:text |task) (:type :leaf)
                              |r $ {} (:at 1536901130517) (:by |B1y7Rc-Zz) (:id |Z426PM7lYR) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1536901134240) (:by |B1y7Rc-Zz) (:id |Z426PM7lYRleaf) (:text |assoc) (:type :leaf)
                                  |j $ {} (:at 1536901136091) (:by |B1y7Rc-Zz) (:id |Vmzq8n4OFz) (:text |task) (:type :leaf)
                                  |r $ {} (:at 1536901137468) (:by |B1y7Rc-Zz) (:id |gmDwBnK5uI) (:text |:text) (:type :leaf)
                                  |v $ {} (:at 1536901137881) (:by |B1y7Rc-Zz) (:id |PFTfQ9bmSp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1536901138787) (:by |B1y7Rc-Zz) (:id |Gyrjus1cQ) (:text |:text) (:type :leaf)
                                      |j $ {} (:at 1536901333397) (:by |B1y7Rc-Zz) (:id |iRSHOEXvY8) (:text |op-data) (:type :leaf)
                              |v $ {} (:at 1536901144964) (:by |B1y7Rc-Zz) (:id |D6t5G-_wWN) (:text |nil) (:type :leaf)
        :ns $ {} (:at 1533695436318) (:by |root) (:id |tDtiDpZpBy) (:type :expr)
          :data $ {}
            |T $ {} (:at 1533695436318) (:by |root) (:id |8TWrLqw384) (:text |ns) (:type :leaf)
            |j $ {} (:at 1533695436318) (:by |root) (:id |h-EdN389vL) (:text |app.updater.task) (:type :leaf)
            |r $ {} (:at 1533695564360) (:by |root) (:id |uEp4H-NBNQ) (:type :expr)
              :data $ {}
                |T $ {} (:at 1533695564969) (:by |root) (:id |N6OuDbgaVk) (:text |:require) (:type :leaf)
                |j $ {} (:at 1533695565136) (:by |root) (:id |N9rHfuhEXV) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1533695565411) (:by |root) (:id |dTwKhDtXMs) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1533695566783) (:by |root) (:id |8IcFuU8DJ) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1533695570141) (:by |root) (:id |Ya5Z0XcNKd) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1533695571332) (:by |root) (:id |_R4Fh0EuQM) (:text |schema) (:type :leaf)
        :proc $ {} (:at 1533695436318) (:by |root) (:id |L37vRCCB8F) (:type :expr)
          :data $ {}
      |app.updater.user $ {}
        :defs $ {}
          |log-in $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |log-in) (:type :leaf)
              |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |let-sugar) (:type :leaf)
                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                              |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                              |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |password) (:type :leaf)
                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user) (:type :leaf)
                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |->) (:type :leaf)
                              |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:users) (:type :leaf)
                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                              |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |vals) (:type :leaf)
                              |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |.to-list) (:type :leaf)
                              |x $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |find) (:type :leaf)
                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |user) (:type :leaf)
                                      |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |and) (:type :leaf)
                                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |=) (:type :leaf)
                                              |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                                              |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:name) (:type :leaf)
                                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |user) (:type :leaf)
                  |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |update-in) (:type :leaf)
                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                      |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:sessions) (:type :leaf)
                          |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                      |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session) (:type :leaf)
                          |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                              |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |some?) (:type :leaf)
                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user) (:type :leaf)
                              |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |=) (:type :leaf)
                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |md5) (:type :leaf)
                                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |password) (:type :leaf)
                                      |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:password) (:type :leaf)
                                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user) (:type :leaf)
                                  |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |assoc) (:type :leaf)
                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session) (:type :leaf)
                                      |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:user-id) (:type :leaf)
                                      |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user) (:type :leaf)
                                  |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |update) (:type :leaf)
                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session) (:type :leaf)
                                      |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:messages) (:type :leaf)
                                      |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages) (:type :leaf)
                                          |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |assoc) (:type :leaf)
                                              |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages) (:type :leaf)
                                              |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                                              |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                                                  |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                                                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text "|\"Wrong password for ") (:type :leaf)
                                                          |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                              |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |update) (:type :leaf)
                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session) (:type :leaf)
                                  |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:messages) (:type :leaf)
                                  |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages) (:type :leaf)
                                      |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |assoc) (:type :leaf)
                                          |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages) (:type :leaf)
                                          |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                                          |v $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                              |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                                              |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                                  |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                                                      |j $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text "|\"No user named: ") (:type :leaf)
                                                      |r $ {} (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
          |log-out $ {} (:at 1500541255553) (:by nil) (:id |Bk8TlgU-xAHZ) (:type :expr)
            :data $ {}
              |T $ {} (:at 1500541255553) (:by |root) (:id |BJPaegIWgAHZ) (:text |defn) (:type :leaf)
              |j $ {} (:at 1500541255553) (:by |root) (:id |HkuTeeIbxAB-) (:text |log-out) (:type :leaf)
              |r $ {} (:at 1500541255553) (:by nil) (:id |BkFael8ZgRrW) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |SJ9pxxIZeRHW) (:text |db) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |BkjpegUbxArZ) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by |root) (:id |Hk3peeU-e0BW) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |H16agxUbx0r-) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1500541255553) (:by |root) (:id |HyRpllIblRSb) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1500541255553) (:by nil) (:id |rkyRlxUZxCSZ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1500541255553) (:by |root) (:id |H1gRge8WeCBb) (:text |assoc-in) (:type :leaf)
                  |j $ {} (:at 1500541255553) (:by |root) (:id |H1WAxxIWlAS-) (:text |db) (:type :leaf)
                  |r $ {} (:at 1500541255553) (:by nil) (:id |BkzRglUWgCHZ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1500541255553) (:by |root) (:id |HymReg8WgRBZ) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1500541255553) (:by |root) (:id |H1V0ggLZgCB-) (:text |:sessions) (:type :leaf)
                      |r $ {} (:at 1500541255553) (:by |root) (:id |rJBRgeUbxCHZ) (:text |sid) (:type :leaf)
                      |v $ {} (:at 1500541255553) (:by |root) (:id |HJL0egLbe0H-) (:text |:user-id) (:type :leaf)
                  |v $ {} (:at 1500541255553) (:by |root) (:id |HJvCgxLbeRB-) (:text |nil) (:type :leaf)
          |sign-up $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sign-up) (:type :leaf)
              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                  |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-time) (:type :leaf)
              |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |let-sugar) (:type :leaf)
                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |password) (:type :leaf)
                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-data) (:type :leaf)
                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |maybe-user) (:type :leaf)
                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |find) (:type :leaf)
                              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |vals) (:type :leaf)
                                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:users) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |user) (:type :leaf)
                                  |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |=) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                                      |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:name) (:type :leaf)
                                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |user) (:type :leaf)
                  |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |some?) (:type :leaf)
                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |maybe-user) (:type :leaf)
                      |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |update-in) (:type :leaf)
                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                          |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:sessions) (:type :leaf)
                              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                              |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:messages) (:type :leaf)
                          |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |messages) (:type :leaf)
                              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |assoc) (:type :leaf)
                                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |messages) (:type :leaf)
                                  |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                                  |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                                      |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:text) (:type :leaf)
                                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                                              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text "|\"Name is taken: ") (:type :leaf)
                                              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                      |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |->) (:type :leaf)
                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db) (:type :leaf)
                          |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |assoc-in) (:type :leaf)
                              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:sessions) (:type :leaf)
                                  |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:user-id) (:type :leaf)
                              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                          |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |assoc-in) (:type :leaf)
                              |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[]) (:type :leaf)
                                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:users) (:type :leaf)
                                  |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                              |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                  |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:id) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id) (:type :leaf)
                                  |r $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:name) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                                  |v $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:nickname) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username) (:type :leaf)
                                  |x $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:password) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |md5) (:type :leaf)
                                          |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |password) (:type :leaf)
                                  |y $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:avatar) (:type :leaf)
                                      |j $ {} (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
        :ns $ {} (:at 1500541255553) (:by nil) (:id |SyuRgL-x0HZ) (:type :expr)
          :data $ {}
            |T $ {} (:at 1500541255553) (:by |root) (:id |H1KCx8bgAH-) (:text |ns) (:type :leaf)
            |j $ {} (:at 1500541255553) (:by |root) (:id |Sk5AgLWlRrb) (:text |app.updater.user) (:type :leaf)
            |r $ {} (:at 1500541255553) (:by nil) (:id |ryi0xL-lCH-) (:type :expr)
              :data $ {}
                |T $ {} (:at 1500541255553) (:by |root) (:id |r13AgIWlAS-) (:text |:require) (:type :leaf)
                |j $ {} (:at 1500541255553) (:by nil) (:id |H16ClL-l0SZ) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1500541255553) (:by |root) (:id |B10Al8-eRS-) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1544894689258) (:by |B1y7Rc-Zz) (:id |SJJ1eeLWxCH-) (:text |cumulo-util.core) (:type :leaf)
                    |r $ {} (:at 1500541255553) (:by |root) (:id |SJgJegUbeCB-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1500541255553) (:by nil) (:id |S1-yel8ZgAB-) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1500541255553) (:by |root) (:id |SkfJxxU-eRr-) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1500541255553) (:by |root) (:id |rJQkxg8WgCH-) (:text |find-first) (:type :leaf)
                |r $ {} (:at 1636741016070) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1636741016070) (:by |B1y7Rc-Zz) (:text |calcit.std.hash) (:type :leaf)
                    |j $ {} (:at 1636741016070) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1636741016070) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1636741016070) (:by |B1y7Rc-Zz) (:text |md5) (:type :leaf)
        :proc $ {} (:at 1500541255553) (:by nil) (:id |B141llLbeCBW) (:type :expr)
          :data $ {}
    :root $ {} (:def |main!) (:ns |main)
  :users $ {}
    |B1y7Rc-Zz $ {} (:avatar nil) (:id |B1y7Rc-Zz) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |root $ {} (:avatar nil) (:id |root) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
