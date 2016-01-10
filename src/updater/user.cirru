
var
  schema $ require :../schema

= exports.login $ \ (db data meta)
  var maybeUser $ ... db
    get :users
    find $ \ (user userId)
      and
        is (user.get :name) (data.get :name)
        is (user.get :password) (data.get :password)
  cond (? maybeUser)
    ... db
      setIn
        [] :states (meta.get :stateId) :userId
        maybeUser.get :id
      setIn
        [] :states (meta.get :stateId) :router
        schema.router.set :name :home
    db.updateIn
      [] :states (meta.get :stateId) :notifications
      \ (notifications)
        notifications.push $ ... schema.notification
          set :id (meta.get :id)
          set :type :warning
          set :text ":wrong account"

= exports.logout $ \ (db data meta)
  db.deleteIn
    [] :states (meta.get :stateId) :userId

= exports.signup $ \ (db data meta)
  var
    maybeUser $ ... db
      get :users
      find $ \ (user userId)
        is (user.get :name) (data.get :name)
  cond (? maybeUser)
    db.updateIn
      [] :states (meta.get :stateId) :notifications
      \ (notifications)
        notifications.push $ ... schema.notification
          set :id (meta.get :id)
          set :type :error
          set :text ":name is taken"
    ... db
      setIn
        [] :users (meta.get :id)
        ... schema.user
          set :id (meta.get :id)
          set :name $ data.get :name
          set :password $ data.get :password
      setIn
        [] :states (meta.get :stateId) :userId
        meta.get :id
      setIn
        [] :states (meta.get :stateId) :router
        schema.router.set :name :home

= exports.name $ \ (db data meta)
  var
    userId $ db.getIn $ [] :states (meta.get :stateId) :userId
  db.setIn
    [] :users userId :name
    , data

= exports.avatar $ \ (db data meta)
  var
    userId $ db.getIn $ [] :states (meta.get :stateId) :userId
  db.setIn
    [] :users userId :avatar
    , data
