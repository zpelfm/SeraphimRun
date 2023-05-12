local map = 'ImagePacks/map/minigame_play/t'

local rn = 1
local mapChangeTime = 0
local rimg = {}

for i=1, 8 do
	rimg[i] = lgN(map..i..'.png')
end

function drawRoad()
	local road = rimg[rn]
	mapChangeTime = mapChangeTime + tick.dt
	if mapChangeTime >= 0.025 then
		mapChangeTime = 0
	  rn = rn + 1
	end
	if rn > 8 then rn = 1 end
	lg.draw(road, g_screen.x + (g_screen.w - road:getWidth())/2, g_screen.y)
end
