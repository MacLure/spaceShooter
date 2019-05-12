WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

require 'src/Dependencies'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true
  })

  math.randomseed(os.time())

  gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8)
  }

  gTextures = {
    ['logo'] = love.graphics.newImage('src/assets/hornetlogo.png'),
    ['ship1'] = love.graphics.newImage('src/assets/ship1.png'),
    ['ship2'] = love.graphics.newImage('src/assets/ship2.png'),
    ['bg1'] = love.graphics.newImage('src/assets/bg1.png')
  }

  gAudio = {
    ['change'] = love.audio.newSource('src/assets/audio/change-select.wav', 'static'),
    ['shot1'] = love.audio.newSource('src/assets/audio/shot1.wav', 'static'),
    ['enemyHit'] = love.audio.newSource('src/assets/audio/enemyHit.wav', 'static'),
    ['explosion'] = love.audio.newSource('src/assets/audio/explosion.wav', 'static'),
    ['music1'] = love.audio.newSource('src/assets/audio/rk-bumblebee.mp3', 'static')
  }

  gStateMachine = StateMachine {
    ['start'] = function() return StartState() end,
    ['ship-select'] = function() return ShipSelectState() end,
    ['play'] = function() return PlayState() end,
    ['pause'] = function() return PauseState() end,
    ['stage-clear'] = function() return StageClearState() end,
  }

  gStateMachine:change('start')

  love.keyboard.keysPressed = {}

end

function love.resize(w, h)
  push:resize(w, h)
end

function love.update(dt)
  gStateMachine:update(dt)
  love.keyboard.keysPressed = {}
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  if love.keyboard.keysPressed[key] then
      return true
  else
      return false
  end
end

function love.draw()
  push:apply('start')


  gStateMachine:render()
  push:apply('end')
end

