Signal = assert require "Signal"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    signal = Signal\getInstance!
    signal\addSignals 'hello', 'hebbo', 'hesso'
    f = signal\bindPattern '^he.*', -> print("boo")
    signal\emitPattern '^he.*'
    Dump signal.signals
    signal\unbindPattern '^he.*', f
    Dump signal.signals


    -- booRef = signal\bind 'hello', -> print("boo")
    -- signal\unbind 'hello', booRef
    -- signal\emit 'hello'
    -- signal\drop 'hello'
    