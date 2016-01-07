
var
  React $ require :react
  assign $ require :object-assign

var
  layout $ require :../styles/layout

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-workspace

  :render $ \ ()
    div ({} :style @styleRoot) :Workspace

  :styleRoot layout.fullscreen
