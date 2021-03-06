PlayerShip = Class{}

function PlayerShip:init(selectedShip)
  if selectedShip == 1 then
    self.skin = love.graphics.newImage('src/assets/ship1.png')
  end
  if selectedShip == 2 then
    self.skin = love.graphics.newImage('src/assets/ship2.png')
  end
  self.x      = VIRTUAL_WIDTH / 2
  self.y      = VIRTUAL_HEIGHT / 2 - 20
  self.dx     = 0
  self.dy     = 0
  self.height = 12
  self.width  = 24

  self.angle  = 0
  self.widthOffsetFactor = 1
  self.heightOffsetFactor = 0

  self.invulnerable = false
  self.invulnerableDuration = 0
  self.invulnerableTimer = 0
  self.flashTimer = 0

  self.shipSpeed  = 100
  self.hp         = 3

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
  if self.canTakeDamage == false then
    self.hp = self.hp - 1
  end
end

function PlayerShip:goInvulnerable(duration)
  self.invulnerable = true
  self.invulnerableDuration = duration
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
    self.angle = -20
    self.heightOffsetFactor = -0.25
  elseif love.keyboard.isDown('s') then
    self.angle = 20
    self.heightOffsetFactor = 0.25
  else
    self.angle = 0
    self.heightOffsetFactor = 0

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

  if self.invulnerable then
      self.flashTimer = self.flashTimer + dt
      self.invulnerableTimer = self.invulnerableTimer + dt

    if self.invulnerableTimer > self.invulnerableDuration then
      self.invulnerable = false
      self.invulnerableTimer = 0
      self.invulnerableDuration = 0
      self.flashTimer = 0
    end
  end

end

function PlayerShip:render()
  if self.invulnerable and self.flashTimer > 0.06 then
    self.flashTimer = 0
    love.graphics.setColor(255, 255, 255, 64)
  end

  love.graphics.draw(self.skin, self.x, self.y, math.rad(self.angle), 1, 1, 0, self.height * self.heightOffsetFactor)

  love.graphics.setColor(255, 255, 255, 255)

end