require("config")

function love.load()

    camera = Camera()
    camera:setFollowStyle('TOPDOWN')

end

function love.update(dt)
    player.update(dt)

    Enemies.update(dt)

    camera:update(dt)
    camera:follow(player.x, player.y)

end

function love.draw()

    camera:attach()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(),
                       nil, nil, sprites.player:getWidth() / 2,
                       sprites.player:getHeight() / 2)
    camera:detach()
    camera:draw()

    local x,y = love.graphics.getWidth() ,love.graphics.getHeight()
    love.graphics.print(x.." , "..love.mouse.getX(),10,10)
    love.graphics.print(player.clickX..","..player.clickY,10,30)

    -- while #zombies < 4 do spawnZombie() end

    for i, z in pairs(zombies) do
        love.graphics.draw(sprites.zombie, z.x, z.y, playerEnemyAngle(z), nil,
                           nil, sprites.zombie:getWidth() / 2,
                           sprites.zombie:getHeight() / 2)
    end

    for i, b in pairs(bullets) do
        love.graphics.draw(sprites.bullet, b.x, b.y, nil, .5, nil,
                           sprites.bullet:getWidth() / 2,
                           sprites.bullet:getHeight() / 2)
    end
end


