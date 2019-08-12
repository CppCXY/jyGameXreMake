
_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
---@class BattleAnimation
class("BattleAnimation"){
    CLASS_DEBUG(false);
}

function BattleAnimation:BattleAnimation(sprite,type,...)
    self.identifier=sprite.identifier
    self.battleSprite=sprite
    self.type=type
    self.params={...}
    self.allowSend=NetWork:getInstance().inNetWork 
end

function BattleAnimation:play(notSend)
    if  self.allowSend and (not notSend) then
        NetWork:getInstance():send(ENUM.NET_BATTLE.DATA,self:pack())
    end

    if mod.BattleSpriteExtend.BattleSpriteShowAnimationExtend(self) then
        return 
    end

    local ctype=self.type
    local param=self.params
    local animate=self.battleSprite.spriteAnimation



    if ctype=="stand" then
        animate:doStand()
        
    elseif ctype=="attack" then
        animate:doAttack()
    elseif ctype=="skill" then
        local real_pos=param[1]
        local skillAnimateName=param[2]
        animate:doEffect(real_pos,skillAnimateName)
    elseif ctype=="defend" then
        animate:doDefend()
    elseif ctype=="move" then
        local pos=param[1]
        local real_pos=param[2]
        local duration=param[3] or 0.5
        animate:doMove(pos,real_pos,duration)
    end

end

function BattleAnimation:pack()
    return serilize(
        setmetatable({
        identifier=self.identifier;
        type=self.type;
        params=self.params;
        allowSend=false;
        __class=self.__class
        },self.__class)
    )

end

function BattleAnimation:unPack()
    self.battleSprite=cc.Director:getInstance():getRunningScene():findIdentifier(self.identifier)
end
