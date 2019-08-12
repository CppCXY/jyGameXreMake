import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "技能名" :{"to" : "name" , "type" : lt.LuaStr },
    "描述" :{"to" : "info" , "type" : lt.LuaStr },
    "覆盖类型" :{"to" : "coverType" , "type" : lt.LuaInt },
    "施展范围" :{"to" : "castSize" , "type" : lt.LuaInt },
    "覆盖范围" :{"to" : "coverSize" , "type" : lt.LuaInt },
    "音效" :{"to" : "audio" , "type" : lt.LuaStr },
    "动画" :{"to" : "animation" , "type" : lt.LuaStr },
    "耗内" :{"to" : "costMp" , "type" : lt.LuaInt },
    "冷却" :{"to" : "cd" , "type" : lt.LuaInt },
    "耗怒" :{"to" : "costball" , "type" : lt.LuaInt },
    "是否对自己释放" :{"to" : "hitself" , "type" : lt.LuaBool },
    "图标" :{"to" : "icon" , "type" : lt.LuaStr },
    "buff" :{"to" : "buff" , "type" : lt.LuaStr },
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "special_skill",
        #源文件
        "source": ["J技能_特殊攻击.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]