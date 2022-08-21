if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end
require("config")

function love.load()

    camera = Camera()
    camera:setFollowStyle('TOPDOWN')
    -- map.create("seed")

end

function love.update(dt)
    player.update(dt)
    camera:update(dt)
    camera:follow(player.x, player.y)

end

function love.draw()

    camera:attach()
        love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(),
                        nil, nil, sprites.player:getWidth() / 2,
                        sprites.player:getHeight() / 2)

        for i, b in pairs(bullets) do
            love.graphics.draw(sprites.bullet, b.x, b.y, nil, .5, nil,
                            sprites.bullet:getWidth() / 2,
                            sprites.bullet:getHeight() / 2)
        end
    camera:detach()
    camera:draw()

    love.graphics.print(player.x .. " , " .. player.y, 10, 10)
    love.graphics.print(player.clickX .. "," .. player.clickY, 10, 30)


end

