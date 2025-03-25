function love.load()
  px = 350
  py = 300
  mensagem = "Hello, World!"
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.setColor(0, 0, 0)
  love.mouse.setVisible(false)
end

function love.update(dt)
  if love.mouse.isDown("1") then
    mensagem = "<---"
  elseif love.mouse.isDown("2") then
    mensagem = "--->"
  else
    mensagem = "Hello, World!"
  end  
  
  px = love.mouse.getX()
  py = love.mouse.getY()
  mensagem = mensagem .. " (" .. px .. "," .. py .. ")" 
end

function love.draw()
  love.graphics.print(mensagem, px, py)
end