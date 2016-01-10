
var
  hsl $ require :hsl
  assign $ require :object-assign

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
  :padding ":100px 20px"

= exports.formEntry $ {}
  :display :flex
  :flexDirection :row
  :marginBottom :10px
  :alignItems :center

= exports.formProperty $ {}
  :width :200px

= exports.formValue $ {}
  :flex 1

= exports.barFromRight $ {}
  :display :flex
  :flexDirection :row
  :justifyContent :flex-end

= exports.rowCard $ {}
  :display :flex
  :flexDirection :row
  :padding ":20px"

= exports.columnCard $ {}
  :display :flex
  :flexDirection :column
  :padding ":20px"

= exports.mainLayout $ assign ({}) exports.fullscreen
  {}
    :display :flex
    :flexDirection :row
    :alignItems :strech

= exports.pageContainer $ {}
  :flex 1
  :padding :20px
  :overflowY :auto

= exports.thriftyContainer $ {}
  :flex 1
  :overflow :auto
  :display :flex
  :alignItems :strech

= exports.tallDivision $ {}
  :flex 1
  :border $ + ":1px solid " (hsl 0 0 80)

= exports.column $ {}
  :display :flex
  :flexDirection :column

= exports.row $ {}
  :display :flex
  :flexDirection :row

= exports.topBar $ {}
  :padding ":0 10px"
  :display :flex
  :flexDirection :row
