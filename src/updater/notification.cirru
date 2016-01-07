
= exports.read $ \ (db data meta)
  var
    stateId $ meta.get :stateId

  db.updateIn
    [] :states stateId :notifications
    \ (notifications)
      notifications.filterNot $ \ (notification)
        is (notification.get :id) data
