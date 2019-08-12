
require("app.init")

local MyApp = class("MyApp", cc.load("mvc").AppBase)

function MyApp:onCreate()
    math.randomseed(os.time())
end

function MyApp:run()
   display.runScene(views.MainScene:create())
end

return MyApp
