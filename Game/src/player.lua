local player = {
	img = lgN("ImagePacks/sprites/minigame_play/player.png"),
	y = g_screen.y + g_screen.h * 9/10,
	track = 2,
	skill = 3
}

local pState = {{"", 1 ,f = 6}, {"_skill", 2, f = 20}}
local pAni = {}
	for i, v in ipairs(pState) do
		pAni[i] = newAnimation(lgN("ImagePacks/sprites/minigame_play/player"..v[1]..'.png'), v.f, v[2])
	end



function player.load()
	local pload =
	{ani = pAni, x = {1/5, 1/2, 4/5}, y = player.y, track = 2, skill = 3}
	for i, v in ipairs(pload.x) do
		pload.x[i] = v * g_screen.w + g_screen.x
	end
	return pload
end


function playerSet(state)
	player.img = lgN("ImagePacks/sprites/minigame_play/player"..pState[state][1]..'.png')
	player.ani = state
	player.track = 2

	if state == 2 then player.skill = player.skill - 1 end
end

function playerUse(type)
	if type == "skill" and player.skill > 0 then playerSet(2) end
end

return player
