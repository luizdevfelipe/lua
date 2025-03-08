volume = 0.5
textoVolume = ""

function love.load()
  som = love.audio.newSource("som/music.mp3")
  imgPlay  = love.graphics.newImage("imagens/play.png")
  imgPause = love.graphics.newImage("imagens/pause.png")
  imgStop  = love.graphics.newImage("imagens/stop.png")
end

function love.update(dt)
  som:setVolume(volume)
  textoVolume = volume
end

function love.draw()
  love.graphics.setColor(0,0,0)
  love.graphics.print("Volume: " .. textoVolume, 50, 20)
  love.graphics.setColor(255, 255, 255)
  love.graphics.setBackgroundColor(255, 255, 255)
  
  love.graphics.draw(imgPlay, 100, 50, 0)
  love.graphics.draw(imgPause, 300, 50, 0)
  love.graphics.draw(imgStop, 500, 50, 0)
end

function love.mousepressed(mx, my, button)
  if button == 1 and mx >= 100 and mx < 100 + imgPlay:getWidth() and my >= 50 and my < 50 + imgPlay:getHeight() then
    som:play()
  end
  if button == 1 and mx >= 300 and mx < 300 + imgPause:getWidth() and my >= 50 and my < 50 + imgPause:getHeight() then
    som:pause()
  end
  if button == 1 and mx >= 500 and mx < 500 + imgStop:getWidth() and my >= 50 and my < 50 + imgStop:getHeight() then
    som:stop()
  end
end

function love.wheelmoved(x, y) 
  if y > 0 and volume < 0.9 then 
    volume = volume + 0.1
  elseif y < 0 and volume > 0.2 then
    volume = volume - 0.1
  end
end

