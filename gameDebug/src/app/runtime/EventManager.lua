include "app.controller.DialogController"
include "app.runtime.RuntimeData"

_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"
using_namespace "ui"
using_namespace "controller"
using_namespace "game"
using_namespace "views"
class("EventManager"){
    CLASS_DEBUG(false);
    public{
        STATICFUNC.getInstance(function(cls)
            if  cls.s_instance==nil then
                cls.s_instance=cls()
            end
            return cls.s_instance
        end);
    }
}

function EventManager:EventManager()
    self.onEventType=map()
    self.onEventType:insert("map",
        function (mapName)
            cc.Director:getInstance()
            :replaceScene(views.MapScene:create(mapName))
        end
    )
    self.onEventType:insert("story",
        function (storyName)
            local story=ResScriptManager:getInstance().
            storysQuery:get(storyName)
            local controller=DialogController:create(story,
                cc.Director:getInstance():getRunningScene().mapName
            )
            DialogUI:create(controller)
            :addTo(cc.Director:getInstance():getRunningScene(),10)
            controller:nextAction()
        end
    )

    self.onEventType:insert("shop",
        function (shopName)
            ShopUI:create(shopName)
            :addTo(cc.Director:getInstance():getRunningScene())
        end
    )    
    self.onEventType:insert("battle",
        function (battleKey)
            local battleController=BattleController()
            local btScene=BattleScene:create(battleKey,battleController)
            btScene:showRoleSelect(
                RuntimeData:getInstance().team
            )
            RuntimeData:getInstance().battleResultStatus=ENUM.BATTLE_RESULT_STATUS.WAIT
            cc.Director:getInstance():pushScene(btScene)
        end
    )
    self.onEventType:insert("endGame",
        function (value)
            cc.Director:getInstance():replaceScene(view.EndScene(value))
        end
    )
    self.onEventType:insert("default",
        function (value)
            print("warning : undefine event type ,value :"..value)
        end
    )


    mod.EventExtend.EventResultExtend(self.onEventType)
end



function EventManager:checkEvent(events)
    for _,event in pairs(events) do
        local probTrue=true
        if event.probability~=0  then
            if not probability(event.probability/100) then
                probTrue=false
            end
        end
        local repeatFlag=true 
        if event.repeatTimes=="once" then
            if RuntimeData:getInstance().onceStory:has(event.value) then
                repeatFlag=false
            end
        elseif type(event.repeatTimes)=="number" and event.repeatTimes~=0 then
            if RuntimeData:getInstance().limitTimesStory:get(event.value,0)>=event.repeatTimes then
                repeatFlag=false
            end
        end


        if probTrue and event.type~="" and repeatFlag then
            local conditions=event.condition
            if  self:checkConditions(conditions)  then
                return event
            end         
        end
        
    end
    return nil
end

function EventManager:checkConditions(conditions,tmpVaribles)
    for _,condition in pairs(conditions) do
        if not self:checkCondition(condition,tmpVaribles) then
            return false   
        end
    end
    return true
end

function EventManager:checkCondition(condition,tmpVaribles)

    local ctype=condition.type
    local value=condition.value
    local runtimeData=RuntimeData:getInstance()
  --  print(ctype)
    local modResult=mod.EventExtend.EventConditionExtend(condition)
    if modResult~=nil then
        return modResult
    end
    
    if ctype=="" then
        return true
    elseif ctype=="should_finish" then
        return runtimeData.storys:has(value)
    elseif ctype=="should_not_finish" then
        return not runtimeData.storys:has(value)
    elseif ctype=="in_team" then
        return runtimeData.team:has(value)
    elseif ctype=="not_int_team" then
        return not  runtimeData.team:has(value)
        --弃用
    elseif ctype=="key_in_team" then
        return runtimeData.team:has(value)
    elseif ctype=="key_not_in_team" then
        return not  runtimeData.team:has(value)
    elseif ctype=="has_time_key" then
        return true
    elseif ctype=="not_has_time_key" then
        return false
        --以上弃用
    elseif ctype=="in_time" then
        return runtimeData:inTime(value)
    elseif ctype=="not_in_time" then
        return not runtimeData:inTime(value)
    elseif ctype=="have_money" then
        return runtimeData:hasMoney(value)
    elseif ctype=="have_item" then
        return runtimeData:getItemNum(value)>0
    elseif ctype=="exceed_day"then
        return runtimeData:exceedDay(value)
    elseif ctype=="not_exceed_day" then
        return not runtimeData:exceedDay(value)
    elseif ctype=="in_menpai" then
        return runtimeData:inMenpai(value)
    elseif ctype=="not_in_menpai" then
        return not runtimeData:inMenpai(value)
    elseif ctype=="has_menpai" then
        return runtimeData:hasMenpai()
    elseif ctype=="in_round" then
        return runtimeData:inRound(value)
    elseif ctype=="not_in_round" then
        return not runtimeData:inRound(value)
    elseif ctype=="probability" then
        return probability(tonumber(value)/100)
    elseif ctype=="daode_more_than" then
        return runtimeData:daodeMoreThan(value)
    elseif ctype=="daode_less_than" then
        return runtimeData:daodeLessThan(value)
    elseif ctype=="haogan_more_than" then
        return runtimeData:haoganMoreThan(value)
    elseif ctype=="haogan_less_than" then
        return runtimeData:haoganLessThan(value)
    elseif ctype=="skill_more_than" then
        return runtimeData:skillMoreThan(value)
    elseif ctype=="level_greater_than" then
        return runtimeData:levelGreaterThan(value)
    elseif ctype=="dingli_greater_than" then
        return runtimeData:dingliGreaterThan(value)
    elseif ctype=="wuxing_greater_than" then
        return runtimeData:wuxingGreaterThan(value)
    elseif ctype=="dingli_less_than" then
        return runtimeData:dingliLessThan(value)
    elseif ctype=="wuxing_greater_than" then
        return runtimeData:wuxingGreaterThan(value)
    elseif ctype=="friendCount" then
        return runtimeData:friendCount(value)
    elseif ctype=="HAS.TAG" then
        return runtimeData.tag:has(value)
    elseif ctype=="NOT.HAS" then
        return not runtimeData.tag:has(value)
    elseif ctype=="CHAPTER" then
        return runtimeData.chapter==value
    elseif ctype=="HAS.MISSION" then
        return runtimeData.missions:has(value)
    elseif ctype=="COMPLETE.MISSION" then
        return runtimeData.missionsComplete:has(value)
    elseif ctype=="SCORES.GREATER.THAN" then 
        local key,val = unpack(value:split(","))
        return runtimeData.questionScores:get(key,0)>(tonumber(val) or 0)
    elseif ctype=="SCORES.LESS.THAN" then
        local key,val = unpack(value:split(","))
        return runtimeData.questionScores:get(key,0)<(tonumber(val) or 0)
    elseif ctype=="SCORES.EQUAL.TO" then
        local key,val = unpack(value:split(","))
        return runtimeData.questionScores:get(key,0)==(tonumber(val) or 0)
    elseif ctype=="INNER.VAR.EQUAL" then
        local key,val=unpack(value:split(","))

        if type(tmpVaribles)~="table" then
            print("当前不在INNER MODE ")
            return false
        end

        local newval=tonumber(val)
        if newval then
            return tmpVaribles[key]==newval
        else
            return tmpVaribles[key]==val
        end
    elseif ctype=="INNER.VAR.GREATER.THAN" then
        local key,val=unpack(value:split(","))
        
        if type(tmpVaribles)~="table" then
            print("当前不在INNER MODE ")
            return false
        end

        local newval=tonumber(val)
        if newval then
            return tmpVaribles[key]>newval
        end
    elseif ctype=="INNER.VAR.LESS.THAN" then
        local key,val=unpack(value:split(","))
        
        if type(tmpVaribles)~="table" then
            print("当前不在INNER MODE ")
            return false
        end

        local newval=tonumber(val)
        if newval then
            return tmpVaribles[key]<newval
        end
    elseif ctype=="ITEM.GREATER.THAN" then
        local itemName,num=unpack(value:split(","))
        num=tonumber(num) or 0

        return runtimeData:getItemNum(itemName)>num
  
    elseif ctype=="ITEM.LESS.THAN" then
        local itemName,num=unpack(value:split(","))
        num=tonumber(num) or 0
        return runtimeData:getItemNum(itemName)<num
    else
        print("未知的条件 type: ",ctype," ,value: ",value)
        return false

    end
return false
end

function EventManager:doEvent(event)
    local luaf=self.onEventType:get(event.type,self.onEventType:get("default"))
    if event.repeatTimes=="once" then
        RuntimeData:getInstance().onceStory:insert(event.value)
    elseif type(event.repeatTimes)=="number" and event.repeatTimes~=0 then
        RuntimeData:getInstance().limitTimesStory:insert(event.value,
        RuntimeData:getInstance().limitTimesStory:get(event.value,0)+1
        )
    end
    
    luaf(event.value)
end

function EventManager:console(type,...)
    self.onEventType:get(type,self.onEventType:get("default"))(...)
end

