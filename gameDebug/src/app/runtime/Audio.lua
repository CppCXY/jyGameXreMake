
_ENV=namespace ()
using_namespace "luaClass"
using_namespace "container"

---@class Audio
class("Audio"){
    CLASS_DEBUG(false);
    public{
        STATICFUNC.getInstance(function(cls)
            if  cls.s_instance==nil then
                cls.s_instance=cls()
            end
            return cls.s_instance
        end);
    }
}


function Audio:Audio()
    self.engine=ccexp.AudioEngine
    self.currentMusic=""
    self.currentID=-1
    self.isStop=false
end



---@param musicFilePath string
function Audio:playMusic(musicFilePath)
    if musicFilePath==self.currentMusic or self.isStop==true  then
    return 
    end
    self.currentMusic=musicFilePath
    self:stop()
    self.currentID=self.engine:play2d(musicFilePath,true)

end

function Audio:stop()
    self.isStop=false
    if self.currentID~=-1 then
        self.engine:stop(self.currentID)
    end
end

function Audio:resume()
    self.isStop=true
    self.currentID=self.engine:play2d(self.currentMusic,true)
end