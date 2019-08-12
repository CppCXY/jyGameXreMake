include "app.ui.base.init"
include "app.ui.SkillDetailUI"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
using_namespace "uis"

class("RoleDetailUI"){
    super(cc.Layer);
    super(LUIObject);
    SINGAL.destroyed();

    public{
        FUNCTION.RoleDetailUI(function(self,role,isAlter)
            self=self:__super()
            self:LUIObject()
            self.onTouch=true
            self._role=role
            if  isAlter==nil then 
                isAlter=true 
            end
            self._isAlter=isAlter 
            self:load(RoleDetailScript)
            self:setParams("desc",{
                role:toString("info")
            })
            self:setParams("head",{
                role.picPath
            })

            self:implement()

            onNodeTouch(self:find("back"),function()
                self:remove()  
            end,true)

            connect(self:find("property"),"touched",self,"lookProperty")
            connect(self:find("equipment"),"touched",self,"lookEquipment")
            connect(self:find("skill"),"touched",self,"lookSkill")
            connect(self:find("talent"),"touched",self,"lookTalent")
            connect(self:find("story"),"touched",self,"lookStory")
            connect(self:find("propertyPoint"),"touched",self,"lookPropertyPoint")
            connect(self:find("update"),"touched",self,"updateRole")
        end);
        FUNCTION.updateRole(function(self)
            if  self._role then
                self._role.isDirty=true
            end
            self:reflush()
            self:clear("_detail")
        end);

        FUNCTION.reflush(function(self)
            if self._role.isDirty then
                self:find("desc"):setString(self._role:toString("info"))
            end
        end);


        FUNCTION.lookProperty(function(self)
            self:reflush()
            self:clear("_detail")

            self._detail=ScrollView()
            :setContentSize(cc.size(display.cx,display.cy))
            :setPosition(display.cx/2,0)
            :addTo(self:find("rectBlock"),100)
            :setInnerNode(
                createLabel(self._role:toString("attribute"),20)
            )
            
        end);
        FUNCTION.lookPropertyPoint(function(self)
            self:reflush()
            self:clear("_detail")
            local node=cc.Node:create()
            :setPosition(display.cx/2,0)
            :addTo(self:find("rectBlock"),100)
            self._detail=node
            ---@type Role
            local role=self._role
            local propertyPoint=createLabel("属性点: "..role.propertyPoint,20)
            :addTo(node)
            :setPosition(display.cx,display.cy)
            :setAnchorPoint(1,1)

            local fuyuanLb=createLabel("增加福源："..role.fuyuan,20)
            :addTo(node)
            :setPosition(0,display.cy*4/5)
            :setAnchorPoint(0,1)
            onNodeTouch(fuyuanLb,function()
                if  role.propertyPoint>0 then
                    role.fuyuan=role.fuyuan+1
                    role.propertyPoint=role.propertyPoint-1
                    fuyuanLb:setString("增加福源："..role.fuyuan)
                    propertyPoint:setString("属性点: "..role.propertyPoint)
                end
            end)
            

            local dingliLb=createLabel("增加定力："..role.dingli,20)
            :addTo(node)
            :setPosition(0,display.cy*3/5)
            :setAnchorPoint(0,1)
            onNodeTouch(dingliLb,function()
                if  role.propertyPoint>0 then
                    role.dingli=role.dingli+1
                    role.propertyPoint=role.propertyPoint-1
                    dingliLb:setString("增加定力："..role.dingli)
                    propertyPoint:setString("属性点: "..role.propertyPoint)
                end
            end)

            local genguLb=createLabel("增加根骨："..role.gengu,20)
            :addTo(node)
            :setPosition(0,display.cy*2/5)
            :setAnchorPoint(0,1)
            onNodeTouch(genguLb,function()
                if  role.propertyPoint>0 then
                    role.gengu=role.gengu+1
                    role.propertyPoint=role.propertyPoint-1
                    genguLb:setString("增加根骨："..role.gengu)
                    propertyPoint:setString("属性点: "..role.propertyPoint)
                end
            end)

            local biliLb=createLabel("增加臂力："..role.bili,20)
            :addTo(node)
            :setPosition(display.cx,display.cy*4/5)
            :setAnchorPoint(1,1)
            onNodeTouch(biliLb,function()
                if  role.propertyPoint>0 then
                    role.bili=role.bili+1
                    role.propertyPoint=role.propertyPoint-1

                    biliLb:setString("增加臂力："..role.bili)
                    propertyPoint:setString("属性点: "..role.propertyPoint)
                end
            end)

            local shenfaLb=createLabel("增加身法："..role.shenfa,20)
            :addTo(node)
            :setPosition(display.cx,display.cy*3/5)
            :setAnchorPoint(1,1)
            onNodeTouch(shenfaLb,function()
                if  role.propertyPoint>0 then
                    role.shenfa=role.shenfa+1
                    role.propertyPoint=role.propertyPoint-1
                    shenfaLb:setString("增加身法："..role.shenfa)
                    propertyPoint:setString("属性点: "..role.propertyPoint)
                end
            end)

            local wuxingLb=createLabel("增加悟性："..role.wuxing,20)
            :addTo(node)
            :setPosition(display.cx,display.cy*2/5)
            :setAnchorPoint(1,1)
            onNodeTouch(wuxingLb,function()
                if  role.propertyPoint>0 then
                    role.wuxing=role.wuxing+1
                    role.propertyPoint=role.propertyPoint-1
                    wuxingLb:setString("增加悟性："..role.wuxing)
                    propertyPoint:setString("属性点: "..role.propertyPoint)
                end
            end)
        end);

        FUNCTION.lookSkill(function(self)
            self:reflush()
            self:clear("_detail")
            local skills=self._role:getAllSkills()
            
            local colNum=4
            local contentSize=cc.size(display.cx,display.cy)
            
            local elemsetting=function (card,skill,cellWidth,cellHeight)
                local path=skill.picPath
                local sprite=
                cc.Sprite:create(path)
                :setPosition(0,0)
                :setAnchorPoint(0,0)
                :setContentSize(cellWidth*0.6,cellWidth*0.6)
                :addTo(card)

                local name=createLabel(skill.name,18)

                name:setAnchorPoint(0,1)
                name:setPosition(cellWidth*0,cellHeight*0.85)

                card:addChild(name)
 
                local lv=createLabel(
                    skill.level.."/"..skill.maxlevel,18)
                lv:setAnchorPoint(1,0)
                lv:setPosition(cellWidth*0.9,cellHeight*0)

                card:addChild(lv)

                local eq=createLabel(skill.equipped and "E" or "",18,cc.GREEN)
                eq:setAnchorPoint(0,0)
                eq:setPosition(0,0)

                card:addChild(eq)

            end
            
            local matUI=MatUI(contentSize,skills,colNum,nil,elemsetting)
            :setPosition(display.cx/2,0)
            :setAnchorPoint(0,0)
            :addTo(self:find("rectBlock"),100)
            self._detail=matUI
            if self._isAlter then
                connect(matUI,"elemTouched",self,"showSkillDetail")
            end


        end);

        FUNCTION.lookEquipment(function(self)
            self:reflush()
            self:clear("_detail")

            local layer=cc.Layer:create()
            :setContentSize(cc.size(display.cx,display.cy))
            :setPosition(display.cx/2,0)
            :addTo(self:find("rectBlock"))
            self._detail=layer            
            local showTable=array( {
                {name="weapon",posName="武器",pos=cc.p(display.cx/4,display.cy*0.75),item=self._role:getEquipment(1),type=1},
                {name="arms",posName="防具",pos=cc.p(display.cx*0.75,display.cy*0.75),item=self._role:getEquipment(2),type=2},
                {name="decorate",posName="饰品",pos=cc.p(display.cx/4,display.cy/4),item=self._role:getEquipment(3),type=3},
                {name="special",posName="特殊",pos=cc.p(display.cx*0.75,display.cy/4),item=self._role:getEquipment(4),type=4},
            })

            for _,tab in showTable:iter() do
                local card=
                CardUI(cc.size(display.cx/3,display.cy/3))
                :setAnchorPoint(0.5,0.5)
                :setPosition(tab.pos)
                :addTo(layer)

                card.onTouch=true
                if tab.item then
                    local pic=
                    cc.Sprite:create(tab.item.picPath)
                    :setAnchorPoint(1,0)
                    :setPosition(display.cx/3,0)
                    :setContentSize(display.cy/4,display.cy/4)
                    :addTo(card)

                    local name=
                    createLabel(tab.item.name,20)
                    :setAnchorPoint(1,1)
                    :setPosition(display.cx/3,display.cy/3)
                    :addTo(card)
                end
                local id=
                createLabel(tab.posName,20)
                :setAnchorPoint(0,0)
                :setPosition(0,0)
                :addTo(card)
                if self._isAlter then
                    connect(card,"touched",card,function()
                        self:showItemUI(tab.item,tab.type)
                    end)
                end
            end

        end);

        FUNCTION.showItemUI(function(self,item,type)
            --self:find("rectBlock"):setVisible(false)
            if  item then 
                self:showItemDetail(item)
            else
                self:showItemAlter(item,type)
            end
        
        
        end);

        FUNCTION.showItemAlter(function(self,item,type)
            local itemUI=
            ItemUI(set({type}))
            :addTo(self,999)
            itemUI:showMenu("back")
            itemUI:setBackGround(self._backGroundPath)
            itemUI.itemUsed:clear()
            connect(itemUI,"itemUsed",itemUI,function(item)
                ---@type Role
                local role=self:getRole()
                if  item:check(role) then
                    
                                        
                    local oldItem=role:getEquipment(type)
                    if oldItem then
                        RuntimeData:getInstance():addItem(oldItem)
                    end
                    role:addEquipment(item)
                    item:remove()
                    itemUI:remove()
                    self:find("rectBlock"):setVisible(true)
                    self:lookEquipment()
                else
                    itemUI:showTips("不行啊,不能换上装备 "..item.name)
                    
                end
            
            
            end);            
            
            
        end);

        FUNCTION.lookTalent(function(self)
            self:clear("_detail")
            local talent=createLabel(self._role:toString("talent"),20)
            talent:setWidth(display.cx)
            self._detail=
            ScrollView()
            :setContentSize(cc.size(display.cx,display.cy))
            :addTo(self:find("rectBlock"))
            :setPosition(display.cx/2,0)
            :setInnerNode(
                talent
            )

        end);

        FUNCTION.lookStory(function(self)
            self:clear("_detail")
            local story=createLabel(self._role.story,20)
            story:setWidth(display.cx)
            self._detail=
            ScrollView()
            :setContentSize(cc.size(display.cx,display.cy))
            :setPosition(display.cx/2,0)
            :addTo(self:find("rectBlock"))
            :setInnerNode(
                story
            )
        end);

        FUNCTION.getDetail(function(self)
            return self._detail
        end);

        FUNCTION.getRole(function(self)
            return self._role
        end);

        FUNCTION.showItemDetail(function(self,item)
            self:find("rectBlock"):setVisible(false)
            local itemDetail=
            ItemDetailUI(item,cc.size(display.cx*0.7,display.cy*1.2))
            :setAnchorPoint(0.5,0.5)
            :setPosition(display.cx,display.cy)
            :addTo(self,1000)
            local textArray=array({"更换","卸载","返回"})
            local callArray=array()
        
            
            callArray:push_back(function ()
                itemDetail:remove()
                self:find("rectBlock"):setVisible(true)
                self:showItemAlter(item,item.type)
            end)

            callArray:push_back(function ()
                self:find("rectBlock"):setVisible(true)
                itemDetail:remove()
                RuntimeData:getInstance():addItem(item)
                self:getRole():removeEquipment(item.type)
                self:lookEquipment()
            end)

            callArray:push_back(function (node)
                self:find("rectBlock"):setVisible(true)
                itemDetail:remove()
            end)
            
            itemDetail:setMenu(textArray,callArray)
        
        
        end);
        FUNCTION.showSkillDetail(function(self,skill)
            self:find("rectBlock"):setVisible(false)
            local skillDetail=
            SkillDetailUI(skill,cc.size(display.cx*0.7,display.cy*1.2))
            :setAnchorPoint(0.5,0.5)
            :setPosition(display.cx,display.cy)
            :addTo(self,1000)
            :showMenu()
            
            connect(skillDetail,"skillUsed",skillDetail,function(skill,card)
                skill.equipped=not skill.equipped    
                self._role.isDirty=true
                card:setText(skill.equipped and "可用" or "禁用" )
                if skill.equipped and skill:is(InternalSkill) then
                    self._role:setInternalSkill(skill)      
                               
                end
            end);

            connect(skillDetail,"destroyed",skillDetail,function()
                self:find("rectBlock"):setVisible(true)
                if self._role.isDirty then
                    self:lookSkill()
                end
            end);

        end);
    };
    protected{
        MEMBER._detail();
        MEMBER._role();
        MEMBER._isAlter();
    }

}























