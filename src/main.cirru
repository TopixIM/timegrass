
var
  patch $ require :immutablepatch
  React $ require :react
  ReactDOM $ require :react-dom
  Immutable $ require :immutable

var
  schema $ require :./schema

var
  Page $ React.createFactory $ require :./app/page

var
  store schema.store
  isSocketAlive false

var
  socket $ new WebSocket $ + :ws://repo:4005
  dispatch $ \ (type data)
    if isSocketAlive $ do
      var msg $ JSON.stringify $ {}
        :type type
        :data data
      console.info :<= msg
      socket.send msg
    , undefined
  render $ \ ()
    ReactDOM.render
      Page $ {} (:store store) (:dispatch dispatch)
      document.querySelector :#app

= socket.onopen $ \ ()
  = isSocketAlive true

= socket.onmessage $ \ (event)
  var
    data $ JSON.parse event.data
  = store $ patch store (Immutable.fromJS data)
  console.log :store: (JSON.stringify store)
  render

= socket.onclose $ \ ()
  = isSocketAlive false
  setTimeout
    \ () (window.location.reload)
    , 10000

if module.hot $ do
  module.hot.accept :./schema $ \ ()
  module.hot.accept :./app/page $ \ ()
    = Page $ React.createFactory $ require :./app/page
    render
