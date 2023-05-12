local skill = {}

local function path(name)
return love.audio.newSource('SoundPacks/skill/'..name..'.ogg', 'static') end

local function endSkill() skill = {} playerSet("run") end


local function skillSound(st)
  local es = {
    {audio = path("on"), vol = 0.9, pit = 1.1},
    {audio = path("effect"), vol = 0.8, pit= 1.5},
    {audio = path("voice_"..math.random(1,2)), vol = 0.75, pit = 1.2}}

  local function play(audio, v, p) audio:setVolume(v) audio:setPitch(p) audio:play() end

  if st == "play" then
    for i, v in ipairs(es) do play(v.audio, v.vol, v.pit) end
  elseif st == "end" then es[1].audio:stop() play(path("end"), 0.6, 1) end
end


function allowSkill()
  local reply = false
  if pageName == "play" and #skill <= 0 and getSkill > 0 then reply = true end
  return reply
end

function useSkill()
  local skills = {count = 1, time = 0, type = "kill"}
  if allowSkill() then table.insert(skill, skills) playerSet("skill") skillSound("play") getSkill = getSkill - 1 end
end


function updateSkill(dt)
  if #skill > 0 then
    for i, s in ipairs(skill) do
      if s.count >= 20 then endSkill() elseif s.count == 10 then skillSound("end") skillEvent(s.type) end
      s.time = s.time + dt
      if s.time >= 0.1 then s.count = s.count + 1 s.time = 0 end
      s.dodge = getImg('skill/dodge/'..s.count)
      s.dodge_back = getImg('skill/dodge_back/'..s.count)
    end
  end
end


function drawSkill(pos)
  love.graphics.setBlendMode('add')
  local effectName
  for i, s in ipairs(skill) do
    if pos == "back" then effectName = s.dodge_back
    elseif pos == "front" then effectName = s.dodge end

    love.graphics.draw(effectName, skillPoint("x"), skillPoint("y"), 0, playerScale)
  end
  love.graphics.setBlendMode('alpha')
end


function skillPoint(xy)
  local sp = {x = playerPoint.x[playerTrack] - (200 * playerScale), y = playerPoint.y - (237 * playerScale)}
  return sp[xy]
end

function skillEvent(type)
  if type == "kill" then enemyDead() end
end

return skill
