include "app.gameClass.GlobalCount"
include "app.gameClass.item.Item"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class Equipment : Item 
class("Equipment"){
    CLASS_DEBUG(false);
    super(Item);
}

function Equipment:Equipment(name,number)
    self:Item(name,number)
    self.identifier=GlobalCount:getInstance():get()..name
end

function Equipment:use(role)
    local typeset=set({1,2,3,4})
    if typeset:has(self.type) then
        local eq=role:getEquipment(self.type)
        
        if eq then
            RuntimeData:getInstance():addItem(eq)    
        end
        role:addEquipment(self)
        self:remove() 
    end
end

function Equipment:toString(type)
    local str=""
    type=type or "detail"
    if type=="detail" then
        str=str..self:getSuperMethod("Item","toString")(self,type).."\n"
        ..self:toString("talent")
    elseif type=="talent" then
        for talent,_ in self.talents:iter() do
            str=str..
            string.format( "[%s]%s\n",
            talent,
            ResScriptManager:getInstance().resourcesQuery:get("天赋."..talent).value )
        end

    else 
        str=str..self:getSuperMethod("Item","toString")(self,type)
    end
    return str
end
