import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "KEY" :{"to" : "key" , "type" : lt.LuaStr },
    "武学" :{"to" : "wuxue" , "type" : lt.LuaInt },
    "动画模型" :{"to" : "animation" , "type" : lt.LuaStr },
    "名称" :{"to" : "name" , "type" : lt.LuaStr },
    "头像" :{"to" : "head" , "type" : lt.LuaStr },
    "生命" :{"to" : "hp" , "type" : lt.LuaInt },
    "内力" :{"to" : "mp" , "type" : lt.LuaInt },
    "悟性" :{"to" : "wuxing" , "type" : lt.LuaInt },
    "身法" :{"to" : "shenfa" , "type" : lt.LuaInt },
    "臂力" :{"to" : "bili" , "type" : lt.LuaInt },
    "根骨" :{"to" : "gengu" , "type" : lt.LuaInt },
    "福源" :{"to" : "fuyuan" , "type" : lt.LuaInt },
    "定力" :{"to" : "dingli" , "type" : lt.LuaInt },
    "拳掌" :{"to" : "quanzhang" , "type" : lt.LuaInt },
    "剑法" :{"to" : "jianfa" , "type" : lt.LuaInt },
    "刀法" :{"to" : "daofa" , "type" : lt.LuaInt },
    "奇门" :{"to" : "qimen" , "type" : lt.LuaInt },
    "等级" :{"to" : "level" , "type" : lt.LuaInt },
    "是否不出现在竞技场" :{"to" : "isNet" , "type" : lt.LuaBool },
    "性别" :{"to" : "female" , "type" : lt.LuaInt },
    "天赋" :{"to" : "talent" , "type" : lt.LuaStr },
    "立绘" :{"to" : "draw" , "type" : lt.LuaStr },
    "立绘背景" :{"to" : "dawBack" , "type" : lt.LuaStr },
    "成长模板" :{"to" : "grow_template" , "type" : lt.LuaStr },
    "技能" : {"to" : "skills" ,"type" : lt.LuaParseStr ,"split" : "\n.", "rule" :{
        0 : {"to" : "name", "type" : lt.LuaStr},
        1 : {"to" : "level", "type" : lt.LuaInt},
        2 : {"to" : "maxlevel", "type" : lt.LuaInt},
    }},
    "内功" : {"to" : "internal_skills" ,"type" : lt.LuaParseStr ,"split" : "\n.", "rule" :{
        0 : {"to" : "name", "type" : lt.LuaStr},
        1 : {"to" : "level", "type" : lt.LuaInt},
        2 : {"to" : "equipped", "type" : lt.LuaInt},
        3 : {"to" : "maxlevel", "type" : lt.LuaInt},
    }},
    "特殊技" : {"to" : "special_skills" ,"type" : lt.LuaParseStr ,"split" : "\n"},
    "装备" :  {"to" : "items" ,"type" : lt.LuaParseStr ,"split" : "\n"}
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "role",
        #源文件
        "source": ["J角色.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]