include "app.ui.base.init"
include "app.ui.SelectUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"

using_namespace "game"
class("MissionUI"){
    super(cc.Layer);
    super(LUIObject);
    protected{
        MEMBER._missions();
        MEMBER._isAccept();
        MEMBER._current();
        MEMBER._infoDisplay();
        
    };
    public{
        FUNCTION.MissionUI(function(self,missionPlace)
            self=self:__super()
            self:LUIObject()
            self.onTouch=true
            local size=cc.Director:getInstance():getVisibleSize()
            local card=
            CardUI(cc.size(display.cx/4,display.cy/8))
            :setAnchorPoint(1,1)
            :setPosition(display.cx/4,display.cy*0.7)
            :setText("返回",25)
            :addTo(self,100)
            card.onTouch=true
            connect(card,"touched",card,function()
                self:remove()
            end)
            
            self._missions=array()
            
            if  missionPlace then
                self._isAccept=true
                local missions=ResScriptManager:getInstance().missionsQuery:get(missionPlace)
                for _,missionInfo in missions:iter() do
                    if  EventManager:getInstance():checkConditions(missionInfo.condition) then
                        self._missions:push_back(Mission(missionInfo))
                    end
                end
            else
                self._isAccept=false
                for _,mission in RuntimeData:getInstance().missions:iter() do
                    self._missions:push_back(mission)
                end
            end

            self:setInfoDisplay()       
            
        
        end);
        FUNCTION.setCurrent(function(self,id)
            self._current=id        
        end);

        FUNCTION.getList(function(self)
            local arr=array()
            for _,mission in self._missions:iter() do
                arr:push_back(mission.name)
            end
            return arr    
        end);

        FUNCTION.setInfoDisplay(function(self)
            self:clear("_infoDisplay")

            local infoDisplay=
            SelectUI(cc.size(display.cx*1.5,display.cy*1.5))
            :addTo(self,100)
            :setPosition(display.cx/4,display.cy/4)

            local missions=self._missions
            local isAccept=self._isAccept
            infoDisplay:setItems(self:getList(),function(view,cell)
                local index=cell:getIdx()+1
                local mission=missions:at(index)
                local lb=createLabel(mission:toString(
                    isAccept and "detail" or "check"
                ),20)
                lb:setWidth(display.cx)
                return lb
            end)
            
            connect(infoDisplay,"cellSelected",self,"setCurrent")

            self._infoDisplay=infoDisplay
        end);
        

        FUNCTION.setAcceptMission(function(self)
            local card=
            CardUI(cc.size(display.cx/4,display.cy/8))
            :setAnchorPoint(1,1)
            :setPosition(display.cx/4,display.cy*1.1)
            :setText("领取任务",25)
            :addTo(self)
             card.onTouch=true
            connect(card,"touched",self,"dealMission")
        end);

        FUNCTION.dealMission(function(self)
            local currentIndex=self._current
            if currentIndex==nil then return end
            local mission=self._missions:at(currentIndex)
            if  mission:checkLimit() then
                mission:acceptMission()
                self._infoDisplay:refresh()
            end
        end);

        FUNCTION.setCheckMission(function(self)
            local card=
            CardUI(cc.size(display.cx/4,display.cy/8))
            :setAnchorPoint(1,1)
            :setPosition(display.cx/4,display.cy*1.4)
            :setText("检查任务",25)
            :addTo(self)
            card.onTouch =true
            connect(card,"touched",self,"dealCheckMission")
        end);
        FUNCTION.dealCheckMission(function(self)
            local currentIndex=self._current
            local mission=self._missions:at(currentIndex)
            if (not mission.isComplete) and mission:checkNeed() then
                mission:complete()
                self._infoDisplay:refresh()
            end
        
        end);
    }
}


