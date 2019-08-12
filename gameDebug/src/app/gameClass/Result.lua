_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class Result
local Result=class("Result"){

    CLASS_DEBUG(false)
  
}

local fontSize=20
---@param battleSprite BattleSprite
function Result:Result(battleSprite)    
    self.identifier=battleSprite.identifier
    self.battleSprite=battleSprite
    self.preDealDone=false
    self.hp=0
    self.mp=0
    self.ball=0
    self.recoveredHp=0
    self.recoveredMp=0
    self.isCritical=false
    self.criticalp=0
    self.critical=1
    self.hitted=true
    self.hitprob=1
    self.delBuffs=array()
    self.buffs=array()
    self.times=1
    self.showString=""
    self.allowSend=NetWork:getInstance().inNetWork
end


function Result:preDeal()
    if  self.preDealDone then
        return 
    end
    self.isCritical=probability(self.criticalp) or self.isCritical
    self.critical=self.critical>1 and self.critical or 1
    if  self.isCritical then
        self.hp=self.hp*self.critical
    end
    self.hitted=probability(self.hitprob)
    self.preDealDone=true
    self.hp=math.round(self.hp)
    self.mp=math.round(self.mp)
end

function Result:run(index)
    self:preDeal()

    if  self.allowSend then
        NetWork:getInstance():send(ENUM.NET_BATTLE.DATA,self:pack(index))
    end

    local sprite=self.battleSprite
    for i=1,self.times do 
        if self.hitted==false then
            self:showLabel(
                sprite,
                index*0.1,
                0.5,
                0.2,
                "MISS",
                cc.WHITE,
                cc.p(0,120),
                cc.p(0,20)
            )        
            return
        end
        if self.hp~=0 then
            sprite.hp=sprite.hp-self.hp
            if  sprite.hp>sprite.maxHp then 
                sprite.hp=sprite.maxHp
            end
            --怒气
            if self.hp>=0 then
                local addBall=self.hp/sprite.hp*10
                sprite.ball=sprite.ball+addBall
                sprite.ball=sprite.ball>10 and 10 or sprite.ball
            end
            if  self.hp>0 then
                self:showLabel(
                    sprite,
                    index*0.05,
                    0.5,
                    0.3,
                    string.format( "%s %i ",self.isCritical and "暴击 " or "",math.abs(self.hp)),
                    self.isCritical and cc.YELLOW or cc.RED,
                    cc.p(0,120),
                    cc.p(10,20)
                )
            elseif self.hp<0 then 
                self:showLabel(
                    sprite,
                    index*0.05,
                    0.5,
                    0.3,
                    math.abs(self.hp),
                    cc.GREEN,
                    cc.p(0,120),
                    cc.p(10,30)
                )
            end
        end
        
        if  self.recoveredHp~=0 then
            sprite.hp=self.hp+self.recoveredHp
            if  sprite.hp>sprite.maxHp then 
                sprite.hp=sprite.maxHp 
            end
            self:showLabel(
                sprite,
                index*0.07,
                0.5,
                0.3,
                string.format( "%s %i ","恢复Hp ",self.recoveredHp),
                cc.GREEN,
                cc.p(0,120),
                cc.p(10,30)
            )
        end

        if  self.recoveredMp~=0 then
            sprite.mp=self.mp+self.recoveredMp
            if  sprite.mp>sprite.maxMp then 
                sprite.mp=sprite.maxMp 
            end
            self:showLabel(
                sprite,
                index*0.07,
                0.5,
                0.3,
                string.format( "%s %i ","恢复Mp ",self.recoveredMp),
                cc.BLUE,
                cc.p(0,120),
                cc.p(-10,30)
            )
        end
        
        if self.mp~=0 then
            sprite.mp=sprite.mp-self.mp
            if  sprite.mp>sprite.maxMp then 
                sprite.mp=sprite.maxMp
            end
            self:showLabel(
                sprite,
                index*0.1,
                0.5,
                0.2,
                string.format( "%s %i ",(self.mp>=0 and "-" or "+"),math.abs(self.mp)),
                cc.BLUE,
                cc.p(0,120),
                cc.p(-10,20)
            )

        end
        
        if self.ball~=0 then
            sprite.ball=sprite.ball-self.ball
        end

        if  not self.buffs:empty() then
            for _,buff in self.buffs:iter() do
                sprite:addBuff(buff)
                self:showLabel(
                    sprite,
                    index*0.08,
                    0.5,
                    0.2,
                    string.format( "+ %s ",buff.name),
                    cc.YELLOW,
                    cc.p(0,120),
                    cc.p(0,30)
                )
            end
        end

        if not self.delBuffs:empty() then
            local buffs=self.battleSprite.buffs
            self.delBuffs:for_each(function (index,value)
                buffs:get(value):removeTmpEffect()
                buffs:del(value)
            end)
        end

        if  self.showString~="" then
            self:showLabel(
                sprite,
                0,
                0.5,
                0.2,
                self.showString,
                cc.c3b(255,0,255),
                cc.p(0,120),
                cc.p(0,15)
            )

        end
    end
end

---@param sprite BattleSprite
---@param delayTime number @延迟时间
---@param str string @显示字符
---@param color cc.c3b @颜色
---@param fromPosition cc.p @起始点
function Result:showLabel(sprite,delayTime,duration,stayTime,str,color,fromPosition,desPosition)
    fromPosition=fromPosition or cc.p(0,100)
    duration=duration or 1
    color=color or cc.RED
    
    local action
    action=cc.Sequence:create(
        cc.DelayTime:create(delayTime),
        cc.CallFunc:create(function() 
            local lb=createLabel(str,fontSize,color)
            lb:setPosition(fromPosition)
            sprite:addChild(lb,2)
            lb:runAction(
                cc.Sequence:create(
                    cc.JumpBy:create(duration,desPosition,30,1),
                    cc.DelayTime:create(stayTime),
                    cc.CallFunc:create(
                        function()
                            lb:removeFromParent() 
                        end
                    )
                )
            )
        end)
    )
    sprite:runAction(action)
end

function Result:pack(index)
    return 
    serilize(
        setmetatable({
        identifier=self.identifier;
        hp=self.hp;
        mp=self.mp;
        ball=self.ball;
        recoveredHp=self.recoveredHp;
        recoveredMp=self.recoveredMp;
        isCritical=self.isCritical;
        criticalp=self.criticalp;
        critical=self.critical;
        hitted=self.hitted;
        hitprob=self.hitprob;
        delBuffs=self.delBuffs;
        times=self.times;
        buffs=self.buffs;
        showString=self.showString;
        allowSend=false;
        index=index;
        __class=self.__class
        },self.__class)
    )
end

function Result:unPack()
    self.battleSprite=cc.Director:getInstance():getRunningScene():findIdentifier(self.identifier)
end
