Camera = require("libs.STALKER-X.Camera")
Anim8 = require("libs.anim8.anim8")
WF = require("libs.windfield.windfield")
require("utils.Distance")

sprites = {}
sprites.player = love.graphics.newImage("sprites/player.png")
sprites.zombie= love.graphics.newImage("sprites/zombie.png")
sprites.bullet= love.graphics.newImage("sprites/bullet.png")


require("models.Player")
require("models.Enemies")
