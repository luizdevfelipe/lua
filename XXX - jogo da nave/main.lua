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
  delayTiro = 0.3
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
  vidas = 5
  gameOver = false
  transparencia = 0
  imgGameOver = love.graphics.newImage("imagens/game_over.png")
  -- Vidas e Pontuação
  
  -- Background
  fundo = love.graphics.newImage("imagens/fundo.png")
  fundoDois = love.graphics.newImage("imagens/fundo.png")
  
  planoDeFundo = {
      x = 0,
      y = 0,
      y2 = 0 - fundo:getHeight(),
      vel = 30
  }
  -- Background
  
  -- Fonte
  fonte = love.graphics.newFont("fonte/PressStart2P-Regular.ttf", 13)
  -- Fonte
  
  -- Sons do Jogo
  volume = 0.5
  somDoTiro = love.audio.newSource("sons/Tiro.wav", "static")
  explodeNave = love.audio.newSource("sons/ExplodeNave.wav", "static")
  explodeInimigo = love.audio.newSource("sons/ExplodeInimigo.wav", "static")
  musica = love.audio.newSource("sons/Musica.wav")
  
  somDoTiro:setVolume(volume)
  explodeNave:setVolume(volume)
  explodeInimigo:setVolume(volume)
  musica:setVolume(volume)
  
  musica:play()
  musica:setLooping(true)
  -- Sons do Jogo
  
  -- Efeitos da pontuação
  scaleX = 1
  scaleY = 1
  -- Efeitos da pontuação
  
  -- Tela Inicial
  abreTela = false
  telaInicial = love.graphics.newImage("imagens/tela_inicial.png")
  inicialX = 0
  inicialY = 0
  -- Tela Inicial
  
  -- Pause
  pausar = false
  -- Pause
end

function love.update(dt)
  if not pausar then
    movimentos(dt)
    atirar(dt)
    inimigo(dt)
    colisoes()
    reset()  
    scrollPlanoDeFundo(dt)
    efeito(dt)
    iniciaJogo(dt)
    
  end
  if gameOver then
    fimJogo(dt)
  end
end

function love.draw()
  if not gameOver then 
    -- Background
    love.graphics.draw(fundo, planoDeFundo.x, planoDeFundo.y)
    love.graphics.draw(fundo, planoDeFundo.x, planoDeFundo.y2)
    -- Background  
    
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
    
    -- Pontos na Tela
    love.graphics.setFont(fonte)
    love.graphics.print("Pontuação: ", 10, 10)
    love.graphics.print(pontos, love.graphics.getFont():getWidth("Pontuação: ") + 5, 10, 0, scaleX, scaleY)
    mostraVidas = "Vidas: " .. vidas
    love.graphics.print(mostraVidas, larguraTela - love.graphics.getFont():getWidth(mostraVidas) ,10)
    -- Pontos na Tela
  end
  -- Game Over e Reset
  if estaVivo then
    love.graphics.draw(imgNave, nave.posX, nave.posY, 0, 1, 1, imgNave:getWidth() / 2, imgNave:getHeight() / 2)
  elseif gameOver then
    love.graphics.setColor(255, 255, 255, transparencia)
    love.graphics.draw(imgGameOver, 0, 0)
  else
    love.graphics.draw(telaInicial, inicialX, inicialY)
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
    somDoTiro:stop()
    somDoTiro:play()
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
        explodeInimigo:stop()
        explodeInimigo:play()
        pontos = pontos + 1
        scaleX = 1.5
        scaleY = 1.5
      end
    end
    if checarColisao(inimigo.x, inimigo.y, imgInimigo:getWidth(), imgInimigo:getHeight(), nave.posX - imgNave:getWidth() / 2, nave.posY, imgNave:getWidth(), imgNave:getHeight()) and estaVivo then
      table.remove(inimigo, i)
      explodeNave:play()
      estaVivo = false
      abreTela = false
      vidas = vidas - 1
      if vidas < 0 then
        gameOver = true
      end
    end
  end
end 
function checarColisao(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end
function reset() 
  if not estaVivo and love.keyboard.isDown("return") then
    tiros = {}
    inimigos = {}
    tempoAteAtirar = delayTiro
    tempoCriarInimigo = delayInimigo
    
    nave.posX = larguraTela / 2
    nave.posY = alturaTela / 2
    
    pontos = 0
    abreTela = true    
  end
end
function scrollPlanoDeFundo(dt)
  planoDeFundo.y = planoDeFundo.y + planoDeFundo.vel * dt
  planoDeFundo.y2 = planoDeFundo.y2 + planoDeFundo.vel * dt
  
  if planoDeFundo.y > alturaTela then
    planoDeFundo.y = planoDeFundo.y2 - fundoDois:getHeight()
  end
  if planoDeFundo.y2 > alturaTela then
    planoDeFundo.y2 = planoDeFundo.y - fundo:getHeight()
  end
end
function love.wheelmoved(x, y)
  if y > 0 then
    -- scroll pra frente
    if volume < 1 then
      volume = volume + 0.1
    end
  else
    -- scrol pra trás
    if volume > 0 then
      volume = volume - 0.1
    end
  end
  somDoTiro:setVolume(volume)
  explodeNave:setVolume(volume)
  explodeInimigo:setVolume(volume)
  musica:setVolume(volume)
end
function efeito(dt)
  if scaleX > 1 and scaleY > 1 then
    scaleX = scaleX - 3 * dt
    scaleY = scaleY - 3 * dt
  end
end
function iniciaJogo(dt)
  if abreTela and not estaVivo then
    inicialX = inicialX + 600 * dt
    if inicialX > 401 then
      inicialY = -701
      inicialX = 0
      estaVivo = true
    end
  elseif not abreTela then
    estaVivo = false
    inicialY = inicialY + 600 * dt
    if inicialY > 0 then
      inicialY = 0
    end
  end
end
function love.keyreleased(key)
  if key == "p" and abreTela then
    pausar = not pausar
  end
  if pausar then
    musica:pause()
  else
    musica:play()
    -- love.audio.resume(musica)
  end
  
end
function fimJogo(dt)
  pausar = true
  musica:stop()
  transparencia = transparencia + 20 * dt
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
end