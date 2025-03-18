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
  -- Nave
  
  -- Tiros
  atira = true
  delayTiro = 0.1
  tempoAteAtirar = delayTiro
  tiros = {}
  imgTiro = love.graphics.newImage("imagens/projetil.png")
  -- Tiros
  
  -- Inimigo
  delayInimigo = 0.4
  tempoCriarInimigo = delayInimigo
  imgInimigo = love.graphics.newImage("imagens/inimigo.png")
  inimigos = {}
  -- Inimigo
  
  -- Vidas e Pontuação
  estaVivo = true
  pontos = 0
  -- Vidas e Pontuação
end

function love.update(dt)
  movimentos(dt)
  atirar(dt)
  inimigo(dt)
  colisoes()
  
  if not estaVivo and love.keyboard.isDown("return") then
    tiros = {}
    inimigos = {}
    tempoAteAtirar = delayTiro
    tempoCriarInimigo = delayInimigo
    
    nave.posX = larguraTela / 2
    nave.posY = alturaTela / 2
    
    pontos = 0
    estaVivo = true    
  end
end

function love.draw()
  -- Tiros
    for i, tiro in ipairs(tiros) do
      love.graphics.draw(tiro.img, tiro.x, tiro.y, 0, 1, 1, imgTiro:getWidth() / 2, imgTiro:getHeight())
    end
  -- Tiros
  -- Inimigos
    for i, inimigo in ipairs(inimigos) do
      love.graphics.draw(inimigo.img, inimigo.x, inimigo.y)
    end
  -- Inimigos
  -- Game Over e Reset
  if estaVivo then
    love.graphics.draw(imgNave, nave.posX, nave.posY, 0, 1, 1, imgNave:getWidth() / 2, imgNave:getHeight() / 2)
  else
    love.graphics.print("Aperte 'Enter' para reiniciar...", larguraTela / 3, alturaTela / 2)
  end
  -- Game Over e Reset
end

function atirar(dt)
  tempoAteAtirar = tempoAteAtirar - (1 * dt)
  if tempoAteAtirar < 0 then
    atira = true
  end
  
  if estaVivo and love.keyboard.isDown("space") and atira then
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

function inimigo(dt)
  tempoCriarInimigo = tempoCriarInimigo - 1 * dt
  if tempoCriarInimigo < 0 then
    tempoCriarInimigo = delayInimigo
    numeroAleatorio = math.random(10, love.graphics.getWidth() - imgInimigo:getWidth() / 2)
    novoInimigo = {x = numeroAleatorio, y = -imgInimigo:getHeight(), img = imgInimigo}
    table.insert(inimigos, novoInimigo)
  end
  
  for i, inimigo in ipairs(inimigos) do
    inimigo.y = inimigo.y + 200 * dt
    if inimigo.x > 850 then
      table.remove(inimigos, i)
    end
  end
end
function colisoes()
  for i, inimigo in ipairs(inimigos) do
    for j, tiro in ipairs(tiros) do
      if checarColisao(inimigo.x, inimigo.y, imgInimigo:getWidth(), imgInimigo:getHeight(), tiro.x, tiro.y, imgTiro:getWidth(), imgTiro:getHeight()) then
        table.remove(tiros, j)
        table.remove(inimigos, i)
        pontos = pontos + 1
      end
    end
    if checarColisao(inimigo.x, inimigo.y, imgInimigo:getWidth(), imgInimigo:getHeight(), nave.posX - imgNave:getWidth() / 2, nave.posY, imgNave:getWidth(), imgNave:getHeight()) and estaVivo then
      table.remove(inimigo, i)
      estaVivo = false
    end
  end
end 
function checarColisao(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end
  