include "app.gameClass.trigger.Trigger"
_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class SkillTrigger
class("SkillTrigger"){
    CLASS_DEBUG(false);
    super(Trigger);
}
function SkillTrigger:SkillTrigger(parent,triggerName,triggerArgvs,showLevel)
    self:Trigger(triggerName,triggerArgvs)
    self.level=showLevel
    self.parent=parent
end 

function SkillTrigger:check()
    return self.parent.level>=self.level and self.parent.equipped
end

function SkillTrigger:toString()
    if self.parent.level>=self.level then
        return self:getSuperMethod("Trigger","toString")(self)
    else
        return string.format( "(%i)该效果未解锁",self.level )
    end
end
