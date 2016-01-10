
var
  React $ require :react
  assign $ require :object-assign
  Immutable $ require :immutable

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget
  polyfill $ require :../util/polyfill

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-ticket

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :ticket $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :getInitialState $ \ ()
    {}

  :onNameChange $ \ (event)
    @props.dispatch :ticket/update $ {} :id (@props.ticket.get :id) :name event.target.value

  :render $ \ ()
    var
      ticket @props.ticket

    div ({})
      div ({} :style widget.rowCard)
        input $ {} :style widget.textbox :value (ticket.get :name) :onChange @onNameChange
