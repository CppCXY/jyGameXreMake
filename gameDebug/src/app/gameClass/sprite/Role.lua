
include "app.gameClass.item.init"
include "app.gameClass.skill.init"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class Role
local Role=class("Role"){
    CLASS_DEBUG(false);

}



function Role:Role(roleKey)
    local roleInfo=ResScriptManager:getInstance().rolesQuery:get(roleKey)
    self.picPath=ResScriptManager:getInstance().resourcesQuery:get(roleInfo.head).value
    self.key=roleInfo.key
    self.name=roleInfo.name
    self.animation=roleInfo.animation
    self.level=roleInfo.level
    self.hp=roleInfo.hp
    self.mp=roleInfo.mp
    self.wuxing=roleInfo.wuxing
    self.shenfa=roleInfo.shenfa
    self.bili=roleInfo.bili
    self.gengu=roleInfo.gengu
    self.fuyuan=roleInfo.fuyuan
    self.dingli=roleInfo.dingli
    self.quanzhang=roleInfo.quanzhang
    self.jianfa=roleInfo.jianfa
    self.daofa=roleInfo.daofa
    self.qimen=roleInfo.qimen
    self.wuxue=roleInfo.wuxue
    --保持兼容
    self.famale=roleInfo.female==0 and  "男" or "女"
    --新性别
    self.sex=roleInfo.female==0 and  "男" or "女"

    self.drawPath=ResScriptManager:getInstance().resourcesQuery:get(roleInfo.draw,{value=""}).value
    self.drawBackPath=ResScriptManager:getInstance().resourcesQuery:get(roleInfo.drawBack,{value=""}).value

    self.propertyPoint=0
    self.critical=150
    self.criticalp=2
    self.exp=0
    self.maxExp=mod.Limit.getRoleMaxExp(self.level)
    self.isDirty=true
    self.talents=set()
    self.equippedInternalSkill=nil
    self.equipments=array({false,false,false,false})
    self.skills=map()
    self.internalSkills=map()
    self.specialSkills=map()
    self.story= ResScriptManager:getInstance().resourcesQuery:get(
        "人物."..roleInfo.key,{value="无"}
    ).value  

    self.addition={}           
    local talents=roleInfo.talent:split("#")
    if talents[1]~="" then
        for _,talent in pairs(talents) do
            self.talents:insert(talent)
        end    
    end
    local eqs=roleInfo.items
    for _,eqName in pairs(eqs) do
        if eqName=="" then
            break
        end
        local eq=Equipment:create(eqName)
        self.equipments:set(eq.type,eq)
    end
    local skills=roleInfo.skills
    for _,skill in pairs(skills) do
        if skill.name=="" then
            break
        end
        self.skills:insert(skill.name,
            Skill:create(skill.name,skill.level,skill.maxlevel,true) 
        )
    end
    local internal_skills=roleInfo.internal_skills
    local eq_skill_name=""
    for _,skill in pairs(internal_skills) do
        if skill.name=="" then
            break
        end
        
        if skill.equipped==1 then
            eq_skill_name=skill.name
        end
        self.internalSkills:insert(skill.name,
        InternalSkill:create(skill.name,skill.level,skill.maxlevel,skill.equipped==1) 
        )
    end
    for _,skill in self.internalSkills:iter() do
        skill.equipped=(skill.name==eq_skill_name)
        if skill.equipped then
            self.equippedInternalSkill=skill
        end
    end
    local special_skills=roleInfo.special_skills
    for _,name in pairs(special_skills) do
        if name=="" then
            break
        end
        self.specialSkills:insert(
            name,SpecialSkill:create(name)
        )
    end
    self:setGrowTemplate(roleInfo.grow_template)
    
    self:updateAdditionTrigger()
end

function Role:additionInit()
    local addition=self.addition
    addition.attack=0
    addition.defence=0
    addition.sp=0
    addition.mingzhong=0
    addition.antiDebuff=0
    addition.xi=0
    addition.hp=0
    addition.mp=0
    addition.wuxing=0
    addition.shenfa=0
    addition.bili=0
    addition.gengu=0
    addition.fuyuan=0
    addition.dingli=0
    addition.quanzhang=0
    addition.jianfa=0
    addition.daofa=0
    addition.qimen=0
    addition.wuxue=0
    addition.critical=0
    addition.criticalp=0
    addition.antiCriticalp=0
    addition.antiCritical=0
    addition.powerupQuanzhang=0
    addition.powerupQimen=0
    addition.powerupJianfa=0
    addition.powerupDaofa=0
    addition.eqTalent=""
    addition.eqBookSkillStruct=nil
    addition.powerupSkills=map()
    addition.powerupInternalSkills=map()
    addition.powerupAoyis=map()
    addition.powerupUniqueSkills=map()
    addition.talents=set()
    addition.skills=map()
    addition.specialSkills=map()
end
---@param talent string
---@return bool
function Role:hasTalent(talent)
    return (self.talents:has(talent)) or 
    (self.addition.talents:has(talent))
end
---@param equipmentName string
---@return bool
function Role:hasEquipment(equipmentName)
    local flag=false
    for _,eq in self.equipments:iter() do
        if eq.name==equipmentName then
            flag=true
            break        
        end
    end
    return flag
end

---@param type number@装备类型值
---@return bool
function Role:hasEquipmentByTypeNum(type)
    local eq=self.equipments:at(type)
    return eq~=nil and eq~=false
end
---@param skillName string
---@return bool
function Role:hasSkill(skillName)
    return (self.skills:get(skillName) or self.addition.skills:get(skillName))~=nil
end
---@param internalSkillName string
---@return bool
function Role:hasInternalSkill(internalSkillName)
    return  self.internalSkills:get(internalSkillName)~=nil
end
---@param specialSkillName string
---@return bool
function Role:hasSpecialSkill(specialSkillName)
    return (self.specialSkills:get(specialSkillName) or self.addition.specialSkills:get(specialSkillName))~=nil
end
---@param talent string
---@return void
function Role:addTalent(talent)
    self.talents:insert(talent)
    self.isDirty=true
end
---@param equipment Equipment
---@return void
function Role:addEquipment(equipment)
    self.equipments:set(equipment.type,equipment)
    self.isDirty=true
end
---@param skill Skill
---@return void
function Role:addSkill(skill)
    self.skills:insert(skill.name,skill)
    self.isDirty=true
end
---@param internalSkill InternalSkill
---@return void
function Role:addInternalSkill(internalSkill)
    self.internalSkills:insert(internalSkill.name,internalSkill)
    self.isDirty=true
end
---@param specialSkill SpecialSkill
---@return void
function Role:addSpecialSkill(specialSkill)
    self.specialSkills:insert(specialSkill,specialSkill)
    self.isDirty=true 
end
---@param talent string
---@return void
function Role:removeTalent(talent)
    self.talents:del(talent)
    self.isDirty=true
end
---@param equipmentType number@装备类型
---@return void
function Role:removeEquipment(equipmentType)
    self.equipments:set(equipmentType,false)
    self.isDirty=true
end
---@param skillName string
---@return void
function Role:removeSkill(skillName)
    self.skills:del(skillName)
    self.isDirty=true
end
---@param internalSkillName string
---@return void
function Role:removeInternalSkill(internalSkillName)
    self.internalSkills:del(internalSkillName)
    self.isDirty=true
end
---@param specialSkillName string
---@return void
function Role:removeSpecialSkill(specialSkillName)
    self.specialSkills:del(specialSkillName)
end
---@param equipmentType number@装备类型
---@return Equipment | nil
function Role:getEquipment(equipmentType)
    return self.equipments:at(equipmentType) or nil
end
---@return InternalSkill
function Role:getEquippedInternalSkill()
    return self.equippedInternalSkill
end
---@param type string @"skill" "internalSkill" ""
---@return Skill[] 
function Role:getEquippedSkills()
    local arr=array()
    for _,skill in self.specialSkills:iter() do
        if skill.equipped then
            arr:push_back(skill)
        end
    end
    for _,skill in self.addition.specialSkills:iter() do
        if skill.equipped then
            arr:push_back(skill)
        end
    end

    for _,skill in self.skills:iter() do  
        if skill.equipped then
            arr:push_back(skill)
        end
    end

    for _,skill in self.addition.skills:iter() do  
        if skill.equipped then
            arr:push_back(skill)
        end
    end
    
    for _,skill in self.internalSkills:iter() do
        if skill.equipped then
            arr:push_back(skill)
        end
    end

    return arr
end

---@param type string @"skill" "internalSkill" ""
---@return Skill[] 
function Role:getAllSkills()
    local arr=array()
    for _,skill in self.specialSkills:iter() do
        arr:push_back(skill)
    end
    for _,skill in self.skills:iter() do  
        arr:push_back(skill)
    end
    for _,skill in self.addition.specialSkills:iter() do
        arr:push_back(skill)
    end
    for _,skill in self.addition.skills:iter() do  
        arr:push_back(skill)
    end
    for _,skill in self.internalSkills:iter() do
        arr:push_back(skill)
    end
    return arr
end

---@param internalSkillName string
---@return InternalSkill | nil
function Role:getInternalSkill(internalSkillName)
    return self.internalSkills:get(internalSkillName)
end
---@param internalSkill InternalSkill
---@return void
function Role:setInternalSkill(internalSkill)
    for _,skill in self.internalSkills:iter() do
        skill.equipped=(skill.name==internalSkill.name)
        if skill.equipped then
            self.equippedInternalSkill=skill
        end
    end

end
---@param skillName string
---@return Skill | nil
function Role:getSkill(skillName)
    return self.skills:get(skillName) or self.addition.skills:get(skillName)
end


---@param specialSkillName string
---@return SpecialSkill | nil
function Role:getSpecialSkill(specialSkillName)
    return self.specialSkills:get(specialSkillName) or 
    self.addition.specialSkills:get(specialSkillName) 
end


function Role:updateAdditionTrigger()
    if self.isDirty==false then
        return 
    end
    self:additionInit()
    local triggerArr=array()
    
    for _,equipment in self.equipments:iter() do
        if equipment then
            for _,trigger in equipment.triggers:iter() do
                triggerArr:push_back(trigger)
            end
            for talent in equipment.talents:iter() do
                self.addition.talents:insert(talent)  
            end
        end
    end
    for _,skill in self.skills:iter() do
        for _,trigger in skill.triggers:iter() do
            triggerArr:push_back(trigger)
        end
    end

    for _,internalSkill in self.internalSkills:iter() do
        for _,trigger in internalSkill.triggers:iter() do
            triggerArr:push_back(trigger)
        end
    end

    for _,trigger in triggerArr:iter() do
        if trigger:check() then
            trigger:addToAddition(self.addition)
        end
    end

    self.isDirty=false
end
---@param value number
function Role:addExp(value)
    if self.level<=mod.Limit.maxRoleLevel then 
        self.exp=self.exp+math.ceil(value)
        while self.exp>self.maxExp do
            self.exp=self.exp-self.maxExp
            self:updateLevel(1)
            self.maxExp=mod.Limit.getRoleMaxExp(self.level)
        end
    end
end
function Role:updateLevel(level)
    for key,value in pairs(self.growTemplate) do
        self[key]=self[key]+value*level
    end
    self.level=self.level+level
end

function Role:setGrowTemplate(growTemplateName)
    self.growTemplate={}
    local growTemplatesQuery=ResScriptManager:getInstance().growTemplatesQuery
    local gt=growTemplatesQuery:get(growTemplateName)
    if gt==nil then 
        gt=growTemplatesQuery:get("default")
    end
    for key,value in pairs(gt) do
        if key~="name" then
            self.growTemplate[key]=value
        end
    end
end

function Role:toString(type)
    local str=""
    type=type or "detail"
    if type=="info" then
        self:updateAdditionTrigger()
        str=str..self.name.."\n"..
        "等级:"..self.level.."\n"..
        "经验"..math.ceil(self.exp).."/"..math.ceil(self.maxExp).."\n"..
        "生命:"..(self.hp+self.addition.hp).."\n"..
        "内力:"..(self.mp+self.addition.mp).."\n"..
        "攻击力:"..( self.addition.attack ).."\n"..
        "防御力:"..( self.addition.defence ).."\n"..
        "暴击率:"..(self.criticalp+self.addition.criticalp).."%".."\n"..
        "暴击伤害:"..(self.critical+self.addition.critical).."%".."\n"..
        "抗暴率:"..self.addition.antiCriticalp.."%".."\n"..
        "抗暴击伤害:"..self.addition.antiCritical.."%"
  
    elseif type=="simple" then
        str=str..self.name.."\n"..
        "等级:"..self.level.."\n"

    elseif type=="attribute" then
        self:updateAdditionTrigger()
        local string_format=string.format
        local addition=self.addition
        local weapProperty="兵器属性:\n"..
        string_format( "拳掌 : %i(%i)    ",self.quanzhang,addition.quanzhang)..
        string_format( "剑法 : %i(%i)\n",self.jianfa,addition.jianfa  )..
        string_format( "刀法 : %i(%i)    ",self.daofa,addition.daofa  )..
        string_format( "奇门 : %i(%i)\n\n",self.qimen,addition.qimen )
        local baseProperty=
        "基础属性:\n"..
        string_format( "福源 : %i(%i)    ",self.fuyuan,addition.fuyuan )..
        string_format( "悟性 : %i(%i)\n",self.wuxing,addition.wuxing)..
        string_format( "定力 : %i(%i)    ",self.dingli,addition.dingli )..
        string_format( "臂力 : %i(%i)\n",self.bili,addition.bili )..
        string_format( "根骨 : %i(%i)    ",self.gengu,addition.gengu )..
        string_format( "身法 : %i(%i)\n\n",self.shenfa,addition.shenfa  )
        local otherProperty=
        string_format( "拳掌增益 : %i    ",addition.powerupQuanzhang )..
        string_format( "奇门增益 : %i\n",addition.powerupQimen)..
        string_format( "剑法增益 : %i    ",addition.powerupJianfa )..
        string_format( "刀法增益 : %i\n",addition.powerupDaofa )
        str=weapProperty..baseProperty..otherProperty
 
    elseif type=="talent" then
        self:updateAdditionTrigger()
        local strs=array()
        local hasUse=0
        local resquery=ResScriptManager:getInstance().resourcesQuery
        for talent,_ in self.talents:iter() do
            local value=resquery:get("天赋."..talent,{value="0#无描述"}).value
            local talentInfo=value:split('#')
            local buffer="["..talent.."]"..
            "[自身天赋]所需天赋值:"..talentInfo[1].."\n"..
            talentInfo[2].."\n"
            strs:push_back(buffer)
            hasUse=hasUse+tonumber(talentInfo[1])
        end
        
        for talent,_ in self.addition.talents:iter() do
            local value=resquery:get("天赋."..talent,{value="0#无描述"}).value
            local talentInfo=value:split('#')
            local buffer="["..talent.."]"..
            "[装备天赋]\n"..
            talentInfo[2].."\n"
            strs:push_back(buffer)
        end
        str=string.format( "武学常识 %i/%i \n",hasUse, self.wuxue+self.addition.wuxue)
        ..table.concat( strs:getData(), "\n")
    end
    return str
end

return Role