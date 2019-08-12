_ENV=namespace "mod.BattleSpriteExtend"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"


--会在 sprite 创建的时候调用一次，这里可以写涉及到天赋的扩展
--这里主要是新增属性，或者直接修改属性。比如因为某天赋，攻击加强多少多少
---@param battleSprite BattleSprite
---@return void
function BattleSpriteCreatePropertyExtend(battleSprite)
    if  battleSprite:hasTalent("鬼魅") then
        battleSprite.sp=4
    end
    if  battleSprite:hasTalent("博览群书") then
        battleSprite.toAoyiProb=battleSprite.toAoyiProb+0.08

    end

end

---弃用
---@return bool
function BattleSpriteShowAnimationExtend()



--如果返回false 则继续执行原有代码,返回true中断后续代码
    return false
end


---@param battleSprite BattleSprite
---@param template cc.p[]
function BattleSpriteMoveExtend(battleSprite,template)
    
    
end

---这里写天赋,buff,技能等扩展.主要是针对，每一回合的行为
---@param sourceResult Result
---@param bf BattleScene
---@return void
function BattleSpriteTalentEveryRoundExtend(sourceResult,bf)
    ---@type BattleSprite
    local sourceSprite=sourceResult.battleSprite

    if  sourceSprite:hasTalent("医仙") then
        for _,sprite in bf.controller.spriteArray:iter() do
            local result=Result(sprite)
            result.hp=sprite.maxHp*randInt(1,3)*0.01
            sprite:addResult(result)
        end
    end

    
    if  sourceSprite:hasTalent("悲酥清风")
    and probability(0.3) then
        for _,sprite in bf.controller.spriteArray:iter() do
            if  sprite.team~=sourceSprite.team 
            and (
                (math.abs(sprite.pos.x-sourceSprite.pos.x)
                +math.abs(sprite.pos.y-sourceSprite.pos.y))<=3
            )then
                local result=Result(sprite) 
                result.mp=randInt(5,20)*0.01*sourceSprite.mp
                sprite:addResult(result)
            end
        end

    end

    if  sourceSprite:hasTalent("琴胆剑心") 
    and probability(0.30) then
        for _,sprite in bf.controller.spriteArray:iter() do
            if  sprite.team==sourceSprite.team 
            and (
                (math.abs(sprite.pos.x-sourceSprite.pos.x)
                +math.abs(sprite.pos.y-sourceSprite.pos.y))<=2
            )then
                local result=Result(sprite) 
                result.buffs:push_back(Buff("攻击强化",1,1))
                sprite:addResult(result)
            end
        end
    end

    if  sourceSprite:hasTalent("百穴归一") then
        sourceResult.mp=sourceResult.mp-
        randInt(1,20)*0.01*sourceSprite.maxMp
    end

    if  sourceSprite:hasTalent("无相") 
    and probability(0.05) then
        sourceResult.hp=sourceResult.hp-
        randInt(1,20)*0.01*sourceSprite.maxMp
    end

    if  sourceSprite:hasBuff("集气") then
        local buff=sourceSprite:getBuff("集气")
        local p=buff.level*3
        sourceSprite.currentSp=sourceSprite.currentSp+p
    end

end

---这里写天赋,buff,技能等扩展主要是针对，每一次攻击与被攻击
---@param sourceResult Result
---@param targetResult Result
---@param skill Skill
---@return void
function BattleSpriteTalentExtend(sourceResult,targetResult,skill)
    ---@type BattleSprite
    local sourceSprite=sourceResult.battleSprite
    ---@type BattleSprite
    local targetSprite=targetResult.battleSprite
    
    local bf=sourceSprite.battleField

    if  sourceSprite:hasTalent("异世人") 
    and sourceSprite.hp/sourceSprite.maxHp<=0.2 then
        targetResult.hp=targetResult.hp*1.5
    end

    if  targetSprite:hasTalent("异世人") 
    and targetSprite.hp/targetSprite.maxHp<=0.2 then
        targetResult.hp=targetResult.hp*0.8
    end

    if  sourceSprite:hasTalent("不稳定的六脉神剑") 
    and skill.name:find("六脉神剑") then
        targetResult.hp=targetResult.hp*randInt(2,30)*0.1
    end

    if  sourceSprite:hasTalent("好色") 
    and targetSprite.role.sex~=sourceSprite.role.sex then
        targetResult.hp=targetResult.hp*1.1
    end

    if  targetSprite:hasTalent("好色") 
    and targetSprite.role.sex~=sourceSprite.role.sex then
        targetResult.hp=targetResult.hp*1.1
    end

    if  sourceSprite:hasTalent("清心") 
    and probability(0.1) then
        local buffs=sourceSprite.buffs
        local keys={}
        for key,buff in buffs:iter() do
            if buff:isDebuff() then
                table.insert(keys,key)
            end
        end
        local delkey=randTable(keys)
        sourceResult.delBuffs:push_back(delkey)
    end


    if  sourceSprite:hasTalent("神雕大侠")
    and (
        skill.name:find("玄铁剑法")
        or skill.name:find("黯然销魂掌")
    ) then
        targetResult.criticalp=targetResult.criticalp+0.25
        targetResult.hp=targetResult.hp*1.4
    end

    if  sourceSprite:hasTalent("毒系精通") then
        for _,buff in targetResult.buffs:iter() do
            if buff.name=="中毒" then
                buff.level=buff.level+3
                buff.round=buff.round+2
            end
        end
    end

    if  sourceSprite:hasTalent("毒圣") then
        for _,buff in targetResult.buffs:iter() do
            if  buff.name=="中毒" then
                buff.level=buff.level+5
                buff.round=buff.round+3
            end
        end
    end

    if  sourceSprite:hasTalent("独孤求败") then
        targetResult.hp=targetResult.hp*1.1
    end

    if  sourceSprite:hasTalent("阉人") 
    and  (
        skill.name:find("葵花宝典")
        or skill.name:find("辟邪剑法")
    )    then
        targetResult.isCritical=true

    end

    if  sourceSprite:hasTalent("太极高手") 
    and  (
        skill.name:find("太极")
    )    then
        targetResult.criticalp=targetResult.criticalp+0.15
        targetResult.hp=targetResult.hp*1.2

    end
    if  targetSprite:hasTalent("金钟罩") 
    and probability(0.1)   then
        targetResult.hp=targetResult.hp*0.8
    end

    if  sourceSprite:hasTalent("臭蛤蟆") 
    and skill.tag:has("白驼山") then
        targetResult.hp=targetResult.hp*2
    end

    if  sourceSprite:hasTalent("臭叫花") 
    and skill.name:find("打狗棒法") then
        targetResult.hp=targetResult.hp*rand(10,20)*0.10
    end

    if  sourceSprite:hasTalent("金蛇郎君") 
    and skill.name:find("金蛇剑法") then
        targetResult.criticalp=targetResult.criticalp+0.5
    end 

    if  sourceSprite:hasTalent("金蛇狂舞")
    and skill.name:find("金蛇剑法") then
        local eq=sourceSprite.role:getEquipment(1)
        if eq and eq.name:find("金蛇剑法") then 
            targetResult.hp=targetResult.hp*1.5
        end
    end
    
    if  sourceSprite:hasTalent("阴谋家") then
        local p=targetSprite.hp/targetSprite.maxHp
        p=1-p
        targetResult.hp=targetResult.hp*(1+p*0.5)
    end

    if  sourceSprite:hasTalent("混元一气") 
    and skill.name:find("混元掌") then
        targetResult.criticalp=targetResult.criticalp+0.25
    end

    if  targetSprite:hasTalent("神行百变") then
        local missprob=
        targetSprite.hp/targetSprite.maxHp
        and 0.15
        or  0.07
        targetResult.hitprob=targetResult.hitprob-missprob
    end

    if  targetSprite:hasTalent("奇门遁甲") then
        local missprob=0.09
        targetResult.hitprob=targetResult.hitprob-missprob
    end

    if  targetSprite:hasTalent("奇门遁甲") then
        local missprob=0.05
        targetResult.hitprob=targetResult.hitprob-missprob
    end

    if  sourceSprite:hasTalent("玲珑璇玑") 
    and skill.tag:has("桃花") then
        targetResult.hp=targetResult.hp*1.3
    end

    if  sourceSprite:hasTalent("浪子剑客") then
        targetResult.hp=targetResult.hp*1.2
    end

    if  sourceSprite:hasTalent("铁骨墨萼") 
    and skill.name:find("连城剑法") then
        targetResult.hp=targetResult.hp*1.4
        targetResult.criticalp=targetResult.criticalp+0.2
    end

    if  targetSprite:hasTalent("真气护体") 
    and probability(0.5) then
        targetResult.hp=targetResult.hp*0.5
        targetResult.mp=targetResult.hp

    end

    if  (sourceSprite:hasTalent("伤口撕裂")
    or  sourceSprite:hasTalent("追魂"))
    and probability(0.1) then
        targetResult.buffs:push_back(Buff("伤害加深",1,1))
    end

    if  sourceSprite:hasTalent("铁拳无双") 
    and probability(0.01) then
        targetResult.buffs:push_back(Buff("晕眩",1,1))
    end

    if  targetSprite:hasTalent("乾坤大挪移") 
    and probability(0.10) then
        targetResult.hp=targetResult.hp/2
    end

    if  targetSprite:hasTalent("乾坤大挪移奥义") then
        targetResult.hp=targetResult.hp/2
    end

    if  sourceSprite:hasTalent("素心神剑") 
    and probability(0.3) then
        targetResult.times=2
    end

    if  targetSprite:hasTalent("真武七截阵")
    and probability(0.50) then
        local spriteArray=bf.controller.spriteArray
        local zhenwuSpriteArray=array()
        for  _,sprite in spriteArray:iter() do
            if  sprite==targetSprite.team
            and sprite:hasTalent("真武七截阵") then
                zhenwuSpriteArray:push_back(sprite)
            end
        end

        if  zhenwuSpriteArray:size()>=2 then
            local sprite=randTable(zhenwuSpriteArray:getData())
            if  sprite~=targetSprite then
                local result=Result(sprite)
                result.hp=targetResult.hp*0.5
                targetResult.hp=0
                sprite:addResult(result)
            end
        end
    end

    if  sourceSprite:hasTalent("真武七截阵") then
        local spriteArray=bf.controller.spriteArray
        local zhenwuSpriteArray=array()
        for  _,sprite in spriteArray:iter() do
            if  sprite==sourceSprite.team
            and sprite:hasTalent("真武七截阵") then
                zhenwuSpriteArray:push_back(sprite)
            end
        end

        if  zhenwuSpriteArray:size()>=2 then
            targetResult.hp=targetResult.hp*(1+0.1*zhenwuSpriteArray:size())
        end
    end
    
    if  sourceSprite:hasTalent("峨眉宗师") 
    and (
        skill.tag:has("峨眉")
        or skill.tag:has("桃花")
        or skill.tag:has("九阴")
    )then
        targetResult.hp=targetResult.hp*randInt(10,30)*0.1
    end

    if  sourceSprite:hasTalent("易经伐髓")
    and skill.tag:has("少林") then
        targetResult.hp=targetResult.hp*1.5
    end

    if  sourceSprite:hasTalent("刚柔并济")
    and skill.tag:has("武当") then
        targetResult.hp=targetResult.hp*1.05
    end

    if  targetSprite:hasTalent("斗转星移")
    and(
        --当没有慕容世家的时候执行 最下面的prob 0.2
        --当有慕容世家的时候，会执行两次prob 0.2 共同判断
        --lua 三目运算不可作用于bool 值，这里是我故意这么做的。
        (targetSprite:hasTalent("慕容世家") 
        and 
        probability(0.2))
        or
        probability(0.2) 
     
    )then
        sourceResult.hp=sourceResult.hp+targetResult.hp*0.05
    end

    if  targetSprite:hasTalent("不老长春")
    and probability(0.05) then
        targetResult.hp= -math.abs(targetResult.hp)
    end

    if  sourceSprite:hasTalent("天龙.盖世英雄") 
    and (
        skill.tag:has("乔峰") 
        or skill.tag:has("丐帮")
    )then
        targetResult.hp= targetResult.hp*1.3
    end

    if  sourceSprite:hasTalent("射雕英雄") 
    and (
        skill.tag:has("郭靖")
        or skill.tag:has("丐帮")
    )then
        targetResult.hp= targetResult.hp*1.3
    end

    if  sourceSprite:hasTalent("木婉清的眷恋")
    and sourceSprite.name:find("段誉") 
    and bf:nameInBattleField("木婉清") then
        targetResult.hp= targetResult.hp*1.4
    end

    if  sourceSprite:hasTalent("大理世家") 
    and skill.tag:has("大理") then

    end

    if  (
        sourceSprite:hasTalent("左右互搏") 
        or sourceSprite:hasBuff("左右互搏")
    )
    and probability(0.6) then
        targetResult.times=2
    end

    if  sourceSprite:hasBuff("神速攻击") 
    and probability(0.1) then
        targetResult.times=3
    end


    if  sourceSprite:hasTalent("长平公主的眷恋")
    and sourceSprite.role.name=="袁承志" then
        targetResult.hp=targetResult.hp*1.1
    end

    if  sourceSprite:hasTalent("破碎的怒吼")
    and skill:is(Aoyi) 
    and probability(0.1) then
        targetResult.buffs:push_back(Buff("晕眩",1,1))
    end

    if  (targetSprite:hasTalent("沾衣十八跌")
        or targetSprite:hasBuff("沾衣十八跌")
    )
    and probability(0.1) then
        sourceResult.buffs:push_back(Buff("晕眩",1,1))
    end

    if  sourceSprite:hasTalent("幽居")
    and probability(sourceSprite.role.level/100) then
        targetResult.times=2
    end

    if  targetSprite:hasTalent("金刚") then
        
        local p=(100-targetSprite.role.level)*0.01
        p=p<0.85 and 0.85 or p
        targetResult.hp=targetResult.hp*p
    end

    if  sourceSprite:hasTalent("嗜血狂魔") then
        local xi=targetSprite.role.level/1000
        xi=xi>0.03 and 0.03 or xi
        sourceResult.hp=sourceResult.hp-targetResult.hp*xi
    end

    if  sourceSprite:hasTalent("清风") 
    and probability(sourceSprite.level/1000) then
        local buffs=sourceSprite.buffs
        local keys={}
        for key,buff in buffs:iter() do
            if buff:isDebuff() then
                table.insert(keys,key)
            end
        end
        local delkey=randTable(keys)
        sourceResult.delBuffs:push_back(delkey)
    end

    if  targetSprite:hasTalent("御风") then
        local p=targetSprite.level/1000
        targetResult.criticalp=targetResult.criticalp-p
    end

    if  sourceSprite:hasTalent("御剑") then
        local p=targetSprite.level/500
        targetResult.criticalp=targetResult.criticalp+p
    end

    if  sourceSprite:hasTalent("怒不可遏") then
        targetResult.hp=targetResult.hp*sourceSprite.ball/10
    end
    
    if  targetSprite:hasBuff("伤害加深") then
        local buff=targetSprite:getBuff("伤害加深")
        local level=buff.level
        targetResult.hp=targetResult.hp*(level*0.05+1)
    end

    if  targetSprite:hasBuff("飘渺") then
        local buff=targetSprite:getBuff("飘渺")
        local p=buff.level/100
        p=p>0.5 and 0.5 or p
        targetSprite.hitprob=targetSprite.hitprob-p
    end

end

function DieExtend(battleSprite)
    if  battleSprite:hasTalent("百足之虫") 
    and probability(0.05) then
        battleSprite.hp=1
        return false
    end

    if battleSprite:hasTalent("无尽斗志") 
    and probability(0.02) then
        battleSprite.hp=battleSprite.maxHp
        return false
    end




    --true 死亡 --false 复活
    return true
end

---@param sourceResult Result
---@param targetResult Result
---@param skill Skill
---@return void
function BattleSpriteResultFormula(sourceResult,targetResult,skill)
    local sourceSprite=sourceResult.battleSprite
    local targetSprite=targetResult.battleSprite

    --技能buff判断
    for _,buff in skill.buffs:iter() do
        local prob=buff.prob*(1-targetSprite.antiDebuff/100)
        prob=prob>0 and prob or 0
        if probability(prob) then
            local newBuff=Buff(buff.name,buff.level,buff.round,buff.prob)
          
            if newBuff:isDebuff() then
                targetResult.buffs:push_back(newBuff)
            else
                sourceResult.buffs:push_back(newBuff)
            end
        end
    end
    
    --特殊技能不参与后续计算
    if skill:is(SpecialSkill) then
        return 
    end
    
    local attack=0
    local targetDefence=0
    local power=(skill.power/10)+1
    attack=sourceSprite.attack
    targetDefence=targetSprite.defence
    if skill:is(InternalSkill) then
        attack=sourceSprite.internalSkillAttack
        targetDefence=targetSprite.internalDefence
    end
    --防御计算
    if  targetSprite:hasBuff("防御强化") then
        local bufflevel=targetSprite:getBuff("防御强化").level
        targetDefence=targetDefence*(1+bufflevel/50)
    end


    --计算攻击结果
    local resultHp=attack-targetDefence

    resultHp=resultHp>0 and resultHp or 0
    resultHp=resultHp*power

    local criticalp=sourceSprite.criticalp-targetSprite.antiCriticalp
    criticalp=criticalp>=0 and criticalp or 0

    targetResult.criticalp=criticalp
    targetResult.critical=sourceSprite.critical-targetSprite.antiCritical

    local skillp=1
    if skill.type==0 then
        skillp=(sourceSprite.powerupQuanzhang/100+skillp)*sourceSprite.quanzhang/100
    elseif skill.type==1 then
        skillp=(sourceSprite.powerupJianfa/100+skillp)*sourceSprite.jianfa/100
    elseif skill.type==2 then
        skillp=(sourceSprite.powerupQimen/100+skillp)*sourceSprite.daofa/100
    elseif skill.type==3 then
        skillp=(sourceSprite.powerupDaofa/100+skillp)*sourceSprite.qimen/100
    elseif skill.type==5 then 
        skillp=(skillp)*sourceSprite.gengu/100
    end

    resultHp=resultHp*skillp

    local eqInternalSkill=sourceSprite.role:getEquippedInternalSkill()
    local eqyin,eqyang=eqInternalSkill.yin,eqInternalSkill.yang

    --如果不是内功
    if not skill:is(InternalSkill) then
        local yinyang,yinyangValue=skill:getSuit()

        if yinyang=="阴阳调和" then
            resultHp=resultHp*math.max( eqyin,eqyang )*yinyangValue
        elseif yinyang=="阴" then
            resultHp=resultHp*eqyin*yinyangValue
        elseif yinyang=="阳" then
            resultHp=resultHp*eqyang*yinyangValue
        end
    else--如果是内功技能
        resultHp=resultHp*math.max(eqyin,eqyang)
    end


    resultHp=math.random( 9,12 )/10*resultHp

    targetResult.hp=resultHp
    sourceResult.mp=skill.costMp
    if sourceSprite:hasTalent("阉人") then
        sourceResult.mp=sourceResult.mp*2
    end

    if  skill.costball then
        sourceResult.ball=skill.costball
    end
    
    targetResult.hitprob=sourceSprite.hitprob

    local addBall=resultHp/sourceSprite.maxHp+0.3
    
    sourceSprite.ball=sourceSprite.ball+addBall
    if sourceSprite.ball>10 then
        sourceSprite.ball=10
    end
end

---休息逻辑,负值代表恢复
---@param sourceResult Result
function BattleSpriteRestExtend(sourceResult)
    sourceResult.hp=-sourceResult.battleSprite.maxHp/100*math.random( 5,20 )/10
    sourceResult.mp=-sourceResult.battleSprite.maxMp/50*math.random( 10,50 )/10
end

---@param battleSprite BattleSprite
function SpExtend(battleSprite,sp)
    if  battleSprite:hasBuff("麻痹") then
        local buff=battleSprite:getBuff("麻痹")
        local value=buff.level/20
        value=value>1 and 1 or value
        return sp-value
    end
    if  battleSprite:hasBuff("晕眩") then
        return 0
    end

    if  battleSprite:hasBuff("神行") then
        local buff=battleSprite:getBuff("神行")
        local value=buff.level/20
        value=value>1 and 1 or value
        return sp+value
    end

    return sp
end

---使用物品扩展,
---@param item Item@物品
---@param sourceResult Result@物品使用者
---@param targetResultArray array@物品作用目标集
---@return bool
function BattleSpriteUseItemExtend(item,sourceResult,targetResultArray)
    for _,targetResult in targetResultArray:iter() do
        item:onResult(targetResult)
    end
---继续执行原有逻辑
    return true
end
