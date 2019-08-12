import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "名称" :{"to" : "name" , "type" : lt.LuaStr },
    "调和" :{"to" : "tiaohe" , "type" : lt.LuaInt },
    "武学标签" :{"to" : "tag" , "type" : lt.LuaStr },
    "类型" :{"to" : "type" , "type" : lt.LuaInt },
    "适性" :{"to" : "suit" , "type" : lt.LuaDouble },
    "难度系数" :{"to" : "hard" , "type" : lt.LuaDouble },
    "简介" :{"to" : "info" , "type" : lt.LuaStr },
    "音效" :{"to" : "audio" , "type" : lt.LuaStr },
    "基础攻击力" :{"to" : "basepower" , "type" : lt.LuaDouble },
    "攻击成长" :{"to" : "step" , "type" : lt.LuaDouble },
    "动画" :{"to" : "animation" , "type" : lt.LuaStr },
    "消耗mp" :{"to" : "costMp" , "type" : lt.LuaInt },
    "冷却" :{"to" : "cd" , "type" : lt.LuaInt },
    "图标" :{"to" : "icon" , "type" : lt.LuaStr },
    "BUFF" :{"to" : "buff" , "type" : lt.LuaStr },
    "投掷范围大小" :{"to" : "castSize" , "type" : lt.LuaInt },
    "覆盖范围大小" :{"to" : "coverSize" , "type" : lt.LuaInt },
    "extend1":rt.ExtendRule(1,8,"trigger","解锁[index]属性","解锁[index]等级",{
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
        "target" : "skill",
        #源文件
        "source": ["J技能_外功.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]