
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

var
  Home $ React.createFactory $ require :./home
  Members $ React.createFactory $ require :./members
  Settings $ React.createFactory $ require :./settings
  NewComer $ React.createFactory $ require :./new-comer
  NotFound $ React.createFactory $ require :./not-found
  Workspace $ React.createFactory $ require :./workspace
  NotificationCenter $ React.createFactory $ require :./notification-center

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :propTypes $ {}
    :store
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :render $ \ ()
    var
      router $ @props.store.getIn $ [] :state :router
      notifications $ @props.store.getIn $ [] :state :notifications
      dispatch @props.dispatch

    div ({} :style @styleRoot)
      case (router.get :name)
        :home $ Home $ {} :dispatch dispatch
        :members $ Members $ {} :dispatch dispatch
        :settings $ Settings $ {} :dispatch dispatch
        :new-comer $ NewComer $ {} :dispatch dispatch
        :workspace $ Workspace $ {} :dispatch dispatch
        else $ NotFound
      NotificationCenter $ {} :dispatch dispatch :notifications notifications

  :styleRoot $ {}
