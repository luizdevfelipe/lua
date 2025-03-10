function love.conf(t)  
  t.identity = nil
  t.version = "0.10.1"
  t.console = false
  t.accelerometerjoystick = true
  t.externalstorage = false
  t.gammacorrect = true
  
  t.window.title = "Meu Jogo"
  t.window.icon = nil
  t.window.width = 800
  t.window.height = 600
  t.window.borderless = false
  t.window.resizable = true
  t.window.minwidth = 800
  t.window.minheight = 600
  t.window.fullscreen = false
  t.window.fullscreentype = "desktop"
  t.window.vsync = true
  t.window.msaa = 0
  t.window.display = 1
  t.window.highdpi = false
  t.window.x = nil
  t.window.y = nil 
  
end