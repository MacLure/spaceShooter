PlayerShot = Class{}

function PlayerShot:init(x, y)
  self.shotSpeed = 100
  self.x = x
  self.y = y
  self.graphic = love.graphics.newImage('src/assets/shot1.png')
end

function PlayerShot:update(dt)
  self.x = self.x + self.shotSpeed * dt
end

function PlayerShot:render()
  love.graphics.draw(self.graphic, self.x, self.y)
end