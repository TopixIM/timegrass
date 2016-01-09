
var
  hsl $ require :hsl
  assign $ require :object-assign

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
  :cursor :pointer
  :fontFamily ":Verdana"

= exports.bar $ {}
  :display :flex
  :flexDirection :row

= exports.guideTitle $ {}
  :fontSize :30px
  :fontFamily ":Helvetica Neue Light, Century Gothic"
  :fontWeight 100

= exports.entryTitle $ {}
  :fontSize :24px
  :fontFamily ":Helvetica Neue Light, Century Gothic"
  :fontWeight 100
  :cursor :pointer

= exports.cardTitle $ {}
  :fontSize :18px
  :fontFamily ":Helvetica Neue Light, Century Gothic"
  :fontWeight 100
  :marginBottom :36px

= exports.horizontalRule $ {}
  :height 1
  :backgroundColor (hsl 0 0 90)
  :width :40%
  :alignSelf :center

= exports.verticalRule $ {}
  :width 1
  :backgroundColor (hsl 0 0 90)
  :height :40%
  :alignSelf :center

= exports.cardOnWhite $ {}
  :backgroundColor $ hsl 0 0 90
  :color $ hsl 0 0 20
  :fontFamily ":Verdana"
  :padding :20px
  :margin ":20px 20px"

= exports.entryHr $ assign ({}) exports.horizontalRule
  {}
    :backgroundColor (hsl 0 0 80)
    :alignSelf :flex-end
    :margin ":20px 0"
    :flexShrink 0
