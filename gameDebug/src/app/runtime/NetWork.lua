include "app.runtime.NetWorkEvent"
local socket=require "socket"
_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"


local director=cc.Director:getInstance()
---@class NetWork
---@field getInstance fun():NetWork
local NetWork=class("NetWork"){
    CLASS_DEBUG(false);
    super(cc.Node);
    super(ui.LUIObject);
    SINGAL.connectSuccessed();
    SINGAL.readable("socket");
    SINGAL.writable("socket");
    SINGAL.connectClosed();
    public{
        STATICFUNC.getInstance(function(cls)
            if  cls.s_instance==nil then
                cls.s_instance=cls()
            end
            local instance=cls.s_instance
            if  director:getRunningScene()~=instance:getParent() then
                
                instance:bind(director:getRunningScene())
            end
            return instance
        end);
    }
}

function NetWork:NetWork()

    self=self:__super()
    self:LUIObject()
    self:retain()
    
    self.host="localhost"
    self.port=9998


    self.sockArray=array()
    self.events=map()
    self.writeBufferArray=array()
    self.waitBufferMap=map()

    self.waitConnect=false
    self.inNetWork=false

    self.bufferStack=stack()

    connect(self,"writable",self,"writeBuffer")
    connect(self,"readable",self,"readBuffer")
end
function NetWork:bind(node)
    if  self:getParent() then
        self:removeFromParent(false)
    end

    if  node then
        node:addChild(self)
    end

end

function NetWork:buildDeal(connectType)
    if connectType=="server" then
        self:addUpdateFunction("server",self.dealServer,self)
    elseif connectType=="client" then
        self:addUpdateFunction("client",self.dealClient,self)
    else
        print("错误 connectType ",connectType)
    end
    self:addUpdateFunction("wait",self.dealWait,self)
end

function NetWork:dealWait()

    for CMD,value in self.waitBufferMap:iter() do
        local events=self.events:get(CMD)
        if  events then
            self.waitBufferMap:del(CMD)
            for _,lnevent in events:iter() do
                lnevent:doEvent(value)
            end
            
        end
    end
end

function NetWork:dealServer()
    if self.waitConnect then
        local conn  = self.server:accept()  
        if conn then
            --信号
            print("server client socket create")
            self:connectSuccessed()
            self.waitConnect=false
            self.sockArray:push_back(conn)
        end
    end
    self:dealClient()
end
function NetWork:dealClient()
    local reads = socket.select(self.sockArray:getData(),nil, 0 )
    --[[   
       for key,v in pairs(reads) do
           print(key,v)
       end
   --]]
    for _,readSocket in ipairs(reads) do
        self:readable(readSocket)
    end
    
    local _,writes,_ =socket.select(nil,self.sockArray:getData(),0)
    for _,writeSocket in ipairs(writes) do
        
        if self.writeBufferArray:front()=="LUA_START"
        and self.writeBufferArray:back()=="LUA_END" then

            self:writable(writeSocket) 
        end
    end
end

function NetWork:readBuffer(readSocket)
    local reponse, err
    while(true) do
        reponse,err=readSocket:receive("*l")     
        if reponse then
            if reponse=="LUA_START" then
                self.bufferStack:push(array())       
                break 
            elseif reponse=="LUA_END" then
                self:parse(self.bufferStack:pop())
                break
            end

            if  not self.bufferStack:empty() then
                self.bufferStack:top():push_back(reponse)
            end                
        elseif err then
            local result=self:dealError(err,readSocket)
            if result then
                break
            end
        else
            break
        end            
    end


end

function NetWork:writeBuffer(writeSocket)
    local start=1
    local i=1
    local size=self.writeBufferArray:size()
    ---@type string
    local buffer=""
    local totalSize=0
    while i<=size do
        if buffer=="" then
            
            buffer=self.writeBufferArray:at(i).."\n"
            totalSize=buffer:len()
        end
        local sendSize,err,index=writeSocket:send(buffer,start,totalSize)
        --如果这轮消息并没有发送完，会尝试继续发送剩下的部分
        if  sendSize then
            if sendSize<totalSize then
                start=sendSize+1
                totalSize=totalSize-sendSize
                i=i-1
            else--发送成功
                buffer=""
            end
        --如果存在错误消息
        elseif err then
         
            local result=self:dealError(err,writeSocket)
            --放弃发送
            if result==true then
                break
            else--重新尝试发送
                start=index+1
                totalSize=totalSize-index
                i=i-1
            end
        end
        i=i+1
    end
    self.writeBufferArray:clear()
end

---@param err string
---@return boolean@ 返回true会关闭socket，false重试
function NetWork:dealError(err,socket)
    if err=="closed" then
        socket:close()
        self:connectClosed()
        self.sockArray:clear()
        return true 
    elseif err=="timeout" then
        return false  
    else
        print("socket error:",err)
        return true             
    end
end



function NetWork:buildServer()
    print("server start ")
    if  self.server then 
        self.server:close()
        self.server=nil
    end
    self.host="*"
    self.inNetWork=true
    self.server = socket.tcp()
    self.server:bind(self.host,self.port) 
    self.server:listen(5)
    self.server:settimeout(0)
    self.waitConnect=true
    self:buildDeal("server")
end

function NetWork:buildClient(targetIp)
    if  self.client then
        self.client:close()
        self.client=nil
    end
    self.host=targetIp
    self.inNetWork=true
    self.client=socket.tcp()
    local reponse,err=self.client:connect(self.host,self.port)
    if reponse then
        print("connect success")
        self.sockArray:push_back(self.client)
    else
        self.client:close()
        self.client=nil
        print(reponse,err)
    end
    self:buildDeal("client")
end

function NetWork:send(CMD,data)
    if self.inNetWork==false then
        return
    end
   
    if CMD==ENUM.NET_BATTLE.START 
    or CMD==ENUM.NET_BATTLE.END     
    or CMD==ENUM.NET_BATTLE.MY_TURN
    or CMD==ENUM.NET_BATTLE.YOUR_TURN
    or CMD==ENUM.NET_BATTLE.UP_TIME
    or CMD==ENUM.NET_BATTLE.END_GAME
    or CMD==ENUM.NET_BATTLE.ON_RESULT then
        self.writeBufferArray:push_back(CMD)
    elseif 
        CMD==ENUM.NET_BATTLE.DATA then
        self.writeBufferArray:push_back(data)    
    elseif
        CMD==ENUM.NET_BATTLE.ATTACK 
    or  CMD==ENUM.NET_BATTLE.MOVE
    or  CMD==ENUM.NET_BATTLE.REST
    or  CMD==ENUM.NET_BATTLE.USEITEM then

        self.writeBufferArray:push_back(CMD)
        self.writeBufferArray:push_back(data)
    else 
        self.writeBufferArray:push_back(ENUM.NET_BATTLE.START)
        self.writeBufferArray:push_back(CMD)
        self.writeBufferArray:push_back(data)
        self.writeBufferArray:push_back(ENUM.NET_BATTLE.END)
    end
end
function  NetWork:wait(CMD,lnevent)
    local events=self.events:get(CMD)
    if events==nil then
        events=map()
        self.events:insert(CMD,events)
    end
    lnevent:bindParent(events)    
    events:insert(lnevent.name,lnevent)
end

function NetWork:parse(buffers)
    if buffers:empty() then
        return 
    end
    local CMD=buffers:at(1)
    local events=self.events:get(CMD)
    if  events then
        for _,lnevent in events:iter() do
            lnevent:doEvent(buffers)
        end
    else
        self.waitBufferMap:insert(CMD,buffers)
    end
end