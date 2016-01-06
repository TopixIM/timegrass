
= exports.nav $ \ (db data meta)
  db.updateIn
    [] :states (meta.get :stateId) :router
    \ (router)
