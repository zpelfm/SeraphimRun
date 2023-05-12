local player = {
	sprite = lgN('ImagePacks/sprites/player.png'),
	width = 82,
	height = 118,
	grid = nil,
	image = nil,
						--트랙1 트랙2 트랙3
	pointX = {130, 300, 470},
	posX = 0,
	posY = 250,
	collideEnable = 1,
	alpha = 255,
					--기본 --최대
	track = 2
}
local function playerPoint(x) --x값을 이미지 중앙 값으로 설정할 수 있도록 조정
	local point_x = x - (player.width/2)
	return point_x
end

function player:changeAnim(type)
	if type == 1 then -- 평상시
	
	elseif type == 2 then -- 스킬
	end

end

function player:start()
	player.sprite = lgN('ImagePacks/sprites/player.png')
	player.width = 82
	player.height = 118
	player.grid = anim8.newGrid(player.width, player.height, player.sprite:getWidth(), player.sprite:getHeight(), 0,0, 1)
	player.image = anim8.newAnimation(player.grid('1-6', 1), 0.1)
						--트랙1 트랙2 트랙3
	player.pointX = {130, 300, 470}
					--기본 --최대
	player.track = 2
end

function player:update(dt)
	player.image:update(dt)
	player.posX = playerPoint(player.pointX[player.track])
	player.checkcoliison()
end

function player:draw()
	player.image:draw(player.sprite, player.posX, player.posY)
	if g_debugLine == 1 and collideEnable == 1 then
		love.graphics.rectangle("line", player.posX, player.posY, player.width, player.height)
	end
	--animation:draw("player", x, y)
end

function player:move(key)
	local now = player.track

	if key == "left" then
		now = now -1
	elseif key == "right" then
		now = now +1
	end

	if now >= 1 and now <= 3 then
		player.track = now
	end
end

function player:checkcoliison()
	if collideEnable == 1 then
		for i, v in pairs(monsters) do
			local rectL = v.posX
			local rectR = v.posX + v.width * v.scale
			local rectB = v.posY + v.height * v.scale
			local disrate = v.dis / g_trackDis

			local pRectL = player.posX
			local pRectR = pRectL + player.width
			local pRectB = player.posY + player.height

			local collision = 0
			if rectB >= pRectB and rectB - pRectB < g_monsterThick then
				if rectL > pRectR then
					collision = 0
				elseif rectR < pRectL then
					collision = 0
				else
					collision = 1
				end
			else
				collsion = 0
			end

			if collision == 1 then
				player.collision()
				break
			end
		end
	end
end

function player:collision()
	page:changepage(stat[5])
end

return player
