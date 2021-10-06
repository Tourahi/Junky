Signal = assert require "Signal"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    signal = Signal\getInstance!
    signal\bind 'hello', -> print("hello")
    booRef = signal\bind 'hello', -> print("boo")
    signal\unbind 'hello', booRef
    signal\emit 'hello'
    