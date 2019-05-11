PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.playerShip = PlayerShip(params.selectedShip)

  self.bg = love.graphics.newImage('src/assets/bg1.png')
  self.bgScroll = 0
  self.bgScrollSpeed = -60
  self.bgLoopingPoint = -512

  self.playerShots = {}

  gAudio['music1']:setLooping(true)
  gAudio['music1']:play()

  self.enemy = Enemy1()

end

function PlayState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('pause')
  end

  if love.keyboard.wasPressed('space') then
    gAudio['shot1']:stop()
    gAudio['shot1']:play()
    table.insert(self.playerShots, PlayerShot(self.playerShip.x + 16, self.playerShip.y + 6))
  end

  self.playerShip:update(dt)

  for k, shot in pairs(self.playerShots) do
    shot:update(dt)
  end

  self.bgScroll = (self.bgScroll + self.bgScrollSpeed * dt) % self.bgLoopingPoint

  self.enemy:update(dt)

end

function PlayState:render()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(self.bg, self.bgScroll,0)

  love.graphics.setColor(255,255,0)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("PLAY STATE", 0, 20, VIRTUAL_WIDTH, 'center')

  love.graphics.setColor(255,255,255)
  self.playerShip:render()

  for k, shot in pairs(self.playerShots) do
    shot:render()
  end

  self.enemy:render()


end