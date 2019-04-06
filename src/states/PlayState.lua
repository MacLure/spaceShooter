PlayState = Class{__includes = BaseState}

function PlayState:enter()
  self.playerShip = PlayerShip()

  self.bg = love.graphics.newImage('src/assets/bg1.png')
  self.bgScroll = 0
  self.bgScrollSpeed = -60
  self.bgLoopingPoint = -512
end

function PlayState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('space') then
    gStateMachine:change('pause')
  end

  self.playerShip:update(dt)


  self.bgScroll = (self.bgScroll + self.bgScrollSpeed * dt) % self.bgLoopingPoint

end

function PlayState:render()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(self.bg, self.bgScroll,0)

  love.graphics.setColor(255,255,0)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("PLAY STATE", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

  love.graphics.setColor(255,255,255)
  self.playerShip:render()

end