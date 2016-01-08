
var
  React $ require :react
  assign $ require :object-assign

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :ad-ticket

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired

  :onNavHome $ \ ()
    @props.dispatch :router/home

  :onNavWorkspace $ \ ()
    @props.dispatch :router/workspace

  :render $ \ ()
    div ({} :style @styleRoot)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) :Home
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavWorkspace) :Workspace

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row
