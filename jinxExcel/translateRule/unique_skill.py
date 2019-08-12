import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "所属武学" :{"to" : "belongSkill" , "type" : lt.LuaStr },
    "名称" :{"to" : "name" , "type" : lt.LuaStr },
    "简介" :{"to" : "info" , "type" : lt.LuaStr },
    "难度" :{"to" : "info" , "type" : lt.LuaInt },
    "覆盖类型" :{"to" : "coverType" , "type" : lt.LuaInt },
    "施展范围" :{"to" : "castSize" , "type" : lt.LuaInt },
    "覆盖范围" :{"to" : "coverSize" , "type" : lt.LuaInt },
    "增加威力" :{"to" : "poweradd" , "type" : lt.LuaDouble },
    "解锁等级" :{"to" : "requirelv" , "type" : lt.LuaInt },
    "动画" :{"to" : "animation" , "type" : lt.LuaStr },
    "冷却" :{"to" : "cd" , "type" : lt.LuaInt },
    "耗怒" :{"to" : "costball" , "type" : lt.LuaDouble },
    "音效" :{"to" : "audio" , "type" : lt.LuaStr },
    "图标" :{"to" : "icon" , "type" : lt.LuaStr },
    "BUFF" :{"to" : "buff" , "type" : lt.LuaStr },
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "unique_skill",
        #源文件
        "source": ["J技能_绝招.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]