
var
  hsl $ require :hsl

= exports.textbox $ {}
  :fontSize 14
  :lineHeight :30px
  :width :300px
  :padding ":0 10px"

= exports.button $ {}
  :lineHeight :30px
  :borderRadius :15px
  :color :white
  :backgroundColor (hsl 200 60 40)
  :border :none
  :padding ":0 20px"

= exports.bar $ {}
  :display :flex
  :flexDirection :row

= exports.barFromRight $ {}
  :display :flex
  :flexDirection :row
  :justifyContent :flex-end

= exports.guideTitle $ {}
  :fontSize :30px
  :fontFamily ":Helvetica Neue Light, Century Gothic"
  :fontWeight 100

= exports.horizontalRule $ {}
  :height 1
  :backgroundColor (hsl 0 0 90)

= exports.verticalRule $ {}
  :width 1
  :backgroundColor (hsl 0 0 90)
  :height :40%
  :alignSelf :center
