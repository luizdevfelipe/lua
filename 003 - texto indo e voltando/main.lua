function love.load()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.setColor(0, 0, 0)
  x = 0
  y = 300
  volta = false
end

function love.update(dt)
  if x < 720 and not volta then
    x = x + 200*dt   
  else
    volta = true
  end
  
  if x > 0 and volta then
    x = x - 200*dt
  else
    volta = false
  end  
end

function love.draw()
  love.graphics.print("Hello, World!", x, y)
end