StartState = Class{__includes = BaseState}

function StartState:enter()

end

function StartState:update(dt)
  love.graphics.setColor(255,255,255)
  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
end

function StartState:render()

end