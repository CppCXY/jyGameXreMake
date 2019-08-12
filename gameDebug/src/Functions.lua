
_ENV=namespace()

---这玩意没用，不适合我自己的class规则，不要用哦
---@param Object table
function CopyObject(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local newObject = {}
        lookup_table[object] = newObject
        for key, value in pairs(object) do
            newObject[_copy(key)] = _copy(value)
        end
        return setmetatable(newObject, getmetatable(object))
    end
    return _copy(object)
end



math.randomseed(os.time())
function probability(pbValue)
    return math.random()<=pbValue
end

function shuffle(arrayTable)
    local size=#arrayTable
    for i=1,size do
        local index=randInt(1,size)
        arrayTable[i],arrayTable[index]=arrayTable[index],arrayTable[i]
    end
end

function randInt(from,to)
    from=math.floor(from)
    to=math.ceil(to)
    return 
    from<to 
    and 
    math.random(from,to)
    or
    math.random(to,from)
end

function randTable(tb)
    local num=#tb
    local index=randInt(1,num)
    return tb[index]
end

---@param s string
---@return string
function trim(s)
    return s:gsub("^%s*(.-)%s*$", "%1")
end

string.trim=trim

---给节点增加触摸
---@param node cc.Node
---@param func fun(touch:any,event:any):void
---@param isSwall bool 
---@return void
function onNodeTouch(node, func, isSwall)
    if node:isVisible()==false then return true end
    isSwall = isSwall or true
    local onTouchBegin = function(touch, event)
        
        local target = event:getCurrentTarget()
        local size = target:getContentSize()
        local rect = cc.rect(0, 0, size.width, size.height)
        local p = touch:getLocation()
        p = target:convertTouchToNodeSpace(touch)

        if cc.rectContainsPoint(rect, p) then
            
            func(touch,event)
            return isSwall
        end
        return false
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(isSwall)
    listener:registerScriptHandler(onTouchBegin, cc.Handler.EVENT_TOUCH_BEGAN)
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, node)
end


---当触摸在某个节点以内开始时
---@param node cc.Node
---@param funcBegin fun(touch:any,event:any):void
---@param funcMove fun(touch:any,event:any):void
---@param funcEnd fun(touch:any,event:any):void
---@param isSwall bool 用来判断是否吞噬
---@param isSwall bool 
---@return void
function onNodeTouchIn(node, funcBegin,funcMove ,funcEnd,isSwall)
    if node:isVisible()==false then return true end
    isSwall=isSwall or false
    local onTouchBegin = function(touch, event)
    
        local target = event:getCurrentTarget()
        local size = target:getContentSize()
        local rect = cc.rect(0, 0, size.width, size.height)
        local p = touch:getLocation()
        p = target:convertTouchToNodeSpace(touch)
        if cc.rectContainsPoint(rect, p)  then
            funcBegin(touch,event)
            return true
        end
        return false
    end
    funcMove=funcMove or function() end
    funcEnd=funcEnd or function() end
    local onTouchMove=function(touch,event) 
        funcMove(touch,event)
    end
    local onTouchEnd=function(touch,event)
        local target = event:getCurrentTarget()
        local size = target:getContentSize()
        local rect = cc.rect(0, 0, size.width, size.height)
        local p = touch:getLocation()
        p = target:convertTouchToNodeSpace(touch)
        local inRect= cc.rectContainsPoint(rect, p) 
        funcEnd(touch,event,inRect) 
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(isSwall)
    listener:registerScriptHandler(onTouchBegin, cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchMove, cc.Handler.EVENT_TOUCH_MOVED)
    listener:registerScriptHandler(onTouchEnd, cc.Handler.EVENT_TOUCH_ENDED)
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, node)
end


---创建标签
---@param text string
---@param fontSize number
---@param color cc.c3b
---@param fontPath string
---@return cc.Label
function createLabel(text, fontSize,color,fontPath,notOutline)
    notOutline=notOutline or false
    if device.platform =="android" then
        fontSize=fontSize+2
    end
    fontPath=fontPath or Path:getInstance().font.default
    color=color or cc.c3b(255, 255, 255)
    local lb = cc.Label:createWithTTF(text, fontPath, fontSize)
    lb:setColor(color)
    if not notOutline then
        lb:enableOutline(cc.c4b(0, 0, 0, 255), 1)
        lb:enableShadow(cc.c3b(0, 0, 0), cc.size(0, -2), 1)
    end
    return lb
end

---创建矩形
function createBlock(size,color)
    local pointArr={
        cc.p(0,0),
        cc.p(size.width,0),
        cc.p(size.width,size.height),
        cc.p(0,size.height)
    }
    local fill=color or cc.c4f(0,0,0,0.6)
    local dr=cc.DrawNode:create()
    dr:drawPolygon(pointArr,4,fill,2,fill)
    dr:setContentSize(size)
    return dr
end

---创建六边形
---@param edgeLength number @传入所在矩形的边长
---@param color cc.c4f @颜色
function createHexagon(edgeLength,color)
    local skewX=edgeLength/2
    local skewY=edgeLength/2*math.pow(3,0.5)
    local pointArr={
        
        cc.p(skewX,0),cc.p(edgeLength+skewX,0),
        cc.p(edgeLength+2*skewX,skewY),cc.p(edgeLength+skewX,2*skewY),
        cc.p(skewX,2*skewY),cc.p(0,skewY)
    }
    local fill=color or cc.c4f(0,0,0,0.6)
    local dr=cc.DrawNode:create()
    dr:drawPolygon(pointArr,6,fill,2,fill)
    dr:setAnchorPoint(0.5,0.5)
    dr:setContentSize(cc.size(edgeLength*2,skewY*2))
    return dr
end

---创建八边形
---@param edgeLength number @传入所在矩形的边长
---@param color cc.c4f @颜色
function createOctagon(edgeLength,color)
    local octEdge=edgeLength/(1+math.pow(2,0.5))
    local octSkewX=octEdge/(math.pow(2,0.5))
    local octSkewY=octSkewX
    local pointArr={
        
        cc.p(octSkewX,0),cc.p(octEdge+octSkewX,0),
        cc.p(edgeLength,octSkewY),cc.p(edgeLength,octEdge+octSkewY),
        cc.p(octEdge+octSkewY,edgeLength),cc.p(octSkewX,edgeLength),
        cc.p(0,octEdge+octSkewY),cc.p(0,octSkewY)
    }
    local fill=color or cc.c4f(0,0,0,0.6)
    local dr=cc.DrawNode:create()
    dr:drawPolygon(pointArr,8,fill,2,fill)
    dr:setAnchorPoint(0.5,0.5)
    dr:setContentSize(edgeLength,edgeLength)
    return dr
end

---@param node cc.Node
---@param stenciRadius number
---@return cc.ClippingNode
function createNodeClip(node,template)
    local clip=cc.ClippingNode:create()
    clip:addChild(node)
    clip:setStencil(template)
    clip:setContentSize(node:getContentSize())
    return clip
end

function getHexClip (node,edge)
    local tmp=createHexagon(edge,cc.c4f(0,0,0,1))
    local ct=tmp:getContentSize()
    node:setAnchorPoint(0.5,0.5)
    node:setContentSize(ct.width*1.1,ct.height*1.1)
    local clip= createNodeClip(node,tmp) 
   -- clip:setAnchorPoint(0.5,0.5)
    local _node=cc.Node:create():setContentSize(ct)
    clip:setPosition(0,ct.height/2)
    _node:addChild(clip) 
    --_node:setAnchorPoint(0.5,0.5)
    return _node
end

function delayCall(node,time,luaFunc)
    local action=cc.Sequence:create(
        cc.DelayTime:create(time),
        cc.CallFunc:create(luaFunc)
    )
    node:runAction(action)

end

function createCard(size)
    return createBlock(size)
end


















