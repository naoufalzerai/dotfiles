player = {}
player.x = love.graphics.getWidth() / 2
player.y = love.graphics.getHeight() / 2
player.speed = 180

bullets = {}

function player.update(dt)
    if love.keyboard.isDown("d") then player.x = player.x + player.speed * dt end

    if love.keyboard.isDown("a") then player.x = player.x - player.speed * dt end

    if love.keyboard.isDown("w") then player.y = player.y - player.speed * dt end

    if love.keyboard.isDown("s") then player.y = player.y + player.speed * dt end
    for i, b in pairs(bullets) do
        b.x = b.x + math.cos(b.direction) * b.speed * dt
        b.y = b.y + math.sin(b.direction) * b.speed * dt

    end

    -- for i = #bullets, 1, -1 do
    --     local b = bullets[i]
    --     if b.x < 0 or b.x > love.graphics.getWidth() or b.y < 0 or b.y >
    --         love.graphics.getHeight() then
    --         table.remove(bullets, i)
    --         print("d :" .. i)
    --     end

    --     for i, z in pairs(zombies) do
    --         for i, b in pairs(bullets) do
    --             if DistanceBetween(z.x, z.y, b.x, b.y) < 20 then
    --                 z.dead = true
    --                 b.dead = true
    --             end
    --         end
    --     end

    --     for i = #zombies, 1, -1 do
    --         local z = zombies[i]
    --         if z.dead then table.remove(zombies, i) end
    --     end

    --     for i = #bullets, 1, -1 do
    --         local b = bullets[i]
    --         if b.dead then table.remove(bullets, i) end
    --     end
    -- end

end

function player.draw() end

function playerMouseAngle()
    local x = love.mouse.getX() / 5 - player.x
    local y = -love.mouse.getY() / 5 - player.y

    return math.atan2(x, y)
end

function spawnBullet()
    local bullet = {}
    bullet.x = player.x
    bullet.y = player.y
    bullet.speed = 500
    bullet.direction = playerMouseAngle()
    bullet.dead = false
    table.insert(bullets, bullet)
end

function love.mousepressed(x, y, button)
    -- if button == 1 then 
    --   spawnBullet() 
    -- end 
    return true
end
