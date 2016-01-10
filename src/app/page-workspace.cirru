
var
  hsl $ require :hsl
  React $ require :react

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget
  polyfill $ require :../util/polyfill

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-workspace

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired

  :getInitialState $ \ ()
    {} :ticketName :

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :onAddTicket $ \ ()
    @props.dispatch :ticket/add @state.ticketName
    @setState $ {} :ticketName :

  :onNameChange $ \ (event)
    @setState $ {} :ticketName event.target.value

  :renderAddTicket $ \ ()
    div ({} :style layout.rowCard)
      input $ {} :style widget.textbox :value @state.ticketName :onChange @onNameChange :placeholder :Name
      Space $ {} :width 20
      div ({} :style widget.button :onClick @onAddTicket) :Add

  :renderTickets $ \ ()
    ... @props.store
      get :tickets
      toList
      map $ \ (ticket)
        div ({} :style widget.ticket) (ticket.get :name)

  :render $ \ ()
    var
      styleRoot $ polyfill.merge layout.fullscreen layout.column

    div ({} :style styleRoot)
      div ({} :style layout.topBar)
        div ({} :style widget.inlineTitle :onClick @onNavHome) ":Home"
        div ({} :style widget.inlineTitle) ":Sort by due date"
        div ({} :style widget.inlineTitle) ":Sort by urgency"
      div ({} :style layout.thriftyContainer)
        div ({} :style layout.tallDivision)
          Space $ {} :height 20
          @renderAddTicket
          @renderTickets
        div ({} :style layout.tallDivision)
        div ({} :style layout.tallDivision)
