import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "KEY" :{"to" : "selectKey" , "type" : lt.LuaStr },
    "头像路径" :{"to" : "picPath" , "type" : lt.LuaStr },
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "headSelect",
        #源文件
        "source": ["T头像选择.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]