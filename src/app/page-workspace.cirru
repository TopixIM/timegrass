
var
  hsl $ require :hsl
  React $ require :react

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget
  polyfill $ require :../util/polyfill

var
  Space $ React.createFactory $ require :react-lite-space
  Ticket $ React.createFactory $ require :./ticket

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
      map $ \\ (ticket)
        var onClick $ \\ ()
          @props.dispatch :state/shortTermSlot (ticket.get :id)
        div ({} :style widget.ticket :onClick onClick :key (ticket.get :id)) (ticket.get :name)

  :render $ \ ()
    var
      dispatch @props.dispatch
      styleRoot $ polyfill.merge layout.fullscreen layout.column
      shortTermSlot $ @props.store.getIn $ [] :state :shortTermSlot
      longTermSlot $ @props.store.getIn $ [] :state :longTermSlot
      tickets $ @props.store.get :tickets
      tallCard $ polyfill.merge layout.tallDivision layout.smallPadding

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
        div ({} :style tallCard)
          cond (? shortTermSlot)
            Ticket $ {} :dispatch dispatch :ticket (tickets.get shortTermSlot)
        div ({} :style tallCard)
          cond (? longTermSlot)
            Ticket $ {} :dispatch dispatch :ticket (tickets.get longTermSlot)
