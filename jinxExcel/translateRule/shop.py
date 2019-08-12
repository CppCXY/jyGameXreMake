import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES_NAME=rt.NormalRule({
    "商店名" :{"to" : "name" , "type" : lt.LuaStr },
    "背景图" :{"to" : "pic" , "type" : lt.LuaStr },
    "音乐" :{"to" : "music" , "type" : lt.LuaStr },
})

RULES_ITEM=rt.NormalRule({
    "商店名" :{"to" : "belongShop" , "type" : lt.LuaStr },
    "描述" :{"to" : "desc" , "type" : lt.LuaStr },
    "商店物品ID" :{"to" : "id" , "type" : lt.LuaInt },
    "物品名" :{"to" : "name" , "type" : lt.LuaStr },
    "可购买次数" :{"to" : "limit" , "type" : lt.LuaInt },
    "数量" :{"to" : "number" , "type" : lt.LuaInt },
    "extend1":rt.ExtendRule(1,5,"need","条件[index]类型","条件[index]值",{
            "条件[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "条件[index]值": {"to" : "value" ,"type" : lt.LuaStr},
    }),
    "extend2":rt.ExtendRule(1,5,"cost","消耗[index]类型","消耗[index]值",{
            "消耗[index]类型": {"to" : "type" ,"type" : lt.LuaStr},
            "消耗[index]值": {"to" : "value" ,"type" : lt.LuaStr},
    })
})

BUILD=\
[
    #构造任务1
    {
        #构造目标
        "target" : "shopName",
        #源文件
        "source": ["S商店.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("商店" , RULES_NAME),

        ]    
    },
    #构造任务2
    {
        #构造目标
        "target" : "shopItem",
        #源文件
        "source": ["S商店.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("商品" , RULES_ITEM),

        ]    
    }

]