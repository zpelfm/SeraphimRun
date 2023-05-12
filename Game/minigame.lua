minigame = {}

require 'Game.src.enemy'
local player = require 'Game.src.player'
local timer = require 'Game.src.timer'
require 'Game.src.game'

local state = 1
local time = 30

char = {}
enemies = {}

function minigame.load()
  char = player.load()
  timer.set(time)
  gameStart()
end

function minigame.draw()
  gameDraw()
  enemyDraw()
  updateAni(char.ani[state], tick.dt)
  drawAni(char.ani[state], char.x[char.track], char.y, 1, 1)
  timer.draw()
end

function minigame.update(dt)
  gameUpdate(dt)
end

function enemy_collide()
  local bool = false
  local c = {char.x[char.track] - 10, char.y - 30, 20, 30}
  for i, e in ipairs(enemies) do
    local enemyTB = {e.x-30, e.y-10, 60, 10}
    if checkCollision(c, enemyTB) then bool = true break end
  end
  return bool
end














function gamekey(key)
  local function move(i)
    if char.track + i <= 3 and
       char.track + i >= 1 then
    char.track = char.track + i
    end
  end


  if key == "left" then move(-1)
  elseif key == "right" then move(1) end
  if key == "z" then playerUse("skill") end
end




return minigame
