PlayerShip = Class{}

function PlayerShip:init()
  self.skin = love.graphics.newImage('src/assets/ship1.png')

  self.x = VIRTUAL_WIDTH / 2
  self.y = VIRTUAL_HEIGHT / 2 - 20

  self.dx = 0
  self.dy = 0

  self.height = 12
  self.width = 24

  self.shipSpeed = 100
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