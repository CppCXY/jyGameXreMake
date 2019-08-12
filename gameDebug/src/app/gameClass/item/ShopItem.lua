include "app.gameClass.item.Item"
include "app.gameClass.trigger.Need"

_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

class("ShopItem"){
    CLASS_DEBUG(false);
}

function ShopItem:ShopItem(shop)
    self.name=shop.name
    self.identifier=math.ceil(shop.id)..self.name
    local itemInfo=ResScriptManager:getInstance().itemsQuery:get(shop.name)
    self.picPath=ResScriptManager:getInstance().resourcesQuery:get(itemInfo.pic).value
    self.number=shop.number
    self.limit=shop.limit
    self.desc=shop.desc
    self.needs=array()
    self.costs=array()
    local needs=shop.need
    local costs=shop.cost
    if needs then
        for _,need in pairs(needs) do
            if need.type~="" then
                self.needs:push_back(Need(need.type,need.value))
            end
        end
    end
    if costs then
        for _,cost in pairs(costs) do
            if cost.type~="" then
                self.costs:push_back(
                    {
                        name=cost.type,
                        value=array(cost.value:split(","))
                    }
                )
            end
        end
    end
end
function ShopItem:cost()
    for _,cost in self.costs:iter() do
        if cost.name=="item" then

            local name=cost.value:at(1)
            local num= tonumber(cost.value:at(2)) or 0
            local item=RuntimeData:getInstance():getItemByName(name)
            if item then
                RuntimeData:getInstance():removeItem(item.identifier,num)
            else
                print("error: can not find item ".. name.."please check excel shop")
            end
        end

    end
end



function ShopItem:toItem()
    local value=RuntimeData:getInstance().shopItemLimit:get(self.identifier,0)
    RuntimeData:getInstance().shopItemLimit:insert(self.identifier,1+value)
    self:cost()
    RuntimeData:getInstance():addItemByName(self.name,self.number)
end

function ShopItem:checkNeed()
    for _,need in self.needs:iter() do
        if not need:check() then
            return false
        end
    end
    return true
end
function ShopItem:checkLimit()
    return 
    (RuntimeData:getInstance().
    shopItemLimit:get(self.identifier,0)
    <self.limit)
end

function ShopItem:toString(type)
    type=type or "detail"
    local str=""
    if type=="simple" then
        str=str..self.name.."\n"..
        self.desc
    elseif type=="detail" then
        local strArr=array()
        local isNeed,isLimit=self:checkNeed(),self:checkLimit() 

        for _,need in self.needs:iter() do
            strArr:push_back(
            need:toString()
            )
        end
        str=str..self.name.."\n"..
        self.desc.."\n"..
        "需求条件:\n"..
        table.concat(strArr:getData(),"\n").."\n"..
        "可购买次数: "..(self.limit-RuntimeData:getInstance()
        .shopItemLimit:get(self.identifier,0))..
        ((isNeed and isLimit) 
        and "\n满足条件可以交易\n" or "\n尚不满足条件\n")
    end
    return str
end
