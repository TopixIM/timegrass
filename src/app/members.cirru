
var
  React $ require :react
  assign $ require :object-assign

var
  layout $ require :../styles/layout

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-members

  :render $ \ ()
    div ({} :style @styleRoot) :Members

  :styleRoot layout.fullscreen
