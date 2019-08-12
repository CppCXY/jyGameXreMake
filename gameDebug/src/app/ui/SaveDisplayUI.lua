include "app.ui.base.init"
include "app.ui.SelectUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("SaveDisplayUI")
{
    super(cc.Layer);
    super(LUIObject);
    public{
        FUNCTION.SaveDisplayUI(function(self,isSave)
            self=self:__super()
            self:LUIObject()
            self.onTouch=true

            self._current=nil
            local size=cc.Director:getInstance():getVisibleSize()
            
            local card1=
            CardUI(cc.size(display.cx/4,display.cy/8))
            :setAnchorPoint(1,1)
            :setPosition(display.cx/4,display.cy*0.7)
            :addTo(self,10)
            
            card1:setText("返回",25)
            card1.onTouch=true
            connect(card1,"touched",self,"remove");


            local card2=
            CardUI(cc.size(display.cx/4,display.cy/8))
            :setAnchorPoint(1,1)
            :setPosition(display.cx/4,display.cy*1.1)
            :addTo(self,10)
            card2:setText("载入存档",25)
            card2.onTouch=true
            connect(card2,"touched",self,"onLoadSave");

            if isSave then
            local card3=
                CardUI(cc.size(display.cx/4,display.cy/8))
                :setAnchorPoint(1,1)
                :setPosition(display.cx/4,display.cy*1.5)
                :addTo(self,10)
                card3:setText("储存存档",25)
                card3.onTouch=true
                connect(card3,"touched",self,"onSave");
            end

 
            self:setSavesDisplay()
        end);

        FUNCTION.onLoadSave(function(self)
            if self._current==nil then return end
            local id=self._current
            local file=io.open(Path:getInstance().root.save.."save"..id..".lua","r")

            if file then
                file:close()
            else
                return 
            end

            local instance=RuntimeData:getInstance():readSave(id)
            if type(instance.gameVersion)=="string" then
                local name,version=unpack(instance.gameVersion:split("#"))
                if name~=mod.Limit.gameName then
                    self:setTips("当前存档并非当前游戏")
                    return 
                end
                if mod.Limit.checkVersion(version) then
                    RuntimeData:getInstance():loadSaveInstance(instance)
                else
                    self:setTips("存档版本"..name..version..","
                    .."游戏当前版本："..mod.Limit.gameVersion..","
                    .."要求最低版本："..mod.Limit.minVersion..","
                    .."不符合要求无法载入存档")
                end
            else
                self:setTips("未知存档")        
            end

            
            
            
        end);
        FUNCTION.setTips(function(self,str)
            if  self._tips==nil then
                self._tips=createLabel("",20)
                :setAnchorPoint(0,0)
                :setPosition(display.cx/4,display.cy*1.8)
                :addTo(self,100)
            end
            self._tips:setString(str)
        end);

        FUNCTION.onSave(function(self)
            if self._current==nil then  return end
            RuntimeData:getInstance():save(self._current)
            self:remove()
        end);

        FUNCTION.createCellNode(function(self,view,cell)
            self._current=cell:getIdx()+1
            local info=self._saveManager:get("存档"..self._current,{info="空"})
            return createLabel(info.info,20)
        end);

        FUNCTION.onCellTouch(function(self,id)
            self._current=id            
        end);   
        
    };


    protected{
        FUNCTION.getSaveList(function(self)
            local f=io.open(Path:getInstance().root.save.."Manager.lua","r")
            local saves
            if f then
                local g=load(f:read("*all"))
                f:close()
                saves=g()
            else
                f=io.open(Path:getInstance().root.save.."Manager.lua",'w')
                f:write("return {} ")
                f:close()
                saves={}
            end
            local saveArr=array()
            self._saveManager=map(saves)
            for i=1,mod.Limit.maxSaveNum do
                --因为存档可能离散的存储,用整数索引会识别为数组,从而遗漏不连续部分
                local key="存档"..i.."\n"..(saves["存档"..i] and "已存" or "")
                saveArr:push_back(key)
            end
            return saveArr
        end);



        FUNCTION.setSavesDisplay(function(self)
            self:clear("_saveDisplay")

            local saveArray=self:getSaveList()

            local saveDisplay=
            SelectUI(cc.size(display.cx*1.5,display.cy*1.5))
            :addTo(self,100)
            :setPosition(display.cx/4,display.cy/4)

            saveDisplay:setItems(saveArray,function(view,cell)
                return self:createCellNode(view,cell)
            end)

            connect(saveDisplay,"cellSelected",self,"onCellTouch")
            self._saveDisplay=saveDisplay

        end);





    };

    protected{
        MEMBER._current;
        MEMBER._saveDisplay;
        MEMBER._saveManager;
        MEMBER._tips;


    }

}


