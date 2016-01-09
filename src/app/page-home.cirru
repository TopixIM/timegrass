
var
  hsl $ require :hsl
  React $ require :react
  assign $ require :object-assign

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-home

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired

  :onNavWorkspace $ \ ()
    @props.dispatch :router/view :workspace

  :onNavMembers $ \ ()
    @props.dispatch :router/view :members

  :onNavSettings $ \ ()
    @props.dispatch :router/view :settings

  :onNavStages $ \ ()
    @props.dispatch :router/view :stages

  :render $ \ ()
    div ({} :className :app-home :style layout.mainLayout)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavWorkspace) :Workspace
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavMembers) :Members
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavStages) :Stages
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavSettings) :Settings
      div ({} :style @styleMore)
        div ({} :style widget.cardOnWhite) ":This is a tickets tracker~"
        div ({} :style widget.cardOnWhite) ":Try click at left to navigate!"

  :styleMore $ {}
    :padding ":20px"
    :flex 1
