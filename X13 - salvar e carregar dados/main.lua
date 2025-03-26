pontuacao = 0

function love.load()
  print(tostring(love.filesystem.getSaveDirectory()))
end

function love.draw()
  love.graphics.print("Pontuação: " .. pontuacao, 100, 100)
end

function love.keyreleased(key)
  if key == "a" then
    pontuacao = pontuacao + 1
  end
  if key == "s" then
    love.filesystem.write("pontos.txt", pontuacao)
  end
  if key == "l" and love.filesystem.exists("pontos.txt") then
    pontuacao = love.filesystem.read("pontos.txt")
  end
end