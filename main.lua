WINDOW_WIDTH = 1280
WINDOW_HEIHGT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

require 'src/Dependencies'

function lua.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT {
    vsync = true,
    fullscreen = false,
    resizable = true
  })
  math.randomseed(os.time())
end