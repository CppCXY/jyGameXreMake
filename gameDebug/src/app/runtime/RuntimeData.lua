
include "app.gameClass.init"
include "app.runtime.GlobalEvent"

_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
---@class RuntimeData
---@field getInstance fun():RuntimeData
class("RuntimeData"){
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

function RuntimeData:RuntimeData()
    self.items=map()
    self.team=map()
    self.menpai=""
    self.round=1
    self.daode=0
    self.battleResultStatus=ENUM.BATTLE_RESULT_STATUS.UNKOWN
    self.haogan=map()
    self.time=Time:create(1,1)
    self.currentMap=""
    self.globalCount=GlobalCount:getInstance()
    self.globalEvent=GlobalEvent:getInstance()
    self.suggest=array()
    self.shopItemLimit=map()
    self.MissionLimit=map()
    self.missions=map()
    self.missionsComplete=set()
    self.onceStory=set()
    self.limitTimesStory=map()
    self.storys=set()
    self.timeKey=set()
    self.tag=set()
    self.variable=map()
    self.questionScores=map()
    self.wareHouse=map()
    self.gameVersion=mod.Limit.gameName.."#"..mod.Limit.gameVersion
    self.chapter="序章"
end

function RuntimeData:sendEvent(eventEnum,data)
    for _,mission in self.missions:iter() do
        if  mission:interest(eventEnum,data) then
            mission:record(eventEnum,data)
        end
    end
end

function RuntimeData:addRole(role)
    self.team:insert(role.key,role)
end
function RuntimeData:leaveRole(roleKey)
    self.team:del(roleKey)
end
function RuntimeData:getRole(roleKey)
    return self.team:get(roleKey)
end
function RuntimeData:addItem(item)
    if item then
        local hasItem = self.items:get(item.identifier)
        if hasItem then
            hasItem:addNumber(item.number)
        else
            self.items:insert(item.identifier,item)
        end
    end
end
function RuntimeData:getItemNum(itemName)
    for _,item in self.items:iter() do
        if itemName==item.name then
            return item.number
        end
    end
    return 0
end
function RuntimeData:pushWareHouse(item)
    if item then
        local hasItem = self.wareHouse:get(item.identifier)
        if hasItem then
            hasItem:addNumber(item.number)
        else
            self.wareHouse:insert(item.identifier,item)
        end
        self.items:del(item.identifier)
    end
end

function RuntimeData:popWareHouse(item)
    self.wareHouse:del(item.identifier)
    self.items:insert(item.identifier,item)
end


function RuntimeData:addItemByName(name,number)
    number=tonumber(number)
    local query=ResScriptManager:getInstance().itemsQuery:get(name)
    assert(query~=nil,"error : 没有这件装备 ",name)
    local item
    if query.type==1 
    or query.type==2 
    or query.type==3 
    or query.type==4 then
        item=Equipment:create(name,number)
    else
        item=Item:create(name,number)
    end
    self:addItem(item)
end
function RuntimeData:removeItem(identifier,number)
    number=number or 1
    local hasItem= self.items:get(identifier)
    if hasItem then
        if hasItem.number<=number then
            self.items:del(identifier)
        else
            self.items:get(identifier):addNumber(-number)
        end
    end
end
function RuntimeData:removeItemByName(name,number)
    number=number or 1
    for _,item in self.items:iter() do
        if item.name==name then
            if item.number<=number then
                self.items:del(item.identifier)
            else
                item:addNumber(-number)
            end
            return 
        end
    end
end
function RuntimeData:inTime(timeStr)
    local timeArray=array( timeStr:split('#'))
    for _,timeStr in timeArray:iter() do
        if self.time:inTime(timeStr) then
            return true
        end
    end
end
function RuntimeData:addTime(time)
    self.time:addTime(time)
end
--money弃用,但是保留函数
function RuntimeData:hasMoney(value)
    return true
end
--弃用
function RuntimeData:costMoney(value)

end
function RuntimeData:addMoney(value)

end

function RuntimeData:exceedDay(value)
    return self.time.day>tonumber(value)
end
function RuntimeData:costDay(time)
    self.time:addTime(time)
end
function RuntimeData:inMenpai(value)
    return self.menpai==value
end
function RuntimeData:getItemsByType(types)
    local result=array()
    for _,item in self.items:iter() do
        if types:has(item.type) then
            result:push_back(item)
        end
    end
    return result
end
function RuntimeData:getItemByName(itemName)
    for _,item in self.items:iter() do
        if item.name==itemName then
            return item
        end
    end
end
function RuntimeData:hasMenpai()
    return self.menpai~=""
end
--此函数针对非装备对象
function RuntimeData:hasItem(identifier)  
    return self.items:has(identifier)
end 
function RuntimeData:inRound(round)
    return self.round==tonumber(round)
end
function RuntimeData:addDaoDe(daode)
    self.daode=self.daode+tonumber(daode)
end
function RuntimeData:daodeMoreThan(daode)
    return self.daode>=tonumber(daode)    
end
function RuntimeData:daodeLessThan(daode)
    return self.daode<=tonumber(daode) 
end
function RuntimeData:findRole(value)
    local roleKey,v1,v2,v3=unpack(value:split('#'))
    local role=self.team:get(roleKey)
    return role,v1,v2,v3
end
function RuntimeData:getRoleSkill(value)
    local roleKey,skillName,skillLevel=unpack(value:split('#'))
    local role=self.team:get(roleKey)
    return role,role.skills:get(skillName)
end
function RuntimeData:upgradeMaxHp(value)
    local role,v =self:findRole(value)
    role.maxhp=role.maxhp+tonumber(v)
end
function RuntimeData:upgradeMaxMp(value)
    local role,v =self:findRole(value)
    role.maxmp=role.maxmp+tonumber(v)    
end
function RuntimeData:upgradeGengu(value)
    local role,v =self:findRole(value)
    role.gengu=role.gengu+tonumber(v) 
end
function RuntimeData:upgradeShenfa(value)
    local role,v =self:findRole(value)
    role.shenfa=role.shenfa+tonumber(v) 
end
function RuntimeData:upgradeWuxing(value)
    local role,v =self:findRole(value)
    role.wuxing=role.wuxing+tonumber(v) 
end
function RuntimeData:upgradeWuxing(value)
    local role,v =self:findRole(value)
    role.wuxue=role.wuxue+tonumber(v)     
end
function RuntimeData:upgradeBili(value)
    local role,v =self:findRole(value)
    role.bili=role.bili+tonumber(v) 
end
function RuntimeData:upgradeFuyuan(value)
    local role,v =self:findRole(value)
    role.fuyuan=role.fuyuan+tonumber(v) 
end
function RuntimeData:upgradeDingli(value)
    local role,v =self:findRole(value)
    role.dingli=role.dingli+tonumber(v) 
end
function RuntimeData:upgradeQuanzhang(value)
    local role,v =self:findRole(value)
    role.quanzhang=role.quanzhang+tonumber(v) 
end
function RuntimeData:upgradeJianfa(value)
    local role,v =self:findRole(value)
    role.jianfa=role.jianfa+tonumber(v) 
end
function RuntimeData:upgradeDaofa(value)
    local role,v =self:findRole(value)
    role.daofa=role.daofa+tonumber(v) 
end
function RuntimeData:upgradeQimen(value)
    local role,v =self:findRole(value)
    role.qimen=role.qimen+tonumber(v) 
end
function RuntimeData:upgradeSkill(value)
    local role,skillName,level =self:findRole(value)
    level=tonumber(level)
    local skill=role.skills:get(skillName)
    if skill then
        skill:updateLevel(level)
    end
end
function RuntimeData:upgradeInternalSkill(value)
    local role,skillName,level =self:findRole(value)
    level=tonumber(level)
    local skill=role.internalSkills:get(skillName)
    if skill then
        skill:updateLevel(level)
    end
end
function RuntimeData:learnSkill(value)
    local role,skillName,level,maxlevel =self:findRole(value)
    level=tonumber(level)
    maxlevel=tonumber(maxlevel)
    maxlevel=maxlevel or level
    local skill=role.skills:get(skillName)
    if skill then
        level=level-skill.level
        if level >0 then
            skill:updateLevel(level)
        end
    else
        role:addSkill(Skill:create(skillName,level,maxlevel))
    end
end
function RuntimeData:learnInternalSkill(value)
    local role,skillName,level =self:findRole(value)
    level=tonumber(level)
    local skill=role.internalSkills:get(skillName)
    if skill then
        level=level-skill.level
        if level >0 then
            skill:updateLevel(level)
        end
    else
        role:addSkill(InternalSkill:create(skillName,level,level))
    end
end
function RuntimeData:learnSpecialSkill(value)
    local role,skillName =self:findRole(value)
    local hasSkill=role:hasSpecialSkillName(skillName)
    if not hasSkill then
        role:addSpecialSkill(SpecialSkill:create(skillName))
    end
end
function RuntimeData:learnTalent(value)
    local role,talent=self:findRole(value)
    if not role:hasTalent(talent) then
        role:addTalent(talent)
    end
    
end
function RuntimeData:removeTalent(value)
    local role,talent=self:findRole(value)
    role:removeTalent(talent)
end
--弃用
function RuntimeData:maxLevel(value)
end

function RuntimeData:addHaoGan(value)
    local roleKey,haoganValue=unpack(value:split("#"))
    local hg=self.haogan

    if haoganValue==nil then 
        haoganValue=tonumber(roleKey)
        roleKey="女主"       
    end
    haoganValue=tonumber(haoganValue)
    local sourcehg=hg:get(roleKey,50)
    hg:onFun(roleKey,function ()
        return sourcehg+haoganValue
    end)
end
function RuntimeData:addSuggest(value)
    self.suggest:push_back(value)
end
function RuntimeData:haoganMoreThan(value)
    local roleKey,haoganValue=unpack(value:split("#"))
    local hg=self.haogan
    if haoganValue==nil then 
        haoganValue=tonumber(roleKey)
        roleKey="女主"       
    end
    haoganValue=tonumber(haoganValue)
    local sourcehg=hg:get(roleKey,50)
    return sourcehg>=haoganValue
end
function RuntimeData:haoganLessThan(value)
    local roleKey,haoganValue=unpack(value:split("#"))
    local hg=self.haogan
    if haoganValue==nil then 
        haoganValue=tonumber(roleKey)
        roleKey="女主"       
    end
    haoganValue=tonumber(haoganValue)
    local sourcehg=hg:get(roleKey,50)
    return sourcehg<=haoganValue

end
function RuntimeData:skillMoreThan(value)
    local skill,skillLevel=self:getRoleskill(value)
    return skill and skill.level>=skillLevel
end
function RuntimeData:skillLessThan(value)
    local skill,skillLevel=self:getRoleskill(value)
    return skill and skill.level<=skillLevel or true
end

function RuntimeData:levelGreaterThan(value)
    local role,level=self:findRole(value)
    return role and role.level>=tonumber(level)    
end
function RuntimeData:dingliGreaterThan(value)
    local role,dingli=self:findRole(value)
    return role and role.dingli>=tonumber(dingli)
end
function RuntimeData:wuxingGreaterThan(value)
    local role,wuxing=self:findRole(value)
    return role and role.wuxing>=tonumber(wuxing)
    
end
function RuntimeData:dingliLessThan(value)
    local role,dingli=self:findRole(value)
    return role and role.dingli<=tonumber(dingli)
end
function RuntimeData:wuxingLessThan(value)
    local role,wuxing=self:findRole(value)
    return role and role.wuxing<=tonumber(wuxing)
    
end
function RuntimeData:friendCount(value)
    return self.team:size()>=tonumber(value)
end
function RuntimeData:removeGlobalEvent(key)
    self.globalEvent:del(key)
end

function RuntimeData:save(index)
    local savePath=Path:getInstance().root.save

    local f=io.open(savePath.."save"..index..".lua","wb")
    local str=string.dump(load("return "..self.s_instance:serilize()),true)
    --f:write("return ")
    f:write(str)
    f:close()

    local fManager=io.open(savePath.."Manager.lua","r")
    local mStr=fManager:read("*all")
    fManager:close()
    local g=load(mStr)
    local manager=g()
    local key="存档"..index
    manager[key]={
        id=index,
        info="当前周目:"..self.round.."\n"..
        "当前道德:"..self.daode.."\n"..
        "当前时间:"..self.time:toString().."\n"..
        "当前地图:"..self.currentMap.."\n"..
        "当前主角:"..self.team:get("主角").name.."\n"..
        "当前章节:"..self.chapter.."\n",
    }
    mStr=serilize(manager)
    fManager=io.open(savePath.."Manager.lua","w")
    fManager:write("return ")
    fManager:write(mStr)
    fManager:close()
end
function RuntimeData:readSave(index)
    local savePath=Path:getInstance().root.save
    local socket=require "socket"
    local f=io.open(savePath.."save"..index..".lua","rb")
    local str=f:read("*all")
    f:close()
    return unSerilize(str,false)
end
function RuntimeData:loadSaveInstance(instance)
    RuntimeData.s_instance=instance
    GlobalEvent.s_instance=instance.globalEvent
    GlobalCount.s_instance=instance.globalCount

    cc.Director:getInstance()
    :replaceScene(require("app.views.MapScene"):create(
        instance.currentMap))
end

function RuntimeData:reset()
    RuntimeData:getInstance():RuntimeData()
end


function RuntimeData:nextRound()
    local oldInstance=RuntimeData.s_instance
    local newInstance=RuntimeData()

    newInstance.round=oldInstance.round+1
    newInstance.wareHouse=oldInstance.wareHouse

    RuntimeData.s_instance=newInstance
    local newScene=views.MainScene()
    newScene:onGameBegin()
    cc.Director:getInstance():replaceScene(newScene)

end