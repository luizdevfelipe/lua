function love.load()
  rect = {
      x = 100,
      y = 100,
      width = 100,
      height = 100,
      dragging = {
          active = false,
          distX = 0,
          distY = 0
      }
      
  }
end

function love.update(dt)
  if rect.dragging.active then 
    rect.x = love.mouse.getX() - rect.dragging.distX
    rect.y = love.mouse.getY() - rect.dragging.distY
  end
end

function love.draw()
  love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
end

function love.mousepressed(x, y, button, isTouch)
  if button == 1 and x > rect.x and x < rect.x + rect.width and y > rect.y and y < rect.y + rect.height then
    rect.dragging.active = true
    rect.dragging.distX = x - rect.x
    rect.dragging.distY = y - rect.y
  end
end

function love.mousereleased(x, y, button)
  if button == 1 then
    rect.dragging.active = false    
  end
end