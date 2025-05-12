centroX = love.graphics.getWidth() / 2
centroY = love.graphics.getHeight() / 2

function love.load()
  love.physics.setMeter(64)
  mundo = love.physics.newWorld(0, 9.81*64, true)
  objetos = {}
  
  shapeBolinhas = love.physics.newCircleShape(20)
  
  objetos.bolinha1 = {}
  objetos.bolinha1.body = love.physics.newBody(mundo, centroX, centroY, "dynamic")
  objetos.bolinha1.fixture = love.physics.newFixture(objetos.bolinha1.body, shapeBolinhas, 10)
  objetos.bolinha1.fixture:setRestitution(0.6)
  objetos.bolinha1.ancora = love.physics.newBody(mundo, centroX, 100, "static")
  objetos.bolinha1.linha = love.physics.newDistanceJoint(objetos.bolinha1.ancora, objetos.bolinha1.body, centroX, 100, centroX, centroY, false)
    
  objetos.bolinha2 = {}
  objetos.bolinha2.body = love.physics.newBody(mundo, centroX - 40, centroY, "dynamic")
  objetos.bolinha2.fixture = love.physics.newFixture(objetos.bolinha2.body, shapeBolinhas, 10)
  objetos.bolinha2.fixture:setRestitution(0.6)
  objetos.bolinha2.ancora = love.physics.newBody(mundo, centroX - 40, 100, "static")
  objetos.bolinha2.linha = love.physics.newDistanceJoint(objetos.bolinha2.ancora, objetos.bolinha2.body, centroX - 40, 100, centroX - 40, centroY, false)
  
  objetos.bolinha3 = {}
  objetos.bolinha3.body = love.physics.newBody(mundo, centroX + 40, centroY, "dynamic")
  objetos.bolinha3.fixture = love.physics.newFixture(objetos.bolinha3.body, shapeBolinhas, 10)
  objetos.bolinha3.fixture:setRestitution(0.6)
  objetos.bolinha3.ancora = love.physics.newBody(mundo, centroX + 40, 100, "static")
  objetos.bolinha3.linha = love.physics.newDistanceJoint(objetos.bolinha3.ancora, objetos.bolinha3.body, centroX + 40, 100, centroX + 40, centroY, false)
  
  objetos.bolinha4 = {}
  objetos.bolinha4.body = love.physics.newBody(mundo, centroX - 80, centroY, "dynamic")
  objetos.bolinha4.fixture = love.physics.newFixture(objetos.bolinha4.body, shapeBolinhas, 10)
  objetos.bolinha4.fixture:setRestitution(0.6)
  objetos.bolinha4.ancora = love.physics.newBody(mundo, centroX - 80, 100, "static")
  objetos.bolinha4.linha = love.physics.newDistanceJoint(objetos.bolinha4.ancora, objetos.bolinha4.body, centroX - 80, 100, centroX - 80, centroY, false)
  
  objetos.bolinha5 = {}
  objetos.bolinha5.body = love.physics.newBody(mundo, centroX + 80, centroY, "dynamic")
  objetos.bolinha5.fixture = love.physics.newFixture(objetos.bolinha5.body, shapeBolinhas, 10)
  objetos.bolinha5.fixture:setRestitution(0.6)
  objetos.bolinha5.ancora = love.physics.newBody(mundo, centroX + 80, 100, "static")
  objetos.bolinha5.linha = love.physics.newDistanceJoint(objetos.bolinha5.ancora, objetos.bolinha5.body, centroX + 80, 100, centroX + 80, centroY, false)
    
end

function love.update(dt)
  mundo:update(dt)
  
  if love.keyboard.isDown('right') then
    objetos.bolinha5.body:applyForce(1600, 0)
  end
end

function love.draw()
  love.graphics.line(objetos.bolinha1.linha:getAnchors())
  love.graphics.circle('fill', objetos.bolinha1.body:getX(), objetos.bolinha1.body:getY(), 20)
  
  love.graphics.line(objetos.bolinha2.linha:getAnchors())
  love.graphics.circle('fill', objetos.bolinha2.body:getX(), objetos.bolinha2.body:getY(), 20)
  
  love.graphics.line(objetos.bolinha3.linha:getAnchors())
  love.graphics.circle('fill', objetos.bolinha3.body:getX(), objetos.bolinha3.body:getY(), 20)
  
  love.graphics.line(objetos.bolinha4.linha:getAnchors())
  love.graphics.circle('fill', objetos.bolinha4.body:getX(), objetos.bolinha4.body:getY(), 20)
  
  love.graphics.line(objetos.bolinha5.linha:getAnchors())
  love.graphics.circle('fill', objetos.bolinha5.body:getX(), objetos.bolinha5.body:getY(), 20)
end

