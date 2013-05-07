testml = require("./lib/TestML")

class TestMLBridge
  uppercase: (s) ->
    s.to-upper-case!
  
  lowercase: (s) ->
    s.to-lower-case!

  combine: (...args) ->
    fold (++), "", args

  f1: (n) ->
    n * 42 + n

  f2: (n) ->
    n ^ 2 + n
