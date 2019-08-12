
_ENV=namespace "mod.Limit"
using_namespace "container"

--最大存档数
maxSaveNum=10
--最大技能等级
maxSkillLevel=20
--最大角色等级
maxRoleLevel=30
--战斗时间限制
battleTotalTime=3000
--是否开启控制台
openConsole=true
--箱子初始数目
wareBaseNum=7
--箱子每周目，增加数目
wareAddNum=3
--游戏标题
title="金庸群侠传X重制版"
--描述
desc=[[——劣质单机开源游戏]]
--mod名称
gameName=[[金x重制]]
--当前版本号
gameVersion="1.0.3"
--兼容最低版本
minVersion="1.0.1"
--版本校验函数，这是为了避免混档，以及如果你对内核代码有修改，就不能用以前的存档了
---@param version string@传入的字符串就是版本号
---@return boolean
function checkVersion(version)
    local tag1,tag2,tag3=unpack(version:split("."))
    tag1=tonumber(tag1) or 1
    tag2=tonumber(tag2) or 0
    tag3=tonumber(tag3) or 0

    local mtag1,mtag2,mtag3=unpack(minVersion:split("."))
    mtag1=tonumber(mtag1) or 1
    mtag2=tonumber(mtag2) or 0
    mtag3=tonumber(mtag3) or 0

    local mxtag1,mxtag2,mxtag3=unpack(gameVersion:split("."))
    mxtag1=tonumber(mxtag1) or 1
    mxtag2=tonumber(mxtag2) or 0
    mxtag3=tonumber(mxtag3) or 0

    local versionNum=(tag1*1000000+tag2*1000+tag3)
    local minVersionNum=(mtag1*1000000+mtag2*1000+mtag3)
    local maxVersionNum=(mxtag1*1000000+mxtag2*1000+mxtag3)
    return versionNum>=minVersionNum 
    and    versionNum<=maxVersionNum
end

function getRoleMaxExp(level)
    return math.ceil(100*math.pow(1.2,level))
end
function getSkillExp(level)
    return math.ceil(50*math.pow(1.3,level))
end

