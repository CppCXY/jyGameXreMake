include "app.gameClass.item.Item"
include "app.gameClass.trigger.Need"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

class("Mission"){
    CLASS_DEBUG(false);
}

function Mission:Mission(missionInfo)
    self.name=missionInfo.missionName
    self.limit=missionInfo.limit
    self.desc=missionInfo.desc
    self.needs=array()
    self.costs=array()
    self.tag=missionInfo.tag
    self.place=missionInfo.belongMissionPlace
    self.completeDesc=missionInfo.completeDesc
    self.identifier=self.place..self.name
    self.events=map()
    self.isComplete=false
    local needs=missionInfo.need
    local costs=missionInfo.cost


    if needs then
        for _,need in pairs(needs) do
            if need.type~="" then
                self.needs:push_back(MissionNeed(self,need.type,need.value))
            end
        end
    end

    if costs then
        for _,cost in pairs(costs) do
            if cost.type~="" then
                self.costs:push_back(
                    {
                        name=cost.type,
                        value=array(cost.value:split(","))
                    }
                )
            end
        end
    end
    
end

function Mission:cost()
    for _,cost in self.costs:iter() do
        if cost.name=="item" then

            local name=cost.value:at(1)
            local num= tonumber(cost.value:at(2)) or 0
            local item=RuntimeData:getInstance():getItemByName(name)
            if item then
                RuntimeData:getInstance():removeItem(item.identifier,num)
            else
                print("error: can not find item ".. name.."please check excel mission")
            end
        end

    end
end

function Mission:checkNeed()
    for _,need in self.needs:iter() do
        if not need:check() then
            return false
        end
    end
    RuntimeData:getInstance().tag:insert(self.tag)
    RuntimeData:getInstance().missionsComplete:insert(self.identifier)
    return true
end

function Mission:checkLimit()
    return 
    (RuntimeData:getInstance().MissionLimit:get(self.identifier,0)<self.limit)
end

function Mission:hasMission()
    return RuntimeData:getInstance().missions:has(self.identifier)
end

function Mission:acceptMission()
    local value=RuntimeData:getInstance().MissionLimit:get(self.identifier,0)
    RuntimeData:getInstance().MissionLimit:insert(self.identifier,1+value)
    RuntimeData:getInstance().missions:insert(self.identifier,self)
    self:register()
end
function Mission:complete()
    self.isComplete=true
    self:cost()
    RuntimeData:getInstance().missionsComplete:insert(self.identifier)
end


function Mission:register()
    for _,need in self.needs:iter() do
        local name=need.name 
        if name=="meet" then
            local event=self.events:get(ENUM.RUNTIME_EVENT.MEET_ROLE) or set()
            self.events:insert(ENUM.RUNTIME_EVENT.MEET_ROLE,event)
        elseif name=="kill" then
            local event=self.events:get(ENUM.RUNTIME_EVENT.KILL_ROLE) or map()
            event:insert(need.argvs:at(1),0)
            self.events:insert(ENUM.RUNTIME_EVENT.KILL_ROLE,event)
        end
    end
end

function Mission:interest(eventEnum,data)
    local event=self.events:get(eventEnum)
    if event then
        if eventEnum==ENUM.RUNTIME_EVENT.MEET_ROLE then
            return true
        elseif eventEnum==ENUM.RUNTIME_EVENT.KILL_ROLE then
            if event:get(data)  then
                return true
            end
        end
    end
    return false
end

function Mission:record(eventEnum,data)
    if eventEnum==ENUM.RUNTIME_EVENT.MEET_ROLE then
        self.events:get(eventEnum):insert(data)
    elseif eventEnum==ENUM.RUNTIME_EVENT.KILL_ROLE then
        self.events:get(eventEnum):insert(data,1)
    end
end

function Mission:toString(type)
    type=type or "detail"
    local str=""
    if type=="simple" then
        str=str..self.name.."\n"..
        self.desc
    elseif type=="detail" then
        local strArr=array()
        local hasMission=self:hasMission()

        for _,need in self.needs:iter() do
            strArr:push_back(
            need:toString()
            )
        end
        str=str..self.name.."\n"..
        self.desc.."\n"..
        "需求条件:\n"..
        table.concat(strArr:getData(),"\n").."\n"..
        "可接取次数: "..(self.limit-RuntimeData:getInstance().MissionLimit:get(self.identifier,0))..
        ((not hasMission) and "\n尚未接受任务\n" or "\n已接受任务\n")
    elseif type=="check" then
        local strArr=array()
        for _,need in self.needs:iter() do
            strArr:push_back(
            need:toString("check")
            )
        end
        str=str..self.name.."\n"..
        self.desc.."\n"..
        "需求完成:\n"..
        table.concat(strArr:getData(),"\n").."\n"..
        (self.isComplete and "已完成\n"..self.completeDesc or "未完成")

        
    end
    return str
end
