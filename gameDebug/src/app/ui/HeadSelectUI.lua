include "app.ui.base.init"
include "app.ui.MatUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

class("HeadSelectUI"){
    super(cc.Layer);
    super(LUIObject);

    protected{
        MEMBER._role();
        MEMBER._mat();
        MEMBER._tips();
    };

    public{
        FUNCTION.HeadSelectUI(function(self,role)
        self=self:__super()
        self:LUIObject()

        self.onTouch=true

        self._role=role
        
    end);

    FUNCTION.showHeadSelect(function(self,dataSource)
        self:clear("_mat")
        
   
        local colNum=4
        local contentSize=cc.size(display.cx*1.5,display.cy*1.5)

        local elemsetting=function (card,item,cellWidth,cellHeight)
            
            local sprite=
            cc.Sprite:create(item.picPath)
            :setPosition(0,0)
            :setAnchorPoint(0,0)
            :setContentSize(cellWidth*0.6,cellWidth*0.6)
            :addTo(card)
            
        end
   
        local matUI=MatUI(contentSize,dataSource,colNum,nil,elemsetting)
        :setPosition(display.cx,display.cy)
        :setAnchorPoint(0.5,0.5)
        :addTo(self,998)

        self._mat=matUI

        connect(matUI,"elemTouched",self,"select")
        return self
    end);

    FUNCTION.select(function(self,item)
        self._role.picPath=item.picPath
        self:remove()
    end);


    FUNCTION.showTips(function(self,str)
        if  self._tips==nil then
            self._tips=createLabel("",20)
            self._tips:setAnchorPoint(0,0)
            self._tips:setPosition(display.cx/4,display.cy*1.8)
            self._tips:addTo(self,100)
        end
        self._tips:setString(str)
        return self
    end);


    }
}
