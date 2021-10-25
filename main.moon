-- Shake = assert require "Shake"
Vector2D = assert require "Vector2D"
Loader = assert require "Loader"
Input = assert require "Input"
Leak = assert require "Leak"
Tint = assert require "Tint"
moon = require "moon"
export Dump = moon.p 

with love
  .load = ->
    export input = Input!

    with input
      \bindArr { 'a': 'Oy', 
        'c': 'Oy'}

    --export shake = Shake(2, 10, 500)
    export l = Loader {
       dir: 'assets'
       processors: {
         ['png']: (image, path) ->
          print('The image path:', path)
       }
      }, true

     
    t = Tint\HSLtoRGB {0.10,0.4,0.3}

    Dump t


    Leak.report!

  .update = (dt) ->
    -- shake\update dt
    if input\pressed 'Oy'
      print "Hello"

  .draw = ->
    -- love.graphics.draw l.assets.GG, 0, 0