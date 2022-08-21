local NBR_BLOCKS_X = 50
local NBR_BLOCKS_Y = 40

local sprites = {
    ["chunk"] = "",
    ["chunk2"] = "",
    ["water"] = ""
}

local layers = {
    [1] = {
        room_type = {
            [1] = {
                name = "forest",
                ground = {
                    sprites["chunk"],
                    sprites["water"]
                },
                obstacle = {
                    sprites["chunk2"],
                    sprites["chunk2"]
                }
            } ,
            [2] = {
                name = "sea",
                ground = {
                    sprites["chunk2"],
                    sprites["chunk2"]
                },
                obstacle = {
                    sprites["chunk2"],
                    sprites["chunk2"]
                }
            }
        }
    },
    [2] = {
        room_type = {
            [1] = {
                name = "cave",
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
        }
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

}

local function loadSprites( source )
	tilesetImage = love.graphics.newImage(source)
	tilesetImage:setFilter("nearest", "linear")  -- this "linear filter" removes some artifacts if we were to scale the tiles

	local w,h = tilesetImage:getWidth(), tilesetImage:getHeight()
	sprites["chunk"] = love.graphics.newQuad(0 , 0, Map.TILE_SIZE, Map.TILE_SIZE,w,h)
	sprites["chunk2"] = love.graphics.newQuad(47 , 0, Map.TILE_SIZE, Map.TILE_SIZE,w,h)
	sprites["water"] = love.graphics.newQuad(0 , 15, Map.TILE_SIZE, Map.TILE_SIZE,w,h)

	tilesetBatch = love.graphics.newSpriteBatch(tilesetImage, 30 * 30)
end

local function drawGround()
	love.graphics.draw(tilesetBatch)
end

local function drawObject()
	-- body
end

function map:updateGround()
	_i,_j,i_max,j_max = Map:visibleArea()
	tilesetBatch:clear()
	if i_max<Map.WIDTH and j_max<Map.HEIGHT and _i>0 and _j>0 then
		for i=_i,i_max,1 do
			for j=_j,j_max,1 do
				local x,y = Map:matrixToPosition(i,j)
				local ib = Map.GROUND[i+1][j+1]
				if ib ~=0 then
					tilesetBatch:add(LAYERS_GROUND[ib].quad, x, y)
				end
			end
		end
	end
	tilesetBatch:flush()
end

function map:drawAllTileLayers()
	drawGround()
	drawObject()
end

local function generate(type)
    
end

function map.create(seed)
    loadSprites("sprites/tilemap.png")

    for i, l in pairs(layers) do      
        for i = 1, 10, 1 do
            generate(l)
        end
    end
end
