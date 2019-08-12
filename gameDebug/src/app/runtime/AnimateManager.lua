
_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

class("AnimateManager"){
    CLASS_DEBUG(false);
    public{
        STATICFUNC.getInstance(function(cls)
            if  cls.s_instance==nil then
                cls.s_instance=cls()
            end
            return cls.s_instance
        end);
    }
}

function AnimateManager:AnimateManager()
    self.path=Path:getInstance().root.animation
    self.skillPath=Path:getInstance().root.skillAnimation
    self.skillBuffer={}
end

function AnimateManager:createBattleAnimate(animation)
    local animateName=animation.name
    self:loadAnimateByFile(self.path..animateName)

    local attack=self:createAction(animateName,1,animation.attackEndIndex,animation.attacktime,"attack"):retain()
    local defend=self:createAction(animateName,1,animation.defendEndIndex,animation.defendtime,"defend"):retain()
    local stand=self:createAction(animateName,1,animation.standEndIndex,animation.standtime,"stand"):retain()
    local move=self:createAction(animateName,1,animation.moveEndIndex,animation.movetime,"move"):retain()

    local sprite=cc.Sprite:createWithSpriteFrame(cc.SpriteFrameCache:getInstance():getSpriteFrame(
        string.format( "%s_%s_%i.png",animateName,"stand",1 )
    ))

    return SpriteAnimate(sprite,attack,defend,stand,move,animation)
end

function AnimateManager:loadAnimateByFile(fileName)
    display.loadSpriteFrames(fileName..".plist",fileName..".png")
   
end


function AnimateManager:createAction(prefix,fromIndex,endIndex,time,modName)
    -- body
    local t={}
    for i=fromIndex,endIndex do
        t[#t+1]=
        cc.SpriteFrameCache:getInstance():getSpriteFrame(
            string.format( "%s_%s_%i.png",prefix,modName,i )
        )
    end
    local timGap=time/(endIndex-fromIndex+1)
    local anim=cc.Animation:createWithSpriteFrames(t,timGap)
    anim:setRestoreOriginalFrame( true )
    local action=cc.Animate:create(anim)
    if(modName=="stand")then
        return cc.RepeatForever:create(action)
    else
        return action
    end
end


function AnimateManager:getSkillAnimation(animationName)
    local res=self.skillBuffer[animationName]
    if res then return res end
    self:loadAnimateByFile(self.skillPath..animationName)
    local animation=ResScriptManager:getInstance().skillAnimationsQuery:get(animationName)
    local action=self:createAction(animationName,1,animation.animationEndIndex,animation.time,"skill")
    action:retain()
    self.skillBuffer[animationName]=action
    return action
end

function AnimateManager:clearSkillAnimation()
    for _,action in pairs(self.skillBuffer) do
        action:release()
    end
    self.skillBuffer={}
end
