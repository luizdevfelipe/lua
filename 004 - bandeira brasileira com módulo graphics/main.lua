function love.draw()
  love.graphics.setBackgroundColor(0, 0, 0)
  
  -- retângulo
  love.graphics.setColor(0, 130, 0)
  love.graphics.rectangle("fill", 100, 100, 600, 400)
  
  -- polígono
  love.graphics.setColor(230, 230, 0)
  love.graphics.polygon("fill", 110, 300, 400, 110, 690, 300, 400, 490)
  
  -- circulo
  love.graphics.setColor(0, 0, 180)
  love.graphics.circle("fill", 400, 300, 110) 
end
