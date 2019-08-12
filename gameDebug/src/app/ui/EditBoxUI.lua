_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("EditBoxUI"){
    super(ccui.EditBox);
    super(LUIObject);

    SINGAL.editBox("eventType","sender");

    public{
        FUNCTION.EditBoxUI(function(self,size,backPath)
            local sp9s=cc.Scale9Sprite:create(backPath)
            self=self:__super(size,sp9s)
            self:LUIObject()

            self:setAnchorPoint(cc.p(0.5,0.5))
            self:setFontSize(26)
            self:setFontColor(cc.c3b(255,255,255))
            self:setReturnType(cc.KEYBOARD_RETURNTYPE_SEND )
            self:setInputMode(cc.EDITBOX_INPUT_MODE_ANY) 
            self:setPlaceHolder("请输入文本")
            self:registerScriptEditBoxHandler(function(eventname,sender) 
                self:editBox(eventname,sender) 
            end) 
        end);



    }



}


