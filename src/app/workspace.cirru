
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
    @props.dispatch :router/home

  :render $ \ ()
    div ({} :style @styleRoot)
      div ({} :style layout.sideBar)
        div ({} :style widget.entryTitle :onClick @onNavHome) ":Home"
        div ({} :style @styleHrWithSpace)
        div ({} :style widget.entryTitle) ":By time"
        div ({} :style @styleHrWithSpace)
        div ({} :style widget.entryTitle) ":By urgency"

  :styleRoot $ assign ({}) layout.fullscreen
    {}
      :display :flex
      :flexDirection :row

  :styleHrWithSpace $ assign ({}) widget.horizontalRule
    {}
      :backgroundColor $ hsl 0 0 80
      :margin ":20px 0"
      :alignSelf :flex-end
