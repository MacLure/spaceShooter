Enemy1 = Class{}

function Enemy1:init()
  self.x = VIRTUAL_WIDTH
  self.y = love.math.random(50, VIRTUAL_HEIGHT - 100 )
  self.width = 24
  self.height = 24
  self.speed = 200
  self.hp = 1
  self.graphic = love.graphics.newImage('src/assets/enemy1.png')
end

function Enemy1:takeDamage(amount)
  self.hp = self.hp - 1
end

function Enemy1:leftPlay()
  if self.x < 0 - self.width then
    return true
  end
  return false
end

function Enemy1:update(dt)
  self.x = self.x - self.speed * dt
end

function Enemy1:render()
  love.graphics.draw(self.graphic, self.x, self.y)
end