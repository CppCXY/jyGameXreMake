_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"

class("ScrollView"){
    super(ccui.ScrollView);
    super(LUIObject);
    property "innerSize" {WRITE.setInnerContainerSize};
    public{
        FUNCTION.ScrollView(function(self)
            self=self:__super()
            self:LUIObject()
            self.onTouch=true
            self._innerNode=nil
            self:setTouchEnabled(true)  
            self:setScrollBarPositionFromCorner(cc.p(2,2)) 
        end);

        FUNCTION.setInnerNode(function(self,node)
            if  self._innerNode then
                self._innerNode:removeFromParent();
                self._innerNode=nil
            end
            
            local layer=ccui.Layout:create()
            layer:addChild(node,998)
            node:setAnchorPoint(0,1)
            self:addChild(layer)

            local innerSize=self:getInnerContainerSize()
            local nodeSize=node:getContentSize()
            innerSize.width=innerSize.width> nodeSize.width 
            and innerSize.width or nodeSize.width
            innerSize.height=innerSize.height> nodeSize.height 
            and innerSize.height or nodeSize.height
            self:setInnerContainerSize(innerSize)
            layer:setPosition(0,innerSize.height)
            self._innerNode=layer
            return self
        end);

        FUNCTION.addNode(function(self,node)
            self._innerNode:addChild(node,0) 
            return self
        end)

    };

    protected{
        MEMBER._innerNode();

    };

}

