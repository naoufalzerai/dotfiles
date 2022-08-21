World ={
    w = WF.newWorld(0,0,false)
}


function World.init()
    World.w:setQueryDebugDrawing(true)
    World.w:addCollisionClass("player")    
end