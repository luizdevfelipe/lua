function love.load()
  imagem = love.graphics.newImage("imagens/gitprofile.png")
  love.mouse.setVisible(false)
end

function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.draw(imagem, love.mouse.getX(), love.mouse.getY(), 0, 0.06, 0.06, 256, 256)
end