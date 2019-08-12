_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
---@class SpriteAnimate
local SpriteAnimate=class("SpriteAnimate"){
    CLASS_DEBUG(false);

    SINGAL.actionDone("actionName");
}

function SpriteAnimate:SpriteAnimate(sprite,attack,defend,stand,move,animation)
    self.sprite=sprite
    self.attack=attack
    self.defend=defend
    self.stand=stand
    self.move=move
    self.inAction=false
    self.actionQueue=queue(100)
    self.animation=animation

end

function SpriteAnimate:clear()
    self.attack:release()
    self.defend:release()
    self.move:release()
    self.stand:release()
end

function SpriteAnimate:runAction(ccAction,actionName)
    if type(ccAction)=="function" then
        self.actionQueue:push_back({action=ccAction,name=actionName})
    else
        self.actionQueue:push_back({action=ccAction:retain(),name=actionName})
    end
    if not self.inAction then
        self:doAction()
    end
    return self
end

function SpriteAnimate:doAction()
    self.inAction=true
    self:stopStand()
    local actionSt=self.actionQueue:pop_front()
    local action=actionSt.action

    --这么写是因为cc.Sequence 对cc.CallFunc 有bug
    if type(action)=="function" then
        action()
        self.inAction=false
        self:checkActionQueue(actionSt.name)
    else
        self.sprite:runAction(cc.Sequence:create(
            action:release(),
            cc.CallFunc:create(function()
                self.inAction=false 
                self:checkActionQueue(actionSt.name)
            end)
        ))
    end
end
function SpriteAnimate:checkActionQueue(lastname)
    if  self.actionQueue:empty() then
        self:doStand()
        delayCall(self.sprite,0.5,function()
            self:actionDone(lastname)
        end)
    else
        self:doAction()
    end

end

function SpriteAnimate:bind(battleSprite,face)
    self.battleSprite=battleSprite
    self.battleField=battleSprite.battleField
    
    self.sprite:setScaleX((face and 1 or -1) *self.animation.scale)
    battleSprite.spriteAnimation=self
    local anpx,anpy=unpack(self.animation.anchorPoint:split('#'))
    anpx=tonumber(anpx)
    anpx=face and anpx or (1-anpx)
    anpy=tonumber(anpy)
    local anp=cc.p(anpx,anpy)
    self.sprite:setScaleY(self.animation.scale)
    self.sprite:setAnchorPoint(anp)

    battleSprite:addChild(self.sprite,10)
    
end

function SpriteAnimate:doCallBack(luafunction,name)
    self:runAction(luafunction,name)
end

function SpriteAnimate:doStand()
    self.sprite:runAction(self.stand)
end
function SpriteAnimate:stopStand()
    self.sprite:stopAction(self.stand)
end

function SpriteAnimate:doAttack()
    self:runAction(self.attack,"attack")
end
function SpriteAnimate:doDefend()

    self:runAction(self.defend,"defend")

end

function  SpriteAnimate:doMove(pos,real_pos,time)

    
    local sprite=self.battleSprite
    local s_pos=sprite.pos
    if pos.x==s_pos.x and pos.y==s_pos.y then
        return
    end
    if (pos.x-s_pos.x)>0 then
        self.sprite:setScaleX(( self.animation.scale))
    elseif (pos.x-s_pos.x)<0 then 
        self.sprite:setScaleX((-1*self.animation.scale))
    end
    sprite.pos=pos
    sprite:setZOrder(1000-pos.y)

    self:runAction(
        cc.Spawn:create(
            self.move,
            cc.DelayTime:create(time)
        ),"move"
    )
    if real_pos then
        sprite:runAction(cc.MoveTo:create(time,real_pos))
    end
end

function SpriteAnimate:doEffect(real_pos,skillAnimationName)
    local animation=ResScriptManager:getInstance().skillAnimationsQuery:get(skillAnimationName)

    local skillEffectNode=
    cc.Sprite:create()
    :addTo(self.battleField)
    :setPosition(real_pos)
    :setScale(animation.scale)


    skillEffectNode:runAction(
        cc.Sequence:create(
        AnimateManager:getInstance():getSkillAnimation(skillAnimationName),
        cc.CallFunc:create(function ()
            skillEffectNode:removeFromParent()
        end)
        )
    )
end