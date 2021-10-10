-- Assets loader
-- Based on cargo.lua

la, lf, lg = love.audio, love.filesystem, love.graphics

newSound = (path) ->
  assert type(path) == 'string', "The path must be a <string>. [newSound]"
  info = lf.getInfo path, 'file'
  la.newSource path, (info and info.size and info.size < 5e5) and 'static' or 'stream'

newFont = (path) ->
  assert type(path) == 'string', "The path must be a <string>. [newFont]"
  return (size) ->
    lg.newFont path, size

loadFile = (path) ->
  assert type(path) == 'string', "The path must be a <string>. [loadFile]"
  lf.load(path)!

tmerge = (target = nil, src = nil, ...) ->
  if target == nil or src == nil
    return target
  for k, v in pairs(src) do target[k] = v
  tmerge target, ...

loaders = {
  lua = lf and loadFile
  png = lg and lg.newImage
  jpg = lg and lg.newImage
  dds = lg and lg.newImage
  ogv = lg and lg.newVideo
  glsl = lg and lg.newShader
  mp3 = la and newSound
  ogg = la and newSound
  wav = la and newSound
  flac = la and newSound
  txt = lf and lf.read
  ttf = lg and newFont
  otf = lg and newFont
  fnt = lg and lg.newFont
}

class Loader
  -- c: config
  new: (c = nil) =>
    if type(c) == 'string'
      config = { dir = c }

