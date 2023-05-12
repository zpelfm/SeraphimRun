local map = {}

require 'Game.src.road'

function map.load(name)
  map.name = name
  map.img, map.light = getMap(name)
  map.x, map.y = g_canvas.x, g_canvas.y
end

function map.update(dt)
end

function map.draw()
  lg.draw(map.img, map.x, map.y)
end


return map
