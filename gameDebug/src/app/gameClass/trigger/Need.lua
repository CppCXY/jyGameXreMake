include "app.gameClass.trigger.Trigger"
_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

class("Need"){
    CLASS_DEBUG(false);
    super(Trigger);
}


function Need:Need(triggerName,triggerArgvs)
    self:Trigger(triggerName,triggerArgvs)
    self.key=mod.NeedExtend.getKey(self)
end 


---@param role Role | nil
---@return bool
function Need:check(role)
    return  mod.NeedExtend.NeedQuery[self.key](role,self)
end



function Need:toString(type)
    type=type or "detail"
    if type=="detail" then
        return mod.NeedExtend.getString(self)
    else
        return mod.NeedExtend.getCheckString(self)
    end
end
