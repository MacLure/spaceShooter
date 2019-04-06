PauseState = Class{__includes = BaseState}

function PauseState:enter()

end

function PauseState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('play')
  end
  
end

function PauseState:render()
  love.graphics.setColor(255,0,255)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("PAUSE STATE", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

end