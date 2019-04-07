ShipSelectState = Class{__includes = BaseState}

local highlighted = 1
local selectedShip = 1

function ShipSelectState:enter()

end

function ShipSelectState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
    highlighted = highlighted == 1 and 2 or 1
    selectedShip = selectedShip == 1 and 2 or 1

    gAudio['change']:stop()
    gAudio['change']:play()
  end

  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('play', {selectedShip = selectedShip})
  end
end

function ShipSelectState:render()

  love.graphics.setFont(gFonts['small'])

  if highlighted == 1 then
    love.graphics.setColor(255,255,255, 255)
  else
    love.graphics.setColor(255,255,255, 200)
  end
  
  love.graphics.draw(gTextures['ship1'], 200,100)
  love.graphics.rectangle('line', 182, 90, 112, 32)
  love.graphics.printf("SHIP A", 240, 103, 200, 'left')

  if highlighted == 2 then
    love.graphics.setColor(255,255,255, 255)
  else
    love.graphics.setColor(255,255,255, 200)
  end
  love.graphics.draw(gTextures['ship2'], 200,150)
  love.graphics.rectangle('line', 182, 140, 112, 32)
  love.graphics.printf("SHIP B", 240, 153, 200, 'left')


  love.graphics.setColor(0,255,255)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("SHIP SELECT STATE", 0, 20, VIRTUAL_WIDTH, 'center')

end