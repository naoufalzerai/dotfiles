Enemies = {}
local zombies = {}

function Enemies.update(dt)
    for i, z in pairs(zombies) do
                z.x = z.x + math.cos(playerEnemyAngle(z)) * z.speed * dt
    z.y = z.y + math.sin(playerEnemyAngle(z)) * z.speed * dt

    if distanceBetween(z.x,z.y,player.x,player.y) < 30 then
      for i, z in pairs(zombies) do
        zombies[i] = nil
      end
    end
  end
end