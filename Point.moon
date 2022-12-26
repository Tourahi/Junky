
boo = (Leak) ->
  Leak.report 3


class Point
  new: (x, y) =>
    @x = x
    @y = y

  getX: =>
    @x

  getY: =>
    @y

  -- @right: ->
  --   return Point 1, 0


{:Point, :boo}
