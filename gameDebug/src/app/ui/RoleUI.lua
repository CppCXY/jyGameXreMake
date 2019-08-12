include "app.ui.RoleDetailUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
class("RoleUI"){
    super(cc.Layer);
    super(LUIObject);
    SINGAL.roleBlockTouched("role");
    public{
        FUNCTION.RoleUI(function(self,dataSource,showDraw)
            self=self:__super()
            self:LUIObject()
            self._dataSource=dataSource
            self._isAlter=true
            if showDraw==nil then
                showDraw=false
            end
            self.showDraw=showDraw
            if showDraw then
                self:showRolesDraw()
            else
                self:showRoles()
            end

        end);
        


        FUNCTION.getMat(function(self)
            return self._mat
        end);

        FUNCTION.showRoles(function(self)
            self:clear("_mat")
            local colNum=4
            local contentSize=cc.size(display.cx*1.5,display.cy*1.5)
           
            local elemsetting=function (card,showItem,cellWidth,cellHeight)
                local path=showItem.picPath
                if path==nil then
                    path=ResScriptManager:getInstance().resourcesQuery:get(showItem.head,{value=""}).value
                    if path=="" then
                        error(showItem.name)
                    end
                end
                local sprite=
                cc.Sprite:create(path)
                :setPosition(0,0)
                :setAnchorPoint(0,0)
                :setContentSize(cellWidth*0.6,cellWidth*0.6)
                :addTo(card)

                
                local name=createLabel(showItem.name,18)
                :setAnchorPoint(0,1)
                :setPosition(cellWidth*0,cellHeight*0.85)
                :setWidth(18)
                :addTo(card)
                
            end
            
            local matUI=MatUI(contentSize,self._dataSource,colNum,nil,elemsetting)
            :setPosition(display.cx,display.cy)
            :setAnchorPoint(0.5,0.5)
            :addTo(self,100)

            self._mat=matUI

            connect(matUI,"elemTouched",self,"roleBlockTouched")
            return self
        end);

        FUNCTION.showRolesDraw(function(self)
            self:clear("_mat")

            local contentSize=cc.size(display.cx*1.5,display.cy*1.5)
            local cellHeight=display.cy*1.5
            local cellWidth=display.cx*1.5/4

            local createArray=array()
            for _,role in self._dataSource:iter() do
                createArray:push_back(function()
                    local card=RectCardUI(cc.size(cellWidth*0.95,cellHeight*0.95))
                    :setAnchorPoint(0,0)                

                    local drawBackPath=role.drawBackPath~=""
                    and 
                    role.drawBackPath
                    or(
                        role.sex=="男" 
                        and Path:getInstance().ui.defaultMan
                        or  Path:getInstance().ui.defaultWoman
                    )

                    cc.Sprite:create(drawBackPath)
                    :setPosition(cellWidth*0.95/2,cellHeight*0.95/2)
                    :setAnchorPoint(0.5,0.5)
                    :setContentSize(cellWidth*0.9,cellHeight*0.93)
                    :addTo(card,1)
                    

                    local path=role.drawPath~=""
                    and role.Path
                    or  nil

                    
                    if path==nil then
                        path=role.picPath
                        cc.Sprite:create(path)
                        :setPosition(cellWidth*0.95/2,cellHeight*0.95/2)
                        :setAnchorPoint(0.5,0.5)
                        :setContentSize(cellWidth*0.8,cellWidth*0.8)
                        :addTo(card,10)
                    else
                        cc.Sprite:create(path)
                        :setPosition(cellWidth*0.95/2,cellHeight*0.95/2)
                        :setAnchorPoint(0.5,0.5)
                        :setContentSize(cellWidth*0.8,cellHeight*0.8)
                        :addTo(card,10)
                    end

                    
                    local name=createLabel(role.name,25,role.sex=="男" and cc.c3b(184,164,11) or cc.c3b(255,192,203))
                    :setAnchorPoint(0,1)
                    :setPosition(cellWidth*0.1,cellHeight*0.9)
                    :setWidth(18)
                    :addTo(card,100)

                    return card,role
                end)

            end
            local tb=TableView(contentSize,cc.SCROLLVIEW_DIRECTION_HORIZONTAL)

            tb:setCellSize(cc.size(cellWidth,cellHeight))
            :setPosition(display.cx/4,display.cy/4)
            :addTo(self)
            :setCreateArray(createArray)
            :reloadData()


            self._mat=tb

            connect(tb,"cellTouched",self,function(view,cell,role)

                self:roleBlockTouched(role)
            end)

            return self
        end);

        FUNCTION.setNotAlter(function(self,isAlter)
            self._isAlter=isAlter    
        end);

        FUNCTION.showRoleDetail(function(self,role)
            
            --延迟删除
            self:delayClear("_mat",0.1)
    
            local roleDetail=RoleDetailUI(role,self._isAlter)
            
            roleDetail
            :addTo(self,999)
            :setBackGround(self._backGroundPath)
            
            self._mat=roleDetail
            connect(roleDetail,"destroyed",self,"onDetailDestroyed")
        end);

        FUNCTION.onDetailDestroyed(function(self)
            self._mat=nil
            if self.showDraw then
                self:showRolesDraw()
            else
                self:showRoles()
            end
        end);
        FUNCTION.showTips(function(self,text)
            if  self._tips==nil then
                self._tips=createLabel("",20)
                :setAnchorPoint(0,0)
                :setPosition(display.cx/4,display.cy*1.8)
                :addTo(self,100)
            end
            self._tips:setString(text)
        end);
        
        FUNCTION.showTitle(function(self,text)
            if  self._title==nil then
                self._title=createLabel("",20,cc.RED)
                :setAnchorPoint(0,1)
                :setPosition(display.cx/4,display.cy*2)
                :setWidth(display.cx*1.5)
                :addTo(self,100)
            end
            self._title:setString(text)
        end);

        FUNCTION.setMenu(function(self,textArray,callArray)
            for i,text,call in textArray:zip(callArray) do
                local card=
                CardUI(cc.size(display.cx/4,display.cy/8))
                :setPosition(display.cx/4,display.cy*(1.75-0.3*i))
                :setAnchorPoint(1,1)
                :addTo(self)
                :setText(text)
                card.onTouch=true
                connect(card,"touched",card,call)
            end 
            
        end);
    };
    public{
        MEMBER.showDraw;
    };

    protected{
        MEMBER._isAlter;
        MEMBER._mat;
        MEMBER._title;
        MEMBER._tips;
        MEMBER._dataSource;
    };
}








