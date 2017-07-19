-- The main game screen
-- This is the screen where the game happens

local module = { }

---------- [Entities] ----------
local POINT = {X = 0, Y = 0}
local head = setmetatable(POINT, {})
head.X = 0

---------- [VARIABLES AND SETTINGS] ----------
-- Resolution: 600x400
-- Scale: 4 = 150 x 100
local scale   = 4
local maxlen  = 200
local snake   = {}

local _fDefault = love.graphics.newFont(12)

---------- [LOCAL FUNCTIONS] ----------


---------- [LOVE2D EVENTS] ----------

function module.load()
  head.Y = 30
end

function module.keypressed(key)

end

function module.update(dt)

end

function module.draw(g)
  g.setFont(_fDefault)
  g.print(head.X, 0, 0)
  g.print(head.Y, 0, 20)
end

return module -- Export the module
