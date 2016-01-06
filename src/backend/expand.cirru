
var
  Immutable $ require :immutable

var
  schema $ require :../schema

var bind $ \ (v k) (k v)

= module.exports $ \ (core stateId)
  var
    store $ core.get :store
    state $ store.getIn $ [] :states stateId

  cond
    ? $ state.get :user
    bind (state.get :user) $ \ (user)
      return schema.store
    schema.store.set :router $ {}
      :name :new-comer
      :data $ {}
