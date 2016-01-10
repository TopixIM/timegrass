
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-stages

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :store
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :getInitialState $ \ ()
    {}
      :name :

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :onNavAddStage $ \ ()
    @props.dispatch :router/view :addStage

  :onNameChange $ \ (event)
    @setState $ {} :name event.target.value

  :onAddStage $ \ ()
    var name $ @state.name.trim
    if (> name.length 0) $ do
      @props.dispatch :stage/add @state.name
      @setState $ {} :name :
    , undefined

  :renderStages $ \ ()
    ... @props.store
      get :stages
      toList
      map $ \\ (stage)
        var
          onChange $ \\ (event)
            @props.dispatch :stage/update $ {} :id (stage.get :id) :name event.target.value
          onClick $ \\ (event)
            @props.dispatch :stage/delete (stage.get :id)

        div ({} :style layout.rowCard :key (stage.get :id))
          input $ {} :style widget.textbox :value (stage.get :name) :onChange onChange :placeholder ":Name"
          Space $ {} :width 20
          div ({} :style widget.minorButton :onClick onClick) :Delete

  :renderEmptyStage $ \ ()
    div ({} :style layout.rowCard)
      input $ {} :style widget.textbox :value @state.name :onChange @onNameChange :placeholder :Name
      Space $ {} :width 20
      div ({} :style widget.button :onClick @onAddStage) :Add

  :render $ \ ()
    div ({} :style layout.mainLayout)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) :Home
      div ({} :style layout.pageContainer)
        div ({} :style widget.cardOnWhite)
          div ({} :style layout.rowCard) :Open
          div ({} :style layout.rowCard) :Closed
          @renderStages
          @renderEmptyStage
