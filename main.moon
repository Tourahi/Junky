-- Shake = assert require "Shake"
Vector2D = assert require "Vector2D"
ss = assert require "Point"
Point = ss.Point
Loader = assert require "Loader"
Input = assert require "Input"
Leak = assert require "Leak"
Leakk = assert require "Leak_v2"
Tint = assert require "Tint"
DGraph = assert require "DGraph"
moon = require "moon"
export Dump = moon.p

export class PointV
  new: (x, y) =>
    @x = x
    @y = y

  getX: =>
    @x

  getY: =>
    @y

  @right: ->
    return Point 1, 0


lol = ->
  points = PointV 10, 20
  amine = "lll"
  Leakk.report 0

with love
  .load = ->
    export input = Input!

    export point = PointV 10, 20

    print "POINTTT : "
    print point

    export fpsGraph = DGraph 'fps', 50, 50

    --Dump Point\right!

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

    --Dump getfenv 1


    --Leakk.report!

    -- Leak.report!


    print input.__class.__name
    --Leakk.countAll nil, input

  .update = (dt) ->
    -- shake\update dt
    fpsGraph\update dt
    if input\pressed 'Oy'
      print "Hello"

  .draw = ->
    fpsGraph\draw!
    -- love.graphics.draw l.assets.GG, 0, 0
