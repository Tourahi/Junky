
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


vector2D