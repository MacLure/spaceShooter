PlayerShip = Class{}

function PlayerShip:init(selectedShip)
  if selectedShip == 1 then
    self.skin = love.graphics.newImage('src/assets/ship1.png')
  end
  if selectedShip == 2 then
    self.skin = love.graphics.newImage('src/assets/ship2.png')
  end
  self.x = VIRTUAL_WIDTH / 2
  self.y = VIRTUAL_HEIGHT / 2 - 20
  self.dx = 0
  self.dy = 0
  self.height = 12
  self.width = 24

  self.orientation = 'straight'

  self.shipSpeed = 100
  self.hp = 3

end

function PlayerShip:collides(target)
  if self.x > target.x + target.width or target.x > self.x + self.width then
    return false
  end
  if self.y > target.y + target.height or target.y > self.y + self.height then
    return false
  end
  return true
end

function PlayerShip:takeDamage(amount)
  self.hp = self.hp - 1
end

function PlayerShip:update(dt)

  if love.keyboard.isDown('up') then
    self.dy = -self.shipSpeed
  elseif love.keyboard.isDown('down') then
    self.dy = self.shipSpeed
  else
    self.dy = 0
  end

  if love.keyboard.isDown('left') then
    self.dx = -self.shipSpeed
  elseif love.keyboard.isDown('right') then
    self.dx = self.shipSpeed
  else
    self.dx = 0
  end

  if love.keyboard.isDown('a') then
    self.skin = love.graphics.newImage('src/assets/ship1u.png')
    self.orientation = 'up'
  elseif love.keyboard.isDown('s') then
    self.skin = love.graphics.newImage('src/assets/ship1d.png')
    self.orientation = 'down'
  else
    self.skin = love.graphics.newImage('src/assets/ship1.png')
    self.orientation = 'straight'
  end


  if self.dy < 0 then
    self.y = math.max(0, self.y + self.dy * dt)
  else
    self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
  end

  if self.dx < 0 then
    self.x = math.max(0, self.x + self.dx * dt)
  else
    self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
  end

end

function PlayerShip:render()
  love.graphics.draw(self.skin, self.x, self.y)
end