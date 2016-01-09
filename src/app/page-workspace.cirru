
var
  hsl $ require :hsl
  React $ require :react
  assign $ require :object-assign

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-workspace

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :onAddTicket $ \ ()
    @props.dispatch :router/view :addTicket

  :render $ \ ()
    div ({} :style @styleRoot)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) ":Home"
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onAddTicket) ":+ ticket"
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle) ":Sort by due date"
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle) ":Sort by urgency"

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row
