StageClearState = Class{__includes = BaseState}

function StageClearState:enter()

end

function StageClearState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end


end

function StageClearState:render()
  love.graphics.setColor(255,0,0)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("STAGE CLEAR STATE", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

end