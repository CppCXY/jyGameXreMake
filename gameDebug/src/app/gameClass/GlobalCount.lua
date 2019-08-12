
_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
using_namespace "component"

class("GlobalCount"){
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


function GlobalCount:GlobalCount()
    self.number=10000
end
function GlobalCount:get()
    self.number=self.number+1
    return self.number
end

