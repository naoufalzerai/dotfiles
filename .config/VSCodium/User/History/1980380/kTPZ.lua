Enemies = {}
zombies = {}

function Enemies.update(dt)
    for i, z in pairs(zombies) do
                z.x = z.x + math.cos(playerEnemyAngle(z)) * z.speed * dt
    z.y = z.y + math.sin(playerEnemyAngle(z)) * z.speed * dt

    if DistanceBetween(z.x,z.y,player.x,player.y) < 30 then
      for i, z in pairs(zombies) do
        zombies[i] = nil
      end
    end
  end
end

function playerEnemyAngle(enemy)
  return math.atan2(player.y-enemy.y,player.x-enemy.x)
end


function spawnZombie()
  local zombie = {}

  zombie.x = math.random(0,love.graphics.getWidth())
  zombie.y = math.random(0,love.graphics.getHeight())
  zombie.dead = false
  zombie.speed = 140

  local side = math.random(1,4)
  if side == 1 then
    zombie.x = -30
  elseif side == 2 then
    zombie.y = -30
  elseif side == 3 then
    zombie.y = love.graphics.getHeight()+30
  elseif side == 4 then
    zombie.x = love.graphics.getWidth()+30
  end

  table.insert(zombies,zombie)
end