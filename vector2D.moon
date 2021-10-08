sqrt, cos, sin, atan2 = math.sqrt, math.cos, math.sin, math.atan2
min, max = math.min, math.max

class vector2D
  new: (x = 0, y = 0) =>
    assert('number' == type(x) and 'number' == type(y),
      'x and y must be numbers.')
    @x = x
    @y = y
    
  @zero: ->
    return vector2D!

  @isvector: (v) ->
    v.__class == vector2D
  
  clone: =>
    vector2D @x, @y
  
  unpack: =>
    @x, @y

  __tostring: =>
    "("..tonumber(@x)..","..tonumber(@y)..")"
  
  __add: (a, b) ->
    assert( vector2D.isvector(a) and vector2D.isvector(b), "Wrong argument types <vector2D> expected. [Add]" )
    vector2D a.x+b.x, a.y+b.y
  
  __sub: (a, b) ->
    assert( vector2D.isvector(a) and vector2D.isvector(b), "Wrong argument types <vector2D> expected. [Sub]" )
    vector2D a.x-b.x, a.y-b.y

  __mul: (a, b) ->
    if type a == 'number'
      vector2D a*b.x, a*b.y
    elseif type b == 'number'
      vector2D b*a.x, b*a.y
    else
      assert( vector2D.isvector(a) and vector2D.isvector(b), "Wrong argument types <vector2D> expected. [Mul]" )
      a.x*b.x + a.y*b.y -- Dot product

  __div: (a, b) ->
    assert( vector2D.isvector(a) and type(b) == 'number', "Wrong argument types <vector2D, number> expected. [Div]" )
    assert(b ~= 0, "Division by 0 is undefined. [Div]")
    vector2D a.x/b, a.y/b

  __eq: (a, b) ->
    a.x == b.x and a.y == b.y
    
  __lt: (a, b) ->
    a.x < b.x or (a.x == b.x and a.y < b.y)

  __le: (a, b) ->
    a.x <= b.x and a.y <= b.y

  __unm: (a) ->
    vector2D -a.x, -a.y

  len: =>
    sqrt(@x * @x + @y * @y) 

  len2: =>
    @x * @x + @y * @y

  magnitude: =>
    @len!

  overwrite: (v) =>
    assert( vector2D.isvector(v), "Wrong argument types <vector2D> expected. [Overwrite]" )
    @x = v.x
    @y = v.y

  normalize: =>
    mag = @magnitude!
    if mag ~= 0
      @overwrite self / mag

  norm: =>
    mag = @magnitude!
    if mag ~= 0
      return self / mag

  clamp: (min, max) =>
    assert( type(min) == 'number' and type(max) == 'number', "Wrong argument types <number, number> expected. [Clamp]" )
    @x = min(max(@x, min.x), max.x)
    @y = min(max(@y, min.y), max.y)

  clampX: (min, max) =>
    assert( type(min) == 'number' and type(max) == 'number', "Wrong argument types <number, number> expected. [ClampX]" )
    @x = min(max(@x, min.x), max.x)

  clampY: (min, max) =>
    assert( type(min) == 'number' and type(max) == 'number', "Wrong argument types <number, number> expected. [ClampY]" )
    @y = min(max(@y, min.y), max.y)

  parmul: (a, b) =>
    assert( vector2D.isvector(a) and vector2D.isvector(b), "Wrong argument types <vector2D> expected. [Add]" )
    vector2D a.x*b.x, a.y*b.y

  toPolar: =>
    vector2D atan2(@x, @y), @len!

  dist: (a, b) =>
    assert( vector2D.isvector(a) and vector2D.isvector(b), "Wrong argument types <vector2D> expected. [Add]" )
    dx = a.x - b.x
    dy = a.y - b.y
    sqrt(dx*dx + dy*dy)

  dist2: (a, b) =>
    assert( vector2D.isvector(a) and vector2D.isvector(b), "Wrong argument types <vector2D> expected. [Add]" )
    dx = a.x - b.x
    dy = a.y - b.y
    dx*dx + dy*dy
  
  rotate: (phi) =>
    c, s = cos(phi), sin(phi)
    @x, @y = c * @x - s * @y, s * @x + c * @y
    self

  rot: (phi) =>
    c, s = cos(phi), sin(phi)
    vector2D c * @x - s * @y, s * @x + c * @y

  perpendicular: =>
    vector2D -@y, @x

  projectOn: (v) =>
    assert( vector2D.isvector(v), "Wrong argument types <vector2D> expected. [ProjectOn]" )
    s = (@x * v.x + @y * v.y) / (v.x * v.x + v.y * v.y)
    vector2D s * v.x - @x, s * v.y - @y




vector2D