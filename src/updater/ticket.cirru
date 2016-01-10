
var
  schema $ require :../schema

= exports.add $ \ (db data meta)
  db.setIn
    [] :tickets (meta.get :id)
    ... schema.ticket
      set :id (meta.get :id)
      set :name data

= exports.update $ \ (db data meta)
  db.updateIn
    [] :tickets (data.get :id)
    \ (ticket)
      ticket.merge data
