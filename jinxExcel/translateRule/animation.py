import sys
import os
sys.path.append(os.path.dirname(__file__)+'/'+'..')
import parseHelper.LuaType as lt
import parseHelper.RuleType as rt
RULES=rt.NormalRule({  
    "模型名" : {"to" : "name" , "type" : lt.LuaStr },
    "攻击动画结束索引" :{"to" : "attackEndIndex" , "type" : lt.LuaInt },
    "攻击动画持续时间" :{"to" : "attacktime" , "type" : lt.LuaDouble },
    "防御动画结束索引" :{"to" : "defendEndIndex" , "type" : lt.LuaInt },
    "防御动画持续时间" :{"to" : "defendtime" , "type" : lt.LuaDouble },
    "站立动画结束索引" :{"to" : "standEndIndex" , "type" : lt.LuaInt },
    "站立动画持续时间" :{"to" : "standtime" , "type" : lt.LuaDouble },
    "移动动画结束索引" :{"to" : "moveEndIndex" , "type" : lt.LuaInt },
    "移动动画持续时间" :{"to" : "movetime" , "type" : lt.LuaDouble },
    "缩放因子" :{"to" : "scale" , "type" : lt.LuaDouble },
    "锚点" :{"to" : "anchorPoint" , "type" : lt.LuaStr }
})

RULES_SKILL=rt.NormalRule({  
    "技能动画名" : {"to" : "name" , "type" : lt.LuaStr },
    "动画结束索引" :{"to" : "animationEndIndex" , "type" : lt.LuaInt },
    "持续时间" :{"to" : "time" , "type" : lt.LuaDouble },
    "缩放因子" :{"to" : "scale" , "type" : lt.LuaDouble },

})


BUILD=\
[
    #构造任务
    {
        #构造目标
        "target" : "animation",
        #源文件
        "source": ["A模型设置.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("人物模型" , RULES),

        ]    
    },
    #构造任务2
    {
        #构造目标
        "target" : "skillAnimation",
        #源文件
        "source": ["A模型设置.xlsx"],
        #sheet对应的构造规则
        "sheet": [
            ("技能动画" , RULES_SKILL),

        ]    
    }


]