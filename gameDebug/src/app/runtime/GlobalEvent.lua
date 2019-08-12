_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"

--弃用
class("GlobalEvent"){
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

function GlobalEvent:GlobalEvent()
    self._data=
    ResScriptManager:getInstance().globalEventsQuery
end
function GlobalEvent:del(key)
    self._data:del(key)
end


