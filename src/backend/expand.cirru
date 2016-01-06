
var
  Immutable $ require :immutable

var
  schema $ require :../schema

= module.exports $ \ (core stateId)
  return schema.store
