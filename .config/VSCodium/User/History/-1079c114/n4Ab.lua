World = WF.newWorld(0,0,false)

function World.init()
    World:setQueryDebugDrawing(true)
    World:addCollisionClass("player")    
end