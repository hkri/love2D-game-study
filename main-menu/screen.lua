-- screen.lua
-- Basic game screen in lua.
local screen = {}

-- load required libraries
local tween = require('../lib/tween')

-- cache some class
local wnd = love.window
local kb  = love.keyboard

-- fonts
local _fDefault = love.graphics.newFont(12)
local _fWendy   = love.graphics.newFont('/assets/fonts/wendy.ttf', 80)
local _fWendySmall   = love.graphics.newFont('/assets/fonts/wendy.ttf', 40)

-- menu
local menu_items        = {'Play', 'High Score', 'Quit'}
local menu_active_item  = 1

-- some settings variable
local menu_offset           = 220
local selection_rect  = {Width = 200, Height = 40, Top = menu_offset + 40 * (menu_active_item - 1)}
local rect_tween;

----------- [LOCAL FUNCTIONS] -----------

-- Moves the actively selected menu item.
function moveMenuSelection(dir)

  local moved = false

  if dir > 0 then
    if menu_active_item < table.getn(menu_items) then
      menu_active_item = menu_active_item + 1
      moved = true
    end
  else
    if menu_active_item > 1 then
      menu_active_item = menu_active_item - 1
      moved = true
    end
  end

  -- Update selection rectangle position
  -- menu_offset + 20 * (i - 1) - 2
  if moved then rect_tween = tween.new(0.75, selection_rect, {Top = menu_offset + selection_rect.Height * (menu_active_item - 1)}, 'outElastic') end

end

-----------------------------------------

-- Screen load function
function screen.load()

end

-- Perform game logic here.
function screen.update(dt)

  if rect_tween ~= nil then
    rect_tween:update(dt)
  end

end

-- Handle key pressed events here
function screen.keypressed(key)

  if kb.isDown('down') then
    moveMenuSelection(1)
  elseif kb.isDown('up') then
    moveMenuSelection(-1)
  end

end

-- Game render function
function screen.draw(gfx)

  -- Draw menu items
  --gfx.setFont(_fDefault)
  gfx.setFont(_fWendySmall)
  for i = 1, table.getn(menu_items) do
    if i == menu_active_item then
      gfx.setColor(255, 255, 255)
      gfx.rectangle('fill', (gfx.getWidth() - selection_rect.Width) / 2, selection_rect.Top , selection_rect.Width, selection_rect.Height)
      gfx.setColor(0, 0, 0)
    else
      gfx.setColor(255, 255, 255)
    end
    gfx.printf(menu_items[i], 0, menu_offset + selection_rect.Height * (i - 1), gfx.getWidth(), 'center')
  end

  -- Draw title text
  gfx.setFont(_fWendy)
  gfx.setColor(255, 255, 255)
  gfx.printf('Snake', 0, 50, gfx.getWidth(), 'center')

end

return screen
