_ENV=namespace "mod.SkillExtend"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"

---若要自定义技能cast的范围 如果想重写skill.type代表的范围 就在这里写
---如果想定义技能形状,则向template添加点 类型为 cc.p 或者 {x=0,y=0}
---例如：template:push_back(cc.p(0,0))
---template是的以原点为中心表示的范围,也就是角色所在的位置假设为原点
---@param skill Skill
---@param battleSprite BattleSprite
---@param template array
---@return void 
function SkillCastArrayExtend(skill,battleSprite,template)


end

---如果想修改技能的投掷范围的大小，则修改这个函数，返回新的投掷范围，否则沿用自己的
---@param skill Skill
---@param battleSprite BattleSprite
---@return number
function SkillCastSizeExtend(skill,battleSprite)



    return nil
end

---如果想修改技能的覆盖范围的大小，则修改这个函数，返回新的覆盖范围大小，否则沿用自己的
---@param skill Skill
---@return number
function SkillCoverSizeExtend(skill)



    return nil
end

---若要自定义技能cover的范围 如果想重写skill.type代表的范围则修改template 
---如果想定义技能cover形状,则向template添加点 类型为 cc.p 或者 {x=0,y=0}
---template是的以目标block为中心表示的范围,也就是技能cast的点所在的位置假设为原点
---@param skill Skill
---@param sourcePos cc.p
---@param point cc.p
---@param battleField BattleScene
---@param template array
---@return void 
function SkillCoverArrayExtend(skill,sourcePos,point,battleField,template)



end


---技能升级的时候执行这里的函数
---@param skill Skill
---@param level number
---@return bool
function SkillUpdateLevelExtend(skill,level)



    --返回true表示只执行这里的加成
    --返回false表示继续执行固有升级加成
    return false
end
---@class conditionStruct
---@field public type string
---@field public value string
---@field public level number


---这里写奥义的条件扩展
---@param condition conditionStruct
---@param battleSprite BattleSprite
function AoyiConditionExtend(condition,battleSprite)
    local type=condition.type
    if type=="" then 
        return true  
    elseif type=="skill" then
        local skill=battleSprite.role:getSkill(condition.value)
        if skill then
            return skill.level>=condition.level
        end
        return false
    elseif type=="internalskill" then
        local skill=battleSprite.role:getInternalSkill(condition.value)
        if skill then
            return skill.level>=condition.level
        end
        return false
    elseif type=="talent" then
        return battleSprite.role:hasTalent(condition.value)
    elseif type=="specialskill" then
        return battleSprite.role:hasSpecialSkill(condition.value)
    end
    
    return false
end
