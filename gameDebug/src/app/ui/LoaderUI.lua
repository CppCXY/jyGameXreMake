
_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"

class("LoaderUI"){
    super(cc.ProgressTimer);
    super(LUIObject);

    public{
        FUNCTION.LoaderUI(function(self,imgPath)
            self=self:__super(cc.Sprite:create(imgPath))
            self:LUIObject()

            
            self:setType(cc.PROGRESS_TIMER_TYPE_BAR)

            self:setMidpoint(cc.p(0, 0))

            self:setBarChangeRate(cc.p(1, 0))

            
        end);

        FUNCTION.loadTo(function(self,per)
            local to = cc.ProgressTo:create(0.5, per)
            self:runAction(to)
            return self
        end);

    };

}
