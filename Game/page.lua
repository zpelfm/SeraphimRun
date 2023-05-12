local page = {id, name, sprite, ui}
local map = require 'Game.map'

function page.load(n)

  pageName = getData(n)
  if pageName == "minigame_main" then
    minigame.load()
    page.name = pageName
    page.id = n

    --page.ui = getUI(page.name)

    for i, v in ipairs(page.ui) do
      setClickBox(i, page.ui[i][2], page.ui[i][3], page.ui[i][4], page.ui[i][5])
    end
    page.sprite = getSprite(page.name)
    map.load(page.name)
    playSound(page.name, true)
  else clear_system() playSound(pageName, false) end
  return page.name
end



function page.update(dt)
  if pageName == "seria" then upSound(tick.dt)
  else
    minigame.update(dt)
  end
end


function page.draw()
  if pageName == "seria" then
    map.draw()
    for i, v in ipairs(page.sprite) do
      updateAni(page.sprite[i][1], tick.dt)
      if page.sprite[i].hovered then drawAni(page.sprite[i][1], 100, 100, 1, 1) end
      drawAni(page.sprite[i][1], page.sprite[i][2], page.sprite[i][3], 1, 1)
    end

    for i, v in ipairs(page.ui) do lg.draw(page.ui[i][1], page.ui[i][2], page.ui[i][3])end
  else
    minigame.draw()
  end
end



function page.name()
  return page.name
end

return page
