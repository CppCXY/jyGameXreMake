_ENV= namespace "ui"
using_namespace "luaClass"
class "Sprite" {
    super(cc.Sprite,ui.LUIObject);
    public{
        FUNCTION.Sprite(function(self,imagePath)
            self=self:__super(imagePath)
            self:LUIObject()
        end)
    }
}

class "Menu" {
    super(cc.Menu,ui.LUIObject);
    public{
        FUNCTION.Menu(function(self)
            self=self:__super()
            self:LUIObject()
        end)
    }
}

class "Label" {
    super(LUIObject);
    super(function(text,fontSize,color)
        local notOutline=false
        local fontPath= Path:getInstance().font.default
        local color=color or cc.c3b(255, 255, 255)
        local lb = cc.Label:createWithTTF(text, fontPath, fontSize)
        lb:setColor(color)
        if not notOutline then
            lb:enableOutline(cc.c4b(0, 0, 0, 255), 1)
            lb:enableShadow(cc.c3b(0, 0, 0), cc.size(0, -2), 1)
        end
        return lb
    end);
    property "text" {WRITE.setString};

    public{
        FUNCTION.Label(function(self,text,fontSize,color)
            text=text or ""
            fontSize=fontSize or 20
            self=self:__super(text,fontSize,color)

            self:LUIObject();
        end)

    };
}


class "Rectangle" {
    super(LUIObject);
    super(cc.DrawNode);

    public{
        FUNCTION.Rectangle(function(self,size,color)
            self=self:__super()
            self:LUIObject()
            
            local pointArr={
                cc.p(0,0),
                cc.p(size.width,0),
                cc.p(size.width,size.height),
                cc.p(0,size.height)
            }
            local fill=color or cc.c4f(0,0,0,0.6)
            self:drawPolygon(pointArr,4,fill,2,fill)
            self:setContentSize(size)
            
        end);

    }





}