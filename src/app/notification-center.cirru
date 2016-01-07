
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  Notification $ React.createFactory $ require :./notification

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :notification-center

  :propTypes $ {}
    :notifications
      . (React.PropTypes.instanceOf Immutable.List) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :render $ \ ()
    div ({} :className :notification-center :style @styleRoot)
      @props.notifications.map $ \\ (notification index)
        Notification $ {} :dispatch @props.dispatch :notification notification :key (notification.get :id) :index index

  :styleRoot $ {}
    :position :absolute
    :top 0
    :right 0
