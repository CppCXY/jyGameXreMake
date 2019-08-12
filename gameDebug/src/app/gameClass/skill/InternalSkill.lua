include "app.gameClass.skill.Skill"
_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

class("InternalSkill"){
    CLASS_DEBUG(false);
    super(Skill);
}
function InternalSkill:InternalSkill(skillName,level,maxlevel,equipped)
    local internalSkillsQuery=ResScriptManager:getInstance().internalSkillsQuery
    local skillInfo=internalSkillsQuery:get(skillName)
    self.yin=skillInfo.yin/100
    self.yang=skillInfo.yang/100
    self.attack=skillInfo.attack
    self.critical=skillInfo.critical
    self.criticalp=skillInfo.criticalp or 0
    self.defence=skillInfo.defence
    self:Skill(skillName,level,maxlevel,equipped,internalSkillsQuery)
    self.type=5
end

function InternalSkill:updateLevel( level )
    local p=1.05
    if self:getSuperMethod("Skill","updateLevel")(self,level) then
        self.yin=self.yin*math.pow(p,level)
        self.yang=self.yang*math.pow(p,level)
        self.attack=self.attack*math.pow(p,level)
        self.critical=self.critical*math.pow(p,level)
        self.criticalp=self.criticalp*math.pow(p,level)
        self.defence=self.defence*math.pow(p,level)
    end
end


function InternalSkill:toString(type)
    local str=""
    type= type or "detail"
    if type=="simple" then
        str=str..
        self.name..(self.equipped and "  当前装备" or"").."\n"..
        "当前等级:"..self.level.."    "..
        "最大等级:"..self.maxlevel.."\n"
    elseif type=="detail" then
        local strArr=array()
        
        strArr:push_back(
            self.info
        )
        strArr:push_back(
            string.format("等级 %i/%i",self.level,self.maxlevel )
        )
        strArr:push_back(
            string.format("经验 %i/%i",self.exp,self.maxExp )
        )
        strArr:push_back(
            string.format("阴加成 %i%%",self.yin*100 )
        )
        strArr:push_back(
            string.format("阳加成 %i%%",self.yang*100 )
        )
        strArr:push_back(
            string.format("攻击加成 %i%%",self.attack*100)
        )
        strArr:push_back(
            string.format("暴伤加成 %i%%",self.critical*100 )
        )
        strArr:push_back(
            string.format("防御加成 %i%%",self.defence*100 )
        )
        strArr:push_back(
            string.format("被动增益: \n %s",self:getTriggerStr())
        )
        str=table.concat(strArr:getData(), "\n" )
    end
    return str
end
