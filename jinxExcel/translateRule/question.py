import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')

import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({
    "问题" :{"to" : "key" , "type" : lt.LuaStr },
    "题目" :{"to" : "title" , "type" : lt.LuaBlockStr},
    "选项1" :{"to" : "question1" , "type" : lt.LuaBlockStr},
    "选项2" :{"to" : "question2" , "type" : lt.LuaBlockStr},
    "选项3" :{"to" : "question3" , "type" : lt.LuaBlockStr},
    "选项4" :{"to" : "question4" , "type" : lt.LuaBlockStr},
    "答案" :{"to" : "answer" , "type" : lt.LuaInt},
})

BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "question",
        #源文件
        "source": ["W问题.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("main" , RULES),
        ]    
    }

]