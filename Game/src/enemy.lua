local vY = g_screen.y + 104

local enemy = {timer = 0, gh = 90, dir = 1}

function spawn()
  enemySpawn("N", math.random(2))
end



--function enemyTrack(w) return {g_screen.w / 2 - w/3 , g_screen.w / 2, g_screen.w / 2 + w/3} end
--function enemyReset() for i, e in ipairs(enemies) do enemies[i] = nil end end


function enemySpawn(t, rand)
  local e = copy(enemy)
    e.track = math.random(3)
    e.x, e.y = enemyPos(e)
    e.img = lgN('ImagePacks/sprites/minigame_play/enemy/'..t..'.png')
    e.ani = newAnimation(e.img, 4, 0.8)
  table.insert(enemies, 1, e)
end

function enemyDraw(BorF)
  for i, e in ipairs(enemies) do
    updateAni(e.ani, tick.dt)
    e.timer = e.timer + tick.dt * 3
    e.gh = e.gh + e.timer

    e.x, e.y = enemyPos(e)
    drawAni(e.ani, e.x, e.y,((e.gh * 9/4 )*1/6) / (e.img:getWidth()/4), e.dir)
  end
end


function enemyPos(e)
  local function eXpos(track, gh)
    local w = gh*9/4
    local exLine = {1/3, 0, -1/3}
    return exLine[track] * w + seria.w/2
  end
  return eXpos(e.track, e.gh), vY + e.gh
end
