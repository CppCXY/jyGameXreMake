_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "component"
using_namespace "controller"
using_namespace "game"

class("DialogUI"){
    super(cc.Layer);
    super(LUIObject);
    public{
        FUNCTION.DialogUI(function(self,controller)
            self=self:__super()
            self:LUIObject()

            self._controller=controller
            self._text=""
            self._speaker=""
            self:setBackGround(controller.mapName)
            controller:replaceDisplayNode(self)
        end);

        FUNCTION.show(function(self)
            self:setHead()
            self:setText()
        end);

        FUNCTION.setData(function(self,speaker,text)
            self._speaker=speaker or "主角"
            text=text or ""
            local role=RuntimeData:getInstance().team:get(self._speaker)
            local headPath
            if role then 
                headPath=role.picPath
                self._speaker=role.name
            else
                local roleInfo=ResScriptManager:getInstance().rolesQuery:get(self._speaker)
                headPath=
                ResScriptManager:getInstance().resourcesQuery:get(roleInfo.head)
                assert(headPath~=nil,"没有这个角色 "..speaker)
                headPath=headPath.value
                self._speaker=roleInfo.name
            end
            self._headPath=headPath
            self._text=self:replaceText(text)
        
        end);

        FUNCTION.setBackGround(function(self,mapName,mapPath)
            if mapName==nil and mapPath==nil then return  end
            self:clear("_backGround")
            if mapPath==nil then
                local key=ResScriptManager:getInstance().mapsQuery:get(mapName,{pic=""}).pic
                key= key=="" and mapName or key
                mapPath=ResScriptManager:getInstance().resourcesQuery:get(key,{value=""}).value
        
            end
            local backGround=
            cc.Sprite:create(mapPath)
            :setPosition(display.cx,display.cy)
            :setContentSize(cc.Director:getInstance():getVisibleSize())
            :addTo(self,-10)
            self._backGround=backGround

        end);

        FUNCTION.showInputBox(function(self,callBack)
            self:clear("_head")
            self:clear("_selectItems")
            self._text=""
            self:setText()
            local editUI=EditBoxUI(cc.size(display.cx,display.cy/4),
            Path:getInstance().ui.edit
            )
            :setPosition(display.cx,display.cy)
            :addTo(self,100)
            :setPlaceHolder("改个名字")
            
            local ok=createLabel("确定",20)
            :addTo(self,100)
            :setAnchorPoint(0.5,0.5)
            :setPosition(display.cx,display.cy/4)
            onNodeTouch(ok,function ( )
                local text=editUI:getText()
                if text=="" then  return end
                editUI:setPlaceHolder("请输入文字再确定") 
                editUI:removeFromParent()
                ok:removeFromParent()
                
                callBack(text)
            end)
        end);

        FUNCTION.setSelect(function(self,items,luafunc)
            self:clear("_selectItems")
            local createFuncs=array()
            for _,textItem in items:iter() do
                createFuncs:push_back(
                function ()
                   local lb= createLabel(textItem, 20)
                   lb:setAnchorPoint(0,0)
                   lb:setWidth(display.cx)
                   return lb
                end
                )
            end
            local select=TableView(cc.size(display.cx,display.cy-100))
            
            select
            :setPosition(display.cx*0.75,0)
            :setCreateArray(createFuncs)
            :setCellSize(cc.size(display.cx,50))
            :addTo(self,100)
            :reloadData()
            self._selectItems=select
            connect(select,"cellTouched",select,luafunc)
        end);

        FUNCTION.speak(function(self,text)
            self:clear("_head")
            self:clear("_selectItems")
            self._speaker=""
            self._text=self:replaceText(text)
            self:setText()
        end);
        
        FUNCTION.showMission(function(self,value)
            MissionUI(value)
            :addTo(self,200)
            :setAcceptMission()
        end);

        FUNCTION.showShop(function(self,shopName)
            ShopUI(shopName)
            :addTo(self,200)
        end);

        FUNCTION.showHeadSelect(function(self,roleKey,selectKey)
            local role=RuntimeData:getInstance().team:get(roleKey)
            local dataSource=ResScriptManager:getInstance().headSelectQuery:get(selectKey)
            if role and dataSource then
                self._speaker=""
                self._text=""
                self:setText()
                HeadSelectUI(role)
                :addTo(self,999)
                :showHeadSelect(dataSource)
                :showTips("选择你的头像")
            else
                print(role,dataSource,selectKey)
            end
        end);

        FUNCTION.showWareHouse(function(self)
            WareHouseUI():addTo(self,998)    
        end);

    };
    protected{
        FUNCTION.setHead(function(self)
            self:clear("_head")
            self._head=cc.Sprite:create(self._headPath)
            :setPosition(display.left_center)
            :setContentSize(100,100)
            :setAnchorPoint(0,0.5)
            :addTo(self,100)

        end);

        FUNCTION.setText(function(self)
            if self._dialogText==nil then
                
                local visibleSize=cc.Director:getInstance():getVisibleSize()

                local dialogText=
                createLabel("",30)
                :setWidth(display.cx*1.5)
                :setAnchorPoint(cc.p(0,1))
                :setPosition(display.cx/3,display.cy*1.4)
                :addTo(self,100)

                self._dialogText=dialogText
        
            end
            
            self._dialogText:setString(
                self._speaker..
                (self._speaker=="" and "\n        " or ":\n        ")..
                self._text)
        end);
        
        FUNCTION.replaceText(function(self,str )
            return str:gsub("%s-{{(.-)%}}s-",function(s)
                local role=RuntimeData:getInstance().team:get(s)
                if role then 
                    return role.name
                else
                    local roleInfo=ResScriptManager:getInstance().rolesQuery:get(s)
                    if roleInfo then 
                        return roleInfo.name 
                    else
                        return s
                    end
                end
            end)
        end);


    };

    protected{
        MEMBER._selectItems();
        MEMBER._speaker();
        MEMBER._text();
        MEMBER._head();
        MEMBER._dialogText();
        MEMBER._controller();
        MEMBER._headPath();
        MEMBER._backGround();
    };



}




