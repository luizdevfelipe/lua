posX = 250
posY = 250
angulo = 0
tam = 0.2
origem = 256

function love.load()
  image = love.graphics.newImage("imagens/gitprofile.png")
  love.mouse.setVisible(false)
end

function love.update( dt )
  if (love.keyboard.isDown("left")) then
    posX = posX - 100 * dt
    angulo = angulo - dt * 1.5
  end
  if (love.keyboard.isDown("right")) then
    posX = posX + 100 * dt
    angulo = angulo + dt * 1.5
  end
end

function love.draw()
  rotacao = angulo
  
  love.graphics.draw(image, posX, posY, rotacao, tam, tam, origem, origem)
end