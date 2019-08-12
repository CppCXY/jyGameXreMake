include "app.gameClass.Result"
include "app.gameClass.Buff"
include "app.gameClass.battle.init"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
using_namespace "ui"
---@class BattleSprite
local BattleSprite=class("BattleSprite"){
    CLASS_DEBUG(false);
    super(cc.Node);
}

function BattleSprite:BattleSprite(battleField,role, position,team , isRightFace,identifeir)
    self=self:__super()
    self.battleField=battleField
    self.role = role ---@type Role
    self.nameLabel=nil    
    self.team = team
    self.ball=0
    self.cd=0
    self.buffs=map()
    self.results=array()
    self.pos=position
    self.identifier=identifeir
    self.allowSend=false
    self._AI=nil
    self.statistics=nil
    self:initProperty()    
    self:initSprite(isRightFace)
    self:setZOrder(1000-position.y)
    BattleAnimation(self,"stand"):play(true)
end

function BattleSprite:initProperty()
    local role=self.role
    --基础属性相关
    self.level=role.level
    self.hp=role.hp+role.addition.hp
    self.maxHp=self.hp
    self.mp=role.mp+role.addition.mp
    self.maxMp=self.mp
    self.attack=role.addition.attack


    --四维
    self.quanzhang=role.quanzhang+role.addition.quanzhang
    self.jianfa=role.jianfa+role.addition.jianfa
    self.daofa=role.daofa+role.addition.daofa
    self.qimen=role.qimen+role.addition.qimen


    --身法相关
    local shenfa=role.shenfa+role.addition.shenfa
    self.shenfa=shenfa
    self.currentSp = 0
    local sp=shenfa/150+role.addition.sp
    self.sp = 1+sp
    self.spMax = 100
    self.moveAbility=math.floor(shenfa/100+1)
    local eq_internal=role:getEquippedInternalSkill()

    --臂力相关
    local bili=role.bili+role.addition.bili
    self.bili=bili
    self.attack=role.addition.attack
    self.attack=self.attack*(1+bili/150)+bili

    --根骨相关
    local gengu=role.gengu+role.addition.gengu
    self.gengu=gengu
    self.internalSkillAttack=self.attack/2+gengu*2
    self.internalSkillAttack=self.internalSkillAttack
    *(1+eq_internal.attack)
    --福缘相关
    local fuyuan=role.fuyuan+role.addition.fuyuan
    self.fuyuan=fuyuan
    self.toAoyiProb=fuyuan/500
    --悟性相关
    local wuxing=role.wuxing+role.addition.wuxing
    self.wuxing=wuxing
    self.skillExpPower=wuxing/200
    --定力相关
    local dingli=role.dingli+role.addition.dingli
    self.dingli=dingli
    self.defence=role.addition.defence
    self.internalDefence=dingli*2
    self.antiDebuff=dingli/1000+role.addition.antiDebuff/100
    self.antiCritical=role.addition.antiCritical/100
    self.antiCriticalp=(dingli/150+1)/100+(role.addition.antiCriticalp)/100

    self.defence=self.defence*(1+eq_internal.defence)
    self.internalDefence=self.internalDefence*(1+eq_internal.defence)

    --暴击
    self.criticalp=(role.criticalp+role.addition.criticalp)/100
    self.critical=(role.critical+role.addition.critical)/100

    --技能系数
    self.powerupQuanzhang=role.addition.powerupQuanzhang
    self.powerupJianfa=role.addition.powerupQimen
    self.powerupQimen=role.addition.powerupJianfa
    self.powerupDaofa=role.addition.powerupDaofa
    --天赋
    self.talents=set()
    self.talents:merge(role.talents)
    self.talents:merge(role.addition.talents)
    if role.addition.eqTalent~="" then
        self.talents:insert(role.addition.eqTalent)
    end
    --技能
    self.skills=self:createSkills(self.role:getEquippedSkills())

    self.status=ENUM.BATTLESPRITE_STATUS.NORMAL
    self.newSkills=array()
    self.hitprob=1
    --key为被ban的技能，value为cd，key也可以是技能的type类型
    self.banSkillMap=map()
    mod.BattleSpriteExtend.BattleSpriteCreatePropertyExtend(self)

end

function BattleSprite:addBuff(buff)
    local s_buff=self:getBuff(buff.name)
    if s_buff then
        s_buff.level=s_buff.level< buff.level and buff.level or s_buff.level
        s_buff.round=s_buff.round+buff.round
    else
        self.buffs:insert(buff.name,buff)
        buff:bindSprite(self)
    end
end

function BattleSprite:hasBuff(buffName)
    return self.buffs:has(buffName)
end

function BattleSprite:getBuff(buffName)
    return self.buffs:get(buffName)
end

function BattleSprite:hasTalent(talent)
    return self.talents:has(talent)
end

function BattleSprite:initSprite(isRightFace)
    local animation=
    ResScriptManager:getInstance().animationsQuery:get(self.role.animation)
    
    local animate = AnimateManager:getInstance():createBattleAnimate(animation)
    animate:bind(self,isRightFace)
    if(self.team==1)then
        connect(animate,"actionDone",self.battleField,function(name)
      
            if name=="move"
            or name=="rest" then 
                return
            end
            self.battleField:toNext()
        end)
    end
    local namelb=createLabel(self.role.name,18,self.team==1 and cc.WHITE or cc.RED)
    namelb:setPosition(cc.p(0,120))
    self:addChild(namelb,10)
    self.nameLabel=namelb
    
    --effectNode
    local node=cc.Sprite:create():setPosition(0,30)
    self:addChild(node,999)
    self.effectNode=node

    local hex=
    createOctagon(self.battleField.blockEdgeLength*0.7,cc.c4f(0,0,0,0.3))
    :setAnchorPoint(0.5,0.5)
    :addTo(self)

    local hpSlider=LoaderUI(Path:getInstance().ui.redSlider)
    :setContentSize(40,5)
    :setPosition(0,106)
    :setAnchorPoint(0.5,0.5)
    :addTo(self,998)
    :setPercentage(0)
    :loadTo(100)
    
    self.hpSlider=hpSlider

    local mpSlider=LoaderUI(Path:getInstance().ui.blueSlider)
    :setContentSize(40,5)
    :setPosition(0,96)
    :setAnchorPoint(0.5,0.5)
    :addTo(self,998)
    :setPercentage(0)
    :loadTo(100)
    self.mpSlider=mpSlider

    self:registerInfo()
end


function BattleSprite:setPos(x,y)
    if y==nil then
        self.pos=x
    else
        self.pos=cc.p(x,y)
    end

    local pos=self.battleField.battleMat:at(self.pos.x,self.pos.y)
    self:setPosition(pos)
end

--弃用
function BattleSprite:showAnimate(type,...)
    
end

---@param x number
---@param y number
---移到某个战场位置
function BattleSprite:moveTo(x,y)
    local param={}
    local posMat=self.battleField.fieldManager.mat
    local pos=self.pos
    self.battleField.battleSpriteMat:set(pos.x,pos.y,false)
    self.battleField.battleSpriteMat:set(x,y,self)

    local pos=cc.p(x,y)
    local real_pos=posMat:at(x,y)
    local duration=0.5
    BattleAnimation(self,"move",pos,real_pos,duration):play(true)
end


function BattleSprite:attackTarget(skill,targetSpriteArray)
    self.currentSkill=skill

    for _,sprite in targetSpriteArray:iter() do
        self:setAttackResult(sprite,skill)
        if sprite~=self then
            BattleAnimation(sprite,"defend"):play()
        end
        
        BattleAnimation(sprite,"skill",cc.p(sprite:getPosition()),skill.animation):play()   
    end
    local showStrRes=Result(self)
    showStrRes.showString=skill.name
    showStrRes:run(0)
    BattleAnimation(self,"attack"):play()  
end

function BattleSprite:addSp()
    local newSp=mod.BattleSpriteExtend.SpExtend(self,self.sp)
    self.currentSp=self.currentSp+newSp
end

function BattleSprite:getSpDiff()
    return self.currentSp-self.spMax
end

function BattleSprite:getMoveArray()
    local moveArr=array()
    local sourcePos=self.pos
    local template=array()
    
    local mAbility=self.moveAbility

    mod.BattleSpriteExtend.BattleSpriteMoveExtend(self,template)
    
    if  template:empty() then
        template:merge(self.battleField.fieldManager:getPointArray(mAbility))
    end

    template:for_each(function (_,point)
        point.x=sourcePos.x+point.x
        point.y=sourcePos.y+point.y
        local sprite=self.battleField:getSprite(point)
        if (sprite==self or sprite==nil) 
        and self.battleField.fieldManager:inField(point.x,point.y) then
            moveArr:push_back(point)
        end
    end)

    return moveArr
end

---@param skill Skill
---@param targetSprite BattleSprite
function BattleSprite:setAttackResult(targetSprite,skill)
    if targetSprite==self and (not skill:is(SpecialSkill)) then
        return 
    end
    --外功可能触发奥义
    skill=skill:onAttack(self.skillexpAdd,self.toAoyiProb,self)
    --增加内功经验
    local eqInternalSkill=self.role:getEquippedInternalSkill()
    eqInternalSkill:addExp(self.skillexpAdd)
    ---@type Result
    local sourceResult=Result:create(self)
    ---@type Result
    local targetResult=Result:create(targetSprite)
    mod.BattleSpriteExtend.BattleSpriteResultFormula(sourceResult,targetResult,skill)
    mod.BattleSpriteExtend.BattleSpriteTalentExtend(sourceResult,targetResult,skill)

    if self.statistics and  self~=targetSprite then
        local st=self.statistics
        st.attackCount=st.attackCount + (
            targetResult.hp>0 and 1 or 0
        )
        st.totalHurt=st.totalHurt+(
            targetResult.hp>0 and targetResult.hp or 0
        )
        st.totalHittedHurt=st.totalHittedHurt+(
            sourceResult.hp>0 and sourceResult.hp or 0
        )
        st.hitCount=st.hitCount+(
            sourceResult.hp>0 and 1 or 0
        )
 
    end
    if targetSprite.statistics and self~=targetSprite then
        local st=targetSprite.statistics
        st.totalHurt=st.totalHurt+(
            sourceResult.hp>0 and sourceResult.hp or 0
        )
        st.totalHittedHurt=st.totalHittedHurt+(
            targetResult.hp>0 and targetResult.hp or 0
        )
        st.hitCount=st.hitCount+(
            targetResult.hp>=0 and 1 or 0
        )
     
    end
    sourceResult:run(0)
    targetResult:run(0)
    self:updateSlider()
    targetSprite:updateSlider()
    
   -- self:addResult(sourceResult)
   -- targetSprite:addResult(targetResult)
    
end
function BattleSprite:rest()
    local sourceResult=Result:create(self)
    mod.BattleSpriteExtend.BattleSpriteRestExtend(sourceResult)
    self:addResult(sourceResult)
end

function BattleSprite:addResult(result)
    self.results:push_back(result)
end

function BattleSprite:runResult()
    self.results:for_each(function(index,result) result:run(index) end)
    
    self.results:clear()
    
    if  self.hp<=0 then 
        self:die() 
    else
        self:updateSlider()
    end
end

function BattleSprite:updateSlider()
    self.hpSlider:loadTo(math.ceil(self.hp/self.maxHp*100))
    self.mpSlider:loadTo(math.ceil(self.mp/self.maxMp*100))
end


function BattleSprite:die()
    if mod.BattleSpriteExtend.DieExtend(self) then
        self:remove()
    end
end


function BattleSprite:registerInfo()
    local infoShowSize=cc.size(300,300)
    local onBegin=function(touch,event)
        local dr=createBlock(infoShowSize,cc.c4f(0,0,0,0.6))
        dr:addTo(self,1000)
        local p = touch:getLocation()
        p = self:convertTouchToNodeSpace(touch)
        dr:setPosition(p)
        dr:setContentSize(infoShowSize)
        local lb=createLabel(self:toString(),14)
        lb:setAnchorPoint(0,1)
        lb:setPosition(0,infoShowSize.height)
        lb:setWidth(infoShowSize.width)
        dr:addChild(lb,1)
        dr:setAnchorPoint(0,1)
        local back=createLabel("返回",20,cc.RED)
        back:setAnchorPoint(1,1)
        :setPosition(infoShowSize.width,infoShowSize.height)
        :addTo(dr,100)
        onNodeTouch(back,function ( )
            if  self.infoShow then 
                self.infoShow:removeFromParent()
                self.infoShow=nil
            end            
        end)
        self.infoShow=dr
    end
    local move=function() end
    local onEnd=function(touch,event,inRect)
        if  self.infoShow then 
            self.infoShow:removeFromParent()
            self.infoShow=nil
        end
    end
    onNodeTouchIn(self.spriteAnimation.sprite,onBegin,move,onEnd,false)

end

function BattleSprite:useItem(item,targetSpriteArray)
    local sourceResult=Result:create(self)
    local targetResultArray=array()

    targetSpriteArray:for_each(function (index,sprite)
        targetResultArray:push_back(Result(sprite))
    end)

    local flag=mod.BattleSpriteExtend.BattleSpriteUseItemExtend(item,sourceResult,targetResultArray)
    
    if  flag then
        self.cd=item.cd
        item:remove()
    end
    
    self:addResult(sourceResult)

    targetSpriteArray:zip_each(targetResultArray,
    function (_,sprite,result)
        sprite:addResult(result)
    end)
    self.battleField:toNext()
end


function BattleSprite:runBuff()
    local sourceResult=Result:create(self)
    local buffs=self.buffs
    local delbuffs=array()
    buffs:for_each(function (index,buff)

        buff:onResult(sourceResult)
        buff.round=buff.round-1
        if buff.round<=0 then 
            delbuffs:push_back(buff.name) 
        end
    end)
    delbuffs:for_each(function (index,value)
        buffs:get(value):removeTmpEffect()
        buffs:del(value)
    end)

    self:addResult(sourceResult)
end
function BattleSprite:toString()
    local str=
    "生命:"..math.floor(self.hp).."/"..self.maxHp.."\n"..
    "内力:"..math.floor(self.mp).."/"..self.maxMp.."\n"..
    "攻击:"..math.floor(self.attack)..",暴击率:"..(self.criticalp*100).."%\n"..
    "防御:"..math.floor(self.defence)..",抗暴率:"..(self.antiCriticalp*100).."%\n"..
    "怒气:"..math.floor(self.ball).."\n"..
    "buff:\n"
    local strArr=array()
    self.buffs:for_each(function (_,buff)
        strArr:push_back(buff:toString())
    end)
    
    return str..table.concat( strArr:getData(), "\n")

end
function BattleSprite:setAI(ai)
    self._AI=ai
end
function BattleSprite:remove()
    if NetWork:getInstance().inNetWork then
        NetWork:getInstance():send(ENUM.NET_BATTLE.REMOVE_SPRITE,serilize{
            identifier=self.identifier
        })
    end
    self.battleField.controller:remove(self)
end


function BattleSprite:runAI()
   
    local result=self:_AI()
    local mtp=result.moveToPoint
    ---@type SpriteAnimate
    local spriteAnimation=self.spriteAnimation
    if result.isRest or result.attackSkill==nil then
        self:moveTo(mtp.x,mtp.y)
        spriteAnimation:doCallBack(function()
            self.battleField:doRest(self)
        end,"rest")
        return 
    end

    local skill=result.attackSkill    
    local coverArray=skill:getCoverArray(self.pos,result.attackPoint,self.battleField)
    local spriteArray=array() 
    for _,coverPoint in coverArray:iter() do
        local sprite=self.battleField:getSprite(coverPoint)
        if  sprite then
            spriteArray:push_back(sprite)
        end
    end

    self:attackTarget(skill,spriteArray)
    
end

function BattleSprite:getSkills()
    if self.status==ENUM.BATTLESPRITE_STATUS.NORMAL then
        return self.skills
    else
        return self.newSkills
    end
end

function BattleSprite:createSkills(skills)
    local battleSkills=array()

    for _,skill in skills:iter() do
        if skill:is(InternalSkill) then
            
            for _,uniqueSkill in skill:getUniqueSkills():iter() do
                battleSkills:push_back(uniqueSkill)
            end
            
        elseif skill:is(SpecialSkill) then
            battleSkills:push_back(skill )
        elseif skill:is(Skill) then
            battleSkills:push_back(skill)
            for _,uniqueSkill in skill:getUniqueSkills():iter() do
                battleSkills:push_back(uniqueSkill )
            end
        end
    end

    return battleSkills
end

function BattleSprite:getAvaliableSkills()
    local skills=self:getSkills()
    local avalibleSkills=array()
    for _,skill in skills:iter() do
        local status=self:checkSkillStatus(skill)
        if status==ENUM.SKILL_STATUS.AVALIBLE then
            avalibleSkills:push_back(skill)
        end
    end
    return avalibleSkills
end
function BattleSprite:getPrioritySkills()
    local avskills=self:getAvaliableSkills()
 
    avskills:sort(function (skill1,skill2)
        return skill1:getPriority()>skill2:getPriority()
    end)

    return avskills
end

function BattleSprite:onOneRound()
    --减CD
    if self.status==ENUM.BATTLESPRITE_STATUS.NORMAL then
        for _,skill in self.skills:iter() do
            skill.battleCd=(skill.battleCd-1>0) and (skill.battleCd-1) or 0
        end
    else
        for _,skill in self.newSkills:iter() do
            skill.battleCd=(skill.battleCd-1>0) and (skill.battleCd-1) or 0
        end
    end
    --运行BUFF
    self:runBuff()
    --物品cd
    self.cd=(self.cd-1>0) and (self.cd-1) or 0
    --每回合天赋触发
    local result=Result(self)
    local bf=self.battleField
    mod.BattleSpriteExtend.BattleSpriteTalentEveryRoundExtend(result,bf)
    self:addResult(result)
end

function BattleSprite:checkSkillStatus(skill)

    if skill.battleCd>0 then
        return ENUM.SKILL_STATUS.NOT_AVALIBLE
        --这里的ban技能将为永久封印，除非特定事件开启
    elseif skill.isban then
        return ENUM.SKILL_STATUS.BAN
    elseif skill.costball and skill.costball~=0  and skill.costball>self.ball then
        return  ENUM.SKILL_STATUS.BALL_NOT_ENOUGH
    elseif skill.costMp and skill.costMp>self.mp then
        return ENUM.SKILL_STATUS.MP_NOT_ENOUGH
    elseif self.banSkillMap:get(skill.type,0)>0 
    or self.banSkillMap:get(skill.name,0)>0 then
        return ENUM.SKILL_STATUS.BAN
    else
        return ENUM.SKILL_STATUS.AVALIBLE
    end


end


