include "app.gameClass.skill.Skill"
include "app.gameClass.Buff"
 

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
---@class UniqueSkill : Skill
class("UniqueSkill"){
    CLASS_DEBUG(false);
}

function UniqueSkill:UniqueSkill(pSkill,uniqueStruct)
    --实例继承
    inheritInstance(self,pSkill)
    self.pSkill=pSkill
    --此处和aoyi字段不同，是因为原始配置表如此，下版本会修改配置表
    self.power=self.power+uniqueStruct.poweradd
    self.name=uniqueStruct.name
    self.info=uniqueStruct.info
    self.hard=uniqueStruct.hard
    self.animation=uniqueStruct.animation
    self.cd=uniqueStruct.cd
    self.costball=uniqueStruct.costball
    self.picPath=Path:getInstance().root.icon..uniqueStruct.icon..".jpg"
    self.castSize=uniqueStruct.castSize
    self.coverSize=uniqueStruct.coverSize
    
    self.battleCd=0
    local mybuffs=map()
    mybuffs:merge(self.buffs)
    
    local buffs=uniqueStruct.buff and uniqueStruct.buff:split('#')
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



function UniqueSkill:addExp(power)
    self.pSkill:addExp(power)
end
function UniqueSkill:toString()
    local strArr=array()
    strArr:push_back(
        string.format( "%s",self.name )
    )
    strArr:push_back(
        string.format("威力 %i",self.power)
    )
    strArr:push_back(
        string.format("消耗内力 %i",self.costMp )
    )
    strArr:push_back(
        string.format("消耗怒气 %i",self.costball )
    )
    
    strArr:push_back(
        string.format("技能CD %i/%i",self.battleCd,self.cd )
    )
    strArr:push_back(
        string.format("适性 %s",self:getSuitStr() )
    )
    strArr:push_back(
        string.format("buff效果 \n%s",self:getBuffStr() )
    )
    return strArr:join(" \n ")
end


