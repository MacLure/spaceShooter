Enemy2 = Class{}

function Enemy2:init()
  self.x = VIRTUAL_WIDTH
  self.y = love.math.random(50, VIRTUAL_HEIGHT - 100 )
  self.width = 24
  self.height = 24
  self.speed = 150
  self.hp = 3
  self.graphic = love.graphics.newImage('src/assets/enemy2.png')
end

function Enemy2:takeDamage(amount)
  self.hp = self.hp - 1
end

function Enemy2:leftPlay()
  if self.x < 0 - self.width then
    return true
  end
  return false
end

function Enemy2:update(dt)
  self.x = self.x - self.speed * dt
end

function Enemy2:render()
  love.graphics.draw(self.graphic, self.x, self.y)
end