import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt


RULES=rt.NormalRule({
    "剧本名" :{"to" : "name" , "type" : lt.LuaStr },
    "内容" : {"to" : "action" ,"type" : lt.LuaParseStr ,"split" : "\n*", "rule" :{
        0 : {"to" : "type", "type" : lt.LuaStr},
        1 : {"to" : "value", "type" : lt.LuaBlockStr},
    }},
    "extend1":rt.ExtendRule(1,12,"result","跳转[index]结果","跳转[index]条件",{
            "跳转[index]结果": {"to" : "ret" ,"type" : lt.LuaIntOrStr},
            "跳转[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "跳转[index]值": {"to" : "value" ,"type" : lt.LuaBlockStr},
            "跳转[index]条件": {"to" : "condition" ,"type" : lt.LuaParseStr ,"split" : "\n:", "rule" :{
                0 : {"to" : "type", "type" : lt.LuaStr},
                1 : {"to" : "value", "type" : lt.LuaStr},
            }}
    }),

})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "story",
        #源文件
        "source": ["J剧情开场.xlsx","J剧情任务.xlsx","J剧情.xlsx","J剧情CJ.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES)
        ]    
    },

]