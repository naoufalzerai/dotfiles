player = {}
player.x = love.graphics.getWidth() / 2
player.y = love.graphics.getHeight() / 2
player.clickX = 0
player.clickY = 0
player.speed = 180

bullets = {}

function player.update(dt)

    -- local x,y = player.body:getPosition()
    local x,y = player.x,player.y
	local dx,dy = 0,0

	-- Handle movement
	if love.keyboard.isDown("d")  then
		dx = dx + 1
	end

	if love.keyboard.isDown("a")  then
		dx = dx - 1
	end

	if love.keyboard.isDown("w")  then
		dy = dy - 1
	end

	if love.keyboard.isDown("s")  then
		dy = dy + 1
	end

	if dx ~= 0  or dy ~= 0 then
		local length = math.sqrt(dx^2+dy^2)

		dx,dy = (dx/length * player.speed * dt), (dy/length * player.speed * dt)
		x,y = x+dx, y+dy
        player.x = x
        player.y = y
	end


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
    mx, my = camera:getMousePosition()
    return
        math.atan2(player.y - my, player.x - mx) + math.pi
end

function spawnBullet()
    local bullet = {}
    bullet.x = player.x
    bullet.y = player.y
    bullet.speed = 500
    bullet.direction = playerMouseAngle()
    bullet.dead = false
    table.insert(bullets, bullet)
    camera:shake(.5, .5, 20)
end

function love.mousepressed(x, y, button)
    if button == 1 then 
      spawnBullet() 
    end 
    player.clickX,player.clickY = camera:toWorldCoords(love.mouse.getPosition())
    return true
end
