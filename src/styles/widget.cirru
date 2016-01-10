
var
  hsl $ require :hsl
  assign $ require :object-assign

= exports.textbox $ {}
  :fontSize 14
  :lineHeight :30px
  :width :300px
  :padding ":0 10px"
  :outline :none

= exports.button $ {}
  :lineHeight :30px
  :height :30px
  :borderRadius :15px
  :color :white
  :backgroundColor (hsl 200 60 40)
  :border :none
  :padding ":0 20px"
  :cursor :pointer
  :fontFamily ":Verdana"

= exports.minorButton $ {}
  :lineHeight :26px
  :height :26px
  :borderRadius 13
  :border $ + ":1px solid " (hsl 0 0 80)
  :padding ":0 16px"
  :fontSize :14px
  :cursor :pointer
  :backgroundColor $ hsl 0 0 97
  :color $ hsl 0 0 40

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

= exports.inlineTitle $ {}
  :fontSize :16px
  :lineHeight :32px
  :fontFamily ":Helvetica Neue Light, Century Gothic"
  :fontWeight 300
  :margin ":0 20px"
  :color $ hsl 0 0 50
  :cursor :pointer

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

= exports.ticket $ {}
  :padding ":0 20px"
  :backgroundColor $ hsl 0 0 90
  :lineHeight :40px
  :marginBottom :10px
  :cursor :pointer
