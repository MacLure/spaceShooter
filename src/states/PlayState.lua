PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.playerShip = PlayerShip(params.selectedShip)

  self.bg = love.graphics.newImage('src/assets/bg1.png')
  self.bgScroll = 0
  self.bgScrollSpeed = -60
  self.bgLoopingPoint = -512

  self.playerShots = {}
  self.enemies = {}

  gAudio['music1']:setLooping(true)
  gAudio['music1']:play()

  table.insert(self.enemies, Enemy1())

end

function PlayState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('pause')
  end

  if love.keyboard.wasPressed('space') then
    gAudio['shot1']:stop()
    gAudio['shot1']:play()
    table.insert(self.playerShots, PlayerShot(self.playerShip.x + 16, self.playerShip.y + 6))
  end

  self.playerShip:update(dt)

  randomEnemy = math.random(2) == 1 and Enemy1() or Enemy2()

  for i, shot in pairs(self.playerShots) do
    shot:update(dt)

    for j, enemy in pairs(self.enemies) do
      if shot:collides(enemy) then
        enemy:takeDamage(1)
        table.remove(self.playerShots, i)
        if enemy.hp < 1 then
          table.remove(self.enemies, j)
          table.insert(self.enemies, randomEnemy)  
        end
      end
    end

  end

  self.bgScroll = (self.bgScroll + self.bgScrollSpeed * dt) % self.bgLoopingPoint


  for k, enemy in pairs(self.enemies) do
    enemy:update(dt)
  end

  -- self.enemy:update(dt)

end

function PlayState:render()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(self.bg, self.bgScroll,0)

  love.graphics.setColor(255,255,0)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf("PLAY STATE", 0, 20, VIRTUAL_WIDTH, 'center')

  love.graphics.setColor(255,255,255)
  self.playerShip:render()

  for k, shot in pairs(self.playerShots) do
    shot:render()
  end

  for k, enemy in pairs(self.enemies) do
    enemy:render(dt)
  end
  -- self.enemy:render()


end