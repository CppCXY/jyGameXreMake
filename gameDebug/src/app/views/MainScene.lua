
include "app.gameClass.init"
include "app.runtime.init"
include "app.ui.init"
include "app.uiScripts.init"
include "app.views.NetWorkMatchScene"
_ENV=namespace "views"
using_namespace "luaClass"
using_namespace "container"
using_namespace "ui"
using_namespace "uis"
using_namespace "controller"
using_namespace "game"


class("MainScene"){
    CLASS_DEBUG(false);
    NO_AUTO_INHERIT();
    super(cc.Scene,ui.LUIObject);
}


function MainScene:MainScene()
    self=self:__super()
    self:LUIObject()
    self:load(MainSceneScript)
    self:setParams("backGround",{Path:getInstance().ui.openImage})
    self:setParams("title",{mod.Limit.title,30})
    self:setParams("desc",{mod.Limit.desc,18})
    self:implement()
    local menu=self:find("menu")
    self:find("desc"):setWidth(display.cx)
    
    local textArr=array({"开始游戏","载入游戏",--[["局域网对战","关闭音乐",--]]"作者信息"})
    local callArr=array()
    callArr:push_back(function()
        self:onGameBegin()
    end)
    callArr:push_back(function()
        self:onGameLoad()
    end)

    --为啥屏蔽呢，因为现在的数据同步方案有很大问题。而且我很难保证mod制作者的天赋buff是规范的。
    --要实现数据同步，必须对luaClass，进行新的革新。
    --以后重新思考数据同步的问题
    --[[
    callArr:push_back(function()
       self:onDoubleBattle()
    end)

    callArr:push_back(function()
        self:onMusicStop()
    end)
    --]]
    callArr:push_back(function()
        self:onAuthorInfo()
    end)


    for i,key,call in textArr:zip(callArr) do
        cc.MenuItemLabel:create(createLabel(key,20))
        :setPosition(0,-i*(30))
        :addTo(menu)
        :registerScriptTapHandler(call)
        
    end

    Audio:getInstance():playMusic(Path:getInstance().ui.openMusic)

end

function MainScene:onGameBegin()
    NetWork:getInstance().inNetWork=false
    RuntimeData:getInstance():addSuggest("让我们一起来体验小人物就江湖吧")
    RuntimeData:getInstance():addRole(Role("主角"))

    local story=ResScriptManager:getInstance().storysQuery:get("游戏开场选择")
    local controller=DialogController:create(story)
    local dlg=DialogUI(controller):addTo(self,100)
    dlg:setBackGround(nil,Path:getInstance().ui.openImage)
    controller:nextAction()
end

function MainScene:onGameLoad()
    local sd=SaveDisplayUI(false)
    :move(0,0)
    :setContentSize(cc.Director:getInstance():getVisibleSize())
    :addTo(self,100)
    :setBackGround(Path:getInstance().ui.openImage )
end

function MainScene:onDoubleBattle()
    local newScene=NetWorkMatchScene()
    cc.Director:getInstance():replaceScene(newScene)
    
end

function MainScene:onMusicStop()
    Audio:getInstance():stop()
end

function MainScene:onAuthorInfo()
    local aui=AuthorInfoUI()
    :move(0,0)
    :setContentSize(cc.Director:getInstance():getVisibleSize())
    :addTo(self,100)
    :setBackGround(Path:getInstance().ui.openImage )
end

