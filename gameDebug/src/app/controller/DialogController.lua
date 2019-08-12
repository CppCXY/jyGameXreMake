--include "app.gameClass.battle"
_ENV=namespace "controller"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
using_namespace "views"
class("DialogController"){
    NO_AUTO_INHERIT();
    CLASS_DEBUG(false);
}

function DialogController:DialogController(story,currentMapName)
    self.displayUI=nil
    self.actions=nil
    self.results=nil
    self._lock=false
    self.result=0
    self.tmpVaribles=nil
    self.innerMode=false
    self.mapName=currentMapName
    self.meetSet=set()
    self:parseStory(story)
end

function DialogController:replaceDisplayNode(node)
    self.displayUI=node
    onNodeTouch( node,function ()
        if not self:islock() then
            self:nextAction()
        end
        return true
    end)
end

function DialogController:islock()
    return self._lock
end

function DialogController:replaceStory(story)
    self:parseStory(story)
end

function DialogController:parseStory(story)
    RuntimeData:getInstance().storys:insert(story.name)
    local action={}
    local count=0
    for k,v in pairs(story.action) do
        action[k]=v
        count=count+1
    end
    self.actions=queue( count,action)
    self.results=map()
    for _,result in pairs(story.result) do
        local key=tonumber(result.ret) 
        key=key and math.round(key) or result.ret
        if key~="" then
            local arr=self.results:get(key)
            if arr==nil then
                arr=array()
                self.results:insert(key,arr)
            end
            arr:push_back(result)
        end
    end
   self.result=0
end

function DialogController:nextAction()
    local action=self.actions:pop_front()
    if action then
        self:doAction(action)
    else
        local status=RuntimeData:getInstance().battleResultStatus
        if status==ENUM.BATTLE_RESULT_STATUS.WIN then
            self.result="win"
        elseif status==ENUM.BATTLE_RESULT_STATUS.LOSE then
            self.result="lose"
        end
        RuntimeData:getInstance().battleResultStatus=ENUM.BATTLE_RESULT_STATUS.UNKOWN
        self:toResult()
    end
end


function DialogController:doAction(action)
    local actionType=action.type
    local value=action.value and action.value:trim() or ""

    if self.innerMode and actionType~="INNER.TABLE" then
        value=value:gsub("%[%[(.-)%]%]",self.tmpVaribles)
    end
    local isTrue=mod.DialogExtend.ActionExtend(self,actionType,value)
    if isTrue then return end
    if actionType=="DIALOG" then
        local roleKey,text=unpack(value:trim():split('#'))
        self.meetSet:insert(roleKey)
        self.displayUI:setData(roleKey,text)
        self.displayUI:show()
    elseif actionType=="SPEAK" then
        self.displayUI:speak(value)
    elseif actionType=="BACKGROUND" then
        self.displayUI:setBackGround(value)
        self:nextAction()
    elseif actionType=="BATTLE" then
        self._lock=true

        local battleController=BattleController()
        local btScene=BattleScene:create(value,battleController)
        btScene:showRoleSelect(
            RuntimeData:getInstance().team
        )
        RuntimeData:getInstance().battleResultStatus=ENUM.BATTLE_RESULT_STATUS.WAIT
        cc.Director:getInstance():pushScene(btScene)
        self._lock=false

    elseif actionType=="SELECT" then
        local t=value:split("#")
        local roleKey=t[1]
        local title=t[2]
        local items=array()
        for i=3,#t do 
            items:push_back( t[i] )
        end
        local luafunc=function (view,cell)
            self._lock=false
            self.result=cell:getIdx()
            self.displayUI:delayClear("_selectItems",0.1)
            self:nextAction() 
            self.result=0
        end
        self._lock=true
        self.displayUI:setData(roleKey,title)
        self.displayUI:setSelect(items,luafunc)
        self.displayUI:show()
    elseif actionType=="JOIN" then
        RuntimeData:getInstance():addRole(Role:create(value))
        self.displayUI:setData(nil,"加入角色 "..value) 
        self.displayUI:show()
    elseif actionType=="LEAVE" then
        RuntimeData:getInstance():leaveRole(value)
        self.displayUI:setData(nil,"离开角色 "..value) 
        self.displayUI:show()
    elseif actionType=="HAOGAN" then
        RuntimeData:getInstance():addHaoGan(value)
        self.displayUI:setData(nil,"好感增加 "..value) 
        self.displayUI:show()
    elseif actionType=="ITEM" then
        local name,number=unpack(value:split('#'))
        local query=RuntimeData:getInstance():addItemByName(name,number)
        number=tonumber(number) or 1
        if number>0 then
            self.displayUI:setData(nil,"获得物品 "..name.." "..number.."个") 
        else
            self.displayUI:setData(nil,"失去物品 "..name.." "..number.."个") 
        end
        self.displayUI:show()
    elseif actionType=="MENPAI" then
        RuntimeData:getInstance().menpai=value
        self.displayUI:setData(nil,"当前门派是 "..value) 
        self.displayUI:show()
    elseif actionType=="COST_MONEY" then
        --弃用
        self.displayUI:setData(nil,"消费 "..value.."钱(钱弃用)")
        self.displayUI:show()
        RuntimeData:getInstance():costMoney(value)
    elseif actionType=="GET_MONEY" then
        --弃用
        self.displayUI:setData(nil,"获得 "..value.."钱(钱弃用)")
        self.displayUI:show()
        RuntimeData:getInstance():addMoney(value)
    elseif actionType=="COST_DAY" then
        RuntimeData:getInstance():costDay(Time:create(tonumber(value),0))
        self.displayUI:setData(nil,"度过了 "..value.."天")
        self.displayUI:show()
    elseif actionType=="COST_HOUR" then
        RuntimeData:getInstance():addTime(Time:create(0,tonumber(value)))
        self.displayUI:setData(nil,"过了 "..value.."个时辰")
        self.displayUI:show()
    elseif actionType=="UPGRADE.MAXHP" then
        RuntimeData:getInstance():upgradeMaxhp(value)
        self.displayUI:setData(nil,"增加Hp "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.MAXMP" then
        RuntimeData:getInstance():upgradeMaxmp(value)
        self.displayUI:setData(nil,"增加Mp "..value)
    elseif actionType=="UPGRADE.根骨" then
        RuntimeData:getInstance():upgradeGengu(value)
        self.displayUI:setData(nil,"增加根骨 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.GENGU" then
        RuntimeData:getInstance():upgradeGengu(value)
        self.displayUI:setData(nil,"增加根骨 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.身法" then
        RuntimeData:getInstance():upgradeShenfa(value)
        self.displayUI:setData(nil,"增加身法 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.SHENFA" then
        RuntimeData:getInstance():upgradeShenfa(value)
        self.displayUI:setData(nil,"增加身法 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.臂力" then
        RuntimeData:getInstance():upgradeBili(value)
        self.displayUI:setData(nil,"增加臂力 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.BILI" then
        RuntimeData:getInstance():upgradeBili(value)
        self.displayUI:setData(nil,"增加臂力 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.福缘" then
        RuntimeData:getInstance():upgradeFuyuan(value)
        self.displayUI:setData(nil,"增加福缘 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.FUYUAN" then
        RuntimeData:getInstance():upgradeFuyuan(value)
        self.displayUI:setData(nil,"增加福缘 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.定力" then
        RuntimeData:getInstance():upgradeDingli(value)
        self.displayUI:setData(nil,"增加定力 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.DINGLI" then
        RuntimeData:getInstance():upgradeDingli(value)
        self.displayUI:setData(nil,"增加定力 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.悟性" then
        RuntimeData:getInstance():upgradeWuxing(value)
        self.displayUI:setData(nil,"增加悟性 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.WUXING" then
        RuntimeData:getInstance():upgradeWuxing(value)
        self.displayUI:setData(nil,"增加悟性 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.WUXUE" then
        RuntimeData:getInstance():upgradeWuxing(value)
        self.displayUI:setData(nil,"增加武学常识 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.拳掌" then
        RuntimeData:getInstance():upgradeQuanzhang(value)
        self.displayUI:setData(nil,"增加拳掌 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.QUANZHANG" then
        RuntimeData:getInstance():upgradeQuanzhang(value)
        self.displayUI:setData(nil,"增加拳掌 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.剑法" then
        RuntimeData:getInstance():upgradeJianfa(value)
        self.displayUI:setData(nil,"增加剑法 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.JIANFA" then
        RuntimeData:getInstance():upgradeJianfa(value)
        self.displayUI:setData(nil,"增加剑法 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.刀法" then
        RuntimeData:getInstance():upgradeDaofa(value)
        self.displayUI:setData(nil,"增加刀法 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.DAOFA" then
        RuntimeData:getInstance():upgradeDaofa(value)
        self.displayUI:setData(nil,"增加刀法 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.奇门" then
        RuntimeData:getInstance():upgradeQimen(value)
        self.displayUI:setData(nil,"增加奇门 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.QIMEN" then
        RuntimeData:getInstance():upgradeQimen(value)
        self.displayUI:setData(nil,"增加奇门 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.SKILL" then
        RuntimeData:getInstance():upgradeSkill(value)
        self.displayUI:setData(nil,"升级/获得技能 "..value)
        self.displayUI:show()
    elseif actionType=="LEARN.SKILL" then
        RuntimeData:getInstance():learnSkill(value)
        self.displayUI:setData(nil,"学习技能 "..value)
        self.displayUI:show()
    elseif actionType=="UPGRADE.INTERNALSKILL" then
        RuntimeData:getInstance():upgradeInternalSkill(value)
        self.displayUI:setData(nil,"升级内功 "..value)
        self.displayUI:show()
    elseif actionType=="LEARN.INTERNALSKILL" then
        RuntimeData:getInstance():learnInternalSkill(value)
        self.displayUI:setData(nil,"学习内功 "..value)
        self.displayUI:show()
    elseif actionType=="LEARN.TALENT" then
        RuntimeData:getInstance():learnTalent(value)
        self.displayUI:setData(nil,"获得天赋 "..value)
        self.displayUI:show()
    elseif actionType=="REMOVE.TALENT" then
        RuntimeData:getInstance():removeTalent(value)
        self.displayUI:setData(nil,"移除天赋 "..value)
        self.displayUI:show()
    elseif actionType=="MAXLEVEL" then
        --弃用
        self.displayUI:setData(nil,"最大技能等级(弃用) "..value)
        self.displayUI:show()
    elseif actionType=="SELECT_MENPAI" then
        
    elseif actionType=="SHOP" or actionType=="shop" then
        self.displayUI:showShop(value)
    elseif actionType=="GROWTEMPLATE" then
        local roleKey,temp=unpack(value:split("#"))
        local role =RuntimeData:getInstance():getRole(roleKey)
        if role then
            role:setGrowTemplate(temp)
            self.displayUI:setData(role.key,role.name.."成长模板变更为 "..temp)
            self.displayUI:show()
        end
    elseif actionType=="SUGGEST" then
        RuntimeData:getInstance():addSuggest(value)
        self.displayUI:setData(nil,"建议: "..value)
        self.displayUI:show()
    elseif actionType=="LOG" then
        RuntimeData:getInstance():addSuggest(value)
        self.displayUI:setData(nil,"LOG(此关键词弃用) \n"..value)
        self.displayUI:show()
    elseif actionType=="DAODE" then
        RuntimeData:getInstance():addDaoDe(value)
        self.displayUI:setData(nil,"道德增加: "..value)
        self.displayUI:show()
    elseif actionType=="NICK" then
        self.displayUI:setData(nil,"获得称号: "..value)
        self.displayUI:show()
    elseif actionType=="SET.TAG" then
        RuntimeData:getInstance().tag:insert(value)
        self:nextAction()
    elseif actionType=="ALTER.NAME" then
        self._lock=true
        self.displayUI:showInputBox(function ( text)
            self._lock=false
            local role=RuntimeData:getInstance().team:get(value)
            if role then 
                role.name=text
            end
        end)
    elseif actionType=="SET.SEX" then
        local roleKey,sex=unpack(value:split("#"))
        local role=RuntimeData:getInstance().team:get(roleKey)
        if role then
            role.sex=sex=="MAN" and "男" or "女"
        end
        self:nextAction()
    elseif actionType=="SET.ANIMATION" then
        local roleKey,animation=unpack(value:split("#"))
        local role=RuntimeData:getInstance().team:get(roleKey)
        if role then
            role.animation=animation
        end
        self:nextAction()
    elseif actionType=="SET.HEAD" then
        local roleKey,head=unpack(value:split("#"))
        local role=RuntimeData:getInstance().team:get(roleKey)
        if role then
            role.picPath=ResScriptManager:getInstance().resourcesQuery:get(head).value
        end
        self:nextAction()
    elseif actionType=="SET.CHAPTER" then
        RuntimeData:getInstance().chapter=value
        self:nextAction()
    elseif actionType=="DEL.TAG" then
        RuntimeData:getInstance().tag:del(value)
        self:nextAction()
    elseif actionType=="ITEM.RAND.NUMBER" then
  
        local name,from,to =unpack(value:split('#'))
        from=tonumber(from)
        to=tonumber(to)
        local number=randInt(from,to)

        RuntimeData:getInstance():addItemByName(name,number)
        
        self.displayUI:setData(nil,"获得物品 "..name.." "..number.."个") 
        self.displayUI:show()
    elseif actionType=="SET.TAG.DELAY" then
        local tag,day,hour=unpack(value:split('#'))
        RuntimeData:getInstance().time:register(Time(tonumber(day),tonumber(hour)),
        
        Func({tag=tag} ,
        function(up)
            RuntimeData:getInstance().tag:insert(up.tag)
        end
        ))

        self:nextAction()
    elseif actionType=="DEL.TAG.DELAY" then
        local tag,day,hour=unpack(value:split('#'))
        RuntimeData:getInstance().time:register(Time(tonumber(day),tonumber(hour)),
        
        Func({tag=tag} ,
        function(up)
            RuntimeData:getInstance().tag:del(up.tag)
        end
        ))

        self:nextAction()
    elseif actionType=="MISSION" then
        self.displayUI:showMission(value)
    elseif actionType=="COMPLETE.MISSION" then
        local mission=RuntimeData:getInstance().missions:get(value)
        if mission then
            RuntimeData:getInstance().missions:del(value)
            self.displayUI:setData(nil,"任务 "..mission.name.."完成") 
            self.displayUI:show()
        else
            print("wrong: 错误的任务标志"..value)
            self:nextAction()
        end
    elseif actionType=="LOAD.QUESTION" then
    
        local questions=ResScriptManager:getInstance().questionsQuery:get(value)
        if questions ==nil then
            print("没有question",value)
            return 
        end
        local questionsCoroutine
        local scores=0
        questionsCoroutine=coroutine.create(function()
            for _,question in questions:iter() do           
                --local roleKey=question.roleKey
                local title=question.title
                local itemsTable={
                    question.question1;
                    question.question2;
                    question.question3;
                    question.question4;
                }
                local answer=question.answer
                local anq=itemsTable[answer]
                shuffle(itemsTable)
                for i=1,#itemsTable do
                    if itemsTable[i]==anq then
                        answer=i
                        break
                    end
                end
                local items=array(itemsTable)
                local luafunc=function (view,cell)
                    self._lock=false
                    if answer==(cell:getIdx()+1 )then
                        scores=scores+1
                    end
                    print(scores)
                    self.displayUI:delayClear("_selectItems",0.1)
                    coroutine.resume(questionsCoroutine)
                end
                self._lock=true
                self.displayUI:setData(nil,title)
                self.displayUI:setSelect(items,luafunc)
                self.displayUI:show()
                coroutine.yield()
            end
            RuntimeData:getInstance().questionScores:insert(value,scores)
            self:nextAction() 
        end)
        coroutine.resume(questionsCoroutine)
    elseif actionType=="INNER.BEGIN" then
        if self.innerMode==false then
            self.tmpVaribles=nil
            self.innerMode=true
        end
        self:nextAction() 
    elseif actionType=="INNER.END" then
        if self.innerMode then
            self.tmpVaribles=nil
            self.innerMode=false
        end
        self:nextAction() 
    elseif actionType=="INNER.TABLE" then
        if self.innerMode then
            self.tmpVaribles=unSerilize(value)
        end
        self:nextAction() 
    elseif actionType=="HEAD.SELECT" then
        local roleKey,selectKey=unpack(value:split("#"))
        self.displayUI:showHeadSelect(roleKey,selectKey)
    elseif actionType=="NEXT.ROUND"  then
        RuntimeData:getInstance():nextRound()
    elseif actionType=="WAREHOUSE" then
        self.displayUI:showWareHouse()
    else
        print("action type :"..actionType.." 未定义 ,value："..value)
        self:nextAction()
    end
end

function DialogController:toResult()
    for roleKey in self.meetSet:iter() do
        RuntimeData:getInstance():sendEvent(ENUM.RUNTIME_EVENT.MEET_ROLE,roleKey)
    end
    local results=self.results:get(self.result)
    if results then        
        for _,result in results:iter() do
            if EventManager:getInstance():checkConditions(result.condition,self.tmpVaribles)  then
                return self:doResult(result)
            end
        end
    else

        if  self.result=="lose" then
            self:doResult({type="endGame",value="胜败乃兵家常事，请大侠重头来过"})
            return 
        end

        --[[
        delayCall(self.displayUI,0.1,function ()
            self.displayUI:removeFromParent()
        end)
        --]]--这种做法会在地图对话结束后不刷新事件
        cc.Director:getInstance()
        :replaceScene(require("app.views.MapScene")
        :create(
            RuntimeData:getInstance().currentMap
        ))        
        
    end
end
function DialogController:doResult(result)
    if result.type=="story" then
        self:parseStory(
            ResScriptManager:getInstance().storysQuery:get(result.value))
        self:nextAction()
    elseif result.type=="rand.story" then
        self:parseStory(
            ResScriptManager:getInstance().storysQuery:get(result.value:split("#"))
        )
        self:nextAction()
    elseif result.type=="map" then
        cc.Director:getInstance()
        :replaceScene(require("app.views.MapScene")
        :create(result.value))
    elseif result.type=="shop" then
        self.displayUI:setData(result.value:trim())
        self.displayUI:show()
    elseif result.type=="endGame" then
        cc.Director:getInstance():replaceScene(views.EndScene(result.value))
    end
end

