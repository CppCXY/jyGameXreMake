_ENV=namespace "mod.TriggerExtend"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"

triggerQuery={}
---addition 参数参考role 的addition
---@param name string
---@param luaFunction fun(argvs:string[],addition:table):any
local function registerTriggerExtend(name,luaFunction)
    triggerQuery[name]=luaFunction
end
--这是给attribute用的
local attributeQuery={
    ["hp"]="hp",
    ["mp"]="mp",
    ["搏击格斗"]="quanzhang",
    ["使剑技巧"]="jianfa",
    ["耍刀技巧"]="daofa",
    ["奇门兵器"]="qimen",
    ["福缘"]="fuyuan",
    ["悟性"]="wuxing",
    ["定力"]="dingli",
    ["臂力"]="bili",
    ["根骨"]="gengu",
    ["身法"]="shenfa",
}
setmetatable(attributeQuery,{__index=function(self,k)
    return "nil" 
end} )
local register=registerTriggerExtend
register("attribute",function(argvs,addition)
    local key,value=argvs:at(1),argvs:at(2)
    key=attributeQuery[key]
    value=tonumber(value) or 0
    addition[key]=addition[key]+value
end)

register("powerup_skill",function(argvs,addition)
    local skillName,value=argvs:at(1),argvs:at(2)
    value=tonumber(value) or 0
    local skillValue=addition.powerupSkills:get(skillName,0)
    addition.powerupSkills:insert(skillName,skillValue+value)
end)
register("powerup_internalskill",function(argvs,addition)
    local skillName,value=argvs:at(1),argvs:at(2)
    value=tonumber(value) or 0
    local skillValue=addition.powerupInternalSkills:get(skillName,0)
    addition.powerupInternalSkills:insert(skillName,skillValue+value)
end)

register("powerup_aoyi",function(argvs,addition)
    local skillName,value=argvs:at(1),argvs:at(2)
    value=tonumber(value) or 0
    local skillValue=addition.powerupAoyis:get(skillName,0)
    addition.powerupAoyis:insert(skillName,skillValue+value)
end)
register("powerup_uniqueskill",function(argvs,addition)
    local skillName,value=argvs:at(1),argvs:at(2)
    value=tonumber(value) or 0
    local skillValue=addition.powerupUniqueSkills:get(skillName,0)
    addition.powerupUniqueSkills:insert(skillName,skillValue+value)
end)

register("attack",function(argvs,addition)
    local attack,criticalp=argvs:at(1),argvs:at(2)
    attack=tonumber(attack) or 0
    criticalp=tonumber(criticalp) or 0
    addition.attack=addition.attack+attack
    addition.criticalp=addition.criticalp+criticalp
end)

register("defence",function(argvs,addition)
    local defence,anti_criticalp=argvs:at(1),argvs:at(2)
    defence=tonumber(defence) or 0
    anti_criticalp=tonumber(anti_criticalp) or 0
    addition.defence=addition.defence+defence
    addition.antiCriticalp=addition.antiCriticalp+anti_criticalp

end)

register("talent",function(argvs,addition)
    local talent=argvs:at(1)
    addition.talents:insert(talent)
end)
register("eq_talent",function(argvs,addition)
    local eq_talent=argvs:at(1)
    addition.eqTalent=eq_talent
end)
register("eq_skill",function(argvs,addition)
    local eq_skillName,level=argvs:at(1),argvs:at(2)
    addition.skills:insert(eq_skillName,
    Skill(eq_skillName,level,level,true)
    )
end)
register("eq_specialSkill",function(argvs,addition)
    local eq_skillName=argvs:at(1)
    addition.specialSkills:insert(eq_skillName,
    SpecialSkill(eq_skillName)
    )
end)

register("powerup_quanzhang",function(argvs,addition)
    local quanzhang=argvs:at(1)
    quanzhang=tonumber( quanzhang )
    addition.powerupQuanzhang=addition.powerupQuanzhang+quanzhang
end)
register("powerup_jianfa",function(argvs,addition)
    local jianfa=argvs:at(1)
    jianfa=tonumber( jianfa )
    addition.powerupJianfa=addition.powerupJianfa+jianfa

end)
register("powerup_qimen",function(argvs,addition)
    local qimen=argvs:at(1)
    qimen=tonumber( qimen )
    addition.powerupQimen=addition.powerupQimen+qimen
end)
register("powerup_daofa",function(argvs,addition)
    local daofa=argvs:at(1)
    daofa=tonumber( daofa )
    addition.powerupDaofa=addition.powerupDaofa+daofa
end)

register("criticalp",function(argvs,addition)
    local criticalp=argvs:at(1)
    criticalp=tonumber( criticalp )
    addition.criticalp=addition.criticalp+criticalp

end)
register("xi",function(argvs,addition)
    local xi=argvs:at(1)
    xi=tonumber( xi )
    addition.xi=addition.xi+xi
end)
register("critical",function(argvs,addition)
    local critical=argvs:at(1)
    critical=tonumber( critical )
    addition.critical=addition.critical+critical
    
end)
register("anti_critical",function(argvs,addition)
    local antiCritical=argvs:at(1)
    antiCritical=tonumber( antiCritical )
    addition.antiCritical=addition.antiCritical+antiCritical
    
end)
register("mingzhong",function(argvs,addition)
    local mingzhong=argvs:at(1)
    mingzhong=tonumber( mingzhong )
    addition.mingzhong=addition.mingzhong+mingzhong
end)
register("sp",function(argvs,addition)
    local sp=argvs:at(1)
    sp=tonumber( sp )
    addition.sp=addition.sp+sp
end)
register("anti_debuff",function(argvs,addition)
    local antiDebuff=argvs:at(1)
    antiDebuff=tonumber( antiDebuff )
    addition.antiDebuff=addition.antiDebuff+antiDebuff
    
end)
register("anti_criticalp",function(argvs,addition)
    local antiCriticalp=argvs:at(1)
    antiCriticalp=tonumber( antiCriticalp )
    addition.antiCriticalp=addition.antiCriticalp+antiCriticalp
    
end)
register("skill",function(argvs,addition)
    local skillName,level=argvs:at(1),argvs:at(2)
    level=tonumber(level)
    addition.eqBookSkillStruct={skillName=skillName,level=level,type="skill"}
    
end)
register("internalskill",function(argvs,addition)
    local skillName,level=argvs:at(1),argvs:at(2)
    level=tonumber(level)
    addition.eqBookSkillStruct={skillName=skillName,level=level,type="internalskill"}
end)
--此trigger弃用,留着过年
register("animation",function(argvs,addition)
 
    
end)

---@param trigger Trigger
---@param battleSpriteResult Result
function useForBattleSpriteResult(trigger,battleSpriteResult)
    local name=trigger.name
    local result=battleSpriteResult
    if name=="AddHp" then
    ---负值代表增益
        result.hp=result.hp-tonumber(trigger.argvs:at(1))
    elseif name=="AddMp" then
        result.mp=result.mp-tonumber(trigger.argvs:at(1))
    elseif name=="AddBuff" then
        local buffName,level,round,prob=unpack(trigger.argvsString:split("."))
        level=level or 1
        round=round or 1
        prob =prob or 1
        result:addBuff(Buff:create(buffName,level,round,prob))
    elseif  name=="RecoverHp" then
        result.hp=-result.battleSprite.maxHp*tonumber(trigger.argvs:at(1))/100
    elseif name=="RecoverMp" then
        result.mp=-result.battleSprite.maxMp*tonumber(trigger.argvs:at(1))/100
    end
    ---其他的自己写
end

