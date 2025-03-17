larguraTela = love.graphics.getWidth()
alturaTela = love.graphics.getHeight()

function love.load()
  imgNave = love.graphics.newImage("imagens/nave.png")
  
  nave = {
      posX = larguraTela / 2,
      posY = alturaTela / 2,
      velocidade = 200
  }
end

function love.update(dt)
  if love.keyboard.isDown("right") and nave.posX < larguraTela - imgNave:getWidth() / 2 then
    nave.posX = nave.posX + nave.velocidade * dt
  end
  
  if love.keyboard.isDown("left") and nave.posX > 0 + imgNave:getWidth() / 2 then
    nave.posX = nave.posX - nave.velocidade * dt
  end
  
  if love.keyboard.isDown("up") and nave.posY > 0 + imgNave:getHeight() / 2 then
    nave.posY = nave.posY - nave.velocidade * dt
  end
  
  if love.keyboard.isDown("down") and nave.posY < alturaTela - imgNave:getHeight() / 2 then
    nave.posY = nave.posY + nave.velocidade * dt
  end
end

function love.draw()
  love.graphics.draw(imgNave, nave.posX, nave.posY, 0, 1, 1, imgNave:getWidth() / 2, imgNave:getHeight() / 2)
end