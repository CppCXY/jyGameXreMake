require "app.gameClass.skill.Skill"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class SpecialSkill : Skill
class("SpecialSkill"){
    CLASS_DEBUG(false);
    super(Skill);


}

function SpecialSkill:SpecialSkill(skillName)
    local skillQuery=ResScriptManager:getInstance().specialSkillsQuery
    self:Skill(skillName,1,1,true,skillQuery)
    local skillInfo=skillQuery:get(skillName)
    self.coverType=skillInfo.coverType
    self.costball=skillInfo.costball
    self.hitself=skillInfo.hitself==1
    self.battleCd=0
end
function SpecialSkill:toString(type)
    local str=""
    type= type or "detail"
    if type=="simple" then
        str=str..
        self.name.."\n".."特殊攻击技能"
    elseif type=="detail" then
        local strArr=array()
        strArr:push_back(self.info)
        strArr:push_back(
            string.format("消耗怒气 %i",self.costball )
        )
        strArr:push_back(
            string.format("投掷范围 %i",self.castSize )
        )
        strArr:push_back(
            string.format("覆盖范围 %i",self.coverSize )
        )
        strArr:push_back(
            string.format("消耗内力 %i",self.costMp )
        )
        strArr:push_back(
            string.format("技能CD %i/%i",self.battleCd,self.cd )
        )
        strArr:push_back(
            string.format("buff效果 %s",self:getBuffStr() )
        )
        str=table.concat(strArr:getData(), "\n" )
    end
    return str
end



