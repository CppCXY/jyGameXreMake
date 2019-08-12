include "app.views.BattleScene"
_ENV=namespace "views"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
using_namespace "ui"

--以后再考虑对战，暂时不开启
---@class NetBattleScene
class("NetBattleScene"){
    CLASS_DEBUG(false);
    super(BattleScene);
}

---@param battleKey string | table
function NetBattleScene:NetBattleScene(battleInfo,controller)
    self:BattleScene(battleInfo,controller)
end

function NetBattleScene:showRoleSelect(dataSource)
    local query=set()
    
    local roleui=
    RoleUI(dataSource)
    :setBackGround(self.backPath)
    :addTo(self,100)

    local ours=array(self.battle.our_roles)
    local yours=array(self.battle.your_roles)
    
    local limit=ours:size()
    
    connect(roleui:getMat(),"elemTouched",self,function(role,card)
        local result=query:has(role.key)
        local flag=false
        local TMP_LB=998
        if result then
            query:del(role.key)
            local lb=card:getChildByTag(TMP_LB)
            if  lb then
                lb:removeFromParent()
            end

            roleui:showTips("当前取消"..role.name.." 已选 "..(query:size()).." / "..limit)

        else
            local size=query:size()
            if size>=limit then 
                roleui:showTips("不能再选了")
                return 
            end
            local lb=createLabel("选中",20,cc.RED)
            lb:setAnchorPoint(1,0)
            lb:setPosition(card:getContentSize().width,0)
 
            lb:addTo(card,TMP_LB)
            lb:setTag(TMP_LB)

            query:insert(role.key)

            roleui:showTips("当前选中"..role.name.." 已选 "..(size+1).." / "..limit)
        end
    
    end)

    --play music
    local music=self.battle.music
    if music~="" then
        local musicItem=ResScriptManager:getInstance().resourcesQuery:get(music)
        if musicItem then
            Audio:getInstance():playMusic(musicItem.value)
        end
    end

    --show tips
    roleui:showTips("")
    roleui:showTitle("请选择角色参与战斗")


    local strArr=array({"进入战斗"})
    local callArr=array()
    callArr:push_back(
        function ()
            if  query:size()==0 then 
                roleui:showTips("还没选人，不能开始战斗")
                return 
            end

            roleui:showTips("正在等待对方选择")
            
            NetWork:getInstance():send(ENUM.NET_BATTLE.ROLE_INFO,serilize(
                query
            ))
            NetWork:getInstance():wait(ENUM.NET_BATTLE.ROLE_INFO,LNEvent("role_info","once",function(buffers)
                local roleQuery=unSerilize(buffers:at(2))
                if NetWork:getInstance().server then
                    local index=1
                    for key in query:iter() do
                        ours:at(index).key=key
                        index=index+1
                    end
                    index=1
                    for key in roleQuery:iter() do
                        yours:at(index).key=key
                        index=index+1
                    end
                else
                    local index=1
                    for key in roleQuery:iter() do
                        ours:at(index).key=key
                        index=index+1
                    end
                    index=1
                    for key in query:iter() do
                        yours:at(index).key=key
                        index=index+1
                    end
                end
                roleui:remove() 
                self:initBattle(query,ours,yours) 
            end))
        end
    )

    roleui:setMenu(strArr,callArr)
end

function NetBattleScene:initUI()
    local visibleSize=cc.Director:getInstance():getVisibleSize()
    self.timeLabel =self:createTimeLabel():addTo(self,3)
end

function NetBattleScene:initSprite(query,ours,yours)
    local identifier=1
    for index,our in ours:iter() do
        if our.key then
            local role=Role(our.key)
            local dir=our.face==1
            local pos = cc.p(our.x, our.y)
            pos.x=pos.x==0 and 1 or pos.x
            pos.y=pos.y==0 and 1 or pos.y

            local battleSprite = 
            BattleSprite:create(self,role,pos,our.team,dir,identifier)
            :addTo(self, 20)
            :setPosition(self.fieldManager.mat:at(pos.x,pos.y))
            self.spriteArray:push_back(battleSprite)
            identifier=identifier+1
        end
    end

    for index,your in yours:iter() do
        if your.key then
            local role=Role(your.key)
            local dir=your.face==1
            local pos = cc.p(your.x, your.y)
            pos.x=pos.x==0 and 1 or pos.x
            pos.y=pos.y==0 and 1 or pos.y

            local battleSprite = 
            BattleSprite:create(self,role,pos,your.team,dir,identifier)
            :addTo(self, 20)
            :setPosition(self.fieldManager.mat:at(pos.x,pos.y))
            self.spriteArray:push_back(battleSprite)
            identifier=identifier+1
        end
    end
    

end

function NetBattleScene:showEnd(battleResultStatus)
    local exp=0
    local sourceLevelSum=0
    local sourceCount=0
    local targetLevelSum=0
    local targetCount=0
    
    local str="战斗结束"
    self:clearDetail()
    local contSize=cc.size(display.cx*1.5,display.cy*1.5)
    self.detail=
    createBlock(contSize)
    :setPosition(display.cx/4,display.cy/4)
    :setAnchorPoint(0,0)
    :addTo(self,1000)

    local scroll=
    ScrollView()
    :setContentSize(contSize)
    :setPosition(0,0)
    :addTo(self.detail)

    local ok=
    createLabel("确定",30,cc.RED)
    :setAnchorPoint(1,1)
    :setPosition(contSize.width,contSize.height)
    :addTo(self.detail)

    onNodeTouch(ok,function ()
        cc.Director:getInstance():popScene()
    end)
    local textNode=createLabel(str,25)
    textNode:setWidth(contSize.width)
    scroll:setInnerNode(textNode)
end

