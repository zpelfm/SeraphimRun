local timer = {bg = getImg('ui/timer'), time = 0, remain = 0, spawn = 0}
  timer.x1 = (g_screen.w - timer.bg:getWidth()) / 2
  timer.y1 = g_screen.y + g_screen.h * 1/5

  timer.x2 = timer.x1 + timer.bg:getWidth() * 0.02
  timer.y2 = timer.y1 + timer.bg:getHeight() * 0.35
  timer.w = timer.bg:getWidth() * 0.96
  timer.h = timer.bg:getHeight() * 0.3

function timer.set(t)
  timer.time, timer.remain = t, t
end

local function gauge(per)
  lg.setColor(1,1,1,.3)
  lg.rectangle("fill", timer.x2, timer.y2, timer.w, timer.h)
  lg.setColor(1,1,1)
  lg.rectangle("fill", timer.x2, timer.y2, timer.w * per, timer.h)
  --lg.rectangle("fill")
end

function timer.draw()

  timer.remain = timer.remain - tick.dt
  timer.spawn = timer.spawn + tick.dt
  if timer.spawn >= 2 then spawn() timer.spawn = 0 end

  --lg.draw(timer.bg, timer.x1, timer.y1)
  --gauge((timer.time - timer.remain) / timer.time)
end

return timer
