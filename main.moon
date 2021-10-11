-- Shake = assert require "Shake"
Vector2D = assert require "Vector2D"
Loader = assert require "Loader"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    --export shake = Shake(2, 10, 500)
    export l = Loader {
       dir: 'assets'
       processors: {
         ['png']: (image, path) ->
          -- print('The image path:', path)
       }
      }, true, 2


  .update = (dt) ->
    -- shake\update dt

  .draw = ->
    -- love.graphics.draw l.assets.GG, 0, 0