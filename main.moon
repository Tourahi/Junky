Shake = assert require "Shake"
vector2D = assert require "vector2D"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    export shake = Shake(2, 10, 500)
    v = vector2D 1, 3
    v1 = vector2D 2, 5
    print v1\len!
    Dump (v1)
    v1\normalize!
    -- Dump (normV1\magnitude!)
    Dump (v1)
    print v1\len!

  .update = (dt) ->
    shake\update dt