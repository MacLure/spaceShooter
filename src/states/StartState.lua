StartState = Class{__includes = BaseState}

function StartState:enter()

end

function StartState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('space') then
    gStateMachine:change('ship-select')
  end

end

function StartState:render()
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("START STATE", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

end