_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
---@class BattleStatistics
class("BattleStatistics"){
    CLASS_DEBUG(false);
}

function BattleStatistics:BattleStatistics(sprite)
    self.sprite=sprite
    --分数
    self.scores=100
    --攻击次数
    self.attackCount=0
    --受击次数
    self.hitCount=0
    --总伤害
    self.totalHurt=0
    --受到的伤害
    self.totalHittedHurt=0
    self.exp=0
end
function BattleStatistics:calculate()
    local scores=self.scores-self.attackCount/5-self.hitCount
    scores=scores<0 and 0 or scores
    local p=(self.totalHurt-self.totalHittedHurt)/self.sprite.maxHp
    if p>10 then p=10 end
    scores=scores+p*5
    self.scores=math.ceil(scores)
end
function BattleStatistics:onResult()
    self.sprite.role:addExp(self:getExpValue())
    local eqBookSkillStruct=self.sprite.role.addition.eqBookSkillStruct
    if eqBookSkillStruct then
        local skillName=eqBookSkillStruct.skillName
        local level=eqBookSkillStruct.level
        
        if eqBookSkillStruct.type=="skill" then
            ---@type Skill
            local skill=self.sprite.role.skills:get(skillName)
            if skill then
                if level>skill.maxlevel then
                    skill.maxlevel=level
                end
                skill:addExp(self:getExpValue())
            else
                skill=Skill(skillName,1,level,true)
                skill:addExp(self:getExpValue())
    
                self.sprite.role.skills:insert(skillName,skill)
            end
        elseif eqBookSkillStruct.type=="internalskill" then
            local skill=self.sprite.role.internalSkills:get(skillName)
            if skill then
                if level>skill.maxlevel then
                    skill.maxlevel=level
                end
                skill:addExp(self:getExpValue())
            else
                skill=InternalSkill(skillName,1,level,true)
                skill:addExp(self:getExpValue())
    
                self.sprite.role.internalSkills:insert(skillName,skill)
            end
        end
        


    end
end

function BattleStatistics:getExpValue( )
    return math.ceil(self.exp*(self.scores/100+1))
end

function BattleStatistics:toString()
    local str=
    self.sprite.role.name..":\n"..
    "攻击次数："..self.attackCount.."\n"..
    "受击次数："..self.hitCount.."\n"..
    "总伤害："..math.ceil(self.totalHurt).."\n"..
    "评价分数："..self.scores.."\n"..
    "获得经验："..self:getExpValue().."\n"
    return str
end