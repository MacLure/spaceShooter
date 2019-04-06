PlayState = Class{__includes = BaseState}

function PlayState:enter()
  self.playerShip = PlayerShip()
end

function PlayState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('space') then
    gStateMachine:change('pause')
  end



end

function PlayState:render()
  love.graphics.setColor(255,255,0)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("PLAY STATE", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

  love.graphics.setColor(255,255,255)
  self.playerShip:render()

end