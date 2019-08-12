_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
using_namespace "ENUM"
---@class BattleFieldManager
class("BattleFieldManager"){
    CLASS_DEBUG(false);
}

function BattleFieldManager:BattleFieldManager(beginPoint,xNum,yNum,edgeLength)
    self.xNum=xNum
    self.yNum=yNum
 
    --创建战场矩阵

    local _mat=mat(xNum,yNum)
    for i=1,xNum do
        for j=1,yNum do 
            _mat:set(i,j,
            cc.p(
                beginPoint.x+(i-1)*edgeLength,
                beginPoint.y+(j-1)*edgeLength
                )
            )
               
        end
    end
    self.mat=_mat
 
end

function BattleFieldManager:inField(x,y)
    return  ((x<=self.xNum and x>=1)
    and (y<=self.yNum and y>=1))
end

function BattleFieldManager:getPointArray(ability,sDir)
    sDir=sDir or SKILL_DIRECTION.ALL
    local newArray=array()
    local abs=math.abs
    --这并不是标准lua函数库
    ability=math.round(ability)
    if sDir==SKILL_DIRECTION.ALL then
        for i=-ability,ability do
            for j=-ability,ability do
                if  (abs(i)+abs(j))<=ability then
                    newArray:push_back(cc.p(i,j))
                end
            end
        end
    elseif sDir==SKILL_DIRECTION.JIAN_LEFT then
        for i=-ability,0 do
            if  abs(i)<=ability then
                newArray:push_back(cc.p(i,0))
            end
        end
    elseif sDir==SKILL_DIRECTION.JIAN_LOWWER then
        for i=-ability,0 do
            if  abs(i)<=ability then
                newArray:push_back(cc.p(0,i))
            end
        end
    elseif sDir==SKILL_DIRECTION.JIAN_RIGHT then
        for i=0,ability do
            if  abs(i)<=ability then
                newArray:push_back(cc.p(i,0))
            end
        end
    elseif sDir==SKILL_DIRECTION.JIAN_UPPER then
        for i=0,ability do
            if  abs(i)<=ability then
                newArray:push_back(cc.p(0,i))
            end
        end
    elseif sDir==SKILL_DIRECTION.DAO_LEFT_RIGHT then
        for i=-ability,ability do
            if  abs(i)<=ability then
                newArray:push_back(cc.p(i,0))
            end
        end
    elseif sDir==SKILL_DIRECTION.DAO_UP_DOWN then
        print(ability)
        for i=-ability,ability do
            if  abs(i)<=ability then
                newArray:push_back(cc.p(0,i))
            end
        end

    end
    return newArray
end























