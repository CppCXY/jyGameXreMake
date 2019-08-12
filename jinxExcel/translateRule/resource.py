import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "KEY" :{"to" : "key" , "type" : lt.LuaStr },
    "VALUE" :{"to" : "value" , "type" : lt.LuaBlockStr},
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "resource",
        #源文件
        "source": ["Z资源.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("scene" , RULES),
            ("music" , RULES),
            ("buff" , RULES),
            ("head" , RULES),
            ("item" , RULES),
            ("trigger" , RULES),
            ("map" , RULES),
            ("talent" , RULES),
            ("story" , RULES),
        ]    
    }

]