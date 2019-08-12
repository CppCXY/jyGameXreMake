_ENV=namespace "mod.EventExtend"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"


local function searchAndReload(prefix,fileName)
    local reloadList=array()
    for key,value in pairs(package.loaded) do
        local mc=key:match("^"..prefix..fileName)
        if mc then
            if DEBUG~=1 then
                print("重新加载了文件:"..mc)
            end
            reloadList:push_back(key)
        end
    end

    for _,key in reloadList:iter() do
        package.loaded[key]=nil
    end

    for _,key in reloadList:iter() do
        require (key)
    end



end
---如果你想增加一个控制台命令或者一个地图event type方法，就在这里添加
---添加方式onEventTable：insert(事件名，函数)
---函数的参数是 除了第一个类型关键词以外的所有参数
function EventResultExtend(onEventType)
    onEventType:insert("item",
        function (name,number)
            
            RuntimeData:getInstance():addItemByName(name,number)
        end
    )
    onEventType:insert("reload",
        function (opt,fileName)
            opt=opt or "-m" 
            fileName=fileName or ".+"
            local prefix;
            if opt=="-m" then
                prefix="modInterfaceLua%."
                searchAndReload(prefix,fileName)
                EventManager:getInstance():EventManager()
            elseif opt=="-s" then
                prefix="resScripts%.time1%."
                searchAndReload(prefix,fileName)
                ResScriptManager:getInstance():ResScriptManager()
            elseif opt=="-r" then
                prefix=""
                local fileName=fileName:gsub("%.","%%.")
                searchAndReload(prefix,fileName)
            else
                print("bad input opt is"..opt.." ,fileName is "..fileName)
            end

        end
    )
    onEventType:insert("join",
    function (roleKey)
        RuntimeData:getInstance():addRole(Role:create(roleKey))

    end
)


end

---如果你想增加一个事件的条件，在这里添加
---值得注意的是condition不应该报错,但是可以尽可能的发现错误并且主动处理错误
---有必要的时候可以print打印错误信息
---condition只有type和value
function EventConditionExtend(condition)
    local ctype=condition.type
    local value=condition.value
    if ctype=="NUMBER.GREATER.THAN" then
        local key,val = unpack(value:split(","))
        local newval=RuntimeData:getInstance().variable[key]
        newval=tonumber(newval) or 0 
        return newval>tonumber(val)
    elseif ctype=="NUMBER.LESS.THAN" then
        local key,val = unpack(value:split(","))
        local newval=RuntimeData:getInstance().variable[key]
        newval=tonumber(newval) or 0 
        return newval<tonumber(val)
    elseif ctype=="NUMBER.EQUAL.TO" then
        local key,val = unpack(value:split(","))
        local newval=RuntimeData:getInstance().variable[key]
        newval=tonumber(newval) or 0 
        return newval==tonumber(val)
    elseif ctype=="STRING.EQUAL.TO" then
        local key,val = unpack(value:split(","))
        local newval=RuntimeData:getInstance().variable[key]
        newval=tostring(newval) or "" 
        return newval==val

    elseif ctype=="STRING.CONTAIN.IN" then 
        local key,val = unpack(value:split(","))
        local newval=RuntimeData:getInstance().variable[key]
        newval=tostring(newval) or "" 
        return newval:find(val)~=nil
        
    end
    --不返回值或者 返回nil 表示使用内部逻辑
end

