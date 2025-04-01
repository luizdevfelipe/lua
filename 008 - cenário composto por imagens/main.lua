function love.load()
  screenWidth = love.graphics.getWidth()
  screenHeight = love.graphics.getHeight()
  
  nuvemImg = love.graphics.newImage("mario_cloud.png")
  chaoImg = love.graphics.newImage("mario_ground.png")
  canoImg = love.graphics.newImage("mario_pipe.png")
  montanhaImg = love.graphics.newImage("mario_background.png")
  
  nuvemPx = 300
  nuvemPy = 100
end

function love.update(dt)
  if love.keyboard.isDown("left") then
    nuvemPx = nuvemPx - 150 * dt
    if nuvemPx < - nuvemImg:getWidth() then
      nuvemPx = screenWidth + nuvemImg:getWidth() / 2
    end
  end
  if love.keyboard.isDown("right") then
    nuvemPx = nuvemPx + 150 * dt
    if nuvemPx > screenWidth + nuvemImg:getWidth() then
      nuvemPx = - nuvemImg:getWidth()
    end
  end
end

function love.draw()
  love.graphics.setBackgroundColor(122, 183, 228)
  
  -- Desenho das montanhas
  posX = 0
  for i = 0, screenWidth / montanhaImg:getWidth(), 1 do
    love.graphics.draw(montanhaImg, posX, screenHeight - montanhaImg:getHeight() - chaoImg:getHeight())
    posX = posX + montanhaImg:getWidth()
  end
  
  -- Desenhando o cano
  love.graphics.draw(canoImg, screenWidth - montanhaImg:getWidth(), screenHeight - chaoImg:getHeight() - 65)
  
  
  -- Desenho do chao
  posX = 0
  for i = 0, screenWidth / chaoImg:getWidth(), 1 do    
    love.graphics.draw(chaoImg, posX , screenHeight - chaoImg:getHeight())
    posX = posX + chaoImg:getWidth()
  end
    
  -- Desenho da nuvem
  love.graphics.draw(nuvemImg, nuvemPx, nuvemPy, 0, 1, 1, nuvemImg:getWidth() / 2, nuvemImg:getHeight() / 2)
end