
var
  schema $ require :../schema

= exports.add $ \ (db data meta)
  var
    state $ db.getIn $ [] :states (meta.get :stateId)

  db.setIn
    [] :tickets (meta.get :id)
    ... schema.ticket
      set :id (meta.get :id)
      set :name data
      set :accessTime (meta.get :time)
      update :events $ \ (events)
        events.push $ ... schema.transferEvent
          set :time (meta.get :time)
          set :workerId (state.get :userId)
          set :stageId :open

= exports.name $ \ (db data meta)
  db.updateIn
    [] :tickets (data.get :id)
    \ (ticket)
      ... ticket
        set :name (data.get :name)
        set :accessTime (meta.get :time)

= exports.transfer $ \ (db data meta)
  ... db
    updateIn
      [] :tickets (data.get :id) :events
      \ (events)
        events.push $ ... schema.transferEvent
          set :time (meta.get :time)
          set :stageId (data.get :stageId)
          set :workerId (data.get :workerId)
    setIn
      [] :tickets (data.get :id) :accessTime
      meta.get :time
