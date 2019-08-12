_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("RectCardUI"){
    super(cc.DrawNode);
    super(LUIObject);

    property "onTouch" {WRITE.onCardTouch};
    public{
        FUNCTION.RectCardUI(function(self,size,color)
            self=self:__super()
            self:LUIObject()
            self:setCascadeOpacityEnabled(true)
            local pointArray={
                cc.p(0,0),
                cc.p(size.width,0),
                cc.p(size.width,size.height),
                cc.p(0,size.height)
            }

            local fill=color or cc.c4f(0,0,0,0.6)
            self:drawPolygon(pointArray,4,fill,2,fill)
            self:setContentSize(size)
        end);

        FUNCTION.setText(function(self,text,fontSize)
            fontSize=fontSize or 20
            createLabel(text,fontSize)
            :setAnchorPoint(0,0)
            :setPosition(0,0)
            :setTag(10)
            :addTo(self)
            
            return self
        end);

        FUNCTION.onCardTouch(function(self,swall)
            local onBegin=function(touch,event)

                self:setOpacity(128)
                
            end
            local move=function() 
                self:setOpacity(255)
            end
            
            local onEnd=function(touch,event,inRect)
                self:setOpacity(255)
                if inRect and self:isVisible()==true then
                    self:touched(touch,event)
                end
            end
            onNodeTouchIn(self,onBegin,move,onEnd,swall)
        end);


    };

}