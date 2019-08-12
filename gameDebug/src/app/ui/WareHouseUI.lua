include "app.ui.MatUI"
include "app.ui.ItemUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

---@class WareHouseUI
local WareHouseUI=class "WareHouseUI" {

    super(LUIObject);
    super(cc.Layer);
    public{
        FUNCTION.WareHouseUI;

        FUNCTION.initMenu;

        FUNCTION.pushHouse;

        FUNCTION.popHouse;

        FUNCTION.setTips;

        MEMBER.itemui;

    };
    protected{
        MEMBER._tips;
    }


}



function WareHouseUI:WareHouseUI()
    
    self=self:__super()
    self:LUIObject()

    self.itemui=
    ItemUI(set({0,1,2,3,4,5,6,7,8,9,10}),
    RuntimeData:getInstance().wareHouse)
    :addTo(self,200)
    self:initMenu()

    self.itemui.itemUsed:clear()
    connect(self.itemui,"itemUsed",self,"popHouse")

    local saveLimit
    =mod.Limit.wareBaseNum
    +RuntimeData:getInstance().round
    *mod.Limit.wareAddNum

    self:setTips(
    "当前仓库容量"
    ..RuntimeData:getInstance().wareHouse:size().."/"..saveLimit )    
end

function WareHouseUI:initMenu()
    local textArray=array()
    local callArray=array()

    textArray:push_back("返回")
    --返回
    callArray:push_back(
        function ()
            self:removeFromParent()
        end
    ) 
    textArray:push_back("仓库")
    --全部
    callArray:push_back(
        function ()

            self.itemui:bindData(RuntimeData:getInstance().wareHouse,"取出")
            local s=set({0,1,2,3,4,5,6,7,8,9,10})
            self.itemui:showWithTypeSet(s)
            self.itemui.itemUsed:clear()
            connect(self.itemui,"itemUsed",self,"popHouse")
        end
    )

    textArray:push_back("背包")
    --全部
    callArray:push_back(
        function ()

            self.itemui:bindData(RuntimeData:getInstance().items,"存入")

            local s=set({0,1,2,3,4,5,6,7,8,9,10})
            self.itemui:showWithTypeSet(s)
            self.itemui.itemUsed:clear()
            connect(self.itemui,"itemUsed",self,"pushHouse")
        end
    )

    for i,text,call in textArray:zip(callArray) do
        local card=
        CardUI(cc.size(display.cx/4,display.cy/8))
        :setPosition(display.cx/4,display.cy*(2.1-i*0.3))
        :setAnchorPoint(1,1)
        :addTo(self.itemui,996)
        :setText(text)
        card.onTouch=true
        connect(card,"touched",card,call)
    end

end

function WareHouseUI:pushHouse(item)

    local saveLimit
    =mod.Limit.wareBaseNum
    +RuntimeData:getInstance().round
    *mod.Limit.wareAddNum
    local size= RuntimeData:getInstance().wareHouse:size()
    if size>=saveLimit then
        self:setTips("当前箱子满了，不能继续存了")   
        return 
    end

    self.itemui:clear("_mat")
    RuntimeData:getInstance():pushWareHouse(item)
    
    self:setTips("存入"
    ..item.name.."成功"
    ..RuntimeData:getInstance().wareHouse:size().."/"
    ..saveLimit)

    local s=set({0,1,2,3,4,5,6,7,8,9,10})
    self.itemui:showWithTypeSet(s)
end

function WareHouseUI:popHouse(item)
    self.itemui:clear("_mat")
    local saveLimit
    =mod.Limit.wareBaseNum
    +RuntimeData:getInstance().round
    *mod.Limit.wareAddNum
    
    RuntimeData:getInstance():popWareHouse(item)
    self:setTips("取出"
    ..item.name.."成功"
    ..RuntimeData:getInstance().wareHouse:size().."/"
    ..saveLimit)

    local s=set({0,1,2,3,4,5,6,7,8,9,10})
    self.itemui:showWithTypeSet(s)
end



function WareHouseUI:setTips(str)
    if  self._tips==nil then
        self._tips=createLabel("",20)
        :setAnchorPoint(0,0)
        :setPosition(display.cx/4,display.cy*1.8)
        :addTo(self,100)
    end
    self._tips:setString(str)
end