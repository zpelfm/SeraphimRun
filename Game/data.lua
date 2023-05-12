local data = {}
--data.page = {"minigame_main", "minigame_play", "minigame_lose", "minigame_win"}
data.sprite ={menu = "", play = "", lose = "", win = ""}
data.sound = {menu = "", play = "", lose = "", win = ""}

function getSprite(folder)
  local spath = 'ImagePacks/sprites/'..folder..'/'
  local stb = {}
  for i, v in ipairs(data.sprite[folder]) do
    png = lgN(spath..data.sprite[folder][i][1]..'.png')
    local instb = {
      newAnimation(png, data.sprite[folder][i][2], data.sprite[folder][i][3]),
      data.sprite[folder][i].x,
      data.sprite[folder][i].y
    }
    table.insert(stb, instb)
  end
  return stb
end


function getUI(folder)
  local uipath = 'ImagePacks/ui/'..folder..'/'
  local ui = copy(data.ui[folder])
    for i, v in ipairs(ui) do
      if type(ui[i][1]) =="string" then
      ui[i][1] = lgN(uipath..ui[i][1]..'.png') end
      ui[i][4] = ui[i][1]:getWidth()
      ui[i][5] = ui[i][1]:getHeight()
      ui[i][2] = ui[i][2] - ui[i][4] / 2 -- width
      ui[i][3] = ui[i][3] - ui[i][5] --height
    end
  return ui
end


function getMap(folder)
  local mpath = 'ImagePacks/map/'..folder
  return lgN(mpath..'/map.png')
end
