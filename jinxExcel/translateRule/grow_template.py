import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "名称" :{"to" : "name" , "type" : lt.LuaStr },
    "生命成长" :{"to" : "hp" , "type" : lt.LuaInt },
    "内力成长" :{"to" : "mp" , "type" : lt.LuaInt },
    "悟性成长" :{"to" : "wuxing" , "type" : lt.LuaInt },
    "身法成长" :{"to" : "shenfa" , "type" : lt.LuaInt },
    "臂力成长" :{"to" : "bili" , "type" : lt.LuaInt },
    "根骨成长" :{"to" : "gengu" , "type" : lt.LuaInt },
    "福源成长" :{"to" : "fuyuan" , "type" : lt.LuaInt },
    "定力成长" :{"to" : "dingli" , "type" : lt.LuaInt },
    "拳掌成长" :{"to" : "quanzhang" , "type" : lt.LuaInt },
    "剑法成长" :{"to" : "jianfa" , "type" : lt.LuaInt },
    "刀法成长" :{"to" : "daofa" , "type" : lt.LuaInt },
    "奇门成长" :{"to" : "qimen" , "type" : lt.LuaInt },
    "武学常识成长" :{"to" : "wuxue" , "type" : lt.LuaInt },
    "属性点成长" :{"to" : "propertyPoint" , "type" : lt.LuaInt },
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "grow_template",
        #源文件
        "source": ["J角色_成长模板.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]