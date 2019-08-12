include "app.gameClass.Buff" 

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class Skill
local Skill=class("Skill"){
    CLASS_DEBUG(false);
}



function Skill:Skill(skillName,level,maxlevel,equipped,queryTable)
    level=tonumber(level)
    maxlevel=tonumber(maxlevel)
    queryTable = queryTable or ResScriptManager:getInstance().skillsQuery
    local skillInfo=queryTable:get(skillName)
    self.name=skillName
    self.picPath=
    Path:getInstance().root.icon..skillInfo.icon..".jpg"
    local tag=skillInfo.tag or ""
    self.tag=set( tag:split("#") )
    self.castSize=skillInfo.castSize or 1
    self.coverSize=skillInfo.coverSize or 0
    self.level=0
    self.maxlevel=maxlevel
    self.animation=skillInfo.animation or "test"
    self.exp=0
    self.battleCd=0
    self.equipped=equipped
    self.info=skillInfo.info or ""
    self.hard=skillInfo.hard or 1
    self.tiaohe=skillInfo.tiaohe or 1
    self.type=skillInfo.type or 0
    self.suit=skillInfo.suit or 1
    self.power=skillInfo.basepower or 1
    self.step=skillInfo.step or 0
    self.cd=skillInfo.cd or 0
    self.costMp=skillInfo.costMp or 100
    self.costball=skillInfo.costball or 0
    self.buffs=map()
    self.triggers=array()
    self:updateLevel(level)
    self.maxExp=mod.Limit.getSkillExp(self.level)

    local buffs=skillInfo.buff and skillInfo.buff:split('#')
    if buffs then
        if buffs[1]~="" then
            for _,buff in ipairs(buffs) do
                local buff_t=buff:split('.')
                local buffName=buff_t[1]
                local buffLevel=buff_t[2] and tonumber(buff_t[2]) or 1
                local buffRound=buff_t[3] and tonumber(buff_t[3]) or 1
                local buffProb=buff_t[4] and tonumber(buff_t[4]) or 1
                buffProb=buffProb/100
                self.buffs:insert(buffName,
                    Buff:create(buffName,buffLevel,buffRound,buffProb)
                )
            end
        end
    end
    local triggers=skillInfo.trigger

    if triggers then
        for _,trigger in ipairs(triggers) do
            if trigger.name~="" then
            self.triggers:push_back(
                SkillTrigger:create(self,trigger.name,trigger.argvs,trigger.lv)
            )
            end
        end
    end
end
function Skill:getPriority()
    return self.power
end


function Skill:getSuit()
    local isTiaohe=self.tiaohe==1
    if isTiaohe then
        return "阴阳调和",1
    else
        if self.suit and  self.suit>0 then
            return "阳",self.suit
        else
            return "阴",-self.suit
        end 
    end
    return "阴阳体调和",1
end

function Skill:getSuitStr()
    local isTiaohe=self.tiaohe==1
    local str=""
    if isTiaohe then
        str="阴阳调和"
    else
        if self.suit and self.suit>0 then
            str=string.format("阳: %i%%",self.suit*100)
        else
            str=string.format("阴: %i%%",-self.suit*100)
        end 
    end
    return str
end

function Skill:getBuffStr()
    local str=""
    for _,buff in self.buffs:iter() do
        str=str..buff:toString().."\n"      
    end
    return str
end

function Skill:getTriggerStr()
    local str=""
    for _,trigger in self.triggers:iter() do
        str=str..trigger:toString().."\n"
    end
    return str
end

function Skill:addExp(power)
    if self.level>=self.maxlevel then
        return 
    end
    if self.level<mod.Limit.maxSkillLevel then
        power=power or 0
        local expAdd=self.level
        self.exp=self.exp+expAdd*(1+power)
        while (self.exp>=self.maxExp) and (self.level<self.maxlevel) do
            self.exp=self.exp-self.maxExp
            self.maxExp=mod.Limit.getSkillExp(self.level)
            self:updateLevel(1)
        end
    end
end

function Skill:updateLevel(level)
    level=level or 1
    self.level=self.level+level
    local flag=mod.SkillExtend.SkillUpdateLevelExtend(self,level)
    --如果扩展返回true则不执行后续语句
    if flag then return false end
    self.power=self.power+level*self.step
    return true
end

function Skill:toString(type)
    local str=""
    type= type or "detail"
    if type=="simple" then
        str=
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
        local tag_array=array()
        for key in self.tag:iter() do
            tag_array:push_back(key)
        end
        strArr:push_back(
            string.format("标签 %s",tag_array:join("  "))
        )
        strArr:push_back(
            string.format("威力 %f",self.power )
        )
        strArr:push_back(
            string.format("技能类型 %i",self.type )
        )
        strArr:push_back(
            string.format("消耗内力 %i",self.costMp )
        )
        strArr:push_back(
            string.format("技能CD %i",self.cd )
        )
        strArr:push_back(
            string.format("适性 %s",self:getSuitStr() )
        )
        strArr:push_back(
            string.format("buff效果 %s",self:getBuffStr() )
        )
        strArr:push_back(
            string.format("被动增益: \n %s",self:getTriggerStr())
        )
        str=table.concat(strArr:getData(), "\n" )
    end
    return str
end

function Skill:check(aoyi,battleSprite)
    local flag=true
    for _,condition in pairs(aoyi.condition) do
        flag=mod.SkillExtend.AoyiConditionExtend(condition,battleSprite)
        if flag==false then break end
    end
    return flag
end

function Skill:getCastArray(battleSprite)
    local castArr=array()
    local sourcePos=battleSprite.pos
    local template=array()
    local battleField=battleSprite.battleField
    
    mod.SkillExtend.SkillCastArrayExtend(self,battleField,template)
    local newCastSize=mod.SkillExtend.SkillCastSizeExtend(self,battleSprite)

    local cAbility=newCastSize or self.castSize or 1

    if self.type==1 then
        cAbility=1
    elseif self.type==2 then
        cAbility=1
    elseif self.type==3 then
        cAbility=1
    end

    if  template:empty() then
        template:merge(battleField.fieldManager:getPointArray(cAbility))
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



function Skill:getCoverArray(sourcePos,point,battleField)
    local coverPoints=array()
    local template=array()
    local newCoverSize=mod.SkillExtend.SkillCoverSizeExtend(self)
    local coverSize= newCoverSize or self.coverSize or 0

    mod.SkillExtend.SkillCoverArrayExtend(self,sourcePos,point,battleField,template)
    
    local dir=nil
    if self.type==0 then
        dir=ENUM.SKILL_DIRECTION.ALL
    elseif self.type==1 then
        local xdir=point.x-sourcePos.x
        local ydir=point.y-sourcePos.y
        if xdir>0 and ydir==0 then
            dir=ENUM.SKILL_DIRECTION.JIAN_RIGHT
        elseif xdir<0 and ydir==0 then
            dir=ENUM.SKILL_DIRECTION.JIAN_LEFT
        elseif xdir==0 and ydir>0 then
            dir=ENUM.SKILL_DIRECTION.JIAN_UPPER
        elseif xdir==0 and ydir<0 then
            dir=ENUM.SKILL_DIRECTION.JIAN_LOWWER
        else
            dir=ENUM.SKILL_DIRECTION.ALL
        end
     
    elseif self.type==2 then
        local xdir=point.x-sourcePos.x
        local ydir=point.y-sourcePos.y
        if ydir==0 then
            dir=ENUM.SKILL_DIRECTION.DAO_UP_DOWN
            
        elseif xdir==0 then
            dir=ENUM.SKILL_DIRECTION.DAO_LEFT_RIGHT
        else
            dir=ENUM.SKILL_DIRECTION.ALL
        end

    elseif self.type==3 then
        dir=ENUM.SKILL_DIRECTION.ALL
    end


    if  template:empty() then
        template:merge(battleField.fieldManager:getPointArray(coverSize,dir))
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

function Skill:onAttack(expAdd,prob,battleSprite)
    local skill=self:toAoyi(prob,battleSprite)
    skill:addExp(expAdd)
    skill.battleCd=skill.cd
    return skill
end


function Skill:getUniqueSkills()

    local skills=array()
    local uniqueSkills=ResScriptManager:getInstance().uniqueSkillsQuery:get(self.name)
    if uniqueSkills==nil then return skills end
    for _,uniqueStruct in uniqueSkills:iter() do
        if self.level>=uniqueStruct.requirelv then
            local unique= UniqueSkill:create(self,uniqueStruct)
            skills:push_back(unique)
        end
    end
    return skills
end


function Skill:toAoyi(prob, battleSprite)
    local aoyiArr=ResScriptManager:getInstance().aoyisQuery:get(self.name)
    if aoyiArr==nil then return self end
    for _,aoyi in aoyiArr:iter() do
        local cLevel=self.level>=aoyi.level
        local cProb=probability(aoyi.probability+prob)
        local cCond=self:check(aoyi,battleSprite)
        if cLevel and cProb and cCond then
            return Aoyi:create(self,aoyi)
        end
    end
    return self
end

