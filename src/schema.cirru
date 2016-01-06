
var
  Immutable $ require :immutable

= exports.database $ Immutable.fromJS $ {}
  :users $ {}
  :tickets $ []
  :states $ {}

= exports.store $ Immutable.fromJS $ {}
  :users $ {}
  :tickets $ []

= exports.user $ {}
  :id null
  :name null
  :avatar null

= exports.ticket $ {}
  :name null
  :worker null
  :members $ []
  :events $ []
  :stage :open

= exports.trasferEvent $ {}
  :time null
  :worker null

= exports.state $ {}
  :router $ {}
    :name :home
  :userId null
