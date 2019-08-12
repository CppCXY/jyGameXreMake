_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("DropList"){
    super(cc.Menu);
    super(LUIObject);

    public{
        FUNCTION.DropList(function(self,defaultText,textArray,callBackArray,fontSize,anchor,color)
            self=self:__super()
            self:LUIObject()
            fontSize=fontSize or 20
            self:setAnchorPoint(anchor);
            self._textArray=textArray
            self._callBackArray=callBackArray
            self._labelArray=array()
            self._isOpen=false
            self._fontSize=fontSize
            self._color=color
        
            self:setText(defaultText,function()
                if  self:isOpen() then
                    self:close()
                else
                    self:open()
                end
            end,0,fontSize,color)

        end);

        FUNCTION.open(function(self)
            self._isOpen=true
            self:setDropTextMenu()
        end);

        FUNCTION.close(function(self)
            self._isOpen=false
            for i,label in self._labelArray:iter() do
                label:removeFromParent()
            end
            self._labelArray:clear()
        end);

        FUNCTION.isOpen(function(self)
            return self._isOpen
        end);

    };

    protected{
        FUNCTION.setText(function(self,text,callBack,index,fontSize,color)
            local label=cc.MenuItemLabel:create(createLabel(text,fontSize,color))
            label
            :setAnchorPoint(self:getAnchorPoint())
            :setPosition(0,-index*(fontSize*1.5))
            :addTo(self,10)
            :registerScriptTapHandler(callBack)
            
            
            return label
        end);

        FUNCTION.setDropTextMenu(function(self)
            for index,text,callBack in self._textArray:zip(self._callBackArray) do
                local label=self:setText(text,callBack,index,self._fontSize,self._color)
                self._labelArray:push_back(label)
            end
        end);



    };

    protected{
        MEMBER._textArray();
        MEMBER._callBackArray();
        MEMBER._labelArray();
        MEMBER._isOpen();
        MEMBER._fontSize();
        MEMBER._color();
    };


}









