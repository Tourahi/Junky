-- Shake = assert require "Shake"
Vector2D = assert require "Vector2D"
Loader = assert require "Loader"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    --export shake = Shake(2, 10, 500)
    l = Loader 'assets'
    v = Vector2D 1, 2
    v2 = Vector2D 2, 3
    v3 = v and v2
    print "v3:", v3
    print v, v\magnitude!
    print Vector2D.positiveInfinity!

  .update = (dt) ->
    -- shake\update dt