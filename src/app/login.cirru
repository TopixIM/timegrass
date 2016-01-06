
var
  React $ require :react

var
  widget $ require :../styles/widget

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input button) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-login

  :propTypes $ {}
    :dispatch React.PropTypes.func

  :getInitialState $ \ ()
    {}
      :name :
      :password :

  :onNameChange $ \ (event)
    @setState $ {} :name event.target.value

  :onPasswordChange $ \ (event)
    @setState $ {} :password event.target.value

  :render $ \ ()
    div ({} :className :app-login :style @styleRoot)
      div ({} :style widget.guideTitle) ":Log in"
      Space $ {} :height 40
      input $ {} :type :text :onChange @onNameChange :value @state.name :style widget.textbox :placeholder :Name
      Space $ {} :height 10
      input $ {} :type :password :onChange @onPasswordChange :value @state.password :style widget.textbox :placeholder :Password
      Space $ {} :height 20
      div ({} :style widget.barFromRight)
        button ({} :style widget.button) :Submit

  :styleRoot $ {}
    :display :flex
    :flexDirection :column
