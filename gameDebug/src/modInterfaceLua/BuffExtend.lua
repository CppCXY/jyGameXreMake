_ENV=namespace "mod.BuffExtend"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"

---每回合运行一次的buff
---@param buff Buff
---@param sourceResult Result
function buffRunForBattleSpriteExtend(buff,sourceResult)
    if buff.name=="恢复" then
        sourceResult.recoveredHp=randInt(0,buff.level)*0.005*sourceResult.battleSprite.maxHp
        sourceResult.recoveredMp=randInt(0,buff.level)*0.003*sourceResult.battleSprite.maxMp

    elseif buff.name=="中毒" then
        sourceResult.hp=
        randInt(0,buff.level)*0.001*sourceResult.battleSprite.maxHp
        local power=(400-sourceResult.battleSprite.dingli)/400
        power=power>0 and power or 0
        sourceResult.hp=sourceResult.hp*power
    elseif buff.name=="内伤" then
        sourceResult.mp=
        randInt(0,buff.level)*0.001*sourceResult.battleSprite.maxMp
        local power=(400-sourceResult.battleSprite.gengu)/400
        power=power>0 and power or 0
        sourceResult.mp=sourceResult.mp*power
    end
    
end



---此处buff只会在buff创建后执行一次，或者level更改时执行一次
---如果对result进行修改，那么这种修改就是临时的，result是这样一个表
---里面储存key-value 对，会在buff创建时，对sprite进行增益，buff消失时取消这种增益
---如果直接对sprite进行操作，那么这种操作就是永久增益的，
---此处永久性指的是当前战斗
---@param buff Buff
---@param result table
function buffTmpExtend(buff,result)
    local sprite=buff.sprite
    if buff.name=="攻击强化" then
        result.attack=sprite.attack*buff.level*0.02
    elseif buff.name=="攻击弱化" then
        result.attack=-(sprite.attack*buff.level*0.02)
    elseif buff.name=="醉酒" then
        if probability(0.2) then
            local rst=Result(sprite)
            rst.buffs:push_back(Buff("晕眩",1,1))
            sprite:addResult(rst)
        else
            sprite.ball=10
            local rst=Result(sprite)
            rst.buffs:push_back(Buff("左右互搏",buff.level,buff.round))
            sprite:addResult(rst)
        end
        --移动能力不允许低于1，否则会出现你想不到的问题，比如全图移动。
    elseif buff.name=="缓速" then
        result.moveAbility=-0.1*buff.level
        if  math.abs(result.moveAbility)>=(sprite.moveAbility-1) then
            result.moveAbility=-(sprite.moveAbility-1)
        end
    elseif buff.name=="定身" then
        result.moveAbility=-(sprite.moveAbility)
    elseif buff.name=="轻身" then
        result.moveAbility=0.05*buff.level
    elseif buff.name=="破甲" then
        result.defence=-20*buff.level
    end

end



debuffList=set{
    "中毒";
    "内伤";
    "攻击弱化";
    "晕眩";
    "缓速";
    "定身";
    "麻痹";
    "破甲";

}