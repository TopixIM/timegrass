
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

var routePages $ {}
  :home $ React.createFactory $ require :./page-home
  :stages $ React.createFactory $ require :./page-stages
  :members $ React.createFactory $ require :./page-members
  :settings $ React.createFactory $ require :./page-settings
  :newComer $ React.createFactory $ require :./page-new-comer
  :workspace $ React.createFactory $ require :./page-workspace

var
  PageNotFound $ React.createFactory $ require :./page-not-found
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
      dispatch @props.dispatch
      router $ store.getIn $ [] :state :router
      notifications $ store.getIn $ [] :state :notifications
      routePage $ or (. routePages (router.get :name)) PageNotFound

    div ({} :style @styleRoot)
      routePage $ {} :dispatch dispatch :store store
      NotificationCenter $ {} :dispatch dispatch :notifications notifications

  :styleRoot $ {}
