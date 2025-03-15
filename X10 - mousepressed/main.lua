function love.load()
  imagem = love.graphics.newImage("imagens/lua.png")
  rotacao = 0
  texto = ""
  
  objeto = {
      imagem = imagem,
      nome = "Lua",
      posX = 150,
      posY = 150,
      rotacao = 0,
      oriX = imagem:getWidth() / 2,
      oriY = 0,
      tamanho = 10, 
      peso = 3.4
  }
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.draw(objeto.imagem, objeto.posX, objeto.posY, objeto.rotacao, 0.2, 0.2, objeto.oriX, objeto.oriY)
  love.graphics.print(objeto.nome, objeto.posX - 10, objeto.posY - 15)
  love.graphics.print(texto, 0, 0)
end

function love.mousepressed(x, y, button, isTouch)
  if button == 1 then
    objeto.posX = x
    objeto.posY = y
  end
end

function love.mousereleased(x, y, button, isTouch)
  rotacao = rotacao + 1  
  if button == 1 then
    objeto.posX = 150
    objeto.posY = 150
    objeto.rotacao = rotacao
  end
end

function love.keypressed(key, unicode)
  if key ~= "escape" then 
    texto = "A tecla " .. key .. " foi pressionada."
  else
    love.event.quit() 
  end
end

function love.keyreleased(key, unicode)
   texto = "A tecla " .. key .. " foi solta."
end