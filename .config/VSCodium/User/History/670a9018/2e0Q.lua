if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end
require("config")

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    canvas = love.graphics.newCanvas(400, 300)
    
    camera = Camera(200, 150, 400, 300)
    
    camera:setFollowStyle('TOPDOWN')
    -- camera.scale = 2
    map.create("seed")

end

function love.update(dt)

    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    -- draw the game here
    love.graphics.setCanvas()
    
    -- Draw the 400x300 canvas scaled by 2 to a 800x600 screen
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(canvas, 0, 0, 0, 2, 2)
    love.graphics.setBlendMode('alpha')

    player.update(dt)
    map.update()
    camera:update(dt)
    camera:follow(player.x, player.y)

end

function love.draw()


    camera:attach()
        map.drawAllTileLayers()
        love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(),
                        .5, nil, sprites.player:getWidth() / 2,
                        sprites.player:getHeight() / 2)

        for i, b in pairs(bullets) do
            love.graphics.draw(sprites.bullet, b.x, b.y, nil, .25, nil,
                            sprites.bullet:getWidth() / 2,
                            sprites.bullet:getHeight() / 2)
        end

    camera:detach()
    camera:draw()

    love.graphics.print(player.x .. " , " .. player.y, 10, 10)
    love.graphics.print(player.clickX .. "," .. player.clickY, 10, 30)


end

