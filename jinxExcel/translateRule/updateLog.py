import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "版本" :{"to" : "version" , "type" : lt.LuaStr },
    "内容" :{"to" : "context" , "type" : lt.LuaBlockStr },

})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "updateLog",
        #源文件
        "source": ["G更新日志.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),

        ]    
    }

]