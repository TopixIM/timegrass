
{} (:package |app)
  :configs $ {} (:init-fn |app.client/main!) (:port 6001) (:reload-fn |app.client/reload!)
    :modules $ [] |respo.calcit/ |lilac/ |recollect/ |memof/ |respo-ui.calcit/ |ws-edn.calcit/ |cumulo-util.calcit/ |respo-message.calcit/ |cumulo-reel.calcit/ |respo-feather.calcit/ |alerts.calcit/ |respo-markdown.calcit/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:port 6001) (:reload-fn |app.server/reload!)
      :modules $ [] |lilac/ |recollect/ |memof/ |cumulo-util.calcit/ |cumulo-reel.calcit/ |calcit.std/ |calcit-wss/
  :files $ {}
    |app.client $ %{} :FileEntry
      :defs $ {}
        |*states $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defatom)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |{})
                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |{})
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:cursor)
                              |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |[])
        |*store $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defatom)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store)
              |r $ %{} :Expr (:at 1695975614447) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1695975614736) (:by |B1y7Rc-Zz) (:text |::)
                  |b $ %{} :Leaf (:at 1695975616986) (:by |B1y7Rc-Zz) (:text |:initial)
        |connect! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-obj)
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-parse)
                              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/location.href)
                              |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |true)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |host)
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |either)
                              |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |->)
                                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-obj)
                                  |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-query)
                                  |v $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-host)
                              |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/location.hostname)
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |port)
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |either)
                              |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |->)
                                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-obj)
                                  |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-query)
                                  |v $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |.-port)
                              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:port)
                                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/site)
                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-connect!)
                      |j $ %{} :Expr (:at 1695138596678) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1695138597135) (:by |B1y7Rc-Zz) (:text |if)
                          |L $ %{} :Leaf (:at 1695138599530) (:by |B1y7Rc-Zz) (:text |config/dev?)
                          |T $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |str)
                              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"ws://")
                              |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |host)
                              |v $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\":")
                              |x $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |port)
                          |b $ %{} :Leaf (:at 1695138613396) (:by |B1y7Rc-Zz) (:text "|\"wss://timegrass.topix.im/ws")
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |{})
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:on-open)
                              |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn)
                                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |event)
                                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |simulate-login!)
                          |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:on-close)
                              |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn)
                                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |event)
                                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |reset!)
                                      |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store)
                                      |r $ %{} :Expr (:at 1695975630757) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975631910) (:by |B1y7Rc-Zz) (:text |::)
                                          |b $ %{} :Leaf (:at 1695975633834) (:by |B1y7Rc-Zz) (:text |:offline)
                                  |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |js/console.error)
                                      |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Lost connection!")
                          |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:on-data)
                              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-server-data)
        |dispatch! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |dispatch!)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op)
              |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |when)
                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |and)
                      |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/dev?)
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |not=)
                          |j $ %{} :Expr (:at 1695057701066) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1695057704758) (:by |B1y7Rc-Zz) (:text |nth)
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op)
                              |b $ %{} :Leaf (:at 1695057703135) (:by |B1y7Rc-Zz) (:text |0)
                          |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states)
                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1677346452151) (:by |B1y7Rc-Zz) (:text |js/console.log)
                      |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Dispatch")
                      |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op)
              |x $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1695057708579) (:by |B1y7Rc-Zz) (:text |tag-match)
                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |op)
                  |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057716591) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states)
                          |b $ %{} :Leaf (:at 1695057717580) (:by |B1y7Rc-Zz) (:text |cursor)
                          |h $ %{} :Leaf (:at 1695057717807) (:by |B1y7Rc-Zz) (:text |s)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |reset!)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states)
                          |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |update-states)
                              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*states)
                              |r $ %{} :Leaf (:at 1695057721497) (:by |B1y7Rc-Zz) (:text |cursor)
                              |t $ %{} :Leaf (:at 1695057721689) (:by |B1y7Rc-Zz) (:text |s)
                  |x $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057723065) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:effect/connect)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!)
                  |y $ %{} :Expr (:at 1695057710782) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1695057711396) (:by |B1y7Rc-Zz) (:text |_)
                      |b $ %{} :Expr (:at 1695057711813) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057711813) (:by |B1y7Rc-Zz) (:text |ws-send!)
                          |b $ %{} :Leaf (:at 1695057715054) (:by |B1y7Rc-Zz) (:text |op)
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |main!)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
              |t $ %{} :Expr (:at 1629965585623) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629965585623) (:by |B1y7Rc-Zz) (:text |.!extend)
                  |j $ %{} :Leaf (:at 1629965585623) (:by |B1y7Rc-Zz) (:text |dayjs)
                  |r $ %{} :Leaf (:at 1629965585623) (:by |B1y7Rc-Zz) (:text |week-of-year)
              |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println)
                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Running mode:")
                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if)
                      |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/dev?)
                      |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"dev")
                      |v $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"release")
              |w $ %{} :Expr (:at 1677335250984) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1677335251378) (:by |B1y7Rc-Zz) (:text |if)
                  |b $ %{} :Leaf (:at 1677335253087) (:by |B1y7Rc-Zz) (:text |config/dev?)
                  |h $ %{} :Expr (:at 1677335267443) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1677335258704) (:by |B1y7Rc-Zz) (:text |load-console-formatter!)
              |x $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!)
              |y $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!)
              |yT $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch)
                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store)
                  |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes)
                  |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |store)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev)
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!)
              |yj $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch)
                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states)
                  |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes)
                  |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |states)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev)
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!)
              |yr $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-page-touch)
                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if)
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975881179) (:by |B1y7Rc-Zz) (:text |=)
                              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*store)
                              |n $ %{} :Expr (:at 1695975893248) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975893518) (:by |B1y7Rc-Zz) (:text |::)
                                  |b $ %{} :Leaf (:at 1695975895891) (:by |B1y7Rc-Zz) (:text |:offline)
                          |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |connect!)
              |yt $ %{} :Expr (:at 1695975316056) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1695975353554) (:by |B1y7Rc-Zz) (:text |visibility-heartbeat)
                  |b $ %{} :Expr (:at 1695975326165) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1695975326412) (:by |B1y7Rc-Zz) (:text |fn)
                      |X $ %{} :Expr (:at 1695975390380) (:by |B1y7Rc-Zz)
                        :data $ {}
                      |b $ %{} :Expr (:at 1695975326693) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695975328339) (:by |B1y7Rc-Zz) (:text |if)
                          |b $ %{} :Expr (:at 1695975332451) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975897604) (:by |B1y7Rc-Zz) (:text |map?)
                              |b $ %{} :Leaf (:at 1695975332451) (:by |B1y7Rc-Zz) (:text |@*store)
                          |h $ %{} :Expr (:at 1695975337681) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975340900) (:by |B1y7Rc-Zz) (:text |ws-send!)
                              |b $ %{} :Expr (:at 1695975341338) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975341625) (:by |B1y7Rc-Zz) (:text |::)
                                  |b $ %{} :Leaf (:at 1695975346407) (:by |B1y7Rc-Zz) (:text |:effect/ping)
              |yv $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println)
                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"App started!")
        |mount-target $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |def)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |mount-target)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |j $ %{} :Leaf (:at 1697653356758) (:by |B1y7Rc-Zz) (:text |js/document.querySelector)
                  |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\".app")
        |on-server-data $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-server-data)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |data)
              |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1695057748498) (:by |B1y7Rc-Zz) (:text |tag-match)
                  |f $ %{} :Leaf (:at 1695057754117) (:by |B1y7Rc-Zz) (:text |data)
                  |l $ %{} :Expr (:at 1695057755631) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057755762) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057757891) (:by |B1y7Rc-Zz) (:text |:patch)
                          |b $ %{} :Leaf (:at 1695057760412) (:by |B1y7Rc-Zz) (:text |changes)
                      |b $ %{} :Expr (:at 1695057763486) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057766103) (:by |B1y7Rc-Zz) (:text |do)
                          |h $ %{} :Expr (:at 1695057763486) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |when)
                              |b $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |config/dev?)
                              |h $ %{} :Expr (:at 1695057763486) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |js/console.log)
                                  |b $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text "|\"Changes")
                                  |h $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |changes)
                          |l $ %{} :Expr (:at 1695057763486) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |reset!)
                              |b $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |*store)
                              |h $ %{} :Expr (:at 1695057763486) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |patch-twig)
                                  |b $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |@*store)
                                  |h $ %{} :Leaf (:at 1695057763486) (:by |B1y7Rc-Zz) (:text |changes)
                  |o $ %{} :Expr (:at 1695975566611) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695975568418) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695975572358) (:by |B1y7Rc-Zz) (:text |:effect/pong)
                      |b $ %{} :Leaf (:at 1695975574484) (:by |B1y7Rc-Zz) (:text |:ok)
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |reload!)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if)
                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |or)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |some?)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |client-errors)
                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |hud!)
                      |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"error")
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |str)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |client-errors)
                  |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |do)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |hud!)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"inactive")
                          |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |nil)
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |remove-watch)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store)
                          |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes)
                      |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |remove-watch)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states)
                          |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes)
                      |x $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |clear-cache!)
                      |y $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!)
                      |yT $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*store)
                          |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes)
                          |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |store)
                                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev)
                              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!)
                      |yj $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |add-watch)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |*states)
                          |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:changes)
                          |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |states)
                                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |prev)
                              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!)
                      |yr $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Code updated.")
        |render-app! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render-app!)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render!)
                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |mount-target)
                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |comp-container)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:states)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*states)
                      |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |@*store)
                  |v $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |dispatch!)
        |simulate-login! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |simulate-login!)
              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |raw)
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |j $ %{} :Leaf (:at 1695057732649) (:by |B1y7Rc-Zz) (:text |js/localStorage.getItem)
                              |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:storage-key)
                                  |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config/site)
                  |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |if)
                      |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |some?)
                          |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |raw)
                      |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |do)
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |println)
                              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Found storage.")
                          |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |dispatch!)
                              |r $ %{} :Expr (:at 1695057734862) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1695057735510) (:by |B1y7Rc-Zz) (:text |::)
                                  |L $ %{} :Leaf (:at 1695057735845) (:by |B1y7Rc-Zz) (:text |:user/log-in)
                                  |T $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn)
                                      |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |raw)
                      |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |do)
                          |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695057741250) (:by |B1y7Rc-Zz) (:text |println)
                              |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"Found no storage.")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
          :data $ {}
            |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ns)
            |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.client)
            |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:require)
                |j $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |render!)
                        |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |clear-cache!)
                        |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |realize-ssr!)
                |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |respo.cursor)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |update-states)
                |v $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.comp.container)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |comp-container)
                |x $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.schema)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:as)
                    |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |schema)
                |y $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |app.config)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:as)
                    |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |config)
                |yT $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-edn.client)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-connect!)
                        |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |ws-send!)
                |yj $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |recollect.patch)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |patch-twig)
                |yr $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |on-page-touch)
                        |b $ %{} :Leaf (:at 1695975357590) (:by |B1y7Rc-Zz) (:text |visibility-heartbeat)
                |yv $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"url-parse")
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:default)
                    |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |url-parse)
                |yx $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"bottom-tip")
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:default)
                    |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |hud!)
                |yy $ %{} :Expr (:at 1629962933008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text "|\"./calcit.build-errors")
                    |j $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |:default)
                    |r $ %{} :Leaf (:at 1629962933008) (:by |B1y7Rc-Zz) (:text |client-errors)
                |yyj $ %{} :Expr (:at 1629965592877) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629965594109) (:by |B1y7Rc-Zz) (:text "|\"dayjs")
                    |j $ %{} :Leaf (:at 1629965598037) (:by |B1y7Rc-Zz) (:text |:default)
                    |r $ %{} :Leaf (:at 1629965599257) (:by |B1y7Rc-Zz) (:text |dayjs)
                |yyr $ %{} :Expr (:at 1629965620406) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629965620406) (:by |B1y7Rc-Zz) (:text "|\"dayjs/plugin/weekOfYear")
                    |j $ %{} :Leaf (:at 1629965620406) (:by |B1y7Rc-Zz) (:text |:default)
                    |r $ %{} :Leaf (:at 1629965620406) (:by |B1y7Rc-Zz) (:text |week-of-year)
    |app.comp.container $ %{} :FileEntry
      :defs $ {}
        |comp-container $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-container)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |states)
                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |store)
              |v $ %{} :Expr (:at 1695975764781) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1695975766279) (:by |B1y7Rc-Zz) (:text |case-default)
                  |L $ %{} :Leaf (:at 1695975768502) (:by |B1y7Rc-Zz) (:text |store)
                  |T $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |let)
                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:data)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |states)
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |session)
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:session)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |store)
                          |r $ %{} :Expr (:at 1525106928554) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1525106929232) (:by |root) (:text |router)
                              |j $ %{} :Expr (:at 1525106929915) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1525106930860) (:by |root) (:text |:router)
                                  |j $ %{} :Leaf (:at 1525106931558) (:by |root) (:text |store)
                          |v $ %{} :Expr (:at 1525106933346) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1525106935393) (:by |root) (:text |router-data)
                              |j $ %{} :Expr (:at 1525106935675) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1525106936827) (:by |root) (:text |:data)
                                  |j $ %{} :Leaf (:at 1525106937665) (:by |root) (:text |router)
                      |r $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |div)
                          |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |{})
                              |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:class-name)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |css-container)
                          |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-navigation)
                              |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:logged-in?)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:count)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                              |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:name)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                          |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |if)
                              |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:logged-in?)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |case-default)
                                  |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:name)
                                      |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                                  |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |<>)
                                      |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |str)
                                          |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text "|\"404 page:")
                                          |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                                  |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:home)
                                      |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-overview)
                                          |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |>>)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |states)
                                              |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:overview)
                                          |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:today)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                                          |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |get-in)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |[])
                                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:data)
                                                  |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:tasks)
                                  |o $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:history)
                                      |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-history)
                                          |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |>>)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |states)
                                              |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:history)
                                          |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |get-in)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |[])
                                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:data)
                                                  |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:week)
                                          |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |get-in)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |[])
                                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:data)
                                                  |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:tasks)
                                  |q $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:notes)
                                      |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-notes-page)
                                          |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |>>)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |states)
                                              |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:notes)
                                          |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:data)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                                          |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |get-in)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |session)
                                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |[])
                                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:router)
                                                  |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:data)
                                  |s $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:profile)
                                      |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-profile)
                                          |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:user)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                                          |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:data)
                                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |router)
                              |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-login)
                                  |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |>>)
                                      |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |states)
                                      |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:login)
                          |o $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-status-color)
                              |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:color)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                          |q $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |when)
                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |dev?)
                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-inspect)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text ||Store)
                                  |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                                  |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |{})
                                      |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:bottom)
                                          |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |0)
                                      |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:left)
                                          |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |0)
                                      |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:z-index)
                                          |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |9999)
                          |s $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-messages)
                              |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |get-in)
                                  |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                                  |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |[])
                                      |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:session)
                                      |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:messages)
                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |{})
                              |l $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |fn)
                                  |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |info)
                                      |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |d!)
                                  |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |d!)
                                      |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:session/remove-message)
                                      |h $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |info)
                          |t $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |when)
                              |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |dev?)
                              |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |comp-reel)
                                  |b $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |:reel-length)
                                      |b $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |store)
                                  |h $ %{} :Expr (:at 1695975848964) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975848964) (:by |B1y7Rc-Zz) (:text |{})
                  |a $ %{} :Expr (:at 1695975798336) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695975798336) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695975798336) (:by |B1y7Rc-Zz) (:text |::)
                          |b $ %{} :Leaf (:at 1695975798336) (:by |B1y7Rc-Zz) (:text |:initial)
                      |b $ %{} :Expr (:at 1695975798336) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695975798336) (:by |B1y7Rc-Zz) (:text |comp-offline)
                          |b $ %{} :Leaf (:at 1695975798336) (:by |B1y7Rc-Zz) (:text |:initial)
                  |h $ %{} :Expr (:at 1695975781275) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695975781275) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695975781275) (:by |B1y7Rc-Zz) (:text |::)
                          |b $ %{} :Leaf (:at 1695975781275) (:by |B1y7Rc-Zz) (:text |:offline)
                      |b $ %{} :Expr (:at 1695975781275) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695975781275) (:by |B1y7Rc-Zz) (:text |comp-offline)
                          |b $ %{} :Leaf (:at 1695975781275) (:by |B1y7Rc-Zz) (:text |:offline)
        |comp-offline $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1519314599832) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1521951399872) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |comp-offline)
              |n $ %{} :Expr (:at 1521951400852) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1695975716323) (:by |B1y7Rc-Zz) (:text |state)
              |r $ %{} :Expr (:at 1519314599832) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |div)
                  |j $ %{} :Expr (:at 1519314599832) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |{})
                      |j $ %{} :Expr (:at 1519314599832) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790464234) (:by |B1y7Rc-Zz) (:text |:class-name)
                          |b $ %{} :Leaf (:at 1657790468410) (:by |B1y7Rc-Zz) (:text |css-offline)
                  |n $ %{} :Expr (:at 1560786556478) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1560786594923) (:by |B1y7Rc-Zz) (:text |div)
                      |j $ %{} :Expr (:at 1560786595198) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1560786595561) (:by |B1y7Rc-Zz) (:text |{})
                          |j $ %{} :Expr (:at 1560786606462) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1560786608137) (:by |B1y7Rc-Zz) (:text |:style)
                              |j $ %{} :Expr (:at 1560786608374) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1560786608727) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1560786609168) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1560786610154) (:by |B1y7Rc-Zz) (:text |:height)
                                      |j $ %{} :Leaf (:at 1560786610806) (:by |B1y7Rc-Zz) (:text |0)
                  |p $ %{} :Expr (:at 1560786615473) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1560786616047) (:by |B1y7Rc-Zz) (:text |div)
                      |j $ %{} :Expr (:at 1560786616276) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1560786616651) (:by |B1y7Rc-Zz) (:text |{})
                          |j $ %{} :Expr (:at 1560786616885) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1560786617650) (:by |B1y7Rc-Zz) (:text |:style)
                              |j $ %{} :Expr (:at 1560786618399) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1560786618745) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1560786619084) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1560786623896) (:by |B1y7Rc-Zz) (:text |:background-image)
                                      |j $ %{} :Expr (:at 1560786624593) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1560786649894) (:by |B1y7Rc-Zz) (:text |str)
                                          |j $ %{} :Leaf (:at 1560786684090) (:by |B1y7Rc-Zz) (:text "|\"url(")
                                          |n $ %{} :Expr (:at 1560786653991) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1560786655147) (:by |B1y7Rc-Zz) (:text |:icon)
                                              |j $ %{} :Leaf (:at 1560786662127) (:by |B1y7Rc-Zz) (:text |config/site)
                                          |r $ %{} :Leaf (:at 1560786652861) (:by |B1y7Rc-Zz) (:text "|\")")
                                  |r $ %{} :Expr (:at 1560786626567) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1560786629509) (:by |B1y7Rc-Zz) (:text |:width)
                                      |j $ %{} :Leaf (:at 1560786631277) (:by |B1y7Rc-Zz) (:text |128)
                                  |v $ %{} :Expr (:at 1560786631801) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1560786633270) (:by |B1y7Rc-Zz) (:text |:height)
                                      |j $ %{} :Leaf (:at 1560786639326) (:by |B1y7Rc-Zz) (:text |128)
                                  |x $ %{} :Expr (:at 1560786640079) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1560786643359) (:by |B1y7Rc-Zz) (:text |:background-size)
                                      |j $ %{} :Leaf (:at 1560786644360) (:by |B1y7Rc-Zz) (:text |:contain)
                  |r $ %{} :Expr (:at 1519314599832) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |span)
                      |j $ %{} :Expr (:at 1519314599832) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |{})
                          |j $ %{} :Expr (:at 1519314599832) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |:style)
                              |j $ %{} :Expr (:at 1519314599832) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1519314599832) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |:cursor)
                                      |j $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |:pointer)
                          |r $ %{} :Expr (:at 1519314599832) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |:on-click)
                              |j $ %{} :Expr (:at 1584879193836) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1584879194365) (:by |B1y7Rc-Zz) (:text |fn)
                                  |L $ %{} :Expr (:at 1584879194596) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1584879194821) (:by |B1y7Rc-Zz) (:text |e)
                                      |j $ %{} :Leaf (:at 1584879195763) (:by |B1y7Rc-Zz) (:text |d!)
                                  |T $ %{} :Expr (:at 1519314599832) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1584879193434) (:by |B1y7Rc-Zz) (:text |d!)
                                      |j $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |:effect/connect)
                                      |r $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |nil)
                      |r $ %{} :Expr (:at 1519314599832) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1519314599832) (:by |root) (:text |<>)
                          |j $ %{} :Expr (:at 1695975724104) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1695975724791) (:by |B1y7Rc-Zz) (:text |if)
                              |L $ %{} :Expr (:at 1695975727127) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1695975729795) (:by |B1y7Rc-Zz) (:text |=)
                                  |L $ %{} :Leaf (:at 1695975731105) (:by |B1y7Rc-Zz) (:text |:initial)
                                  |T $ %{} :Leaf (:at 1695975725548) (:by |B1y7Rc-Zz) (:text |state)
                              |P $ %{} :Leaf (:at 1695975735081) (:by |B1y7Rc-Zz) (:text "|\"Loading...")
                              |T $ %{} :Leaf (:at 1521911618586) (:by |root) (:text "||Socket broken! Click to retry.")
                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:font-family)
                                  |j $ %{} :Leaf (:at 1521951303103) (:by |root) (:text |ui/font-fancy)
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:font-weight)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |100)
                              |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:font-size)
                                  |j $ %{} :Leaf (:at 1560786711494) (:by |B1y7Rc-Zz) (:text |24)
        |comp-status-color $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1524279216692) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1524279218316) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1524279216692) (:by |root) (:text |comp-status-color)
              |r $ %{} :Expr (:at 1524279216692) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1524279220380) (:by |root) (:text |color)
              |v $ %{} :Expr (:at 1524279221052) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1524279221503) (:by |root) (:text |div)
                  |j $ %{} :Expr (:at 1524279221753) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1524279222145) (:by |root) (:text |{})
                      |b $ %{} :Expr (:at 1657791384447) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657791387640) (:by |B1y7Rc-Zz) (:text |:class-name)
                          |b $ %{} :Leaf (:at 1657791395605) (:by |B1y7Rc-Zz) (:text |css-status-color)
                      |j $ %{} :Expr (:at 1524279222434) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1524279223333) (:by |root) (:text |:style)
                          |j $ %{} :Expr (:at 1524279223555) (:by |root)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1657791422427) (:by |B1y7Rc-Zz) (:text |{})
                              |L $ %{} :Expr (:at 1657791422978) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657791422978) (:by |B1y7Rc-Zz) (:text |:background-color)
                                  |b $ %{} :Leaf (:at 1657791422978) (:by |B1y7Rc-Zz) (:text |color)
                              |T $ %{} :Leaf (:at 1657791420359) (:by |B1y7Rc-Zz) (:text |)
        |css-container $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1657790534708) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1657790536530) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1657790534708) (:by |B1y7Rc-Zz) (:text |css-container)
              |h $ %{} :Expr (:at 1657790534708) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1657790537999) (:by |B1y7Rc-Zz) (:text |{})
                  |b $ %{} :Expr (:at 1657790538277) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1657790539332) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1657790541250) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |merge)
                          |b $ %{} :Leaf (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |ui/global)
                          |h $ %{} :Leaf (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |ui/fullscreen)
                          |l $ %{} :Leaf (:at 1657790541250) (:by |B1y7Rc-Zz) (:text |ui/column)
        |css-offline $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1657790468736) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1657790482645) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1657790472509) (:by |B1y7Rc-Zz) (:text |css-offline)
              |h $ %{} :Expr (:at 1657790476345) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1657790477587) (:by |B1y7Rc-Zz) (:text |{})
                  |T $ %{} :Expr (:at 1657790478056) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1657790479614) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |T $ %{} :Expr (:at 1657790474314) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |merge)
                          |b $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |ui/global)
                          |h $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |ui/fullscreen)
                          |l $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |ui/column-dispersive)
                          |o $ %{} :Expr (:at 1657790474314) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |{})
                              |b $ %{} :Expr (:at 1657790474314) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |:background-color)
                                  |b $ %{} :Expr (:at 1657790474314) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |:theme)
                                      |b $ %{} :Leaf (:at 1657790474314) (:by |B1y7Rc-Zz) (:text |config/site)
        |css-status-color $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1657791400758) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1657791402160) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1657791400758) (:by |B1y7Rc-Zz) (:text |css-status-color)
              |h $ %{} :Expr (:at 1657791400758) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1657791404570) (:by |B1y7Rc-Zz) (:text |{})
                  |b $ %{} :Expr (:at 1657791405385) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1657791407061) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:width)
                              |b $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |16)
                          |h $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:height)
                              |b $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |16)
                          |l $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:position)
                              |b $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:absolute)
                          |o $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:bottom)
                              |b $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |16)
                          |q $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:right)
                              |b $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |8)
                          |t $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:border-radius)
                              |b $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text "|\"8px")
                          |u $ %{} :Expr (:at 1657791407469) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |:opacity)
                              |b $ %{} :Leaf (:at 1657791407469) (:by |B1y7Rc-Zz) (:text |0.8)
                          |v $ %{} :Expr (:at 1658934754885) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658934765167) (:by |B1y7Rc-Zz) (:text |:transition-duration)
                              |b $ %{} :Leaf (:at 1658934769976) (:by |B1y7Rc-Zz) (:text "|\"200ms")
                          |w $ %{} :Expr (:at 1658934843230) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658934845979) (:by |B1y7Rc-Zz) (:text |:opacity)
                              |b $ %{} :Leaf (:at 1658934947011) (:by |B1y7Rc-Zz) (:text |0.5)
                  |h $ %{} :Expr (:at 1658934849400) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658934875109) (:by |B1y7Rc-Zz) (:text "|\"$0:hover")
                      |b $ %{} :Expr (:at 1658934854690) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1658934855197) (:by |B1y7Rc-Zz) (:text |{})
                          |T $ %{} :Expr (:at 1658934854284) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658934854284) (:by |B1y7Rc-Zz) (:text |:opacity)
                              |b $ %{} :Leaf (:at 1658934935912) (:by |B1y7Rc-Zz) (:text |0.7)
        |style-body $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |style-body)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:padding)
                      |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text "||8px 16px")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541010211) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.comp.container)
            |v $ %{} :Expr (:at 1500541010211) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |hsl.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |hsl)
                |r $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1516547378489) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui)
                |u $ %{} :Expr (:at 1657790485756) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790487540) (:by |B1y7Rc-Zz) (:text |respo-ui.css)
                    |b $ %{} :Leaf (:at 1657790488028) (:by |B1y7Rc-Zz) (:text |:as)
                    |h $ %{} :Leaf (:at 1657790488602) (:by |B1y7Rc-Zz) (:text |css)
                |v $ %{} :Expr (:at 1657790513065) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790514501) (:by |B1y7Rc-Zz) (:text |respo.css)
                    |b $ %{} :Leaf (:at 1657790516358) (:by |B1y7Rc-Zz) (:text |:refer)
                    |h $ %{} :Expr (:at 1657790516716) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1657790516991) (:by |B1y7Rc-Zz) (:text |defstyle)
                |x $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1542907252464) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
                        |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                        |t $ %{} :Leaf (:at 1584878865372) (:by |B1y7Rc-Zz) (:text |>>)
                        |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                        |x $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |span)
                        |y $ %{} :Leaf (:at 1507815955483) (:by |root) (:text |button)
                |y $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |respo.comp.inspect)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-inspect)
                |yD $ %{} :Expr (:at 1507816109319) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1507816117447) (:by |root) (:text |respo.comp.space)
                    |r $ %{} :Leaf (:at 1507816112686) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1507816113982) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1507816114704) (:by |root) (:text |=<)
                |yT $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1523120275079) (:by |root) (:text |app.comp.navigation)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1523120276563) (:by |root) (:text |comp-navigation)
                |yj $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.comp.profile)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-profile)
                |yr $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.comp.login)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-login)
                |yv $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1529230826824) (:by |root) (:text |respo-message.comp.messages)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1529230829559) (:by |root) (:text |comp-messages)
                |yx $ %{} :Expr (:at 1507828725931) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1543426558411) (:by |B1y7Rc-Zz) (:text |cumulo-reel.comp.reel)
                    |r $ %{} :Leaf (:at 1507828731528) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1507828731735) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1507828733743) (:by |root) (:text |comp-reel)
                |yy $ %{} :Expr (:at 1521911479054) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1527789167264) (:by |root) (:text |app.config)
                    |r $ %{} :Leaf (:at 1521911483589) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1521911483778) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1521911485489) (:by |root) (:text |dev?)
                |yyj $ %{} :Expr (:at 1529230793085) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1529230796079) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1529230796499) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1529230797248) (:by |root) (:text |schema)
                |yyr $ %{} :Expr (:at 1533618669977) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1533618674804) (:by |root) (:text |app.comp.overview)
                    |r $ %{} :Leaf (:at 1533618675473) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1533618675752) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1533618679378) (:by |root) (:text |comp-overview)
                |yyv $ %{} :Expr (:at 1536733201791) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1536733201791) (:by |B1y7Rc-Zz) (:text |app.config)
                    |r $ %{} :Leaf (:at 1536733201791) (:by |B1y7Rc-Zz) (:text |:as)
                    |v $ %{} :Leaf (:at 1536733201791) (:by |B1y7Rc-Zz) (:text |config)
                |yyx $ %{} :Expr (:at 1537204685392) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1537204685392) (:by |root) (:text |app.comp.history)
                    |r $ %{} :Leaf (:at 1537204685392) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1537204685392) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1537204685392) (:by |root) (:text |comp-history)
                |yyyT $ %{} :Expr (:at 1556645418463) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1556645418463) (:by |B1y7Rc-Zz) (:text |app.comp.notes-page)
                    |r $ %{} :Leaf (:at 1556645418463) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1556645418463) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1556645418463) (:by |B1y7Rc-Zz) (:text |comp-notes-page)
    |app.comp.history $ %{} :FileEntry
      :defs $ {}
        |comp-done-task $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1536732529782) (:by |B1y7Rc-Zz) (:text |defcomp)
              |j $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |comp-done-task)
              |n $ %{} :Expr (:at 1536732530658) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1538156219849) (:by |root) (:text |states)
                  |T $ %{} :Leaf (:at 1536732532106) (:by |B1y7Rc-Zz) (:text |task)
              |r $ %{} :Expr (:at 1538156319059) (:by |root)
                :data $ {}
                  |D $ %{} :Leaf (:at 1538156320470) (:by |root) (:text |let)
                  |L $ %{} :Expr (:at 1538156320703) (:by |root)
                    :data $ {}
                      |D $ %{} :Expr (:at 1584879268922) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1584879269866) (:by |B1y7Rc-Zz) (:text |cursor)
                          |j $ %{} :Expr (:at 1584879270076) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1584879271108) (:by |B1y7Rc-Zz) (:text |:cursor)
                              |j $ %{} :Leaf (:at 1584879502137) (:by |B1y7Rc-Zz) (:text |states)
                      |T $ %{} :Expr (:at 1538156320871) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1538156333250) (:by |root) (:text |state)
                          |j $ %{} :Expr (:at 1538156333573) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1538156334123) (:by |root) (:text |or)
                              |j $ %{} :Expr (:at 1538156334350) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1538156336180) (:by |root) (:text |:data)
                                  |j $ %{} :Leaf (:at 1538156337585) (:by |root) (:text |states)
                              |r $ %{} :Expr (:at 1538156338779) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1538156339352) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1538156339688) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1538156341590) (:by |root) (:text |:show-menu?)
                                      |j $ %{} :Leaf (:at 1538156806313) (:by |root) (:text |false)
                  |T $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |div)
                      |j $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935441660) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935443861) (:by |B1y7Rc-Zz) (:text |:class-name)
                              |b $ %{} :Leaf (:at 1658935458653) (:by |B1y7Rc-Zz) (:text |css-done-task)
                          |j $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |:style)
                              |j $ %{} :Expr (:at 1537205669500) (:by |root)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1537205670912) (:by |root) (:text |merge)
                                  |j $ %{} :Expr (:at 1537205671698) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1537205672102) (:by |root) (:text |{})
                                      |j $ %{} :Expr (:at 1537205672381) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1537205673542) (:by |root) (:text |:padding)
                                          |j $ %{} :Leaf (:at 1557586705243) (:by |B1y7Rc-Zz) (:text "|\"4px 8px")
                                  |r $ %{} :Expr (:at 1538239935263) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1538239936238) (:by |root) (:text |when)
                                      |j $ %{} :Expr (:at 1538239936681) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1538239940039) (:by |root) (:text |:show-menu?)
                                          |j $ %{} :Leaf (:at 1538239941704) (:by |root) (:text |state)
                                      |r $ %{} :Expr (:at 1538239942769) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1538239943120) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1538239943492) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1538239947358) (:by |root) (:text |:background-color)
                                              |j $ %{} :Expr (:at 1538239947589) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1538239948699) (:by |root) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1538239949026) (:by |root) (:text |0)
                                                  |r $ %{} :Leaf (:at 1538239949332) (:by |root) (:text |0)
                                                  |v $ %{} :Leaf (:at 1538239955630) (:by |root) (:text |94)
                          |r $ %{} :Expr (:at 1538156784826) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1538156787336) (:by |root) (:text |:on-click)
                              |j $ %{} :Expr (:at 1538156787736) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1538156788116) (:by |root) (:text |fn)
                                  |j $ %{} :Expr (:at 1538156788371) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1538156788609) (:by |root) (:text |e)
                                      |j $ %{} :Leaf (:at 1538156789257) (:by |root) (:text |d!)
                                  |r $ %{} :Expr (:at 1538156790942) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1584879275417) (:by |B1y7Rc-Zz) (:text |d!)
                                      |b $ %{} :Leaf (:at 1584879276363) (:by |B1y7Rc-Zz) (:text |cursor)
                                      |j $ %{} :Expr (:at 1538156792315) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1538156798880) (:by |root) (:text |assoc)
                                          |j $ %{} :Leaf (:at 1538156796795) (:by |root) (:text |state)
                                          |r $ %{} :Leaf (:at 1538156803280) (:by |root) (:text |:show-menu?)
                                          |v $ %{} :Leaf (:at 1538156804543) (:by |root) (:text |true)
                      |r $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |<>)
                          |j $ %{} :Expr (:at 1658935484809) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1658935485598) (:by |B1y7Rc-Zz) (:text |->)
                              |H $ %{} :Expr (:at 1658935497720) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1658935497720) (:by |B1y7Rc-Zz) (:text |:finished-time)
                                  |b $ %{} :Leaf (:at 1658935497720) (:by |B1y7Rc-Zz) (:text |task)
                              |L $ %{} :Leaf (:at 1658935489487) (:by |B1y7Rc-Zz) (:text |dayjs)
                              |T $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1658935434951) (:by |B1y7Rc-Zz) (:text |.!format)
                                  |r $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text "|\"HH:mm")
                          |r $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |:min-width)
                                  |j $ %{} :Leaf (:at 1557586990143) (:by |B1y7Rc-Zz) (:text |32)
                              |r $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |:color)
                                  |j $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |hsl)
                                      |j $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |0)
                                      |r $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |0)
                                      |v $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |80)
                              |v $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |:font-size)
                                  |j $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |12)
                              |x $ %{} :Expr (:at 1557586964401) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |:display)
                                  |j $ %{} :Leaf (:at 1557586964401) (:by |B1y7Rc-Zz) (:text |:inline-block)
                      |t $ %{} :Expr (:at 1557586877586) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557586878761) (:by |B1y7Rc-Zz) (:text |=<)
                          |j $ %{} :Leaf (:at 1557586983808) (:by |B1y7Rc-Zz) (:text |4)
                          |r $ %{} :Leaf (:at 1557586880301) (:by |B1y7Rc-Zz) (:text |nil)
                      |v $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557586869174) (:by |B1y7Rc-Zz) (:text |span)
                          |j $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |:style)
                                  |j $ %{} :Expr (:at 1537205639633) (:by |root)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1537205641989) (:by |root) (:text |merge)
                                      |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |ui/flex)
                                      |j $ %{} :Expr (:at 1537205642697) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1537205643834) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1537205644225) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1537205647137) (:by |root) (:text |:line-height)
                                              |j $ %{} :Leaf (:at 1537205651787) (:by |root) (:text "|\"24px")
                          |r $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |<>)
                              |j $ %{} :Expr (:at 1536732528170) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |:text)
                                  |j $ %{} :Leaf (:at 1536732528170) (:by |B1y7Rc-Zz) (:text |task)
                      |w $ %{} :Expr (:at 1572937317170) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1572937331632) (:by |B1y7Rc-Zz) (:text |comp-modal-menu)
                          |r $ %{} :Expr (:at 1572937335855) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572937336184) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1572937336710) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572937337438) (:by |B1y7Rc-Zz) (:text |:title)
                                  |j $ %{} :Leaf (:at 1572937341514) (:by |B1y7Rc-Zz) (:text "|\"Operations")
                              |r $ %{} :Expr (:at 1572937343044) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572937344978) (:by |B1y7Rc-Zz) (:text |:style)
                                  |j $ %{} :Expr (:at 1572937345207) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572937345532) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1572937345832) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937347687) (:by |B1y7Rc-Zz) (:text |:width)
                                          |j $ %{} :Leaf (:at 1572937350227) (:by |B1y7Rc-Zz) (:text |320)
                              |v $ %{} :Expr (:at 1584879757983) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1584879758878) (:by |B1y7Rc-Zz) (:text |:items)
                                  |j $ %{} :Expr (:at 1584879759278) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1584879759278) (:by |B1y7Rc-Zz) (:text |[])
                                      |j $ %{} :Expr (:at 1584879759278) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879759278) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1584879759278) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879759278) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1584879759278) (:by |B1y7Rc-Zz) (:text |:put-back)
                                          |r $ %{} :Expr (:at 1584879759278) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879759278) (:by |B1y7Rc-Zz) (:text |:display)
                                              |j $ %{} :Leaf (:at 1584879759278) (:by |B1y7Rc-Zz) (:text "|\"Put back")
                          |u $ %{} :Expr (:at 1584880091893) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1584880091893) (:by |B1y7Rc-Zz) (:text |:show-menu?)
                              |j $ %{} :Leaf (:at 1584880091893) (:by |B1y7Rc-Zz) (:text |state)
                          |x $ %{} :Expr (:at 1572937373941) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572937374259) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1572937379002) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |r $ %{} :Leaf (:at 1584879279358) (:by |B1y7Rc-Zz) (:text |d!)
                              |r $ %{} :Expr (:at 1572937382189) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1584879281199) (:by |B1y7Rc-Zz) (:text |d!)
                                  |b $ %{} :Leaf (:at 1584879282365) (:by |B1y7Rc-Zz) (:text |cursor)
                                  |j $ %{} :Expr (:at 1572937382189) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572937382189) (:by |B1y7Rc-Zz) (:text |assoc)
                                      |j $ %{} :Leaf (:at 1572937382189) (:by |B1y7Rc-Zz) (:text |state)
                                      |r $ %{} :Leaf (:at 1572937382189) (:by |B1y7Rc-Zz) (:text |:show-menu?)
                                      |v $ %{} :Leaf (:at 1572937382189) (:by |B1y7Rc-Zz) (:text |false)
                          |y $ %{} :Expr (:at 1572937384057) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572937384329) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1572937384582) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572937387608) (:by |B1y7Rc-Zz) (:text |item)
                                  |j $ %{} :Leaf (:at 1572937388074) (:by |B1y7Rc-Zz) (:text |d!)
                              |n $ %{} :Expr (:at 1572937397821) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1584879288792) (:by |B1y7Rc-Zz) (:text |d!)
                                  |b $ %{} :Leaf (:at 1584879289752) (:by |B1y7Rc-Zz) (:text |cursor)
                                  |j $ %{} :Expr (:at 1572937397821) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572937397821) (:by |B1y7Rc-Zz) (:text |assoc)
                                      |j $ %{} :Leaf (:at 1572937397821) (:by |B1y7Rc-Zz) (:text |state)
                                      |r $ %{} :Leaf (:at 1572937397821) (:by |B1y7Rc-Zz) (:text |:show-menu?)
                                      |v $ %{} :Leaf (:at 1572937397821) (:by |B1y7Rc-Zz) (:text |false)
                              |r $ %{} :Expr (:at 1572937394928) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572937394928) (:by |B1y7Rc-Zz) (:text |when)
                                  |j $ %{} :Expr (:at 1572937394928) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572937394928) (:by |B1y7Rc-Zz) (:text |=)
                                      |j $ %{} :Leaf (:at 1572937394928) (:by |B1y7Rc-Zz) (:text |:put-back)
                                      |r $ %{} :Expr (:at 1572937598886) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937600845) (:by |B1y7Rc-Zz) (:text |:value)
                                          |j $ %{} :Leaf (:at 1572937601589) (:by |B1y7Rc-Zz) (:text |item)
                                  |r $ %{} :Expr (:at 1572937394928) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572937394928) (:by |B1y7Rc-Zz) (:text |d!)
                                      |j $ %{} :Leaf (:at 1572937394928) (:by |B1y7Rc-Zz) (:text |:task/put-back)
                                      |r $ %{} :Expr (:at 1572937394928) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937394928) (:by |B1y7Rc-Zz) (:text |:id)
                                          |j $ %{} :Leaf (:at 1572937394928) (:by |B1y7Rc-Zz) (:text |task)
        |comp-history $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-history)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |5 $ %{} :Leaf (:at 1538156204907) (:by |root) (:text |states)
                  |9 $ %{} :Leaf (:at 1556558370326) (:by |B1y7Rc-Zz) (:text |data)
                  |D $ %{} :Leaf (:at 1537205272307) (:by |root) (:text |finished-tasks)
              |v $ %{} :Expr (:at 1556558353629) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1556558354373) (:by |B1y7Rc-Zz) (:text |let)
                  |L $ %{} :Expr (:at 1556558354666) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1556558354872) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556558359891) (:by |B1y7Rc-Zz) (:text |year)
                          |j $ %{} :Expr (:at 1556558360365) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556558361527) (:by |B1y7Rc-Zz) (:text |:year)
                              |j $ %{} :Leaf (:at 1556558363487) (:by |B1y7Rc-Zz) (:text |data)
                      |j $ %{} :Expr (:at 1556558364409) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556558366638) (:by |B1y7Rc-Zz) (:text |week)
                          |j $ %{} :Expr (:at 1556558366871) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556558367970) (:by |B1y7Rc-Zz) (:text |:week)
                              |j $ %{} :Leaf (:at 1556558368576) (:by |B1y7Rc-Zz) (:text |data)
                  |T $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                      |j $ %{} :Expr (:at 1537204652427) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537204653957) (:by |root) (:text |{})
                          |b $ %{} :Expr (:at 1657791497280) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791499788) (:by |B1y7Rc-Zz) (:text |:class-name)
                              |b $ %{} :Leaf (:at 1657791501714) (:by |B1y7Rc-Zz) (:text |css/flex)
                          |j $ %{} :Expr (:at 1537204654208) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1537204658325) (:by |root) (:text |:style)
                              |j $ %{} :Expr (:at 1537204658624) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537204658961) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1537205373359) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1537205375822) (:by |root) (:text |:padding)
                                      |j $ %{} :Leaf (:at 1557586742256) (:by |B1y7Rc-Zz) (:text "|\"16px 16px")
                                  |r $ %{} :Expr (:at 1537205720565) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1537205721975) (:by |root) (:text |:overflow)
                                      |j $ %{} :Leaf (:at 1537205722912) (:by |root) (:text |:auto)
                      |n $ %{} :Expr (:at 1572973329851) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1572973331364) (:by |B1y7Rc-Zz) (:text |div)
                          |L $ %{} :Expr (:at 1572973332908) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973332908) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1572973332908) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973332908) (:by |B1y7Rc-Zz) (:text |:style)
                                  |j $ %{} :Expr (:at 1572973332908) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973332908) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1572973332908) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973332908) (:by |B1y7Rc-Zz) (:text |:max-width)
                                          |j $ %{} :Leaf (:at 1572973332908) (:by |B1y7Rc-Zz) (:text |800)
                                      |r $ %{} :Expr (:at 1572973332908) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973332908) (:by |B1y7Rc-Zz) (:text |:margin)
                                          |j $ %{} :Leaf (:at 1572973332908) (:by |B1y7Rc-Zz) (:text |:auto)
                          |T $ %{} :Expr (:at 1538240032449) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1538240033440) (:by |root) (:text |div)
                              |j $ %{} :Expr (:at 1538240033698) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1538240034015) (:by |root) (:text |{})
                                  |b $ %{} :Expr (:at 1657791507065) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657791510707) (:by |B1y7Rc-Zz) (:text |:class-name)
                                      |b $ %{} :Leaf (:at 1657791514868) (:by |B1y7Rc-Zz) (:text |css/row-parted)
                                  |j $ %{} :Expr (:at 1538240043472) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1538240045559) (:by |root) (:text |:style)
                                      |j $ %{} :Expr (:at 1538240045887) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1538240046621) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1557246009103) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557246011414) (:by |B1y7Rc-Zz) (:text |:margin)
                                              |j $ %{} :Leaf (:at 1557586755732) (:by |B1y7Rc-Zz) (:text "|\"8px 0")
                              |r $ %{} :Expr (:at 1538240034474) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1538240034881) (:by |root) (:text |<>)
                                  |j $ %{} :Expr (:at 1545875924282) (:by |root)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1629964011123) (:by |B1y7Rc-Zz) (:text |str)
                                      |T $ %{} :Leaf (:at 1629964023666) (:by |B1y7Rc-Zz) (:text "|\"Histories of ")
                                      |X $ %{} :Leaf (:at 1629964024266) (:by |B1y7Rc-Zz) (:text |week)
                                      |b $ %{} :Leaf (:at 1629964020349) (:by |B1y7Rc-Zz) (:text "|\"th week in ")
                                      |j $ %{} :Leaf (:at 1629964016057) (:by |B1y7Rc-Zz) (:text |year)
                                  |r $ %{} :Expr (:at 1546793858740) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1546793858740) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1546793858740) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1546793858740) (:by |B1y7Rc-Zz) (:text |:font-family)
                                          |j $ %{} :Leaf (:at 1546793858740) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                                      |r $ %{} :Expr (:at 1546793858740) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1546793858740) (:by |B1y7Rc-Zz) (:text |:font-size)
                                          |j $ %{} :Leaf (:at 1557245964252) (:by |B1y7Rc-Zz) (:text |16)
                                      |v $ %{} :Expr (:at 1557245968601) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245972995) (:by |B1y7Rc-Zz) (:text |:color)
                                          |j $ %{} :Expr (:at 1557245973239) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245973563) (:by |B1y7Rc-Zz) (:text |hsl)
                                              |j $ %{} :Leaf (:at 1557245977960) (:by |B1y7Rc-Zz) (:text |0)
                                              |r $ %{} :Leaf (:at 1557245978580) (:by |B1y7Rc-Zz) (:text |0)
                                              |v $ %{} :Leaf (:at 1557245975383) (:by |B1y7Rc-Zz) (:text |50)
                              |v $ %{} :Expr (:at 1545876159242) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1545876159696) (:by |root) (:text |div)
                                  |j $ %{} :Expr (:at 1545876159971) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1545876160260) (:by |root) (:text |{})
                                      |j $ %{} :Expr (:at 1545876160484) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1657791523351) (:by |B1y7Rc-Zz) (:text |:class-name)
                                          |j $ %{} :Leaf (:at 1657791525079) (:by |B1y7Rc-Zz) (:text |css/row)
                                  |rT $ %{} :Expr (:at 1557245921153) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                      |j $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |:arrow-left)
                                      |r $ %{} :Expr (:at 1557245921153) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1557245921153) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |:font-size)
                                              |j $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |16)
                                          |r $ %{} :Expr (:at 1557245921153) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1557245921153) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |200)
                                                  |r $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |80)
                                                  |v $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Expr (:at 1557245921153) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |:cursor)
                                              |j $ %{} :Leaf (:at 1557245921153) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |fn)
                                          |j $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |e)
                                              |j $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |d!)
                                          |r $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |d!)
                                              |j $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |:router/change)
                                              |r $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |:name)
                                                      |j $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |:history)
                                                  |r $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |:data)
                                                      |j $ %{} :Expr (:at 1677346543450) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1677346544842) (:by |B1y7Rc-Zz) (:text |let)
                                                          |L $ %{} :Expr (:at 1677346545122) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |5 $ %{} :Expr (:at 1677346620328) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346629359) (:by |B1y7Rc-Zz) (:text |change-year?)
                                                                  |b $ %{} :Expr (:at 1677346631948) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1677346631948) (:by |B1y7Rc-Zz) (:text |<=)
                                                                      |b $ %{} :Leaf (:at 1677346631948) (:by |B1y7Rc-Zz) (:text |week)
                                                                      |h $ %{} :Leaf (:at 1677346631948) (:by |B1y7Rc-Zz) (:text |1)
                                                              |D $ %{} :Expr (:at 1677346589927) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346590776) (:by |B1y7Rc-Zz) (:text |y)
                                                                  |b $ %{} :Expr (:at 1677346598658) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1677346599074) (:by |B1y7Rc-Zz) (:text |if)
                                                                      |b $ %{} :Leaf (:at 1677346634251) (:by |B1y7Rc-Zz) (:text |change-year?)
                                                                      |h $ %{} :Expr (:at 1677346605935) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346605935) (:by |B1y7Rc-Zz) (:text |dec)
                                                                          |b $ %{} :Leaf (:at 1677346605935) (:by |B1y7Rc-Zz) (:text |year)
                                                                      |l $ %{} :Leaf (:at 1677346609612) (:by |B1y7Rc-Zz) (:text |year)
                                                              |T $ %{} :Expr (:at 1677346545256) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346545520) (:by |B1y7Rc-Zz) (:text |w)
                                                                  |b $ %{} :Expr (:at 1677346550619) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |D $ %{} :Leaf (:at 1677346551790) (:by |B1y7Rc-Zz) (:text |if)
                                                                      |T $ %{} :Leaf (:at 1677346636247) (:by |B1y7Rc-Zz) (:text |change-year?)
                                                                      |b $ %{} :Leaf (:at 1677346556448) (:by |B1y7Rc-Zz) (:text |53)
                                                                      |h $ %{} :Expr (:at 1677346558583) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346558583) (:by |B1y7Rc-Zz) (:text |dec)
                                                                          |b $ %{} :Leaf (:at 1677346558583) (:by |B1y7Rc-Zz) (:text |week)
                                                              |b $ %{} :Expr (:at 1677346738249) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346738710) (:by |B1y7Rc-Zz) (:text |d)
                                                                  |b $ %{} :Expr (:at 1677346742437) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1677346742923) (:by |B1y7Rc-Zz) (:text |->)
                                                                      |b $ %{} :Expr (:at 1677346744162) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346744860) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                                      |e $ %{} :Expr (:at 1677346754887) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346763943) (:by |B1y7Rc-Zz) (:text |.!year)
                                                                          |b $ %{} :Leaf (:at 1677346760836) (:by |B1y7Rc-Zz) (:text |y)
                                                                      |h $ %{} :Expr (:at 1677346747893) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346749666) (:by |B1y7Rc-Zz) (:text |.!week)
                                                                          |b $ %{} :Leaf (:at 1677346753440) (:by |B1y7Rc-Zz) (:text |w)
                                                          |T $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |{})
                                                              |j $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |:year)
                                                                  |j $ %{} :Leaf (:at 1677346615639) (:by |B1y7Rc-Zz) (:text |y)
                                                              |r $ %{} :Expr (:at 1557245925625) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1557245925625) (:by |B1y7Rc-Zz) (:text |:week)
                                                                  |b $ %{} :Leaf (:at 1677346561798) (:by |B1y7Rc-Zz) (:text |w)
                                                              |t $ %{} :Expr (:at 1677346768592) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346769815) (:by |B1y7Rc-Zz) (:text |:start)
                                                                  |b $ %{} :Expr (:at 1677346837069) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |D $ %{} :Leaf (:at 1677346840116) (:by |B1y7Rc-Zz) (:text |.!format)
                                                                      |T $ %{} :Expr (:at 1677346770473) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346772544) (:by |B1y7Rc-Zz) (:text |.!startOf)
                                                                          |X $ %{} :Leaf (:at 1677346777161) (:by |B1y7Rc-Zz) (:text |d)
                                                                          |b $ %{} :Leaf (:at 1677346774482) (:by |B1y7Rc-Zz) (:text "|\"week")
                                                              |u $ %{} :Expr (:at 1677346768592) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346780525) (:by |B1y7Rc-Zz) (:text |:end)
                                                                  |b $ %{} :Expr (:at 1677346841966) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |D $ %{} :Leaf (:at 1677346842506) (:by |B1y7Rc-Zz) (:text |.!format)
                                                                      |T $ %{} :Expr (:at 1677346770473) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346782272) (:by |B1y7Rc-Zz) (:text |.!endOf)
                                                                          |X $ %{} :Leaf (:at 1677346777161) (:by |B1y7Rc-Zz) (:text |d)
                                                                          |b $ %{} :Leaf (:at 1677346774482) (:by |B1y7Rc-Zz) (:text "|\"week")
                                  |rj $ %{} :Expr (:at 1557245939926) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245939926) (:by |B1y7Rc-Zz) (:text |=<)
                                      |j $ %{} :Leaf (:at 1557245939926) (:by |B1y7Rc-Zz) (:text |8)
                                      |r $ %{} :Leaf (:at 1557245939926) (:by |B1y7Rc-Zz) (:text |nil)
                                  |s $ %{} :Expr (:at 1557245884150) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245886509) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                      |j $ %{} :Leaf (:at 1557245936423) (:by |B1y7Rc-Zz) (:text |:arrow-right)
                                      |r $ %{} :Expr (:at 1557245902904) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1557245902904) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |:font-size)
                                              |j $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |16)
                                          |r $ %{} :Expr (:at 1557245902904) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1557245902904) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |200)
                                                  |r $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |80)
                                                  |v $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Expr (:at 1557245902904) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |:cursor)
                                              |j $ %{} :Leaf (:at 1557245902904) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Expr (:at 1557245907041) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |fn)
                                          |j $ %{} :Expr (:at 1557245907041) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |e)
                                              |j $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |d!)
                                          |r $ %{} :Expr (:at 1557245907041) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |d!)
                                              |j $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |:router/change)
                                              |r $ %{} :Expr (:at 1557245907041) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1557245907041) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |:name)
                                                      |j $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |:history)
                                                  |r $ %{} :Expr (:at 1557245907041) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557245907041) (:by |B1y7Rc-Zz) (:text |:data)
                                                      |j $ %{} :Expr (:at 1677346564499) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1677346566400) (:by |B1y7Rc-Zz) (:text |let)
                                                          |L $ %{} :Expr (:at 1677346566711) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |D $ %{} :Expr (:at 1677346640319) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346642479) (:by |B1y7Rc-Zz) (:text |change-year?)
                                                                  |b $ %{} :Expr (:at 1677346645047) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1677346645047) (:by |B1y7Rc-Zz) (:text |>=)
                                                                      |b $ %{} :Leaf (:at 1677346645047) (:by |B1y7Rc-Zz) (:text |week)
                                                                      |h $ %{} :Leaf (:at 1677346645047) (:by |B1y7Rc-Zz) (:text |53)
                                                              |L $ %{} :Expr (:at 1677346665061) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346665804) (:by |B1y7Rc-Zz) (:text |y)
                                                                  |b $ %{} :Expr (:at 1677346668530) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |D $ %{} :Leaf (:at 1677346669374) (:by |B1y7Rc-Zz) (:text |if)
                                                                      |L $ %{} :Leaf (:at 1677346671128) (:by |B1y7Rc-Zz) (:text |change-year?)
                                                                      |T $ %{} :Expr (:at 1677346667597) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346667597) (:by |B1y7Rc-Zz) (:text |inc)
                                                                          |b $ %{} :Leaf (:at 1677346667597) (:by |B1y7Rc-Zz) (:text |year)
                                                                      |b $ %{} :Leaf (:at 1677346675945) (:by |B1y7Rc-Zz) (:text |year)
                                                              |T $ %{} :Expr (:at 1677346567097) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346567830) (:by |B1y7Rc-Zz) (:text |w)
                                                                  |b $ %{} :Expr (:at 1677346648466) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |D $ %{} :Leaf (:at 1677346649849) (:by |B1y7Rc-Zz) (:text |if)
                                                                      |T $ %{} :Leaf (:at 1677346651679) (:by |B1y7Rc-Zz) (:text |change-year?)
                                                                      |b $ %{} :Leaf (:at 1677346656679) (:by |B1y7Rc-Zz) (:text |1)
                                                                      |h $ %{} :Expr (:at 1677346658182) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346658182) (:by |B1y7Rc-Zz) (:text |inc)
                                                                          |b $ %{} :Leaf (:at 1677346658182) (:by |B1y7Rc-Zz) (:text |week)
                                                              |b $ %{} :Expr (:at 1677346786164) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |d)
                                                                  |b $ %{} :Expr (:at 1677346786164) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |->)
                                                                      |b $ %{} :Expr (:at 1677346786164) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                                      |h $ %{} :Expr (:at 1677346786164) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |.!year)
                                                                          |b $ %{} :Leaf (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |y)
                                                                      |l $ %{} :Expr (:at 1677346786164) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |.!week)
                                                                          |b $ %{} :Leaf (:at 1677346786164) (:by |B1y7Rc-Zz) (:text |w)
                                                          |T $ %{} :Expr (:at 1677346682215) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |{})
                                                              |b $ %{} :Expr (:at 1677346682215) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |:year)
                                                                  |b $ %{} :Leaf (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |y)
                                                              |h $ %{} :Expr (:at 1677346682215) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |:week)
                                                                  |b $ %{} :Leaf (:at 1677346682215) (:by |B1y7Rc-Zz) (:text |w)
                                                              |l $ %{} :Expr (:at 1677346789645) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346789645) (:by |B1y7Rc-Zz) (:text |:start)
                                                                  |b $ %{} :Expr (:at 1677346843735) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |D $ %{} :Leaf (:at 1677346844291) (:by |B1y7Rc-Zz) (:text |.!format)
                                                                      |T $ %{} :Expr (:at 1677346789645) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346789645) (:by |B1y7Rc-Zz) (:text |.!startOf)
                                                                          |b $ %{} :Leaf (:at 1677346789645) (:by |B1y7Rc-Zz) (:text |d)
                                                                          |h $ %{} :Leaf (:at 1677346789645) (:by |B1y7Rc-Zz) (:text "|\"week")
                                                              |o $ %{} :Expr (:at 1677346791829) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346791829) (:by |B1y7Rc-Zz) (:text |:end)
                                                                  |b $ %{} :Expr (:at 1677346845124) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |D $ %{} :Leaf (:at 1677346845680) (:by |B1y7Rc-Zz) (:text |.!format)
                                                                      |T $ %{} :Expr (:at 1677346791829) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1677346791829) (:by |B1y7Rc-Zz) (:text |.!endOf)
                                                                          |b $ %{} :Leaf (:at 1677346791829) (:by |B1y7Rc-Zz) (:text |d)
                                                                          |h $ %{} :Leaf (:at 1677346791829) (:by |B1y7Rc-Zz) (:text "|\"week")
                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |empty?)
                                  |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |finished-tasks)
                              |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |div)
                                  |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                      |b $ %{} :Expr (:at 1657791543649) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1657791545542) (:by |B1y7Rc-Zz) (:text |:class-name)
                                          |b $ %{} :Leaf (:at 1657791547679) (:by |B1y7Rc-Zz) (:text |css/center)
                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:style)
                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:height)
                                                  |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |80)
                                  |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |<>)
                                      |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text "|\"No tasks.")
                                      |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:font-family)
                                              |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                                          |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |0)
                                                  |r $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |0)
                                                  |v $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |80)
                              |v $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |let)
                                  |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |grouped-tasks)
                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963710631) (:by |B1y7Rc-Zz) (:text |->)
                                              |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |finished-tasks)
                                              |n $ %{} :Expr (:at 1629963716810) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963719561) (:by |B1y7Rc-Zz) (:text |.to-list)
                                              |p $ %{} :Expr (:at 1629963723311) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963724063) (:by |B1y7Rc-Zz) (:text |.map)
                                                  |j $ %{} :Leaf (:at 1629963725665) (:by |B1y7Rc-Zz) (:text |last)
                                              |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |group-by)
                                                  |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task)
                                                      |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1658935422444) (:by |B1y7Rc-Zz) (:text |.!format)
                                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:finished-time)
                                                                  |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task)
                                                          |r $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text "|\"YYYY-MM-DD")
                                  |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |list->)
                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                      |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963728498) (:by |B1y7Rc-Zz) (:text |->)
                                          |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |grouped-tasks)
                                          |n $ %{} :Expr (:at 1629963731486) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963732688) (:by |B1y7Rc-Zz) (:text |.to-list)
                                          |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963729794) (:by |B1y7Rc-Zz) (:text |.sort)
                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |x)
                                                      |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |y)
                                                  |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629963734702) (:by |B1y7Rc-Zz) (:text |&compare)
                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |first)
                                                          |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |y)
                                                      |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |first)
                                                          |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |x)
                                          |v $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963739822) (:by |B1y7Rc-Zz) (:text |.map-pair)
                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |date-string)
                                                      |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task-list)
                                                  |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |[])
                                                      |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |date-string)
                                                      |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |div)
                                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                                              |b $ %{} :Expr (:at 1657791557018) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1657791559866) (:by |B1y7Rc-Zz) (:text |:class-name)
                                                                  |b $ %{} :Leaf (:at 1657791562179) (:by |B1y7Rc-Zz) (:text |css/column)
                                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:style)
                                                                  |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:margin-top)
                                                                          |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |16)
                                                          |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |let)
                                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |the-day)
                                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                                          |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |date-string)
                                                              |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |div)
                                                                  |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1657791569745) (:by |B1y7Rc-Zz) (:text |:class-name)
                                                                          |j $ %{} :Leaf (:at 1657791571507) (:by |B1y7Rc-Zz) (:text |css/row-parted)
                                                                  |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |span)
                                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1657795130561) (:by |B1y7Rc-Zz) (:text |:class-name)
                                                                              |b $ %{} :Leaf (:at 1657795134216) (:by |B1y7Rc-Zz) (:text |css/font-fancy)
                                                                      |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |<>)
                                                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |.format)
                                                                              |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |the-day)
                                                                              |r $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text "|\"ddd")
                                                                      |v $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |=<)
                                                                          |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |12)
                                                                          |r $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |nil)
                                                                      |x $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |<>)
                                                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |.format)
                                                                              |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |the-day)
                                                                              |r $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text "|\"MM-DD")
                                                          |v $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |=<)
                                                              |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |nil)
                                                              |r $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |4)
                                                          |x $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |list->)
                                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |{})
                                                              |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1629963745717) (:by |B1y7Rc-Zz) (:text |->)
                                                                  |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task-list)
                                                                  |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1629963747862) (:by |B1y7Rc-Zz) (:text |.sort-by)
                                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |fn)
                                                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task)
                                                                          |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1629963750254) (:by |B1y7Rc-Zz) (:text |negate)
                                                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                                :data $ {}
                                                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:finished-time)
                                                                                  |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task)
                                                                  |v $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1629963752883) (:by |B1y7Rc-Zz) (:text |.map)
                                                                      |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |fn)
                                                                          |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task)
                                                                          |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |[])
                                                                              |j $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                                :data $ {}
                                                                                  |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |:id)
                                                                                  |j $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task)
                                                                              |r $ %{} :Expr (:at 1572973338571) (:by |B1y7Rc-Zz)
                                                                                :data $ {}
                                                                                  |r $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |comp-done-task)
                                                                                  |v $ %{} :Expr (:at 1584879067792) (:by |B1y7Rc-Zz)
                                                                                    :data $ {}
                                                                                      |D $ %{} :Leaf (:at 1584879068499) (:by |B1y7Rc-Zz) (:text |>>)
                                                                                      |T $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |states)
                                                                                      |j $ %{} :Expr (:at 1584879069384) (:by |B1y7Rc-Zz)
                                                                                        :data $ {}
                                                                                          |T $ %{} :Leaf (:at 1584879069384) (:by |B1y7Rc-Zz) (:text |:id)
                                                                                          |j $ %{} :Leaf (:at 1584879069384) (:by |B1y7Rc-Zz) (:text |task)
                                                                                  |x $ %{} :Leaf (:at 1572973338571) (:by |B1y7Rc-Zz) (:text |task)
        |css-done-task $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1658935354557) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1658935355797) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1658935454514) (:by |B1y7Rc-Zz) (:text |css-done-task)
              |h $ %{} :Expr (:at 1658935354557) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1658935356894) (:by |B1y7Rc-Zz) (:text |{})
                  |X $ %{} :Expr (:at 1658935465827) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658935467110) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1658935468698) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935469039) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935469861) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935474175) (:by |B1y7Rc-Zz) (:text |:transition-duration)
                              |b $ %{} :Leaf (:at 1658935476005) (:by |B1y7Rc-Zz) (:text "|\"200ms")
                  |b $ %{} :Expr (:at 1658935357183) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658935364141) (:by |B1y7Rc-Zz) (:text "|\"$0:hover")
                      |b $ %{} :Expr (:at 1658935364463) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935364871) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935365142) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935368184) (:by |B1y7Rc-Zz) (:text |:background-color)
                              |b $ %{} :Expr (:at 1658935368504) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1658935369043) (:by |B1y7Rc-Zz) (:text |hsl)
                                  |b $ %{} :Leaf (:at 1658935369993) (:by |B1y7Rc-Zz) (:text |0)
                                  |h $ %{} :Leaf (:at 1658935370307) (:by |B1y7Rc-Zz) (:text |0)
                                  |l $ %{} :Leaf (:at 1658935373563) (:by |B1y7Rc-Zz) (:text |80)
                                  |o $ %{} :Leaf (:at 1658935374388) (:by |B1y7Rc-Zz) (:text |0.2)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541010211) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1537204636631) (:by |root) (:text |app.comp.history)
            |v $ %{} :Expr (:at 1500541010211) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1629963692715) (:by |B1y7Rc-Zz) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |hsl)
                |r $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1516547394445) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui)
                |t $ %{} :Expr (:at 1657791529173) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657791533010) (:by |B1y7Rc-Zz) (:text |respo-ui.css)
                    |b $ %{} :Leaf (:at 1657791534046) (:by |B1y7Rc-Zz) (:text |:as)
                    |h $ %{} :Leaf (:at 1657791534657) (:by |B1y7Rc-Zz) (:text |css)
                |u $ %{} :Expr (:at 1658935381186) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1658935382255) (:by |B1y7Rc-Zz) (:text |respo.css)
                    |b $ %{} :Leaf (:at 1658935382979) (:by |B1y7Rc-Zz) (:text |:refer)
                    |h $ %{} :Expr (:at 1658935383264) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1658935384526) (:by |B1y7Rc-Zz) (:text |defstyle)
                |w $ %{} :Expr (:at 1523120376505) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1523120379036) (:by |root) (:text |respo.comp.space)
                    |r $ %{} :Leaf (:at 1523120382218) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1523120382545) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1523120383255) (:by |root) (:text |=<)
                |x $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1542907257010) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
                        |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                        |sD $ %{} :Leaf (:at 1584879467100) (:by |B1y7Rc-Zz) (:text |>>)
                        |tT $ %{} :Leaf (:at 1537205312821) (:by |root) (:text |list->)
                        |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |span)
                        |x $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                |y $ %{} :Expr (:at 1536860674775) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1536860674775) (:by |root) (:text |app.config)
                    |r $ %{} :Leaf (:at 1536860674775) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1536860674775) (:by |root) (:text |config)
                |yj $ %{} :Expr (:at 1536861056679) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1572937587408) (:by |B1y7Rc-Zz) (:text |respo-alerts.core)
                    |r $ %{} :Leaf (:at 1536861065872) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1536861066155) (:by |root)
                      :data $ {}
                        |r $ %{} :Leaf (:at 1572937588899) (:by |B1y7Rc-Zz) (:text |comp-modal-menu)
                |yr $ %{} :Expr (:at 1537205302342) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1537205304265) (:by |root) (:text "|\"dayjs")
                    |r $ %{} :Leaf (:at 1629963697318) (:by |B1y7Rc-Zz) (:text |:default)
                    |v $ %{} :Leaf (:at 1537205306754) (:by |root) (:text |dayjs)
                |yx $ %{} :Expr (:at 1557245874705) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1557245877780) (:by |B1y7Rc-Zz) (:text |feather.core)
                    |r $ %{} :Leaf (:at 1557245879751) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1557245879951) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1557245881467) (:by |B1y7Rc-Zz) (:text |comp-icon)
    |app.comp.login $ %{} :FileEntry
      :defs $ {}
        |comp-login $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-login)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |states)
              |v $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |D $ %{} :Expr (:at 1584878970582) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1584878971306) (:by |B1y7Rc-Zz) (:text |cursor)
                          |j $ %{} :Expr (:at 1584878971558) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1584878973262) (:by |B1y7Rc-Zz) (:text |:cursor)
                              |j $ %{} :Leaf (:at 1584878974144) (:by |B1y7Rc-Zz) (:text |states)
                      |T $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |or)
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:data)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |states)
                              |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |initial-state)
                  |r $ %{} :Expr (:at 1519368111046) (:by |root)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1519368111912) (:by |root) (:text |div)
                      |L $ %{} :Expr (:at 1519368112156) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1519368113787) (:by |root) (:text |{})
                          |j $ %{} :Expr (:at 1519368114295) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1519368116587) (:by |root) (:text |:style)
                              |j $ %{} :Expr (:at 1519368119982) (:by |root)
                                :data $ {}
                                  |5 $ %{} :Leaf (:at 1519368124581) (:by |root) (:text |merge)
                                  |D $ %{} :Leaf (:at 1519368123630) (:by |root) (:text |ui/flex)
                                  |T $ %{} :Leaf (:at 1519368119197) (:by |root) (:text |ui/center)
                      |T $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                  |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |input)
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:placeholder)
                                              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text ||Username)
                                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:value)
                                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:username)
                                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                                          |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui/input)
                                          |x $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1514302367311) (:by |root) (:text |:on-input)
                                              |j $ %{} :Expr (:at 1584878937260) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |D $ %{} :Leaf (:at 1584878937919) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |L $ %{} :Expr (:at 1584878938450) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1584878938663) (:by |B1y7Rc-Zz) (:text |e)
                                                      |j $ %{} :Leaf (:at 1584878939257) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |f $ %{} :Expr (:at 1584878940724) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1584878941345) (:by |B1y7Rc-Zz) (:text |d!)
                                                      |j $ %{} :Leaf (:at 1584878942506) (:by |B1y7Rc-Zz) (:text |cursor)
                                                      |r $ %{} :Expr (:at 1584878944231) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1584878946740) (:by |B1y7Rc-Zz) (:text |assoc)
                                                          |j $ %{} :Leaf (:at 1584878953964) (:by |B1y7Rc-Zz) (:text |state)
                                                          |r $ %{} :Leaf (:at 1584878957010) (:by |B1y7Rc-Zz) (:text |:username)
                                                          |v $ %{} :Expr (:at 1584878962151) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1584878962807) (:by |B1y7Rc-Zz) (:text |:value)
                                                              |j $ %{} :Leaf (:at 1584878963013) (:by |B1y7Rc-Zz) (:text |e)
                              |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |nil)
                                  |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |8)
                              |x $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                  |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |input)
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:placeholder)
                                              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text ||Password)
                                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:value)
                                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:password)
                                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                                          |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui/input)
                                          |x $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1514302370752) (:by |root) (:text |:on-input)
                                              |j $ %{} :Expr (:at 1584878966316) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |j $ %{} :Expr (:at 1584878966316) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |e)
                                                      |j $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |r $ %{} :Expr (:at 1584878966316) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |d!)
                                                      |j $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |cursor)
                                                      |r $ %{} :Expr (:at 1584878966316) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |assoc)
                                                          |j $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |state)
                                                          |r $ %{} :Leaf (:at 1584878968508) (:by |B1y7Rc-Zz) (:text |:password)
                                                          |v $ %{} :Expr (:at 1584878966316) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |:value)
                                                              |j $ %{} :Leaf (:at 1584878966316) (:by |B1y7Rc-Zz) (:text |e)
                          |v $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |nil)
                              |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |8)
                          |x $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                      |j $ %{} :Expr (:at 1519368067092) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1519368067501) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1519368135916) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1519368141461) (:by |root) (:text |:text-align)
                                              |j $ %{} :Leaf (:at 1519368142240) (:by |root) (:text |:right)
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1519367924372) (:by |root) (:text |span)
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:inner-text)
                                          |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text "||Sign up")
                                      |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |merge)
                                              |j $ %{} :Leaf (:at 1519368006916) (:by |root) (:text |style/link)
                                      |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1514302375364) (:by |root) (:text |:on-click)
                                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |on-submit)
                                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:username)
                                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:password)
                                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                                              |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |true)
                              |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |8)
                                  |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |nil)
                              |x $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1519367939048) (:by |root) (:text |span)
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:inner-text)
                                          |j $ %{} :Leaf (:at 1519368084428) (:by |root) (:text "||Log in")
                                      |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |merge)
                                              |j $ %{} :Leaf (:at 1519368006916) (:by |root) (:text |style/link)
                                      |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1514302381488) (:by |root) (:text |:on-click)
                                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |on-submit)
                                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:username)
                                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:password)
                                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |state)
                                              |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |false)
        |initial-state $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |initial-state)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:username)
                      |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text ||)
                  |r $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:password)
                      |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text ||)
        |on-submit $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |on-submit)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |username)
                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |password)
                  |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |signup?)
              |v $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |fn)
                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |e)
                      |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |dispatch!)
                  |r $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |dispatch!)
                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |if)
                          |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |signup?)
                          |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:user/sign-up)
                          |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:user/log-in)
                      |r $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                          |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |username)
                          |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |password)
                  |v $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |.setItem)
                      |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |js/localStorage)
                      |r $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:storage-key)
                          |j $ %{} :Leaf (:at 1527788909281) (:by |root) (:text |config/site)
                      |v $ %{} :Expr (:at 1629965500363) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1629965502708) (:by |B1y7Rc-Zz) (:text |format-cirru-edn)
                          |T $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |username)
                              |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |password)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541010211) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1510936619134) (:by |root) (:text |app.comp.login)
            |v $ %{} :Expr (:at 1500541010211) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1542907262877) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
                        |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                        |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                        |x $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |input)
                        |y $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |button)
                        |yT $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |span)
                |r $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |respo.comp.space)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                |v $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |respo.comp.inspect)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-inspect)
                |x $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1516547410331) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui)
                |y $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |schema)
                |yT $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1519368017028) (:by |root) (:text |app.style)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1519368019779) (:by |root) (:text |style)
                |yj $ %{} :Expr (:at 1527788911549) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1527788911897) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1527788913217) (:by |root) (:text |app.config)
                    |r $ %{} :Leaf (:at 1527788914516) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1527788915188) (:by |root) (:text |config)
    |app.comp.navigation $ %{} :FileEntry
      :defs $ {}
        |comp-navigation $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-navigation)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |logged-in?)
                  |j $ %{} :Leaf (:at 1523120365880) (:by |root) (:text |count-members)
                  |r $ %{} :Leaf (:at 1557246851676) (:by |B1y7Rc-Zz) (:text |page)
              |v $ %{} :Expr (:at 1573056965569) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1573056966254) (:by |B1y7Rc-Zz) (:text |div)
                  |L $ %{} :Expr (:at 1573056966462) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1573056966795) (:by |B1y7Rc-Zz) (:text |{})
                      |j $ %{} :Expr (:at 1573056969309) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790608030) (:by |B1y7Rc-Zz) (:text |:class-name)
                          |j $ %{} :Leaf (:at 1657790605747) (:by |B1y7Rc-Zz) (:text |css-navbar)
                  |T $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                          |b $ %{} :Expr (:at 1657791185632) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791188027) (:by |B1y7Rc-Zz) (:text |:class-name)
                              |b $ %{} :Leaf (:at 1657791191465) (:by |B1y7Rc-Zz) (:text |css/row-parted)
                          |j $ %{} :Expr (:at 1573056970658) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1573056971443) (:by |B1y7Rc-Zz) (:text |:style)
                              |j $ %{} :Expr (:at 1573056971638) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1573056971973) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1573056972352) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1573057005108) (:by |B1y7Rc-Zz) (:text |:max-width)
                                      |j $ %{} :Leaf (:at 1573057086054) (:by |B1y7Rc-Zz) (:text |840)
                                  |n $ %{} :Expr (:at 1573057028658) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1573057030573) (:by |B1y7Rc-Zz) (:text |:width)
                                      |j $ %{} :Leaf (:at 1573057039241) (:by |B1y7Rc-Zz) (:text "|\"100%")
                                  |r $ %{} :Expr (:at 1573056979386) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1573056980513) (:by |B1y7Rc-Zz) (:text |:margin)
                                      |j $ %{} :Leaf (:at 1573056981731) (:by |B1y7Rc-Zz) (:text |:auto)
                      |r $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657791201277) (:by |B1y7Rc-Zz) (:text |:class-name)
                                  |j $ %{} :Leaf (:at 1657791205899) (:by |B1y7Rc-Zz) (:text |css/row-center)
                          |r $ %{} :Expr (:at 1557585916995) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |render-entry)
                              |j $ %{} :Leaf (:at 1557585917642) (:by |B1y7Rc-Zz) (:text "|\"Timegrass")
                              |r $ %{} :Expr (:at 1557586081529) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1557586082036) (:by |B1y7Rc-Zz) (:text |fn)
                                  |L $ %{} :Expr (:at 1557586082318) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                  |T $ %{} :Expr (:at 1557585997842) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557585997842) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1557585997842) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557585997842) (:by |B1y7Rc-Zz) (:text |:name)
                                          |j $ %{} :Leaf (:at 1557586119224) (:by |B1y7Rc-Zz) (:text |:home)
                              |v $ %{} :Expr (:at 1557586000953) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1557586001883) (:by |B1y7Rc-Zz) (:text |=)
                                  |T $ %{} :Leaf (:at 1557585936299) (:by |B1y7Rc-Zz) (:text |page)
                                  |j $ %{} :Leaf (:at 1557586003751) (:by |B1y7Rc-Zz) (:text |:home)
                          |t $ %{} :Expr (:at 1556645266340) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556645266778) (:by |B1y7Rc-Zz) (:text |=<)
                              |j $ %{} :Leaf (:at 1556645274410) (:by |B1y7Rc-Zz) (:text |16)
                              |r $ %{} :Leaf (:at 1556645267874) (:by |B1y7Rc-Zz) (:text |nil)
                          |w $ %{} :Expr (:at 1557586128850) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557586128850) (:by |B1y7Rc-Zz) (:text |render-entry)
                              |j $ %{} :Leaf (:at 1608717909853) (:by |B1y7Rc-Zz) (:text "|\"Finished")
                              |r $ %{} :Expr (:at 1557586128850) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586128850) (:by |B1y7Rc-Zz) (:text |fn)
                                  |j $ %{} :Expr (:at 1557586128850) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                  |r $ %{} :Expr (:at 1557586164005) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557586164005) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1557586164005) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557586164005) (:by |B1y7Rc-Zz) (:text |:name)
                                          |j $ %{} :Leaf (:at 1557586164005) (:by |B1y7Rc-Zz) (:text |:history)
                                      |r $ %{} :Expr (:at 1557586164005) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557586164005) (:by |B1y7Rc-Zz) (:text |:data)
                                          |j $ %{} :Expr (:at 1616603095926) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1616603097296) (:by |B1y7Rc-Zz) (:text |let)
                                              |L $ %{} :Expr (:at 1616603098288) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Expr (:at 1616603098388) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1616603180374) (:by |B1y7Rc-Zz) (:text |now)
                                                      |j $ %{} :Expr (:at 1616603100315) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1616603103763) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                  |j $ %{} :Expr (:at 1616603165085) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1616603168708) (:by |B1y7Rc-Zz) (:text |month)
                                                      |j $ %{} :Expr (:at 1616603169640) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1658934967208) (:by |B1y7Rc-Zz) (:text |.!month)
                                                          |j $ %{} :Leaf (:at 1616603172094) (:by |B1y7Rc-Zz) (:text |now)
                                                  |n $ %{} :Expr (:at 1677346351618) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1677346355200) (:by |B1y7Rc-Zz) (:text |week-date)
                                                      |b $ %{} :Expr (:at 1677346357166) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |if)
                                                          |b $ %{} :Expr (:at 1677346357166) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |and)
                                                              |b $ %{} :Expr (:at 1677346357166) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |=)
                                                                  |b $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |month)
                                                                  |h $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |11)
                                                              |h $ %{} :Expr (:at 1677346357166) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |>)
                                                                  |b $ %{} :Expr (:at 1677346357166) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |.!date)
                                                                      |b $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |now)
                                                                  |h $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |25)
                                                          |h $ %{} :Expr (:at 1677346357166) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |.!week)
                                                              |b $ %{} :Expr (:at 1677346357166) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |.!subtract)
                                                                  |b $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |now)
                                                                  |h $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text |7)
                                                                  |l $ %{} :Leaf (:at 1677346357166) (:by |B1y7Rc-Zz) (:text "|\"day")
                                                          |l $ %{} :Leaf (:at 1677346381204) (:by |B1y7Rc-Zz) (:text |now)
                                              |T $ %{} :Expr (:at 1557586164005) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557586164005) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1557586164005) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557586164005) (:by |B1y7Rc-Zz) (:text |:year)
                                                      |j $ %{} :Expr (:at 1616603106404) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1658934968936) (:by |B1y7Rc-Zz) (:text |.!year)
                                                          |j $ %{} :Leaf (:at 1616603109885) (:by |B1y7Rc-Zz) (:text |now)
                                                  |r $ %{} :Expr (:at 1557586164005) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557586164005) (:by |B1y7Rc-Zz) (:text |:week)
                                                      |b $ %{} :Expr (:at 1677346388084) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1677346393330) (:by |B1y7Rc-Zz) (:text |.!week)
                                                          |b $ %{} :Leaf (:at 1677346395715) (:by |B1y7Rc-Zz) (:text |week-date)
                                                  |t $ %{} :Expr (:at 1677346398348) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1677346402043) (:by |B1y7Rc-Zz) (:text |:start)
                                                      |b $ %{} :Expr (:at 1677346419087) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1677346422361) (:by |B1y7Rc-Zz) (:text |.!format)
                                                          |T $ %{} :Expr (:at 1677346404382) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |D $ %{} :Leaf (:at 1677346411034) (:by |B1y7Rc-Zz) (:text |.!startOf)
                                                              |T $ %{} :Leaf (:at 1677346404929) (:by |B1y7Rc-Zz) (:text |week-date)
                                                              |b $ %{} :Leaf (:at 1677346415877) (:by |B1y7Rc-Zz) (:text "|\"week")
                                                  |u $ %{} :Expr (:at 1677346398348) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1677346429424) (:by |B1y7Rc-Zz) (:text |:end)
                                                      |b $ %{} :Expr (:at 1677346419087) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1677346422361) (:by |B1y7Rc-Zz) (:text |.!format)
                                                          |T $ %{} :Expr (:at 1677346404382) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |D $ %{} :Leaf (:at 1677346433089) (:by |B1y7Rc-Zz) (:text |.!endOf)
                                                              |T $ %{} :Leaf (:at 1677346404929) (:by |B1y7Rc-Zz) (:text |week-date)
                                                              |b $ %{} :Leaf (:at 1677346415877) (:by |B1y7Rc-Zz) (:text "|\"week")
                              |v $ %{} :Expr (:at 1557586128850) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586128850) (:by |B1y7Rc-Zz) (:text |=)
                                  |j $ %{} :Leaf (:at 1557586128850) (:by |B1y7Rc-Zz) (:text |page)
                                  |r $ %{} :Leaf (:at 1557586168120) (:by |B1y7Rc-Zz) (:text |:history)
                          |wT $ %{} :Expr (:at 1557586192266) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557586192266) (:by |B1y7Rc-Zz) (:text |=<)
                              |j $ %{} :Leaf (:at 1557586192266) (:by |B1y7Rc-Zz) (:text |16)
                              |r $ %{} :Leaf (:at 1557586192266) (:by |B1y7Rc-Zz) (:text |nil)
                          |x $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |render-entry)
                              |j $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text "|\"Notes")
                              |r $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |fn)
                                  |j $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                  |r $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |:name)
                                          |j $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |:notes)
                                      |r $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |:data)
                                          |j $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |let)
                                              |j $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |now)
                                                      |j $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |dayjs)
                                              |r $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |:year)
                                                      |j $ %{} :Expr (:at 1616603113628) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1658934982539) (:by |B1y7Rc-Zz) (:text |.!year)
                                                          |j $ %{} :Leaf (:at 1616603114595) (:by |B1y7Rc-Zz) (:text |now)
                                                  |r $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1591602693439) (:by |B1y7Rc-Zz) (:text |:month)
                                                      |j $ %{} :Expr (:at 1616603116357) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1658934984154) (:by |B1y7Rc-Zz) (:text |.!month)
                                                          |j $ %{} :Leaf (:at 1616603118956) (:by |B1y7Rc-Zz) (:text |now)
                              |v $ %{} :Expr (:at 1557586190349) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |=)
                                  |j $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |page)
                                  |r $ %{} :Leaf (:at 1557586190349) (:by |B1y7Rc-Zz) (:text |:notes)
                      |v $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:cursor)
                                          |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text ||pointer)
                                      |r $ %{} :Expr (:at 1643082964259) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1643082966515) (:by |B1y7Rc-Zz) (:text |:user-select)
                                          |j $ %{} :Leaf (:at 1643082967955) (:by |B1y7Rc-Zz) (:text |:none)
                              |n $ %{} :Expr (:at 1643082970389) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1643082971951) (:by |B1y7Rc-Zz) (:text |:tab-index)
                                  |j $ %{} :Leaf (:at 1643082972178) (:by |B1y7Rc-Zz) (:text |0)
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1514302332444) (:by |root) (:text |:on-click)
                                  |j $ %{} :Expr (:at 1584879567748) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1584879568298) (:by |B1y7Rc-Zz) (:text |fn)
                                      |L $ %{} :Expr (:at 1584879568715) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879569040) (:by |B1y7Rc-Zz) (:text |e)
                                          |j $ %{} :Leaf (:at 1584879569770) (:by |B1y7Rc-Zz) (:text |d!)
                                      |T $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879567281) (:by |B1y7Rc-Zz) (:text |d!)
                                          |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:router/change)
                                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:name)
                                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:profile)
                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |if)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |logged-in?)
                                  |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text ||Me)
                                  |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text ||Guest)
                          |v $ %{} :Expr (:at 1523120369216) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1523120369974) (:by |root) (:text |=<)
                              |j $ %{} :Leaf (:at 1523120371053) (:by |root) (:text |8)
                              |r $ %{} :Leaf (:at 1523120371555) (:by |root) (:text |nil)
                          |x $ %{} :Expr (:at 1523120371997) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1523120372630) (:by |root) (:text |<>)
                              |j $ %{} :Leaf (:at 1523120373023) (:by |root) (:text |count-members)
        |css-entry $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1658935044121) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1658935045893) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1658935044121) (:by |B1y7Rc-Zz) (:text |css-entry)
              |h $ %{} :Expr (:at 1658935044121) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1658935049236) (:by |B1y7Rc-Zz) (:text |{})
                  |X $ %{} :Expr (:at 1658935121939) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658935123245) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1658935123663) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935123663) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |:opacity)
                              |b $ %{} :Leaf (:at 1658935168847) (:by |B1y7Rc-Zz) (:text |0.6)
                          |h $ %{} :Expr (:at 1658935123663) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |:user-select)
                              |b $ %{} :Leaf (:at 1658935123663) (:by |B1y7Rc-Zz) (:text |:none)
                          |l $ %{} :Expr (:at 1658935147720) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935152001) (:by |B1y7Rc-Zz) (:text |:transition-duration)
                              |b $ %{} :Leaf (:at 1658935153189) (:by |B1y7Rc-Zz) (:text "|\"200ms")
                  |b $ %{} :Expr (:at 1658935051118) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658935059849) (:by |B1y7Rc-Zz) (:text "|\"$0:hover")
                      |b $ %{} :Expr (:at 1658935060233) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935060634) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935060985) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935076739) (:by |B1y7Rc-Zz) (:text |:opacity)
                              |b $ %{} :Leaf (:at 1658935126761) (:by |B1y7Rc-Zz) (:text |0.8)
        |css-navbar $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1657790570713) (:by |B1y7Rc-Zz) (:text |defstyle)
              |j $ %{} :Leaf (:at 1657790568195) (:by |B1y7Rc-Zz) (:text |css-navbar)
              |r $ %{} :Expr (:at 1657790571753) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1657790572277) (:by |B1y7Rc-Zz) (:text |{})
                  |T $ %{} :Expr (:at 1657790572666) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1657790574351) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |T $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |merge)
                          |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |ui/row-center)
                          |r $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:height)
                                  |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |48)
                              |v $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:padding)
                                  |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text "|\"0 16px")
                              |x $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:font-size)
                                  |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |16)
                              |y $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:border-bottom)
                                  |j $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |str)
                                      |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text "|\"1px solid ")
                                      |r $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |hsl)
                                          |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |0)
                                          |r $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |0)
                                          |v $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |0)
                                          |x $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |0.1)
                              |yT $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:font-family)
                                  |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                              |yj $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:background-color)
                                  |j $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:theme)
                                      |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |config/site)
                              |yr $ %{} :Expr (:at 1557246924165) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:color)
                                  |j $ %{} :Leaf (:at 1557246924165) (:by |B1y7Rc-Zz) (:text |:white)
        |render-entry $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1557586060387) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |render-entry)
              |n $ %{} :Expr (:at 1557585885965) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1557585893737) (:by |B1y7Rc-Zz) (:text |title)
                  |T $ %{} :Leaf (:at 1557586091925) (:by |B1y7Rc-Zz) (:text |get-route)
                  |j $ %{} :Leaf (:at 1557585988416) (:by |B1y7Rc-Zz) (:text |highlighted?)
              |r $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |div)
                  |j $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |{})
                      |b $ %{} :Expr (:at 1658935031986) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935035958) (:by |B1y7Rc-Zz) (:text |:class-name)
                          |b $ %{} :Leaf (:at 1658935043889) (:by |B1y7Rc-Zz) (:text |css-entry)
                      |j $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |:style)
                          |j $ %{} :Expr (:at 1658935132492) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1658935133455) (:by |B1y7Rc-Zz) (:text |merge)
                              |T $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |:cursor)
                                      |j $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |:pointer)
                              |b $ %{} :Expr (:at 1658935134072) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |if)
                                  |b $ %{} :Leaf (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |highlighted?)
                                  |h $ %{} :Expr (:at 1658935134072) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |{})
                                      |b $ %{} :Expr (:at 1658935134072) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |:opacity)
                                          |b $ %{} :Leaf (:at 1658935134072) (:by |B1y7Rc-Zz) (:text |1)
                      |r $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |:on-click)
                          |j $ %{} :Expr (:at 1584879549754) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1584879550849) (:by |B1y7Rc-Zz) (:text |fn)
                              |L $ %{} :Expr (:at 1584879551609) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1584879552360) (:by |B1y7Rc-Zz) (:text |e)
                                  |j $ %{} :Leaf (:at 1584879552989) (:by |B1y7Rc-Zz) (:text |d!)
                              |T $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1584879549354) (:by |B1y7Rc-Zz) (:text |d!)
                                  |j $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |:router/change)
                                  |r $ %{} :Expr (:at 1557586097956) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557586097558) (:by |B1y7Rc-Zz) (:text |get-route)
                      |v $ %{} :Expr (:at 1643082707417) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1643082710122) (:by |B1y7Rc-Zz) (:text |:tab-index)
                          |j $ %{} :Leaf (:at 1643082710392) (:by |B1y7Rc-Zz) (:text |0)
                  |r $ %{} :Expr (:at 1557585882232) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1557585882232) (:by |B1y7Rc-Zz) (:text |<>)
                      |j $ %{} :Leaf (:at 1557585942324) (:by |B1y7Rc-Zz) (:text |title)
                      |n $ %{} :Leaf (:at 1658935137220) (:by |B1y7Rc-Zz) (:text |nil)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541010211) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.comp.navigation)
            |v $ %{} :Expr (:at 1500541010211) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1629963365303) (:by |B1y7Rc-Zz) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |hsl)
                |r $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1516547394445) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui)
                |t $ %{} :Expr (:at 1657790576833) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790579417) (:by |B1y7Rc-Zz) (:text |respo.css)
                    |b $ %{} :Leaf (:at 1657790581342) (:by |B1y7Rc-Zz) (:text |:refer)
                    |h $ %{} :Expr (:at 1657790581543) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1657790583492) (:by |B1y7Rc-Zz) (:text |defstyle)
                |u $ %{} :Expr (:at 1657790584607) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790589143) (:by |B1y7Rc-Zz) (:text |respo-ui.css)
                    |b $ %{} :Leaf (:at 1657790593353) (:by |B1y7Rc-Zz) (:text |:as)
                    |h $ %{} :Leaf (:at 1657790594244) (:by |B1y7Rc-Zz) (:text |css)
                |w $ %{} :Expr (:at 1523120376505) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1523120379036) (:by |root) (:text |respo.comp.space)
                    |r $ %{} :Leaf (:at 1523120382218) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1523120382545) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1523120383255) (:by |root) (:text |=<)
                |x $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1542907380517) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
                        |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                        |t $ %{} :Leaf (:at 1584879019575) (:by |B1y7Rc-Zz) (:text |>>)
                        |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |span)
                        |x $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                |y $ %{} :Expr (:at 1536860674775) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1536860674775) (:by |root) (:text |app.config)
                    |r $ %{} :Leaf (:at 1536860674775) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1536860674775) (:by |root) (:text |config)
                |yj $ %{} :Expr (:at 1536861056679) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1584878788249) (:by |B1y7Rc-Zz) (:text |respo-alerts.core)
                    |r $ %{} :Leaf (:at 1536861065872) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1536861066155) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1536861125556) (:by |root) (:text |comp-prompt)
                |yr $ %{} :Expr (:at 1556645494859) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1556645496530) (:by |B1y7Rc-Zz) (:text "|\"dayjs")
                    |r $ %{} :Leaf (:at 1629963368190) (:by |B1y7Rc-Zz) (:text |:default)
                    |v $ %{} :Leaf (:at 1556645498794) (:by |B1y7Rc-Zz) (:text |dayjs)
    |app.comp.notes-page $ %{} :FileEntry
      :defs $ {}
        |comp-note $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1556647303657) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1556647305914) (:by |B1y7Rc-Zz) (:text |defcomp)
              |j $ %{} :Leaf (:at 1556647303657) (:by |B1y7Rc-Zz) (:text |comp-note)
              |r $ %{} :Expr (:at 1556647303657) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1556648060198) (:by |B1y7Rc-Zz) (:text |states)
                  |T $ %{} :Leaf (:at 1556647307853) (:by |B1y7Rc-Zz) (:text |note)
              |v $ %{} :Expr (:at 1629964535103) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1629964535723) (:by |B1y7Rc-Zz) (:text |let)
                  |L $ %{} :Expr (:at 1629964535966) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1629964536107) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964539465) (:by |B1y7Rc-Zz) (:text |edit-plugin)
                          |j $ %{} :Expr (:at 1629964540357) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964543238) (:by |B1y7Rc-Zz) (:text |use-prompt)
                              |j $ %{} :Expr (:at 1629964545934) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964546481) (:by |B1y7Rc-Zz) (:text |>>)
                                  |j $ %{} :Leaf (:at 1629964731062) (:by |B1y7Rc-Zz) (:text |states)
                                  |r $ %{} :Leaf (:at 1629964548467) (:by |B1y7Rc-Zz) (:text |:edit)
                              |r $ %{} :Expr (:at 1629964661219) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1629964661219) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text "|\"Update note:")
                                  |r $ %{} :Expr (:at 1629964661219) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:multiline?)
                                      |j $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |true)
                                  |v $ %{} :Expr (:at 1629964661219) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:initial)
                                      |j $ %{} :Expr (:at 1629964661219) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |:text)
                                          |j $ %{} :Leaf (:at 1629964661219) (:by |B1y7Rc-Zz) (:text |note)
                      |j $ %{} :Expr (:at 1629964550192) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964554122) (:by |B1y7Rc-Zz) (:text |remove-plugin)
                          |j $ %{} :Expr (:at 1629964554861) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964558438) (:by |B1y7Rc-Zz) (:text |use-confirm)
                              |j $ %{} :Expr (:at 1629964559147) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964559495) (:by |B1y7Rc-Zz) (:text |>>)
                                  |j $ %{} :Leaf (:at 1629964733328) (:by |B1y7Rc-Zz) (:text |states)
                                  |r $ %{} :Leaf (:at 1629964562754) (:by |B1y7Rc-Zz) (:text |:remove)
                              |r $ %{} :Expr (:at 1629964725324) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964725324) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1629964725324) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964725324) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1629964725324) (:by |B1y7Rc-Zz) (:text "|\"Sure to delete note?")
                  |T $ %{} :Expr (:at 1556647308232) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556647309910) (:by |B1y7Rc-Zz) (:text |div)
                      |j $ %{} :Expr (:at 1556647310151) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647310499) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1657790959558) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790962178) (:by |B1y7Rc-Zz) (:text |:class-name)
                              |b $ %{} :Expr (:at 1658935559130) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1658935560837) (:by |B1y7Rc-Zz) (:text |str-spaced)
                                  |T $ %{} :Leaf (:at 1657790966773) (:by |B1y7Rc-Zz) (:text |css/column)
                                  |b $ %{} :Leaf (:at 1658935563780) (:by |B1y7Rc-Zz) (:text |css-note)
                          |j $ %{} :Expr (:at 1556647326488) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647330802) (:by |B1y7Rc-Zz) (:text |:style)
                              |j $ %{} :Expr (:at 1556647798787) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647799092) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1556647799421) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557585573916) (:by |B1y7Rc-Zz) (:text |:border-top)
                                      |j $ %{} :Expr (:at 1556647801979) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556647802559) (:by |B1y7Rc-Zz) (:text |str)
                                          |j $ %{} :Leaf (:at 1556647806396) (:by |B1y7Rc-Zz) (:text "|\"1px solid ")
                                          |r $ %{} :Expr (:at 1556647807123) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556647807619) (:by |B1y7Rc-Zz) (:text |hsl)
                                              |j $ %{} :Leaf (:at 1556647807958) (:by |B1y7Rc-Zz) (:text |0)
                                              |r $ %{} :Leaf (:at 1556647808204) (:by |B1y7Rc-Zz) (:text |0)
                                              |v $ %{} :Leaf (:at 1557585638537) (:by |B1y7Rc-Zz) (:text |94)
                                  |r $ %{} :Expr (:at 1556647825505) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556647828525) (:by |B1y7Rc-Zz) (:text |:padding)
                                      |j $ %{} :Leaf (:at 1556647849827) (:by |B1y7Rc-Zz) (:text "|\"4px 8px")
                      |r $ %{} :Expr (:at 1556647334568) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1556647335236) (:by |B1y7Rc-Zz) (:text |div)
                          |L $ %{} :Expr (:at 1556647335464) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647335772) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1556647336468) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790973781) (:by |B1y7Rc-Zz) (:text |:class-name)
                                  |j $ %{} :Leaf (:at 1657790975496) (:by |B1y7Rc-Zz) (:text |css/row-parted)
                          |P $ %{} :Expr (:at 1556647342578) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647344825) (:by |B1y7Rc-Zz) (:text |<>)
                              |j $ %{} :Expr (:at 1556647570399) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1556647571117) (:by |B1y7Rc-Zz) (:text |->)
                                  |T $ %{} :Expr (:at 1556647345363) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556647347172) (:by |B1y7Rc-Zz) (:text |:time)
                                      |j $ %{} :Leaf (:at 1556647347733) (:by |B1y7Rc-Zz) (:text |note)
                                  |j $ %{} :Leaf (:at 1556647573604) (:by |B1y7Rc-Zz) (:text |dayjs)
                                  |r $ %{} :Expr (:at 1556647573971) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556647576673) (:by |B1y7Rc-Zz) (:text |.format)
                                      |j $ %{} :Leaf (:at 1557585523361) (:by |B1y7Rc-Zz) (:text "|\"HH:mm")
                              |r $ %{} :Expr (:at 1556647638577) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647640276) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1556647640556) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556647642435) (:by |B1y7Rc-Zz) (:text |:font-family)
                                      |j $ %{} :Leaf (:at 1556647645296) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                                  |r $ %{} :Expr (:at 1557246102139) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557246103076) (:by |B1y7Rc-Zz) (:text |:color)
                                      |j $ %{} :Expr (:at 1557246103379) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557246103691) (:by |B1y7Rc-Zz) (:text |hsl)
                                          |j $ %{} :Leaf (:at 1557246104022) (:by |B1y7Rc-Zz) (:text |0)
                                          |r $ %{} :Leaf (:at 1557246104251) (:by |B1y7Rc-Zz) (:text |0)
                                          |v $ %{} :Leaf (:at 1557585535667) (:by |B1y7Rc-Zz) (:text |70)
                                  |v $ %{} :Expr (:at 1557586373775) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557586376054) (:by |B1y7Rc-Zz) (:text |:font-size)
                                      |j $ %{} :Leaf (:at 1557586376703) (:by |B1y7Rc-Zz) (:text |12)
                          |R $ %{} :Expr (:at 1556647350064) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647350527) (:by |B1y7Rc-Zz) (:text |=<)
                              |j $ %{} :Leaf (:at 1556647351230) (:by |B1y7Rc-Zz) (:text |8)
                              |r $ %{} :Leaf (:at 1556647351768) (:by |B1y7Rc-Zz) (:text |nil)
                          |i $ %{} :Expr (:at 1556647767453) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647767453) (:by |B1y7Rc-Zz) (:text |div)
                              |j $ %{} :Expr (:at 1556647767453) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647767453) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1556647767453) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657790981407) (:by |B1y7Rc-Zz) (:text |:class-name)
                                      |j $ %{} :Leaf (:at 1657790983216) (:by |B1y7Rc-Zz) (:text |css/row-middle)
                              |n $ %{} :Expr (:at 1629964596728) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964599746) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                  |j $ %{} :Leaf (:at 1629964596728) (:by |B1y7Rc-Zz) (:text |:edit)
                                  |r $ %{} :Expr (:at 1629964600687) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1629964602916) (:by |B1y7Rc-Zz) (:text |&{})
                                      |L $ %{} :Leaf (:at 1629964606751) (:by |B1y7Rc-Zz) (:text |:font-size)
                                      |T $ %{} :Leaf (:at 1629964596728) (:by |B1y7Rc-Zz) (:text |16)
                                      |j $ %{} :Leaf (:at 1629964608669) (:by |B1y7Rc-Zz) (:text |:curspr)
                                      |r $ %{} :Leaf (:at 1629964610014) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Leaf (:at 1629964612056) (:by |B1y7Rc-Zz) (:text |:color)
                                      |x $ %{} :Expr (:at 1629964613875) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |hsl)
                                          |j $ %{} :Leaf (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |200)
                                          |r $ %{} :Leaf (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Leaf (:at 1629964613875) (:by |B1y7Rc-Zz) (:text |80)
                                  |v $ %{} :Expr (:at 1629964615469) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964616059) (:by |B1y7Rc-Zz) (:text |fn)
                                      |j $ %{} :Expr (:at 1629964616313) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964617187) (:by |B1y7Rc-Zz) (:text |e)
                                          |j $ %{} :Leaf (:at 1629964618220) (:by |B1y7Rc-Zz) (:text |d!)
                                      |r $ %{} :Expr (:at 1629964619117) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964629538) (:by |B1y7Rc-Zz) (:text |.show)
                                          |j $ %{} :Leaf (:at 1629966539308) (:by |B1y7Rc-Zz) (:text |edit-plugin)
                                          |r $ %{} :Leaf (:at 1629964636703) (:by |B1y7Rc-Zz) (:text |d!)
                                          |v $ %{} :Expr (:at 1629964637339) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964637646) (:by |B1y7Rc-Zz) (:text |fn)
                                              |j $ %{} :Expr (:at 1629964639717) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964639455) (:by |B1y7Rc-Zz) (:text |result)
                                              |r $ %{} :Expr (:at 1629964643401) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |j $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:note/edit)
                                                  |r $ %{} :Expr (:at 1629964643401) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |{})
                                                      |j $ %{} :Expr (:at 1629964643401) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:id)
                                                          |j $ %{} :Expr (:at 1629964643401) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:id)
                                                              |j $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |note)
                                                      |r $ %{} :Expr (:at 1629964643401) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |:text)
                                                          |j $ %{} :Leaf (:at 1629964643401) (:by |B1y7Rc-Zz) (:text |result)
                              |v $ %{} :Expr (:at 1556647767453) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647767453) (:by |B1y7Rc-Zz) (:text |=<)
                                  |j $ %{} :Leaf (:at 1556647767453) (:by |B1y7Rc-Zz) (:text |8)
                                  |r $ %{} :Leaf (:at 1556647767453) (:by |B1y7Rc-Zz) (:text |nil)
                              |w $ %{} :Expr (:at 1629964674759) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964678148) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                  |j $ %{} :Leaf (:at 1629964674759) (:by |B1y7Rc-Zz) (:text |:delete)
                                  |r $ %{} :Expr (:at 1629964679937) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1629964682752) (:by |B1y7Rc-Zz) (:text |&{})
                                      |L $ %{} :Leaf (:at 1629964685870) (:by |B1y7Rc-Zz) (:text |:font-size)
                                      |T $ %{} :Leaf (:at 1629964674759) (:by |B1y7Rc-Zz) (:text |16)
                                      |j $ %{} :Leaf (:at 1629964688251) (:by |B1y7Rc-Zz) (:text |:cursor)
                                      |r $ %{} :Leaf (:at 1629964689345) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Leaf (:at 1629964692387) (:by |B1y7Rc-Zz) (:text |:color)
                                      |x $ %{} :Expr (:at 1629964694145) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |hsl)
                                          |j $ %{} :Leaf (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |10)
                                          |r $ %{} :Leaf (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Leaf (:at 1629964694145) (:by |B1y7Rc-Zz) (:text |60)
                                  |v $ %{} :Expr (:at 1629964695913) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964696526) (:by |B1y7Rc-Zz) (:text |fn)
                                      |j $ %{} :Expr (:at 1629964696783) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964697191) (:by |B1y7Rc-Zz) (:text |e)
                                          |j $ %{} :Leaf (:at 1629964697805) (:by |B1y7Rc-Zz) (:text |d!)
                                      |r $ %{} :Expr (:at 1629964698334) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964700365) (:by |B1y7Rc-Zz) (:text |.show)
                                          |j $ %{} :Leaf (:at 1629966541201) (:by |B1y7Rc-Zz) (:text |remove-plugin)
                                          |r $ %{} :Leaf (:at 1629964705715) (:by |B1y7Rc-Zz) (:text |d!)
                                          |v $ %{} :Expr (:at 1629964706336) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964706737) (:by |B1y7Rc-Zz) (:text |fn)
                                              |j $ %{} :Expr (:at 1629964708032) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                              |r $ %{} :Expr (:at 1629964711836) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |j $ %{} :Leaf (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |:note/remove)
                                                  |r $ %{} :Expr (:at 1629964711836) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |:id)
                                                      |j $ %{} :Leaf (:at 1629964711836) (:by |B1y7Rc-Zz) (:text |note)
                      |t $ %{} :Expr (:at 1556647762827) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647762827) (:by |B1y7Rc-Zz) (:text |<>)
                          |j $ %{} :Expr (:at 1556647762827) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647762827) (:by |B1y7Rc-Zz) (:text |:text)
                              |j $ %{} :Leaf (:at 1556647762827) (:by |B1y7Rc-Zz) (:text |note)
                      |w $ %{} :Expr (:at 1629964569519) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964570430) (:by |B1y7Rc-Zz) (:text |.render)
                          |j $ %{} :Leaf (:at 1629964573670) (:by |B1y7Rc-Zz) (:text |edit-plugin)
                      |x $ %{} :Expr (:at 1629964577613) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964578624) (:by |B1y7Rc-Zz) (:text |.render)
                          |j $ %{} :Leaf (:at 1629964583147) (:by |B1y7Rc-Zz) (:text |remove-plugin)
        |comp-notes-page $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-notes-page)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |D $ %{} :Leaf (:at 1556646849807) (:by |B1y7Rc-Zz) (:text |states)
                  |T $ %{} :Leaf (:at 1556645576221) (:by |B1y7Rc-Zz) (:text |notes)
                  |j $ %{} :Leaf (:at 1556645578023) (:by |B1y7Rc-Zz) (:text |info)
              |v $ %{} :Expr (:at 1556645581053) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1556645581721) (:by |B1y7Rc-Zz) (:text |let)
                  |L $ %{} :Expr (:at 1556645582104) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Expr (:at 1556645588396) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556645592043) (:by |B1y7Rc-Zz) (:text |year)
                          |j $ %{} :Expr (:at 1556645592292) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556645597062) (:by |B1y7Rc-Zz) (:text |:year)
                              |j $ %{} :Leaf (:at 1556645595757) (:by |B1y7Rc-Zz) (:text |info)
                      |T $ %{} :Expr (:at 1556645582251) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1591602568367) (:by |B1y7Rc-Zz) (:text |month)
                          |j $ %{} :Expr (:at 1556645584827) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1591602570391) (:by |B1y7Rc-Zz) (:text |:month)
                              |j $ %{} :Leaf (:at 1556645587266) (:by |B1y7Rc-Zz) (:text |info)
                      |j $ %{} :Expr (:at 1629964426329) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964431136) (:by |B1y7Rc-Zz) (:text |add-plugin)
                          |j $ %{} :Expr (:at 1629964431991) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964438940) (:by |B1y7Rc-Zz) (:text |use-prompt)
                              |j $ %{} :Expr (:at 1629964439477) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964439966) (:by |B1y7Rc-Zz) (:text |>>)
                                  |j $ %{} :Leaf (:at 1629964441489) (:by |B1y7Rc-Zz) (:text |states)
                                  |r $ %{} :Leaf (:at 1629964442311) (:by |B1y7Rc-Zz) (:text |:add)
                              |r $ %{} :Expr (:at 1629964444922) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |{})
                                  |r $ %{} :Expr (:at 1629964444922) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1629964444922) (:by |B1y7Rc-Zz) (:text "|\"Add note about today's work:")
                                  |v $ %{} :Expr (:at 1629964444922) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |:multiline?)
                                      |j $ %{} :Leaf (:at 1629964444922) (:by |B1y7Rc-Zz) (:text |true)
                  |T $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                          |b $ %{} :Expr (:at 1657790843697) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790846148) (:by |B1y7Rc-Zz) (:text |:class-name)
                              |b $ %{} :Leaf (:at 1657790848179) (:by |B1y7Rc-Zz) (:text |css/expand)
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                              |j $ %{} :Expr (:at 1519314674864) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1519314675207) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1519314675496) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1519314677667) (:by |root) (:text |:padding)
                                      |j $ %{} :Leaf (:at 1557245673542) (:by |B1y7Rc-Zz) (:text |16)
                      |r $ %{} :Expr (:at 1572973363171) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1572973364716) (:by |B1y7Rc-Zz) (:text |div)
                          |L $ %{} :Expr (:at 1572973369798) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973369798) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1572973369798) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973369798) (:by |B1y7Rc-Zz) (:text |:style)
                                  |j $ %{} :Expr (:at 1572973369798) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973369798) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1572973369798) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973369798) (:by |B1y7Rc-Zz) (:text |:max-width)
                                          |j $ %{} :Leaf (:at 1572973369798) (:by |B1y7Rc-Zz) (:text |800)
                                      |r $ %{} :Expr (:at 1572973369798) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973369798) (:by |B1y7Rc-Zz) (:text |:margin)
                                          |j $ %{} :Leaf (:at 1572973369798) (:by |B1y7Rc-Zz) (:text |:auto)
                          |T $ %{} :Expr (:at 1556645615572) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1556645616321) (:by |B1y7Rc-Zz) (:text |div)
                              |L $ %{} :Expr (:at 1556645616560) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556645617518) (:by |B1y7Rc-Zz) (:text |{})
                                  |b $ %{} :Expr (:at 1657790885957) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657790888678) (:by |B1y7Rc-Zz) (:text |:class-name)
                                      |b $ %{} :Leaf (:at 1657790893229) (:by |B1y7Rc-Zz) (:text |css/row-parted)
                                  |j $ %{} :Expr (:at 1556645618041) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556645618842) (:by |B1y7Rc-Zz) (:text |:style)
                                      |j $ %{} :Expr (:at 1557245647003) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245647357) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1557245647645) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245650544) (:by |B1y7Rc-Zz) (:text |:margin)
                                              |j $ %{} :Leaf (:at 1557245655629) (:by |B1y7Rc-Zz) (:text "|\"8px 0")
                              |P $ %{} :Expr (:at 1557245696635) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1557245698839) (:by |B1y7Rc-Zz) (:text |span)
                                  |L $ %{} :Expr (:at 1557245699148) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245699506) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1557245751978) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1657790881583) (:by |B1y7Rc-Zz) (:text |:class-name)
                                          |j $ %{} :Leaf (:at 1657790883425) (:by |B1y7Rc-Zz) (:text |css/row-middle)
                                  |P $ %{} :Expr (:at 1557245701563) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245702134) (:by |B1y7Rc-Zz) (:text |<>)
                                      |j $ %{} :Leaf (:at 1557245704618) (:by |B1y7Rc-Zz) (:text "|\"Notes")
                                      |r $ %{} :Expr (:at 1557245705607) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245705939) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1557245706446) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245707301) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1557245707569) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245707888) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1557245711097) (:by |B1y7Rc-Zz) (:text |0)
                                                  |r $ %{} :Leaf (:at 1557245711348) (:by |B1y7Rc-Zz) (:text |0)
                                                  |v $ %{} :Leaf (:at 1557245712790) (:by |B1y7Rc-Zz) (:text |50)
                                          |r $ %{} :Expr (:at 1557245713590) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245715661) (:by |B1y7Rc-Zz) (:text |:font-family)
                                              |j $ %{} :Leaf (:at 1557245718092) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                                          |v $ %{} :Expr (:at 1557245723303) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245725312) (:by |B1y7Rc-Zz) (:text |:font-size)
                                              |j $ %{} :Leaf (:at 1557245726136) (:by |B1y7Rc-Zz) (:text |16)
                                  |R $ %{} :Expr (:at 1557245760019) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245761969) (:by |B1y7Rc-Zz) (:text |=<)
                                      |j $ %{} :Leaf (:at 1557245763469) (:by |B1y7Rc-Zz) (:text |16)
                                      |r $ %{} :Leaf (:at 1557245764103) (:by |B1y7Rc-Zz) (:text |nil)
                                  |S $ %{} :Expr (:at 1629964467245) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964469634) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                      |j $ %{} :Leaf (:at 1629964467245) (:by |B1y7Rc-Zz) (:text |:plus)
                                      |r $ %{} :Expr (:at 1629964474541) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |D $ %{} :Leaf (:at 1629964476740) (:by |B1y7Rc-Zz) (:text |&{})
                                          |L $ %{} :Leaf (:at 1629964480252) (:by |B1y7Rc-Zz) (:text |:font-size)
                                          |T $ %{} :Leaf (:at 1629964467245) (:by |B1y7Rc-Zz) (:text |16)
                                          |j $ %{} :Leaf (:at 1629964482822) (:by |B1y7Rc-Zz) (:text |:color)
                                          |r $ %{} :Expr (:at 1629964485258) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |hsl)
                                              |j $ %{} :Leaf (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |200)
                                              |r $ %{} :Leaf (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |80)
                                              |v $ %{} :Leaf (:at 1629964485258) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Leaf (:at 1629964487409) (:by |B1y7Rc-Zz) (:text |:cursor)
                                          |x $ %{} :Leaf (:at 1629964488605) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Expr (:at 1629964490410) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964490936) (:by |B1y7Rc-Zz) (:text |fn)
                                          |j $ %{} :Expr (:at 1629964491235) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964491563) (:by |B1y7Rc-Zz) (:text |e)
                                              |j $ %{} :Leaf (:at 1629964492875) (:by |B1y7Rc-Zz) (:text |d!)
                                          |r $ %{} :Expr (:at 1629964493932) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964495324) (:by |B1y7Rc-Zz) (:text |.show)
                                              |j $ %{} :Leaf (:at 1629964497381) (:by |B1y7Rc-Zz) (:text |add-plugin)
                                              |r $ %{} :Leaf (:at 1629964498948) (:by |B1y7Rc-Zz) (:text |d!)
                                              |v $ %{} :Expr (:at 1629964499454) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964499735) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |b $ %{} :Expr (:at 1629964519502) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629964526070) (:by |B1y7Rc-Zz) (:text |result)
                                                  |j $ %{} :Expr (:at 1629964507794) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629964507794) (:by |B1y7Rc-Zz) (:text |d!)
                                                      |j $ %{} :Leaf (:at 1629964507794) (:by |B1y7Rc-Zz) (:text |:note/add)
                                                      |r $ %{} :Leaf (:at 1629964507794) (:by |B1y7Rc-Zz) (:text |result)
                              |T $ %{} :Expr (:at 1556648417657) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1556648418437) (:by |B1y7Rc-Zz) (:text |div)
                                  |L $ %{} :Expr (:at 1556648418665) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556648419059) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1556648420324) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1657790922275) (:by |B1y7Rc-Zz) (:text |:class-name)
                                          |j $ %{} :Leaf (:at 1657790923970) (:by |B1y7Rc-Zz) (:text |css/row-middle)
                                  |n $ %{} :Expr (:at 1556648449500) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556648451815) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                      |j $ %{} :Leaf (:at 1556648463973) (:by |B1y7Rc-Zz) (:text |:arrow-left)
                                      |r $ %{} :Expr (:at 1556648469543) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556648470626) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1556648471018) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648472346) (:by |B1y7Rc-Zz) (:text |:font-size)
                                              |j $ %{} :Leaf (:at 1556648473358) (:by |B1y7Rc-Zz) (:text |16)
                                          |r $ %{} :Expr (:at 1556648475636) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648477108) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1556648477343) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1556648477692) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1556648482150) (:by |B1y7Rc-Zz) (:text |200)
                                                  |r $ %{} :Leaf (:at 1556648482543) (:by |B1y7Rc-Zz) (:text |80)
                                                  |v $ %{} :Leaf (:at 1556648482894) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Expr (:at 1556648514402) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648516307) (:by |B1y7Rc-Zz) (:text |:cursor)
                                              |j $ %{} :Leaf (:at 1556648518901) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Expr (:at 1556648487768) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556648488565) (:by |B1y7Rc-Zz) (:text |fn)
                                          |j $ %{} :Expr (:at 1556648488869) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648489094) (:by |B1y7Rc-Zz) (:text |e)
                                              |j $ %{} :Leaf (:at 1556648489587) (:by |B1y7Rc-Zz) (:text |d!)
                                          |r $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |d!)
                                              |j $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |:router/change)
                                              |r $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |:name)
                                                      |j $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |:notes)
                                                  |r $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |:data)
                                                      |j $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |if)
                                                          |j $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |<=)
                                                              |j $ %{} :Leaf (:at 1591602573901) (:by |B1y7Rc-Zz) (:text |month)
                                                              |r $ %{} :Leaf (:at 1591602769171) (:by |B1y7Rc-Zz) (:text |0)
                                                          |r $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |{})
                                                              |j $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |:year)
                                                                  |j $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |dec)
                                                                      |j $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |year)
                                                              |r $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1591602577681) (:by |B1y7Rc-Zz) (:text |:month)
                                                                  |j $ %{} :Leaf (:at 1591602767520) (:by |B1y7Rc-Zz) (:text |11)
                                                          |v $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |{})
                                                              |j $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |:year)
                                                                  |j $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |year)
                                                              |r $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1591602581848) (:by |B1y7Rc-Zz) (:text |:month)
                                                                  |j $ %{} :Expr (:at 1556648561044) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1556648561044) (:by |B1y7Rc-Zz) (:text |dec)
                                                                      |j $ %{} :Leaf (:at 1591602584414) (:by |B1y7Rc-Zz) (:text |month)
                                  |r $ %{} :Expr (:at 1556648429390) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556648429996) (:by |B1y7Rc-Zz) (:text |=<)
                                      |j $ %{} :Leaf (:at 1556648430938) (:by |B1y7Rc-Zz) (:text |8)
                                      |r $ %{} :Leaf (:at 1556648431500) (:by |B1y7Rc-Zz) (:text |nil)
                                  |v $ %{} :Expr (:at 1556648501502) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                      |j $ %{} :Leaf (:at 1556648504959) (:by |B1y7Rc-Zz) (:text |:arrow-right)
                                      |r $ %{} :Expr (:at 1556648501502) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1556648501502) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |:font-size)
                                              |j $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |16)
                                          |r $ %{} :Expr (:at 1556648501502) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1556648501502) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |200)
                                                  |r $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |80)
                                                  |v $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Expr (:at 1556648521088) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648521088) (:by |B1y7Rc-Zz) (:text |:cursor)
                                              |j $ %{} :Leaf (:at 1556648521088) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Expr (:at 1556648501502) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |fn)
                                          |j $ %{} :Expr (:at 1556648501502) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |e)
                                              |j $ %{} :Leaf (:at 1556648501502) (:by |B1y7Rc-Zz) (:text |d!)
                                          |v $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |d!)
                                              |j $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |:router/change)
                                              |r $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |:name)
                                                      |j $ %{} :Leaf (:at 1556648565143) (:by |B1y7Rc-Zz) (:text |:notes)
                                                  |r $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |:data)
                                                      |j $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |if)
                                                          |j $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |>=)
                                                              |j $ %{} :Leaf (:at 1591602587225) (:by |B1y7Rc-Zz) (:text |month)
                                                              |r $ %{} :Leaf (:at 1591602762402) (:by |B1y7Rc-Zz) (:text |11)
                                                          |r $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |{})
                                                              |j $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |:year)
                                                                  |j $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |inc)
                                                                      |j $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |year)
                                                              |r $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1591602557019) (:by |B1y7Rc-Zz) (:text |:month)
                                                                  |j $ %{} :Leaf (:at 1591602774378) (:by |B1y7Rc-Zz) (:text |0)
                                                          |v $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |{})
                                                              |j $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |:year)
                                                                  |j $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |year)
                                                              |r $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1591602592613) (:by |B1y7Rc-Zz) (:text |:month)
                                                                  |j $ %{} :Expr (:at 1556648558975) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1556648558975) (:by |B1y7Rc-Zz) (:text |inc)
                                                                      |j $ %{} :Leaf (:at 1591602594975) (:by |B1y7Rc-Zz) (:text |month)
                                  |w $ %{} :Expr (:at 1557245842813) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245842813) (:by |B1y7Rc-Zz) (:text |=<)
                                      |j $ %{} :Leaf (:at 1557245842813) (:by |B1y7Rc-Zz) (:text |8)
                                      |r $ %{} :Leaf (:at 1557245842813) (:by |B1y7Rc-Zz) (:text |nil)
                                  |x $ %{} :Expr (:at 1557245838201) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |<>)
                                      |j $ %{} :Expr (:at 1557245838201) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964051260) (:by |B1y7Rc-Zz) (:text |str)
                                          |j $ %{} :Expr (:at 1629964048613) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964048613) (:by |B1y7Rc-Zz) (:text |inc)
                                              |j $ %{} :Leaf (:at 1629964048613) (:by |B1y7Rc-Zz) (:text |month)
                                          |l $ %{} :Leaf (:at 1629964058024) (:by |B1y7Rc-Zz) (:text "|\"th month of ")
                                          |n $ %{} :Leaf (:at 1629964039567) (:by |B1y7Rc-Zz) (:text |year)
                                          |r $ %{} :Leaf (:at 1629964035381) (:by |B1y7Rc-Zz) (:text "|\".")
                                      |r $ %{} :Expr (:at 1557245838201) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1557245838201) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |:font-family)
                                              |j $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                                          |r $ %{} :Expr (:at 1557245838201) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1557245838201) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |0)
                                                  |r $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |0)
                                                  |v $ %{} :Leaf (:at 1557245838201) (:by |B1y7Rc-Zz) (:text |50)
                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |empty?)
                                  |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |notes)
                              |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |div)
                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                      |b $ %{} :Expr (:at 1657790933211) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1657790935527) (:by |B1y7Rc-Zz) (:text |:class-name)
                                          |b $ %{} :Leaf (:at 1657790938516) (:by |B1y7Rc-Zz) (:text |css/center)
                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:style)
                                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:min-height)
                                                  |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |120)
                                  |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |<>)
                                      |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text "|\"No notes")
                                      |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:font-family)
                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                                          |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:color)
                                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |0)
                                                  |r $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |0)
                                                  |v $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |80)
                              |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |let)
                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |grouped-notes)
                                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963786097) (:by |B1y7Rc-Zz) (:text |->)
                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |notes)
                                              |n $ %{} :Expr (:at 1629966474341) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629966475920) (:by |B1y7Rc-Zz) (:text |.to-list)
                                              |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963790482) (:by |B1y7Rc-Zz) (:text |.group-by)
                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1629963798033) (:by |B1y7Rc-Zz) (:text |pair)
                                                      |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |->)
                                                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:time)
                                                              |j $ %{} :Expr (:at 1629963792659) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1629963793782) (:by |B1y7Rc-Zz) (:text |last)
                                                                  |j $ %{} :Leaf (:at 1629963795209) (:by |B1y7Rc-Zz) (:text |pair)
                                                          |r $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                          |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |.format)
                                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text "|\"MM-DD")
                                              |t $ %{} :Expr (:at 1629966512329) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629966513790) (:by |B1y7Rc-Zz) (:text |.to-list)
                                              |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963799424) (:by |B1y7Rc-Zz) (:text |.sort)
                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |x)
                                                          |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |y)
                                                      |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1629963811681) (:by |B1y7Rc-Zz) (:text |&compare)
                                                          |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |first)
                                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |y)
                                                          |v $ %{} :Expr (:at 1629963814058) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1629963814058) (:by |B1y7Rc-Zz) (:text |first)
                                                              |j $ %{} :Leaf (:at 1629963814058) (:by |B1y7Rc-Zz) (:text |x)
                                  |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629963929824) (:by |B1y7Rc-Zz) (:text |list->)
                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                      |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963820182) (:by |B1y7Rc-Zz) (:text |->)
                                          |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |grouped-notes)
                                          |n $ %{} :Expr (:at 1629963821944) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963827090) (:by |B1y7Rc-Zz) (:text |.to-list)
                                          |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963830502) (:by |B1y7Rc-Zz) (:text |.map-pair)
                                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |date)
                                                      |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |notes-in-day)
                                                  |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |[])
                                                      |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |date)
                                                      |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |div)
                                                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:style)
                                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:margin-top)
                                                                          |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |16)
                                                          |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |div)
                                                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                                                  |b $ %{} :Expr (:at 1657795173210) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1657795175285) (:by |B1y7Rc-Zz) (:text |:class-name)
                                                                      |b $ %{} :Leaf (:at 1657795178288) (:by |B1y7Rc-Zz) (:text |css/font-fancy)
                                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:style)
                                                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                                                          |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:font-size)
                                                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |14)
                                                                          |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:font-weight)
                                                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |500)
                                                              |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |<>)
                                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |->)
                                                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |str)
                                                                          |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |year)
                                                                          |r $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text "|\"-")
                                                                          |v $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |date)
                                                                      |r $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                                      |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |.format)
                                                                          |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text "|\"ddd")
                                                              |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |=<)
                                                                  |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |12)
                                                                  |r $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |nil)
                                                              |x $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |<>)
                                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |str)
                                                                      |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |date)
                                                          |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |list->)
                                                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |{})
                                                                  |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1657790949451) (:by |B1y7Rc-Zz) (:text |:class-name)
                                                                      |j $ %{} :Leaf (:at 1657790952262) (:by |B1y7Rc-Zz) (:text |css/column)
                                                              |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1629963836490) (:by |B1y7Rc-Zz) (:text |->)
                                                                  |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |notes-in-day)
                                                                  |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1629963850954) (:by |B1y7Rc-Zz) (:text |.sort-by)
                                                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |fn)
                                                                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1629963840870) (:by |B1y7Rc-Zz) (:text |pair)
                                                                          |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1629964067103) (:by |B1y7Rc-Zz) (:text |negate)
                                                                              |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                                :data $ {}
                                                                                  |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |:time)
                                                                                  |j $ %{} :Expr (:at 1629963846640) (:by |B1y7Rc-Zz)
                                                                                    :data $ {}
                                                                                      |T $ %{} :Leaf (:at 1629963846088) (:by |B1y7Rc-Zz) (:text |last)
                                                                                      |j $ %{} :Leaf (:at 1629963848239) (:by |B1y7Rc-Zz) (:text |pair)
                                                                  |v $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1629963859761) (:by |B1y7Rc-Zz) (:text |.map-pair)
                                                                      |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                        :data $ {}
                                                                          |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |fn)
                                                                          |j $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |k)
                                                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |note)
                                                                          |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                            :data $ {}
                                                                              |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |[])
                                                                              |j $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |k)
                                                                              |r $ %{} :Expr (:at 1572973376840) (:by |B1y7Rc-Zz)
                                                                                :data $ {}
                                                                                  |r $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |comp-note)
                                                                                  |v $ %{} :Expr (:at 1584879219140) (:by |B1y7Rc-Zz)
                                                                                    :data $ {}
                                                                                      |D $ %{} :Leaf (:at 1584879219937) (:by |B1y7Rc-Zz) (:text |>>)
                                                                                      |T $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |states)
                                                                                      |j $ %{} :Leaf (:at 1584879220688) (:by |B1y7Rc-Zz) (:text |k)
                                                                                  |x $ %{} :Leaf (:at 1572973376840) (:by |B1y7Rc-Zz) (:text |note)
                          |r $ %{} :Expr (:at 1572973379904) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973379904) (:by |B1y7Rc-Zz) (:text |=<)
                              |j $ %{} :Leaf (:at 1572973379904) (:by |B1y7Rc-Zz) (:text |nil)
                              |r $ %{} :Leaf (:at 1572973379904) (:by |B1y7Rc-Zz) (:text |160)
                      |v $ %{} :Expr (:at 1629964453801) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964456604) (:by |B1y7Rc-Zz) (:text |.render)
                          |j $ %{} :Leaf (:at 1629964457260) (:by |B1y7Rc-Zz) (:text |add-plugin)
        |css-note $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1658935565778) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1658935567983) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1658935565778) (:by |B1y7Rc-Zz) (:text |css-note)
              |h $ %{} :Expr (:at 1658935565778) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1658935569245) (:by |B1y7Rc-Zz) (:text |{})
                  |X $ %{} :Expr (:at 1658935588700) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658935590738) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1658935591549) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935591861) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935592098) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935597876) (:by |B1y7Rc-Zz) (:text |:transition-duration)
                              |b $ %{} :Leaf (:at 1658935600683) (:by |B1y7Rc-Zz) (:text "|\"200ms")
                  |b $ %{} :Expr (:at 1658935569717) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658935574327) (:by |B1y7Rc-Zz) (:text "|\"$0:hover")
                      |b $ %{} :Expr (:at 1658935574731) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935575748) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935576400) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935580100) (:by |B1y7Rc-Zz) (:text |:background-color)
                              |b $ %{} :Expr (:at 1658935580402) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1658935580752) (:by |B1y7Rc-Zz) (:text |hsl)
                                  |b $ %{} :Leaf (:at 1658935581224) (:by |B1y7Rc-Zz) (:text |0)
                                  |h $ %{} :Leaf (:at 1658935581443) (:by |B1y7Rc-Zz) (:text |0)
                                  |l $ %{} :Leaf (:at 1658935583338) (:by |B1y7Rc-Zz) (:text |80)
                                  |o $ %{} :Leaf (:at 1658935584748) (:by |B1y7Rc-Zz) (:text |0.2)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541010211) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.comp.notes-page)
            |v $ %{} :Expr (:at 1500541010211) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1629963768267) (:by |B1y7Rc-Zz) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |hsl)
                |n $ %{} :Expr (:at 1657790853440) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790854776) (:by |B1y7Rc-Zz) (:text |respo.css)
                    |b $ %{} :Leaf (:at 1657790857958) (:by |B1y7Rc-Zz) (:text |:refer)
                    |h $ %{} :Expr (:at 1657790858324) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1657790860099) (:by |B1y7Rc-Zz) (:text |defstyle)
                |p $ %{} :Expr (:at 1657790861275) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790865573) (:by |B1y7Rc-Zz) (:text |respo-ui.css)
                    |b $ %{} :Leaf (:at 1657790868440) (:by |B1y7Rc-Zz) (:text |:as)
                    |h $ %{} :Leaf (:at 1657790866575) (:by |B1y7Rc-Zz) (:text |css)
                |r $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |schema)
                |v $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1516547419785) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui)
                |y $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1542907291901) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
                        |n $ %{} :Leaf (:at 1524070875244) (:by |root) (:text |list->)
                        |p $ %{} :Leaf (:at 1584879138364) (:by |B1y7Rc-Zz) (:text |>>)
                        |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                        |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |span)
                        |x $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                        |y $ %{} :Leaf (:at 1556645672770) (:by |B1y7Rc-Zz) (:text |button)
                        |yT $ %{} :Leaf (:at 1556645673058) (:by |B1y7Rc-Zz) (:text |a)
                |yT $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |respo.comp.space)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                |yj $ %{} :Expr (:at 1527788936196) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1527788937835) (:by |root) (:text |app.config)
                    |r $ %{} :Leaf (:at 1527788938747) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1527788939786) (:by |root) (:text |config)
                |yr $ %{} :Expr (:at 1556646814337) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1584878805329) (:by |B1y7Rc-Zz) (:text |respo-alerts.core)
                    |r $ %{} :Leaf (:at 1556646817775) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1556646817986) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1629963771401) (:by |B1y7Rc-Zz) (:text |use-prompt)
                        |r $ %{} :Leaf (:at 1629963773079) (:by |B1y7Rc-Zz) (:text |use-confirm)
                |yv $ %{} :Expr (:at 1556647403272) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1556647403990) (:by |B1y7Rc-Zz) (:text |feather.core)
                    |r $ %{} :Leaf (:at 1556647406014) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1556647406234) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1556647408448) (:by |B1y7Rc-Zz) (:text |comp-i)
                        |r $ %{} :Leaf (:at 1556648443394) (:by |B1y7Rc-Zz) (:text |comp-icon)
                |yx $ %{} :Expr (:at 1556647554198) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1556647557362) (:by |B1y7Rc-Zz) (:text "|\"dayjs")
                    |r $ %{} :Leaf (:at 1629963765657) (:by |B1y7Rc-Zz) (:text |:default)
                    |v $ %{} :Leaf (:at 1556647559680) (:by |B1y7Rc-Zz) (:text |dayjs)
    |app.comp.overview $ %{} :FileEntry
      :defs $ {}
        |comp-no-tasks $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1537291230974) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1537291232141) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1537291230974) (:by |root) (:text |comp-no-tasks)
              |r $ %{} :Expr (:at 1537291230974) (:by |root)
                :data $ {}
              |v $ %{} :Expr (:at 1537291233551) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1537291234532) (:by |root) (:text |div)
                  |j $ %{} :Expr (:at 1537291235140) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537291235434) (:by |root) (:text |{})
                      |b $ %{} :Expr (:at 1657790800289) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790803403) (:by |B1y7Rc-Zz) (:text |:class-name)
                          |b $ %{} :Expr (:at 1657795204236) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1657795207785) (:by |B1y7Rc-Zz) (:text |str-spaced)
                              |T $ %{} :Leaf (:at 1657790805324) (:by |B1y7Rc-Zz) (:text |css/center)
                              |b $ %{} :Leaf (:at 1657795211906) (:by |B1y7Rc-Zz) (:text |css/font-fancy)
                      |j $ %{} :Expr (:at 1537291264061) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537291265443) (:by |root) (:text |:style)
                          |j $ %{} :Expr (:at 1537291272604) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1537291273953) (:by |root) (:text |{})
                              |j $ %{} :Expr (:at 1537291274385) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537291276664) (:by |root) (:text |:color)
                                  |j $ %{} :Expr (:at 1537291276939) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1537291277319) (:by |root) (:text |hsl)
                                      |j $ %{} :Leaf (:at 1537291278418) (:by |root) (:text |0)
                                      |r $ %{} :Leaf (:at 1537291278650) (:by |root) (:text |0)
                                      |v $ %{} :Leaf (:at 1537291278964) (:by |root) (:text |80)
                  |r $ %{} :Expr (:at 1537291235847) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537291236191) (:by |root) (:text |<>)
                      |j $ %{} :Leaf (:at 1537291238674) (:by |root) (:text "|\"No tasks")
        |comp-overview $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533618614003) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1533618616935) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1533618614003) (:by |root) (:text |comp-overview)
              |r $ %{} :Expr (:at 1533618614003) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533618689785) (:by |root) (:text |states)
                  |j $ %{} :Leaf (:at 1533695021776) (:by |root) (:text |today)
                  |r $ %{} :Leaf (:at 1533695861899) (:by |root) (:text |tasks)
              |v $ %{} :Expr (:at 1533695863284) (:by |root)
                :data $ {}
                  |D $ %{} :Leaf (:at 1533695863804) (:by |root) (:text |let)
                  |L $ %{} :Expr (:at 1533695863995) (:by |root)
                    :data $ {}
                      |T $ %{} :Expr (:at 1533695864132) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695865878) (:by |root) (:text |working-tasks)
                          |j $ %{} :Expr (:at 1537291166821) (:by |root)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1629963383111) (:by |B1y7Rc-Zz) (:text |->)
                              |T $ %{} :Leaf (:at 1533695867966) (:by |root) (:text |tasks)
                              |b $ %{} :Expr (:at 1629965333101) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629965345693) (:by |B1y7Rc-Zz) (:text |.to-map)
                              |j $ %{} :Expr (:at 1537291170985) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629965485362) (:by |B1y7Rc-Zz) (:text |filter)
                                  |j $ %{} :Expr (:at 1537291177792) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1537291178080) (:by |root) (:text |fn)
                                      |j $ %{} :Expr (:at 1537291178352) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963404199) (:by |B1y7Rc-Zz) (:text |pair)
                                      |r $ %{} :Expr (:at 1537291187804) (:by |root)
                                        :data $ {}
                                          |D $ %{} :Leaf (:at 1537291188374) (:by |root) (:text |not)
                                          |T $ %{} :Expr (:at 1537291183386) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1537291186281) (:by |root) (:text |:pending?)
                                              |j $ %{} :Expr (:at 1629963398450) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963399759) (:by |B1y7Rc-Zz) (:text |last)
                                                  |j $ %{} :Leaf (:at 1629963400854) (:by |B1y7Rc-Zz) (:text |pair)
                      |r $ %{} :Expr (:at 1537290757538) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537290769300) (:by |root) (:text |pending-tasks)
                          |j $ %{} :Expr (:at 1537291190680) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629963405501) (:by |B1y7Rc-Zz) (:text |->)
                              |j $ %{} :Leaf (:at 1537291190680) (:by |root) (:text |tasks)
                              |n $ %{} :Expr (:at 1629965337632) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629965342958) (:by |B1y7Rc-Zz) (:text |.to-map)
                              |r $ %{} :Expr (:at 1537291190680) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629965483635) (:by |B1y7Rc-Zz) (:text |filter)
                                  |j $ %{} :Expr (:at 1537291190680) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1537291190680) (:by |root) (:text |fn)
                                      |j $ %{} :Expr (:at 1537291190680) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963414777) (:by |B1y7Rc-Zz) (:text |pair)
                                      |r $ %{} :Expr (:at 1537291190680) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1537291190680) (:by |root) (:text |:pending?)
                                          |j $ %{} :Expr (:at 1629963415761) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963418226) (:by |B1y7Rc-Zz) (:text |last)
                                              |j $ %{} :Leaf (:at 1629963419082) (:by |B1y7Rc-Zz) (:text |pair)
                      |v $ %{} :Expr (:at 1629963545234) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629963551427) (:by |B1y7Rc-Zz) (:text |create-plugin)
                          |j $ %{} :Expr (:at 1629963552327) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629963563825) (:by |B1y7Rc-Zz) (:text |use-prompt)
                              |j $ %{} :Expr (:at 1629963564219) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629963564958) (:by |B1y7Rc-Zz) (:text |>>)
                                  |j $ %{} :Leaf (:at 1629963566311) (:by |B1y7Rc-Zz) (:text |states)
                                  |r $ %{} :Leaf (:at 1629963568183) (:by |B1y7Rc-Zz) (:text |:create)
                              |r $ %{} :Expr (:at 1629963573636) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629963573636) (:by |B1y7Rc-Zz) (:text |{})
                                  |r $ %{} :Expr (:at 1629963573636) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629963573636) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1629963573636) (:by |B1y7Rc-Zz) (:text "|\"Create new task:")
                      |vT $ %{} :Expr (:at 1651230025326) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1651230026803) (:by |B1y7Rc-Zz) (:text |cursor)
                          |b $ %{} :Expr (:at 1651230027409) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1651230029510) (:by |B1y7Rc-Zz) (:text |:cursor)
                              |b $ %{} :Leaf (:at 1651230030378) (:by |B1y7Rc-Zz) (:text |states)
                      |w $ %{} :Expr (:at 1651230021746) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1651230023422) (:by |B1y7Rc-Zz) (:text |state)
                          |b $ %{} :Expr (:at 1651230023745) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1651230024055) (:by |B1y7Rc-Zz) (:text |or)
                              |b $ %{} :Expr (:at 1651230032427) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1651230033097) (:by |B1y7Rc-Zz) (:text |:data)
                                  |b $ %{} :Leaf (:at 1651230033939) (:by |B1y7Rc-Zz) (:text |states)
                              |h $ %{} :Expr (:at 1651230035437) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1651230035789) (:by |B1y7Rc-Zz) (:text |{})
                                  |b $ %{} :Expr (:at 1651230036606) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1651230039919) (:by |B1y7Rc-Zz) (:text |:show-later?)
                                      |b $ %{} :Leaf (:at 1651230040565) (:by |B1y7Rc-Zz) (:text |false)
                  |T $ %{} :Expr (:at 1533618618975) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533618621869) (:by |root) (:text |div)
                      |j $ %{} :Expr (:at 1533618622083) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533618622386) (:by |root) (:text |{})
                          |b $ %{} :Expr (:at 1657791265240) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791268391) (:by |B1y7Rc-Zz) (:text |:class-name)
                              |b $ %{} :Leaf (:at 1657791272680) (:by |B1y7Rc-Zz) (:text |css/expand)
                          |j $ %{} :Expr (:at 1533696221337) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533696222111) (:by |root) (:text |:style)
                              |j $ %{} :Expr (:at 1533696222312) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533696223308) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1533696223735) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1533696225506) (:by |root) (:text |:padding)
                                      |j $ %{} :Leaf (:at 1533696225963) (:by |root) (:text |16)
                      |xD $ %{} :Expr (:at 1572973269346) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1572973270203) (:by |B1y7Rc-Zz) (:text |div)
                          |L $ %{} :Expr (:at 1572973271510) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973271146) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1572973294486) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973296052) (:by |B1y7Rc-Zz) (:text |:style)
                                  |j $ %{} :Expr (:at 1572973296274) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973296563) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1572973296850) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973299425) (:by |B1y7Rc-Zz) (:text |:max-width)
                                          |j $ %{} :Leaf (:at 1572973312440) (:by |B1y7Rc-Zz) (:text |800)
                                      |r $ %{} :Expr (:at 1572973303302) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973305105) (:by |B1y7Rc-Zz) (:text |:margin)
                                          |j $ %{} :Leaf (:at 1572973306601) (:by |B1y7Rc-Zz) (:text |:auto)
                          |T $ %{} :Expr (:at 1537981319220) (:by |root)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1537981320101) (:by |root) (:text |div)
                              |L $ %{} :Expr (:at 1537981320365) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537981321494) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1537981321800) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657791280005) (:by |B1y7Rc-Zz) (:text |:class-name)
                                      |j $ %{} :Leaf (:at 1657791282524) (:by |B1y7Rc-Zz) (:text |css/row-parted)
                              |T $ %{} :Expr (:at 1537290124070) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537290126283) (:by |root) (:text |comp-title)
                                  |j $ %{} :Leaf (:at 1537290131509) (:by |root) (:text "|\"Doing")
                                  |n $ %{} :Expr (:at 1629963594557) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629963597407) (:by |B1y7Rc-Zz) (:text |comp-icon)
                                      |j $ %{} :Leaf (:at 1629963594557) (:by |B1y7Rc-Zz) (:text |:plus)
                                      |r $ %{} :Expr (:at 1629963599287) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |D $ %{} :Leaf (:at 1629963600597) (:by |B1y7Rc-Zz) (:text |&{})
                                          |L $ %{} :Leaf (:at 1629963609563) (:by |B1y7Rc-Zz) (:text |:font-size)
                                          |T $ %{} :Leaf (:at 1629963607065) (:by |B1y7Rc-Zz) (:text |14)
                                          |j $ %{} :Leaf (:at 1629963611140) (:by |B1y7Rc-Zz) (:text |:color)
                                          |r $ %{} :Expr (:at 1629963613940) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |hsl)
                                              |j $ %{} :Leaf (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |200)
                                              |r $ %{} :Leaf (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |80)
                                              |v $ %{} :Leaf (:at 1629963613940) (:by |B1y7Rc-Zz) (:text |80)
                                          |v $ %{} :Leaf (:at 1629963622153) (:by |B1y7Rc-Zz) (:text |:cursor)
                                          |x $ %{} :Leaf (:at 1629963621338) (:by |B1y7Rc-Zz) (:text |:pointer)
                                      |v $ %{} :Expr (:at 1629963623571) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963624478) (:by |B1y7Rc-Zz) (:text |fn)
                                          |j $ %{} :Expr (:at 1629963624577) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963625506) (:by |B1y7Rc-Zz) (:text |e)
                                              |j $ %{} :Leaf (:at 1629963626528) (:by |B1y7Rc-Zz) (:text |d!)
                                          |r $ %{} :Expr (:at 1629963627036) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963629226) (:by |B1y7Rc-Zz) (:text |.show)
                                              |j $ %{} :Leaf (:at 1629963632977) (:by |B1y7Rc-Zz) (:text |create-plugin)
                                              |r $ %{} :Leaf (:at 1629963634514) (:by |B1y7Rc-Zz) (:text |d!)
                                              |v $ %{} :Expr (:at 1629963635149) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963635982) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |b $ %{} :Expr (:at 1629963653716) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |D $ %{} :Leaf (:at 1629963959950) (:by |B1y7Rc-Zz) (:text |result)
                                                  |j $ %{} :Expr (:at 1629963641634) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |L $ %{} :Leaf (:at 1629963657554) (:by |B1y7Rc-Zz) (:text |d!)
                                                      |j $ %{} :Leaf (:at 1629963641634) (:by |B1y7Rc-Zz) (:text |:task/create-working)
                                                      |r $ %{} :Leaf (:at 1629963641634) (:by |B1y7Rc-Zz) (:text |result)
                              |b $ %{} :Expr (:at 1697653421441) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1697653426086) (:by |B1y7Rc-Zz) (:text |comp-global-keydown)
                                  |b $ %{} :Expr (:at 1697653443926) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1697653444355) (:by |B1y7Rc-Zz) (:text |{})
                                  |h $ %{} :Expr (:at 1697653450250) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1697653450667) (:by |B1y7Rc-Zz) (:text |fn)
                                      |b $ %{} :Expr (:at 1697653454393) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1697653453669) (:by |B1y7Rc-Zz) (:text |e)
                                          |b $ %{} :Leaf (:at 1697653455496) (:by |B1y7Rc-Zz) (:text |d!)
                                      |h $ %{} :Expr (:at 1697653461980) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1697653509184) (:by |B1y7Rc-Zz) (:text |if)
                                          |b $ %{} :Expr (:at 1697653512606) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1697653513024) (:by |B1y7Rc-Zz) (:text |and)
                                              |X $ %{} :Expr (:at 1697653524304) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1697653530280) (:by |B1y7Rc-Zz) (:text |:meta?)
                                                  |b $ %{} :Leaf (:at 1697653530610) (:by |B1y7Rc-Zz) (:text |e)
                                              |b $ %{} :Expr (:at 1697653519425) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |D $ %{} :Leaf (:at 1697653519785) (:by |B1y7Rc-Zz) (:text |=)
                                                  |L $ %{} :Leaf (:at 1697653520846) (:by |B1y7Rc-Zz) (:text "|\"b")
                                                  |T $ %{} :Expr (:at 1697653514031) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1697653517136) (:by |B1y7Rc-Zz) (:text |:key)
                                                      |b $ %{} :Leaf (:at 1697653518495) (:by |B1y7Rc-Zz) (:text |e)
                                          |h $ %{} :Expr (:at 1697653534243) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |.show)
                                              |b $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |create-plugin)
                                              |h $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |d!)
                                              |l $ %{} :Expr (:at 1697653534243) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |fn)
                                                  |b $ %{} :Expr (:at 1697653534243) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |result)
                                                  |h $ %{} :Expr (:at 1697653534243) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |d!)
                                                      |b $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |:task/create-working)
                                                      |h $ %{} :Leaf (:at 1697653534243) (:by |B1y7Rc-Zz) (:text |result)
                              |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |div)
                                  |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |{})
                                      |b $ %{} :Expr (:at 1657790772053) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1657790775508) (:by |B1y7Rc-Zz) (:text |:class-name)
                                          |b $ %{} :Expr (:at 1657795236849) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1657795239996) (:by |B1y7Rc-Zz) (:text |str-spaced)
                                              |T $ %{} :Leaf (:at 1657790779103) (:by |B1y7Rc-Zz) (:text |css/row-middle)
                                              |b $ %{} :Leaf (:at 1657795243570) (:by |B1y7Rc-Zz) (:text |css/font-fancy)
                                      |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |:style)
                                          |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |{})
                                              |r $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |:color)
                                                  |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |hsl)
                                                      |j $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |0)
                                                      |r $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |0)
                                                      |v $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |60)
                                  |r $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |<>)
                                      |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1697653383148) (:by |B1y7Rc-Zz) (:text |.!format)
                                          |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |dayjs)
                                              |j $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |today)
                                          |r $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text "|\"ddd")
                                  |v $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |=<)
                                      |j $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |8)
                                      |r $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |nil)
                                  |x $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |<>)
                                      |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |str)
                                          |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629965545054) (:by |B1y7Rc-Zz) (:text |.!week)
                                              |j $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |dayjs)
                                                  |j $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |today)
                                          |r $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text "|\"th week")
                                  |y $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |=<)
                                      |j $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |16)
                                      |r $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |nil)
                                  |yT $ %{} :Expr (:at 1557245445481) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |<>)
                                      |j $ %{} :Leaf (:at 1557245445481) (:by |B1y7Rc-Zz) (:text |today)
                          |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |empty?)
                                  |j $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |working-tasks)
                              |r $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |comp-no-tasks)
                              |v $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |list->)
                                  |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |{})
                                  |r $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629963424416) (:by |B1y7Rc-Zz) (:text |->)
                                      |j $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |working-tasks)
                                      |n $ %{} :Expr (:at 1629963427737) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963428706) (:by |B1y7Rc-Zz) (:text |.to-list)
                                      |r $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963430691) (:by |B1y7Rc-Zz) (:text |.sort-by)
                                          |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |fn)
                                              |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963448269) (:by |B1y7Rc-Zz) (:text |pair)
                                              |r $ %{} :Expr (:at 1629963435512) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |D $ %{} :Leaf (:at 1629963436435) (:by |B1y7Rc-Zz) (:text |let)
                                                  |L $ %{} :Expr (:at 1629963436591) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Expr (:at 1629963436646) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1629963437741) (:by |B1y7Rc-Zz) (:text |task)
                                                          |j $ %{} :Expr (:at 1629963438226) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1629963443322) (:by |B1y7Rc-Zz) (:text |last)
                                                              |j $ %{} :Leaf (:at 1629963442283) (:by |B1y7Rc-Zz) (:text |pair)
                                                  |T $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629963451613) (:by |B1y7Rc-Zz) (:text |negate)
                                                      |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |or)
                                                          |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |:touched-time)
                                                              |j $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |task)
                                                          |r $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |:created-time)
                                                              |j $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |task)
                                      |v $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963456625) (:by |B1y7Rc-Zz) (:text |.map-pair)
                                          |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |fn)
                                              |j $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |D $ %{} :Leaf (:at 1629963461417) (:by |B1y7Rc-Zz) (:text |k)
                                                  |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |task)
                                              |r $ %{} :Expr (:at 1629963462480) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |D $ %{} :Leaf (:at 1629963463329) (:by |B1y7Rc-Zz) (:text |[])
                                                  |L $ %{} :Leaf (:at 1629963464359) (:by |B1y7Rc-Zz) (:text |k)
                                                  |T $ %{} :Expr (:at 1572973276693) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |r $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |comp-task)
                                                      |v $ %{} :Expr (:at 1584879105083) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1584879106398) (:by |B1y7Rc-Zz) (:text |>>)
                                                          |T $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |states)
                                                          |j $ %{} :Expr (:at 1584879111521) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1584879111521) (:by |B1y7Rc-Zz) (:text |:id)
                                                              |j $ %{} :Leaf (:at 1584879111521) (:by |B1y7Rc-Zz) (:text |task)
                                                      |x $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |task)
                                                      |y $ %{} :Leaf (:at 1572973276693) (:by |B1y7Rc-Zz) (:text |:working)
                          |r $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |when)
                              |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |not)
                                  |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |empty?)
                                      |j $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |pending-tasks)
                              |r $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |div)
                                  |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |{})
                                  |r $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |comp-title)
                                      |j $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text "|\"Later")
                                      |r $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |nil)
                                      |t $ %{} :Expr (:at 1651230150008) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1651230150306) (:by |B1y7Rc-Zz) (:text |fn)
                                          |b $ %{} :Expr (:at 1651230150580) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1651230150765) (:by |B1y7Rc-Zz) (:text |e)
                                              |b $ %{} :Leaf (:at 1651230151392) (:by |B1y7Rc-Zz) (:text |d!)
                                          |h $ %{} :Expr (:at 1651230152215) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1651230153929) (:by |B1y7Rc-Zz) (:text |d!)
                                              |b $ %{} :Leaf (:at 1651230154946) (:by |B1y7Rc-Zz) (:text |cursor)
                                              |h $ %{} :Expr (:at 1651230155363) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1651230156243) (:by |B1y7Rc-Zz) (:text |update)
                                                  |b $ %{} :Leaf (:at 1651230158235) (:by |B1y7Rc-Zz) (:text |state)
                                                  |h $ %{} :Leaf (:at 1651230161455) (:by |B1y7Rc-Zz) (:text |:show-later?)
                                                  |l $ %{} :Leaf (:at 1651230163261) (:by |B1y7Rc-Zz) (:text |not)
                                  |v $ %{} :Expr (:at 1651230045674) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1651230046152) (:by |B1y7Rc-Zz) (:text |if)
                                      |L $ %{} :Expr (:at 1651230046886) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1651230052711) (:by |B1y7Rc-Zz) (:text |:show-later?)
                                          |b $ %{} :Leaf (:at 1651230053854) (:by |B1y7Rc-Zz) (:text |state)
                                      |T $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |list->)
                                          |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |{})
                                          |r $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629963505166) (:by |B1y7Rc-Zz) (:text |->)
                                              |j $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |pending-tasks)
                                              |n $ %{} :Expr (:at 1629963506390) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963509539) (:by |B1y7Rc-Zz) (:text |.to-list)
                                              |r $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963511148) (:by |B1y7Rc-Zz) (:text |.sort-by)
                                                  |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1629963529324) (:by |B1y7Rc-Zz) (:text |pair)
                                                      |r $ %{} :Expr (:at 1629963514920) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1629963518933) (:by |B1y7Rc-Zz) (:text |let)
                                                          |L $ %{} :Expr (:at 1629963519615) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Expr (:at 1629963520255) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1629964000410) (:by |B1y7Rc-Zz) (:text |task)
                                                                  |j $ %{} :Expr (:at 1629963521199) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1629963522641) (:by |B1y7Rc-Zz) (:text |last)
                                                                      |j $ %{} :Leaf (:at 1629963523819) (:by |B1y7Rc-Zz) (:text |pair)
                                                          |T $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1629963514262) (:by |B1y7Rc-Zz) (:text |negate)
                                                              |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |or)
                                                                  |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |:touched-time)
                                                                      |j $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |task)
                                                                  |r $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |:created-time)
                                                                      |j $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |task)
                                              |v $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629963532185) (:by |B1y7Rc-Zz) (:text |.map-pair)
                                                  |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |j $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1629963534515) (:by |B1y7Rc-Zz) (:text |k)
                                                          |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |task)
                                                      |r $ %{} :Expr (:at 1629963535676) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1629963536756) (:by |B1y7Rc-Zz) (:text |[])
                                                          |L $ %{} :Leaf (:at 1629963537235) (:by |B1y7Rc-Zz) (:text |k)
                                                          |T $ %{} :Expr (:at 1572973285854) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |r $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |comp-task)
                                                              |v $ %{} :Expr (:at 1584879243542) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |D $ %{} :Leaf (:at 1584879244219) (:by |B1y7Rc-Zz) (:text |>>)
                                                                  |T $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |states)
                                                                  |j $ %{} :Expr (:at 1584879245178) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1584879245178) (:by |B1y7Rc-Zz) (:text |:id)
                                                                      |j $ %{} :Leaf (:at 1584879245178) (:by |B1y7Rc-Zz) (:text |task)
                                                              |x $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |task)
                                                              |y $ %{} :Leaf (:at 1572973285854) (:by |B1y7Rc-Zz) (:text |:pending)
                                      |b $ %{} :Expr (:at 1651230057312) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1651230059054) (:by |B1y7Rc-Zz) (:text |div)
                                          |b $ %{} :Expr (:at 1651230059317) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1651230059633) (:by |B1y7Rc-Zz) (:text |{})
                                              |b $ %{} :Expr (:at 1651230079800) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1651230081374) (:by |B1y7Rc-Zz) (:text |:style)
                                                  |b $ %{} :Expr (:at 1651230081689) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1651230083211) (:by |B1y7Rc-Zz) (:text |{})
                                                      |b $ %{} :Expr (:at 1651230084365) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1651230088931) (:by |B1y7Rc-Zz) (:text |:font-size)
                                                          |b $ %{} :Leaf (:at 1651230090797) (:by |B1y7Rc-Zz) (:text |16)
                                              |h $ %{} :Expr (:at 1651230248816) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1651230250602) (:by |B1y7Rc-Zz) (:text |:on-click)
                                                  |b $ %{} :Expr (:at 1651230251541) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |b $ %{} :Expr (:at 1651230251541) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |e)
                                                          |b $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |d!)
                                                      |h $ %{} :Expr (:at 1651230251541) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |d!)
                                                          |b $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |cursor)
                                                          |h $ %{} :Expr (:at 1651230251541) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |update)
                                                              |b $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |state)
                                                              |h $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |:show-later?)
                                                              |l $ %{} :Leaf (:at 1651230251541) (:by |B1y7Rc-Zz) (:text |not)
                                          |h $ %{} :Expr (:at 1651230060290) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1651230060618) (:by |B1y7Rc-Zz) (:text |<>)
                                              |b $ %{} :Expr (:at 1651230063570) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1651230064599) (:by |B1y7Rc-Zz) (:text |str)
                                                  |X $ %{} :Expr (:at 1651230072629) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1651230073400) (:by |B1y7Rc-Zz) (:text |count)
                                                      |b $ %{} :Leaf (:at 1651230075170) (:by |B1y7Rc-Zz) (:text |pending-tasks)
                                                  |b $ %{} :Leaf (:at 1651230276084) (:by |B1y7Rc-Zz) (:text "|\" future tasks. Click to show.")
                                              |h $ %{} :Expr (:at 1651230205470) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1651230209702) (:by |B1y7Rc-Zz) (:text |{})
                                                  |b $ %{} :Expr (:at 1651230210125) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1651230212299) (:by |B1y7Rc-Zz) (:text |:font-family)
                                                      |b $ %{} :Leaf (:at 1651230218747) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                                                  |h $ %{} :Expr (:at 1651230220104) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1651230224437) (:by |B1y7Rc-Zz) (:text |:font-weight)
                                                      |b $ %{} :Leaf (:at 1651230228132) (:by |B1y7Rc-Zz) (:text |300)
                                                  |l $ %{} :Expr (:at 1651230281756) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1651230283583) (:by |B1y7Rc-Zz) (:text |:cursor)
                                                      |b $ %{} :Leaf (:at 1651230284577) (:by |B1y7Rc-Zz) (:text |:pointer)
                          |v $ %{} :Expr (:at 1629963579383) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629963581565) (:by |B1y7Rc-Zz) (:text |.render)
                              |j $ %{} :Leaf (:at 1629963584645) (:by |B1y7Rc-Zz) (:text |create-plugin)
        |comp-task $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1536652646384) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1536652647724) (:by |B1y7Rc-Zz) (:text |defcomp)
              |j $ %{} :Leaf (:at 1536652646384) (:by |B1y7Rc-Zz) (:text |comp-task)
              |n $ %{} :Expr (:at 1536652649039) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1536652675934) (:by |B1y7Rc-Zz) (:text |states)
                  |T $ %{} :Leaf (:at 1536652650350) (:by |B1y7Rc-Zz) (:text |task)
                  |j $ %{} :Leaf (:at 1537982327073) (:by |root) (:text |mode)
              |r $ %{} :Expr (:at 1536652681784) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1536652682362) (:by |B1y7Rc-Zz) (:text |let)
                  |L $ %{} :Expr (:at 1536652682550) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Expr (:at 1584879302487) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1584879303360) (:by |B1y7Rc-Zz) (:text |cursor)
                          |j $ %{} :Expr (:at 1584879304168) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1584879305359) (:by |B1y7Rc-Zz) (:text |:cursor)
                              |j $ %{} :Leaf (:at 1584879306796) (:by |B1y7Rc-Zz) (:text |states)
                      |T $ %{} :Expr (:at 1536652682705) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1536652685285) (:by |B1y7Rc-Zz) (:text |state)
                          |j $ %{} :Expr (:at 1536652685604) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536652686361) (:by |B1y7Rc-Zz) (:text |or)
                              |j $ %{} :Expr (:at 1536652686632) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536652688217) (:by |B1y7Rc-Zz) (:text |:data)
                                  |j $ %{} :Leaf (:at 1536652689125) (:by |B1y7Rc-Zz) (:text |states)
                              |r $ %{} :Expr (:at 1536652689985) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536652690329) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1536652690542) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1536652695642) (:by |B1y7Rc-Zz) (:text |:menu?)
                                      |j $ %{} :Leaf (:at 1536652696406) (:by |B1y7Rc-Zz) (:text |false)
                      |j $ %{} :Expr (:at 1586593011185) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1586593015304) (:by |B1y7Rc-Zz) (:text |update-plugin)
                          |j $ %{} :Expr (:at 1586593015658) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1586593083553) (:by |B1y7Rc-Zz) (:text |use-prompt)
                              |j $ %{} :Expr (:at 1586593084208) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1586593084966) (:by |B1y7Rc-Zz) (:text |>>)
                                  |b $ %{} :Leaf (:at 1586593090838) (:by |B1y7Rc-Zz) (:text |states)
                                  |j $ %{} :Leaf (:at 1586593104582) (:by |B1y7Rc-Zz) (:text |:drafter)
                              |r $ %{} :Expr (:at 1586593091375) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1586593092366) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1586593144548) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1586593160802) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1586593464954) (:by |B1y7Rc-Zz) (:text "|\"Task content:")
                                  |r $ %{} :Expr (:at 1586593174439) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1586593177890) (:by |B1y7Rc-Zz) (:text |:initial)
                                      |j $ %{} :Expr (:at 1586593179367) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1586593180446) (:by |B1y7Rc-Zz) (:text |:text)
                                          |j $ %{} :Leaf (:at 1586593182389) (:by |B1y7Rc-Zz) (:text |task)
                                  |v $ %{} :Expr (:at 1586593186498) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1586593188234) (:by |B1y7Rc-Zz) (:text |:placeholder)
                                      |j $ %{} :Leaf (:at 1586593207002) (:by |B1y7Rc-Zz) (:text "|\"task...")
                                  |x $ %{} :Expr (:at 1586593256694) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1586593259551) (:by |B1y7Rc-Zz) (:text |:button-text)
                                      |j $ %{} :Leaf (:at 1586593260904) (:by |B1y7Rc-Zz) (:text "|\"Edit")
                      |r $ %{} :Expr (:at 1586593601958) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1586593607942) (:by |B1y7Rc-Zz) (:text |delete-plugin)
                          |j $ %{} :Expr (:at 1586593608277) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1586593610255) (:by |B1y7Rc-Zz) (:text |use-confirm)
                              |j $ %{} :Expr (:at 1586593611550) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1586593612109) (:by |B1y7Rc-Zz) (:text |>>)
                                  |j $ %{} :Leaf (:at 1586593620063) (:by |B1y7Rc-Zz) (:text |states)
                                  |r $ %{} :Leaf (:at 1586593624512) (:by |B1y7Rc-Zz) (:text |:delete)
                              |r $ %{} :Expr (:at 1586593625555) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1586593625916) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1586593626232) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1586593634953) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1586593643536) (:by |B1y7Rc-Zz) (:text "|\"Sure to remove task:")
                  |T $ %{} :Expr (:at 1536652646384) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1536652646384) (:by |B1y7Rc-Zz) (:text |div)
                      |j $ %{} :Expr (:at 1536652646384) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1536652646384) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1657790693244) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790695712) (:by |B1y7Rc-Zz) (:text |:class-name)
                              |b $ %{} :Leaf (:at 1657790707430) (:by |B1y7Rc-Zz) (:text |css-task-base)
                          |j $ %{} :Expr (:at 1536652733590) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536652734415) (:by |B1y7Rc-Zz) (:text |:style)
                              |j $ %{} :Expr (:at 1536652744088) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1536652746010) (:by |B1y7Rc-Zz) (:text |merge)
                                  |r $ %{} :Expr (:at 1536946809997) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1536946810668) (:by |root) (:text |when)
                                      |j $ %{} :Expr (:at 1536946811005) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1536946813361) (:by |root) (:text |or)
                                          |j $ %{} :Expr (:at 1536946813595) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1536946816343) (:by |root) (:text |:menu?)
                                              |j $ %{} :Leaf (:at 1536946817436) (:by |root) (:text |state)
                                      |r $ %{} :Expr (:at 1536946827120) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1536946827531) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1536946827846) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1536946895875) (:by |root) (:text |:background-color)
                                              |j $ %{} :Expr (:at 1536946897482) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1536946897922) (:by |root) (:text |hsl)
                                                  |j $ %{} :Leaf (:at 1536946898546) (:by |root) (:text |0)
                                                  |r $ %{} :Leaf (:at 1536946899099) (:by |root) (:text |0)
                                                  |v $ %{} :Leaf (:at 1536946929694) (:by |root) (:text |94)
                          |r $ %{} :Expr (:at 1536821311797) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |:on-click)
                              |j $ %{} :Expr (:at 1536821311797) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |fn)
                                  |j $ %{} :Expr (:at 1536821311797) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |e)
                                      |j $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |d!)
                                  |r $ %{} :Expr (:at 1536821311797) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1584879310925) (:by |B1y7Rc-Zz) (:text |d!)
                                      |b $ %{} :Leaf (:at 1584879312346) (:by |B1y7Rc-Zz) (:text |cursor)
                                      |j $ %{} :Expr (:at 1536821311797) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |assoc)
                                          |j $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |state)
                                          |r $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |:menu?)
                                          |v $ %{} :Leaf (:at 1536821311797) (:by |B1y7Rc-Zz) (:text |true)
                          |x $ %{} :Expr (:at 1565715970468) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1565716009347) (:by |B1y7Rc-Zz) (:text |:on-dragend)
                              |j $ %{} :Expr (:at 1565715992506) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1565715992827) (:by |B1y7Rc-Zz) (:text |fn)
                                  |j $ %{} :Expr (:at 1565715993797) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1565715994047) (:by |B1y7Rc-Zz) (:text |e)
                                      |j $ %{} :Leaf (:at 1565715996478) (:by |B1y7Rc-Zz) (:text |d!)
                                  |r $ %{} :Expr (:at 1565716042516) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1565716042516) (:by |B1y7Rc-Zz) (:text |d!)
                                      |j $ %{} :Leaf (:at 1565716042516) (:by |B1y7Rc-Zz) (:text |:task/touch-working)
                                      |r $ %{} :Expr (:at 1565716042516) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1565716042516) (:by |B1y7Rc-Zz) (:text |:id)
                                          |j $ %{} :Leaf (:at 1565716042516) (:by |B1y7Rc-Zz) (:text |task)
                          |y $ %{} :Expr (:at 1565716020188) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1565716022898) (:by |B1y7Rc-Zz) (:text |:draggable)
                              |j $ %{} :Leaf (:at 1565716023613) (:by |B1y7Rc-Zz) (:text |true)
                      |r $ %{} :Expr (:at 1536652712747) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1536652713454) (:by |B1y7Rc-Zz) (:text |div)
                          |L $ %{} :Expr (:at 1536652714693) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536652715062) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1536652715273) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536652716829) (:by |B1y7Rc-Zz) (:text |:style)
                                  |j $ %{} :Leaf (:at 1536652732658) (:by |B1y7Rc-Zz) (:text |ui/flex)
                          |T $ %{} :Expr (:at 1536652646384) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536652646384) (:by |B1y7Rc-Zz) (:text |<>)
                              |j $ %{} :Expr (:at 1536652646384) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536652646384) (:by |B1y7Rc-Zz) (:text |:text)
                                  |j $ %{} :Leaf (:at 1536652646384) (:by |B1y7Rc-Zz) (:text |task)
                              |r $ %{} :Expr (:at 1536733147145) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536733147535) (:by |B1y7Rc-Zz) (:text |{})
                      |xL $ %{} :Expr (:at 1572936877567) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1572936880230) (:by |B1y7Rc-Zz) (:text |comp-modal-menu)
                          |r $ %{} :Expr (:at 1572936888007) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572936888850) (:by |B1y7Rc-Zz) (:text |{})
                              |j $ %{} :Expr (:at 1572936889987) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572936892587) (:by |B1y7Rc-Zz) (:text |:title)
                                  |j $ %{} :Leaf (:at 1572936897983) (:by |B1y7Rc-Zz) (:text "|\"Operations")
                              |r $ %{} :Expr (:at 1572937182253) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572937184012) (:by |B1y7Rc-Zz) (:text |:style)
                                  |j $ %{} :Expr (:at 1572937184297) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572937184627) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1572937200293) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937201061) (:by |B1y7Rc-Zz) (:text |:width)
                                          |j $ %{} :Leaf (:at 1572937207556) (:by |B1y7Rc-Zz) (:text |320)
                              |v $ %{} :Expr (:at 1584879780703) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1584879781618) (:by |B1y7Rc-Zz) (:text |:items)
                                  |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |[])
                                      |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:done)
                                          |r $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:display)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text "|\"Done")
                                      |r $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:pend)
                                          |r $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:display)
                                              |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |if)
                                                  |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |=)
                                                      |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |mode)
                                                      |r $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:pending)
                                                  |r $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text "|\"Do it now")
                                                  |v $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text "|\"Do it later")
                                      |v $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:touch)
                                          |r $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:display)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text "|\"Up")
                                      |x $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:copy)
                                          |r $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:display)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text "|\"Copy")
                                      |y $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:edit)
                                          |r $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:display)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text "|\"Edit")
                                      |yT $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:remove)
                                          |r $ %{} :Expr (:at 1584879782378) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text |:display)
                                              |j $ %{} :Leaf (:at 1584879782378) (:by |B1y7Rc-Zz) (:text "|\"Remove")
                          |u $ %{} :Expr (:at 1584880079008) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1584880079008) (:by |B1y7Rc-Zz) (:text |:menu?)
                              |j $ %{} :Leaf (:at 1584880079008) (:by |B1y7Rc-Zz) (:text |state)
                          |x $ %{} :Expr (:at 1572936997764) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572936999736) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1572937000020) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1584879316926) (:by |B1y7Rc-Zz) (:text |d!)
                              |r $ %{} :Expr (:at 1572937023863) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1584879318253) (:by |B1y7Rc-Zz) (:text |d!)
                                  |L $ %{} :Leaf (:at 1584879320051) (:by |B1y7Rc-Zz) (:text |cursor)
                                  |T $ %{} :Expr (:at 1572937022776) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1572937022776) (:by |B1y7Rc-Zz) (:text |assoc)
                                      |j $ %{} :Leaf (:at 1572937022776) (:by |B1y7Rc-Zz) (:text |state)
                                      |r $ %{} :Leaf (:at 1572937022776) (:by |B1y7Rc-Zz) (:text |:menu?)
                                      |v $ %{} :Leaf (:at 1572937022776) (:by |B1y7Rc-Zz) (:text |false)
                          |y $ %{} :Expr (:at 1572937028344) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572937028653) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1572937029098) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572937109370) (:by |B1y7Rc-Zz) (:text |item)
                                  |j $ %{} :Leaf (:at 1572937030327) (:by |B1y7Rc-Zz) (:text |d!)
                              |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |let)
                                  |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |new-state)
                                          |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |assoc)
                                              |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |state)
                                              |r $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:menu?)
                                              |v $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |false)
                                      |j $ %{} :Expr (:at 1572937110594) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937111258) (:by |B1y7Rc-Zz) (:text |result)
                                          |j $ %{} :Expr (:at 1572937111471) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572937112151) (:by |B1y7Rc-Zz) (:text |:value)
                                              |j $ %{} :Leaf (:at 1572937115372) (:by |B1y7Rc-Zz) (:text |item)
                                  |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629963681589) (:by |B1y7Rc-Zz) (:text |case-default)
                                      |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |result)
                                      |n $ %{} :Expr (:at 1629963671206) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629963671206) (:by |B1y7Rc-Zz) (:text |d!)
                                          |j $ %{} :Leaf (:at 1629963671206) (:by |B1y7Rc-Zz) (:text |cursor)
                                          |r $ %{} :Leaf (:at 1629963671206) (:by |B1y7Rc-Zz) (:text |new-state)
                                      |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:done)
                                          |j $ %{} :Expr (:at 1572970778617) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1572970779664) (:by |B1y7Rc-Zz) (:text |do)
                                              |T $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:task/finish-working)
                                                  |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:id)
                                                      |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |task)
                                              |j $ %{} :Expr (:at 1572970780475) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1584879325945) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |b $ %{} :Leaf (:at 1584879327201) (:by |B1y7Rc-Zz) (:text |cursor)
                                                  |j $ %{} :Leaf (:at 1572970783996) (:by |B1y7Rc-Zz) (:text |new-state)
                                      |v $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:edit)
                                          |r $ %{} :Expr (:at 1586593440713) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1586593441395) (:by |B1y7Rc-Zz) (:text |do)
                                              |L $ %{} :Expr (:at 1586593444868) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1586593445778) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |j $ %{} :Leaf (:at 1586593446882) (:by |B1y7Rc-Zz) (:text |cursor)
                                                  |r $ %{} :Leaf (:at 1586593449376) (:by |B1y7Rc-Zz) (:text |new-state)
                                              |T $ %{} :Expr (:at 1586593294582) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629965791228) (:by |B1y7Rc-Zz) (:text |.show)
                                                  |b $ %{} :Leaf (:at 1586593285868) (:by |B1y7Rc-Zz) (:text |update-plugin)
                                                  |j $ %{} :Leaf (:at 1586593296155) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |r $ %{} :Expr (:at 1586593296604) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1586593296872) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |j $ %{} :Expr (:at 1586593297169) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1586593311395) (:by |B1y7Rc-Zz) (:text |text)
                                                      |r $ %{} :Expr (:at 1586593329666) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1586593329666) (:by |B1y7Rc-Zz) (:text |d!)
                                                          |j $ %{} :Leaf (:at 1586593329666) (:by |B1y7Rc-Zz) (:text |:task/update-working)
                                                          |r $ %{} :Expr (:at 1586593329666) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1586593329666) (:by |B1y7Rc-Zz) (:text |{})
                                                              |j $ %{} :Expr (:at 1586593329666) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1586593329666) (:by |B1y7Rc-Zz) (:text |:id)
                                                                  |j $ %{} :Expr (:at 1586593329666) (:by |B1y7Rc-Zz)
                                                                    :data $ {}
                                                                      |T $ %{} :Leaf (:at 1586593329666) (:by |B1y7Rc-Zz) (:text |:id)
                                                                      |j $ %{} :Leaf (:at 1586593329666) (:by |B1y7Rc-Zz) (:text |task)
                                                              |r $ %{} :Expr (:at 1586593329666) (:by |B1y7Rc-Zz)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1586593329666) (:by |B1y7Rc-Zz) (:text |:text)
                                                                  |j $ %{} :Leaf (:at 1586593414634) (:by |B1y7Rc-Zz) (:text |text)
                                      |x $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:copy)
                                          |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |do)
                                              |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |copy!)
                                                  |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:text)
                                                      |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |task)
                                              |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1584879334750) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |b $ %{} :Leaf (:at 1584879336128) (:by |B1y7Rc-Zz) (:text |cursor)
                                                  |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |new-state)
                                      |y $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:remove)
                                          |r $ %{} :Expr (:at 1586593723435) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1586593724529) (:by |B1y7Rc-Zz) (:text |do)
                                              |L $ %{} :Expr (:at 1586593725322) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1586593726902) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |j $ %{} :Leaf (:at 1586593728867) (:by |B1y7Rc-Zz) (:text |cursor)
                                                  |r $ %{} :Leaf (:at 1586593730853) (:by |B1y7Rc-Zz) (:text |new-state)
                                              |T $ %{} :Expr (:at 1586593662655) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629966628768) (:by |B1y7Rc-Zz) (:text |.show)
                                                  |b $ %{} :Leaf (:at 1586593670382) (:by |B1y7Rc-Zz) (:text |delete-plugin)
                                                  |j $ %{} :Leaf (:at 1586593672421) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |r $ %{} :Expr (:at 1586593672790) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1586593673234) (:by |B1y7Rc-Zz) (:text |fn)
                                                      |j $ %{} :Expr (:at 1586593674520) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                      |r $ %{} :Expr (:at 1586593686696) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1586593686696) (:by |B1y7Rc-Zz) (:text |d!)
                                                          |j $ %{} :Leaf (:at 1586593686696) (:by |B1y7Rc-Zz) (:text |:task/remove-working)
                                                          |r $ %{} :Expr (:at 1586593686696) (:by |B1y7Rc-Zz)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1586593686696) (:by |B1y7Rc-Zz) (:text |:id)
                                                              |j $ %{} :Leaf (:at 1586593686696) (:by |B1y7Rc-Zz) (:text |task)
                                      |yT $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:pend)
                                          |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |do)
                                              |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:task/pend)
                                                  |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:id)
                                                      |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |task)
                                              |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1584879340689) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |b $ %{} :Leaf (:at 1584879342209) (:by |B1y7Rc-Zz) (:text |cursor)
                                                  |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |new-state)
                                      |yj $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:touch)
                                          |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |do)
                                              |j $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:task/touch-working)
                                                  |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |:id)
                                                      |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |task)
                                              |r $ %{} :Expr (:at 1572937035403) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1584879344138) (:by |B1y7Rc-Zz) (:text |d!)
                                                  |b $ %{} :Leaf (:at 1584879345211) (:by |B1y7Rc-Zz) (:text |cursor)
                                                  |j $ %{} :Leaf (:at 1572937035403) (:by |B1y7Rc-Zz) (:text |new-state)
                      |yn $ %{} :Expr (:at 1586593222075) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629965679833) (:by |B1y7Rc-Zz) (:text |.render)
                          |j $ %{} :Leaf (:at 1586593224210) (:by |B1y7Rc-Zz) (:text |update-plugin)
                      |yt $ %{} :Expr (:at 1586593222075) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629965677036) (:by |B1y7Rc-Zz) (:text |.render)
                          |j $ %{} :Leaf (:at 1586593652499) (:by |B1y7Rc-Zz) (:text |delete-plugin)
        |comp-title $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1537290132323) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1537290134044) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1537290132323) (:by |root) (:text |comp-title)
              |r $ %{} :Expr (:at 1537290132323) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1537290136076) (:by |root) (:text |title)
                  |j $ %{} :Leaf (:at 1537981388110) (:by |root) (:text |child)
                  |l $ %{} :Leaf (:at 1651230147069) (:by |B1y7Rc-Zz) (:text |?)
                  |n $ %{} :Leaf (:at 1651230144789) (:by |B1y7Rc-Zz) (:text |on-click)
              |v $ %{} :Expr (:at 1537290136527) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1537290139621) (:by |root) (:text |div)
                  |j $ %{} :Expr (:at 1537290139979) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537290140374) (:by |root) (:text |{})
                      |b $ %{} :Expr (:at 1657790637853) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790640831) (:by |B1y7Rc-Zz) (:text |:class-name)
                          |b $ %{} :Leaf (:at 1657790643705) (:by |B1y7Rc-Zz) (:text |css-title)
                      |j $ %{} :Expr (:at 1537290151300) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537290153373) (:by |root) (:text |:style)
                          |n $ %{} :Expr (:at 1657790634077) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |if)
                              |b $ %{} :Expr (:at 1657790634077) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |fn?)
                                  |b $ %{} :Leaf (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |on-click)
                              |h $ %{} :Expr (:at 1657790634077) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |{})
                                  |b $ %{} :Expr (:at 1657790634077) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |:cursor)
                                      |b $ %{} :Leaf (:at 1657790634077) (:by |B1y7Rc-Zz) (:text |:pointer)
                      |n $ %{} :Expr (:at 1651230124917) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1651230127021) (:by |B1y7Rc-Zz) (:text |:on-click)
                          |b $ %{} :Expr (:at 1651230127344) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1651230127592) (:by |B1y7Rc-Zz) (:text |fn)
                              |b $ %{} :Expr (:at 1651230129134) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1651230129718) (:by |B1y7Rc-Zz) (:text |e)
                                  |b $ %{} :Leaf (:at 1651230130304) (:by |B1y7Rc-Zz) (:text |d!)
                              |h $ %{} :Expr (:at 1651230131019) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1651230132633) (:by |B1y7Rc-Zz) (:text |if)
                                  |b $ %{} :Expr (:at 1651230133059) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1651230134612) (:by |B1y7Rc-Zz) (:text |fn?)
                                      |b $ %{} :Leaf (:at 1651230136309) (:by |B1y7Rc-Zz) (:text |on-click)
                                  |h $ %{} :Expr (:at 1651230137037) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1651230138172) (:by |B1y7Rc-Zz) (:text |on-click)
                                      |X $ %{} :Leaf (:at 1651230140441) (:by |B1y7Rc-Zz) (:text |e)
                                      |b $ %{} :Leaf (:at 1651230139313) (:by |B1y7Rc-Zz) (:text |d!)
                  |r $ %{} :Expr (:at 1537290141100) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537290141459) (:by |root) (:text |<>)
                      |j $ %{} :Leaf (:at 1537290142994) (:by |root) (:text |title)
                  |t $ %{} :Expr (:at 1537981379998) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537981380564) (:by |root) (:text |=<)
                      |j $ %{} :Leaf (:at 1537981384623) (:by |root) (:text |16)
                      |r $ %{} :Leaf (:at 1537981382036) (:by |root) (:text |nil)
                  |v $ %{} :Leaf (:at 1537981391108) (:by |root) (:text |child)
        |css-task-base $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1657790710518) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1657790711720) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1657790710518) (:by |B1y7Rc-Zz) (:text |css-task-base)
              |h $ %{} :Expr (:at 1657790710518) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1657790713481) (:by |B1y7Rc-Zz) (:text |{})
                  |b $ %{} :Expr (:at 1657790714910) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1657790715988) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:border-bottom)
                              |b $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |str)
                                  |b $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text "|\"1px solid ")
                                  |h $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |hsl)
                                      |b $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |0)
                                      |h $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |0)
                                      |l $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |90)
                          |h $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:line-height)
                              |b $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text "|\"24px")
                          |l $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:padding)
                              |b $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text "|\"8px 8px")
                          |o $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:overflow)
                              |b $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:auto)
                          |q $ %{} :Expr (:at 1657790716415) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:user-select)
                              |b $ %{} :Leaf (:at 1657790716415) (:by |B1y7Rc-Zz) (:text |:none)
                          |s $ %{} :Expr (:at 1658935256989) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935262768) (:by |B1y7Rc-Zz) (:text |:transition-duration)
                              |b $ %{} :Leaf (:at 1658935269201) (:by |B1y7Rc-Zz) (:text "|\"200ms")
                  |h $ %{} :Expr (:at 1658935215988) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1658935235279) (:by |B1y7Rc-Zz) (:text "|\"$0:hover")
                      |b $ %{} :Expr (:at 1658935218267) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1658935218600) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1658935218968) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1658935224023) (:by |B1y7Rc-Zz) (:text |:background-color)
                              |b $ %{} :Expr (:at 1658935224298) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1658935225091) (:by |B1y7Rc-Zz) (:text |hsl)
                                  |b $ %{} :Leaf (:at 1658935225434) (:by |B1y7Rc-Zz) (:text |0)
                                  |h $ %{} :Leaf (:at 1658935225748) (:by |B1y7Rc-Zz) (:text |0)
                                  |l $ %{} :Leaf (:at 1658935240697) (:by |B1y7Rc-Zz) (:text |80)
                                  |o $ %{} :Leaf (:at 1658935244924) (:by |B1y7Rc-Zz) (:text |0.1)
        |css-title $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1657790644057) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1657790646652) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1657790644057) (:by |B1y7Rc-Zz) (:text |css-title)
              |h $ %{} :Expr (:at 1657790644057) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1657790649409) (:by |B1y7Rc-Zz) (:text |{})
                  |b $ %{} :Expr (:at 1657790649709) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1657790651502) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |merge)
                          |b $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |ui/row-middle)
                          |h $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |{})
                              |b $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:margin)
                                  |b $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text "|\"8px 0")
                              |h $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:font-family)
                                  |b $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |ui/font-fancy)
                              |l $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:color)
                                  |b $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |hsl)
                                      |b $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |0)
                                      |h $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |0)
                                      |l $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |50)
                              |o $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:font-size)
                                  |b $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |16)
                              |q $ %{} :Expr (:at 1657790651984) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |:font-weight)
                                  |b $ %{} :Leaf (:at 1657790651984) (:by |B1y7Rc-Zz) (:text |300)
        |effect-focus $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1572797896281) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1572797899532) (:by |B1y7Rc-Zz) (:text |defeffect)
              |j $ %{} :Leaf (:at 1572797896281) (:by |B1y7Rc-Zz) (:text |effect-focus)
              |r $ %{} :Expr (:at 1572797896281) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1572797908761) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1572797910476) (:by |B1y7Rc-Zz) (:text |action)
                  |j $ %{} :Leaf (:at 1572797911144) (:by |B1y7Rc-Zz) (:text |el)
                  |r $ %{} :Leaf (:at 1572797912603) (:by |B1y7Rc-Zz) (:text |*local)
              |x $ %{} :Expr (:at 1572797913273) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1572797914545) (:by |B1y7Rc-Zz) (:text |case)
                  |j $ %{} :Leaf (:at 1572797915831) (:by |B1y7Rc-Zz) (:text |action)
                  |r $ %{} :Expr (:at 1572797916787) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1572797918020) (:by |B1y7Rc-Zz) (:text |:mount)
                      |j $ %{} :Expr (:at 1572797921110) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1572797927031) (:by |B1y7Rc-Zz) (:text |->)
                          |T $ %{} :Leaf (:at 1572797928427) (:by |B1y7Rc-Zz) (:text |el)
                          |j $ %{} :Expr (:at 1572797929111) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572797932441) (:by |B1y7Rc-Zz) (:text |.querySelector)
                              |j $ %{} :Leaf (:at 1572797933645) (:by |B1y7Rc-Zz) (:text "|\"input")
                          |r $ %{} :Expr (:at 1572797935596) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1572797958874) (:by |B1y7Rc-Zz) (:text |.focus)
                  |v $ %{} :Expr (:at 1572797918647) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1572797919532) (:by |B1y7Rc-Zz) (:text |do)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1533618609466) (:by |root)
          :data $ {}
            |T $ %{} :Leaf (:at 1533618609466) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1533618609466) (:by |root) (:text |app.comp.overview)
            |r $ %{} :Expr (:at 1500541010211) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1629963477531) (:by |B1y7Rc-Zz) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |hsl)
                |n $ %{} :Expr (:at 1657790655787) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790659447) (:by |B1y7Rc-Zz) (:text |respo-ui.css)
                    |b $ %{} :Leaf (:at 1657790661695) (:by |B1y7Rc-Zz) (:text |:as)
                    |h $ %{} :Leaf (:at 1657790662345) (:by |B1y7Rc-Zz) (:text |css)
                |p $ %{} :Expr (:at 1657790663044) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657790664882) (:by |B1y7Rc-Zz) (:text |respo.css)
                    |b $ %{} :Leaf (:at 1657790666478) (:by |B1y7Rc-Zz) (:text |:refer)
                    |h $ %{} :Expr (:at 1657790666691) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1657790668561) (:by |B1y7Rc-Zz) (:text |defstyle)
                |r $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |schema)
                |v $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1516547419785) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui)
                |y $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1542907287136) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
                        |q $ %{} :Leaf (:at 1533695891715) (:by |root) (:text |list->)
                        |qT $ %{} :Leaf (:at 1584879109458) (:by |B1y7Rc-Zz) (:text |>>)
                        |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                        |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |span)
                        |x $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                        |y $ %{} :Leaf (:at 1529343437918) (:by |root) (:text |button)
                        |yT $ %{} :Leaf (:at 1536900646747) (:by |B1y7Rc-Zz) (:text |textarea)
                        |yb $ %{} :Leaf (:at 1542907469010) (:by |B1y7Rc-Zz) (:text |input)
                        |yj $ %{} :Leaf (:at 1537204416734) (:by |root) (:text |a)
                        |yr $ %{} :Leaf (:at 1572797906528) (:by |B1y7Rc-Zz) (:text |defeffect)
                |yT $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |respo.comp.space)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                |yj $ %{} :Expr (:at 1527788936196) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1527788937835) (:by |root) (:text |app.config)
                    |r $ %{} :Leaf (:at 1527788938747) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1527788939786) (:by |root) (:text |config)
                |yn $ %{} :Expr (:at 1533696370133) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1533696372081) (:by |root) (:text |app.style)
                    |r $ %{} :Leaf (:at 1533696373313) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1533696375162) (:by |root) (:text |style)
                |yr $ %{} :Expr (:at 1533695299161) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1572796411802) (:by |B1y7Rc-Zz) (:text |respo-alerts.core)
                    |r $ %{} :Leaf (:at 1533695306639) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1533695306810) (:by |root)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1533695309728) (:by |root) (:text |comp-prompt)
                        |r $ %{} :Leaf (:at 1572796415854) (:by |B1y7Rc-Zz) (:text |comp-modal)
                        |v $ %{} :Leaf (:at 1572937072293) (:by |B1y7Rc-Zz) (:text |comp-modal-menu)
                        |x $ %{} :Leaf (:at 1586593020688) (:by |B1y7Rc-Zz) (:text |use-prompt)
                        |y $ %{} :Leaf (:at 1586593028979) (:by |B1y7Rc-Zz) (:text |use-confirm)
                |yx $ %{} :Expr (:at 1536652600377) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1557036806998) (:by |B1y7Rc-Zz) (:text |feather.core)
                    |r $ %{} :Leaf (:at 1536652606819) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1536652606993) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1557036848550) (:by |B1y7Rc-Zz) (:text |comp-i)
                        |r $ %{} :Leaf (:at 1629963947024) (:by |B1y7Rc-Zz) (:text |comp-icon)
                |yyT $ %{} :Expr (:at 1536732272419) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1536732273888) (:by |B1y7Rc-Zz) (:text "|\"dayjs")
                    |r $ %{} :Leaf (:at 1629963487991) (:by |B1y7Rc-Zz) (:text |:default)
                    |v $ %{} :Leaf (:at 1536732276735) (:by |B1y7Rc-Zz) (:text |dayjs)
                |yyj $ %{} :Expr (:at 1545326990268) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1545326991751) (:by |B1y7Rc-Zz) (:text "|\"copy-text-to-clipboard")
                    |r $ %{} :Leaf (:at 1629963483496) (:by |B1y7Rc-Zz) (:text |:default)
                    |v $ %{} :Leaf (:at 1545326998649) (:by |B1y7Rc-Zz) (:text |copy!)
                |z $ %{} :Expr (:at 1697653428063) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1697653431647) (:by |B1y7Rc-Zz) (:text |respo.comp.global-keydown)
                    |b $ %{} :Leaf (:at 1697653432845) (:by |B1y7Rc-Zz) (:text |:refer)
                    |h $ %{} :Expr (:at 1697653433036) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1697653435768) (:by |B1y7Rc-Zz) (:text |comp-global-keydown)
    |app.comp.profile $ %{} :FileEntry
      :defs $ {}
        |comp-profile $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541010211) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |comp-profile)
              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |user)
                  |j $ %{} :Leaf (:at 1524070827396) (:by |root) (:text |members)
              |v $ %{} :Expr (:at 1573057099639) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1573057100429) (:by |B1y7Rc-Zz) (:text |div)
                  |H $ %{} :Expr (:at 1657792286442) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1657792287064) (:by |B1y7Rc-Zz) (:text |{})
                      |T $ %{} :Expr (:at 1657791135645) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657791138729) (:by |B1y7Rc-Zz) (:text |:class-name)
                          |b $ %{} :Leaf (:at 1657791140148) (:by |B1y7Rc-Zz) (:text |css/flex)
                      |b $ %{} :Expr (:at 1657792289550) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |:style)
                          |b $ %{} :Expr (:at 1657792289550) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |{})
                              |b $ %{} :Expr (:at 1657792289550) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |:padding)
                                  |b $ %{} :Leaf (:at 1657792289550) (:by |B1y7Rc-Zz) (:text |16)
                  |T $ %{} :Expr (:at 1500541010211) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                              |j $ %{} :Expr (:at 1573057112159) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1573057114462) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1573057114806) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1573057118311) (:by |B1y7Rc-Zz) (:text |:max-width)
                                      |j $ %{} :Leaf (:at 1573057120226) (:by |B1y7Rc-Zz) (:text |800)
                                  |r $ %{} :Expr (:at 1573057121674) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1573057126061) (:by |B1y7Rc-Zz) (:text |:margin)
                                      |j $ %{} :Leaf (:at 1573057127742) (:by |B1y7Rc-Zz) (:text |:auto)
                      |r $ %{} :Expr (:at 1524070753023) (:by |root)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1524070753742) (:by |root) (:text |div)
                          |L $ %{} :Expr (:at 1524070753977) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1524070754337) (:by |root) (:text |{})
                              |b $ %{} :Expr (:at 1657795263113) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657795265697) (:by |B1y7Rc-Zz) (:text |:class-name)
                                  |b $ %{} :Leaf (:at 1657795268530) (:by |B1y7Rc-Zz) (:text |css/font-fancy)
                              |j $ %{} :Expr (:at 1524070764197) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1524070764960) (:by |root) (:text |:style)
                                  |j $ %{} :Expr (:at 1524070765167) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1524070765499) (:by |root) (:text |{})
                                      |r $ %{} :Expr (:at 1524070772863) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1524070774437) (:by |root) (:text |:font-size)
                                          |j $ %{} :Leaf (:at 1524070786249) (:by |root) (:text |32)
                                      |v $ %{} :Expr (:at 1524070778614) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1524070781489) (:by |root) (:text |:font-weight)
                                          |j $ %{} :Leaf (:at 1524070782585) (:by |root) (:text |100)
                          |T $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |str)
                                  |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text "||Hello! ")
                                  |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:name)
                                      |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |user)
                      |t $ %{} :Expr (:at 1524070801446) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1524070803450) (:by |root) (:text |=<)
                          |j $ %{} :Leaf (:at 1524070804372) (:by |root) (:text |nil)
                          |r $ %{} :Leaf (:at 1524070805591) (:by |root) (:text |16)
                      |u $ %{} :Expr (:at 1524070806586) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1524070807601) (:by |root) (:text |div)
                          |j $ %{} :Expr (:at 1524070807801) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1524070808172) (:by |root) (:text |{})
                              |j $ %{} :Expr (:at 1524070882494) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657791039862) (:by |B1y7Rc-Zz) (:text |:class-name)
                                  |j $ %{} :Leaf (:at 1657791041484) (:by |B1y7Rc-Zz) (:text |css/row)
                          |r $ %{} :Expr (:at 1524070808914) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1524070810352) (:by |root) (:text |<>)
                              |j $ %{} :Leaf (:at 1524070906296) (:by |root) (:text "|\"Members:")
                          |t $ %{} :Expr (:at 1524070907095) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1524070907693) (:by |root) (:text |=<)
                              |j $ %{} :Leaf (:at 1524071002316) (:by |root) (:text |8)
                              |r $ %{} :Leaf (:at 1524070908955) (:by |root) (:text |nil)
                          |v $ %{} :Expr (:at 1524070813822) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629963869789) (:by |B1y7Rc-Zz) (:text |list->)
                              |j $ %{} :Expr (:at 1524070815884) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1524070816388) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1524070882494) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657791044681) (:by |B1y7Rc-Zz) (:text |:class-name)
                                      |j $ %{} :Leaf (:at 1657791046248) (:by |B1y7Rc-Zz) (:text |css/row)
                              |r $ %{} :Expr (:at 1524070817648) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629963870999) (:by |B1y7Rc-Zz) (:text |->)
                                  |j $ %{} :Leaf (:at 1524070823331) (:by |root) (:text |members)
                                  |n $ %{} :Expr (:at 1629963872061) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629963875349) (:by |B1y7Rc-Zz) (:text |.to-list)
                                  |r $ %{} :Expr (:at 1524070849620) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629963879143) (:by |B1y7Rc-Zz) (:text |.map-pair)
                                      |j $ %{} :Expr (:at 1524070854323) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1524070854836) (:by |root) (:text |fn)
                                          |j $ %{} :Expr (:at 1524070855268) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1524070857242) (:by |root) (:text |k)
                                              |j $ %{} :Leaf (:at 1524070860935) (:by |root) (:text |username)
                                          |r $ %{} :Expr (:at 1524070862172) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1524070862624) (:by |root) (:text |[])
                                              |j $ %{} :Leaf (:at 1524070863576) (:by |root) (:text |k)
                                              |r $ %{} :Expr (:at 1524070863870) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1524070935603) (:by |root) (:text |div)
                                                  |b $ %{} :Expr (:at 1524070935915) (:by |root)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1524070936321) (:by |root) (:text |{})
                                                      |j $ %{} :Expr (:at 1524070941378) (:by |root)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1657791065847) (:by |B1y7Rc-Zz) (:text |:class-name)
                                                          |b $ %{} :Leaf (:at 1657791073112) (:by |B1y7Rc-Zz) (:text |css-member-label)
                                                  |j $ %{} :Expr (:at 1524070937486) (:by |root)
                                                    :data $ {}
                                                      |D $ %{} :Leaf (:at 1524070939626) (:by |root) (:text |<>)
                                                      |T $ %{} :Leaf (:at 1524070866665) (:by |root) (:text |username)
                      |v $ %{} :Expr (:at 1500541010211) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                          |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |nil)
                          |v $ %{} :Leaf (:at 1524070799028) (:by |root) (:text |48)
                      |x $ %{} :Expr (:at 1524070749088) (:by |root)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1524070749878) (:by |root) (:text |div)
                          |L $ %{} :Expr (:at 1524070750119) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1524070750478) (:by |root) (:text |{})
                          |T $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1529343433304) (:by |root) (:text |button)
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657791001104) (:by |B1y7Rc-Zz) (:text |:class-name)
                                      |b $ %{} :Leaf (:at 1657791002908) (:by |B1y7Rc-Zz) (:text |css/button)
                                  |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1514302350497) (:by |root) (:text |:on-click)
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1521951456454) (:by |root) (:text |fn)
                                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |e)
                                              |j $ %{} :Leaf (:at 1536860722489) (:by |root) (:text |d!)
                                          |v $ %{} :Expr (:at 1536860725934) (:by |root)
                                            :data $ {}
                                              |j $ %{} :Leaf (:at 1643082863562) (:by |B1y7Rc-Zz) (:text |js/location.replace)
                                              |r $ %{} :Expr (:at 1536860756712) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1536860757171) (:by |root) (:text |str)
                                                  |j $ %{} :Leaf (:at 1536860763285) (:by |root) (:text |js/location.origin)
                                                  |r $ %{} :Leaf (:at 1536860769456) (:by |root) (:text "|\"?time=")
                                                  |v $ %{} :Expr (:at 1536860770275) (:by |root)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1536860771120) (:by |root) (:text |.now)
                                                      |j $ %{} :Leaf (:at 1536860774958) (:by |root) (:text |js/Date)
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                                  |r $ %{} :Leaf (:at 1536860717367) (:by |root) (:text "|\"Refresh")
                          |b $ %{} :Expr (:at 1536860703841) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536860705111) (:by |root) (:text |=<)
                              |j $ %{} :Leaf (:at 1536860705914) (:by |root) (:text |16)
                              |r $ %{} :Leaf (:at 1536860706447) (:by |root) (:text |nil)
                          |j $ %{} :Expr (:at 1500541010211) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1529343433304) (:by |root) (:text |button)
                              |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |{})
                                  |b $ %{} :Expr (:at 1657791022865) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657791025000) (:by |B1y7Rc-Zz) (:text |:class-name)
                                      |b $ %{} :Leaf (:at 1657791028155) (:by |B1y7Rc-Zz) (:text |css/button)
                                  |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:style)
                                      |b $ %{} :Expr (:at 1529343455186) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1529343455629) (:by |root) (:text |{})
                                          |j $ %{} :Expr (:at 1529343457115) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1529343457898) (:by |root) (:text |:color)
                                              |j $ %{} :Leaf (:at 1529343458855) (:by |root) (:text |:red)
                                          |r $ %{} :Expr (:at 1529343459158) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1529343463728) (:by |root) (:text |:border-color)
                                              |j $ %{} :Leaf (:at 1529343464475) (:by |root) (:text |:red)
                                  |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1514302350497) (:by |root) (:text |:on-click)
                                      |j $ %{} :Expr (:at 1500541010211) (:by nil)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1521951456454) (:by |root) (:text |fn)
                                          |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |e)
                                              |j $ %{} :Leaf (:at 1643082910642) (:by |B1y7Rc-Zz) (:text |d!)
                                          |v $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1643082912419) (:by |B1y7Rc-Zz) (:text |d!)
                                              |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:user/log-out)
                                              |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |nil)
                                          |x $ %{} :Expr (:at 1500541010211) (:by nil)
                                            :data $ {}
                                              |j $ %{} :Leaf (:at 1643082916507) (:by |B1y7Rc-Zz) (:text |js/localStorage.removeItem)
                                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:storage-key)
                                                  |j $ %{} :Leaf (:at 1527788933957) (:by |root) (:text |config/site)
                              |r $ %{} :Expr (:at 1500541010211) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                                  |r $ %{} :Leaf (:at 1536860719375) (:by |root) (:text "|\"Log out")
        |css-member-label $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1657791073845) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1657791075479) (:by |B1y7Rc-Zz) (:text |defstyle)
              |b $ %{} :Leaf (:at 1657791073845) (:by |B1y7Rc-Zz) (:text |css-member-label)
              |h $ %{} :Expr (:at 1657791073845) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1657791076676) (:by |B1y7Rc-Zz) (:text |{})
                  |b $ %{} :Expr (:at 1657791076936) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1657791078555) (:by |B1y7Rc-Zz) (:text "|\"$0")
                      |b $ %{} :Expr (:at 1657791079259) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1657791079259) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:padding)
                              |b $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"0 8px")
                          |h $ %{} :Expr (:at 1657791079259) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:border)
                              |b $ %{} :Expr (:at 1657791079259) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |str)
                                  |b $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"1px solid ")
                                  |h $ %{} :Expr (:at 1657791079259) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |hsl)
                                      |b $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |0)
                                      |h $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |0)
                                      |l $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |80)
                          |l $ %{} :Expr (:at 1657791079259) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:border-radius)
                              |b $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"16px")
                          |o $ %{} :Expr (:at 1657791079259) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text |:margin)
                              |b $ %{} :Leaf (:at 1657791079259) (:by |B1y7Rc-Zz) (:text "|\"0 4px")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541010211) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.comp.profile)
            |v $ %{} :Expr (:at 1500541010211) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1629963888001) (:by |B1y7Rc-Zz) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |hsl)
                |n $ %{} :Expr (:at 1657791006084) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657791011085) (:by |B1y7Rc-Zz) (:text |respo-ui.css)
                    |b $ %{} :Leaf (:at 1657791011680) (:by |B1y7Rc-Zz) (:text |:as)
                    |h $ %{} :Leaf (:at 1657791012512) (:by |B1y7Rc-Zz) (:text |css)
                |r $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |schema)
                |v $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1516547419785) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |ui)
                |y $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1542907291901) (:by |B1y7Rc-Zz) (:text |respo.core)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |defcomp)
                        |n $ %{} :Leaf (:at 1524070875244) (:by |root) (:text |list->)
                        |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |<>)
                        |v $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |span)
                        |x $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |div)
                        |y $ %{} :Leaf (:at 1529343437918) (:by |root) (:text |button)
                |yD $ %{} :Expr (:at 1657791086879) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1657791089372) (:by |B1y7Rc-Zz) (:text |respo.css)
                    |b $ %{} :Leaf (:at 1657791090181) (:by |B1y7Rc-Zz) (:text |:refer)
                    |h $ %{} :Expr (:at 1657791090469) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1657791091849) (:by |B1y7Rc-Zz) (:text |defstyle)
                |yT $ %{} :Expr (:at 1500541010211) (:by nil)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |respo.comp.space)
                    |r $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541010211) (:by nil)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1500541010211) (:by |root) (:text |=<)
                |yj $ %{} :Expr (:at 1527788936196) (:by |root)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1527788937835) (:by |root) (:text |app.config)
                    |r $ %{} :Leaf (:at 1527788938747) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1527788939786) (:by |root) (:text |config)
    |app.config $ %{} :FileEntry
      :defs $ {}
        |dev? $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962915592) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |def)
              |j $ %{} :Leaf (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |dev?)
              |r $ %{} :Expr (:at 1629962915592) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |=)
                  |j $ %{} :Leaf (:at 1629962915592) (:by |B1y7Rc-Zz) (:text "|\"dev")
                  |r $ %{} :Expr (:at 1629962915592) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962915592) (:by |B1y7Rc-Zz) (:text |get-env)
                      |j $ %{} :Leaf (:at 1629962915592) (:by |B1y7Rc-Zz) (:text "|\"mode")
                      |n $ %{} :Leaf (:at 1657790402406) (:by |B1y7Rc-Zz) (:text "|\"release")
        |site $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |site)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:port)
                      |j $ %{} :Leaf (:at 1531716258172) (:by |root) (:text |11009)
                  |t $ %{} :Expr (:at 1527867502467) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1527867504737) (:by |root) (:text |:title)
                      |j $ %{} :Leaf (:at 1531716180211) (:by |root) (:text "|\"Timegrass")
                  |u $ %{} :Expr (:at 1527867511986) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1527867512819) (:by |root) (:text |:icon)
                      |j $ %{} :Leaf (:at 1539635717581) (:by |root) (:text "|\"http://cdn.tiye.me/logo/timegrass.png")
                  |v $ %{} :Expr (:at 1527615278481) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1527615280984) (:by |root) (:text |:dev-ui)
                      |j $ %{} :Leaf (:at 1527615358738) (:by |root) (:text "|\"http://localhost:8100/main.css")
                  |x $ %{} :Expr (:at 1527615281625) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1527615283846) (:by |root) (:text |:release-ui)
                      |j $ %{} :Leaf (:at 1527615339502) (:by |root) (:text "|\"http://cdn.tiye.me/favored-fonts/main.css")
                  |x5 $ %{} :Expr (:at 1528009883995) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1528009886059) (:by |root) (:text |:cdn-url)
                      |j $ %{} :Leaf (:at 1531716193037) (:by |root) (:text "|\"http://cdn.tiye.me/timegrass/")
                  |yr $ %{} :Expr (:at 1536733223200) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1536733224943) (:by |B1y7Rc-Zz) (:text |:theme)
                      |j $ %{} :Leaf (:at 1536733304684) (:by |B1y7Rc-Zz) (:text "|\"#51C766")
                  |yt $ %{} :Expr (:at 1544894540548) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544894540548) (:by |B1y7Rc-Zz) (:text |:storage-key)
                      |j $ %{} :Leaf (:at 1544894540548) (:by |B1y7Rc-Zz) (:text "|\"timegrass")
                  |yv $ %{} :Expr (:at 1544894534252) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544894534252) (:by |B1y7Rc-Zz) (:text |:storage-file)
                      |j $ %{} :Leaf (:at 1629966656084) (:by |B1y7Rc-Zz) (:text "|\"storage.cirru")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1527788708227) (:by |root)
          :data $ {}
            |T $ %{} :Leaf (:at 1527788708227) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1527788708227) (:by |root) (:text |app.config)
    |app.schema $ %{} :FileEntry
      :defs $ {}
        |complain $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533577158626) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1533577160330) (:by |B1y7Rc-Zz) (:text |def)
              |j $ %{} :Leaf (:at 1533577158626) (:by |B1y7Rc-Zz) (:text |complain)
              |r $ %{} :Expr (:at 1533577158626) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533577161909) (:by |B1y7Rc-Zz) (:text |{})
                  |j $ %{} :Expr (:at 1533577162195) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533577162877) (:by |B1y7Rc-Zz) (:text |:id)
                      |j $ %{} :Leaf (:at 1533577163514) (:by |B1y7Rc-Zz) (:text |nil)
                  |r $ %{} :Expr (:at 1533577164045) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533577165014) (:by |B1y7Rc-Zz) (:text |:text)
                      |j $ %{} :Leaf (:at 1533577165516) (:by |B1y7Rc-Zz) (:text "|\"")
                  |v $ %{} :Expr (:at 1533577167515) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533577171755) (:by |B1y7Rc-Zz) (:text |:time)
                      |j $ %{} :Leaf (:at 1533577173198) (:by |B1y7Rc-Zz) (:text |nil)
        |database $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |database)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:sessions)
                      |j $ %{} :Expr (:at 1556559339169) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1556559339729) (:by |B1y7Rc-Zz) (:text |do)
                          |L $ %{} :Leaf (:at 1556559341509) (:by |B1y7Rc-Zz) (:text |session)
                          |T $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:users)
                      |j $ %{} :Expr (:at 1556559336109) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1556559336660) (:by |B1y7Rc-Zz) (:text |do)
                          |L $ %{} :Leaf (:at 1556559337220) (:by |B1y7Rc-Zz) (:text |user)
                          |T $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |v $ %{} :Expr (:at 1533577343669) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533577344937) (:by |B1y7Rc-Zz) (:text |:today)
                      |j $ %{} :Leaf (:at 1533577359121) (:by |B1y7Rc-Zz) (:text "|\"2018-08-07")
        |note $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1556559675924) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1556559676670) (:by |B1y7Rc-Zz) (:text |def)
              |j $ %{} :Leaf (:at 1556559675924) (:by |B1y7Rc-Zz) (:text |note)
              |r $ %{} :Expr (:at 1556559675924) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1556559677659) (:by |B1y7Rc-Zz) (:text |{})
                  |j $ %{} :Expr (:at 1556559678017) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556559678489) (:by |B1y7Rc-Zz) (:text |:id)
                      |j $ %{} :Leaf (:at 1556559679142) (:by |B1y7Rc-Zz) (:text |nil)
                  |r $ %{} :Expr (:at 1556559682476) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556559721564) (:by |B1y7Rc-Zz) (:text |:time)
                      |j $ %{} :Leaf (:at 1556559687115) (:by |B1y7Rc-Zz) (:text |nil)
                  |t $ %{} :Expr (:at 1556559721963) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556559727507) (:by |B1y7Rc-Zz) (:text |:updated-time)
                      |j $ %{} :Leaf (:at 1556559728073) (:by |B1y7Rc-Zz) (:text |nil)
                  |v $ %{} :Expr (:at 1556559687583) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556559689545) (:by |B1y7Rc-Zz) (:text |:text)
                      |j $ %{} :Leaf (:at 1556559691646) (:by |B1y7Rc-Zz) (:text |nil)
        |notification $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |notification)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:id)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:kind)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |v $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:text)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
        |router $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |router)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:name)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:title)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |v $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:data)
                      |j $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |x $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:router)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
        |session $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:user-id)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:id)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |v $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:nickname)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |x $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:router)
                      |j $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                          |j $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:name)
                              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:home)
                          |r $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:data)
                              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                          |v $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:router)
                              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |y $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1529230759501) (:by |root) (:text |:messages)
                      |j $ %{} :Expr (:at 1529230760396) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1529230760716) (:by |root) (:text |{})
        |task $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533577053360) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1533577055487) (:by |B1y7Rc-Zz) (:text |def)
              |j $ %{} :Leaf (:at 1533577053360) (:by |B1y7Rc-Zz) (:text |task)
              |r $ %{} :Expr (:at 1533577053360) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533577056600) (:by |B1y7Rc-Zz) (:text |{})
                  |j $ %{} :Expr (:at 1533577056868) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533577057395) (:by |B1y7Rc-Zz) (:text |:id)
                      |j $ %{} :Leaf (:at 1533577058794) (:by |B1y7Rc-Zz) (:text |nil)
                  |r $ %{} :Expr (:at 1533577059313) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533577060256) (:by |B1y7Rc-Zz) (:text |:text)
                      |j $ %{} :Leaf (:at 1533577072317) (:by |B1y7Rc-Zz) (:text "|\"")
                  |v $ %{} :Expr (:at 1533577062031) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533695652376) (:by |root) (:text |:detail)
                      |j $ %{} :Leaf (:at 1533577069539) (:by |B1y7Rc-Zz) (:text "|\"")
                  |w $ %{} :Expr (:at 1537291087208) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537291089250) (:by |root) (:text |:pending?)
                      |j $ %{} :Leaf (:at 1537291090024) (:by |root) (:text |false)
                  |x $ %{} :Expr (:at 1533577078768) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533577083001) (:by |B1y7Rc-Zz) (:text |:created-time)
                      |j $ %{} :Leaf (:at 1533577085298) (:by |B1y7Rc-Zz) (:text |nil)
                  |xT $ %{} :Expr (:at 1537289231306) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537289233957) (:by |root) (:text |:touched-time)
                      |j $ %{} :Leaf (:at 1537289234605) (:by |root) (:text |nil)
                  |y $ %{} :Expr (:at 1533577085848) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1536731951502) (:by |B1y7Rc-Zz) (:text |:finished-time)
                      |j $ %{} :Leaf (:at 1533577093437) (:by |B1y7Rc-Zz) (:text |nil)
                  |yT $ %{} :Expr (:at 1543464503264) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1543464506023) (:by |root) (:text |:archived-time)
                      |j $ %{} :Leaf (:at 1543464507072) (:by |root) (:text |nil)
        |user $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |user)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:name)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:id)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |v $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:nickname)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |x $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:avatar)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |y $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:password)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
                  |yT $ %{} :Expr (:at 1533576960965) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533576964668) (:by |B1y7Rc-Zz) (:text |:tasks)
                      |j $ %{} :Expr (:at 1533576965052) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533576965357) (:by |B1y7Rc-Zz) (:text |{})
                          |b $ %{} :Expr (:at 1533576972099) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533576973496) (:by |B1y7Rc-Zz) (:text |:working)
                              |j $ %{} :Expr (:at 1556559670144) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1556559671265) (:by |B1y7Rc-Zz) (:text |do)
                                  |L $ %{} :Leaf (:at 1556559672202) (:by |B1y7Rc-Zz) (:text |task)
                                  |T $ %{} :Expr (:at 1533576974189) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1533577704496) (:by |B1y7Rc-Zz) (:text |{})
                          |j $ %{} :Expr (:at 1533576969193) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533576970382) (:by |B1y7Rc-Zz) (:text |:pending)
                              |j $ %{} :Expr (:at 1533576970775) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533577703499) (:by |B1y7Rc-Zz) (:text |{})
                          |v $ %{} :Expr (:at 1533576976151) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533576987729) (:by |B1y7Rc-Zz) (:text |:finished)
                              |j $ %{} :Expr (:at 1533576978294) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533577702227) (:by |B1y7Rc-Zz) (:text |{})
                  |yj $ %{} :Expr (:at 1533576989687) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556559354780) (:by |B1y7Rc-Zz) (:text |:notes)
                      |j $ %{} :Expr (:at 1556559659965) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1556559660535) (:by |B1y7Rc-Zz) (:text |do)
                          |L $ %{} :Leaf (:at 1556559674861) (:by |B1y7Rc-Zz) (:text |note)
                          |T $ %{} :Expr (:at 1533577014831) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533577700926) (:by |B1y7Rc-Zz) (:text |{})
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541255553) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.schema)
    |app.server $ %{} :FileEntry
      :defs $ {}
        |*client-caches $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defatom)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*client-caches)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |{})
        |*initial-db $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |defatom)
              |j $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |*initial-db)
              |r $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |if)
                  |j $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |path-exists?)
                      |j $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |w-log)
                          |j $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |storage-file)
                  |r $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |do)
                      |j $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |println)
                          |j $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text "|\"Found local EDN data")
                      |r $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |merge)
                          |j $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |schema/database)
                          |r $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn)
                              |j $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |read-file)
                                  |j $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |storage-file)
                  |v $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |do)
                      |j $ %{} :Expr (:at 1636740116438) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |println)
                          |j $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text "|\"Found no data")
                      |r $ %{} :Leaf (:at 1636740116438) (:by |B1y7Rc-Zz) (:text |schema/database)
        |*reader-reel $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defatom)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reader-reel)
              |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel)
        |*reel $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defatom)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reel)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |merge)
                  |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-schema)
                  |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |{})
                      |j $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:base)
                          |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*initial-db)
                      |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:db)
                          |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*initial-db)
        |dispatch! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |dispatch!)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op)
                  |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sid)
              |v $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-id)
                          |j $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740588441) (:by |B1y7Rc-Zz) (:text |generate-id!)
                      |j $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-time)
                          |j $ %{} :Expr (:at 1636978739413) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636978745280) (:by |B1y7Rc-Zz) (:text |get-timestamp)
                              |T $ %{} :Expr (:at 1636740597934) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740597934) (:by |B1y7Rc-Zz) (:text |get-time!)
                  |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |if)
                      |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config/dev?)
                      |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |println)
                          |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"Dispatch!")
                          |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |str)
                              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op)
                          |x $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sid)
                  |v $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1695975449521) (:by |B1y7Rc-Zz) (:text |tag-match)
                      |b $ %{} :Leaf (:at 1695975450263) (:by |B1y7Rc-Zz) (:text |op)
                      |f $ %{} :Expr (:at 1695975452068) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Expr (:at 1695975452219) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975453490) (:by |B1y7Rc-Zz) (:text |:effect/persist)
                          |b $ %{} :Expr (:at 1695975456440) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975456440) (:by |B1y7Rc-Zz) (:text |persist-db!)
                      |n $ %{} :Expr (:at 1695975464015) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Expr (:at 1695975465633) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975468827) (:by |B1y7Rc-Zz) (:text |:effect/ping)
                          |b $ %{} :Expr (:at 1695975469358) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695975476956) (:by |B1y7Rc-Zz) (:text |wss-send!)
                              |b $ %{} :Leaf (:at 1695975478081) (:by |B1y7Rc-Zz) (:text |sid)
                              |h $ %{} :Expr (:at 1695975478673) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695975480533) (:by |B1y7Rc-Zz) (:text |format-cirru-edn)
                                  |b $ %{} :Expr (:at 1695975481838) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695975482199) (:by |B1y7Rc-Zz) (:text |::)
                                      |b $ %{} :Leaf (:at 1695975486081) (:by |B1y7Rc-Zz) (:text |:effect/pong)
                      |v $ %{} :Expr (:at 1695975458915) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1695975459449) (:by |B1y7Rc-Zz) (:text |_)
                          |T $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reset!)
                              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reel)
                              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-reducer)
                                  |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel)
                                  |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |updater)
                                  |v $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op)
                                  |y $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sid)
                                  |yT $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-id)
                                  |yj $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |op-time)
                                  |yr $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config/dev?)
        |get-backup-path! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |get-backup-path!)
              |r $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |now)
                          |j $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |extract-time)
                              |j $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |get-time!)
                  |r $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |join-path)
                      |j $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |calcit-dirname)
                      |r $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text "|\"backups")
                      |v $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |str)
                          |j $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |:month)
                              |j $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |now)
                      |x $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |str)
                          |j $ %{} :Expr (:at 1636740409306) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |:day)
                              |j $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text |now)
                          |r $ %{} :Leaf (:at 1636740409306) (:by |B1y7Rc-Zz) (:text "|\"-snapshot.cirru")
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629965278258) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |main!)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |println)
                  |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"Running mode:")
                  |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |if)
                      |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config/dev?)
                      |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"dev")
                      |v $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text "|\"release")
              |x $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |p?)
                          |j $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |get-env)
                              |j $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text "|\"port")
                      |j $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |port)
                          |j $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |some?)
                                  |j $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |p?)
                              |r $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1695057787865) (:by |B1y7Rc-Zz) (:text |parse-float)
                                  |j $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |p?)
                              |v $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |:port)
                                  |j $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |config/site)
                  |r $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |run-server!)
                      |j $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |port)
                  |v $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |println)
                      |j $ %{} :Expr (:at 1636740210994) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |str)
                          |j $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text "|\"Server started on port:")
                          |r $ %{} :Leaf (:at 1636740210994) (:by |B1y7Rc-Zz) (:text |port)
              |xT $ %{} :Expr (:at 1636740236786) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |do)
                  |j $ %{} :Expr (:at 1636740236786) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |;)
                      |j $ %{} :Leaf (:at 1636740236786) (:by |B1y7Rc-Zz) (:text "|\"init it before doing multi-threading")
                  |r $ %{} :Expr (:at 1636740236786) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |identity)
                      |j $ %{} :Leaf (:at 1636740236786) (:by |B1y7Rc-Zz) (:text |@*reader-reel)
              |y $ %{} :Expr (:at 1636740243302) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |set-interval)
                  |j $ %{} :Leaf (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |200)
                  |r $ %{} :Expr (:at 1636740243302) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1636740243302) (:by |B1y7Rc-Zz)
                        :data $ {}
                      |r $ %{} :Expr (:at 1636740243302) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740243302) (:by |B1y7Rc-Zz) (:text |render-loop!)
              |yT $ %{} :Expr (:at 1636740278939) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740278939) (:by |B1y7Rc-Zz) (:text |on-control-c)
                  |j $ %{} :Leaf (:at 1636740278939) (:by |B1y7Rc-Zz) (:text |on-exit!)
              |yj $ %{} :Expr (:at 1636740251817) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |set-interval)
                  |j $ %{} :Leaf (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |600000)
                  |r $ %{} :Expr (:at 1636740251817) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1636740251817) (:by |B1y7Rc-Zz)
                        :data $ {}
                      |r $ %{} :Expr (:at 1636740251817) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740251817) (:by |B1y7Rc-Zz) (:text |persist-db!)
              |yv $ %{} :Expr (:at 1629963056453) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740260808) (:by |B1y7Rc-Zz) (:text |set-interval)
                  |j $ %{} :Leaf (:at 1636740263078) (:by |B1y7Rc-Zz) (:text |60000)
                  |r $ %{} :Expr (:at 1629963063796) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629963064023) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1629963064562) (:by |B1y7Rc-Zz)
                        :data $ {}
                      |r $ %{} :Expr (:at 1629963068961) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629963072978) (:by |B1y7Rc-Zz) (:text |set-today!)
        |on-exit! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636740290561) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |on-exit!)
              |r $ %{} :Expr (:at 1636740290561) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1636740290561) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |persist-db!)
              |x $ %{} :Expr (:at 1636740290561) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |;)
                  |j $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |println)
                  |r $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text "|\"exit code is...")
              |y $ %{} :Expr (:at 1636740290561) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |quit!)
                  |j $ %{} :Leaf (:at 1636740290561) (:by |B1y7Rc-Zz) (:text |0)
        |persist-db! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |persist-db!)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |file-content)
                          |j $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |format-cirru-edn)
                              |j $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |assoc)
                                  |j $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |:db)
                                      |j $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |@*reel)
                                  |r $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |:sessions)
                                  |v $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |{})
                      |j $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |storage-path)
                          |j $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |storage-file)
                      |r $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |backup-path)
                          |j $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |get-backup-path!)
                  |r $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |check-write-file!)
                      |j $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |storage-path)
                      |r $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |file-content)
                  |v $ %{} :Expr (:at 1636739973521) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |check-write-file!)
                      |j $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |backup-path)
                      |r $ %{} :Leaf (:at 1636739973521) (:by |B1y7Rc-Zz) (:text |file-content)
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |reload!)
              |r $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |println)
                  |j $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text "|\"Code updated..")
              |x $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |if)
                  |j $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |not)
                      |j $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |config/dev?)
                  |r $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |raise)
                      |j $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text "|\"reloading only happens in dev mode")
              |y $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |clear-twig-caches!)
              |yT $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |reset!)
                  |j $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |*reel)
                  |r $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |refresh-reel)
                      |j $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |@*reel)
                      |r $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |@*initial-db)
                      |v $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |updater)
              |yj $ %{} :Expr (:at 1636741049749) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |sync-clients!)
                  |j $ %{} :Leaf (:at 1636741049749) (:by |B1y7Rc-Zz) (:text |@*reader-reel)
        |render-loop! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |render-loop!)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |when)
                  |j $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |not)
                      |j $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |identical?)
                          |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reader-reel)
                          |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel)
                  |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reset!)
                      |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |*reader-reel)
                      |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reel)
                  |v $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sync-clients!)
                      |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |@*reader-reel)
        |run-server! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |run-server!)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |port)
              |v $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |wss-serve!)
                  |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |&{})
                      |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:port)
                      |r $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |port)
                  |r $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |data)
                      |r $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1686417800341) (:by |B1y7Rc-Zz) (:text |tag-match)
                          |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |data)
                          |r $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:connect)
                                  |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid)
                              |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |do)
                                  |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |dispatch!)
                                      |j $ %{} :Expr (:at 1695057836643) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |D $ %{} :Leaf (:at 1695057838970) (:by |B1y7Rc-Zz) (:text |::)
                                          |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:session/connect)
                                      |v $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid)
                                  |r $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |println)
                                      |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text "|\"New client.")
                          |v $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:message)
                                  |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid)
                                  |r $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |msg)
                              |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |let)
                                  |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |action)
                                          |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn)
                                              |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |msg)
                                  |n $ %{} :Expr (:at 1695057825003) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1695057826515) (:by |B1y7Rc-Zz) (:text |dispatch!)
                                      |b $ %{} :Leaf (:at 1695057827960) (:by |B1y7Rc-Zz) (:text |action)
                                      |h $ %{} :Leaf (:at 1695057829621) (:by |B1y7Rc-Zz) (:text |sid)
                          |x $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:disconnect)
                                  |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid)
                              |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |do)
                                  |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |println)
                                      |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text "|\"Client closed!")
                                  |r $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |dispatch!)
                                      |j $ %{} :Expr (:at 1695057841466) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |D $ %{} :Leaf (:at 1695057842587) (:by |B1y7Rc-Zz) (:text |::)
                                          |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |:session/disconnect)
                                      |v $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |sid)
                          |y $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |_)
                              |j $ %{} :Expr (:at 1636740505925) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |println)
                                  |j $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text "|\"unknown data:")
                                  |r $ %{} :Leaf (:at 1636740505925) (:by |B1y7Rc-Zz) (:text |data)
        |set-today! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |set-today!)
              |r $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1636740425577) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |today)
                          |j $ %{} :Expr (:at 1636744875019) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636745315192) (:by |B1y7Rc-Zz) (:text |wo-log)
                              |T $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636744666224) (:by |B1y7Rc-Zz) (:text |format-time)
                                  |j $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636744679511) (:by |B1y7Rc-Zz) (:text |get-time!)
                                  |r $ %{} :Leaf (:at 1636744673848) (:by |B1y7Rc-Zz) (:text "|\"%Y-%m-%d")
                      |j $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |old-today)
                          |j $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |:today)
                              |j $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |:db)
                                  |j $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |@*reel)
                  |r $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |when)
                      |j $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |not=)
                          |j $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |today)
                          |r $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |old-today)
                      |r $ %{} :Expr (:at 1629963109984) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |dispatch!)
                          |j $ %{} :Expr (:at 1695057972922) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1695057973570) (:by |B1y7Rc-Zz) (:text |::)
                              |T $ %{} :Leaf (:at 1629963109984) (:by |B1y7Rc-Zz) (:text |:today)
                              |b $ %{} :Leaf (:at 1695057974884) (:by |B1y7Rc-Zz) (:text |today)
                          |v $ %{} :Leaf (:at 1629965228632) (:by |B1y7Rc-Zz) (:text "|\"system")
        |storage-file $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636740318208) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |def)
              |j $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |storage-file)
              |r $ %{} :Expr (:at 1636740318208) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |if)
                  |j $ %{} :Expr (:at 1636740318208) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |empty?)
                      |j $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |calcit-dirname)
                  |r $ %{} :Expr (:at 1636740318208) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |str)
                      |j $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |calcit-dirname)
                      |r $ %{} :Expr (:at 1636740318208) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |:storage-file)
                          |j $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |config/site)
                  |v $ %{} :Expr (:at 1636740318208) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |str)
                      |j $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |calcit-dirname)
                      |r $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text "|\"/")
                      |v $ %{} :Expr (:at 1636740318208) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |:storage-file)
                          |j $ %{} :Leaf (:at 1636740318208) (:by |B1y7Rc-Zz) (:text |config/site)
        |sync-clients! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |sync-clients!)
              |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel)
              |v $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |wss-each!)
                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid)
                      |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |let)
                          |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |db)
                                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:db)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |reel)
                              |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |records)
                                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:records)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |reel)
                              |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |session)
                                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |get-in)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |db)
                                      |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |[])
                                          |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:sessions)
                                          |r $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid)
                              |v $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |old-store)
                                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |or)
                                      |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |get)
                                          |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |@*client-caches)
                                          |r $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid)
                                      |r $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |nil)
                              |x $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |new-store)
                                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |twig-container)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |db)
                                      |r $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |session)
                                      |v $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |records)
                              |y $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |changes)
                                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |diff-twig)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |old-store)
                                      |r $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |new-store)
                                      |v $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:key)
                                              |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |:id)
                          |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636742843623) (:by |B1y7Rc-Zz) (:text |;)
                              |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |when)
                              |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |config/dev?)
                              |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |println)
                                  |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text "|\"Changes for")
                                  |r $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid)
                                  |v $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text "|\":")
                                  |x $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |changes)
                                  |y $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |count)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |records)
                          |v $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |not=)
                                  |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |changes)
                                  |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |[])
                              |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |do)
                                  |j $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |wss-send!)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid)
                                      |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |format-cirru-edn)
                                          |b $ %{} :Expr (:at 1695058199930) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1695058200128) (:by |B1y7Rc-Zz) (:text |::)
                                              |b $ %{} :Leaf (:at 1695058202220) (:by |B1y7Rc-Zz) (:text |:patch)
                                              |h $ %{} :Leaf (:at 1695058204089) (:by |B1y7Rc-Zz) (:text |changes)
                                  |r $ %{} :Expr (:at 1636740703792) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |swap!)
                                      |j $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |*client-caches)
                                      |r $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |assoc)
                                      |v $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |sid)
                                      |x $ %{} :Leaf (:at 1636740703792) (:by |B1y7Rc-Zz) (:text |new-store)
              |x $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |new-twig-loop!)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
          :data $ {}
            |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |ns)
            |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.server)
            |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:require)
                |j $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.schema)
                    |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:as)
                    |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |schema)
                |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.updater)
                    |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |updater)
                |x $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |cumulo-reel.core)
                    |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-reducer)
                        |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |refresh-reel)
                        |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |reel-schema)
                |yj $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.config)
                    |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:as)
                    |r $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |config)
                |yx $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |app.twig.container)
                    |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |twig-container)
                |yy $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |recollect.diff)
                    |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |diff-twig)
                |yyL $ %{} :Expr (:at 1636740371960) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss.core)
                    |j $ %{} :Leaf (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636740371960) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss-serve!)
                        |j $ %{} :Leaf (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss-send!)
                        |r $ %{} :Leaf (:at 1636740371960) (:by |B1y7Rc-Zz) (:text |wss-each!)
                |yyj $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |recollect.twig)
                    |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1629962948683) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |new-twig-loop!)
                        |j $ %{} :Leaf (:at 1629962948683) (:by |B1y7Rc-Zz) (:text |clear-twig-caches!)
                |yyx $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |app.$meta)
                    |j $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit-dirname)
                |yyy $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.fs)
                    |j $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |path-exists?)
                        |j $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |check-write-file!)
                |yyyT $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.time)
                    |j $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |set-interval)
                |yyyj $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.date)
                    |j $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |get-time!)
                        |j $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |extract-time)
                        |r $ %{} :Leaf (:at 1636744663311) (:by |B1y7Rc-Zz) (:text |format-time)
                        |v $ %{} :Leaf (:at 1636978751109) (:by |B1y7Rc-Zz) (:text |get-timestamp)
                |yyyr $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |calcit.std.path)
                    |j $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636739938046) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636739938046) (:by |B1y7Rc-Zz) (:text |join-path)
    |app.style $ %{} :FileEntry
      :defs $ {}
        |button $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533696351058) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1533696352712) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1533696351058) (:by |root) (:text |button)
              |r $ %{} :Expr (:at 1533696351058) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533696354618) (:by |root) (:text |merge)
                  |j $ %{} :Leaf (:at 1533696355914) (:by |root) (:text |ui/button)
                  |r $ %{} :Expr (:at 1533696356374) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533696356687) (:by |root) (:text |{})
                      |j $ %{} :Expr (:at 1533696356973) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533696360113) (:by |root) (:text |:background-color)
                          |j $ %{} :Leaf (:at 1533696360834) (:by |root) (:text |:white)
        |link $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1519367966237) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1519367970413) (:by |root) (:text |def)
              |j $ %{} :Leaf (:at 1519367966237) (:by |root) (:text |link)
              |r $ %{} :Expr (:at 1519367966237) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1519367974187) (:by |root) (:text |{})
                  |j $ %{} :Expr (:at 1519367974501) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1519367980887) (:by |root) (:text |:text-decoration)
                      |j $ %{} :Leaf (:at 1519367984967) (:by |root) (:text |:underline)
                  |r $ %{} :Expr (:at 1519367985371) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1519367998049) (:by |root) (:text |:cursor)
                      |j $ %{} :Leaf (:at 1519367996458) (:by |root) (:text |:pointer)
                  |v $ %{} :Expr (:at 1519368028360) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1519368029579) (:by |root) (:text |:color)
                      |j $ %{} :Expr (:at 1519368031142) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1519368031562) (:by |root) (:text |hsl)
                          |j $ %{} :Leaf (:at 1519368032307) (:by |root) (:text |240)
                          |r $ %{} :Leaf (:at 1519368032737) (:by |root) (:text |80)
                          |v $ %{} :Leaf (:at 1519368033240) (:by |root) (:text |80)
                  |x $ %{} :Expr (:at 1519368217607) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1519368219848) (:by |root) (:text |:font-family)
                      |j $ %{} :Leaf (:at 1519368227853) (:by |root) (:text |ui/font-fancy)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1519367963533) (:by |root)
          :data $ {}
            |T $ %{} :Leaf (:at 1519367963533) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1519367963533) (:by |root) (:text |app.style)
            |r $ %{} :Expr (:at 1519368036923) (:by |root)
              :data $ {}
                |T $ %{} :Leaf (:at 1519368038192) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1519368038575) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1519368038764) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1629963906360) (:by |B1y7Rc-Zz) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1519368041713) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1519368041918) (:by |root)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1519368042785) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1519368043289) (:by |root) (:text |hsl)
                |r $ %{} :Expr (:at 1519368236509) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1519368236979) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1519368258261) (:by |root) (:text |respo-ui.core)
                    |r $ %{} :Leaf (:at 1519368241627) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1519368242073) (:by |root) (:text |ui)
    |app.twig.container $ %{} :FileEntry
      :defs $ {}
        |twig-container $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1629964851786) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |twig-container)
              |n $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
                  |r $ %{} :Leaf (:at 1507828952210) (:by |root) (:text |records)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |logged-in?)
                          |j $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |some?)
                              |j $ %{} :Expr (:at 1500541255553) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:user-id)
                                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
                      |j $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |router)
                          |j $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:router)
                              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
                      |r $ %{} :Expr (:at 1507830626848) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1507830630278) (:by |root) (:text |base-data)
                          |j $ %{} :Expr (:at 1507830631302) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1507830631896) (:by |root) (:text |{})
                              |j $ %{} :Expr (:at 1507830632113) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1507830641027) (:by |root) (:text |:logged-in?)
                                  |j $ %{} :Leaf (:at 1507830639219) (:by |root) (:text |logged-in?)
                              |n $ %{} :Expr (:at 1507830674443) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1507830677551) (:by |root) (:text |:session)
                                  |j $ %{} :Leaf (:at 1507830679311) (:by |root) (:text |session)
                              |v $ %{} :Expr (:at 1507830649968) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1507830655148) (:by |root) (:text |:reel-length)
                                  |j $ %{} :Expr (:at 1507830655987) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1507830657551) (:by |root) (:text |count)
                                      |j $ %{} :Leaf (:at 1507830658789) (:by |root) (:text |records)
                      |v $ %{} :Expr (:at 1533695786503) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695787128) (:by |root) (:text |user)
                          |j $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |get-in)
                              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:users)
                                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:user-id)
                                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
                  |r $ %{} :Expr (:at 1507830661017) (:by |root)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1507830661999) (:by |root) (:text |merge)
                      |L $ %{} :Leaf (:at 1507830664014) (:by |root) (:text |base-data)
                      |T $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |if)
                          |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |logged-in?)
                          |r $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                              |v $ %{} :Expr (:at 1500541255553) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:user)
                                  |j $ %{} :Expr (:at 1500541255553) (:by nil)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |twig-user)
                                      |j $ %{} :Leaf (:at 1533695794137) (:by |root) (:text |user)
                              |x $ %{} :Expr (:at 1500541255553) (:by nil)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:router)
                                  |j $ %{} :Expr (:at 1524070628251) (:by |root)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1524070634499) (:by |root) (:text |assoc)
                                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |router)
                                      |j $ %{} :Leaf (:at 1524070635855) (:by |root) (:text |:data)
                                      |r $ %{} :Expr (:at 1524070636122) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629965163777) (:by |B1y7Rc-Zz) (:text |case-default)
                                          |j $ %{} :Expr (:at 1524070641804) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1524070642493) (:by |root) (:text |:name)
                                              |j $ %{} :Leaf (:at 1524070643351) (:by |root) (:text |router)
                                          |l $ %{} :Expr (:at 1629965164374) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629965164374) (:by |B1y7Rc-Zz) (:text |{})
                                          |n $ %{} :Expr (:at 1525108994160) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1525108995413) (:by |root) (:text |:home)
                                              |j $ %{} :Expr (:at 1533576741494) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1533576741874) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1545874586802) (:by |root)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1545874587585) (:by |root) (:text |:tasks)
                                                      |j $ %{} :Expr (:at 1545874587955) (:by |root)
                                                        :data $ {}
                                                          |5 $ %{} :Leaf (:at 1545874782200) (:by |root) (:text |get-in)
                                                          |D $ %{} :Leaf (:at 1545874779504) (:by |root) (:text |user)
                                                          |T $ %{} :Expr (:at 1545874783210) (:by |root)
                                                            :data $ {}
                                                              |D $ %{} :Leaf (:at 1545874783774) (:by |root) (:text |[])
                                                              |L $ %{} :Leaf (:at 1545874785228) (:by |root) (:text |:tasks)
                                                              |T $ %{} :Leaf (:at 1545874592185) (:by |root) (:text |:working)
                                          |p $ %{} :Expr (:at 1537204723306) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1537204725206) (:by |root) (:text |:history)
                                              |j $ %{} :Expr (:at 1537205110905) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1537205111309) (:by |root) (:text |{})
                                                  |b $ %{} :Expr (:at 1545876025762) (:by |root)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1545876026720) (:by |root) (:text |:week)
                                                      |j $ %{} :Expr (:at 1545876034584) (:by |root)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1545876034296) (:by |root) (:text |:data)
                                                          |j $ %{} :Leaf (:at 1545876035843) (:by |root) (:text |router)
                                                  |j $ %{} :Expr (:at 1545874595691) (:by |root)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1545874596355) (:by |root) (:text |:tasks)
                                                      |b $ %{} :Expr (:at 1545875014253) (:by |root)
                                                        :data $ {}
                                                          |D $ %{} :Leaf (:at 1545875020580) (:by |root) (:text |twig-tasks-by-week)
                                                          |L $ %{} :Expr (:at 1545875563139) (:by |root)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1545875564605) (:by |root) (:text |:data)
                                                              |j $ %{} :Leaf (:at 1545875565438) (:by |root) (:text |router)
                                                          |T $ %{} :Expr (:at 1545874839326) (:by |root)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1545874839326) (:by |root) (:text |get-in)
                                                              |j $ %{} :Leaf (:at 1545874839326) (:by |root) (:text |user)
                                                              |r $ %{} :Expr (:at 1545874839326) (:by |root)
                                                                :data $ {}
                                                                  |T $ %{} :Leaf (:at 1545874839326) (:by |root) (:text |[])
                                                                  |j $ %{} :Leaf (:at 1545874839326) (:by |root) (:text |:tasks)
                                                                  |r $ %{} :Leaf (:at 1545874850527) (:by |root) (:text |:finished)
                                          |q $ %{} :Expr (:at 1556645341376) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1556645341376) (:by |B1y7Rc-Zz) (:text |:notes)
                                              |j $ %{} :Expr (:at 1556645341376) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1591602627694) (:by |B1y7Rc-Zz) (:text |twig-notes-by-month)
                                                  |j $ %{} :Expr (:at 1556645341376) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1556645341376) (:by |B1y7Rc-Zz) (:text |:data)
                                                      |j $ %{} :Leaf (:at 1556645341376) (:by |B1y7Rc-Zz) (:text |router)
                                                  |r $ %{} :Expr (:at 1556645341376) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1556645341376) (:by |B1y7Rc-Zz) (:text |:notes)
                                                      |j $ %{} :Leaf (:at 1556645341376) (:by |B1y7Rc-Zz) (:text |user)
                                          |r $ %{} :Expr (:at 1524070643948) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1524070646898) (:by |root) (:text |:profile)
                                              |j $ %{} :Expr (:at 1524070654495) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1524070662619) (:by |root) (:text |twig-members)
                                                  |j $ %{} :Expr (:at 1524070665615) (:by |root)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1524070670477) (:by |root) (:text |:sessions)
                                                      |j $ %{} :Leaf (:at 1524070672563) (:by |root) (:text |db)
                                                  |r $ %{} :Expr (:at 1524070673171) (:by |root)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1524070674094) (:by |root) (:text |:users)
                                                      |j $ %{} :Leaf (:at 1524070675166) (:by |root) (:text |db)
                              |y $ %{} :Expr (:at 1523120222572) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1523120223864) (:by |root) (:text |:count)
                                  |j $ %{} :Expr (:at 1523120229051) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1523120230136) (:by |root) (:text |count)
                                      |j $ %{} :Expr (:at 1523120230346) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1523120232122) (:by |root) (:text |:sessions)
                                          |j $ %{} :Leaf (:at 1523120232500) (:by |root) (:text |db)
                              |yT $ %{} :Expr (:at 1524279105545) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1524279110147) (:by |root) (:text |:color)
                                  |j $ %{} :Expr (:at 1524279111422) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636741089272) (:by |B1y7Rc-Zz) (:text |rand-hex-color!)
                              |yj $ %{} :Expr (:at 1533694823527) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533694824502) (:by |root) (:text |:today)
                                  |j $ %{} :Expr (:at 1533694825249) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1533694826546) (:by |root) (:text |:today)
                                      |j $ %{} :Leaf (:at 1533694827006) (:by |root) (:text |db)
                          |v $ %{} :Expr (:at 1636740975512) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636740975982) (:by |B1y7Rc-Zz) (:text |{})
        |twig-members $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1524070676419) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1629964963101) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1524070676419) (:by |root) (:text |twig-members)
              |r $ %{} :Expr (:at 1524070676419) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1524070680419) (:by |root) (:text |sessions)
                  |j $ %{} :Leaf (:at 1524070708862) (:by |root) (:text |users)
              |v $ %{} :Expr (:at 1524070683188) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629964949805) (:by |B1y7Rc-Zz) (:text |->)
                  |j $ %{} :Leaf (:at 1629964946832) (:by |B1y7Rc-Zz) (:text |sessions)
                  |r $ %{} :Expr (:at 1524070693234) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629964955610) (:by |B1y7Rc-Zz) (:text |.map-kv)
                      |j $ %{} :Expr (:at 1524070696021) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1524070696334) (:by |root) (:text |fn)
                          |j $ %{} :Expr (:at 1524070696681) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1524070697507) (:by |root) (:text |k)
                              |j $ %{} :Leaf (:at 1524070699358) (:by |root) (:text |session)
                          |r $ %{} :Expr (:at 1524070700350) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1524070701520) (:by |root) (:text |[])
                              |j $ %{} :Leaf (:at 1524070702142) (:by |root) (:text |k)
                              |r $ %{} :Expr (:at 1524070702968) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1524070705127) (:by |root) (:text |get-in)
                                  |j $ %{} :Leaf (:at 1524070714762) (:by |root) (:text |users)
                                  |r $ %{} :Expr (:at 1524070715457) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1524070716715) (:by |root) (:text |[])
                                      |j $ %{} :Expr (:at 1524070717257) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1524070720176) (:by |root) (:text |:user-id)
                                          |j $ %{} :Leaf (:at 1524070722292) (:by |root) (:text |session)
                                      |r $ %{} :Leaf (:at 1524070725752) (:by |root) (:text |:name)
        |twig-notes-by-month $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1556559792532) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629964905512) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1556559792532) (:by |B1y7Rc-Zz) (:text |twig-notes-by-month)
              |r $ %{} :Expr (:at 1556559792532) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1556559796177) (:by |B1y7Rc-Zz) (:text |data)
                  |j $ %{} :Leaf (:at 1556559800263) (:by |B1y7Rc-Zz) (:text |notes)
              |v $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |year)
                          |j $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |:year)
                              |j $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |data)
                      |j $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1591602632762) (:by |B1y7Rc-Zz) (:text |month)
                          |j $ %{} :Expr (:at 1636776738471) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636776739361) (:by |B1y7Rc-Zz) (:text |inc)
                              |T $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1591602630909) (:by |B1y7Rc-Zz) (:text |:month)
                                  |j $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |data)
                  |r $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629964916685) (:by |B1y7Rc-Zz) (:text |->)
                      |j $ %{} :Leaf (:at 1556559812936) (:by |B1y7Rc-Zz) (:text |notes)
                      |n $ %{} :Expr (:at 1629966414694) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629966427520) (:by |B1y7Rc-Zz) (:text |.to-map)
                      |r $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636795771090) (:by |B1y7Rc-Zz) (:text |.filter-kv)
                          |j $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |k)
                                  |j $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |task)
                              |r $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |let)
                                  |j $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |time)
                                          |b $ %{} :Expr (:at 1636742251533) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1636742256379) (:by |B1y7Rc-Zz) (:text |extract-time)
                                              |T $ %{} :Expr (:at 1636978697063) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |D $ %{} :Leaf (:at 1636978697775) (:by |B1y7Rc-Zz) (:text |::)
                                                  |L $ %{} :Leaf (:at 1636978698784) (:by |B1y7Rc-Zz) (:text |Date)
                                                  |T $ %{} :Expr (:at 1636742249593) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1636742924417) (:by |B1y7Rc-Zz) (:text |:time)
                                                      |j $ %{} :Leaf (:at 1636742925081) (:by |B1y7Rc-Zz) (:text |task)
                                  |r $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |and)
                                      |j $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |=)
                                          |j $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |year)
                                          |r $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1636742260289) (:by |B1y7Rc-Zz) (:text |:year)
                                              |j $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |time)
                                      |r $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |=)
                                          |j $ %{} :Leaf (:at 1591602637721) (:by |B1y7Rc-Zz) (:text |month)
                                          |r $ %{} :Expr (:at 1556559806649) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1636742262120) (:by |B1y7Rc-Zz) (:text |:month)
                                              |j $ %{} :Leaf (:at 1556559806649) (:by |B1y7Rc-Zz) (:text |time)
        |twig-tasks-by-week $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1545875030704) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1629964873098) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1545875030704) (:by |root) (:text |twig-tasks-by-week)
              |r $ %{} :Expr (:at 1545875030704) (:by |root)
                :data $ {}
                  |D $ %{} :Leaf (:at 1556558301372) (:by |B1y7Rc-Zz) (:text |data)
                  |T $ %{} :Leaf (:at 1545875035613) (:by |root) (:text |tasks)
              |v $ %{} :Expr (:at 1556558285703) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1556558286319) (:by |B1y7Rc-Zz) (:text |let)
                  |L $ %{} :Expr (:at 1556558286582) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Expr (:at 1556558302808) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1609150260118) (:by |B1y7Rc-Zz) (:text |filter-year)
                          |j $ %{} :Expr (:at 1556558307323) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556558309546) (:by |B1y7Rc-Zz) (:text |:year)
                              |j $ %{} :Leaf (:at 1556558310460) (:by |B1y7Rc-Zz) (:text |data)
                      |T $ %{} :Expr (:at 1556558286729) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1609150262443) (:by |B1y7Rc-Zz) (:text |filter-week)
                          |j $ %{} :Expr (:at 1636777002296) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636777003679) (:by |B1y7Rc-Zz) (:text |dec)
                              |T $ %{} :Expr (:at 1556558291677) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556558293727) (:by |B1y7Rc-Zz) (:text |:week)
                                  |j $ %{} :Leaf (:at 1556558299667) (:by |B1y7Rc-Zz) (:text |data)
                      |j $ %{} :Expr (:at 1636795122118) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636795128406) (:by |B1y7Rc-Zz) (:text |start-time)
                          |b $ %{} :Expr (:at 1677347602945) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1677347608617) (:by |B1y7Rc-Zz) (:text |parse-time)
                              |b $ %{} :Expr (:at 1677347617528) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1677347618744) (:by |B1y7Rc-Zz) (:text |:start)
                                  |b $ %{} :Leaf (:at 1677347619441) (:by |B1y7Rc-Zz) (:text |data)
                              |h $ %{} :Leaf (:at 1677347641260) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z")
                      |r $ %{} :Expr (:at 1636795202529) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636795204076) (:by |B1y7Rc-Zz) (:text |end-time)
                          |j $ %{} :Expr (:at 1677347650412) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1677347650412) (:by |B1y7Rc-Zz) (:text |parse-time)
                              |b $ %{} :Expr (:at 1677347650412) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1677347652678) (:by |B1y7Rc-Zz) (:text |:end)
                                  |b $ %{} :Leaf (:at 1677347650412) (:by |B1y7Rc-Zz) (:text |data)
                              |h $ %{} :Leaf (:at 1677347650412) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z")
                  |P $ %{} :Expr (:at 1636795034496) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1577815250174) (:by |B1y7Rc-Zz) (:text |;)
                      |T $ %{} :Leaf (:at 1636795036643) (:by |B1y7Rc-Zz) (:text |println)
                      |b $ %{} :Leaf (:at 1636795312166) (:by |B1y7Rc-Zz) (:text "|\"start:")
                      |j $ %{} :Expr (:at 1677347816427) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1677347817690) (:by |B1y7Rc-Zz) (:text |format-time)
                          |T $ %{} :Leaf (:at 1636795150546) (:by |B1y7Rc-Zz) (:text |start-time)
                          |b $ %{} :Leaf (:at 1677347819531) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z")
                  |R $ %{} :Expr (:at 1636795304066) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1577815247136) (:by |B1y7Rc-Zz) (:text |;)
                      |T $ %{} :Leaf (:at 1636795305017) (:by |B1y7Rc-Zz) (:text |println)
                      |j $ %{} :Leaf (:at 1636795306295) (:by |B1y7Rc-Zz) (:text "|\"end ")
                      |r $ %{} :Expr (:at 1677347820326) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1677347820912) (:by |B1y7Rc-Zz) (:text |format-time)
                          |T $ %{} :Leaf (:at 1636795307204) (:by |B1y7Rc-Zz) (:text |end-time)
                          |b $ %{} :Leaf (:at 1677347822670) (:by |B1y7Rc-Zz) (:text "||%Y-%m-%dT%H:%M:%S %z")
                  |T $ %{} :Expr (:at 1545875036376) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629964875761) (:by |B1y7Rc-Zz) (:text |->)
                      |j $ %{} :Leaf (:at 1545875047639) (:by |root) (:text |tasks)
                      |l $ %{} :Expr (:at 1636116052984) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636116054168) (:by |B1y7Rc-Zz) (:text |.to-map)
                      |n $ %{} :Expr (:at 1545875579751) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636795620594) (:by |B1y7Rc-Zz) (:text |.filter-kv)
                          |j $ %{} :Expr (:at 1545875583153) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1545875583536) (:by |root) (:text |fn)
                              |j $ %{} :Expr (:at 1545875583794) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964936274) (:by |B1y7Rc-Zz) (:text |k)
                                  |j $ %{} :Leaf (:at 1629964937202) (:by |B1y7Rc-Zz) (:text |task)
                              |r $ %{} :Expr (:at 1556558319302) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1556558319932) (:by |B1y7Rc-Zz) (:text |let)
                                  |b $ %{} :Expr (:at 1636795178443) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Expr (:at 1636795179249) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1636795180276) (:by |B1y7Rc-Zz) (:text |t)
                                          |j $ %{} :Expr (:at 1636795180925) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1677349621393) (:by |B1y7Rc-Zz) (:text |&map:get)
                                              |j $ %{} :Leaf (:at 1636795180925) (:by |B1y7Rc-Zz) (:text |task)
                                              |n $ %{} :Leaf (:at 1677349622092) (:by |B1y7Rc-Zz) (:text |:finished-time)
                                  |n $ %{} :Expr (:at 1636795624369) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |and)
                                      |j $ %{} :Expr (:at 1636795624369) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1677349597392) (:by |B1y7Rc-Zz) (:text |&>)
                                          |j $ %{} :Leaf (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |t)
                                          |r $ %{} :Expr (:at 1677347901058) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1677349722188) (:by |B1y7Rc-Zz) (:text |get-timestamp)
                                              |T $ %{} :Leaf (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |start-time)
                                      |r $ %{} :Expr (:at 1636795624369) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1677349599828) (:by |B1y7Rc-Zz) (:text |&<)
                                          |j $ %{} :Leaf (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |t)
                                          |r $ %{} :Expr (:at 1677347906057) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1677349726551) (:by |B1y7Rc-Zz) (:text |get-timestamp)
                                              |T $ %{} :Leaf (:at 1636795624369) (:by |B1y7Rc-Zz) (:text |end-time)
        |week-millis $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636795220485) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1636795220485) (:by |B1y7Rc-Zz) (:text |def)
              |j $ %{} :Leaf (:at 1636795220485) (:by |B1y7Rc-Zz) (:text |week-millis)
              |r $ %{} :Expr (:at 1636795220485) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636795221949) (:by |B1y7Rc-Zz) (:text |*)
                  |j $ %{} :Leaf (:at 1636795222876) (:by |B1y7Rc-Zz) (:text |7)
                  |r $ %{} :Leaf (:at 1636795224902) (:by |B1y7Rc-Zz) (:text |24)
                  |v $ %{} :Leaf (:at 1636795227299) (:by |B1y7Rc-Zz) (:text |3600)
                  |x $ %{} :Leaf (:at 1636795229576) (:by |B1y7Rc-Zz) (:text |1000)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541255553) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.twig.container)
            |r $ %{} :Expr (:at 1500541255553) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:require)
                |r $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.twig.user)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541255553) (:by nil)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |twig-user)
                |v $ %{} :Expr (:at 1636741084827) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636741084827) (:by |B1y7Rc-Zz) (:text |calcit.std.rand)
                    |j $ %{} :Leaf (:at 1636741084827) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636741084827) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636741084827) (:by |B1y7Rc-Zz) (:text |rand-hex-color!)
                |x $ %{} :Expr (:at 1636742232008) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636742232281) (:by |B1y7Rc-Zz) (:text |calcit.std.date)
                    |j $ %{} :Leaf (:at 1636742234045) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636742234309) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |D $ %{} :Leaf (:at 1636978703305) (:by |B1y7Rc-Zz) (:text |Date)
                        |T $ %{} :Leaf (:at 1636742238334) (:by |B1y7Rc-Zz) (:text |extract-time)
                        |j $ %{} :Leaf (:at 1636742243311) (:by |B1y7Rc-Zz) (:text |get-time!)
                        |r $ %{} :Leaf (:at 1636795040733) (:by |B1y7Rc-Zz) (:text |from-ywd)
                        |v $ %{} :Leaf (:at 1636795718683) (:by |B1y7Rc-Zz) (:text |from-ymd)
                        |w $ %{} :Leaf (:at 1677347613109) (:by |B1y7Rc-Zz) (:text |parse-time)
                        |x $ %{} :Leaf (:at 1677349717123) (:by |B1y7Rc-Zz) (:text |format-time)
                        |y $ %{} :Leaf (:at 1677349719187) (:by |B1y7Rc-Zz) (:text |get-timestamp)
    |app.twig.user $ %{} :FileEntry
      :defs $ {}
        |twig-user $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1629964865516) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |twig-user)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |user)
              |v $ %{} :Expr (:at 1533695768423) (:by |root)
                :data $ {}
                  |D $ %{} :Leaf (:at 1533695769181) (:by |root) (:text |->)
                  |L $ %{} :Leaf (:at 1533695769812) (:by |root) (:text |user)
                  |T $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |dissoc)
                      |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:password)
                  |j $ %{} :Expr (:at 1533695770442) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533695772271) (:by |root) (:text |dissoc)
                      |j $ %{} :Leaf (:at 1533695774102) (:by |root) (:text |:tasks)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541255553) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.twig.user)
            |r $ %{} :Expr (:at 1500541255553) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1542907313856) (:by |B1y7Rc-Zz) (:text |recollect.twig)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541255553) (:by nil)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1511004273474) (:by |root) (:text |deftwig)
    |app.updater $ %{} :FileEntry
      :defs $ {}
        |updater $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |updater)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op)
                  |v $ %{} :Leaf (:at 1517930722619) (:by |root) (:text |sid)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |y $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1695057927281) (:by |B1y7Rc-Zz) (:text |tag-match)
                  |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op)
                  |l $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:today)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |misc/set-today)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |o $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:session/connect)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |session/connect)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |q $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:session/disconnect)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |session/disconnect)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |s $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:session/remove-message)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |session/remove-message)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |t $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:user/log-in)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |user/log-in)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |u $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:user/sign-up)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |user/sign-up)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |v $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:user/log-out)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |user/log-out)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |w $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:router/change)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |router/change)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |x $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:task/create-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |task/create-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |y $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:task/remove-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |task/remove-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |z $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:task/finish-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |task/finish-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |zD $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:task/update-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |task/update-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |zP $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:task/touch-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |task/touch-working)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |zY $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:task/put-back)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |task/put-back)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |ze $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:task/pend)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |task/pend)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |zj $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:note/add)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |note/add-note)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |zn $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:note/edit)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |note/edit-note)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |zq $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |:note/remove)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                      |b $ %{} :Expr (:at 1695057922686) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |note/remove-note)
                          |b $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |db)
                          |h $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-data)
                          |l $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |sid)
                          |o $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-id)
                          |q $ %{} :Leaf (:at 1695057922686) (:by |B1y7Rc-Zz) (:text |op-time)
                  |zs $ %{} :Expr (:at 1695057929596) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1695057930114) (:by |B1y7Rc-Zz) (:text |_)
                      |T $ %{} :Expr (:at 1695057928707) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1695057928707) (:by |B1y7Rc-Zz) (:text |do)
                          |b $ %{} :Expr (:at 1695057928707) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1695057932196) (:by |B1y7Rc-Zz) (:text |eprintln)
                              |b $ %{} :Leaf (:at 1695057928707) (:by |B1y7Rc-Zz) (:text "|\"Unknown op:")
                              |h $ %{} :Leaf (:at 1695057928707) (:by |B1y7Rc-Zz) (:text |op)
                          |h $ %{} :Leaf (:at 1695057934389) (:by |B1y7Rc-Zz) (:text |db)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541255553) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.updater)
            |r $ %{} :Expr (:at 1500541255553) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.updater.session)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
                |r $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.updater.user)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |user)
                |v $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.updater.router)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |router)
                |w $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1533695731942) (:by |root) (:text |app.updater.misc)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1533695733624) (:by |root) (:text |misc)
                |x $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1533695514977) (:by |root) (:text |app.updater.task)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1533695516470) (:by |root) (:text |task)
                |xT $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1556646980717) (:by |B1y7Rc-Zz) (:text |app.updater.note)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1556646983410) (:by |B1y7Rc-Zz) (:text |note)
                |y $ %{} :Expr (:at 1529231005993) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1529231006285) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1529231007723) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1529231008972) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1529231009860) (:by |root) (:text |schema)
                |yT $ %{} :Expr (:at 1529231108810) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1529231110305) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1529231113905) (:by |root) (:text |respo-message.updater)
                    |r $ %{} :Leaf (:at 1529231114617) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1529231114849) (:by |root)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1529231116379) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1529231118760) (:by |root) (:text |update-messages)
    |app.updater.misc $ %{} :FileEntry
      :defs $ {}
        |set-today $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533694961037) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1533694961037) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1533694961037) (:by |root) (:text |set-today)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1533694962836) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533694963737) (:by |root) (:text |assoc)
                  |j $ %{} :Leaf (:at 1533694964744) (:by |root) (:text |db)
                  |r $ %{} :Leaf (:at 1533694966047) (:by |root) (:text |:today)
                  |v $ %{} :Leaf (:at 1533694968858) (:by |root) (:text |op-data)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1533695484743) (:by |root)
          :data $ {}
            |T $ %{} :Leaf (:at 1533695484743) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1533695484743) (:by |root) (:text |app.updater.misc)
    |app.updater.note $ %{} :FileEntry
      :defs $ {}
        |add-note $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1556647000095) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1556647000095) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1556647000095) (:by |B1y7Rc-Zz) (:text |add-note)
              |r $ %{} :Expr (:at 1556647007806) (:by |B1y7Rc-Zz)
                :data $ {}
                  |j $ %{} :Leaf (:at 1556647007806) (:by |B1y7Rc-Zz) (:text |db)
                  |r $ %{} :Leaf (:at 1556647007806) (:by |B1y7Rc-Zz) (:text |op-data)
                  |v $ %{} :Leaf (:at 1556647007806) (:by |B1y7Rc-Zz) (:text |sid)
                  |x $ %{} :Leaf (:at 1556647007806) (:by |B1y7Rc-Zz) (:text |op-id)
                  |y $ %{} :Leaf (:at 1556647007806) (:by |B1y7Rc-Zz) (:text |op-time)
              |v $ %{} :Expr (:at 1556647010025) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1556647010527) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1556647010835) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1556647011433) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647013865) (:by |B1y7Rc-Zz) (:text |session)
                          |j $ %{} :Expr (:at 1556647014507) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647015337) (:by |B1y7Rc-Zz) (:text |get-in)
                              |j $ %{} :Leaf (:at 1556647016153) (:by |B1y7Rc-Zz) (:text |db)
                              |r $ %{} :Expr (:at 1556647017074) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647017266) (:by |B1y7Rc-Zz) (:text |[])
                                  |j $ %{} :Leaf (:at 1556647019573) (:by |B1y7Rc-Zz) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1556647020559) (:by |B1y7Rc-Zz) (:text |sid)
                      |j $ %{} :Expr (:at 1556647021931) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647023394) (:by |B1y7Rc-Zz) (:text |user-id)
                          |j $ %{} :Expr (:at 1556647024021) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647024917) (:by |B1y7Rc-Zz) (:text |:user-id)
                              |j $ %{} :Leaf (:at 1556647026130) (:by |B1y7Rc-Zz) (:text |session)
                      |r $ %{} :Expr (:at 1556647033713) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647035088) (:by |B1y7Rc-Zz) (:text |new-note)
                          |j $ %{} :Expr (:at 1556647037210) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647038941) (:by |B1y7Rc-Zz) (:text |merge)
                              |j $ %{} :Leaf (:at 1556647041281) (:by |B1y7Rc-Zz) (:text |schema/note)
                              |r $ %{} :Expr (:at 1556647042348) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647042657) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1556647051519) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556647052027) (:by |B1y7Rc-Zz) (:text |:id)
                                      |j $ %{} :Leaf (:at 1556647052967) (:by |B1y7Rc-Zz) (:text |op-id)
                                  |r $ %{} :Expr (:at 1556647053438) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556647054112) (:by |B1y7Rc-Zz) (:text |:time)
                                      |j $ %{} :Leaf (:at 1556647056390) (:by |B1y7Rc-Zz) (:text |op-time)
                                  |v $ %{} :Expr (:at 1556647057354) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1556647058447) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1556647066310) (:by |B1y7Rc-Zz) (:text |op-data)
                  |r $ %{} :Expr (:at 1556647093722) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556647096025) (:by |B1y7Rc-Zz) (:text |assoc-in)
                      |j $ %{} :Leaf (:at 1556647096666) (:by |B1y7Rc-Zz) (:text |db)
                      |r $ %{} :Expr (:at 1556647097097) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647097328) (:by |B1y7Rc-Zz) (:text |[])
                          |j $ %{} :Leaf (:at 1556647099676) (:by |B1y7Rc-Zz) (:text |:users)
                          |r $ %{} :Leaf (:at 1556647101901) (:by |B1y7Rc-Zz) (:text |user-id)
                          |v $ %{} :Leaf (:at 1556647103015) (:by |B1y7Rc-Zz) (:text |:notes)
                          |x $ %{} :Leaf (:at 1556647105399) (:by |B1y7Rc-Zz) (:text |op-id)
                      |v $ %{} :Leaf (:at 1556647109263) (:by |B1y7Rc-Zz) (:text |new-note)
        |edit-note $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1556647154286) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1556647154286) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1556647154286) (:by |B1y7Rc-Zz) (:text |edit-note)
              |r $ %{} :Expr (:at 1556647155922) (:by |B1y7Rc-Zz)
                :data $ {}
                  |j $ %{} :Leaf (:at 1556647155922) (:by |B1y7Rc-Zz) (:text |db)
                  |r $ %{} :Leaf (:at 1556647155922) (:by |B1y7Rc-Zz) (:text |op-data)
                  |v $ %{} :Leaf (:at 1556647155922) (:by |B1y7Rc-Zz) (:text |sid)
                  |x $ %{} :Leaf (:at 1556647155922) (:by |B1y7Rc-Zz) (:text |op-id)
                  |y $ %{} :Leaf (:at 1556647155922) (:by |B1y7Rc-Zz) (:text |op-time)
              |v $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |session)
                          |j $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |get-in)
                              |j $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |db)
                              |r $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |[])
                                  |j $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |sid)
                      |j $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |user-id)
                          |j $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |:user-id)
                              |j $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |session)
                      |r $ %{} :Expr (:at 1556647169613) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647174210) (:by |B1y7Rc-Zz) (:text |note-id)
                          |j $ %{} :Expr (:at 1556647174684) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647175374) (:by |B1y7Rc-Zz) (:text |:id)
                              |j $ %{} :Leaf (:at 1556647176518) (:by |B1y7Rc-Zz) (:text |op-data)
                      |v $ %{} :Expr (:at 1556647177434) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647178591) (:by |B1y7Rc-Zz) (:text |text)
                          |j $ %{} :Expr (:at 1556647178810) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556648281480) (:by |B1y7Rc-Zz) (:text |:text)
                              |j $ %{} :Leaf (:at 1556647182418) (:by |B1y7Rc-Zz) (:text |op-data)
                  |r $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556647192307) (:by |B1y7Rc-Zz) (:text |update-in)
                      |j $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |db)
                      |r $ %{} :Expr (:at 1556647162170) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |[])
                          |j $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |:users)
                          |r $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |user-id)
                          |v $ %{} :Leaf (:at 1556647162170) (:by |B1y7Rc-Zz) (:text |:notes)
                          |x $ %{} :Leaf (:at 1556647186750) (:by |B1y7Rc-Zz) (:text |note-id)
                      |v $ %{} :Expr (:at 1556647195678) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1556647196366) (:by |B1y7Rc-Zz) (:text |fn)
                          |L $ %{} :Expr (:at 1556647196930) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647197344) (:by |B1y7Rc-Zz) (:text |note)
                          |T $ %{} :Expr (:at 1556647198425) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1556647199511) (:by |B1y7Rc-Zz) (:text |assoc)
                              |L $ %{} :Leaf (:at 1556647200192) (:by |B1y7Rc-Zz) (:text |note)
                              |T $ %{} :Leaf (:at 1556647201707) (:by |B1y7Rc-Zz) (:text |:text)
                              |j $ %{} :Leaf (:at 1556647203038) (:by |B1y7Rc-Zz) (:text |text)
        |remove-note $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1556647228311) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1556647228311) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1556647228311) (:by |B1y7Rc-Zz) (:text |remove-note)
              |n $ %{} :Expr (:at 1556647237363) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1556647237363) (:by |B1y7Rc-Zz) (:text |db)
                  |j $ %{} :Leaf (:at 1556647237363) (:by |B1y7Rc-Zz) (:text |op-data)
                  |r $ %{} :Leaf (:at 1556647237363) (:by |B1y7Rc-Zz) (:text |sid)
                  |v $ %{} :Leaf (:at 1556647237363) (:by |B1y7Rc-Zz) (:text |op-id)
                  |x $ %{} :Leaf (:at 1556647237363) (:by |B1y7Rc-Zz) (:text |op-time)
              |r $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |session)
                          |j $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |get-in)
                              |j $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |db)
                              |r $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |[])
                                  |j $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |sid)
                      |j $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |user-id)
                          |j $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |:user-id)
                              |j $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |session)
                  |r $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1556647259946) (:by |B1y7Rc-Zz) (:text |update-in)
                      |j $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |db)
                      |r $ %{} :Expr (:at 1556647229585) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |[])
                          |j $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |:users)
                          |r $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |user-id)
                          |v $ %{} :Leaf (:at 1556647229585) (:by |B1y7Rc-Zz) (:text |:notes)
                      |t $ %{} :Expr (:at 1556647244163) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1556647245471) (:by |B1y7Rc-Zz) (:text |fn)
                          |j $ %{} :Expr (:at 1556647245750) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647249370) (:by |B1y7Rc-Zz) (:text |notes)
                          |r $ %{} :Expr (:at 1556647251474) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1556647252690) (:by |B1y7Rc-Zz) (:text |dissoc)
                              |j $ %{} :Leaf (:at 1556647254405) (:by |B1y7Rc-Zz) (:text |notes)
                              |r $ %{} :Leaf (:at 1556647255513) (:by |B1y7Rc-Zz) (:text |op-data)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1556646969974) (:by |B1y7Rc-Zz)
          :data $ {}
            |T $ %{} :Leaf (:at 1556646969974) (:by |B1y7Rc-Zz) (:text |ns)
            |j $ %{} :Leaf (:at 1556646969974) (:by |B1y7Rc-Zz) (:text |app.updater.note)
            |r $ %{} :Expr (:at 1556647044321) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1556647045030) (:by |B1y7Rc-Zz) (:text |:require)
                |j $ %{} :Expr (:at 1556647045270) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1556647045470) (:by |B1y7Rc-Zz) (:text |[])
                    |j $ %{} :Leaf (:at 1556647048344) (:by |B1y7Rc-Zz) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1556647048816) (:by |B1y7Rc-Zz) (:text |:as)
                    |v $ %{} :Leaf (:at 1556647049563) (:by |B1y7Rc-Zz) (:text |schema)
    |app.updater.router $ %{} :FileEntry
      :defs $ {}
        |change $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |change)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |assoc-in)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:sessions)
                      |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                      |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:router)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-data)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541255553) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.updater.router)
    |app.updater.session $ %{} :FileEntry
      :defs $ {}
        |connect $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |connect)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |assoc-in)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:sessions)
                      |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |merge)
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |schema/session)
                      |r $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |{})
                          |j $ %{} :Expr (:at 1500541255553) (:by nil)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:id)
                              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
        |disconnect $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |disconnect)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |update)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:sessions)
                  |v $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |fn)
                      |j $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
                      |r $ %{} :Expr (:at 1500541255553) (:by nil)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |dissoc)
                          |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |session)
                          |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
        |remove-message $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1529231499908) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1529231499908) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1529231499908) (:by |root) (:text |remove-message)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1529231506714) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1529231507936) (:by |root) (:text |update-in)
                  |j $ %{} :Leaf (:at 1529231509725) (:by |root) (:text |db)
                  |r $ %{} :Expr (:at 1529231509958) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1529231510376) (:by |root) (:text |[])
                      |j $ %{} :Leaf (:at 1529231511756) (:by |root) (:text |:sessions)
                      |r $ %{} :Leaf (:at 1529231512509) (:by |root) (:text |sid)
                      |v $ %{} :Leaf (:at 1529231515700) (:by |root) (:text |:messages)
                  |v $ %{} :Expr (:at 1529231534326) (:by |root)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1529231534991) (:by |root) (:text |fn)
                      |L $ %{} :Expr (:at 1529231535248) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1529231536189) (:by |root) (:text |messages)
                      |T $ %{} :Expr (:at 1529231516827) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1529231517957) (:by |root) (:text |dissoc)
                          |j $ %{} :Leaf (:at 1529231519342) (:by |root) (:text |messages)
                          |r $ %{} :Expr (:at 1529231521395) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1529231522521) (:by |root) (:text |:id)
                              |j $ %{} :Leaf (:at 1529231524125) (:by |root) (:text |op-data)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541255553) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.updater.session)
            |r $ %{} :Expr (:at 1500541255553) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |schema)
    |app.updater.task $ %{} :FileEntry
      :defs $ {}
        |create-working $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533695542671) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1533695542671) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1533695542671) (:by |root) (:text |create-working)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1533695556729) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533695576494) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1533695576864) (:by |root)
                    :data $ {}
                      |T $ %{} :Expr (:at 1533695577155) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695578067) (:by |root) (:text |user-id)
                          |j $ %{} :Expr (:at 1533695583013) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533695584727) (:by |root) (:text |get-in)
                              |j $ %{} :Leaf (:at 1533695586372) (:by |root) (:text |db)
                              |r $ %{} :Expr (:at 1533695586647) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533695587168) (:by |root) (:text |[])
                                  |j $ %{} :Leaf (:at 1533695589180) (:by |root) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1533695590643) (:by |root) (:text |sid)
                                  |v $ %{} :Leaf (:at 1533695593729) (:by |root) (:text |:user-id)
                  |r $ %{} :Expr (:at 1533695598361) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533695601381) (:by |root) (:text |assoc-in)
                      |j $ %{} :Leaf (:at 1533695601774) (:by |root) (:text |db)
                      |r $ %{} :Expr (:at 1533695603205) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695602692) (:by |root) (:text |[])
                          |j $ %{} :Leaf (:at 1533695604513) (:by |root) (:text |:users)
                          |r $ %{} :Leaf (:at 1533695605727) (:by |root) (:text |user-id)
                          |t $ %{} :Leaf (:at 1533695615781) (:by |root) (:text |:tasks)
                          |v $ %{} :Leaf (:at 1533695608453) (:by |root) (:text |:working)
                          |x $ %{} :Leaf (:at 1537289372312) (:by |root) (:text |op-id)
                      |v $ %{} :Expr (:at 1533695621457) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695624691) (:by |root) (:text |merge)
                          |j $ %{} :Leaf (:at 1533695628006) (:by |root) (:text |schema/task)
                          |r $ %{} :Expr (:at 1533695632445) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533695632781) (:by |root) (:text |{})
                              |b $ %{} :Expr (:at 1533695643013) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533695644442) (:by |root) (:text |:id)
                                  |j $ %{} :Leaf (:at 1533695645824) (:by |root) (:text |op-id)
                              |j $ %{} :Expr (:at 1533695632979) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533695633728) (:by |root) (:text |:text)
                                  |j $ %{} :Leaf (:at 1533695635041) (:by |root) (:text |op-data)
                              |r $ %{} :Expr (:at 1533695659307) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533695675335) (:by |root) (:text |:created-time)
                                  |j $ %{} :Leaf (:at 1533695667142) (:by |root) (:text |op-time)
        |finish-working $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533781390637) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1533781390637) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1533781390637) (:by |root) (:text |finish-working)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1533695556729) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533695576494) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1533695576864) (:by |root)
                    :data $ {}
                      |T $ %{} :Expr (:at 1533695577155) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695578067) (:by |root) (:text |user-id)
                          |j $ %{} :Expr (:at 1533695583013) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533695584727) (:by |root) (:text |get-in)
                              |j $ %{} :Leaf (:at 1533695586372) (:by |root) (:text |db)
                              |r $ %{} :Expr (:at 1533695586647) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533695587168) (:by |root) (:text |[])
                                  |j $ %{} :Leaf (:at 1533695589180) (:by |root) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1533695590643) (:by |root) (:text |sid)
                                  |v $ %{} :Leaf (:at 1533695593729) (:by |root) (:text |:user-id)
                  |r $ %{} :Expr (:at 1533695598361) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533782065578) (:by |root) (:text |update-in)
                      |j $ %{} :Leaf (:at 1533695601774) (:by |root) (:text |db)
                      |r $ %{} :Expr (:at 1533695603205) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695602692) (:by |root) (:text |[])
                          |j $ %{} :Leaf (:at 1533695604513) (:by |root) (:text |:users)
                          |r $ %{} :Leaf (:at 1533695605727) (:by |root) (:text |user-id)
                          |v $ %{} :Leaf (:at 1533782399689) (:by |root) (:text |:tasks)
                      |s $ %{} :Expr (:at 1533781430675) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533781431137) (:by |root) (:text |fn)
                          |j $ %{} :Expr (:at 1533781431553) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533782403484) (:by |root) (:text |tasks)
                          |r $ %{} :Expr (:at 1533781516647) (:by |root)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1533781517351) (:by |root) (:text |let)
                              |L $ %{} :Expr (:at 1533781517924) (:by |root)
                                :data $ {}
                                  |T $ %{} :Expr (:at 1533781518385) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1533781521438) (:by |root) (:text |task)
                                      |j $ %{} :Expr (:at 1533781463421) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1533781465406) (:by |root) (:text |get-in)
                                          |j $ %{} :Leaf (:at 1533782406940) (:by |root) (:text |tasks)
                                          |r $ %{} :Expr (:at 1533781469194) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1533781469547) (:by |root) (:text |[])
                                              |j $ %{} :Leaf (:at 1533781471428) (:by |root) (:text |:working)
                                              |r $ %{} :Leaf (:at 1533781474348) (:by |root) (:text |op-data)
                              |T $ %{} :Expr (:at 1533781528491) (:by |root)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1533781529344) (:by |root) (:text |if)
                                  |L $ %{} :Expr (:at 1533781531168) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1533781531006) (:by |root) (:text |some?)
                                      |j $ %{} :Leaf (:at 1533781531858) (:by |root) (:text |task)
                                  |T $ %{} :Expr (:at 1533781434665) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1533781439860) (:by |root) (:text |->)
                                      |j $ %{} :Leaf (:at 1533782443621) (:by |root) (:text |tasks)
                                      |r $ %{} :Expr (:at 1533781445020) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1533782410158) (:by |root) (:text |update)
                                          |Z $ %{} :Leaf (:at 1533782414442) (:by |root) (:text |:working)
                                          |f $ %{} :Expr (:at 1533781504896) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1533781505839) (:by |root) (:text |fn)
                                              |j $ %{} :Expr (:at 1533781506098) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1533781506676) (:by |root) (:text |tasks)
                                              |r $ %{} :Expr (:at 1533781507183) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1533781508234) (:by |root) (:text |dissoc)
                                                  |j $ %{} :Leaf (:at 1533781509640) (:by |root) (:text |tasks)
                                                  |r $ %{} :Leaf (:at 1533781512720) (:by |root) (:text |op-data)
                                      |v $ %{} :Expr (:at 1533781455917) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1533781458242) (:by |root) (:text |assoc-in)
                                          |j $ %{} :Expr (:at 1533781458562) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1533781458755) (:by |root) (:text |[])
                                              |j $ %{} :Leaf (:at 1533781460697) (:by |root) (:text |:finished)
                                              |r $ %{} :Leaf (:at 1533781477429) (:by |root) (:text |op-data)
                                          |r $ %{} :Expr (:at 1536727177361) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |D $ %{} :Leaf (:at 1536727179035) (:by |B1y7Rc-Zz) (:text |assoc)
                                              |T $ %{} :Leaf (:at 1533781535607) (:by |root) (:text |task)
                                              |j $ %{} :Leaf (:at 1536727181751) (:by |B1y7Rc-Zz) (:text |:finished-time)
                                              |r $ %{} :Leaf (:at 1536727183356) (:by |B1y7Rc-Zz) (:text |op-time)
                                  |j $ %{} :Leaf (:at 1533782437616) (:by |root) (:text |tasks)
        |pend $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1537290357489) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1537290357489) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1537290357489) (:by |root) (:text |pend)
              |r $ %{} :Expr (:at 1537290366294) (:by |root)
                :data $ {}
                  |j $ %{} :Leaf (:at 1537290366294) (:by |root) (:text |db)
                  |r $ %{} :Leaf (:at 1537290366294) (:by |root) (:text |op-data)
                  |v $ %{} :Leaf (:at 1537290366294) (:by |root) (:text |sid)
                  |x $ %{} :Leaf (:at 1537290366294) (:by |root) (:text |op-id)
                  |y $ %{} :Leaf (:at 1537290366294) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1537290374278) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1537290374278) (:by |root)
                    :data $ {}
                      |T $ %{} :Expr (:at 1537290374278) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |user-id)
                          |j $ %{} :Expr (:at 1537290374278) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |get-in)
                              |j $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |db)
                              |r $ %{} :Expr (:at 1537290374278) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |[])
                                  |j $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |sid)
                                  |v $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |:user-id)
                  |r $ %{} :Expr (:at 1537290374278) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |update-in)
                      |j $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |db)
                      |r $ %{} :Expr (:at 1537290374278) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |[])
                          |j $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |:users)
                          |r $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |user-id)
                          |v $ %{} :Leaf (:at 1537290374278) (:by |root) (:text |:tasks)
                          |x $ %{} :Leaf (:at 1537291111115) (:by |root) (:text |:working)
                          |y $ %{} :Leaf (:at 1537291126018) (:by |root) (:text |op-data)
                          |yT $ %{} :Leaf (:at 1537291132493) (:by |root) (:text |:pending?)
                      |t $ %{} :Leaf (:at 1537291135107) (:by |root) (:text |not)
        |put-back $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1538156884041) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1538156884041) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1538156884041) (:by |root) (:text |put-back)
              |r $ %{} :Expr (:at 1538156885773) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1538156885773) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1538156885773) (:by |root)
                    :data $ {}
                      |T $ %{} :Expr (:at 1538156885773) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |user-id)
                          |j $ %{} :Expr (:at 1538156885773) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |get-in)
                              |j $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |db)
                              |r $ %{} :Expr (:at 1538156885773) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |[])
                                  |j $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |sid)
                                  |v $ %{} :Leaf (:at 1538156885773) (:by |root) (:text |:user-id)
                  |r $ %{} :Expr (:at 1538156920308) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |update-in)
                      |j $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |db)
                      |r $ %{} :Expr (:at 1538156920308) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |[])
                          |j $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |:users)
                          |r $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |user-id)
                          |v $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |:tasks)
                      |v $ %{} :Expr (:at 1538156920308) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |fn)
                          |j $ %{} :Expr (:at 1538156920308) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |tasks)
                          |r $ %{} :Expr (:at 1538156920308) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |let)
                              |j $ %{} :Expr (:at 1538156920308) (:by |root)
                                :data $ {}
                                  |T $ %{} :Expr (:at 1538156920308) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |task)
                                      |j $ %{} :Expr (:at 1538156920308) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |get-in)
                                          |j $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |tasks)
                                          |r $ %{} :Expr (:at 1538156920308) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |[])
                                              |j $ %{} :Leaf (:at 1538156926467) (:by |root) (:text |:finished)
                                              |r $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |op-data)
                              |r $ %{} :Expr (:at 1538156920308) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |if)
                                  |j $ %{} :Expr (:at 1538156920308) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |some?)
                                      |j $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |task)
                                  |r $ %{} :Expr (:at 1538156920308) (:by |root)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |->)
                                      |j $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |tasks)
                                      |r $ %{} :Expr (:at 1538156920308) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |update)
                                          |j $ %{} :Leaf (:at 1538156936032) (:by |root) (:text |:finished)
                                          |r $ %{} :Expr (:at 1538156920308) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |fn)
                                              |j $ %{} :Expr (:at 1538156920308) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |tasks)
                                              |r $ %{} :Expr (:at 1538156920308) (:by |root)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |dissoc)
                                                  |j $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |tasks)
                                                  |r $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |op-data)
                                      |v $ %{} :Expr (:at 1538156920308) (:by |root)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |assoc-in)
                                          |j $ %{} :Expr (:at 1538156920308) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |[])
                                              |j $ %{} :Leaf (:at 1538156949436) (:by |root) (:text |:working)
                                              |r $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |op-data)
                                          |r $ %{} :Expr (:at 1538156971780) (:by |root)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1538156971780) (:by |root) (:text |assoc)
                                              |j $ %{} :Leaf (:at 1538156971780) (:by |root) (:text |task)
                                              |r $ %{} :Leaf (:at 1538156971780) (:by |root) (:text |:touched-time)
                                              |v $ %{} :Leaf (:at 1538156971780) (:by |root) (:text |op-time)
                                  |v $ %{} :Leaf (:at 1538156920308) (:by |root) (:text |tasks)
        |remove-working $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1533696025500) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1533696025500) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1533696025500) (:by |root) (:text |remove-working)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1533695556729) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1533695576494) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1533695576864) (:by |root)
                    :data $ {}
                      |T $ %{} :Expr (:at 1533695577155) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695578067) (:by |root) (:text |user-id)
                          |j $ %{} :Expr (:at 1533695583013) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533695584727) (:by |root) (:text |get-in)
                              |j $ %{} :Leaf (:at 1533695586372) (:by |root) (:text |db)
                              |r $ %{} :Expr (:at 1533695586647) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1533695587168) (:by |root) (:text |[])
                                  |j $ %{} :Leaf (:at 1533695589180) (:by |root) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1533695590643) (:by |root) (:text |sid)
                                  |v $ %{} :Leaf (:at 1533695593729) (:by |root) (:text |:user-id)
                  |r $ %{} :Expr (:at 1533695598361) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1533696048028) (:by |root) (:text |update-in)
                      |j $ %{} :Leaf (:at 1533695601774) (:by |root) (:text |db)
                      |r $ %{} :Expr (:at 1533695603205) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533695602692) (:by |root) (:text |[])
                          |j $ %{} :Leaf (:at 1533695604513) (:by |root) (:text |:users)
                          |r $ %{} :Leaf (:at 1533695605727) (:by |root) (:text |user-id)
                          |t $ %{} :Leaf (:at 1533695615781) (:by |root) (:text |:tasks)
                          |v $ %{} :Leaf (:at 1533695608453) (:by |root) (:text |:working)
                      |t $ %{} :Expr (:at 1533696052456) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1533696052872) (:by |root) (:text |fn)
                          |j $ %{} :Expr (:at 1533696053199) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533696056326) (:by |root) (:text |tasks)
                          |r $ %{} :Expr (:at 1533696056937) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1533696058733) (:by |root) (:text |dissoc)
                              |j $ %{} :Leaf (:at 1533696061723) (:by |root) (:text |tasks)
                              |r $ %{} :Leaf (:at 1533696127557) (:by |root) (:text |op-data)
        |touch-working $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1537289196108) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1537289196108) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1537289196108) (:by |root) (:text |touch-working)
              |r $ %{} :Expr (:at 1537289203990) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1537289203990) (:by |root) (:text |db)
                  |j $ %{} :Leaf (:at 1537289203990) (:by |root) (:text |op-data)
                  |r $ %{} :Leaf (:at 1537289203990) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1537289203990) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1537289203990) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1537289208308) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |let)
                  |j $ %{} :Expr (:at 1537289208308) (:by |root)
                    :data $ {}
                      |T $ %{} :Expr (:at 1537289208308) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |user-id)
                          |j $ %{} :Expr (:at 1537289208308) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |get-in)
                              |j $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |db)
                              |r $ %{} :Expr (:at 1537289208308) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |[])
                                  |j $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |sid)
                                  |v $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |:user-id)
                  |r $ %{} :Expr (:at 1537289208308) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1537289251298) (:by |root) (:text |update-in)
                      |j $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |db)
                      |r $ %{} :Expr (:at 1537289208308) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |[])
                          |j $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |:users)
                          |r $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |user-id)
                          |v $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |:tasks)
                          |x $ %{} :Leaf (:at 1537289208308) (:by |root) (:text |:working)
                          |y $ %{} :Leaf (:at 1537289378039) (:by |root) (:text |op-data)
                      |v $ %{} :Expr (:at 1537289208308) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1537289259673) (:by |root) (:text |fn)
                          |j $ %{} :Expr (:at 1537289259989) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1537289261848) (:by |root) (:text |task)
                          |r $ %{} :Expr (:at 1537289264420) (:by |root)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1537289264778) (:by |root) (:text |if)
                              |j $ %{} :Expr (:at 1537289265303) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537289267084) (:by |root) (:text |some?)
                                  |j $ %{} :Leaf (:at 1537289268407) (:by |root) (:text |task)
                              |r $ %{} :Expr (:at 1537289269329) (:by |root)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1537289270230) (:by |root) (:text |assoc)
                                  |j $ %{} :Leaf (:at 1537289270933) (:by |root) (:text |task)
                                  |r $ %{} :Leaf (:at 1537289273272) (:by |root) (:text |:touched-time)
                                  |v $ %{} :Leaf (:at 1537289276032) (:by |root) (:text |op-time)
                              |v $ %{} :Leaf (:at 1537289282930) (:by |root) (:text |nil)
        |update-working $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1536901057004) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1536901057004) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1536901151798) (:by |B1y7Rc-Zz) (:text |update-working)
              |r $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |db)
                  |j $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |op-data)
                  |r $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |sid)
                  |v $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |op-id)
                  |x $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |op-time)
              |v $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |user-id)
                          |j $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |get-in)
                              |j $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |db)
                              |r $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |[])
                                  |j $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |sid)
                                  |v $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |:user-id)
                  |r $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1536901120117) (:by |B1y7Rc-Zz) (:text |update-in)
                      |j $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |db)
                      |r $ %{} :Expr (:at 1536901058218) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |[])
                          |j $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |:users)
                          |r $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |user-id)
                          |v $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |:tasks)
                          |x $ %{} :Leaf (:at 1536901058218) (:by |B1y7Rc-Zz) (:text |:working)
                          |y $ %{} :Expr (:at 1536901088814) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536901090233) (:by |B1y7Rc-Zz) (:text |:id)
                              |j $ %{} :Leaf (:at 1536901092292) (:by |B1y7Rc-Zz) (:text |op-data)
                      |t $ %{} :Expr (:at 1536901116530) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1536901122098) (:by |B1y7Rc-Zz) (:text |fn)
                          |j $ %{} :Expr (:at 1536901122395) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536901123013) (:by |B1y7Rc-Zz) (:text |task)
                          |r $ %{} :Expr (:at 1536901124631) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1536901124984) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1536901128993) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1536901130049) (:by |B1y7Rc-Zz) (:text |some?)
                                  |T $ %{} :Leaf (:at 1536901126821) (:by |B1y7Rc-Zz) (:text |task)
                              |r $ %{} :Expr (:at 1536901130517) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1536901134240) (:by |B1y7Rc-Zz) (:text |assoc)
                                  |j $ %{} :Leaf (:at 1536901136091) (:by |B1y7Rc-Zz) (:text |task)
                                  |r $ %{} :Leaf (:at 1536901137468) (:by |B1y7Rc-Zz) (:text |:text)
                                  |v $ %{} :Expr (:at 1536901137881) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1536901138787) (:by |B1y7Rc-Zz) (:text |:text)
                                      |j $ %{} :Leaf (:at 1536901333397) (:by |B1y7Rc-Zz) (:text |op-data)
                              |v $ %{} :Leaf (:at 1536901144964) (:by |B1y7Rc-Zz) (:text |nil)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1533695436318) (:by |root)
          :data $ {}
            |T $ %{} :Leaf (:at 1533695436318) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1533695436318) (:by |root) (:text |app.updater.task)
            |r $ %{} :Expr (:at 1533695564360) (:by |root)
              :data $ {}
                |T $ %{} :Leaf (:at 1533695564969) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1533695565136) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1533695565411) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1533695566783) (:by |root) (:text |app.schema)
                    |r $ %{} :Leaf (:at 1533695570141) (:by |root) (:text |:as)
                    |v $ %{} :Leaf (:at 1533695571332) (:by |root) (:text |schema)
    |app.updater.user $ %{} :FileEntry
      :defs $ {}
        |log-in $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |log-in)
              |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |db)
                  |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-data)
                  |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |sid)
                  |v $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id)
                  |x $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-time)
              |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |let-sugar)
                  |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |[])
                              |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username)
                              |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |password)
                          |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-data)
                      |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user)
                          |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |->)
                              |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:users)
                                  |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |db)
                              |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |vals)
                              |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |.to-list)
                              |x $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |find)
                                  |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn)
                                      |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |user)
                                      |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |and)
                                          |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |=)
                                              |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username)
                                              |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:name)
                                                  |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |user)
                  |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |update-in)
                      |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |db)
                      |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |[])
                          |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:sessions)
                          |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |sid)
                      |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn)
                          |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session)
                          |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |some?)
                                  |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user)
                              |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |if)
                                  |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |=)
                                      |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |md5)
                                          |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |password)
                                      |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:password)
                                          |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user)
                                  |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |assoc)
                                      |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session)
                                      |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:user-id)
                                      |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:id)
                                          |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |maybe-user)
                                  |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |update)
                                      |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session)
                                      |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:messages)
                                      |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn)
                                          |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages)
                                          |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |assoc)
                                              |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages)
                                              |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id)
                                              |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |{})
                                                  |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:id)
                                                      |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id)
                                                  |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:text)
                                                      |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |str)
                                                          |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text "|\"Wrong password for ")
                                                          |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username)
                              |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |update)
                                  |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |session)
                                  |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:messages)
                                  |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |fn)
                                      |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages)
                                      |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |assoc)
                                          |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |messages)
                                          |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id)
                                          |v $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |{})
                                              |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:id)
                                                  |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |op-id)
                                              |r $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |:text)
                                                  |j $ %{} :Expr (:at 1629964754157) (:by |B1y7Rc-Zz)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |str)
                                                      |j $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text "|\"No user named: ")
                                                      |r $ %{} :Leaf (:at 1629964754157) (:by |B1y7Rc-Zz) (:text |username)
        |log-out $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1500541255553) (:by nil)
            :data $ {}
              |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |log-out)
              |r $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-id)
                  |x $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |op-time)
              |v $ %{} :Expr (:at 1500541255553) (:by nil)
                :data $ {}
                  |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |assoc-in)
                  |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |db)
                  |r $ %{} :Expr (:at 1500541255553) (:by nil)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                      |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:sessions)
                      |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |sid)
                      |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:user-id)
                  |v $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |nil)
        |sign-up $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sign-up)
              |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db)
                  |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-data)
                  |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sid)
                  |v $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id)
                  |x $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-time)
              |v $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |let-sugar)
                  |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[])
                              |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username)
                              |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |password)
                          |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-data)
                      |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |maybe-user)
                          |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |find)
                              |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |vals)
                                  |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:users)
                                      |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db)
                              |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |fn)
                                  |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |user)
                                  |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |=)
                                      |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username)
                                      |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:name)
                                          |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |user)
                  |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |if)
                      |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |some?)
                          |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |maybe-user)
                      |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |update-in)
                          |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db)
                          |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[])
                              |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:sessions)
                              |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sid)
                              |v $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:messages)
                          |v $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |messages)
                              |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |assoc)
                                  |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |messages)
                                  |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id)
                                  |v $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |{})
                                      |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:id)
                                          |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id)
                                      |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:text)
                                          |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |str)
                                              |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text "|\"Name is taken: ")
                                              |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username)
                      |v $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |->)
                          |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |db)
                          |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |assoc-in)
                              |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[])
                                  |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:sessions)
                                  |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |sid)
                                  |v $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:user-id)
                              |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id)
                          |v $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |assoc-in)
                              |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |[])
                                  |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:users)
                                  |r $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id)
                              |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |{})
                                  |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:id)
                                      |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |op-id)
                                  |r $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:name)
                                      |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username)
                                  |v $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:nickname)
                                      |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |username)
                                  |x $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:password)
                                      |j $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |md5)
                                          |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |password)
                                  |y $ %{} :Expr (:at 1629964761128) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |:avatar)
                                      |j $ %{} :Leaf (:at 1629964761128) (:by |B1y7Rc-Zz) (:text |nil)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1500541255553) (:by nil)
          :data $ {}
            |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |ns)
            |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |app.updater.user)
            |r $ %{} :Expr (:at 1500541255553) (:by nil)
              :data $ {}
                |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:require)
                |j $ %{} :Expr (:at 1500541255553) (:by nil)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                    |j $ %{} :Leaf (:at 1544894689258) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
                    |r $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |:refer)
                    |v $ %{} :Expr (:at 1500541255553) (:by nil)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |[])
                        |j $ %{} :Leaf (:at 1500541255553) (:by |root) (:text |find-first)
                |r $ %{} :Expr (:at 1636741016070) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636741016070) (:by |B1y7Rc-Zz) (:text |calcit.std.hash)
                    |j $ %{} :Leaf (:at 1636741016070) (:by |B1y7Rc-Zz) (:text |:refer)
                    |r $ %{} :Expr (:at 1636741016070) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636741016070) (:by |B1y7Rc-Zz) (:text |md5)
  :users $ {}
    |B1y7Rc-Zz $ {} (:avatar nil) (:id |B1y7Rc-Zz) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |root $ {} (:avatar nil) (:id |root) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
