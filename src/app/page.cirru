
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
  AddTicket $ React.createFactory $ require :./add-ticket
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
      store @props.store
      router $ store.getIn $ [] :state :router
      notifications $ store.getIn $ [] :state :notifications
      dispatch @props.dispatch
      user $ store.getIn $ [] :users (store.getIn $ [] :state :userId)

    div ({} :style @styleRoot)
      case (router.get :name)
        :home $ Home $ {} :dispatch dispatch
        :members $ Members $ {} :dispatch dispatch
        :settings $ Settings $ {} :dispatch dispatch :user user
        :new-comer $ NewComer $ {} :dispatch dispatch
        :workspace $ Workspace $ {} :dispatch dispatch
        :add-ticket $ AddTicket $ {} :dispatch dispatch
        else $ NotFound
      NotificationCenter $ {} :dispatch dispatch :notifications notifications

  :styleRoot $ {}
