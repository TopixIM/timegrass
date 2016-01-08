
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
    @props.dispatch :router/workspace

  :onNavMembers $ \ ()
    @props.dispatch :router/members

  :onNavSettings $ \ ()
    @props.dispatch :router/settings

  :render $ \ ()
    div ({} :className :app-home :style @styleRoot)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavWorkspace) :Workspace
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavMembers) :Members
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavSettings) :Settings
      div ({} :style @styleMore)
        div ({} :style widget.cardOnWhite) ":This is a tickets tracker~"
        div ({} :style widget.cardOnWhite) ":Try click at left to navigate!"

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row
      :alignItems :strech

  :styleMore $ {}
    :padding ":20px"
    :flex 1
