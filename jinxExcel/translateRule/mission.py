import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt


RULES=rt.NormalRule({
    "任务发布点" :{"to" : "belongMissionPlace" , "type" : lt.LuaStr },
    "任务名" :{"to" : "missionName" , "type" : lt.LuaStr },
    "描述" :{"to" : "desc" , "type" : lt.LuaBlockStr },
    "任务完成描述" :{"to" : "completeDesc" , "type" : lt.LuaBlockStr },
    "完成获得标志" :{"to" : "tag" , "type" : lt.LuaStr },
    "前置条件" : {"to" : "condition" ,"type" : lt.LuaParseStr ,"split" : "\n:", "rule" :{
        0 : {"to" : "type", "type" : lt.LuaStr},
        1 : {"to" : "value", "type" : lt.LuaStr},
    }},
    "可接取次数" :{"to" : "limit" , "type" : lt.LuaInt },
    "extend1":rt.ExtendRule(1,5,"need","条件[index]类型","条件[index]值",{
            "条件[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "条件[index]值": {"to" : "value" ,"type" : lt.LuaStr},
    }),
    "extend2":rt.ExtendRule(1,5,"cost","消耗[index]类型","消耗[index]值",{
            "消耗[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "消耗[index]值": {"to" : "value" ,"type" : lt.LuaStr},
    }),
    "extend3":rt.ExtendRule(1,5,"award","奖励[index]类型","奖励[index]值",{
            "奖励[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "奖励[index]值": {"to" : "value" ,"type" : lt.LuaStr},
    }),
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "mission",
        #源文件
        "source": ["R任务.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("任务" , RULES)
        ]    
    },

]