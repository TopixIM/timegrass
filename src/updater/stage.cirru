
var
  schema $ require :../schema

= exports.add $ \ (db data meta)
  db.setIn
    [] :stages (meta.get :id)
    ... schema.stage
      set :name data
      set :id (meta.get :id)
