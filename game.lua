local game = {}

function game:new()

end

function game:start()
  player:start()
  monster:start()
end

function game:update(dt)
  monster:update(dt)
  player:update(dt)
end


function game:draw()
  monster:drawFront(player.posY + player.height)
  player:draw()
  monster:drawBack(player.posY + player.height)
end


return game
