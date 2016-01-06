
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

var
  NewComer $ React.createFactory $ require :./new-comer
  NotFound $ React.createFactory $ require :./not-found

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :propTypes $ {}
    :store
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :render $ \ ()
    var
      router $ @props.store.get :router
      dispatch @props.dispatch

    case (router.get :name)
      :new-comer $ NewComer $ {} :dispatch dispatch
      else $ NotFound
