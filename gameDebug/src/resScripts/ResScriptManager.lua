
_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"

---@class ResScriptManager
local ResScriptManager=class("ResScriptManager"){
    NO_AUTO_INHERIT();
    CLASS_DEBUG(false);

}
function ResScriptManager:getInstance()
    if  self.s_instance ==nil then
        self.s_instance=ResScriptManager()
    end
    return self.s_instance
end


function ResScriptManager:ResScriptManager()
    self.path="resScripts.time1."
    self.battlesQuery=self:buildDataQueryFromKey("battle","key")
    self.rolesQuery=self:buildDataQueryFromKey("role","key")
    self.skillsQuery=self:buildDataQueryFromKey("skill","name")
    self.allSkillsQuery=self:buildDataQueryFromKey("skill","name")
    self:addDataQueryFromKeyTo("internal_skill",self.allSkillsQuery,"name")
    self:addDataQueryFromKeyTo("special_skill",self.allSkillsQuery,"name")
    self.animationsQuery=self:buildDataQueryFromKey("animation","name")
    self.skillAnimationsQuery=self:buildDataQueryFromKey("skillAnimation","name")
    self.resourcesQuery=self:buildDataQueryFromKey("resource","key")
    self.mapsQuery=self:buildDataQueryFromKey("map","name")
    self.mapEventsQuery=self:buildDataQueryFromKey2("mapEvent","belongMap")
    self.storysQuery=self:buildDataQueryFromKey("story","name")
    self.itemsQuery=self:buildDataQueryFromKey("item","name")
    self.itemsDropQuery=self:buildDataQueryFromKey2("item","level",function (node)
        return node.drop==true
    end)
    self.questionsQuery=self:buildDataQueryFromKey2("question","key")
    self.netBattleRoles=self:buildDataQueryFromKey("role","key",function(node)
        return node.level==30
    end)
    self.internalSkillsQuery=self:buildDataQueryFromKey("internal_skill","name")
    self.specialSkillsQuery=self:buildDataQueryFromKey("special_skill","name")
    self.uniqueSkillsQuery=self:buildDataQueryFromKey2("unique_skill","belongSkill")
    self.aoyisQuery=self:buildDataQueryFromKey2("aoyi","start")
    self.shopsQuery=self:buildDataQueryFromKey("shopName","name")
    self.shopItemsQuery=self:buildDataQueryFromKey2("shopItem","belongShop")
    self.growTemplatesQuery=self:buildDataQueryFromKey("grow_template","name")
  --  self.itemConfig=self:buildDataQueryFromKey("itemConfig","key")
    self.shopNamesQuery=self:buildDataQueryFromKey("shopName","name")
    self.missionsQuery=self:buildDataQueryFromKey2("mission","belongMissionPlace")
    self.headSelectQuery=self:buildDataQueryFromKey2("headSelect","selectKey")
    self.updateLog=self:buildDataQueryFromKey("updateLog","version")
end



function ResScriptManager:buildDataQueryFromKey(dataName,key,condition)
    local query=map()
    local dataTable=require(self.path .. dataName)
    if condition then
        for i=1,#dataTable do
            if condition(dataTable[i]) then 
                query:insert(dataTable[i][key],dataTable[i])
            end
        end
    else
        for i=1,#dataTable do 
            query:insert(dataTable[i][key],dataTable[i])
        end
    end
    return query
end

function ResScriptManager:addDataQueryFromKeyTo(dataName,source,key)
    local query=source
    local dataTable=require(self.path .. dataName)
    for i=1,#dataTable do 
        query:insert(dataTable[i][key],dataTable[i])
    end
end


function ResScriptManager:buildDataQueryFromKey2(dataName,key,condition)
    local query=map()
    local dataTable=require(self.path .. dataName)
    condition=condition or function ()
        return true
    end
    for i=1,#dataTable do 
        if condition(dataTable[i]) then
            local oneKey=dataTable[i][key]
            local arr=query:get(oneKey)
            if arr then
                arr:push_back(dataTable[i])
            else
                query:insert(oneKey,
                    array({dataTable[i]})
                )
            end
        end
    end
    return query
end

