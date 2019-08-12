_ENV=namespace "mod.BattleFieldExtend"

local visibleSize=cc.Director:getInstance():getVisibleSize()
--战场x方向块数
blockX=15
--战场y方向块数
blockY=7
--每个战场选择块的边长
edgeLen=70

battleFieldBeginPoint=cc.p(display.cx/4,display.cy/3)
