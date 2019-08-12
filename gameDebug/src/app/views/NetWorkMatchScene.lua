require "app.views.NetBattleScene"
_ENV=namespace "views"
using_namespace "luaClass"
using_namespace "container"
using_namespace "ui"
using_namespace "uis"
using_namespace "controller"
using_namespace "game"

--暂时不开启，以后强化序列化函数之后，再考虑。

---@class NetWorkMatchScene
local NetWorkMatchScene=class("NetWorkMatchScene"){
    CLASS_DEBUG(false);
    NO_AUTO_INHERIT();
    super(cc.Scene,ui.LUIObject);
}


function NetWorkMatchScene:NetWorkMatchScene()
    self=self:__super()
    self:LUIObject()
    self:load(MainSceneScript)
    self:setParams("backGround",{Path:getInstance().ui.openImage})
    self:implement()
    local menu=self:find("menu")
    local textArr=array({"弃用:做主机","弃用:搜索对战","返回"})
    local callArr=array()

    callArr:push_back(function()
        self:onTcpServer()
    end)
    callArr:push_back(function()
        self:onTcpConnect()
    end)
    callArr:push_back(function()
       cc.Director:getInstance():replaceScene(MainScene())
    end)

    for i,key,call in textArr:zip(callArr) do
        cc.MenuItemLabel:create(createLabel(key,20))
        :setPosition(0,-i*(30))
        :addTo(menu)
        :registerScriptTapHandler(call)
    end

end

function NetWorkMatchScene:onTcpServer()
    NetWork:getInstance():buildServer()
    connect(NetWork:getInstance(),"connectSuccessed",self,function()
        NetWork:getInstance():send(ENUM.NET_BATTLE.SERVER_OK) 
    end)
    NetWork:getInstance():wait(ENUM.NET_BATTLE.CLIENT_OK,LNEvent("client_ok","once",function()
        
        local battleInfo={
            
            mapkey="zhulin",
            music="",
            our_roles={
                { 	key=nil,	x=2,	y=2, team=1,	face=1, },
                { 	key=nil,	x=2,	y=3, team=1,	face=1, },
                { 	key=nil,	x=2,	y=4, team=1,	face=1, }
            },
            your_roles={ 
                { 	key=nil,	x=8,	y=2, team=2,	face=0, },
                { 	key=nil,	x=8,	y=3, team=2,	face=0, },
                { 	key=nil,	x=8,	y=4, team=2,	face=0, }
            },
        }
        local ctr=NetBattleController(1)
        local btScene=NetBattleScene(battleInfo,ctr)
        btScene:showRoleSelect(
            ResScriptManager:getInstance().netBattleRoles
        )

        cc.Director:getInstance():replaceScene(btScene)
        NetWork:getInstance():bind(btScene)
    end))

    local mui=
    MessageUI(cc.size(display.cx,display.cy))
    :addTo(self,200)
    :setPosition(display.cx/2,display.cy/2)

    mui:showInputBox("等待对方连接,当前局域网ip","建立主机",function(text,editBox)
        local socket=require "socket"
        local ip=socket.dns.toip(socket.dns.gethostname())
        editBox:setText(ip)
        
        --以下获取公网ip，但是服务器必须做端口映射，这对无中心服务器不适用
        --弃用
        --[[
        local xhr = cc.XMLHttpRequest:new()
        xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
        xhr:open("GET", "http://2019.ip138.com/ic.asp")
        local function onReadyStateChanged()

            if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
                local reponse=xhr.response
                local mc=reponse:match("%[([%d%.]-)%]")
                result=mc


                editBox:setText(mc)
            else
                editBox:setText("获取失败，自己手动去查吧")
            end
    
            xhr:unregisterScriptHandler()
        end
    
        xhr:registerScriptHandler(onReadyStateChanged)
        xhr:send()
        --]]
    end)

end

function NetWorkMatchScene:onTcpConnect()
    NetWork:getInstance():buildDeal("client")
    NetWork:getInstance():wait(ENUM.NET_BATTLE.SERVER_OK,LNEvent("server_ok","once",function()
        NetWork:getInstance():send(ENUM.NET_BATTLE.CLIENT_OK)
        print("client ok")
        local battleInfo={
            mapkey="zhulin",
            music="",
            our_roles={
                { 	key=nil,	x=2,	y=2, team=1,	face=1, },
                { 	key=nil,	x=2,	y=3, team=1,	face=1, },
                { 	key=nil,	x=2,	y=4, team=1,	face=1, }
            },
            your_roles={ 
                { 	key=nil,	x=8,	y=2, team=2,	face=0, },
                { 	key=nil,	x=8,	y=3, team=2,	face=0, },
                { 	key=nil,	x=8,	y=4, team=2,	face=0, }
            },
        }

        local ctr=NetBattleController(2)
        local btScene=NetBattleScene(battleInfo,ctr)
        btScene:showRoleSelect(
            ResScriptManager:getInstance().netBattleRoles
        )
        cc.Director:getInstance():replaceScene(btScene)
        NetWork:getInstance():bind(btScene)
    end))

    local mui=
    MessageUI(cc.size(display.cx,display.cy))
    :addTo(self,200)
    :setPosition(display.cx/2,display.cy/2)

    mui:showInputBox("输入对方ip","连接目标",function(text,editBox)
        NetWork:getInstance():buildClient(text)
    end)


end