function love.load()
  nuvemWidth = 120
  posicao = - nuvemWidth
  largura = love.graphics.getWidth()
  brilho = 0
end

function love.update(dt)
  if posicao <= ( largura + nuvemWidth ) then
    posicao = posicao + 150 * dt
  else
    posicao = - nuvemWidth
  end
  
  if posicao > 0 and posicao < 220 then
    if brilho > -35 then
      brilho = brilho - 120 * dt
    end
  else
    if brilho < 0 then
      brilho = brilho + 120 * dt
    end
  end
end

function love.draw()
-- Desenha o chão
love.graphics.setColor(0, 154, 10)
love.graphics.rectangle("fill", 0, 500, 800, 100)

-- Desenha a árvore
-- tronco
love.graphics.setColor(139, 69, 19)
love.graphics.rectangle("fill", 600, 350, 40, 150)
-- copa
love.graphics.setColor(0, 184, 10)
love.graphics.circle("fill", 620, 300, 80, 100)

-- Desenha a casa
-- frente
love.graphics.setColor(150, 150, 150)
love.graphics.rectangle("fill", 200, 300, 200, 200)
-- janela
love.graphics.setColor(10, 10, 190)
love.graphics.rectangle("fill", 220, 390, 50, 50)
-- porta
love.graphics.setColor(139, 69, 19)
love.graphics.rectangle("fill", 300, 380, 70, 120)
-- maçaneta
love.graphics.setColor(10, 10, 10)
love.graphics.circle("fill", 315, 450, 4, 100)
-- Teto
love.graphics.setColor(150, 10, 10)
love.graphics.polygon("fill", 200, 300, 400, 300, 300, 200, 200, 300)

-- O Sol
love.graphics.setColor(252, 212, 64)
love.graphics.circle("fill", 150, 100, 45, 100)
-- Raios do Sol
love.graphics.setLineWidth(5) -- determina a espessura do raio de Sol
love.graphics.line(150, 20, 150, 180)
love.graphics.line(70, 100, 230, 100)
love.graphics.line(90, 40, 210, 160)
love.graphics.line(210, 40, 90, 160)

-- Nuvem
love.graphics.setColor(240, 240, 240)
love.graphics.circle("fill", 0 + posicao, 100, 40, 100)
love.graphics.circle("fill", 40 + posicao, 100, 50, 100)
love.graphics.circle("fill", 80 + posicao, 100, 50, 100)
love.graphics.circle("fill", 120 + posicao, 100, 40, 100)
 
-- Ajusta a cor do fundo
love.graphics.setBackgroundColor(135 + brilho, 206 + brilho, 235 + brilho)

end