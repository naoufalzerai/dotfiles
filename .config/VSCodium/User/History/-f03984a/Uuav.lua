local NBR_BLOCKS_X = 50
local NBR_BLOCKS_Y = 40
local TILE_SIZE = 16

local sprites = {
    chunk = "",
    chunk2 = "",
    water = ""
}
-- layers ={
--     level[]{
--         room_type[]
--     }
-- }

local layers = {
    [1] = {
            forest = {
                ground = {
                    sprites["chunk"],
                    sprites["water"]
                },
                obstacle = {
                    sprites["chunk2"],
                    sprites["chunk2"]
                }
            } ,
            sea = {
                ground = {
                    sprites["chunk2"],
                    sprites["chunk2"]
                },
                obstacle = {
                    sprites["chunk2"],
                    sprites["chunk2"]
                }
            }
    },
    [2] = {
            cave = {
                ground = {
                    [1] = "chunk",
                    [2] = "water"
                },
                obstacle = {
                    [1] = "",
                    [2] = "",
                    [3] = ""
                }
            },
    },
}


-- Room is 50x40 blocks 
-- room = {
--     type = 0,
--     ground = {},
--     obstacles = {}
-- }


    

-- Map contain 3 levels
map = {
    level = {},
    current_layer=1
}

local function loadSprites( source )
	tilesetImage = love.graphics.newImage(source)
	tilesetImage:setFilter("nearest", "linear")  -- this "linear filter" removes some artifacts if we were to scale the tiles

	local w,h = tilesetImage:getWidth(), tilesetImage:getHeight()
	sprites["chunk"] = love.graphics.newQuad(0 , 0, TILE_SIZE, TILE_SIZE,w,h)
	sprites["chunk2"] = love.graphics.newQuad(47 , 0, TILE_SIZE, TILE_SIZE,w,h)
	sprites["water"] = love.graphics.newQuad(0 , 15, TILE_SIZE, TILE_SIZE,w,h)

	tilesetBatch = love.graphics.newSpriteBatch(tilesetImage, 30 * 30)
end

local function drawGround()
	love.graphics.draw(tilesetBatch)
end

local function drawObject()
	-- body
end

function map:updateGround()

	tilesetBatch:clear()

    for i=_i,NBR_BLOCKS_X,1 do
        for j=_j,NBR_BLOCKS_Y,1 do            
            tilesetBatch:add(map.level[map.current_layer].quad, i*TILE_SIZE, j*TILE_SIZE)            
        end
    end

	tilesetBatch:flush()
end

function map:drawAllTileLayers()
	drawGround()
	drawObject()
end

local function generate(level,layer)
     -- Insert the keys of the table into an array
    local keys = {}
    for key, _ in pairs(layer) do
        table.insert(keys, key)
    end
 
    local room_type = layer[keys[math.random(1,#keys)]]
    map.level[level] = {}
    for i = 1, NBR_BLOCKS_X, 1 do
        map.level[level][i] = {}
       for j = 1, NBR_BLOCKS_Y, 1 do
            map.level[level][i][j] = room_type.ground[0]
       end 
    end
end

function map.create(seed)
    loadSprites("sprites/tilemap.png")

    for level, layer in ipairs(layers) do              
        generate(level,layer)
    end
end
