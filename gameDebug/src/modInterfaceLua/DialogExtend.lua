_ENV=namespace "mod.DialogExtend"
using_namespace "container"
using_namespace "luaClass"
using_namespace "game"


---这里主要用于story中的action 扩展
---@param controller DialogController
---@param actionType string
---@param value string
function ActionExtend(controller,actionType,value)
--其实这些属于核心代码，我写在这里只是为了有个示范
    if actionType=="ITEM.RAND" then
        local items =value:split('#')
        local index=randInt(1,#items)
        local itemStr=items[index]

        local itemName,number=unpack(itemStr:split("|"))

        RuntimeData:getInstance():addItemByName(itemName,number)
        controller.displayUI:setData(nil,"获得物品 "..itemName.." "..number.."个") 
        controller.displayUI:show()
        return true    
    elseif actionType=="SET.VARIABLE" then
        local ty,key,val=unpack(value:split("#"))
        if ty=="number" then
            val=tonumber(val)
        elseif ty=="string" then
            --empty
        else
            print("undefine type "..ty)    
        end
        RuntimeData:getInstance().variable[key]=val
        controller:nextAction()
        return true
    elseif actionType=="CLEAR.VARIABLE" then
        RuntimeData:getInstance().variable[value]=nil
        controller:nextAction()
        return true
    elseif actionType=="SET.MUSIC" then
        local musicItem=ResScriptManager:getInstance().resourcesQuery:get(value)
        if musicItem then
            Audio:getInstance():playMusic(musicItem.value)
            controller:nextAction()
        else
            print("没有音乐",value)
        end
        return true
    else
    --返回true 则中断原有逻辑,false 继续原有逻辑
        return false        
    
    end
end


