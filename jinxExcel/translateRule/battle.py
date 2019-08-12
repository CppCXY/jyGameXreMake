import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "战斗名" :{"to" : "key" , "type" : lt.LuaStr },
    "战斗场景图" :{"to" : "mapkey" , "type" : lt.LuaStr },
    "音乐" :{"to" : "music" , "type" : lt.LuaStr },
    "必须上场" :{"to" : "must" , "type" : lt.LuaStr },
    "我方" :{"to" : "our_roles", "type" : lt.LuaParseStr , "split":"\n.","rule" :{
            0 : {"to" : "index","type" : lt.LuaInt},
            1 : {"to" : "key", "type" :lt.LuaStr},
            2 : {"to" : "x" ,"type" : lt.LuaInt},
            3 : {"to" : "y", "type" : lt.LuaInt},
            4 : {"to" : "face" ,"type" : lt.LuaInt},
    }},
    "敌方" :{"to" : "your_roles", "type" : lt.LuaParseStr , "split":"\n.","rule" :{
            0 : {"to" : "key", "type" : lt.LuaStr},
            1 : {"to" : "x", "type" : lt.LuaInt},
            2 : {"to" : "y", "type" : lt.LuaInt},
            3 : {"to" : "face", "type" : lt.LuaInt},
    }},
    "随机" :{"to" : "random_roles", "type" : lt.LuaParseStr , "split":"\n.","rule" :{
            0 : {"to" : "x", "type" : lt.LuaInt},
            1 : {"to" : "y", "type" : lt.LuaInt},
            2 : {"to" : "face", "type" : lt.LuaInt},
            3 : {"to" : "level", "type" : lt.LuaInt},
            4 : {"to" : "name", "type" : lt.LuaStr},
            5 : {"to" : "animation", "type" : lt.LuaStr},
            6 : {"to" : "boss", "type" : lt.LuaBool},
    }},
    "掉落" :{"to" : "drops", "type" : lt.LuaParseStr , "split":"\n.","rule" : {
            0 : {"to" : "key", "type" : lt.LuaStr},
            1 : {"to" : "from", "type" : lt.LuaInt},
            2 : {"to" : "to", "type" : lt.LuaInt},
            3 : {"to" : "prob", "type" : lt.LuaInt}
    }}
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "battle",
        #源文件
        "source": ["Z战斗.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]