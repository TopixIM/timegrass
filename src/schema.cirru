
var
  Immutable $ require :immutable

= exports.database $ Immutable.fromJS $ {}
  :users $ {}
  :tickets $ {}
  :states $ {}
  :stages $ {}

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

= exports.trasferEvent $ Immutable.fromJS $ {}
  :time null
  :worker null

= exports.state $ Immutable.fromJS $ {}
  :router $ {}
    :name :home
  :userId null
  :notifications $ []

= exports.notification $ Immutable.fromJS $ {}
  :id null
  :type :info
  :text null

= exports.router $ Immutable.fromJS $ {}
  :name null
  :data $ {}

= exports.stage $ Immutable.fromJS $ {}
  :name null
  :id null
