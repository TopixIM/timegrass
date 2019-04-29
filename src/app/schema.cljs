
(ns app.schema )

(def complain {:id nil, :text "", :time nil})

(def note {:id nil, :time nil, :updated-time nil, :text nil})

(def session
  {:user-id nil,
   :id nil,
   :nickname nil,
   :router {:name :home, :data nil, :router nil},
   :messages {}})

(def task
  {:id nil,
   :text "",
   :detail "",
   :pending? false,
   :created-time nil,
   :touched-time nil,
   :finished-time nil,
   :archived-time nil})

(def user
  {:name nil,
   :id nil,
   :nickname nil,
   :avatar nil,
   :password nil,
   :tasks {:working (do task {}), :pending {}, :finished {}},
   :notes (do note {})})

(def database {:sessions (do session {}), :users (do user {}), :today "2018-08-07"})

(def notification {:id nil, :kind nil, :text nil})

(def router {:name nil, :title nil, :data {}, :router nil})
