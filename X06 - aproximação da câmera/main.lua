x, y, x2, y2 = 200, 300, 600, 300
tamanho = 1

function love.load()
  imagem = love.graphics.newImage("imagens/lua.png")
  outraImagem = love.graphics.newImage("imagens/terra.png")
  fundo = love.graphics.newImage("imagens/background.jpeg")
end

function love.update(dt)
  if love.keyboard.isDown("left") then
    x = x - 100 * dt
  elseif love.keyboard.isDown("right") then
    x = x + 100 * dt
  end
  if distance(x, y, x2, y2) < 300 * 0.2 then
    tamanho = tamanho + 0.5 * dt
      if tamanho >= 1.3 then
        tamanho = 1.3
      end
  else
    tamanho = tamanho - 0.5 * dt
    if tamanho <= 1 then
      tamanho = 1
    end
  end    
end

function love.draw()
  love.graphics.scale(tamanho)
  love.graphics.translate(- (x - 100), 0)
  love.graphics.draw(fundo, -300, 0, 0, 0.5, 0.5)
  love.graphics.draw(imagem, x, y, 0, 0.1, 0.1, 300 * 0.1, 300 * 0.1) -- LUA
  love.graphics.draw(outraImagem, x2, y2, 0, 0.2, 0.2, 300 * 0.2, 300 * 0.2) -- TERRA
end

function distance(x1, y1, x2, y2)
  return ( (x2 - x1) ^2 + (y2 - y1) ^2 ) ^0.5
end