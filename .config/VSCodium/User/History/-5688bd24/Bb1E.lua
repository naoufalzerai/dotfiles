Map = {}

Map.GROUND = {}
Map.TILE_SIZE = 16
Map.WIDTH = 300
Map.HEIGHT = 300


test = {}


for i=1,Map.WIDTH do
	Map.GROUND[i] = {}
	for j=1,Map.HEIGHT do
		Map.GROUND[i][j]=1
	end
end

Map.OBJECT = {}
for i=1,Map.WIDTH do
	Map.OBJECT[i] = {}
	for j=1,Map.HEIGHT do
		Map.OBJECT[i][j]=math.random(0,2)
	end
end

GROUND_TYPE = {
	[1] = "Ground",
	[2] = "Water"
}
OBJECT_TYPE = {
	[1] = "Collectible",
	[2] = "Obstacle"
}

LAYERS_GROUND = {
	[1] = {
		type = 1,
		x = 0,
		y = 0
	}
}

LAYERS_OBJECT = {
	[1] = {
		name = "Oak",
		type = 2,
		x = 0,
		y = 0

	},
	[2] = {
		name = "Torche",
		type = 1,
		x = 0,
		y = 0

	}
}

local function loadSprites( source )
	tilesetImage = love.graphics.newImage(source)
	tilesetImage:setFilter("nearest", "linear")  -- this "linear filter" removes some artifacts if we were to scale the tiles

	local w,h = tilesetImage:getWidth(), tilesetImage:getHeight()
	test = love.graphics.newQuad(0 , 0, Map.TILE_SIZE, Map.TILE_SIZE,w,h)
	tilesetBatch = love.graphics.newSpriteBatch(tilesetImage, 30 * 30)
end

local function drawGround()
	love.graphics.draw(tilesetBatch)
end

function Map:updateGround(  )
	_i,_j,i_max,j_max = Map:visibleArea()
	tilesetBatch:clear()
	for i=_i,i_max,1 do
		for j=_j,j_max,1 do
			local x,y = Map:matrixToPosition(i,j)
			local ib = Map.GROUND[i][j]
			if ib ~=0 then
				tilesetBatch:add(test, x-300, y-300)
			end	
		end
	end
	tilesetBatch:flush()
end
local function drawObject()
	-- body
end

function Map:matrixToPosition( i,j )
	return i*Map.TILE_SIZE, j*Map.TILE_SIZE
end
function Map:positionToMatrix( x,y )
	return math.floor(x/Map.TILE_SIZE)+1, math.floor(y/Map.TILE_SIZE)+1
end

function Map:visibleArea()
	i,j = Map:positionToMatrix(game.X,game.Y)

	return i,j,i+40,j+30
end

function Map:drawAllTileLayers()
	
	drawGround()
	drawObject()
end

function Map:load()
	print(1)
	loadSprites("Map/Sprout Lands - Sprites - Basic pack/Tilesets/Grass.png")
end