
var
  React $ require :react
  Immutable $ require :immutable

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :not-found

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :store
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :render $ \ ()
    div ({})
      div ({} :style widget.cardOnWhite)
        JSON.stringify (@props.store.getIn $ [] :state :router)
        div ({} :style layout.barFromRight)
          div ({} :style widget.button :onClick @onNavHome) ":Back to home"