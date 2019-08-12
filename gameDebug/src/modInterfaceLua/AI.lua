
_ENV=namespace "mod.AI"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"


local function getDistance(p1,p2)
    return math.abs(p1.x-p2.x)+math.abs(p1.y-p2.y)
end

local chooseAttack=nil

---这并不是一个优秀的AI(劣质游戏配 劣质方案 这很合理)
---@param battleSprite BattleSprite
---@return AIResult
function runAI(battleSprite)
    ---创建一系列变量
    --创建结果表
    local result={}
    --自己
    local source=battleSprite
    
    local minDis=998
    --战场
    local bf=battleSprite.battleField
    --目标移动位置
    local targetPos=battleSprite.pos
    --是否休息
    local isRest=false
    --战斗角色数组
    local spriteArray=source.battleField.controller.spriteArray
    --攻击目标
    local target=nil
    
    --选择sprite算法
    for _,sprite in spriteArray:iter() do
        if sprite.team~=source.team then
            local dis=getDistance(sprite.pos,source.pos)
            if dis<minDis then
                target=sprite
                minDis=dis
            end
        end
    end

    --最远距离
    local maxDis=-998
    --是否逃跑,离最近的敌人最远
    local isEscape=false
    --决定是否逃跑算法    
    if source.hp/source.maxHp<0.25 and probability(0.2) then
        isRest=true
        isEscape=true
        for _,movePos in source:getMoveArray():iter() do
 
            local dis=getDistance(movePos,target.pos)

            if dis>maxDis and bf:inBattleField(movePos) then

                targetPos=movePos

                maxDis=dis
            end
        end
        result.moveToPoint=targetPos

    end
    --是否休息
    result.isRest=isRest
    
    --如果不逃跑
    if isEscape==false then
        chooseAttack(source,target,bf,result)
    end 
    return result
end

function chooseAttack(source,target,bf,result)
    --选择最近距离
    local minDis=998
    local targetPos=nil
    for _,movePos in source:getMoveArray():iter() do
        local dis=getDistance(movePos,target.pos)
        if dis<minDis and bf:inBattleField(movePos) then
            targetPos=movePos
            minDis=dis
        end
        
    end
    result.moveToPoint=targetPos
    --选择合适的技能
    for _,skill in source:getPrioritySkills():iter() do
        
        local skillCastArray=skill:getCastArray(source)
        for _,castPos in skillCastArray:iter() do
            if bf:inBattleField(castPos) then
                local coverArray=skill:getCoverArray(source.pos,castPos,bf)
                for _,coverPos in coverArray:iter() do
             
                    if getDistance(coverPos,target.pos)==0  then
                        
                        result.attackPoint=castPos
                        result.attackSkill=skill
                        return 
                    end
                end
            end
        end   
    end
    result.isRest=true

end

