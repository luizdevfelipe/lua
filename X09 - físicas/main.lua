function love.load()
  love.physics.setMeter(64)
  mundo = love.physics.newWorld(0, 9.81 * 64, true)
  
  -- vetor que conterá os objetos que sofrem a física
  objetos = {}
  
  objetos.chao = {}
  objetos.chao.body = love.physics.newBody(mundo, 650/2, 650 - 50 / 2)
  objetos.chao.shape = love.physics.newRectangleShape(650, 50)
  objetos.chao.fixture = love.physics.newFixture(objetos.chao.body, objetos.chao.shape)
  
  objetos.bola = {}
  objetos.bola.body = love.physics.newBody(mundo, 650/2, 650/2, "dynamic")
  objetos.bola.shape = love.physics.newCircleShape(20)
  objetos.bola.fixture = love.physics.newFixture(objetos.bola.body, objetos.bola.shape, 1)
  objetos.bola.fixture:setRestitution(0.9)
  
  objetos.bloco1 = {}
  objetos.bloco1.body = love.physics.newBody(mundo, 200, 555, "dynamic")
  objetos.bloco1.shape = love.physics.newRectangleShape(0,0,50,100)
  objetos.bloco1.fixture = love.physics.newFixture(objetos.bloco1.body, objetos.bloco1.shape, 5)
  
  objetos.bloco2 = {}
  objetos.bloco2.body = love.physics.newBody(mundo, 200, 400, "dynamic")
  objetos.bloco2.shape = love.physics.newRectangleShape(0,0,100,100)
  objetos.bloco2.fixture = love.physics.newFixture(objetos.bloco2.body, objetos.bloco2.shape, 2)
  
  love.graphics.setBackgroundColor(104, 136, 248)
  love.window.setMode(650, 650)
end

function love.update (dt)
  mundo:update(dt)
  
  if love.keyboard.isDown("d") then
    objetos.bola.body:applyForce(400, 0)
  end
  
  if love.keyboard.isDown("a") then
    objetos.bola.body:applyForce(-400, 0)
  end
  
  if love.keyboard.isDown("w") then
    objetos.bola.body:setPosition(650/2, 400)
    objetos.bola.body:setLinearVelocity(0, 0)
  end  
end

function love.draw()
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill", objetos.chao.body:getWorldPoints( objetos.chao.shape:getPoints() ))
  
  love.graphics.setColor(193, 47,  14)
  love.graphics.circle("fill", objetos.bola.body:getX(), objetos.bola.body:getY(), objetos.bola.shape:getRadius())
  
  love.graphics.setColor(50, 50, 50)
  love.graphics.polygon("fill", objetos.bloco1.body:getWorldPoints( objetos.bloco1.shape:getPoints() ))
  love.graphics.polygon("fill", objetos.bloco2.body:getWorldPoints( objetos.bloco2.shape:getPoints() ))
  
end