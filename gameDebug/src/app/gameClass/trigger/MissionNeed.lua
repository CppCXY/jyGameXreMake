include "app.gameClass.trigger.Need"
_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

class("MissionNeed"){
    CLASS_DEBUG(false);
    super(Need);
}

function MissionNeed:MissionNeed(mission,triggerName,triggerArgvs)
    self:Need(triggerName,triggerArgvs)
    self.mission=mission
end 
