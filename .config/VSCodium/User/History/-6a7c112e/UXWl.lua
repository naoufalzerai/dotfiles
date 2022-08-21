function DistanceBetween(x1,y1,x2,y2)
    return math.sqrt((x2-x1)^2+(y2-y1)^2)
  end
  function AngleBetween(x1,y1,x2,y2)
    return math.atan2(y1-y2,x1-x2)
  end
  function PlayerMouseAngle(player)
    return math.atan2(player.y-love.mouse.getY(),player.x-love.mouse.getX()) + math.pi
  end