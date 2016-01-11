
var
  Immutable $ require :immutable

= exports.stage $ Immutable.fromJS $ {}
  :name null
  :id null

= exports.database $ Immutable.fromJS $ {}
  :users $ {}
  :tickets $ {}
  :states $ {}
  :stages $ {}
    :open $ ... exports.stage (set :name :Open) (set :id :open)
    :closed $ ... exports.stage (set :name :Closed) (set :id :closed)

= exports.store $ Immutable.fromJS $ {}
  :users $ {}
  :tickets $ {}
  :stages $ {}

= exports.user $ Immutable.fromJS $ {}
  :id null
  :name null
  :avatar null
  :password null

= exports.ticket $ Immutable.fromJS $ {}
  :name null
  :memberIds $ []
  :events $ []
  :accessTime null

= exports.transferEvent $ Immutable.fromJS $ {}
  :time null
  :stageId null
  :workerId null

= exports.state $ Immutable.fromJS $ {}
  :router $ {}
    :name :home
  :userId null
  :notifications $ []
  :shortTermSlot null
  :longTermSlot null

= exports.notification $ Immutable.fromJS $ {}
  :id null
  :type :info
  :text null

= exports.router $ Immutable.fromJS $ {}
  :name null
  :data $ {}
