include "app.gameClass.Buff"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

--并不真的继承Skill
---@class Aoyi : Skill0
class("Aoyi"){
    CLASS_DEBUG(false);
}
 

function Aoyi:Aoyi(pSkill,aoyiStruct)
    inheritInstance(self,pSkill)
    self.pSkill=pSkill
    self.power=self.power+aoyiStruct.addPower
    self.name=aoyiStruct.name
    local mybuffs=map()
    mybuffs:merge(self.buffs)
    
    local buffs=aoyiStruct.buff and aoyiStruct.buff:split('#')
    if buffs then
        if buffs[1]~="" then
            for _,buff in ipairs(buffs) do
                local buff_t=buff:split('.')
                local buffName=buff_t[1]
                local buffLevel=buff_t[2] and tonumber(buff_t[2]) or 1
                local buffRound=buff_t[3] and tonumber(buff_t[3]) or 1
                local buffProb=buff_t[4] and tonumber(buff_t[4]) or 1
                mybuffs:insert(buffName,
                    Buff:create(buffName,buffLevel,buffRound,buffProb)
                )
            end
        end
    end
    self.buffs=mybuffs
end

function Aoyi:addExp(power)
    self.pSkill:addExp(power)
end

