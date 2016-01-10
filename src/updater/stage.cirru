
var
  schema $ require :../schema

= exports.add $ \ (db data meta)
  db.setIn
    [] :stages (meta.get :id)
    ... schema.stage
      set :name data
      set :id (meta.get :id)

= exports.update $ \ (db data meta)
  db.updateIn
    [] :stages (data.get :id)
    \ (stage)
      stage.set :name (data.get :name)

= exports.delete $ \ (db data meta)
  db.deleteIn
    [] :stages data
