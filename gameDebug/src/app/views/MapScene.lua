
_ENV=namespace "views"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
using_namespace "ui"

class("MapScene"){
    super(cc.Scene);
    super(LUIObject);
    public{
        MEMBER.mapName;
        MEMBER.mapPath;
    };
    public{
        FUNCTION.MapScene(function(self,mapName)
            self=self:__super()
            self:LUIObject()
            self.mapName=mapName
            RuntimeData:getInstance().currentMap=mapName
            local mapPic=ResScriptManager:getInstance().mapsQuery:get(mapName).pic 
            local mapPath=ResScriptManager:getInstance().resourcesQuery:get(mapPic).value
            self.mapPath=mapPath

            local textArray,callArray=self:getMenuParams()

            self:load(uis.MapSceneScript)
            self:setParams("backGround",{self.mapPath})
            self:setParams("mapName",{self.mapName})
            self:setParams("menu",{
                RuntimeData:getInstance().time:toString();
                textArray;
                callArray;
                25;
                cc.p(1,1);    
            })
            self:implement()

            self:setMapEvent()
            self:setMusic()
        
        
        end);



    };



    protected{
        FUNCTION.transXY(function(self,x,y,num,count)
            local visibleSize=cc.Director:getInstance():getVisibleSize()
            if x==-1 and y==-1 then
                x=visibleSize.width*num/count
                y=display.cy
            else
                x=x*visibleSize.width/CC_DESIGN_RESOLUTION.width
            end
            return x,y
        end);

        FUNCTION.setMapEvent(function(self)
            local mapName=self.mapName
            local childMaps=ResScriptManager:getInstance().mapEventsQuery:get(mapName)
        
            local eventArray=array()
            for _,childMap in childMaps:iter() do
                local event=EventManager:getInstance():checkEvent(childMap.event)
                if  event then
                    eventArray:push_back({event=event,childMap=childMap})
                end
            end
            local resourcesQuery=ResScriptManager:getInstance().resourcesQuery
            local tmp_t={value=""}
            for index,eventNode in eventArray:iter() do
                local event=eventNode.event
                local childMap=eventNode.childMap
        
                local mapNode
                if childMap.x==-1 and childMap.y==-1 then
                    local pic=childMap.pic
                    local rValue
                    if pic:find("team") then
                        local _,roleKey=unpack(pic:split(":"))
                        rValue=RuntimeData:getInstance().team:get(roleKey)
                        if  rValue then
                            rValue=rValue.picPath
                        else
                            rValue=""
                        end
                    else
                        rValue=resourcesQuery:get(pic,tmp_t).value
                    end
                    
                    if rValue~="" then 
                        
                        local cellWidth=70
                        local cellHeight=70
                        local card=
                        createBlock(cc.size(cellWidth,cellHeight))
                        :setAnchorPoint(0.5,0.5)

                        local sprite=
                        cc.Sprite:create(rValue)
                        :setPosition(cellWidth/2,cellHeight/2)
                        :setAnchorPoint(0.5,0.5)
                        :setContentSize(cellWidth*0.9,cellWidth*0.9)
                        :addTo(card)
        
                        
                        local name=createLabel(childMap.name,18)
                        :setAnchorPoint(0,1)
                        :setPosition(0,0)
                        :setWidth(cellWidth*1.2)
                        :addTo(card)

                        mapNode=card
                    else
                        mapNode=createLabel(childMap.name, 18)     
                    end
                else
                    mapNode=createLabel(childMap.name, 18)
                end
             
                mapNode
                :move( self:transXY( childMap.x, childMap.y,index,eventArray:size()+1))
                :addTo(self)

                local time=
                ( childMap.x==-1 and childMap.y==-1 )
                and 
                Time:create(0,1)
                or
                Time:create(math.ceil((math.abs(childMap.x)+math.abs(childMap.y))/200),0)
                local function onTouchBegin()
                    RuntimeData:getInstance():addTime(time)
                    EventManager:getInstance():doEvent(event,self)
                end
                onNodeTouch(mapNode,onTouchBegin)
            end
        end);

        FUNCTION.getMenuParams(function(self)
            local textArray=array()
            textArray:push_back("物品查看")
            textArray:push_back("人物信息")
            textArray:push_back("日志信息")
            textArray:push_back("查看存档")
            textArray:push_back("任务信息")
            textArray:push_back("游戏设置")
        
            local callArray=array()

            --物品查看
            callArray:push_back(function()
                
                ItemUI(set({0,1,2,3,4,5,6,7,8,9,10}))
                :addTo(self,200)
                :setBackGround(self.mapPath)
                :showMenu()
            end);
    
            --角色信息
            callArray:push_back(function()
                
                local roleui=RoleUI(RuntimeData:getInstance().team,true)
                :setBackGround(self.mapPath)
                :addTo(self,100)

                connect(roleui,"roleBlockTouched",roleui,"showRoleDetail")

                local textArray=array({"返回"})
                local callArray=array({function()
                    roleui:remove()
                
                end})
                roleui:setMenu(textArray,callArray)
            end)
            --日志
            callArray:push_back(function()
                
                LogUI(RuntimeData:getInstance().suggest)
                :addTo(self,100)
                :setMenu()
                :setBackGround(self.mapPath)
            end)
            --存档
            callArray:push_back(function()
                
                SaveDisplayUI(true)
                :move(0,0)
                :setContentSize(cc.Director:getInstance():getVisibleSize())
                :addTo(self,100)
                :setBackGround(self.mapPath )
                
            end)
            callArray:push_back(function()
                
                MissionUI()
                :addTo(self,200)
                :setCheckMission()
                
            end)

            callArray:push_back(function()
                SettingUI()
                :addTo(self,200)
            end)
            return textArray,callArray
        end);

        FUNCTION.setMusic(function(self)
            local musics=ResScriptManager:getInstance().mapsQuery:get(self.mapName).musics
            musics=musics:split("#")
            local index=#musics
            if index==0 then return end
            if index>1 then
                index=math.random( 1,index)
            end
            local music=musics[index]
        
            if music~="" then
                local musicItem=ResScriptManager:getInstance().resourcesQuery:get(music)
                if musicItem then
                    Audio:getInstance():playMusic(musicItem.value)
                end
            end
        end);


    };

}



return MapScene
