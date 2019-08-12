_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"

class("TableView"){
    super(cc.TableView);
    super(LUIObject);
    SINGAL.cellTouched("view","cell","info");
    SINGAL.nodeCreated("view","node");
    property "cellSize" {WRITE.setCellSize};
    public{
        FUNCTION.TableView( function(self,size,direction)
            self=self:__super(size)
            self:LUIObject()
            direction=direction or cc.SCROLLVIEW_DIRECTION_VERTICAL

            self._createFuncArray=array()
            self._toInfoMap=map()
            self._cellSize=cc.size(0,0)

            self:setDirection(direction)
            self:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
            self:setDelegate()
            self:registerScriptHandler(self.numberOfCellInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
            self:registerScriptHandler(self.scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
            self:registerScriptHandler(self.scrollViewDidZoom, cc.SCROLLVIEW_SCRIPT_ZOOM)
            self:registerScriptHandler(self.tableCellTouched, cc.TABLECELL_TOUCHED)
            self:registerScriptHandler(self.cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
            self:registerScriptHandler(self.tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
        end);
        
        FUNCTION.setCellSize(function(self,size)
            self._cellSize=size
            return self
        end);

        FUNCTION.setCreateArray(function(self,createArray)
           self._createFuncArray=createArray
           return self 
        end)
    };

    protected{
        FUNCTION.scrollViewDidScroll(function(self)
        end);
        FUNCTION.scrollViewDidZoom(function(self)
        end);
        FUNCTION.cellSizeForTable(function(self,index)
            return self._cellSize.width,self._cellSize.height
        end);
        
        FUNCTION.tableCellAtIndex(function(self,index)
            local cell = self:dequeueCell()
            local node,info
            if nil == cell then
                cell = cc.TableViewCell:create()
            else
                node=cell:getChildByTag(10)
                if node then
                    node:removeFromParent()
                end
            end
            node,info = self._createFuncArray:at(index+1)()
            self._toInfoMap:insert(index,info)
            self:nodeCreated(self,node)
            node:setTag(10)
            cell:addChild(node)
            return cell    
        end);

        FUNCTION.numberOfCellInTableView(function(self)
            return self._createFuncArray:size()
        end);
   
        FUNCTION.tableCellTouched(function(self,cell)
            local index=cell:getIdx()
            local value=self._toInfoMap:get(index)
      
            self:cellTouched(self,cell,value)    
        end);

    };

    protected{
        MEMBER._createFuncArray;
        MEMBER._cellSize;
        MEMBER._toInfoMap;
    }
}















