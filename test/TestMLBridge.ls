testml = require("./lib/TestML")

class TestMLBridge
  uppercase: (string_) ->
    string_.to-upper-case!
  
  lowercase: (string_) ->
    string_.to-lower-case!

  combine: (...args) ->
    fold (++), "", args

  f1: (num) ->
    num * 42 + num

  f2: (num) ->
    num ^ 2 + num
