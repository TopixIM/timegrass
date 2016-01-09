
var methods $ {}
  :user $ require :./user
  :stage $ require :./stage
  :state $ require :./state
  :router $ require :./router
  :notification $ require :./notification

var identity $ \ (x) x

= module.exports $ \ (db type data meta)
  var
    ([]~ catetory label) (type.split :/)
    collection $ or (. methods catetory) ({})
    handler $ or (. collection label) identity

  handler db data meta
