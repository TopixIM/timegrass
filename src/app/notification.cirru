
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :notification

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired
    :notification
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :onClick $ \ (event)
    @props.dispatch :notification/read (@props.notification.get :id)

  :render $ \ ()
    var
      type $ @props.notification.get :type
    div ({} :style (@styleRoot type @props.index) :onClick @onClick)
      @props.notification.get :text

  :styleRoot $ \ (type index)
    {}
      :backgroundColor $ case type
        :warning $ hsl 30 80 70
        :error $ hsl 0 80 50
        :info $ hsl 200 80 50
        else $ hsl 0 0 70
      :height :40px
      :lineHeight :40px
      :width :300px
      :position :absolute
      :right 0
      :top $ * 46 index
      :zIndex 100
      :padding ":0 20px"
      :color :white
      :fontFamily ":Verdana"
      :cursor :pointer
