import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "名称" :{"to" : "name" , "type" : lt.LuaStr },
    "信息" :{"to" : "info" , "type" : lt.LuaStr },
    "阴" :{"to" : "yin" , "type" : lt.LuaDouble },
    "阳" :{"to" : "yang" , "type" : lt.LuaDouble },
    "攻击加成" :{"to" : "attack" , "type" : lt.LuaDouble },
    "暴击概率加成" :{"to" : "critical" , "type" : lt.LuaDouble },
    "防御加成" :{"to" : "defence" , "type" : lt.LuaDouble },
    "难度系数" :{"to" : "hard" , "type" : lt.LuaDouble },
    "图标" :{"to" : "icon" , "type" : lt.LuaStr },
    "extend1" :rt.ExtendRule(1,8,"trigger","解锁[index]属性","解锁[index]等级",{
            "解锁[index]属性": {"to" : "name" ,"type" : lt.LuaStr},
            "解锁[index]值": {"to" : "argvs" ,"type" : lt.LuaStr},
            "解锁[index]等级": {"to" : "lv" ,"type" : lt.LuaInt},
    })
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "internal_skill",
        #源文件
        "source": ["J技能_内功.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]