PlayerShip = Class{}

function PlayerShip:init()
  self.skin = love.graphics.newImage('src/assets/ship1.png')

  self.x = VIRTUAL_WIDTH / 2
  self.y = VIRTUAL_HEIGHT / 2 - 20

  self.dx = 0
  self.dy = 0
end

function PlayerShip:render()
  love.graphics.draw(self.skin, self.x, self.y)
end