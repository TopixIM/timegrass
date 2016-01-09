
var
  React $ require :react
  assign $ require :object-assign

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  ({}~ div input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :ad-ticket

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired

  :getInitialState $ \ ()
    {}
      :title :

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :onNavWorkspace $ \ ()
    @props.dispatch :router/view :workspace

  :render $ \ ()
    div ({} :style @styleRoot)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) :Home
        div ({} :style widget.entryHr)
        div ({} :style widget.entryTitle :onClick @onNavWorkspace) :Workspace
      div ({} :style @styleContainer)
        div ({} :style widget.cardOnWhite)
          div ({} :style widget.cardTitle) :Ticket
          div ({} :style layout.formEntry)
            div ({} :style layout.formProperty) :Name
            div ({} :style layout.formValue)
              input $ {} :style widget.textbox :placeholder :Title :value @state.title
          div ({} :style layout.barFromRight)
            div ({} :style widget.button) :Submit

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row

  :styleContainer $ {}
    :flex 1
    :padding ":20px"
