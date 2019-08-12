import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "名称" :{"to" : "name" , "type" : lt.LuaStr },
    "增加伤害" :{"to" : "addPower" , "type" : lt.LuaDouble },
    "起始招式" :{"to" : "start" , "type" : lt.LuaStr },
    "等级" :{"to" : "level" , "type" : lt.LuaInt },
    "发动概率" :{"to" : "probability" , "type" : lt.LuaDouble },
    "BUFF" :{"to" : "buff" , "type" : lt.LuaStr },
    "动画" :{"to" : "animation" , "type" : lt.LuaStr },
    "extend1":rt.ExtendRule(1,5,"condition","条件[index]类型","条件[index]等级",{
            "条件[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "条件[index]值": {"to" : "value" ,"type" : lt.LuaStr},
            "条件[index]等级": {"to" : "level" ,"type" : lt.LuaInt},
    })
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "aoyi",
        #源文件
        "source": ["J技能_奥义.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]