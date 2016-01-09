
var
  Immutable $ require :immutable

var
  schema $ require :../schema

var bind $ \ (v k) (k v)

= module.exports $ \ (core stateId)
  var
    db $ core.get :store
    state $ db.getIn $ [] :states stateId

  cond
    ? $ state.get :userId
    ... schema.store
      set :state state
      set :users $ db.get :users
      set :stages $ db.get :stages
      set :tickets $ db.get :tickets
    ... schema.store
      set :state state
      setIn
        [] :state :router
        {} :name :newComer :data $ {}
