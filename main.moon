-- Shake = assert require "Shake"
Vector2D = assert require "Vector2D"
moon = require "moon"
export Dump = moon.p 

export loadFile = (path) ->
  assert type(path) == 'string', "The path must be a <string>. [loadFile]"
  love.filesystem.load(path)!

with love
  .load = ->
    --export shake = Shake(2, 10, 500)
    Dump loadFile "Shake.lua"
    v = Vector2D 1, 2
    v2 = Vector2D 2, 3
    v3 = v and v2
    print "v3:", v3
    print v, v\magnitude!
    print Vector2D.positiveInfinity!

  .update = (dt) ->
    -- shake\update dt