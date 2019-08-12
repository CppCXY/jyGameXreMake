_ENV=namespace "mod.NeedExtend"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"


--这里不适合普通人做扩展
NeedQuery={}

--name------------------------------------------------------------------
NeedNameQuery={
    ["quanzhang"]="拳掌",
    ["jianfa"]="剑法",
    ["qimen"]="奇门",
    ["daofa"]="刀法",
    ["bili"]="臂力",
    ["fuyuan"]="福缘",
    ["wuxing"]="悟性",
    ["dingli"]="定力",
    ["shenfa"]="身法",
    ["gengu"]="根骨",
    ["level"]="等级",
    ["talent"]="天赋",
    ["hp"]="血量",
    ["mp"]="内力",
    ["criticalp"]="暴击率",
    ["critical"]="暴击伤害",
    ["mingzhong"]="命中",
    ["anti_debuff"]="抗不利",
    ["female"]="性别",
    --以下是高级扩展
    ["item"]="物品",
    ["haogan"]="好感",
    ["kill"]="杀死",
    ["complete"]="任务",
    ["meet"]="遇见"
    
}
--名称转化表
NeedArgvsQuery={
    ["less"]="低于",
    ["greater"]="高于",
    ["equal"]="等于",
    ["not_less"]="不低于",
    ["not_greater"]="不高于",
    ["has"]="必须有",
    ["not_has"]="必须没有",
}

---addition 参数参考role 的addition
---@param name string
---@param luaFunction fun(role:Role,need:Need):any
local function registerNeedExtend(name,luaFunction)
    NeedQuery[name]=luaFunction
end

local register=registerNeedExtend

------------------------------------------------------------------------

getValue=function (role,need)
    
    local name,argvs=need.name,need.argvs

    if name=="item" then
        local key,itemName,value=argvs:at(1),argvs:at(2),argvs:at(3)
        if value==nil then
            value=itemName
            itemName=key
        end
        local item=RuntimeData:getInstance():getItemByName(itemName)
        return 
        item and item.number or 0
        ,tonumber(value)
    elseif name=="haogan" then
        local key,roleKey,haoganValue=argvs:at(1),argvs:at(2),argvs:at(3)
        local hg=RuntimeData:getInstance().haogan
        if haoganValue==nil then 
            haoganValue=roleKey
            roleKey=key     
        end
        haoganValue=tonumber(haoganValue)
        local sourcehg=hg:get(roleKey,0)
        return sourcehg,haoganValue
    elseif name=="kill" then
        local mission=need.mission
        local haskill=mission.events:get(ENUM.RUNTIME_EVENT.KILL_ROLE):get(argvs:at(1))
        return haskill,tonumber(argvs:at(2))
    elseif name=="complete" then

        return RuntimeData:getInstance().missionsComplete,
        argvs:at(1)..argvs:at(2)
    elseif name=="meet" then
        local mission=need.mission
        local meet=mission.events:get(ENUM.RUNTIME_EVENT.MEET_ROLE)
        return meet,argvs:at(1)
    elseif role then
        local source=role[name]
        local addition=role.addition[name]
        local key,value=argvs:at(1),argvs:at(2)
        if value==nil then 
            value=key
        end

        if is(source,set) and is(source,map)then
            return source,value
        else
            return source+addition,tonumber(value)
        end
    end
end

getKey=function (need)
    local name,argvs=need.name,need.argvs
    if NeedNameQuery[argvs:at(1)] then
        return argvs:at(1)
    end
    if name=="talent" then
        return "has"
    elseif name=="kill" then
        return "not_less"
    elseif name=="complete" then
        return "has"
    elseif name=="meet" then
        return "has"
    else
        return "not_less"
    end

end
getString=function (need)
    local name,key,argvs=need.name,need.key,need.argvs
    if name=="item" 
    or name=="haogan" then
        local _key,_name,value =argvs:at(1),argvs:at(2),argvs:at(3)
        if value==nil then 
            value=_name
            _name=_key
        end
        return NeedNameQuery[name].." ".._name
        ..NeedArgvsQuery[key].." ".. value
    elseif name=="kill" then
        return NeedNameQuery[name].." "..
        argvs:at(1).." ".. argvs:at(2).."次"
    elseif name=="complete" then
        return NeedNameQuery[name].." ".. argvs:at(2)
    else
    local _key,value =argvs:at(1),argvs:at(2)
    if value==nil then 
        value=_key
    end
    return NeedNameQuery[name].." "
    ..NeedArgvsQuery[key].." ".. value
    end
end

getCheckString=function(need)
    local name,key,argvs=need.name,need.key,need.argvs
    if name=="item" 
    or name=="haogan" then
        local _key,_name,value =argvs:at(1),argvs:at(2),argvs:at(3)
        if value==nil then 
            value=_name
            _name=_key
        end
        local attr,val=getValue(nil,need)
        return NeedNameQuery[name].." "..argvs:at(1).." "..attr.."/"..val.."  "..
        (NeedQuery[key](nil,need) and "已经达成" or "未达成")
    elseif name=="kill" then
        local attr,val=getValue(nil,need)
        local mission=need.mission
        local place,npc=mission.place,mission.npc
        return NeedNameQuery[name].." "..
        argvs:at(1).." ".. attr.."/"..val.." ".." "..
        (NeedQuery[key](nil,need) and "已经达成" or "未达成")
    elseif name=="complete" then
        return NeedNameQuery[name].." ".. argvs:at(2).." "..
        (NeedQuery[key](nil,need) and "已经达成" or "未达成")
    elseif name=="meet" then
        return NeedNameQuery[name].." ".. argvs:at(1).." "..
        (NeedQuery[key](nil,need) and "已经达成" or "未达成")
    else
    local _key,value =argvs:at(1),argvs:at(2)
    if value==nil then 
        value=_key
    end
    return NeedNameQuery[name].." "
    ..NeedArgvsQuery[key].." ".. value
    end
end








--Register------------------------------------------------------------------
register("less",function(role,need)
    local attr,value=getValue(role,need)
    return attr<value
end)
register("greater",function(role,need)
    local attr,value=getValue(role,need)
    return attr>value
end)
register("not_less",function(role,need)
    local attr,value=getValue(role,need)
    return attr>=value
end)
register("not_greater",function(role,need)
    local attr,value=getValue(role,need)
    return attr<value
end)
register("equal",function(role,need)
    local attr,value=getValue(role,need)
    return attr==value
end)
register("has",function(role,need)
    local attr,value=getValue(role,need)
    return attr:has(value)
end)
register("not_has",function(role,need)
    local attr,value=getValue(role,need)
    return not attr:has(value) 
end
)


