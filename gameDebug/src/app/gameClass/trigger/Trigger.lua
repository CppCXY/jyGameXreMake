_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class Trigger
---@field public name string
---@field public argvs string
class("Trigger"){
    NO_AUTO_INHERIT();
    CLASS_DEBUG(false)
}


function Trigger:Trigger(triggerName,triggerArgvs)
    self.name=triggerName
    self.argvsString=triggerArgvs
    self.argvs=array( triggerArgvs:split(','))
    self.template=ResScriptManager:getInstance().resourcesQuery
    :get("ItemTrigger."..triggerName,{value="未定义trigger:"..triggerName}).value
end

function Trigger:addToAddition(addition)
    local call=mod.TriggerExtend.triggerQuery[self.name]
    if call then
        call(self.argvs,addition)
    else
        print(self.name," 没有注册效果 ")
    end
end

function Trigger:onResult(result)
    mod.TriggerExtend.useForBattleSpriteResult(self,result)
end

function Trigger:check()
    return true
end

function Trigger:toString()
    return string.gsub(self.template,"{.-}",function (s)
        local index=string.match(s,"%s-(%d+)%s-")
        if index then
            return self.argvs:at(tonumber(index)+1)
        else
            return nil
        end
    end)
end
    