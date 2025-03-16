function love.load()
  personagemA = {
    x = 100,
    y = 100
  }
  
  personagemB = {
      x = 200,
      y = 100,
      velocidade = 50
  }
  texto = ""
end

function love.update(dt)
  if love.keyboard.isDown("left") then
    personagemB.x = personagemB.x - personagemB.velocidade * dt
  end
  if love.keyboard.isDown("right") then
    personagemB.x = personagemB.x + personagemB.velocidade * dt
  end
  if love.keyboard.isDown("up") then
    personagemB.y = personagemB.y - personagemB.velocidade * dt
  end
  if love.keyboard.isDown("down") then
    personagemB.y = personagemB.y + personagemB.velocidade * dt
  end
  
  texto = encontraAngulo(personagemA.x, personagemA.y, personagemB.x, personagemB.y)
end

function love.draw()
  love.graphics.setColor(255,150,100)
  love.graphics.circle("fill", personagemA.x, personagemA.y, 10, 200)
  
  love.graphics.setColor(0,0,255)
  love.graphics.circle("fill", personagemB.x, personagemB.y, 10, 200)
  
  love.graphics.setColor(255,255,255)
  love.graphics.print("Angulo entre objetos: " .. texto, 0, 0)
end

function encontraAngulo(x1, y1, x2, y2)
  local a = math.floor( math.deg( math.atan2(x2 - x1, y2 - y1) ) )
  if a < 0 then
    a = a + 360
  end
  
  return a
end
