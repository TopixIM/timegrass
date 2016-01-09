
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-stages

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :store
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :onNavAddStage $ \ ()
    @props.dispatch :router/view :addStage

  :render $ \ ()
    div ({} :style layout.mainLayout)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) :Home
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavAddStage) ":+ stage"
      div ({} :style layout.pageContainer)
        div ({} :style widget.cardOnWhite)
