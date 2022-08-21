if arg[2] == "debug" then
    require("lldebugger").start()
end

game = {}
game.X=0
game.Y=0

function love.load()
	require "config"
	Gamestate.registerEvents()
	Gamestate.switch(game)	
	Map:load()
end

function game:init()
	World:init()
	Player:init()
	Inventory:init()
end

function game:enter()	
    -- setup entities here
end

function game:update(dt)	

	-- Map:update(dt)
	World:update(dt)
	Player:update(dt)
	local px, py= Player.body:getPosition()
	game.X,game.Y =px,py
	camera:update(dt)
	camera:follow(px, py)
	Map:updateGround(  )
end

function game:draw()
	camera:attach()		
		Map:drawAllTileLayers()
		World:draw()		
	camera:detach()
	camera:draw() 
	hud:draw()

	i,j,i_max,j_max = Map:visibleArea()
	love.graphics.print(math.floor(game.X)..",".. math.floor(game.Y),10,50)
	love.graphics.print(i..","..j..","..i_max..","..j_max ,10,25)
end


function game:keyreleased(key, code)
	if key == 'p' then
    	-- menu
    	Gamestate.switch(menu)
    elseif key == 'e' then
    	-- inventory
    	Gamestate.switch(Inventory)
    end
end


function love.mousepressed( x , y, button )
	if button == 1 then
		print(x,y)
	end
end