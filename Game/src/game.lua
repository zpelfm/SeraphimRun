setTime = 40
leftTime = setTime
local remainingTime, timerW = 0, 0

local timerbar = {img = getImg('ui/timer')}
	timerbar.x = (g_screen.w - timerbar.img:getWidth()) / 2
	timerbar.y = g_screen.h * (1/5)

local gauge = {
	w = timerbar.img:getWidth() * 0.96,
	h = timerbar.img:getHeight() * 0.3}
	gauge.x = (g_screen.w - gauge.w) / 2
	gauge.y = timerbar.y + (timerbar.img:getHeight() - gauge.h) / 2


local g = {img = getImg("sprites/minigame_play/goal"), x = g_screen.w/2, h= 1, speed = 0}
g.img:setFilter("linear", "nearest")

local back = {img = getImg("map/minigame_play/bg"), x = g_screen.w/2, h= 1, speed = 0}
back.img:setFilter("linear", "nearest")


function gameDraw() --Draw gauge
	if remainingTime <= 2.8 then goal("draw") end
	drawTimer()
 	--enemyDraw("B") playerDraw() enemyDraw("F")
end


local spawnTime = {delay = 1, timer = 0, event = 0, etimer = 3}

function gameUpdate(dt) --update gauge
	if pageName == "play" then leftTime = goTimer(dt)
		mapUpdate(dt)
		if remainingTime <= 4 then goal("update", dt)
			if g.h >= 260 then loadPage("win") end
		else spawnTime.timer = spawnTime.timer + dt
			if spawnTime.timer >= spawnTime.delay then spawn() end
		end
	else leftTime = setTime end

	-- enemyUpdate(dt) playerUpdate(dt)
end

function gameStart()
	bgmList(1)
	remainingTime = setTime
	spawnTime.delay = math.random(12,15) * 0.1
	spawnTime.etimer = math.random(3,5)
	g.h = 50 g.speed = 0
	getSkill = 5
end

function drawTimer()
	love.graphics.draw(timerbar.img, timerbar.x, timerbar.y)
	love.graphics.setColor(1,1,1,.3)
	love.graphics.rectangle("fill", gauge.x, gauge.y, gauge.w, gauge.h)
	love.graphics.setColor(1,1,1)
	love.graphics.rectangle("fill", gauge.x, gauge.y, timerW, gauge.h)
end

function goTimer(dt)

	remainingTime = remainingTime - dt
	timerW = (setTime - remainingTime) * gauge.w / setTime
	return math.ceil(remainingTime)
end

function goal(str, dt)
  if str == "update" then
    g.speed = g.speed + 0.67
    g.h = g.h + (dt*g.speed)
    g.w = g.h * (9/4)
    g.scale = g.w / 720
    g.posX = g.x - (g.img:getWidth() * g.scale) / 2
    g.posY = 108 + g.h - (g.img:getHeight() * g.scale)
  elseif str == "draw" then
    love.graphics.draw(g.img, g.posX, g.posY, nil, g.scale)
  end
end

function spawn()
	if spawnTime.event >= spawnTime.etimer then enemySpawn("S", 1) spawnTime.event = 0 spawnTime.etimer = math.random(3,5)
	else enemySpawn("N", math.random(2)) spawnTime.event = spawnTime.event + 1 end
 	spawnTime.timer = 0
	spawnTime.delay = math.random(12,15) * 0.1
end
