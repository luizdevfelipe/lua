larguraTela = love.graphics.getWidth()
alturaTela = love.graphics.getHeight()

function love.load()
  -- Nave
  imgNave = love.graphics.newImage("imagens/nave.png")  
  nave = {
      posX = larguraTela / 2,
      posY = alturaTela / 2,
      velocidade = 200
  }
  -- Tiros
  atira = true
  delayTiro = 0.1
  tempoAteAtirar = delayTiro
  tiros = {}
  imgTiro = love.graphics.newImage("imagens/projetil.png")
end

function love.update(dt)
  movimentos(dt)
  atirar(dt)
end

function atirar(dt)
  tempoAteAtirar = tempoAteAtirar - (1 * dt)
  if tempoAteAtirar < 0 then
    atira = true
  end
  
  if love.keyboard.isDown("space") and atira then
    novoTiro = {x = nave.posX, y = nave.posY, img = imgTiro}
    table.insert(tiros, novoTiro)
    atira = false
    tempoAteAtirar = delayTiro
  end
  for i, tiro in ipairs(tiros) do
    tiro.y = tiro.y - 500 * dt
    if tiro.y < 0 then
      table.remove(tiros, i)
    end
  end
end

function movimentos (dt)
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
  -- Nave
  love.graphics.draw(imgNave, nave.posX, nave.posY, 0, 1, 1, imgNave:getWidth() / 2, imgNave:getHeight() / 2)
  -- Nave
  
  -- Tiros
    for i, tiro in ipairs(tiros) do
      love.graphics.draw(tiro.img, tiro.x, tiro.y, 0, 1, 1, imgTiro:getWidth() / 2, imgTiro:getHeight())
    end
  -- Tiros
  
end