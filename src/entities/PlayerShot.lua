PlayerShot = Class{}

function PlayerShot:init(x, y, angle)
  self.x = x
  self.y = y
  self.width = 8
  self.height = 4
  self.angle = angle
  self.shotSpeed = 400

  if self.orientation == "up" then
    self.graphic = love.graphics.newImage('src/assets/shot1u.png')
  elseif self.orientation == "down" then
    self.graphic = love.graphics.newImage('src/assets/shot1d.png')
  else
    self.graphic = love.graphics.newImage('src/assets/shot1.png')
  end
end

function PlayerShot:update(dt)
  if self.angle == 0 then
    self.x = self.x + math.cos(self.angle / 2) * self.shotSpeed * dt
    self.y = self.y + math.sin(self.angle / 2) * self.shotSpeed * dt  
  else
    self.x = self.x + math.cos(self.angle / 2) * -self.shotSpeed * dt
    self.y = self.y + math.sin(self.angle / 2) * -self.shotSpeed * dt
  end
end

function PlayerShot:collides(target)
  if self.x > target.x + target.width or target.x > self.x + self.width then
    return false
  end
  if self.y > target.y + target.height or target.y > self.y + self.height then
    return false
  end
  return true
end

function PlayerShot:leftPlay()
  if self.x > WINDOW_WIDTH then
    return true
  end
  return false
end

function PlayerShot:render()
  love.graphics.draw(self.graphic, self.x, self.y, math.rad(self.angle))
end