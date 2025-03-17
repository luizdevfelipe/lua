function love.load()
  texto = ""
end

function love.update()
  
end

function love.draw()
  love.graphics.print(texto)
end

function love.keypressed(key)
  texto = love.mouse.isGrabbed() and "Cursor solto!" or "Cursor preso na janela!"
  if key == "tab" then
    local state = not love.mouse.isGrabbed()
    love.mouse.setGrabbed(state)
  end
end