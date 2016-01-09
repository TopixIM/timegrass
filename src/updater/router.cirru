
var
  schema $ require :../schema

= exports.view $ \ (db data meta)
  db.setIn
    [] :states (meta.get :stateId) :router
    schema.router.set :name data
