
var
  hsl $ require :hsl

= exports.fullscreen $ {}
  :position :absolute
  :width :100%
  :height :100%
  :top 0
  :left 0

= exports.sideBar $ {}
  :width :240px
  :backgroundColor $ hsl 0 0 90
  :display :flex
  :flexDirection :column
  :alignItems :flex-end
  :padding ":40px 20px"
