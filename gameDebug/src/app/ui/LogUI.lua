
_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"

class("LogUI"){
    super(cc.Layer);
    super(LUIObject);

    public{
        FUNCTION.LogUI(function(self,dataSource)
            self=self:__super()
            self:LUIObject()

            local items=dataSource:reverse()
            local colNum=2
            local contentSize=cc.size(display.cx*1.5,display.cy*1.5)

            local elemsetting=function (card,showItem,cellWidth,cellHeight)
                local lb=
                createLabel(showItem,20)
                :setWidth(cellWidth*0.7)
                :setAnchorPoint(0,1)
                :setPosition(cellWidth*0.2,cellHeight*0.88)
                :addTo(card)
       
            end

            local matUI=MatUI(contentSize,items,colNum,3,elemsetting)
            :setPosition(display.cx,display.cy)
            :setAnchorPoint(0.5,0.5)
            :addTo(self,100)
            
            
        end);
        FUNCTION.setMenu(function(self)
            local card=
            CardUI(cc.size(display.cx/4,display.cy/8))
            :setPosition(display.cx/4,display.cy*1.8)
            :setAnchorPoint(1,1)
            :addTo(self)
            :setText("返回")
            card.onTouch=true
            connect(card,"touched",self,"remove")
            return self
        end);

    };

}
