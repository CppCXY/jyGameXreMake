require "app.ui.base.init"
require "app.ui.EditBoxUI"
_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"

class "SettingUI" {
    super(cc.Layer);
    super(LUIObject);
    public{
        FUNCTION.SettingUI(function(self)

            self=self:__super()
            self:LUIObject()
            self:setContentSize(display.cx*2,display.cy*2)
            self.onTouch=true
            self:setBackGround()

            local back=
            createLabel("返回",25)
            :setAnchorPoint(0,0)
            :setPosition(0,0)
            :addTo(self)

            onNodeTouch(back,function()
               self:remove() 
            end)

            if  mod.Limit.openConsole then

                local editUI=
                EditBoxUI(
                    cc.size(display.cx,display.cy/4),
                    Path:getInstance().ui.edit
                    )
                :setAnchorPoint(0,0.5)
                :setPosition(display.cx/4,display.cy*2-50)
                :addTo(self,100)
                :setPlaceHolder("输入控制台命令")

                local editLb=createLabel("控制台",20)
                :addTo(self,100)
                :setAnchorPoint(0,0.5)
                :setPosition(0,display.cy*2-50)

                local ok=createLabel("执行",20)
                :addTo(self,100)
                :setAnchorPoint(1,0.5)
                :setPosition(display.cx*1.5,display.cy*2-50)
                onNodeTouch(ok,function ( )
                    local text=editUI:getText()
                    if text=="" then  return end

                    self:doConsole(text)
                    self:remove()
                end)

            end


            local musicClose=createLabel("关闭音乐",20)
            :addTo(self,100)
            :setAnchorPoint(0,0.5)
            :setPosition(0,display.cy*2-150)

            onNodeTouch(musicClose,function()
                Audio:getInstance():stop()                
            end)

            local musicOpen=createLabel("开启音乐",20)
            :addTo(self,100)
            :setAnchorPoint(0,0.5)
            :setPosition(0,display.cy*2-250)

            onNodeTouch(musicOpen,function()
                Audio:getInstance():resume()                
            end)


        end);
        FUNCTION.doConsole(function(self,text)
            EventManager:getInstance():console(unpack(text:split(" ")))
            
            
        end);


    };



}



