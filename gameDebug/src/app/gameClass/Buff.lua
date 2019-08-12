_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"

---@class Buff
---@field public name string
---@field public level number
---@field public round number
class("Buff"){
    CLASS_DEBUG(false);
    property "level" {WRITE.setLevel;READ.getLevel;};

}


function Buff:Buff(buffName,buffLevel,buffRound,buffProb)
    self.name=buffName
    self.round=buffRound
    self.prob=buffProb or 1
    self._level=buffLevel
end

function Buff:onResult(result)
    mod.BuffExtend.buffRunForBattleSpriteExtend(self,result)
end

function Buff:getLevel()
    return self._level
end

function Buff:isDebuff()
    return mod.BuffExtend.debuffList:has(self.name)
end

function Buff:setLevel(level)
    if self.sprite then
        self:removeTmpEffect()
        self._level=level
        self:getTmpEffect()
    else
        self._level=level
    end

end

function Buff:getTmpEffect()
    if self.sprite then
        local tmp={}
        mod.BuffExtend.buffTmpExtend(self,tmp)
        self.tmpEffectTable=tmp
        for key,value in pairs(self.tmpEffectTable) do
            local old=self.sprite[key]
            if type(old)=="number" then
                self.sprite[key]=old+value
            else
                print("buff  error: unkown property name :",key)
            end
        end
    end
end

function Buff:removeTmpEffect()
    if self.sprite then
        for key,value in pairs(self.tmpEffectTable) do
            self.sprite[key]=self.sprite[key]-value
        end
    end
end

function Buff:bindSprite(sprite)
    self.sprite=sprite
    self.tmpEffectTable={}
    self:getTmpEffect()
end

function Buff:toString()
    return string.format("%s 等级: %i 回合: %i",
        self.name,self.level,self.round)
end

return Buff