include "app.ui.MatUI"
include "app.ui.ItemDetailUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

class("ItemUI"){
    super(cc.Layer);
    super(LUIObject);
    SINGAL.itemUsed("item");
    public{
        FUNCTION.ItemUI(function(self,defaultTypeSet,dataSource)
            dataSource=dataSource or RuntimeData:getInstance().items
            self=self:__super()
            self:LUIObject()
            self.onTouch=true
            self._mat=nil
            self._tips=nil
            self._typeSet=nil
            self._dataSource=dataSource 
            connect(self,"itemUsed",self,"onItemUse")
            self:showWithTypeSet(defaultTypeSet)
        end);
        
        FUNCTION.bindData(function(self,dataSource,showStr)
            self._dataSource=dataSource    
            self._showStr=showStr
        end);

        FUNCTION.showWithTypeSet(function(self,typeSet)
            self._typeSet=typeSet
            self:clear("_mat")

            local items=array()
            for _,item in self._dataSource:iter() do
                if typeSet:has(item.type) then
                    items:push_back(item)
                end
            end
            local colNum=6
            local contentSize=cc.size(display.cx*1.5,display.cy*1.5)
            
            local elemsetting=function (card,showItem,cellWidth,cellHeight)
                local path=showItem.picPath
                local sprite=
                cc.Sprite:create(path)
                :setPosition(0,0)
                :setAnchorPoint(0,0)
                :setContentSize(cellWidth*0.6,cellWidth*0.6)
                :addTo(card)

                local num=createLabel(tostring(showItem.number),18)
                local name=createLabel(showItem.name,18)
                num:setPosition(cellWidth*0.85,0)
                num:setAnchorPoint(1,0)
                name:setAnchorPoint(0,1)
                name:setPosition(cellWidth*0,cellHeight*0.85)
                
                card:addChild(num)
                card:addChild(name)
            end
            
            local matUI=MatUI(contentSize,items,colNum,nil,elemsetting)
            :setPosition(display.cx,display.cy)
            :setAnchorPoint(0.5,0.5)
            :addTo(self,100)

            self._mat=matUI

            connect(matUI,"elemTouched",self,"showItemDetail")
        end);

        FUNCTION.showItemDetail(function(self,item)
            self:clear("_mat")
            local itemDetail=ItemDetailUI(item,cc.size(display.cx*0.6,display.cy),self._showStr)
            :setPosition(display.cx*0.7,display.cy/2)
            :addTo(self,998)
            :showMenu()
            self._mat=itemDetail
            connect(itemDetail,"itemUsed",self,"itemUsed")
            connect(itemDetail,"destroyed",self,"onItemBack")

        end);
        FUNCTION.onItemBack(function(self)
            self._mat=nil
            self:showWithTypeSet(self._typeSet)
        end);

        FUNCTION.onItemUse(function(self,item)
            self:clear("_mat")

            local roleui=
            RoleUI(RuntimeData:getInstance().team):addTo(self,100)
            
            self._mat=roleui

            connect(roleui,"roleBlockTouched",self,function(role)
                if  item:check(role) then
                    item:use(role)
                    self:reflush()
                else
                    roleui:showTips("角色 "..role.name.." 不满足条件无法装备/使用"..item.name)
                end
            end)
            
        end);


        FUNCTION.reflush(function(self)
            self:showWithTypeSet(self._typeSet)  
        end);

        FUNCTION.showTips(function(self,tips)
            if  self._tips==nil then
                self._tips=createLabel("",20)
                :setAnchorPoint(0,0)
                :setPosition(display.cx/4,display.cy*1.8)
                :addTo(self,100)
            end
            self._tips:setString(tips)
        end);

        FUNCTION.getMat(function(self)
            return self._mat
        end);

        FUNCTION.showMenu(function(self,type)
            type=type or "all"
            local textArray=array()
            local callArray=array()

            textArray:push_back("返回")
            --返回
            callArray:push_back(
                function ()
                    self:removeFromParent()
                end
            )
            if type=="all" then 
                textArray:push_back("全部")
                --全部
                callArray:push_back(
                    function ()
                        
                        local s=set({0,1,2,3,4,5,6,7,8,9,10})
                        self:showWithTypeSet(s)
                    end
                )
                textArray:push_back("药品")
                --药品
                callArray:push_back(
                    function ()
                        local s=set({0})
                        self:showWithTypeSet(s)
                    end
                )
                textArray:push_back("装备")
                --装备
                callArray:push_back(
                    function ()
                        
                        local s=set({1,2,3,4})
                        self:showWithTypeSet(s)
                    end
                )
                textArray:push_back("特殊")
                --特殊
                callArray:push_back(
                    function ()
                        
                        local s=set({8,9,10})
                        self:showWithTypeSet(s)
                    end
                )
                textArray:push_back("其他")
                --其他
                callArray:push_back(
                    function ()
                    
                        local s=set({5,6,7})
                        self:showWithTypeSet(s)
                    end
                )
            end
        
            for i,text,call in textArray:zip(callArray) do
                local card=
                CardUI(cc.size(display.cx/4,display.cy/8))
                :setPosition(display.cx/4,display.cy*(2.1-i*0.3))
                :setAnchorPoint(1,1)
                :addTo(self)
                :setText(text)
                card.onTouch=true
                connect(card,"touched",card,call)
            end

        end);

        FUNCTION.setMatUI(function(self,value)
            self._mat=value
        end);
    };

    protected{
        MEMBER._mat;
        MEMBER._tips;
        MEMBER._typeSet;
        MEMBER._dataSource;
        MEMBER._showStr;
    };

}


