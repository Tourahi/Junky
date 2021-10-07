Shake = assert require "Shake"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    export shake = Shake(2, 10, 500)

  .update = (dt) ->
    shake\update dt