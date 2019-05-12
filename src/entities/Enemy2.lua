Enemy2 = Class{}

function Enemy2:init()
  self.x = VIRTUAL_WIDTH
  self.y = love.math.random(50, VIRTUAL_HEIGHT - 100 )
  self.width = 24
  self.height = 24
  self.speed = 10
  self.graphic = love.graphics.newImage('src/assets/enemy2.png')
end

function Enemy2:update(dt)
  self.x = self.x - 100 * dt
end

function Enemy2:render()
  love.graphics.draw(self.graphic, self.x, self.y)
end