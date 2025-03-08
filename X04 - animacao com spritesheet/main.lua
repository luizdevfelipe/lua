local anim = require 'anim8'

local imagem, animacao

local posX = 100
local direcao = true

function love.load() 
  imagem = love.graphics.newImage("imagens/stickman.png")
  local grid = anim.newGrid(180, 340, imagem:getWidth(), imagem:getHeight())
  animacao = anim.newAnimation(grid('1-9', 2, '1-9', 3, '1-9', 4, '1-9', 5, '1-9', 6, '1-9', 7, '1-7', 8), 0.01)
end

function love.update(dt)
  if (love.keyboard.isDown("left")) then
    posX = posX - 150 * dt
    direcao = false
    animacao:update(dt)
  end
    if (love.keyboard.isDown("right")) then
    posX = posX + 150 * dt
    direcao = true
    animacao:update(dt)
  end
end

function love.draw()
  love.graphics.setBackgroundColor(255,255,255)
  if direcao then
    animacao:draw(imagem, posX, 50, 0, 1, 1, 90, 0)
  else 
    animacao:draw(imagem, posX, 50, 0, -1, 1, 90, 0)
  end
end