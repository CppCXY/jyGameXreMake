
cc.FileUtils:getInstance():setPopupNotify(false)
--for android this is not useful
--package.path=package.path..";/?/init.lua"
--[[
local _print=print
function print(...)
    _print(...)
    _print(debug.traceback())
end
--]]
require "config"
require "cocos.init"
require "luaClass.init"
require "Path"
require "Functions"
require "resScripts.ResScriptManager"

local function main()
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
