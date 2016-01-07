
var
  React $ require :react

var
  widget $ require :../styles/widget

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input button) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-signup

  :getInitialState $ \ ()
    {}
      :name :
      :password :
      :confirm :
      :error null

  :onNameChange $ \ (event)
    @setState $ {} :name event.target.value

  :onPasswordChange $ \ (event)
    @setState $ {} :password event.target.value

  :onConfirmChange $ \ (event)
    @setState $ {} :confirm event.target.value

  :onSubmit $ \ (event)
    @props.dispatch :user/signup $ {} :name @state.name :password @state.password

  :render $ \ ()
    div ({} :className :app-signup :style @styleRoot)
      div ({} :style widget.guideTitle) ":Sign up"
      Space $ {} :height 40
      input $ {} :type :text :value @state.name :onChange @onNameChange :style widget.textbox :placeholder :Name
      Space $ {} :height 10
      input $ {} :type :password :value @state.password :onChange @onPasswordChange :style widget.textbox :placeholder :Password
      Space $ {} :height 20
      div ({} :style widget.barFromRight)
        button ({} :style widget.button :onClick @onSubmit) :Submit

  :styleRoot $ {}
    :display :flex
    :flexDirection :column

