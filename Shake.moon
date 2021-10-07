import getTime from love.timer
import random from love.math
getTime = getTime
random = random


Random = (min, max) ->
    assert ('number' == type(min) and 'number' == type(max)), 
      "Parmeters must be number." 
    min, max = min or 0, max or 1
    (min > max and (random!*(min - max) + max)) or (random!*(max - min) + min)

class Shake
  -- dur : milliseconds
  new: (amp, freq, dur) =>
    @amp = amp
    @freq = freq
    @dur = dur
    sample_count = (@dur/1000) * freq
    @samples = {}
    for i = 1, sample_count
      @samples[i] = Random -1, 1

    @startTime =  getTime!*1000
    @t = 0 -- will hold the diff between the start time and the current one.
    @shaking = true

  update: (dt) =>
    @t = (getTime!*1000) - @startTime
    if @t > @dur
      @shaking = false

  getAmplitude: (t) =>
    if not t then
        if not @shaking
          return 0
        t = @t

    s = (t/1000) * @freq
    s0 = math.floor(s)
    s1 = s0 + 1
    k = @decay(t)
    return @amp*(@noise(s0) + (s - s0)*(@noise(s1) - @noise(s0)))*k

  -- Linear decay
  decay: (t) =>
    if t > @dur
      return 0
    return (@dur - t)/@dur

  noise: (s) =>
    if s >= #@samples
      return 0
    return @samples[s] or 0


Shake