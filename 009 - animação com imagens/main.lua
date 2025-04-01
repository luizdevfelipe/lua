local hero_walk = {}    -- vetor de imagens
local hero_anim_frame = 1
local hero_pos_x = 100
local hero_pos_y = 225
local hero_anim_time = 0   -- variável que controla o tempo da animação

-- Função load: executada somente na inicialização
function love.load()
  for x = 1, 9, 1 do
    hero_walk[x] = love.graphics.newImage("imgs/Hero_Walk_0" .. x .. ".png")
  end
  
  for x = 10, 16, 1 do
    hero_walk[x] = love.graphics.newImage("imgs/Hero_Walk_" .. x .. ".png")
  end
end

-- Função CallBack update: executada automaticamente a cada frame da animação
function love.update(dt)
  if love.keyboard.isDown("right") then
    hero_pos_x = hero_pos_x + (100*dt)
    hero_anim_time = hero_anim_time + dt 
    if hero_anim_time > 0.1 then        
      if hero_anim_frame >= 1 and hero_anim_frame < 4 then
        hero_anim_frame = hero_anim_frame + 1
      else
        hero_anim_frame = 1
      end
      hero_anim_time = 0
    end
  end
  
  if love.keyboard.isDown("left") then
    hero_pos_x = hero_pos_x - (100*dt)
    hero_anim_time = hero_anim_time + dt 
    if hero_anim_time > 0.1 then  
      if hero_anim_frame >= 5 and  hero_anim_frame < 8  then
        hero_anim_frame = hero_anim_frame + 1  
      else
        hero_anim_frame = 5
      end
      hero_anim_time = 0
    end
  end
  
  if love.keyboard.isDown("up") then
    hero_pos_y = hero_pos_y - (100*dt)
    hero_anim_time = hero_anim_time + dt 
    if hero_anim_time > 0.1 then  
      if hero_anim_frame >= 9 and  hero_anim_frame < 12  then
        hero_anim_frame = hero_anim_frame + 1  
      else
        hero_anim_frame = 9
      end
      hero_anim_time = 0
    end
  end
  
  if love.keyboard.isDown("down") then
    hero_pos_y = hero_pos_y + (100*dt)
    hero_anim_time = hero_anim_time + dt 
    if hero_anim_time > 0.1 then  
      if hero_anim_frame >= 13 and  hero_anim_frame < 16  then
        hero_anim_frame = hero_anim_frame + 1  
      else
        hero_anim_frame = 13
      end
      hero_anim_time = 0
    end
  end
  
end

-- Função Callack draw: executada automaticamente a cada frame da animação
function love.draw()
  love.graphics.draw(hero_walk[hero_anim_frame], hero_pos_x, hero_pos_y)
end
