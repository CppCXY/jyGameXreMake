_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("MessageUI"){
    super(cc.Layer);
    super(LUIObject);

    public{
        FUNCTION.MessageUI(function(self,contentSize)
            self=self:__super()
            self:LUIObject()
            self.showNode=nil
            self:setContentSize(contentSize)
            self.onTouch=true
            self:setBackGround()
            
            local back=createLabel("返回",20,cc.RED)
            :setAnchorPoint(1,1)
            :setPosition(contentSize.width,contentSize.height)
            :addTo(self,998)

            onNodeTouch(back,function()
                self:remove()
            end)
        end);

        FUNCTION.showMessage(function(self,message)
            self:clear("showNode")
            local messagelb=
            createLabel(message,20)
            :setPosition(display.cx/2,display.cy/2)
            :setAnchorPoint(0.5,0.5)
            :setWidth(display.cx)
            :addTo(self,10)

            self.showNode=nil
        end);

        FUNCTION.showInputBox(function(self,titileStr,okStr,onOkCall)
            self:clear("showNode")
            self.showNode=cc.Node:create():addTo(self)

            local title=createLabel(titileStr,20)
            :addTo(self.showNode,100)
            :setAnchorPoint(0.5,0.5)
            :setPosition(display.cx/2,display.cy*3/4)

            local editUI=
            EditBoxUI(cc.size(display.cx,display.cy/4),
            Path:getInstance().ui.edit)
            :setPosition(display.cx/2,display.cy/2)
            :addTo(self.showNode,100)
            
            local ok=createLabel(okStr,20)
            :addTo(self.showNode,100)
            :setAnchorPoint(0.5,0.5)
            :setPosition(display.cx/2,display.cy/4)
            
            onNodeTouch(ok,function ( )
                local text=editUI:getText()
                if onOkCall(text,editUI) then
                    editUI:removeFromParent()
                    ok:removeFromParent()
                end
            end)
        
        end);

        MEMBER.showNode();
        
    }


}









