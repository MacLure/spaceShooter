PlayerShot = Class{}

function PlayerShot:init(x, y)
  self.x = x
  self.y = y
  self.width = 8
  self.height = 4
  
  self.shotSpeed = 400

  self.graphic = love.graphics.newImage('src/assets/shot1.png')
end

function PlayerShot:update(dt)
  self.x = self.x + self.shotSpeed * dt
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

function PlayerShot:render()
  love.graphics.draw(self.graphic, self.x, self.y)
end