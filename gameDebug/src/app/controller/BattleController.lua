_ENV=namespace "controller"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
---@class BattleController
class("BattleController"){
    CLASS_DEBUG(false);
    SINGAL.oneRound();
}

function BattleController:BattleController()
    --
    self.battleField=nil
    self.spriteArray=array()

    --当前选择
    self.currentSprite=nil

    --时间
    self.time=0
    self.maxTime=mod.Limit.battleTotalTime
    self:initCoroutine()

    self.lock=false
    connect(self,"oneRound",self,"onOneRound")

end

function BattleController:onOneRound()

    self.spriteArray:for_each(function(_,sprite)
        sprite:onOneRound() 
    end)
    --不要放在一起哦
    self.spriteArray:for_each(function(_,sprite)
        sprite:runResult()
    end)
end

function BattleController:nextRunTime()
    local status ,error=coroutine.resume(self.mainCoroutine)
    if status==false then
        print(error)
    end
end

function BattleController:next()
    self.lock=false
    self.spriteArray:for_each(function(_,sprite)
        sprite:runResult()
    end)
    local coStatus=coroutine.status( self.mainCoroutine )
    --当使用自动AI时执行到这里协程依然可能是running,所以使用延迟回调
    if coStatus=="running" then
        self.battleField:runAction(
            cc.Sequence:create(
                cc.DelayTime:create(0.2),
                cc.CallFunc:create(function()
                    self:nextRunTime()
                end))
        )
    else
        self:nextRunTime()
    end
end

function BattleController:remove(battleSprite)
    local newArr=array()
    for index,sprite in self.spriteArray:iter() do
        if sprite~=battleSprite then
            newArr:push_back(sprite)
        end
    end
    self.spriteArray=newArr
    battleSprite:setVisible(false)
    battleSprite:setPosition(-200,-200)
end
function BattleController:bind(battleField)
    self.spriteArray:merge(battleField.spriteArray)
    for index,sprite in self.spriteArray:iter() do
        if sprite.team==1 then
            sprite.statistics=BattleStatistics(sprite)
        else
            sprite._AI=mod.AI.runAI
        end
    end
    self.battleField=battleField
    connect(battleField,"attacked",self,"onAttack")
    connect(battleField,"moved",self,"onMove")
    connect(battleField,"rested",self,"onRest")
    connect(battleField,"useItemed",self,"onUseItem")

    self:next()
end
function BattleController:onAttack(skill,battleSprite,spriteArr)
    if  self.lock then
        return 
    end
    if not spriteArr:empty() then
        self.lock=true
        battleSprite:attackTarget(skill,spriteArr)
    else
        self.battleField:toNext()
    end
end
function BattleController:onMove(battleSprite,pos)
    battleSprite:moveTo(pos.x,pos.y) 
end
function BattleController:onRest(battleSprite)
    battleSprite:rest()

end
function BattleController:onUseItem(item,battleSprite,spriteArr)
    if  self.lock then
        return 
    end

    if not spriteArr:empty() then
        self.lock=true
        battleSprite:useItem(item,spriteArr)
    else
        self.battleField:toNext()
    end

end

function BattleController:initCoroutine()
    local mainCoroutine=coroutine.create( function()
        while true do
            local maxDiffSprite=nil
            local maxDiff=-998
            while true do 
                self.spriteArray:for_each(function(_,sprite)
                    sprite:addSp()
                    local diff=sprite:getSpDiff()
                    if( diff>maxDiff) then
                        maxDiff=diff
                        maxDiffSprite=sprite
                    end
                end)

                self.time=self.time+1
                if math.fmod(self.time,100)==0 then
                    self:oneRound()
                end

                if(maxDiff>=0) then
                    maxDiffSprite.currentSp=maxDiff
                    self.currentSprite=maxDiffSprite
                    break
                end
            end
            if self:isEnd() then break end

            self:updateTimeLabel()
            self:run()
            coroutine.yield()
        end     
    end  
    )
    self.mainCoroutine=mainCoroutine
end
function BattleController:run()

    local battleSprite=self.currentSprite

    if  battleSprite._AI then
        battleSprite:runAI()
    else
        self:updateMenu()
    end
    
end

function BattleController:isEnd()
    local hasSource=false
    local hasTarget=false
    local isEnd=false
    local isWin=false
    if(self.time>self.maxTime) then
        isEnd=true
    end
    self.spriteArray:for_each(function (_,sprite)
        if sprite.team==1 then
            hasSource=true
        elseif sprite.team==2 then
            hasTarget=true
        end
    end)

    if hasSource and hasTarget then
        isWin=false
    elseif hasSource then
        isEnd=true
        isWin=true
    elseif hasTarget then
        isEnd=true
        isWin=false
    end
    
    if isEnd then
        self:endGame(
            isWin 
            and ENUM.BATTLE_RESULT_STATUS.WIN
            or  ENUM.BATTLE_RESULT_STATUS.LOSE
        )
        return true
    end
    return false
end
function BattleController:endGame(result)
    self.battleField:showEnd(result)
end

function BattleController:updateMenu()
    self.battleField:showMenu(self.currentSprite)
end

function BattleController:updateTimeLabel()
    self.battleField:setTimeString(
        string.format("时间 %d/%d",self.time,self.maxTime)
    )
end

return BattleController
