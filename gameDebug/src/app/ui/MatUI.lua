include "app.ui.base.RectCardUI"
_ENV=namespace "ui"
using_namespace "luaClass"
using_namespace "container"
using_namespace "game"
class("MatUI"){
    super(cc.Sprite);
    super(LUIObject);
    SINGAL.elemTouched("item");

    public{
        MEMBER.colNum;
        MEMBER.rowNum;
    };
    public{
        FUNCTION.MatUI(function
            (self,contentSize,dataSource,
            colNum,rowNum,elemSetting,cardClass)

            self=self:__super()
            self:LUIObject()
            self:setContentSize(contentSize)
            local size=dataSource:size()
            
            cardClass=cardClass or CardUI
 
            self.colNum=colNum
            self.rowNum=rowNum
            local cellWidth=contentSize.width/colNum
            local cellHeight=rowNum and  contentSize.height/rowNum  or cellWidth
            local elemSize=cc.size(cellHeight*0.75,cellHeight*0.75)
 
            self._mat=array()
            local arr=array()
            local count=0

            for _,item in dataSource:iter() do
                count=count+1
                arr:push_back(item)
                if count>=colNum then
                    self._mat:push_back(arr)
                    arr=array()
                    count=0
                end
            end

            if not arr:empty() then
                self._mat:push_back(arr)
            end
        
            local createArray=array()
            for row,rowArray in self._mat:iter() do
                createArray:push_back(
                    function()
                        local node=cc.Node:create()
                        node:setAnchorPoint(0,0)
                        node:setContentSize(cc.size(colNum*cellWidth,cellHeight))
                        for index,showItem in rowArray:iter() do
                            
                            local card=
                            cardClass(cc.size(cellWidth*0.9,cellHeight*0.8))
                            :setAnchorPoint(0,1)
                            :setPosition(cellWidth*(index-1),cellHeight)
                            :addTo(node,998)
                            
                            elemSetting(card,showItem,cellWidth,cellHeight)
                            card.onTouch=true
                            connect(card,"touched",card,function()
                                self:elemTouched(showItem,card)
                            end)
                        end
                        return node
                    end
                    )
            end
            TableView(contentSize)
            :setCellSize(cc.size(colNum*cellHeight,cellHeight*1.2))
            :setPosition(0,0)
            :addTo(self)
            :setCreateArray(createArray)
            :reloadData()
         
        end);



    };

    protected{
        MEMBER._mat;


    }


}



