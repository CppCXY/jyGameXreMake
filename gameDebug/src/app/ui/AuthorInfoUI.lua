
include "app.ui.base.init"
include "app.ui.SelectUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("AuthorInfoUI")
{
    super(cc.Layer);
    super(LUIObject);

    public{
        FUNCTION.AuthorInfoUI(function(self)
            self=self:__super()
            self:LUIObject()
            self.onTouch=true
            local size=cc.Director:getInstance():getVisibleSize()

            local card=
            CardUI(cc.size(display.cx/4,display.cy/8))
            :setAnchorPoint(1,1)
            :setPosition(display.cx/4,display.cy*0.7)
            :addTo(self,10)

            card.onTouch=true
            connect(card,"touched",self,"remove");

            local childlb=createLabel("返回",25)
            :setAnchorPoint(0,0)
            :setPosition(0,0)
            :setTag(10)
            :addTo(card)

            self._infoManager=mod.AuthorInfoArray

            local updateLog=ResScriptManager:getInstance().updateLog
            local updateInfoTable=array()
            for key,up in updateLog:iter() do
                updateInfoTable:push_back(
                    key.."\n"..up.context
                )    
            end
            self._infoManager:push_back({key="更新日志",info=updateInfoTable:join("\n\n")})

            self:createInfoDisplay()
            
        end);

        FUNCTION.getInfoArray(function(self)
            return self._infoManager 
             
         end)
    };

    protected{
        FUNCTION.getList(function(self)
            local stringArr=array()
            for _,info in self._infoManager:iter() do
                stringArr:push_back(info.key)
            end
            return stringArr           
        end);

        FUNCTION.createInfoDisplay(function(self)
            local infoDisplay=
            SelectUI(cc.size(display.cx*1.5,display.cy*1.5))
            :addTo(self,100)
            :setPosition(display.cx/4,display.cy/4)

            infoDisplay:setItems(self:getList(),function(view,cell)
                local index=cell:getIdx()+1
                local info=self:getInfoArray():at(index,{info="空"})
                return createLabel(info.info,20):setWidth(display.cx)
            end)
            
        end);


    };

    protected{
        MEMBER._infoDisplay();
        MEMBER._infoManager();


    };




}



function AuthorInfoUI:setInfoDisplay()
    if  self._infoDisplay then
        self._infoDisplay:removeFromParent()
        self._infoDisplay=nil
    end 
    local stringArr=self:getList()
    self:CSS({
        name="infoDisplay",
        cls=SelectUI,
        create={cc.size(display.cx*1.5,display.cy*1.5)},
        setting={
            setBackGround={nil,cc.size(display.cx*1.5,display.cy*1.5)},
            setDetail={},
            setItems={strArr,function(view,cell)
                local index=cell:getIdx()+1
                local info=self.infoManager:at(index,{info="空"})
                return createLabel(info.info,20)
            end},
           
            setPosition={display.cx/4,display.cy/4}
        },
    })
end

