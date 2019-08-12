include "app.ui.base.init"

_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"


class("SelectUI"){
    super(cc.Layer);
    super(LUIObject);
    SINGAL.cellSelected("cellid","cell");
    public{
        FUNCTION.SelectUI(function(self,size)
            self=self:__super()
            self:LUIObject()
            self.onTouch=true
            self._contentSize=size
            self._current=nil
            self._detailCreateFunc=nil
            self._items=nil

            local showSize=cc.size(size.width*0.7,size.height)
            self._detail=
            ScrollView()
            :setPosition(size.width*0.3,0)
            :setAnchorPoint(0,0)
            :addTo(self,10)
            :setContentSize(showSize)
            :setInnerContainerSize(showSize)
            
            self:setBackGround(nil,cc.size(display.cx*1.5,display.cy*1.5))

        end);

        FUNCTION.setItems(function(self,itemArray,detailCreateFunc)
            self:clearSelect()
            local contentSize=self._contentSize
            self._detailCreateFunc=detailCreateFunc
            local createFuncs=array()

            for index,textItem in itemArray:iter() do
                createFuncs:push_back(
                function ()
                    local lb= createLabel(textItem, 18)
                    lb:setAnchorPoint(0.5,0.5)
                    lb:setWidth(contentSize.width/4)
                    lb:setPosition(contentSize.width/8,50)
                    return lb
                end)
            end
        
            local tbv=TableView(cc.size(contentSize.width*0.25,contentSize.height))
            
            tbv:setCellSize(cc.size(contentSize.width*0.25,100))
            :addTo(self,20)
            :setCreateArray(createFuncs)
            :setPosition(0,0)
            :reloadData()

            self._items=tbv

            connect(tbv,"cellTouched",self,"onItemTouched")
 
        end);


        FUNCTION.onItemTouched(function(self,view,cell)
            local node=self._detailCreateFunc(view,cell)
            node:setAnchorPoint(0,1)

            self:cellSelected(cell:getIdx()+1,cell)
            self._current=cell
            self._detail:setInnerNode(node)
            
        end);

        FUNCTION.refresh(function(self)
            self:onItemTouched(self._items,self._current)
        end);


    };


    protected{
        FUNCTION.clearSelect(function(self)
            if  self._items then
                self._items:removeFromParent()
                self._items=nil
            end
        end);

        FUNCTION.clearDetail(function(self)
            if  self._detail then
                self._detail:removeFromParent()
                self._detail=nil
            end
        end);


        
    };

    protected{
        MEMBER._contentSize();
        MEMBER._current();
        MEMBER._detailCreateFunc();
        MEMBER._items();
        MEMBER._detail();
    };
}
