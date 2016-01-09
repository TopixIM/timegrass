
var
  hsl $ require :hsl
  React $ require :react
  assign $ require :object-assign
  Immutable $ require :immutable

var
  layout $ require :../styles/layout
  widget $ require :../styles/widget

var
  ({}~ div img) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-members

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :store
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :onNavHome $ \ ()
    @props.dispatch :router/view :home

  :renderMemberList $ \ ()
    ... @props.store
      get :users
      toList
      map $ \\ (user)
        div ({} :style @styleMember :key (user.get :id))
          img $ {} :style @styleAvatar :src (user.get :avatar)
          div ({} :style @styleName) (user.get :name)

  :render $ \ ()
    div ({} :style @styleRoot)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) :Home
      div ({} :style @styleContainer)
        @renderMemberList

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row

  :styleContainer $ {}
    :flex 1
    :padding :40px

  :styleMember $ {}
    :display :flex
    :flexDirection :row
    :alignItems :center
    :background $ hsl 0 0 90
    :padding :10px
    :marginBottom :20px

  :styleAvatar $ {}
    :width :40px
    :height :40px

  :styleName $ {}
    :marginLeft 16
    :fontFamily :Verdana
    :fontSize :18px
