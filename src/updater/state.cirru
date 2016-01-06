
var
  schema $ require :../schema

= exports.connect $ \ (db data meta)
  db.setIn
    [] :states (meta.get :stateId) schema.state

= exports.disconnect $ \ (db data meta)
  db.deleteIn
    [] :states (meta.get :stateId)
