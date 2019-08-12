import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULE_MAP=rt.NormalRule({
    "地图ID" :{"to" : "id" , "type" : lt.LuaInt },
    "地图名" :{"to" : "name" , "type" : lt.LuaStr },
    "背景图" :{"to" : "pic" , "type" : lt.LuaStr },
    "描述" :{"to" : "desc" , "type" : lt.LuaBlockStr },
    "音效" :{"to" : "musicEffect" , "type" : lt.LuaStr },
    "音乐列表" :{"to" : "musics" , "type" : lt.LuaStr },

})

RULE_MAP_EVENT=rt.NormalRule({
    "所属地图" :{"to" : "belongMap" , "type" : lt.LuaStr },
    "名称" :{"to" : "name" , "type" : lt.LuaStr },
    "X" :{"to" : "x" , "type" : lt.LuaInt },
    "Y" :{"to" : "y" , "type" : lt.LuaInt },
    "缩略图" :{"to" : "pic" , "type" : lt.LuaStr },
    "描述" :{"to" : "description" , "type" : lt.LuaStr },
    "extend1":rt.ExtendRule(1,20,"event","事件[index]类型","事件[index]条件",{
            "事件[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "事件[index]值": {"to" : "value" ,"type" : lt.LuaStr},
            "事件[index]缩略图": {"to" : "image" ,"type" : lt.LuaStr},
            "事件[index]描述": {"to" : "description" ,"type" : lt.LuaStr},
            "事件[index]不能重复": {"to" : "repeatTimes" ,"type" : lt.LuaIntOrStr},
            "事件[index]概率": {"to" : "probability" ,"type" : lt.LuaInt},
            "事件[index]条件": {"to" : "condition" ,"type" : lt.LuaParseStr ,"split" : "\n:", "rule" :{
                0 : {"to" : "type", "type" : lt.LuaStr},
                1 : {"to" : "value", "type" : lt.LuaStr},

            }}
    }),

})

BUILD=\
[
    #构造任务1
    {
        #构造目标
        "target" : "map",
        #源文件
        "source": ["D地图.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("地图" , RULE_MAP)
        ]    
    },
    #构造任务2
    {
        #构造目标
        "target" : "mapEvent",
        #源文件
        "source": ["D地图.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("地图事件" , RULE_MAP_EVENT)
        ]    
    },
]