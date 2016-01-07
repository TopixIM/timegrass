
var
  user $ require :./user
  state $ require :./state
  router $ require :./router

var identity $ \ (x) x

= module.exports $ \ (db type data meta)
  var handler $ case type

    :state/connect state.connect
    :state/disconnect state.disconnect

    :router/view router.view

    :user/login user.login
    :user/logout user.logout
    :user/signup user.signup

    else identity

  handler db data meta
