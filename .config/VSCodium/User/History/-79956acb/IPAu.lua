Player = {}
Player.speed = 200

function Player:init(  )	
	Player.body = World:newBSGRectangleCollider(100,100,10,10,1,{collision_type="Player"})	
	Player.state = fsm.create({
		initial = 'green',
		events = {
			{ name = 'warn',  from = 'green',  to = 'yellow' },
			{ name = 'panic', from = 'yellow', to = 'red'    },
			{ name = 'calm',  from = 'red',    to = 'yellow' },
			{ name = 'clear', from = 'yellow', to = 'green'  }
		},
		callbacks = {
			onpanic =  function(self, event, from, to, msg) print('panic! ' .. msg)    end,
			onclear =  function(self, event, from, to, msg) print('thanks to ' .. msg) end,
			ongreen =  function(self, event, from, to)      print('green light')       end,
			onyellow = function(self, event, from, to)      print('yellow light')      end,
			onred =    function(self, event, from, to)      print('red light')         end,
		}
	})
end

function Player:update(dt)

	_i,_j,i_max,j_max = Map:visibleArea()
	
	if i_max<Map.WIDTH and j_max<Map.HEIGHT and _i>=0 and j>=0 then
		return
	end
	local x,y = Player.body:getPosition()
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
		dx,dy = dx/length * Player.speed * dt,dy/length * Player.speed * dt

		game.X,game.Y =game.X + dx, game.Y + dy
		Player.body:setX(x + dx)
		Player.body:setY(y + dy)
	end

end


function Player:draw()
	-- body
end