_ENV=namespace "views"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
using_namespace "ui"
--太多了懒得改
class("BattleScene"){
    CLASS_DEBUG(false);
    super(cc.Scene);
    super(LUIObject);
    SINGAL.rested();
    SINGAL.attacked();
    SINGAL.moved();
    SINGAL.useItemed();
}

---@param battleKey string | table
function BattleScene:BattleScene(battleKey,controller)
    self=self:__super()
    self:LUIObject()

    local battleInfo
    if type(battleKey)=="string" then
        battleInfo=ResScriptManager:getInstance().battlesQuery:get(battleKey)
        if battleInfo==nil then
            error("error :not find battle battleKey "..battleKey)
        end
    elseif type(battleKey)=="table" then
        battleInfo=battleKey
    end
    self.auto=false
    --获得控制器,战场信息,块大小
    self.controller = controller
    self.battle=battleInfo
    self.blockEdgeLength=mod.BattleFieldExtend.edgeLen
    self.backPath= 
        Path:getInstance().root.battleBg..self.battle.mapkey..".jpg"
    
    --背景,时间标签
    self.backGround = nil
    self.timeLabel =nil
    --x方向的块数量,y方向块数目
    self.xBlockNum=mod.BattleFieldExtend.blockX
    self.yBlockNum=mod.BattleFieldExtend.blockY
    --可点击的选择块
    self.selectNode=array()
    --
    self.spriteArray=array()

    local beginPoint=mod.BattleFieldExtend.battleFieldBeginPoint
    --创建战场矩阵
    
    self.fieldManager = BattleFieldManager(beginPoint,self.xBlockNum,self.yBlockNum,self.blockEdgeLength)

    self.battleSpriteMat=self:createBattleSpriteMat()
    
    self:registerNodeEvent()
    self:setBackGround(self.backPath)

end



--注册节点事件,为了清理战斗中创建的action,sprite等
--lua版本5.1我没有办法实现__gc
function BattleScene:registerNodeEvent()
    local function onNodeEvent(eventType)
        if eventType == "enter" then
        elseif eventType == "exit" then
            print("exit")
            self:destroy()
        end
    end
    self:registerScriptHandler(onNodeEvent)
end 

function BattleScene:destroy()
    for _,sprite in self.spriteArray:iter() do
        sprite.spriteAnimation:clear()
    end
    AnimateManager:getInstance():clearSkillAnimation()
end

function BattleScene:showRoleSelect(dataSource)
    local query=map()
    local roleui=RoleUI(dataSource)
    :setBackGround(self.backPath)
    :addTo(self,100)

    local ours=array()
    local yours=array()
    local count=0
    --自己
    for _,our in pairs(self.battle.our_roles) do
        our.team=1
        if our.key=="" then
            count=count+1
            ours:push_back(our)
        else
            yours:push_back(our)
        end
    end
    --对手
    for _,your in pairs(self.battle.your_roles) do
        your.team=2
        if  your.key and your.key~="" then
            yours:push_back(your)
        end
    end
    --随机
    for _,rad in pairs(self.battle.random_roles) do
        rad.team=2
        if rad.name and rad.name~="" then
            yours:push_back(rad)
        end
    end
    
    local drops=array()
    --掉落    
    for _,drop in pairs(self.battle.drops) do
        drops:push_back(drop)
    end
    
    self.drops=drops
    local limit=ours:size()
    connect(roleui:getMat(),"elemTouched",self,function(role,card)
        local r=query:get(role.key)

        local flag=false
        local TMP_LB=998
        if r then
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

            query:insert(role.key,role)
            roleui:showTips("当前选中"..role.name.." 已选 "..(size+1).." / "..limit)
        end
    
    end)
    
    local music=self.battle.music
    if music~="" then
        local musicItem=ResScriptManager:getInstance().resourcesQuery:get(music)
        if musicItem then
            Audio:getInstance():playMusic(musicItem.value)
        end
    end

    roleui:showTips("")
    roleui:showTitle("请选择角色参与战斗，当前必须参与角色 "..self.battle.must)

    local strArr=array({"进入战斗"})
    local callArr=array()
    callArr:push_back(
        function ()
        if  query:size()==0 then 
            roleui:showTips("还没选人，不能开始战斗")
            return 
        end
        local must=self.battle.must:split("#")
        for _,mustKey in pairs(must) do
            if mustKey~="" and (not query:has(mustKey)) then
                roleui:showTips("当前未选 "..mustKey.." 不能开始战斗")
                return 
            end
        end
        roleui:remove() 
        self:initBattle(query,ours,yours)
        end
    )
    roleui:setMenu(strArr,callArr)
end


function BattleScene:initBattle(query,ours,yours)
    self:initUI()
    self:initSprite(query,ours,yours)
    self:onController() 
    self:updateSpriteMat()
end

function BattleScene:onController()
    self.controller:bind(self)

end

function BattleScene:initUI()

    local visibleSize=cc.Director:getInstance():getVisibleSize()
    
    self.timeLabel =self:createTimeLabel():addTo(self,3)

    local lb=createLabel("自动",40,cc.WHITE):setAnchorPoint(1,1)

    local callBack=function()
        self.auto=not self.auto
        self.controller.spriteArray:for_each(function(_,sprite)
            if sprite.team==1 then
                if self.auto then
                    sprite:setAI(mod.AI.runAI)
                else
                    sprite:setAI(nil)
                end
            end
        end)
        lb:setColor(self.auto and cc.RED or cc.WHITE)
    end
    local menu=cc.Menu:create()
    local menuItem=cc.MenuItemLabel:create( lb)
    menuItem:registerScriptTapHandler(callBack)
    menu:addChild(menuItem)
    menu:setPosition(visibleSize.width-60,visibleSize.height-60)
    menu:setAnchorPoint(1,1)
    menu:addTo(self,10)    

end

function BattleScene:initSprite(query,ours,yours)
    local selectRoleArr=array()
    local identifier=1
    for _,role in query:iter() do
        selectRoleArr:push_back(role)
    end

    for index,role,our in selectRoleArr:zip(ours) do
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

    for index,your in yours:iter() do
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


function BattleScene:createBattleSpriteMat()
    return mat(self.xBlockNum,self.yBlockNum)
end


function BattleScene:updateSpriteMat()
    self.battleSpriteMat:clear()
    local spriteArr=self.controller.spriteArray
    spriteArr:for_each(function(_,sprite)
        local pos=sprite.pos

        self.battleSpriteMat:set(pos.x,pos.y,sprite)
    end)

end

function BattleScene:getSprite(pos,y)
    if y then
        pos=cc.p(pos,y)
    end

    return self.battleSpriteMat:at(pos.x,pos.y)
end

function BattleScene:createTimeLabel()
    local posX,posY=0, display.cy*2
    local lb= createLabel("时间 0/0", 28)
    lb:setAnchorPoint(display.LEFT_TOP)
    lb:setPosition(posX,posY)
    return lb
end

function BattleScene:setTimeString(str)
    self.timeLabel:setString(str)
end

function BattleScene:setCover(node,coverObj,real_pos,pos,color,callBack)
    local  coverNodeArr=array()
    
    local  onBegin=function(touch,event)        
        local battleMap=self.fieldManager.mat
        local showBlockArr=coverObj:getCoverArray(self.controller.currentSprite.pos,pos,self)
        showBlockArr:for_each(function(_,_pos)
            local hex=createOctagon(self.blockEdgeLength*0.9,color)
            coverNodeArr:push_back(hex)
            local real_pos=battleMap:at(_pos.x,_pos.y)
    
            hex:setPosition( real_pos):addTo(self,20)    
        
        end)        
    end
    local move=function() end
    local onEnd=function(touch,event,inRect)
        coverNodeArr:for_each(function(_,coverNode) coverNode:removeFromParent() end)
        coverNodeArr:clear()
        if inRect then
            callBack(real_pos,pos)
        end
    end
    onNodeTouchIn(node,onBegin,move,onEnd,false)

end
function BattleScene:setBlock(showBlockArr,castObj,color,callBack)
    self:clearSelectNode()
    
    local battleMap=self.fieldManager.mat
    local coverColor=cc.c4f(0,0,0,0.6)
    showBlockArr:for_each(function(_,pos)
        local drect=createOctagon(self.blockEdgeLength*0.9,color)
        self.selectNode:push_back(drect)
        local real_pos=battleMap:at(pos.x,pos.y)

        drect:setPosition( real_pos):addTo(self,10)    
        if castObj then
            self:setCover(drect,castObj,real_pos,pos,coverColor,callBack)
        else
            onNodeTouch(drect,function ()
                callBack(real_pos,pos)
            end)
        end

    end)

end

function BattleScene:clearSelectNode()
    if self.selectNode:empty() then return end
    self.selectNode:for_each(function(_,node) node:removeFromParent() end)
    self.selectNode:clear()
end

function BattleScene:inBattleField(point)
    return  ((point.x<=self.xBlockNum and point.x>=1)
    and (point.y<=self.yBlockNum and point.y>=1))
end

function BattleScene:nameInBattleField(key)
    for _,sprite in self.controller.spriteArray:iter() do
        if sprite.role.name==key then
            return true
        end
    end
end

function BattleScene:findIdentifier(bsIdentifier)
    return self.spriteArray:at(tonumber(bsIdentifier))
end

function BattleScene:clearDisplay()
    if  self.display then 
        self.display:removeFromParent()
        self.display=nil
    end
end

function BattleScene:showDetailInfo(infoObject)
    self:clearDetail()
    local contSize=cc.size(display.cx,display.cy)
    self.detail=
    createBlock(contSize)
    :setPosition(100,100)
    :setAnchorPoint(0,0)
    :addTo(self,998)

    local scroll=
    ScrollView()
    :setContentSize(contSize)
    :setPosition(0,0)
    :addTo(self.detail)

    local back=
    createLabel("返回",20,cc.RED)
    :setAnchorPoint(1,1)
    :setPosition(contSize.width,contSize.height)
    :addTo(self.detail)

    onNodeTouch(back,function ()
        self:clearDetail()
    end)

    local textNode=createLabel(infoObject:toString(),18)
    textNode:setWidth(contSize.width)
    scroll:setInnerNode(textNode)
end

function BattleScene:clearDetail()
 
    if  self.detail then
        self.detail:removeFromParent()
        self.detail=nil
    end
end


function BattleScene:showSkill(battleSprite)
    self:clearDisplay()
    self.display=
    cc.Node:create()
    :addTo(self,100)

    local skills = battleSprite:getSkills()

    local currentSkill=nil
    local edgelen=self.blockEdgeLength*0.5
    local createArr=array()
    local offsetX=edgelen*1.5
    local offsetY=edgelen/2*math.pow(3,0.5)

    skills:for_each(function (index,skill)
        createArr:push_back(function ()
            local skillPic=cc.Sprite:create(skill.picPath)
            local cpic=getHexClip(skillPic,edgelen)
            cpic:setPosition(cc.p(edgelen, 
            index%2==1 and 0 or offsetY))

            local namelb=
            createLabel(skill.name,14,cc.RED)
            :setAnchorPoint(0.5,0.5)
            :setWidth(offsetX*1.5)
            :setPosition(0,index%2==1 and offsetY*2 or 0)
            :addTo(cpic,100)

            cpic.skill=skill
            return cpic
        end)
    end)

    local tvb=
    TableView(cc.size(display.cx*1.2,edgelen*3),cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
    :setPosition(150,0)
    :setCreateArray(createArr)
    :setCellSize(cc.size(edgelen*2,edgelen*3))
    :addTo(self.display,100)
    tvb:reloadData()

    local CHILD_NODE=998
    connect(tvb,"cellTouched",tvb,function(view,cell)
        local cur=cell:getChildByTag(10)
        if cur then
            
            local skill=cur.skill
            local skillPic=cc.Sprite:create(skill.picPath)
            local cpic=getHexClip(skillPic,edgelen*1.2)
            local current=self.current
            local childNode=current:getChildByTag(CHILD_NODE)
            if  childNode then
             
                childNode:removeFromParent()
                childNode=nil
            end
            currentSkill=skill
            local contSize=current:getContentSize()
            --涉及到clip节点描点和位置都非常诡异，以后修改
            cpic:setAnchorPoint(0.5,0.5)
            cpic:setPosition(contSize.width*0.9,contSize.height*0.5)
            cpic:setTag(CHILD_NODE)
            current:addChild(cpic,CHILD_NODE)

            onNodeTouch(cpic,function ()
                self:showDetailInfo(skill)
            end)
            local status=battleSprite:checkSkillStatus(skill)
            if status==ENUM.SKILL_STATUS.AVALIBLE then
                self:showAttackBlock(skill,battleSprite)
            else
                self:clearSelectNode()
                local str=""
                if status==ENUM.SKILL_STATUS.BALL_NOT_ENOUGH then 
                    str="怒气不足" 
                elseif status==ENUM.SKILL_STATUS.MP_NOT_ENOUGH then
                    str="内力不足"
                elseif status==ENUM.SKILL_STATUS.NOT_AVALIBLE then
                    str="CD不可用"
                elseif status==ENUM.SKILL_STATUS.BAN then
                    str="封印"
                end

                cpic:addChild(createLabel(str,20,cc.RED))
            end
        end
    
    
    
    end)
   
    self.current=
    createHexagon(edgelen*1.5)
    :setAnchorPoint(0,0)
    :setPosition(0,0)
    :addTo(self.display)

end

function BattleScene:toNext()
    
    self:clearSelectNode()

    self:clearDisplay()
  
    self:clearMenu()

    self:clearDetail()

    self:updateSpriteMat()
    
    self.controller:next()

end


function BattleScene:showItem(battleSprite)
    self:clearDisplay()

    self.display=
    cc.Node:create()
    :addTo(self)
    
    local items= RuntimeData:getInstance():getItemsByType(set({0}))

    local currentItem=nil
    local edgelen=self.blockEdgeLength*0.5
    local createArr=array()
    local offsetX=edgelen*1.5
    local offsetY=edgelen/2*math.pow(3,0.5)

    items:for_each(function (index,item)
        createArr:push_back(function ()
            local itemPic=cc.Sprite:create(item.picPath)
            local cpic=getHexClip(itemPic,edgelen)
            cpic:setPosition(cc.p(edgelen, index%2==1 and 0 or offsetY))

            local namelb=
            createLabel(item.name,14,cc.BLUE)
            :setAnchorPoint(0.5,0.5)
            :setWidth(offsetX*1.5)
            :setPosition(0,index%2==1 and offsetY*2 or 0)
            :addTo(cpic,100)

            cpic.item=item
            return cpic
        end)
    end)
    local selectItems=
    TableView(cc.size(display.cx*1.2,edgelen*3),cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
    
    selectItems
    :setCreateArray(createArr)
    :setCellSize(cc.size(edgelen*2,edgelen*3))
    :setPosition(150,0)
    :addTo(self.display)
    :reloadData()

    connect(selectItems,"cellTouched",selectItems,function (view,cell)
        local cur=cell:getChildByTag(10)
        if cur then
            local item=cur.item
            local itemPic=cc.Sprite:create(item.picPath)
            local cpic=getHexClip(itemPic,edgelen*1.2)
            local current=self.current
            if current.childNode then
                current.childNode:removeFromParent()
                current.childNode=nil
            end

            local contSize=current:getContentSize()
            cpic:setAnchorPoint(0.5,0.5)
            cpic:setPosition(contSize.width*0.9,contSize.height*0.5)
            current:addChild(cpic,100)
            current.childNode=cpic

            onNodeTouch(current.childNode,function ()
                self:showDetailInfo(item)
            end)
            if battleSprite.cd==0 then 
                self:showItemBlock(item,battleSprite)
            else
                self:clearSelectNode()
                cpic:addChild(createLabel("Cd不可用",20,cc.BLUE)) 
            end
        end
    end)
    self.current=
    createHexagon(edgelen*1.5)
    :setAnchorPoint(0,0)
    :setPosition(0,0)
    :addTo(self.display)

end

function BattleScene:showItemBlock(item,battleSprite)

    local color=cc.c4f(0,0,1,0.6)

    local showBlockArray=array()
    local itemBlock=item:getCastArray(battleSprite)
    for _,point in itemBlock:iter() do
        if  self:inBattleField(point) then
            showBlockArray:push_back(point)
        end
        
    end

    self:setBlock(
    showBlockArray,item,color,
    function (real_pos,pos) 
        local spriteArr=array()
        
        for _,point in item:getCoverArray(self.controller.currentSprite.pos,pos,self):iter() do
            local sprite=self:getSprite(point)
            if  sprite then
                spriteArr:push_back(sprite)
            end
        end
        self:useItemed(item,battleSprite,spriteArr)
        
    end)
end

function BattleScene:showProperty()
    local roleArray=array()
    for _,battleSprite in self.controller.spriteArray:iter() do
        roleArray:push_back(battleSprite.role)
    end
    local disableLayer=cc.Layer:create():addTo(self,10000)
    onNodeTouch(disableLayer,function() end,true)

    local roleui=RoleUI(roleArray):addTo(disableLayer,1000)
    roleui:setNotAlter(false)
    connect(roleui,"roleBlockTouched",roleui,"showRoleDetail");

    local textArray=array({"返回"})
    local callArray=array({function()
        disableLayer:removeFromParent()    
    end})
    roleui:setMenu(textArray,callArray)
end

---@param battleSprite BattleSprite
function BattleScene:doRest(battleSprite)
    self:rested(battleSprite)
    
    self:toNext()

end
---@param battleSprite BattleSprite
function BattleScene:showMove(battleSprite)
    --local color=cc.c4f(0.337,0.533,0.216,0.75)
    local color=cc.c4f(0.5,0.5,0,0.4)
    local showBlockArray=array()
    local moveBlock=battleSprite:getMoveArray()
    for _,point in moveBlock:iter() do
        if self:inBattleField(point) then
            showBlockArray:push_back(point)
        end
        
    end

    self:setBlock(
    showBlockArray,nil,color,
    function (real_pos,pos) 
        self:moved(battleSprite,pos)
        self._disableMove=true
        self:clearSelectNode()
    end)    

end

function BattleScene:showAttackBlock(skill,battleSprite)
    local color=cc.c4f(0.7,0.2,0.2,0.6)

    local showBlockArray=array()
    local skillBlock=skill:getCastArray(battleSprite)
    for _,point in skillBlock:iter() do
        if self:inBattleField(point) then
            showBlockArray:push_back(point)
        end
        
    end

    self:setBlock(
    showBlockArray,skill,color,
    function (real_pos,pos) 
        local spriteArr=array()
        for _,point in skill:getCoverArray(self.controller.currentSprite.pos,pos,self):iter() do
            local sprite=self:getSprite(point)
            if sprite then
                spriteArr:push_back(sprite)
            end
        end
        self:attacked(skill,battleSprite,spriteArr)
    end)

end

function BattleScene:showMenu(sprite)
    self:clearMenu()
    self._disableMove=false
    local edgelen=40
    local color=cc.c4f(0,0,0,0.6)
    local offsetX=1.5*edgelen
    local offsetY=edgelen/2*math.pow(3,0.5)
    local mainSize=cc.size(offsetY*2,offsetY*2)

    local menu=
    cc.Sprite:create(sprite.role.picPath)
    :setAnchorPoint(0.5,0.5)
    :setPosition(display.cx*1.75,display.cy*0.3)
    :setContentSize(mainSize)
    :addTo(self)
    self.menu=menu
    local skillMenu=
    createHexagon(edgelen,color)
    :setPosition(mainSize.width/2+offsetX,mainSize.height/2+offsetY)
    :addChild(createLabel("技能",20):setPosition(edgelen,offsetY))
    :addTo(menu)

    local restMenu=
    createHexagon(edgelen,color)
    :setPosition(mainSize.width/2+offsetX,mainSize.height/2-offsetY)
    :addChild(createLabel("休息",20):setPosition(edgelen,offsetY))
    :addTo(menu)

    local itemMenu=
    createHexagon(edgelen,color)
    :setPosition(mainSize.width/2+0,mainSize.height/2+2*offsetY)
    :addChild(createLabel("物品",20):setPosition(edgelen,offsetY))
    :addTo(menu)

    local moveMenu=
    createHexagon(edgelen,color)
    :setPosition(mainSize.width/2-offsetX,mainSize.height/2-offsetY)
    :addChild(createLabel("移动",20):setPosition(edgelen,offsetY))
    :addTo(menu)

    local infoMenu=
    createHexagon(edgelen,color)
    :setPosition(mainSize.width/2,mainSize.height/2-2*offsetY)
    :addChild(createLabel("信息",20):setPosition(edgelen,offsetY))
    :addTo(menu)

    onNodeTouch(
    moveMenu,function ()
        if  self._disableMove==false then
            self:showMove(sprite)
        end
    end)
    onNodeTouch(
    skillMenu,function ()
        self:showSkill(sprite)
    end)
    onNodeTouch(
    itemMenu,function ()
        self:showItem(sprite)
    end)
    onNodeTouch(
    restMenu,function ()
        self:doRest(sprite)
    end)
    onNodeTouch(
    infoMenu,function ()
        self:showProperty()
        end)
    --每次都显示skill    
    self:showSkill(sprite)
end

function BattleScene:clearMenu()
    if  self.menu then
        self.menu:removeFromParent()
        self.menu=nil
    end
end



function BattleScene:showEnd(battleResultStatus)
    local exp=0
    local sourceLevelSum=0
    local sourceCount=0
    local targetLevelSum=0
    local targetCount=0
    for _,sprite in self.spriteArray:iter() do
        if sprite.team==2 then
            exp=exp+sprite.role.level
            targetCount=targetCount+1
            targetLevelSum=targetLevelSum+sprite.role.level
        else
            sourceCount=sourceCount+1
            sourceLevelSum=sourceLevelSum+sprite.role.level
            sprite.statistics:calculate()
        end
     
    end
    local levelDiff=(sourceLevelSum/sourceCount)-(targetLevelSum/targetCount)
    local power=5
    if levelDiff<0 then
        power= power* ((-levelDiff)/10+1)
    else
        power=power* 
        ((1-levelDiff/5)>0 
        and (1-levelDiff/5)
        or 0)
    end
    exp=exp*power
    local str
    if  RuntimeData:getInstance().battleResultStatus==ENUM.BATTLE_RESULT_STATUS.WAIT then
        RuntimeData:getInstance().battleResultStatus=battleResultStatus
    end
    local dropStr="获得物品:\n"
    if battleResultStatus==ENUM.BATTLE_RESULT_STATUS.WIN then
        str="胜利: \n"
        for _,drop in self.drops:iter() do
            if probability(drop.prob/100) then
                local mc=tonumber(drop.key:match("lv(%d)"))
                if mc then
                    local items=ResScriptManager:getInstance().itemsDropQuery:get(mc)
                    local size=items:size()
                    local itemName=items:at( randInt(1,size) ).name
                    local num=randInt(drop.from,drop.to)
                    RuntimeData:getInstance():addItemByName(itemName,num)
                    dropStr=dropStr..
                    itemName.." "..num.."个\n"
                else
                    local num=randInt(drop.from,drop.to)
                    RuntimeData:getInstance():addItemByName(drop.key,num)
                    dropStr=dropStr..
                    drop.key.." "..num.."个\n"
                end
            end
        end

    else
        str="失败：\n"
        exp=0
    end
    str=str..dropStr
    for _,sprite in self.spriteArray:iter() do
        if  sprite.statistics then
            sprite.statistics.exp=exp
            str=str..sprite.statistics:toString()
            sprite.statistics:onResult()
        end
        if  sprite.team~=1 then
            RuntimeData:getInstance():sendEvent(ENUM.RUNTIME_EVENT.KILL_ROLE,sprite.role.key)
        end
    end
    
    self:clearDetail()
    local contSize=cc.size(display.cx*1.5,display.cy*1.5)
    self.detail=
    createBlock(contSize)
    :setPosition(display.cx/4,display.cy/4)
    :setAnchorPoint(0,0)
    :addTo(self,1000,1000)

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
return BattleScene
