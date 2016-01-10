
var
  React $ require :react
  assign $ require :object-assign
  Immutable $ require :immutable

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget
  polyfill $ require :../util/polyfill

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-ticket

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :ticket $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :stages $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :users $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :getInitialState $ \ ()
    var
      latestEvent $ ... @props.ticket (get :events) (last)
    {}
      :isEditing false
      :selectedStageId (latestEvent.get :stageId)
      :selectedUserId (latestEvent.get :workerId)

  :onNameChange $ \ (event)
    @props.dispatch :ticket/name $ {} :id (@props.ticket.get :id) :name event.target.value

  :onEdit $ \ ()
    @setState $ {} :isEditing true

  :onSubmit $ \ ()
    var
      latestEvent $ ... @props.ticket (get :events) (last)
    if
      and (? @state.selectedStageId) (? @state.selectedUserId)
        or
          isnt @state.selectedStageId (latestEvent.get :stageId)
          isnt @state.selectedUserId (latestEvent.get :workerId)
      do
        @setState $ {} :isEditing false
        @props.dispatch :ticket/transfer $ {}
          :id $ @props.ticket.get :id
          :stageId @state.selectedStageId
          :workerId @state.selectedUserId
      do
        @setState $ {} :isEditing false
    , undefined

  :onStageSelect $ \ (stageId)
    @setState $ {} :selectedStageId stageId

  :onUserSelect $ \ (userId)
    @setState $ {} :selectedUserId userId

  :renderSelector $ \ ()
    var
      latestEvent $ ... @props.ticket (get :events) (last)
      stageName $ or (@props.stages.getIn $ [] (latestEvent.get :stageId) :name) :Unknown
      workerName $ or (@props.users.getIn $ [] (latestEvent.get :workerId) :name) :Anonymous
      selectedStage $ or (@props.stages.getIn $ [] @state.selectedStageId :name) :Unknown
      selectedWorker $ or (@props.users.getIn $ [] @state.selectedUserId :name) :Anonymous

    cond @state.isEditing
      div ({} :style layout.columnCard)
        div ({} :style layout.row)
          div ({} :style widget.tag) selectedStage
          Space $ {} :width 20
          div ({} :style widget.tag) selectedWorker
          Space $ {} :width 20
          div ({} :style widget.button :onClick @onSubmit) :Submit
        div ({} :style layout.row)
          div ({} :style layout.column)
            ... @props.stages (toList)
              map $ \\ (stage)
                var onClick $ \\ ()
                  @onStageSelect (stage.get :id)
                div ({} :style widget.tag :onClick onClick :key (stage.get :id)) (stage.get :name)
          Space $ {} :width 20
          div ({} :style layout.column)
            ... @props.users (toList)
              map $ \\ (user)
                var onClick $ \\ ()
                  @onUserSelect (user.get :id)
                div ({} :style widget.tag :onClick onClick :key (user.get :id)) (user.get :name)
      div ({} :style layout.rowCard)
        div ({} :style widget.tag)  stageName
        Space $ {} :width 20
        div ({} :style widget.tag)  workerName
        Space $ {} :width 20
        div ({} :style widget.button :onClick @onEdit) :Edit

  :renderEvents $ \ ()
    div ({} :style layout.columnCard)
      ... @props.ticket (get :events) (reverse) (slice 1)
        map $ \\ (event)
          var
            stageName $ or (@props.stages.getIn $ [] (event.get :stageId) :name) :Unknown
            workerName $ or (@props.users.getIn $ [] (event.get :workerId) :name) :Anonymous
          div ({} :style layout.row :key (event.get :time))
            div ({} :style widget.tag) stageName
            Space $ {} :width 20
            div ({} :style widget.tag) workerName

  :render $ \ ()
    var
      ticket @props.ticket

    div ({})
      div ({} :style layout.rowCard)
        input $ {} :style widget.textbox :value (ticket.get :name) :onChange @onNameChange
      @renderSelector
      @renderEvents
