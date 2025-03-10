angulo = 0
velocidade = 1.5
rotacaoLua = 0
rotacaoPendulo = 0
isPendulo = false
isArco = false
x, y = 400, 300

function love.load()
  lua = love.graphics.newImage("imagens/lua.png")
  arco = love.graphics.newImage("imagens/arco.png")
  pendulo = love.graphics.newImage("imagens/pendulo.png")
end

function love.update(dt)
  angulo = angulo + dt * velocidade
  x, y = 400 + math.cos(angulo) * 100, 300 + math.sin(angulo) * 100

  rotacaoPendulo = rotacaoPendulo + dt * velocidade

  isPendulo = false
  isArco = false

  if love.keyboard.isDown("left") then
    rotacaoLua = rotacaoLua + dt
    isPendulo = true
  end
  
  if love.keyboard.isDown("right") then
    rotacaoLua = rotacaoLua - dt
    isArco = true
  end
end

function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255)

  if isPendulo then
    love.graphics.draw(pendulo, 400, 300, rotacaoPendulo + math.rad(-93), 1, 1, 6, 0)
  end

  if isArco then
    love.graphics.draw(arco, 400, 300, 0, 1, 1, arco:getWidth()/2, arco:getHeight()/2)
  end

  love.graphics.draw(lua, x, y, rotacaoLua, 0.2, 0.2, lua:getWidth()/2, lua:getHeight()/2)  
end
