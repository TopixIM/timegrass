
var
  schema $ require :../schema

= exports.home $ \ (db data meta)
  db.setIn
    [] :states (meta.get :stateId) :router
    schema.router.set :name :home

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

= exports.addTicket $ \ (db data meta)
  db.setIn
    [] :states (meta.get :stateId) :router
    schema.router.set :name :add-ticket