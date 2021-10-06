-- singleton
class Signal 
  @instance = nil
  new: =>
    @signals = {}

  getInstance: =>
    if @@instance == nil
     @@instance = Signal!
    @@instance

  register: (s, f) =>
    if @signals[s] == nil
      @signals[s] = {}
      @signals[s][f] = {}
    else
      @signals[s][f] = {}

  -- bind a function to a signal
  bind: (s, f) =>
    @register s, f      
    @signals[s][f] = f
    return f

  -- emit a signal
  emit: (s, ...) =>
    assert @signals[s] ~= nil, "Signal "..s.." is not registred."
    for f in pairs @signals[s]
      f ...

  -- emit a signal to a func referance
  -- basically only that function will react to the signal emission.
  emitRef: (s, ref, ...) =>
    assert @signals[s] ~= nil, "Signal "..s.." is not registred."
    for f in pairs @signals[s]
      if f == ref 
        f ...

  -- unbind a function from a signal 
  unbind: (s, ...)=>
    assert @signals[s] ~= nil, "Signal "..s.." is not registred."
    f = {...}
    for i = 1, select '#', ...
      ref = f[i]
      @signals[s][ref] = nil

  clear: (s) =>
    assert @signals[s] ~= nil, "Signal "..s.." is not registred."
    @signals[s] = {}

  drop: (s) =>
    assert @signals[s] ~= nil, "Signal "..s.." is not registred."
    @signals[s] = nil    


Signal