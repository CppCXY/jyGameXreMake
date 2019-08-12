_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"


---@class LNEvent
local LNEvent=class("LNEvent"){
    CLASS_DEBUG(false);
}


function LNEvent:LNEvent(name,connectType,callBack)
    self.name=name
    self.type=connectType
    self.callBack=callBack
end

function LNEvent:doEvent(buffers)
    self.callBack(buffers)
    if  self.type=="once" then
        self:remove()
    end
end
function LNEvent:bindParent(parent)
    self.parent=parent
end
function LNEvent:remove()
    self.parent:del(self.name)
end

