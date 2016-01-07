
var
  Immutable $ require :immutable

var
  schema $ require :../schema

var bind $ \ (v k) (k v)

= module.exports $ \ (core stateId)
  var
    db $ core.get :store
    state $ db.getIn $ [] :states stateId

  console.log :state (JSON.stringify state)

  cond
    ? $ state.get :userId
    ... schema.store
      set :state state
    ... schema.store
      set :state state
      setIn
        [] :state :router
        {} :name :new-comer :data $ {}
