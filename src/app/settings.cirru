
var
  React $ require :react
  assign $ require :object-assign

var
  layout $ require :../styles/layout

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-settings

  :render $ \ ()
    div ({} :style @styleRoot) :Settings

  :styleRoot layout.fullscreen
