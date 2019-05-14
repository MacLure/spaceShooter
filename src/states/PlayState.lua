PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.playerShip = PlayerShip(params.selectedShip)

  self.bg1 = love.graphics.newImage('src/assets/bg1.png')
  self.bg2 = love.graphics.newImage('src/assets/bg2.png')
  self.bg3 = love.graphics.newImage('src/assets/bg3.png')

  self.bg1Scroll = 0
  self.bg2Scroll = 0
  self.bg3Scroll = 0

  self.bg1ScrollSpeed = 0
  self.bg2ScrollSpeed = -10
  self.bg3ScrollSpeed = -80

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
    table.insert(self.playerShots, PlayerShot(self.playerShip.x + 16, self.playerShip.y + 6, self.playerShip.orientation))
  end

  self.playerShip:update(dt)

  randomEnemy = math.random(2) == 1 and Enemy1() or Enemy2()

  for i, shot in pairs(self.playerShots) do
    shot:update(dt)

    if shot:leftPlay() then
      table.remove(self.playerShots, i)
    end

    for j, enemy in pairs(self.enemies) do
      if shot:collides(enemy) then
        enemy:takeDamage(1)
        table.remove(self.playerShots, i)
        if enemy.hp < 1 then
          gAudio['explosion']:stop()
          gAudio['explosion']:play()      
          table.remove(self.enemies, j)
          table.insert(self.enemies, randomEnemy)
        else
          gAudio['enemyHit']:stop()
          gAudio['enemyHit']:play()      
        end
      end
    end
  end

  self.bg1Scroll = (self.bg1Scroll + self.bg1ScrollSpeed * dt) % self.bgLoopingPoint
  self.bg2Scroll = (self.bg2Scroll + self.bg2ScrollSpeed * dt) % self.bgLoopingPoint
  self.bg3Scroll = (self.bg3Scroll + self.bg3ScrollSpeed * dt) % self.bgLoopingPoint

  for k, enemy in pairs(self.enemies) do
    enemy:update(dt)

    if self.playerShip:collides(enemy) then
      if not self.playerShip.invulnerable then
        self.playerShip:takeDamage(1)
        self.playerShip:goInvulnerable(1.5) 
        enemy:takeDamage(1) 
        if enemy.hp < 1 then
          table.remove(self.enemies, k)
          table.insert(self.enemies, randomEnemy)
        end
        gAudio['explosion']:play()    
      end
    end

    if enemy:leftPlay() then
      table.remove(self.enemies, k)
      table.insert(self.enemies, randomEnemy)  
    end
  end

end

function PlayState:render()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(self.bg1, self.bg1Scroll,0)
  love.graphics.draw(self.bg2, self.bg2Scroll,0)
  love.graphics.draw(self.bg3, self.bg3Scroll,0)


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


end