include "app.controller.BattleController"

_ENV=namespace "controller"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

---@class NetBattleController
class("NetBattleController"){
    CLASS_DEBUG(false);
    super(BattleController);
}

function NetBattleController:NetBattleController(team)
    self:BattleController()
    self.isMyTurn=false
    self.team=team
end
function NetBattleController:next()
    NetWork:getInstance():send(ENUM.NET_BATTLE.START)   
    NetWork:getInstance():send(ENUM.NET_BATTLE.ON_RESULT) 

    self.lock=false
    self.spriteArray:for_each(function(_,sprite)
        sprite:runResult()
    end)

    NetWork:getInstance():send(ENUM.NET_BATTLE.END) 
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

function NetBattleController:decidedWho()

    while not self.isMyTurn do
        coroutine.yield()
    end

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
        NetWork:getInstance():send(ENUM.NET_BATTLE.START)
        NetWork:getInstance():send(ENUM.NET_BATTLE.REST)
        self:oneRound()
        NetWork:getInstance():send(ENUM.NET_BATTLE.END)
    end

    if(maxDiff>=0) then
        maxDiffSprite.currentSp=maxDiff
        self.currentSprite=maxDiffSprite
        break
    end
    NetWork:getInstance():send(ENUM.NET_BATTLE.UP_TIME,serilize{
        time=self.time
    })
    

end


end


function NetBattleController:initCoroutine()
    local mainCoroutine=coroutine.create( function()
        while true do
            self:decidedWho()
            if self:isEnd() then break end
            self:run()
            coroutine.yield()
        end     
    end  
    )
    self.mainCoroutine=mainCoroutine
end



function NetBattleController:bind(battleField)
    self.spriteArray:merge(battleField.spriteArray)
    self.battleField=battleField
    connect(battleField,"attacked",self,"onAttack")
    connect(battleField,"moved",self,"onMove")
    connect(battleField,"rested",self,"onRest")
    connect(battleField,"useItemed",self,"onUseItem")
    
    NetWork:getInstance():wait(ENUM.NET_BATTLE.ON_RESULT,LNEvent("result","stay",function(buffers)
        for i=2,buffers:size() do
            local netPack=unSerilize(buffers:at(i))
            if is(netPack,BattleAnimation) then
                netPack:unPack()
                netPack:play()
            elseif is(netPack,Result) then
                netPack:unPack()
                netPack:run(netPack.index)
            else 
                print("drop ",netPack)
            end
        end
    end))

    NetWork:getInstance():wait(ENUM.NET_BATTLE.REMOVE_SPRITE,LNEvent("result","stay",function(buffers)
        for i=2,buffers:size() do
            local netPack=unSerilize(buffers:at(i))
            if is(netPack,BattleAnimation) then
                netPack:unPack()
                netPack:play()
            elseif is(netPack,Result) then
                netPack:unPack()
                netPack:run(netPack.index)
            else 
                local sprite=cc.Director:getInstance():getRunningScene():findIdentifier(netPack.identifier)
                self:remove(sprite)
            end
        end
    end))

    NetWork:getInstance():wait(ENUM.NET_BATTLE.ATTACK,LNEvent("attack","stay",function(buffers)
        
        for i=2,buffers:size() do
            local netPack=unSerilize(buffers:at(i))
            if is(netPack,BattleAnimation) then
                netPack:unPack()
                netPack:play()
            elseif is(netPack,Result) then
                netPack:unPack()
                netPack:run(netPack.index)
            else 
                print("drop ",netPack)
            end
        end
    end))
    NetWork:getInstance():wait(ENUM.NET_BATTLE.MOVE,LNEvent("move","stay",function(buffers)
        
        for i=2,buffers:size() do
            local netPack=unSerilize(buffers:at(i))
            if is(netPack,BattleAnimation) then
                netPack:unPack()
                netPack:play()
            elseif is(netPack,Result) then
                netPack:unPack()
                netPack:run(netPack.index)
            else 
                local sprite=cc.Director:getInstance():getRunningScene():findIdentifier(netPack.identifier)
                local pos=netPack.pos
                sprite:moveTo(pos.x,pos.y)
            end
        end

    end))
    NetWork:getInstance():wait(ENUM.NET_BATTLE.REST,LNEvent("rest","stay",function(buffers)
        for i=2,buffers:size() do
            local netPack=unSerilize(buffers:at(i)):unPack()
            if is(netPack,BattleAnimation) then
                netPack:play()
            elseif is(netPack,Result) then
                netPack:run(netPack.index)
            else 
                print(netPack)
            end
        end
    end))
    
    NetWork:getInstance():wait(ENUM.NET_BATTLE.UP_TIME,LNEvent("uptime","stay",function(buffers)
        for i=2,buffers:size() do
            local netPack=unSerilize(buffers:at(i)):unPack()
            if is(netPack,BattleAnimation) then
                netPack:play()
            elseif is(netPack,Result) then
                netPack:run(netPack.index)
            else 
                self.time=netPack.time
                self:updateTimeLabel()
            end
        end
    end))

    NetWork:getInstance():wait(ENUM.NET_BATTLE.USEITEM,LNEvent("useitem","stay",function(buffers)
        
    end))

    NetWork:getInstance():wait(ENUM.NET_BATTLE.MY_TURN,LNEvent("my_turn","stay",function()
        self.isMyTurn=false
    end))
    
    NetWork:getInstance():wait(ENUM.NET_BATTLE.YOUR_TURN,LNEvent("your_turn","stay",function()
        self.isMyTurn=true
        self:next()
    end))

    if NetWork:getInstance().server then
        self.isMyTurn=true
    end
    
    self:next()

end

function NetBattleController:onAttack(skill,battleSprite,spriteArr)
    if  self.lock then
        return 
    end

 
    NetWork:getInstance():send(ENUM.NET_BATTLE.START)
    NetWork:getInstance():send(ENUM.NET_BATTLE.ATTACK)

    if not spriteArr:empty() then
        self.lock=true
        battleSprite:attackTarget(skill,spriteArr)
    else
        self.battleField:toNext()
    end

    NetWork:getInstance():send(ENUM.NET_BATTLE.END)
end

function NetBattleController:onMove(battleSprite,pos)
    NetWork:getInstance():send(ENUM.NET_BATTLE.START)
    NetWork:getInstance():send(ENUM.NET_BATTLE.MOVE,serilize{
        identifier=battleSprite.identifier;
        pos=pos;
    })
    battleSprite:moveTo(pos.x,pos.y)
    NetWork:getInstance():send(ENUM.NET_BATTLE.END)
end

function NetBattleController:onRest(battleSprite)
    if  self.lock then
        return 
    end

    NetWork:getInstance():send(ENUM.NET_BATTLE.START)
    NetWork:getInstance():send(ENUM.NET_BATTLE.REST)
    self.lock=true
    battleSprite:rest()
    NetWork:getInstance():send(ENUM.NET_BATTLE.END)
end

function NetBattleController:onUseItem(item,battleSprite,spriteArr)

end


function NetBattleController:run()
    
    self:updateTimeLabel()

    local battleSprite=self.currentSprite
    
    battleSprite:runBuff()

    if battleSprite.team==self.team then
        NetWork:getInstance():send(ENUM.NET_BATTLE.START)
        NetWork:getInstance():send(ENUM.NET_BATTLE.MY_TURN)
        NetWork:getInstance():send(ENUM.NET_BATTLE.END)
        self:updateMenu()
    else
        NetWork:getInstance():send(ENUM.NET_BATTLE.START)
        NetWork:getInstance():send(ENUM.NET_BATTLE.YOUR_TURN)
        NetWork:getInstance():send(ENUM.NET_BATTLE.END)
    end
    
end
function NetBattleController:updateTimeLabel(notSend)
    if not notSend then
        NetWork:getInstance():send(ENUM.NET_BATTLE.START)
        NetWork:getInstance():send(ENUM.NET_BATTLE.UP_TIME,serilize{
            time=self.time
        })
        NetWork:getInstance():send(ENUM.NET_BATTLE.END)
    end
    self.battleField:setTimeString(
        string.format("时间 %d/%d",self.time,self.maxTime)
    )
end

function NetBattleController:isEnd()
    local hasSource=false
    local hasTarget=false
    local isEnd=false
    local isWin=false

    if(self.time>self.maxTime) then
        isEnd=true
    end

    self.spriteArray:for_each(function (_,sprite)
        if sprite.team==self.team then
            hasSource=true
        else 
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
            isWin and ENUM.BATTLE_RESULT_STATUS.WIN
            or ENUM.BATTLE_RESULT_STATUS.LOSE
        )
        return true
    end
    return false
end



