
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
      div ({} :style @styleNavBar)
        div ({} :style widget.entryTitle :onClick @onNavWorkspace) :Workspace
        div ({} :style @styleEntryHr)
        div ({} :style widget.entryTitle :onClick @onNavMembers) :Members
        div ({} :style @styleEntryHr)
        div ({} :style widget.entryTitle :onClick @onNavSettings) :Settings
      div ({} :style @styleMore)
        div ({} :style widget.cardOnWhite) ":This is a tickets tracker~"
        div ({} :style widget.cardOnWhite) ":Try click at left to navigate!"

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row
      :alignItems :strech

  :styleNavBar $ {}
    :width :300px
    :backgroundColor $ hsl 0 0 90
    :padding ":100px 40px"
    :display :flex
    :flexDirection :column
    :alignItems :flex-end

  :styleEntryHr $ assign ({}) widget.horizontalRule
    {}
      :backgroundColor (hsl 0 0 80)
      :alignSelf :flex-end
      :margin ":20px 0"
      :flexShrink 0

  :styleMore $ {}
    :padding ":20px"
    :flex 1
