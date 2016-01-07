
var
  schema $ require :../schema

= exports.workspace $ \ (db data meta)
  db.setIn
    [] :states (meta.get :stateId) :router
    schema.router.set :name :workspace

= exports.members $ \ (db data meta)
  db.setIn
    [] :states (meta.get :stateId) :router
    schema.router.set :name :members

= exports.settings $ \ (db data meta)
  db.setIn
    [] :states (meta.get :stateId) :router
    schema.router.set :name :settings
