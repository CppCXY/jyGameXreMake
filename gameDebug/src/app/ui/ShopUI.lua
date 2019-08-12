include "app.ui.base.init"
include "app.ui.MatUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

class("ShopUI"){
    super(cc.Layer);
    super(LUIObject);

    protected{
        MEMBER._current();
        MEMBER._shopInstance();
        MEMBER._scroll();
        MEMBER._mat();
        MEMBER._tips();
    };

    public{
        FUNCTION.ShopUI(function(self,shopName)
        self=self:__super()
        self:LUIObject()

        self.onTouch=true

        self._current=nil
    
        local shop=ResScriptManager:getInstance().shopNamesQuery:get(shopName)
        local backPath=ResScriptManager:getInstance().resourcesQuery:get(shop.pic).value
        local music=shop.music
        local shopInstance=ResScriptManager:getInstance().shopItemsQuery:get(shopName)
        local musicItem=ResScriptManager:getInstance().resourcesQuery:get(music,{value=""}).value
        if value~=nil then
            Audio:getInstance():playMusic(musicItem)
        end
        self:setBackGround(backPath,cc.size(display.cx*2,display.cy*2))
        
        self._shopInstance=shopInstance
        self:showItemMat()
        local detailContentSize=cc.size(display.cx*1.5,display.cy/2)
        
        local detail=
        createBlock(detailContentSize)
        :setPosition(display.cx/4,0)
        :setAnchorPoint(0,0)
        :addTo(self)
    
        local scroll=
        ScrollView()
        :setContentSize(detailContentSize)
        :setPosition(0,0)
        :addTo(detail)
        self._scroll=scroll
    
        local card=
        CardUI(cc.size(display.cx*0.2,display.cy/9))
        :setAnchorPoint(0,1)
        :setPosition(display.cx*1.8,display.cy/2)
        :addTo(self)
        :setText("交易",25)
    
        card.onTouch=true
        connect(card,"touched",self,"dealItem")
    
        --返回
        local back=
        CardUI(cc.size(display.cx*0.2,display.cy/9))
        :setAnchorPoint(0,1)
        :setPosition(display.cx*1.8,display.cy*7/18)
        :addTo(self)
        :setText("返回",25)
    
        back.onTouch=true
        connect(back,"touched",self,"remove")
    end);
    FUNCTION.dealItem(function(self)
        if  self._current then
            if self._current:checkLimit() and self._current:checkNeed() then
                self._current:toItem()
                self:setDetailText(self._current:toString())
            else
                self:showTips("条件不足无法交易")
            end
        end
    end);
    FUNCTION.setDetailText(function(self,str)
        local textNode=createLabel(str,18)
        textNode:setWidth(display.cx*1.4)
        self._scroll:setInnerNode(textNode)
        
    end);

    FUNCTION.showItemMat(function(self)
        self:clear("_mat")
        
        local dataSource=array()
        local colNum=6
        local contentSize=cc.size(display.cx*1.5,display.cy*1)

        for _,shopitem in self._shopInstance:iter() do
            dataSource:push_back(ShopItem(shopitem))
        end

        local elemsetting=function (card,shopItem,cellWidth,cellHeight)
            local path=shopItem.picPath
            local sprite=
            cc.Sprite:create(path)
            :setPosition(0,0)
            :setAnchorPoint(0,0)
            :setContentSize(cellWidth*0.6,cellWidth*0.6)
            :addTo(card)

            local name=createLabel(shopItem.name,18)
            :setAnchorPoint(0,1)
            :setPosition(cellWidth*0,cellHeight*0.85)
            :setWidth(18)
            :addTo(card)
            
        end
   
        local matUI=MatUI(contentSize,dataSource,colNum,nil,elemsetting)
        :setPosition(display.cx,display.cy)
        :setBackGround()
        :setAnchorPoint(0.5,0.5)
        :addTo(self,998)

        self._mat=matUI

        connect(matUI,"elemTouched",self,"setCurrent")
        
    end);

    FUNCTION.reflush(function(self)
        self:showItemMat()
        
    end);

    FUNCTION.setCurrent(function(self,shopItem)
        self._current=shopItem
        self:setDetailText(shopItem:toString())
    end);

    FUNCTION.showTips(function(self,str)
        if  self._tips==nil then
            self._tips=createLabel("",20)
            self._tips:setAnchorPoint(0,0)
            self._tips:setPosition(display.cx/4,display.cy*1.8)
            self._tips:addTo(self,100)
        end
        self._tips:setString(str)
    end);


    }
}
