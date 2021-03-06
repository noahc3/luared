function love.load()
    PLATFORM = 'love'
    PATH = love.filesystem.getSource()
    while string.sub(PATH, #PATH, #PATH) == '/' do
        PATH = string.sub(PATH, 1, #PATH - 1)
    end
    LUAPATH = PATH..'/src/lua'
    package.path = LUAPATH..'/?.lua;'
                 ..LUAPATH..'/?/init.lua;'
                 ..package.path
    require 'preinit'
    require 'plat.love.util'
    require 'init'
    love.window.setMode(Screen.top.width*2, Screen.top.height*2 + Screen.bottom.height)
    love.window.setTitle('3DS Simulator')
end

local DT
function CALCULATE_DT()
    return DT
end

function love.update(dt)
    DT = dt
    if MAIN_LOOP() then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.setBackgroundColor(10, 10, 10)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(Screen.top.love, 0, Screen.top.height*2, -math.pi/2, 2, 2)
    love.graphics.draw(Screen.bottom.love, (Screen.top.width - Screen.bottom.width)/2, Screen.top.height*3, -math.pi/2)
end
