
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable
  objectAssign $ require :object-assign

var
  widget $ require :../styles/widget
  layout $ require :../styles/layout

var
  Login $ React.createFactory $ require :./login
  Signup $ React.createFactory $ require :./signup

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :new-comer

  :render $ \ ()
    var
      dispatch @props.dispatch

    div ({} :style @styleRoot :className :new-comer)
      div ({} :style @styleContainer)
        Login $ {} :dispatch dispatch
      div ({} :style widget.verticalRule)
      div ({} :style @styleContainer)
        Signup $ {} :dispatch dispatch

  :styleRoot $ objectAssign
    {}
      :display :flex
      :flexDirection :row
    , layout.fullscreen

  :styleContainer $ {}
    :padding ":40px 60px"
