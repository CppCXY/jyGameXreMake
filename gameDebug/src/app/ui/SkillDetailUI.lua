include "app.ui.base.init"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

class("SkillDetailUI"){
    super(cc.Node);
    super(LUIObject);
    SINGAL.skillUsed("skill","cardUI");
    public{
        FUNCTION.SkillDetailUI(function(self,skill,contentSize)
            self=self:__super()
            self:LUIObject()

            self._skill=skill
            self._contentSize=contentSize
            self:setContentSize(contentSize)

            local detail=createBlock(contentSize)
            :setPosition(0,0)
            :setAnchorPoint(0,0)
            :addTo(self)

            local textNode=createLabel(skill:toString(),18)
            :setWidth(contentSize.width)
            :setTag(998)

            local head=cc.Sprite:create(skill.picPath)
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

     
            local textArray=array()
            local callArray=array()

            textArray:push_back(self._skill.equipped and "可用"  or "禁用")
            textArray:push_back("返回")
            local skill=self._skill
            callArray:push_back(function(_,_,card)
                self:skillUsed(skill,card)
            end)
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
        MEMBER._contentSize();
        MEMBER._skill();


    }

}





