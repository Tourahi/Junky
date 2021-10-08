Shake = assert require "Shake"
vector2D = assert require "vector2D"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    export shake = Shake(2, 10, 500)
    v = vector2D 1, 3
    v1 = vector2D 2, 5
    Dump (v1 / 2)

  .update = (dt) ->
    shake\update dt