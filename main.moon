Shake = assert require "Shake"
vector2D = assert require "vector2D"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    export shake = Shake(2, 10, 500)
    v = vector2D.random!
    print v, v\magnitude!

  .update = (dt) ->
    shake\update dt