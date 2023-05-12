
--local sg = require 'Game.src.game'
local skill = require 'Game.src.skill'

local bgm = love.audio.newSource('Music/bgm_minigame_play.ogg', "stream")
	bgm:setLooping(true)
	bgm:setPitch(1.2)

function bgmList(n) --n: number
  if n == 1 then bgm:setVolume(0.3) bgm:play() else bgm:stop() end
end

function finish(a)
	if a == "win" then bgm:setVolume(0.15) else bgmList(0) end
	reset()
end

function reset()
	enemyReset() playerReset()
end









--function checkCollision(e)
--	local a = {
--		left = e.posX - (e.img:getWidth() / 8) * e.scale,
--		right = e.posX + (e.img:getWidth() / 8) * e.scale
--	}

--	local b = {
--		left = playerPoint.x[playerTrack]- 50,
--		right = playerPoint.x[playerTrack]+ 50
--	}

--	if a.right > b.left and a.left < b.right then return true else return false end
--end
