include "app.gameClass.trigger.init"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
---@class Item
class("Item"){
    CLASS_DEBUG(false);

}


function Item:Item(name,num)
    local itemInfo=ResScriptManager:getInstance().itemsQuery:get(name)
    self.name=name
    self.desc=itemInfo.desc
    self.number=num or 1
    self.type=itemInfo.type
    self.identifier=self.name..self.type
    self.triggers=array()
    self.needs=array()
    self.talents=set()
    self.cd=itemInfo.cd
    self.castSize=itemInfo.castSize or 0
    self.coverSize=itemInfo.coverSize or 0
    self.picPath=ResScriptManager:getInstance().resourcesQuery:get(itemInfo.pic).value
    local triggers=itemInfo.trigger
    if triggers then
        for _,trigger in ipairs(triggers) do
            if trigger.name~="" then
                self.triggers:push_back(
                    Trigger:create(trigger.name,trigger.argvs))
            end
        end
    end
    local needs=itemInfo.need
    if needs then
        for _,need in ipairs(needs) do
            if need.name~="" then
            self.needs:push_back(
                Need:create(need.name,need.argvs)
            )
            end
        end
    end
    local talents=itemInfo.talent:split("#")
    if talents[1]~="" then
        for _,talent in ipairs(talents) do
            self.talents:insert(talent)
        end
    end    
end

function Item:addNumber(num)
    self.number=self.number+num
end

---@param role Role
---@return void
function Item:onEffect(role)
    for _,tr in self.triggers:iter() do 
        if tr.name=="talent" then
            role:addTalent(tr.argvs)
        elseif tr.name=="specialskill" then
            role:addSpecialSkill(SpecialSkill:create(tr.argvs))
        elseif tr.name=="AddMaxHp" then
            role.maxhp=role.maxhp+tonumber(tr.argvs)
        elseif tr.name=="AddMaxMp" then
            role.maxmp=role.maxmp+tonumber(tr.argvs)
        elseif tr.name=="attribute" then
            local trName,value=tr.argvs:unpack()
            role[trName]=role[trName]+(tonumber(value) or 0)
        end
    end
end
function Item:use(role)
    local typeset=set({5,6,7,8,9,10})
    if typeset:has(self.type) then
       self:onEffect(role)
       self:remove() 
    end
end

function Item:getCastArray(battleSprite)
    local castArr=array()
    local sourcePos=battleSprite.pos
    local template=array()
    local battleField=battleSprite.battleField
        
    mod.ItemExtend.ItemCastArrayExtend(self,battleField,template)

    if  template:empty() then
        template:merge(battleField.fieldManager:getPointArray(self.castSize))
    end

    template:for_each(function (_,point)
        point.x=sourcePos.x+point.x
        point.y=sourcePos.y+point.y
        if battleField.fieldManager:inField(point.x,point.y) then
            castArr:push_back(point)
        end
    end)

    return castArr
end

function Item:getCoverArray(sourcePos,point,battleField)
    local coverPoints=array()
    local template=array()

    
    mod.ItemExtend.ItemCoverArrayExtend(self,sourcePos,point,battleField,template)

    if  template:empty() then
        template:merge(battleField.fieldManager:getPointArray(self.coverSize))
    end

    template:for_each(function (_,pt)
        pt.x=point.x+pt.x
        pt.y=point.y+pt.y
        if battleField.fieldManager:inField(pt.x,pt.y) then
            coverPoints:push_back(pt)
        end
    end)

    return coverPoints
end

function Item:onResult(result)
    for _,trigger in self.triggers:iter() do
        trigger:onResult(result)
    end
end

function Item:remove()
    RuntimeData:getInstance():removeItem(self.identifier)
end

---@param role Role
function Item:check(role)
    local flag=true
    for _,need in self.needs:iter() do
        if not need:check(role) then
            flag=false
            break
        end 
    end
    return flag
end
---@param type string @ "detail" "info" "need" "trigger"
function Item:toString(type)
    local str=""
    type=type or "detail"
    if type=="simple" then
        str=str..self.name.."\n"
    elseif type=="info" then
        str=str..self.name.."\n"..
        self.desc.."\n"..
        "冷却时间:"..self.cd.."回合".."\n"
    elseif type=="battleShow" then
        str=str..self.name.."\n"..
        "数量:"..self.number
    elseif type=="need" then
        str=str.."条件:\n"
        for _,need in self.needs:iter() do
            str=str..need:toString().."\n"
        end
    elseif type=="trigger" then
        str=str.."物品效果:\n"
        for _,trigger in self.triggers:iter() do
            str=str..trigger:toString().."\n"
        end
    elseif type=="detail" then
        str=str..self:toString("info").."\n"..
        self:toString("need").."\n"..
        self:toString("trigger").."\n"
    end
    return str
end

