import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "物品名" :{"to" : "name" , "type" : lt.LuaStr },
    "描述" :{"to" : "desc" , "type" : lt.LuaBlockStr },
    "图片" :{"to" : "pic" , "type" : lt.LuaStr },
    "类型" :{"to" : "type" , "type" : lt.LuaInt },
    "物品等级" :{"to" : "level" , "type" : lt.LuaInt },
    "贩卖价格" :{"to" : "price" , "type" : lt.LuaInt },
    "是否掉落" :{"to" : "drop" , "type" : lt.LuaBool },
    "投掷范围" :{"to" : "castSize" , "type" : lt.LuaInt },
    "覆盖范围" :{"to" : "coverSize" , "type" : lt.LuaInt },
    "冷却" :{"to" : "cd" , "type" : lt.LuaInt },
    "天赋" :{"to" : "talent" , "type" : lt.LuaStr },
    "extend1":rt.ExtendRule(1,4,"trigger","效果ID[index]","效果值[index]",{
            "效果ID[index]": {"to" : "name" ,"type" : lt.LuaStr},
            "效果值[index]": {"to" : "argvs" ,"type" : lt.LuaStr},
    }),
    "extend2":rt.ExtendRule(1,4,"need","需求ID[index]","需求值[index]",{
            "需求ID[index]": {"to" : "name" ,"type" : lt.LuaStr},
            "需求值[index]": {"to" : "argvs" ,"type" : lt.LuaStr},
    }),

})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "item",
        #源文件
        "source": ["W物品.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("装备" , RULES),
            ("秘籍" , RULES),
            ("药品" , RULES),
            ("其他" , RULES),
        ]    
    }

]