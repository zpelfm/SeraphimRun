function getImg(filename)
  local img = lgN('ImagePacks/'..filename..'.png')
  return img
end

function findKey(tab, val)
    for key, value in next, tab do if (value == val) then return key end end
end

function copy(original)
	local c = {}
	for key, value in pairs(original) do
		c[key] = value
	end
	return c
end


require 'Game.data'
require 'Game.src'
require 'Game.minigame'
require 'Game.page'
require 'Game.sound'


function drawWindow()
  lg.draw(getImg('window'))
end

function minigame_keypressed(key)
	--if key == "space" and pageName == "minigame_main" then loadPage(3) end
	--if pageName == "minigame_play" then gamekey(key) end
end
