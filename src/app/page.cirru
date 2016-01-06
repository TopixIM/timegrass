
var
  hsl $ require :hsl
  React $ require :react

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :render $ \ ()
    div ({} :style @styleRoot)
      div ({} :style @styleBody)
        div ({} :style @styleHeader)
        div ({} :style @styleContent)

  :styleRoot $ {}
    :position :absolute
    :width :100%
    :height :100%
    :display :flex
    :flexDirection :row
    :alignItems :stretch

  :styleBody $ {}

  :styleHeader $ {}

  :styleContent $ {}
