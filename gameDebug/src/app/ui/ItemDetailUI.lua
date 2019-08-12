include "app.ui.base.init"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

class("ItemDetailUI"){
    super(cc.Node);
    super(LUIObject);
    SINGAL.itemUsed("item");
    public{
        FUNCTION.ItemDetailUI(function(self,item,contentSize,showStr)
            self=self:__super()
            self:LUIObject()
            self._showStr=showStr
            self._item=item
            self._contentSize=contentSize
            self:setContentSize(contentSize)

            local detail=createBlock(contentSize)
            :setPosition(0,0)
            :setAnchorPoint(0,0)
            :addTo(self)

            local textNode=createLabel(item:toString(),18)
            :setWidth(contentSize.width)
            :setTag(998)

            local head=cc.Sprite:create(item.picPath)
            :setAnchorPoint(1,1)
            :setPosition(contentSize.width,0)
            :setContentSize(contentSize.width/3,contentSize.height/3)
            :setTag(100)

            local scrollView=
            ScrollView()
            :setContentSize(contentSize)
            :setPosition(0,0)
            :setInnerNode(textNode)
            :addNode(head)
            :addTo(detail)
        end);
        
        FUNCTION.showMenu(function(self)
            local item=self._item
            local textArray=array()
            local callArray=array()
            if self._showStr then
                textArray:push_back(self._showStr)
                callArray:push_back(function()
                    self:itemUsed(item)
                end)
            else
                if item.type==1
                or item.type==2
                or item.type==3
                or item.type==4 then
                    textArray:push_back("装备")
                    callArray:push_back(function()
                        self:itemUsed(item)
                    end)
                elseif item.type==8 then
                    textArray:push_back("使用")
                    callArray:push_back(function()
                        self:itemUsed(item)
                    end)
                end
            end
            
            textArray:push_back("返回")
            --返回
            callArray:push_back(function()
                self:remove()
            end)

            return self:setMenu(textArray,callArray)
        end);

        FUNCTION.setMenu(function(self,textArray,callArray)
            local contentSize=self._contentSize
            for index,text,callBack in textArray:zip(callArray) do
                local card=
                CardUI(cc.size(contentSize.width/4,contentSize.height/8))
                :setAnchorPoint(0,1)
                :addTo(self)
                :setPosition(contentSize.width,contentSize.height-((index-1)*contentSize.height/6))
                :setText(text,20)
                card.onTouch=true
                connect(card,"touched",card,callBack)
            end   
            return self 
        end)
    };

    protected{
        MEMBER._contentSize;
        MEMBER._item;
        MEMBER._showStr;

    }

}





