Enemy2 = Class{}

function Enemy2:init()
  self.x = VIRTUAL_WIDTH
  self.y = love.math.random(50, VIRTUAL_HEIGHT - 100 )
  self.width = 24
  self.height = 24
  self.speed = 150
  self.hp = 3
  self.graphic = love.graphics.newImage('src/assets/enemy2.png')
  self.hitFlashTimer = 0
  self.hitFlashDuration = 0
  self.whiteShader = love.graphics.newShader[[
    extern float WhiteFactor;

    vec4 effect(vec4 vcolor, Image tex, vec2 texcoord, vec2 pixcoord)
    {
        vec4 outputcolor = Texel(tex, texcoord) * vcolor;
        outputcolor.rgb += vec3(WhiteFactor);
        return outputcolor;
    }
  ]]

end

function Enemy2:takeDamage(amount)
  self.hp = self.hp - 1
  self.hitFlashDuration = 0.05
end

function Enemy2:leftPlay()
  if self.x < 0 - self.width then
    return true
  end
  return false
end

function Enemy2:update(dt)
  self.x = self.x - self.speed * dt
  if self.hitFlashDuration > 0 then
    self.hitFlashTimer = self.hitFlashTimer + dt
    if self.hitFlashTimer > self.hitFlashDuration then
      self.hitFlashDuration = 0
      self.hitFlashTimer = 0
    end
  end

end

function Enemy2:render()
  love.graphics.setShader(self.whiteShader)
  self.whiteShader:send('WhiteFactor', self.hitFlashTimer < self.hitFlashDuration and 1 or 0)
  love.graphics.draw(self.graphic, self.x, self.y)
  love.graphics.setShader()
end