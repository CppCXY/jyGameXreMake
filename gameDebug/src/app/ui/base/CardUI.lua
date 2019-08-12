_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("CardUI"){
    super(cc.DrawNode);
    super(LUIObject);
    SINGAL.touched("touch","event","CardUI");
    
    property "onTouch" {WRITE.onCardTouch};
    public{
        FUNCTION.CardUI(function(self,size,color)
            self=self:__super()
            self:LUIObject()
            self:setCascadeOpacityEnabled(true)
            local pointArray={
                cc.p(0,0),
                cc.p(size.width,0),
                cc.p(size.width,size.height),
                cc.p(size.width/5,size.height),
                cc.p(0,size.height*0.8)
            }

            local fill=color or cc.c4f(0,0,0,0.6)
            self:drawPolygon(pointArray,5,fill,2,fill)
            self:setContentSize(size)
        end);

        FUNCTION.setText(function(self,text,fontSize)
            
            if self._label==nil then
                fontSize=fontSize or 20
                self._label=createLabel(text,fontSize)
                :setAnchorPoint(0,0)
                :setPosition(0,0)
                :setTag(10)
                :addTo(self)
            else
                self._label:setString(text)
            end
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
                    self:touched(touch,event,self)
                end
            end
            onNodeTouchIn(self,onBegin,move,onEnd,swall)
        end);


    };

    protected{
        MEMBER._label;
    };

}

