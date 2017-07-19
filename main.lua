-- main.lua
-- The game's main entry point.
-- John Espiritu, July 17, 2017

-- Cache some commonly-used class
local gfx = love.graphics

-- Prepare game screens.
local main_menu   = require('main-menu/screen')
local game_screen = require('game/screen')

-- Score screens in an array
local GAME_SCREEN = {main_menu, game_screen}
G_GAME_STATE  = 1

-- Do basic loading here.
function love.load()
  GAME_SCREEN[G_GAME_STATE].load()
end

-- Game update loop
-- Perform game logic here.
-- dt - Delta Time, time since last frame.
function love.update(dt)
  GAME_SCREEN[G_GAME_STATE].update(dt)
end

-- Keypressed handler
-- Handle key pressed events here.
-- key - the key that was pressed
function love.keypressed(key)
  GAME_SCREEN[G_GAME_STATE].keypressed(key)
end

-- Game draw/render loop
-- Draw graphics here.
function love.draw()
  GAME_SCREEN[G_GAME_STATE].draw(gfx)
end
