
var
  React $ require :react
  assign $ require :object-assign
  Immutable $ require :immutable

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  ({}~ div img input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-settings

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :store
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :onNameChange $ \ (event)
    @props.dispatch :user/name event.target.value

  :onAvatarChange $ \ (event)
    @props.dispatch :user/avatar event.target.value

  :renderSettings $ \ ()
    var
      user $ @props.store.get :user
    div ({} :style widget.cardOnWhite)
      div ({} :style widget.cardTitle) :Settings
      div ({} :style layout.formEntry)
        div ({} :style layout.formProperty) :Name:
        div ({} :style layout.formValue)
          input $ {} :style widget.textbox :value (user.get :name) :onChange @onNameChange
      div ({} :style layout.formEntry)
        div ({} :style layout.formProperty) :Avatar:
        div ({} :style layout.formValue)
          input $ {} :style widget.textbox :value (user.get :avatar) :onChange @onAvatarChange

  :renderPreview $ \ ()
    var
      user $ @props.store.get :user
    div ({} :style widget.cardOnWhite)
      div ({} :style widget.cardTitle) :Preview
      div ({} :style @styleAvatarContainer)
        img $ {} :src (user.get :avatar) :style @styleAvatar

  :render $ \ ()
    div ({} :style @styleRoot)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) :Home
      div ({} :style @styleContainer)
        @renderSettings
        @renderPreview

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row

  :styleContainer $ {}
    :flex 1
    :padding ":40px"
    :height :100%
    :overflowY :auto

  :styleAvatarContainer $ {}

  :styleAvatar $ {}
    :width :100px
