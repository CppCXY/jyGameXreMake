_ENV=namespace "views"
using_namespace "luaClass"
using_namespace "container"
using_namespace "ui"
using_namespace "uis"
using_namespace "game"


class("EndScene"){
    CLASS_DEBUG(false);
    NO_AUTO_INHERIT();
    super(cc.Scene,ui.LUIObject);
}


function EndScene:EndScene(endString)
    self=self:__super()
    self:LUIObject()
    local lb=
    createLabel(endString,25,cc.RED)
    :setWidth(display.cx*1.5)
    :setAnchorPoint(0.5,0.5)
    :setPosition(display.cx,display.cy)
    :addTo(self,100)

    RuntimeData:getInstance():reset()

    local restart=
    createLabel("请大侠重新开始",20,cc.YELLOW)
    :setAnchorPoint(0.5,0.5)
    :setPosition(display.cx,display.cy/2)
    :addTo(self,100)

    onNodeTouch(restart,function()
        cc.Director:getInstance():replaceScene(MainScene())
    end)
end



