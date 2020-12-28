
(ns app.twig.container
  (:require [recollect.twig :refer [deftwig]]
            [app.twig.user :refer [twig-user]]
            ["randomcolor" :as color]
            ["dayjs" :as dayjs]))

(deftwig
 twig-members
 (sessions users)
 (->> sessions
      (map (fn [[k session]] [k (get-in users [(:user-id session) :name])]))
      (into {})))

(deftwig
 twig-notes-by-month
 (data notes)
 (let [year (:year data), month (:month data)]
   (->> notes
        (filter
         (fn [[k task]]
           (let [time (dayjs (:time task))]
             (and (= year (.year time)) (= month (.month time))))))
        (into {}))))

(deftwig
 twig-tasks-by-week
 (data tasks)
 (let [filter-year (:year data), filter-week (:week data)]
   (->> tasks
        (filter
         (fn [[k task]]
           (let [time (dayjs (:finished-time task))
                 year (.year time)
                 month (.month time)
                 w (.week time)
                 week (if (and (== month 11) (> (.date time) 25))
                        (inc (.week (.subtract time 7 "day")))
                        w)]
             (and (= filter-year year) (= filter-week week)))))
        (into {}))))

(deftwig
 twig-container
 (db session records)
 (let [logged-in? (some? (:user-id session))
       router (:router session)
       base-data {:logged-in? logged-in?, :session session, :reel-length (count records)}
       user (get-in db [:users (:user-id session)])]
   (merge
    base-data
    (if logged-in?
      {:user (twig-user user),
       :router (assoc
                router
                :data
                (case (:name router)
                  :home {:tasks (get-in user [:tasks :working])}
                  :history
                    {:week (:data router),
                     :tasks (twig-tasks-by-week
                             (:data router)
                             (get-in user [:tasks :finished]))}
                  :notes (twig-notes-by-month (:data router) (:notes user))
                  :profile (twig-members (:sessions db) (:users db))
                  {})),
       :count (count (:sessions db)),
       :color (color/randomColor),
       :today (:today db)}
      nil))))
