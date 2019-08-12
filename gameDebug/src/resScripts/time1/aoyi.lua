local aoyi={

{ name="小人物的愤怒",addPower=15.0,start="罗汉拳",level=10,probability=0.3,buff="晕眩.3.3.100",animation="test",
condition={ 
{ type="skill",value="松风剑法",level=10 },
{ type="skill",value="南山刀法",level=10 },
{ type="skill",value="袖箭",level=10 } } },

{ name="小人物的愤怒",addPower=15.0,start="松风剑法",level=10,probability=0.3,buff="晕眩.3.3.100",animation="test",
condition={ 
{ type="skill",value="罗汉拳",level=10 },
{ type="skill",value="南山刀法",level=10 },
{ type="skill",value="袖箭",level=10 } } },

{ name="小人物的愤怒",addPower=15.0,start="南山刀法",level=10,probability=0.3,buff="晕眩.3.3.100",animation="test",
condition={ 
{ type="skill",value="罗汉拳",level=10 },
{ type="skill",value="松风剑法",level=10 },
{ type="skill",value="袖箭",level=10 } } },

{ name="小人物的愤怒",addPower=15.0,start="袖箭",level=10,probability=0.3,buff="晕眩.3.3.100",animation="test",
condition={ 
{ type="skill",value="罗汉拳",level=10 },
{ type="skill",value="松风剑法",level=10 },
{ type="skill",value="南山刀法",level=10 } } },

{ name="千手观音",addPower=0.0,start="大金刚掌",level=10,probability=0.3,buff="晕眩.2.1.100",animation="test",
condition={ 
{ type="skill",value="如来千手法",level=10 } } },

{ name="黑沼灵狐",addPower=0.0,start="佛光普照",level=10,probability=0.3,buff="轻身.2.3.100",animation="test",
condition={ 
{ type="skill",value="峨眉剑法",level=10 },
{ type="skill",value="四象掌",level=10 },
{ type="skill",value="飘雪穿云掌",level=10 } } },

{ name="嵩山神掌",addPower=0.0,start="大嵩阳手",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="嵩山剑法",level=10 } } },

{ name="九阴白骨爪.九阴神爪",addPower=3.0,start="九阴白骨爪",level=10,probability=0.3,buff="致盲.3.2.100",animation="test",
condition={ 
{ type="internalskill",value="九阴神功",level=1 } } },

{ name="九阴白骨爪.九阴魔爪",addPower=3.0,start="九阴白骨爪",level=10,probability=0.3,buff="中毒.8.2.100",animation="test",
condition={ 
{ type="talent",value="毒圣",level=0 } } },

{ name="千噬万毒",addPower=0.0,start="灵蛇拳",level=8,probability=0.3,buff="中毒.6.2.100",animation="test",
condition={ 
{ type="internalskill",value="蛤蟆功",level=5 },
{ type="talent",value="毒系精通",level=0 } } },

{ name="千噬万毒",addPower=0.0,start="灵蛇拳",level=8,probability=0.3,buff="中毒.6.2.100",animation="test",
condition={ 
{ type="internalskill",value="蛤蟆功",level=1 },
{ type="talent",value="毒圣",level=0 } } },

{ name="千噬万毒",addPower=0.0,start="灵蛇拳",level=8,probability=0.3,buff="中毒.6.2.100",animation="test",
condition={ 
{ type="talent",value="臭蛤蟆",level=0 } } },

{ name="阴阳双指",addPower=3.0,start="幻阴指",level=10,probability=0.3,buff="重伤.3.3.100",animation="test",
condition={ 
{ type="skill",value="一阳指",level=9 } } },

{ name="阴阳双指",addPower=3.0,start="一阳指",level=10,probability=0.3,buff="重伤.3.3.100",animation="test",
condition={ 
{ type="skill",value="幻阴指",level=9 } } },

{ name="天南一指",addPower=0.0,start="一阳指",level=10,probability=0.3,buff="攻击弱化.3.2.100",animation="test",
condition={ 
{ type="talent",value="大理世家",level=0 } } },

{ name="纯阳一指",addPower=0.0,start="一阳指",level=10,probability=0.3,buff="攻击弱化.5.3.100",animation="test",
condition={ 
{ type="internalskill",value="九阳神功",level=9 } } },

{ name="纯阳一指",addPower=0.0,start="一阳指",level=10,probability=0.3,buff="攻击弱化.5.3.100",animation="test",
condition={ 
{ type="internalskill",value="纯阳无极功",level=9 } } },

{ name="先天一指",addPower=0.0,start="一阳指",level=10,probability=0.3,buff="攻击强化.5.3.100",animation="test",
condition={ 
{ type="internalskill",value="先天功",level=10 },
{ type="talent",value="清心",level=0 } } },

{ name="钢铁奔雷",addPower=0.0,start="铁掌",level=10,probability=0.3,buff="晕眩.0.1.100#防御强化.5.3.100",animation="test",
condition={ 
{ type="talent",value="金钟罩",level=0 } } },

{ name="寒冰玄煞",addPower=2.0,start="寒冰神掌",level=10,probability=0.3,buff="麻痹.2.2.100",animation="test",
condition={ 
{ type="internalskill",value="寒冰真气",level=10 } } },

{ name="冰凛嵩山",addPower=2.0,start="嵩山剑法",level=10,probability=0.3,buff="定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="寒冰真气",level=10 } } },

{ name="空明神拳",addPower=6.0,start="空明拳",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="talent",value="左右互搏",level=0 } } },

{ name="大宗师",addPower=5.0,start="庖丁解牛",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="百花错拳",level=10 },
{ type="internalskill",value="北冥神功",level=10 } } },

{ name="碧海潮生",addPower=6.0,start="弹指神通",level=10,probability=0.3,buff="内伤.5.3.100#轻身.2.3.100",animation="test",
condition={ 
{ type="skill",value="落英神剑掌",level=10 },
{ type="skill",value="玉箫剑法",level=10 } } },

{ name="华山一剑",addPower=5.0,start="狂风快剑",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="华山剑法",level=10 },
{ type="internalskill",value="紫霞神功",level=10 } } },

{ name="华山一剑",addPower=5.0,start="狂风快剑",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="夺命连环三仙剑",level=10 },
{ type="internalskill",value="紫霞神功",level=10 } } },

{ name="华山剑宗",addPower=2.0,start="狂风快剑",level=15,probability=0.5,buff="",animation="test",
condition={ 
{ type="skill",value="夺命连环三仙剑",level=10 } } },

{ name="紫霞剑气",addPower=2.0,start="华山剑法",level=15,probability=0.5,buff="内伤.5.3.100",animation="test",
condition={ 
{ type="internalskill",value="紫霞神功",level=20 } } },

{ name="潇湘夜雨.一剑落九雁",addPower=5.0,start="百变千幻云雾十三式",level=10,probability=0.3,buff="致盲.3.3.100",animation="test",
condition={ 
{ type="talent",value="琴胆剑心",level=10 } } },

{ name="金蛇郎君.金蛇剑法奥义",addPower=5.0,start="金蛇剑法",level=10,probability=0.3,buff="致盲.3.2.100#定身.3.2.100",animation="test",
condition={ 
{ type="talent",value="金蛇郎君",level=0 } } },

{ name="云意",addPower=3.0,start="柔云剑法",level=10,probability=0.3,buff="缓速.5.3.100#内伤.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="武当心法",level=10 } } },

{ name="两仪反转",addPower=3.0,start="两仪剑法",level=10,probability=0.3,buff="缓速.5.3.100#内伤.3.3.100",animation="test",
condition={ 
{ type="skill",value="反两仪刀法",level=9 } } },

{ name="狂风",addPower=3.0,start="狂风快剑",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="狂风刀法",level=9 } } },

{ name="万劫闪电貂",addPower=3.0,start="万劫刀法",level=1,probability=0.3,buff="",animation="test",
condition={ 
{ type="specialskill",value="闪电貂",level=0 } } },

{ name="狂风",addPower=3.0,start="狂风刀法",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="狂风快剑",level=9 } } },

{ name="天山雪",addPower=3.0,start="草原刀法",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="三分剑法",level=9 } } },

{ name="两仪反转",addPower=3.0,start="反两仪刀法",level=10,probability=0.3,buff="缓速.5.3.100#内伤.3.3.100",animation="test",
condition={ 
{ type="skill",value="两仪剑法",level=9 } } },

{ name="达摩焚天",addPower=3.0,start="燃木刀法",level=10,probability=0.3,buff="内伤.3.3.100#防御强化.3.3.100",animation="test",
condition={ 
{ type="skill",value="天竺佛指",level=9 },
{ type="skill",value="如来千手法",level=9 } } },

{ name="达摩千劫",addPower=3.0,start="达摩剑法",level=10,probability=0.3,buff="内伤.3.3.100#防御强化.3.3.100",animation="test",
condition={ 
{ type="skill",value="大金刚掌",level=9 },
{ type="skill",value="如来千手法",level=9 } } },

{ name="玉蜂群",addPower=3.0,start="玉蜂针",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="玉女素心剑",level=9 },
{ type="internalskill",value="九阴神功",level=9 } } },

{ name="黑血奇毒",addPower=3.0,start="黑血神针",level=10,probability=0.3,buff="",animation="test",
condition={ 
{ type="skill",value="毒龙鞭法",level=9 },
{ type="skill",value="五毒神掌",level=9 } } },

{ name="日月魔剑",addPower=3.0,start="日月鞭法",level=10,probability=0.3,buff="魔神降临.1.3.100",animation="test",
condition={ 
{ type="skill",value="嵩山剑法",level=9 },
{ type="skill",value="华山剑法",level=9 } } },

{ name="古墓.森罗万象.天罗地网掌",addPower=4.0,start="天罗地网掌",level=5,probability=0.3,buff="定身.1.3.100#轻身.1.2.100",animation="test",
condition={ 
{ type="skill",value="玉女剑法",level=5 },
{ type="skill",value="玉蜂针",level=5 },
{ type="internalskill",value="玉女心经",level=5 } } },

{ name="古墓.森罗万象.玉女剑法",addPower=4.0,start="玉女剑法",level=5,probability=0.3,buff="伤害加深.1.3.100#轻身.1.2.100",animation="test",
condition={ 
{ type="skill",value="天罗地网掌",level=5 },
{ type="skill",value="玉蜂针",level=5 },
{ type="internalskill",value="玉女心经",level=5 } } },

{ name="古墓.森罗万象.驱蜂术",addPower=4.0,start="玉蜂针",level=5,probability=0.3,buff="中毒.1.3.100#轻身.1.2.100",animation="test",
condition={ 
{ type="skill",value="玉女剑法",level=5 },
{ type="skill",value="天罗地网掌",level=5 },
{ type="internalskill",value="玉女心经",level=5 } } },

{ name="大轮.无上秘境.密宗大手印",addPower=4.0,start="密宗大手印",level=7,probability=0.3,buff="缓速.1.3.100#防御强化.2.3.100",animation="test",
condition={ 
{ type="skill",value="漫天花雨",level=7 },
{ type="skill",value="无上大力杵",level=7 } } },

{ name="大轮.无上秘境.漫天花雨",addPower=4.0,start="漫天花雨",level=7,probability=0.3,buff="致盲.1.3.100#防御强化.2.3.100",animation="test",
condition={ 
{ type="skill",value="密宗大手印",level=7 },
{ type="skill",value="无上大力杵",level=7 } } },

{ name="大轮.无上秘境.金刚神杵",addPower=4.0,start="无上大力杵",level=7,probability=0.3,buff="内伤.1.3.100#防御强化.2.3.100",animation="test",
condition={ 
{ type="skill",value="密宗大手印",level=7 },
{ type="skill",value="漫天花雨",level=7 } } },

{ name="灵鹫宫绝学.天羽奇剑",addPower=3.0,start="归藏剑",level=7,probability=0.3,buff="定身.1.3.100",animation="test",
condition={ 
{ type="skill",value="天山掌法",level=7 },
{ type="internalskill",value="天山心法",level=7 } } },

{ name="灵鹫宫绝学.逍遥游",addPower=3.0,start="天山掌法",level=7,probability=0.3,buff="轻身.3.2.100",animation="test",
condition={ 
{ type="skill",value="归藏剑",level=7 },
{ type="internalskill",value="天山心法",level=7 } } },

{ name="灵鹫宫绝学.北冥一剑",addPower=3.0,start="归藏剑",level=10,probability=0.3,buff="定身.2.3.100",animation="test",
condition={ 
{ type="talent",value="北冥真气",level=0 } } },

{ name="灵鹫宫绝学.北冥神掌",addPower=3.0,start="天山掌法",level=10,probability=0.2,buff="定身.2.3.100",animation="test",
condition={ 
{ type="talent",value="北冥真气",level=0 } } },

{ name="逍遥绝学.信天游",addPower=3.0,start="天山六阳掌",level=10,probability=0.2,buff="飘渺.5.3.100",animation="test",
condition={ 
{ type="talent",value="北冥真气",level=0 } } },

{ name="灵鹫宫绝学.北冥神掌",addPower=3.0,start="天山折梅手",level=10,probability=0.2,buff="定身.2.3.100",animation="test",
condition={ 
{ type="talent",value="北冥真气",level=0 } } },

{ name="灵鹫宫绝学.天地唯我独尊",addPower=5.0,start="天山折梅手",level=10,probability=0.25,buff="恢复.6.3.100#伤害加深.2.3.100",animation="test",
condition={ 
{ type="internalskill",value="八荒六合唯我独尊功",level=10 } } },

{ name="星宿派绝学.幽冥神掌",addPower=4.0,start="三阴蜈蚣爪",level=10,probability=0.25,buff="中毒.7.3.100#伤害加深.2.3.100",animation="test",
condition={ 
{ type="internalskill",value="化功大法",level=10 } } },

{ name="星宿派绝学.幽冥神掌",addPower=4.0,start="抽髓掌",level=10,probability=0.25,buff="中毒.7.3.100#伤害加深.2.3.100",animation="test",
condition={ 
{ type="internalskill",value="化功大法",level=10 } } },

{ name="星宿派绝学.幽冥神掌",addPower=4.0,start="三阴蜈蚣爪",level=10,probability=0.15,buff="中毒.7.3.100#伤害加深.2.3.100",animation="test",
condition={ 
{ type="skill",value="抽髓掌",level=10 } } },

{ name="全真绝学.太乙剑诀",addPower=2.0,start="一剑化三清",level=7,probability=0.2,buff="飘渺.4.3.100",animation="test",
condition={ 
{ type="skill",value="全真剑法",level=7 },
{ type="internalskill",value="全真心法",level=7 } } },

{ name="全真绝学.太乙剑诀",addPower=2.0,start="七星七绝剑",level=7,probability=0.3,buff="飘渺.4.3.100",animation="test",
condition={ 
{ type="skill",value="全真剑法",level=7 },
{ type="internalskill",value="全真心法",level=7 } } },

{ name="全真绝学.重阳剑法",addPower=6.0,start="七星七绝剑",level=10,probability=0.3,buff="晕眩.0.1.100#重伤.3.3.100",animation="test",
condition={ 
{ type="skill",value="全真剑法",level=10 },
{ type="skill",value="一剑化三清",level=10 },
{ type="internalskill",value="先天功",level=5 } } },

{ name="全真绝学.三花聚顶",addPower=2.0,start="三花聚顶掌",level=10,probability=0.3,buff="晕眩.0.1.100",animation="test",
condition={ 
{ type="skill",value="昊天掌",level=10 },
{ type="internalskill",value="全真心法",level=10 } } },

{ name="全真绝学.三花聚顶.炼神返虚",addPower=7.0,start="三花聚顶掌",level=16,probability=0.3,buff="集气.3.3.100#诸般封印",animation="test",
condition={ 
{ type="skill",value="昊天掌",level=16 } } },

{ name="大理绝学.六脉神剑奥义",addPower=6.0,start="六脉神剑",level=10,probability=0.15,buff="神速攻击.5.3.100#内伤.5.3.100",animation="test",
condition={ 
{ type="talent",value="大理世家",level=0 } } },

{ name="大理绝学.六脉神剑奥义",addPower=6.0,start="六脉神剑",level=10,probability=0.15,buff="神速攻击.5.3.100#内伤.5.3.100",animation="test",
condition={ 
{ type="skill",value="一阳指",level=10 } } },

{ name="丐帮绝学.打狗棒法奥义",addPower=5.0,start="打狗棒法",level=10,probability=0.2,buff="集气.3.3.100#飘渺.3.3.100#诸般封印",animation="test",
condition={ 
{ type="skill",value="降龙十八掌",level=10 },
{ type="talent",value="臭叫花",level=0 } } },

{ name="丐帮绝学.打狗棒法奥义",addPower=5.0,start="打狗棒法",level=10,probability=0.15,buff="集气.3.3.100#飘渺.3.3.100#诸般封印",animation="test",
condition={ 
{ type="skill",value="降龙十八掌",level=10 } } },

{ name="丐帮绝学.打狗棒法奥义",addPower=5.0,start="打狗棒法",level=10,probability=0.2,buff="集气.3.3.100#飘渺.3.3.100#诸般封印",animation="test",
condition={ 
{ type="talent",value="玲珑璇玑",level=0 } } },

{ name="古墓绝学.双剑合璧",addPower=6.0,start="玉女素心剑",level=10,probability=0.3,buff="飘渺.5.3.100#致盲.3.3.100#缓速.3.3.100",animation="test",
condition={ 
{ type="skill",value="玉女剑法",level=10 },
{ type="skill",value="天罗地网掌",level=10 },
{ type="skill",value="玉蜂针",level=10 },
{ type="internalskill",value="玉女心经",level=10 } } },

{ name="慕容绝学.离合参商",addPower=0.0,start="斗转星移",level=10,probability=0.3,buff="诸般封印#内伤.5.3.100",animation="test",
condition={ 
{ type="talent",value="斗转星移",level=0 },
{ type="talent",value="慕容世家",level=0 } } },

{ name="慕容绝学.离合参商",addPower=0.0,start="斗转星移",level=10,probability=0.15,buff="诸般封印#内伤.5.3.100",animation="test",
condition={ 
{ type="talent",value="斗转星移",level=0 } } },

{ name="逍遥绝学.生死符",addPower=0.0,start="天山六阳掌",level=10,probability=0.5,buff="中毒.18.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="skill",value="天山折梅手",level=10 },
{ type="internalskill",value="北冥神功",level=10 } } },

{ name="逍遥绝学.生死符",addPower=0.0,start="天山折梅手",level=10,probability=0.3,buff="中毒.18.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="skill",value="天山六阳掌",level=10 },
{ type="internalskill",value="北冥神功",level=10 } } },

{ name="华山绝学.独孤九剑奥义",addPower=4.0,start="独孤九剑",level=10,probability=0.3,buff="定身.3.3.100#神行.2.2.100",animation="test",
condition={ 
{ type="skill",value="华山剑法",level=10 },
{ type="skill",value="狂风快剑",level=10 } } },

{ name="华山绝学.独孤九剑奥义",addPower=4.0,start="独孤九剑",level=10,probability=0.15,buff="定身.3.3.100#神行.2.2.100",animation="test",
condition={ 
{ type="skill",value="华山剑法",level=10 },
{ type="internalskill",value="紫霞神功",level=10 } } },

{ name="绝户虎爪手.断子绝孙爪",addPower=0.0,start="绝户虎爪手",level=10,probability=0.2,buff="晕眩.0.2.100",animation="test",
condition={ 
{ type="internalskill",value="太极神功",level=10 },
{ type="skill",value="绵掌",level=10 } } },

{ name="武当绝学.太极拳奥义",addPower=0.0,start="太极拳",level=10,probability=0.2,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="internalskill",value="太极神功",level=10 },
{ type="talent",value="太极宗师",level=10 } } },

{ name="武当绝学.太极拳奥义",addPower=0.0,start="太极拳",level=10,probability=0.2,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="internalskill",value="太极神功",level=10 },
{ type="talent",value="太极高手",level=10 } } },

{ name="武当绝学.太极拳奥义",addPower=0.0,start="太极拳",level=10,probability=0.15,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="skill",value="太极剑",level=10 } } },

{ name="武当绝学.太极剑奥义",addPower=0.0,start="太极剑",level=10,probability=0.2,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="internalskill",value="太极神功",level=10 },
{ type="talent",value="太极宗师",level=10 } } },

{ name="武当绝学.太极剑奥义",addPower=0.0,start="太极剑",level=10,probability=0.2,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="internalskill",value="太极神功",level=10 },
{ type="talent",value="太极高手",level=10 } } },

{ name="武当绝学.太极剑奥义",addPower=0.0,start="太极剑",level=10,probability=0.15,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="skill",value="太极拳",level=10 } } },

{ name="纯阳无极功.太极拳奥义",addPower=0.0,start="太极拳",level=10,probability=1.0,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="internalskill",value="纯阳无极功",level=15 } } },

{ name="纯阳无极功.太极剑奥义",addPower=0.0,start="太极剑",level=10,probability=1.0,buff="飘渺.3.3.100#麻痹.2.2.100",animation="test",
condition={ 
{ type="internalskill",value="纯阳无极功",level=15 } } },

{ name="大轮绝学.般若火舞",addPower=0.0,start="火焰刀法",level=10,probability=0.2,buff="晕眩.0.1.100#中毒.10.2.100",animation="test",
condition={ 
{ type="internalskill",value="龙象般若功",level=10 },
{ type="skill",value="密宗大手印",level=10 },
{ type="skill",value="漫天花雨",level=10 },
{ type="skill",value="无上大力杵",level=10 } } },

{ name="龙象般若功奥义.象跌势",addPower=3.0,start="龙象般若功.龙象秘境",level=10,probability=0.3,buff="晕眩.0.1.100#防御强化.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="龙象般若功",level=10 },
{ type="skill",value="密宗大手印",level=10 },
{ type="skill",value="漫天花雨",level=10 },
{ type="skill",value="无上大力杵",level=10 } } },

{ name="龙象般若功奥义.龙吞势",addPower=3.0,start="龙象般若功.庄严宝相",level=10,probability=0.3,buff="伤害加深.3.3.100#防御强化.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="龙象般若功",level=10 },
{ type="skill",value="密宗大手印",level=10 },
{ type="skill",value="漫天花雨",level=10 },
{ type="skill",value="无上大力杵",level=10 } } },

{ name="少林阵法.金刚伏魔圈",addPower=10.0,start="日月神鞭",level=10,probability=0.9,buff="缓速.10.3.100#防御强化.3.3.100",animation="test",
condition={ 
{ type="talent",value="金刚伏魔圈",level=0 },
{ type="internalskill",value="易筋经",level=10 } } },

{ name="明教.大光明圣火",addPower=1.0,start="弹指神通",level=10,probability=0.5,buff="防御强化.3.3.100",animation="test",
condition={ 
{ type="talent",value="光明圣火阵",level=0 } } },

{ name="明教.大光明圣火",addPower=1.0,start="须弥山掌",level=10,probability=0.5,buff="防御强化.3.3.100",animation="test",
condition={ 
{ type="talent",value="光明圣火阵",level=0 } } },

{ name="降龙十八掌.履霜冰至",addPower=5.0,start="降龙十八掌",level=10,probability=0.15,buff="麻痹.3.3.100#神行.1.1.100",animation="test",
condition={ 
{ type="skill",value="擒龙功",level=10 },
{ type="talent",value="天龙.盖世英雄",level=0 } } },

{ name="降龙十八掌.震惊百里",addPower=5.0,start="降龙十八掌",level=10,probability=0.15,buff="晕眩.0.1.100#神行.1.1.100",animation="test",
condition={ 
{ type="skill",value="擒龙功",level=10 },
{ type="talent",value="天龙.盖世英雄",level=0 } } },

{ name="降龙十八掌.密云不雨",addPower=5.0,start="降龙十八掌",level=10,probability=0.15,buff="缓速.5.3.100#神行.1.1.100",animation="test",
condition={ 
{ type="skill",value="擒龙功",level=10 },
{ type="talent",value="天龙.盖世英雄",level=0 } } },

{ name="降龙十八掌.突如其来",addPower=5.0,start="降龙十八掌",level=10,probability=0.15,buff="伤害加深.3.3.100#神行.1.1.100",animation="test",
condition={ 
{ type="skill",value="擒龙功",level=10 },
{ type="talent",value="天龙.盖世英雄",level=0 } } },

{ name="降龙十八掌.时乘六龙",addPower=5.0,start="降龙十八掌",level=10,probability=0.15,buff="定身.3.3.100#神行.1.1.100",animation="test",
condition={ 
{ type="skill",value="擒龙功",level=10 } } },

{ name="降龙十八掌奥义式",addPower=6.0,start="降龙十八掌",level=10,probability=0.25,buff="重伤.5.3.100#魔神降临.1.1.100",animation="test",
condition={ 
{ type="talent",value="射雕英雄",level=0 } } },

{ name="绝学.无招胜有招",addPower=4.0,start="独孤九剑",level=10,probability=0.4,buff="致盲.10.3.100#缓速.10.3.100",animation="test",
condition={ 
{ type="skill",value="玄铁剑法",level=10 },
{ type="talent",value="孤独求败",level=0 } } },

{ name="绝学.无招胜有招",addPower=4.0,start="独孤九剑",level=12,probability=0.2,buff="致盲.10.3.100#缓速.10.3.100",animation="test",
condition={ 
{ type="talent",value="浪子剑客",level=0 } } },

{ name="绝学.无招胜有招",addPower=4.0,start="玄铁剑法",level=12,probability=0.4,buff="致盲.10.3.100#缓速.10.3.100",animation="test",
condition={ 
{ type="talent",value="神雕大侠",level=0 } } },

{ name="绝学.刀剑归真",addPower=8.0,start="胡家刀法",level=10,probability=0.3,buff="诸般封印#轻身.1.3.100#神速攻击.3.3.100#飘渺.3.3.100",animation="test",
condition={ 
{ type="skill",value="苗家剑法",level=9 } } },

{ name="绝学.刀剑归真",addPower=8.0,start="苗家剑法",level=10,probability=0.3,buff="诸般封印#轻身.1.3.100#神速攻击.3.3.100#飘渺.3.3.100",animation="test",
condition={ 
{ type="skill",value="胡家刀法",level=9 } } },

{ name="胡家刀法奥义.穿手藏刀",addPower=4.0,start="胡家刀法",level=10,probability=0.1,buff="伤害加深.3.3.100",animation="test",
condition={ 
{ type="talent",value="雪山飞狐",level=0 } } },

{ name="胡家刀法奥义.鹞子翻身刀",addPower=4.0,start="胡家刀法",level=10,probability=0.1,buff="定身.3.3.100",animation="test",
condition={ 
{ type="talent",value="雪山飞狐",level=0 } } },

{ name="胡家刀法奥义.怀中抱月",addPower=4.0,start="胡家刀法",level=10,probability=0.1,buff="轻身.3.3.100",animation="test",
condition={ 
{ type="talent",value="雪山飞狐",level=0 } } },

{ name="草头百姓的逆袭.百姓也有春天",addPower=5.0,start="野球拳",level=10,probability=0.4,buff="定身.3.3.100",animation="test",
condition={ 
{ type="talent",value="草头百姓",level=10 } } },

{ name="草头百姓的逆袭.这下子逆天了",addPower=6.0,start="野球拳",level=10,probability=0.4,buff="圣战.0.4.100#魔神降临.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="九阴神功",level=10 },
{ type="internalskill",value="九阳神功",level=10 },
{ type="internalskill",value="易筋经",level=10 },
{ type="talent",value="草头百姓",level=10 } } },

{ name="黯然销魂.左手帝",addPower=0.0,start="黯然销魂掌",level=10,probability=0.3,buff="防御强化.5.3.100",animation="test",
condition={ 
{ type="talent",value="神雕大侠",level=0 } } },

{ name="黯然销魂掌奥义式",addPower=5.0,start="黯然销魂掌",level=10,probability=0.3,buff="定身.3.3.100",animation="test",
condition={ 
{ type="skill",value="玄铁剑法",level=10 },
{ type="talent",value="神雕大侠",level=0 } } },

{ name="辟邪剑法奥义式",addPower=5.0,start="辟邪剑法",level=10,probability=0.25,buff="致盲.4#飘渺#轻身.2.3.100#魔神降临.3.3.30",animation="test",
condition={ 
{ type="talent",value="阉人",level=0 },
{ type="internalskill",value="葵花宝典",level=10 } } },

{ name="辟邪剑法奥义式",addPower=5.0,start="葵花宝典.真辟邪剑法",level=10,probability=0.25,buff="致盲.4#飘渺#轻身.2.3.100#魔神降临.3.3.30",animation="test",
condition={ 
{ type="talent",value="阉人",level=0 },
{ type="internalskill",value="葵花宝典",level=10 } } },

{ name="辟邪剑法.阴凛玄煞.电光火石",addPower=3.0,start="辟邪剑法",level=10,probability=0.3,buff="致盲.4#飘渺#轻身.2.3.100",animation="test",
condition={ 
{ type="skill",value="狂风快剑",level=10 },
{ type="talent",value="阉人",level=0 } } },

{ name="绝学.形意八卦掌",addPower=3.0,start="八卦游身掌",level=7,probability=0.25,buff="",animation="test",
condition={ 
{ type="skill",value="八卦刀法",level=7 } } },

{ name="绝学.八卦无双",addPower=3.0,start="八卦刀法",level=7,probability=0.25,buff="",animation="test",
condition={ 
{ type="skill",value="八卦游身掌",level=7 } } },

{ name="奥义.缠丝擒拿手",addPower=0.0,start="太祖长拳",level=7,probability=0.25,buff="定身.3.3.100",animation="test",
condition={ 
{ type="skill",value="疯魔杖法",level=7 } } },

{ name="混元掌奥义.劈石破玉拳",addPower=5.0,start="混元掌",level=10,probability=0.25,buff="伤害加深.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="混元功",level=10 } } },

{ name="血刀大法奥义.血海无边",addPower=3.0,start="血刀大法",level=10,probability=0.25,buff="伤害加深.5.3.100#魔神降临.3.3.50",animation="test",
condition={ 
{ type="talent",value="血海魔功",level=0 } } },

{ name="血刀大法奥义.血海无边",addPower=3.0,start="血刀大法",level=10,probability=0.35,buff="伤害加深.5.3.100#魔神降临.3.3.50",animation="test",
condition={ 
{ type="talent",value="血魔刀法",level=0 } } },

{ name="绝学.唐诗剑法",addPower=4.0,start="连城剑法",level=10,probability=0.25,buff="伤害加深.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="神照功",level=0 } } },

{ name="绝学.罗汉伏魔拳",addPower=2.0,start="青莲掌法",level=10,probability=0.25,buff="定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="罗汉伏魔功",level=0 } } },

{ name="绝学.罗汉伏魔剑",addPower=2.0,start="太白剑法",level=10,probability=0.25,buff="定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="罗汉伏魔功",level=0 } } },

{ name="绝学.罗汉伏魔刀",addPower=2.0,start="金乌刀法",level=10,probability=0.25,buff="定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="罗汉伏魔功",level=0 } } },

{ name="绝学.罗汉伏魔拳",addPower=2.0,start="青莲掌法",level=10,probability=0.2,buff="定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="罗汉伏魔功",level=0 },
{ type="talent",value="狗杂种",level=0 } } },

{ name="绝学.罗汉伏魔剑",addPower=2.0,start="太白剑法",level=10,probability=0.2,buff="定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="罗汉伏魔功",level=0 },
{ type="talent",value="狗杂种",level=0 } } },

{ name="绝学.罗汉伏魔刀",addPower=2.0,start="金乌刀法",level=10,probability=0.2,buff="定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="罗汉伏魔功",level=0 },
{ type="talent",value="狗杂种",level=0 } } },

{ name="太玄神功奥义式",addPower=5.0,start="太玄神功",level=10,probability=0.5,buff="攻击强化.2.3.100#定身.3.3.100",animation="test",
condition={ 
{ type="internalskill",value="太玄神功",level=0 },
{ type="talent",value="狗杂种",level=0 } } },

{ name="奥义.逍遥无极剑",addPower=0.0,start="上清剑法",level=7,probability=0.25,buff="定身.3.3.100",animation="test",
condition={ 
{ type="skill",value="归藏剑",level=7 } } },

{ name="少林.观照般若",addPower=0.0,start="般若掌",level=10,probability=0.25,buff="",animation="test",
condition={ 
{ type="internalskill",value="少林心法",level=0 } } },

{ name="少林.横扫千军",addPower=0.0,start="韦陀棍",level=7,probability=0.2,buff="定身.3.3.100",animation="test",
condition={ 
{ type="talent",value="俗家弟子",level=0 } } },

{ name="少林.醉梦罗汉拳",addPower=4.0,start="罗汉拳",level=7,probability=0.2,buff="攻击强化.2.3.100",animation="test",
condition={ 
{ type="talent",value="无相",level=0 } } },

{ name="少林.韦陀伏魔",addPower=5.0,start="伏魔棍",level=7,probability=0.2,buff="定身.3.3.100",animation="test",
condition={ 
{ type="talent",value="俗家弟子",level=0 },
{ type="skill",value="韦陀棍",level=7 } } },

{ name="少林.伏魔禅杖",addPower=5.0,start="伏魔棍",level=10,probability=0.25,buff="定身.3.3.100#内伤.5.3.100",animation="test",
condition={ 
{ type="talent",value="俗家弟子",level=0 },
{ type="skill",value="韦陀棍",level=10 } } },

{ name="福建少林.工字伏虎",addPower=2.0,start="小洪拳",level=10,probability=0.2,buff="",animation="test",
condition={ 
{ type="skill",value="小洪拳",level=7 } } },

{ name="福建少林.虎鹤双形",addPower=3.0,start="大洪拳",level=10,probability=0.2,buff="",animation="test",
condition={ 
{ type="skill",value="大洪拳",level=7 } } },

{ name="如来神掌.万佛朝宗",addPower=5.0,start="如来神掌",level=10,probability=0.3,buff="诸般封印#定身#麻痹",animation="test",
condition={ 
{ type="skill",value="小洪拳",level=15 },
{ type="skill",value="大洪拳",level=15 } } },

{ name="拈花一指",addPower=3.0,start="拈花指",level=10,probability=0.2,buff="拳掌封印#内伤.5.3.100",animation="test",
condition={ 
{ type="skill",value="拈花指",level=10 },
{ type="talent",value="无相",level=0 } } },

{ name="西域少林绝学.大力金刚指",addPower=3.0,start="大力金刚指",level=10,probability=0.25,buff="定身.3.3.100#内伤.5.3.100#重伤.3.3.100",animation="test",
condition={ 
{ type="skill",value="大力金刚指",level=10 },
{ type="internalskill",value="九阳神功",level=0 } } },

{ name="越女剑法奥义式",addPower=3.0,start="越女剑法",level=10,probability=0.25,buff="晕眩.0.1.100",animation="test",
condition={ 
{ type="skill",value="越女剑法",level=10 },
{ type="internalskill",value="九阴神功",level=10 },
{ type="internalskill",value="九阳神功",level=10 },
{ type="internalskill",value="易筋经",level=10 } } },

}
return aoyi