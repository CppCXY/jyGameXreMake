local internal_skill={

{ name="基本内功",info="天下内功的根基",yin=25.0,yang=25.0,attack=0.15,critical=0.15,defence=0.15,hard=1.0,icon="anyingjuehunzhang",
trigger={ 
{ name="sp",argvs="0.05",lv=10 },
{ name="attribute",argvs="根骨,8",lv=10 },
{ name="attribute",argvs="臂力,8",lv=14 },
{ name="attribute",argvs="身法,8",lv=15 },
{ name="attribute",argvs="悟性,8",lv=16 },
{ name="attribute",argvs="定力,8",lv=17 },
{ name="attribute",argvs="福缘,8",lv=18 },
{ name="anti_debuff",argvs="5",lv=20 } } },

{ name="世家内功",info="世家武功心法，比较平衡",yin=35.0,yang=35.0,attack=0.2,critical=0.2,defence=0.2,hard=3.0,icon="anyingjuehunzhang",
trigger={ 
{ name="sp",argvs="0.05",lv=10 },
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="attribute",argvs="臂力,10",lv=14 },
{ name="attribute",argvs="身法,10",lv=15 },
{ name="attribute",argvs="悟性,10",lv=16 },
{ name="attribute",argvs="定力,10",lv=17 },
{ name="attribute",argvs="福缘,10",lv=18 },
{ name="anti_debuff",argvs="5",lv=20 } } },

{ name="血刀心法",info="血刀门的入门心法，只重攻不重防",yin=50.0,yang=50.0,attack=0.5,critical=0.0,defence=0.0,hard=2.0,icon="anzhihen",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_skill",argvs="血刀大法,8",lv=14 },
{ name="powerup_skill",argvs="血刀大法,15",lv=18 },
{ name="powerup_internalskill",argvs="血海魔功,15",lv=20 } } },

{ name="全真心法",info="全真派的内功心法",yin=40.0,yang=40.0,attack=0.3,critical=0.2,defence=0.3,hard=2.0,icon="aoyijue",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_internalskill",argvs="先天功,8",lv=14 },
{ name="powerup_internalskill",argvs="九阴神功,8",lv=16 },
{ name="mingzhong",argvs="10",lv=18 },
{ name="sp",argvs="0.05",lv=20 },
{ name="critical",argvs="8.0",lv=20 } } },

{ name="天山心法",info="灵鹫宫的内功心法，据说藏着很大秘密",yin=45.0,yang=45.0,attack=0.3,critical=0.2,defence=0.3,hard=2.0,icon="baililuoxuesi",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_internalskill",argvs="北冥神功,5",lv=12 },
{ name="powerup_internalskill",argvs="八荒六合唯我独尊功,5",lv=15 },
{ name="powerup_aoyi",argvs="逍遥绝学.生死符,10,6",lv=18 },
{ name="powerup_internalskill",argvs="八荒六合唯我独尊功,5",lv=20 } } },

{ name="武当心法",info="武当派的内功心法",yin=40.0,yang=40.0,attack=0.2,critical=0.2,defence=0.4,hard=2.0,icon="canmangjian",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_internalskill",argvs="太极神功,15",lv=14 },
{ name="powerup_internalskill",argvs="纯阳无极功,15",lv=18 },
{ name="sp",argvs="0.1",lv=20 } } },

{ name="青城内功",info="青城内功青山重重",yin=40.0,yang=40.0,attack=0.2,critical=0.4,defence=0.4,hard=2.0,icon="chihuangdaofa",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_skill",argvs="青城剑法,50",lv=15 },
{ name="powerup_skill",argvs="摧心掌,50",lv=15 },
{ name="powerup_skill",argvs="青城剑法,70",lv=20 },
{ name="powerup_skill",argvs="摧心掌,70",lv=20 } } },

{ name="星宿心法",info="星宿派的入门内功",yin=50.0,yang=-10.0,attack=0.2,critical=0.4,defence=0.4,hard=2.0,icon="chongzhuang",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_skill",argvs="抽髓掌,50",lv=15 },
{ name="powerup_skill",argvs="三阴蜈蚣爪,50",lv=15 },
{ name="powerup_skill",argvs="抽髓掌,70",lv=20 },
{ name="powerup_skill",argvs="三阴蜈蚣爪,70",lv=20 } } },

{ name="石梁心法",info="石梁派心法",yin=40.0,yang=40.0,attack=0.5,critical=0.3,defence=0.3,hard=2.0,icon="chuanyunjian",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="attribute",argvs="根骨,10",lv=14 },
{ name="sp",argvs="0.15",lv=20 } } },

{ name="少林心法",info="少林派早课",yin=-30.0,yang=60.0,attack=0.3,critical=0.0,defence=0.3,hard=2.0,icon="cjjfjf",
trigger={ 
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_internalskill",argvs="少林九阳功,15",lv=14 },
{ name="powerup_internalskill",argvs="九阳神功,15",lv=16 },
{ name="powerup_internalskill",argvs="易筋经,15",lv=18 },
{ name="anti_debuff",argvs="8",lv=20 } } },

{ name="段氏心法",info="大理段氏的内功心法",yin=0.0,yang=50.0,attack=0.3,critical=0.2,defence=0.3,hard=3.0,icon="cjmenghanquan",
trigger={ 
{ name="eq_talent",argvs="奋战",lv=10 },
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_skill",argvs="一阳指,15",lv=15 },
{ name="powerup_skill",argvs="六脉神剑,10",lv=18 },
{ name="talent",argvs="大理世家",lv=20 } } },

{ name="衡山内功",info="衡山的基本内功",yin=40.0,yang=40.0,attack=0.3,critical=0.2,defence=0.3,hard=3.0,icon="cjmenghanquan",
trigger={ 
{ name="eq_talent",argvs="奋战",lv=10 },
{ name="attribute",argvs="根骨,10",lv=10 } } },

{ name="紫霞神功",info="华山派心法",yin=0.0,yang=50.0,attack=0.3,critical=0.2,defence=0.3,hard=3.0,icon="cjmenghanxinfa",
trigger={ 
{ name="eq_talent",argvs="奋战",lv=10 },
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_aoyi",argvs="华山一剑,15,5",lv=15 },
{ name="attribute",argvs="根骨,20",lv=18 },
{ name="sp",argvs="0.1",lv=20 } } },

{ name="化功大法",info="星宿老仙丁春秋为武林所不齿的内功绝技",yin=50.0,yang=0.0,attack=0.2,critical=0.2,defence=0.2,hard=4.0,icon="dafengche",
trigger={ 
{ name="talent",argvs="毒系精通",lv=10 },
{ name="attribute",argvs="根骨,15",lv=10 },
{ name="powerup_skill",argvs="抽髓掌,30",lv=12 },
{ name="powerup_skill",argvs="三阴蜈蚣爪,30",lv=14 },
{ name="attribute",argvs="根骨,15",lv=16 },
{ name="talent",argvs="化功大法",lv=20 } } },

{ name="天山剑法决",info="天山大侠配合天山剑法所打造的独家内功",yin=45.0,yang=45.0,attack=0.3,critical=0.2,defence=0.3,hard=4.0,icon="dalangquan",
trigger={ 
{ name="powerup_skill",argvs="天山剑法,80",lv=10 },
{ name="attribute",argvs="根骨,10",lv=12 },
{ name="attribute",argvs="身法,15",lv=15 },
{ name="attribute",argvs="定力,20",lv=20 } } },

{ name="少林九阳功",info="九阳神功在少林的分枝",yin=-30.0,yang=50.0,attack=0.4,critical=0.0,defence=0.3,hard=5.0,icon="dizihua",
trigger={ 
{ name="eq_talent",argvs="拳掌封印",lv=10 },
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_internalskill",argvs="九阳神功,15",lv=16 },
{ name="powerup_internalskill",argvs="易筋经,15",lv=16 },
{ name="anti_debuff",argvs="8",lv=20 } } },

{ name="武当九阳功",info="九阳神功在武当派的分枝",yin=45.0,yang=45.0,attack=0.4,critical=0.0,defence=0.3,hard=5.0,icon="dulequan",
trigger={ 
{ name="eq_talent",argvs="剑封印",lv=10 },
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_internalskill",argvs="九阳神功,15",lv=14 },
{ name="powerup_internalskill",argvs="纯阳无极功,8",lv=16 },
{ name="anti_debuff",argvs="8",lv=20 } } },

{ name="峨眉九阳功",info="九阳神功在峨眉的分枝",yin=-5.0,yang=50.0,attack=0.4,critical=0.25,defence=0.3,hard=5.0,icon="erhupuyang",
trigger={ 
{ name="eq_talent",argvs="刀封印",lv=10 },
{ name="attribute",argvs="根骨,10",lv=10 },
{ name="powerup_internalskill",argvs="九阳神功,15",lv=16 },
{ name="anti_debuff",argvs="8",lv=20 } } },

{ name="玉女心经",info="古墓派高级内功",yin=50.0,yang=30.0,attack=0.3,critical=0.2,defence=0.2,hard=6.0,icon="anyingjuehunzhang",
trigger={ 
{ name="eq_talent",argvs="清心",lv=10 },
{ name="attribute",argvs="根骨,11",lv=10 },
{ name="talent",argvs="清心",lv=18 },
{ name="powerup_skill",argvs="玉女素心剑,20",lv=20 } } },

{ name="罗汉伏魔功",info="集佛家内功之大成，深奥精微",yin=0.0,yang=60.0,attack=0.2,critical=0.1,defence=1.0,hard=6.0,icon="anzhihen",
trigger={ 
{ name="eq_talent",argvs="真气护体",lv=10 },
{ name="eq_talent",argvs="怒不可遏",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="powerup_internalskill",argvs="太玄神功,6",lv=14 },
{ name="attribute",argvs="根骨,20",lv=16 },
{ name="powerup_aoyi",argvs="太玄神功奥义式,12,4",lv=18 },
{ name="powerup_internalskill",argvs="太玄神功,10",lv=20 } } },

{ name="蛤蟆功",info="西毒欧阳锋的独创内功，“呱呱”",yin=70.0,yang=0.0,attack=0.65,critical=0.3,defence=0.4,hard=6.0,icon="aoyijue",
trigger={ 
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="powerup_skill",argvs="灵蛇拳,80",lv=18 } } },

{ name="小无相功",info="无相，即没脸，不要脸的功夫……",yin=55.0,yang=55.0,attack=0.6,critical=0.4,defence=0.6,hard=6.0,icon="baililuoxuesi",
trigger={ 
{ name="eq_talent",argvs="斗魂",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="attribute",argvs="福缘,10",lv=14 },
{ name="attribute",argvs="福缘,10",lv=16 },
{ name="powerup_internalskill",argvs="龙象般若功,15",lv=20 } } },

{ name="太极神功",info="张三丰所悟的太极心法",yin=60.0,yang=60.0,attack=0.4,critical=0.3,defence=0.4,hard=7.0,icon="canmangjian",
trigger={ 
{ name="talent",argvs="太极高手",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="powerup_skill",argvs="太极拳,12",lv=15 },
{ name="powerup_skill",argvs="太极剑,12",lv=15 },
{ name="powerup_internalskill",argvs="纯阳无极功,12",lv=18 },
{ name="anti_debuff",argvs="10",lv=20 } } },

{ name="北冥神功",info="逍遥派心法宝典，能够吸取内力",yin=40.0,yang=40.0,attack=0.35,critical=0.15,defence=0.4,hard=7.0,icon="chihuangdaofa",
trigger={ 
{ name="eq_talent",argvs="北冥神功",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="attribute",argvs="根骨,12",lv=15 },
{ name="talent",argvs="鲲跃北溟",lv=20 } } },

{ name="控鹤功",info="谢烟客的心法",yin=70.0,yang=40.0,attack=0.85,critical=0.6,defence=0.4,hard=7.0,icon="chongzhuang",
trigger={ 
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="critical",argvs="20",lv=14 },
{ name="attribute",argvs="根骨,12",lv=16 },
{ name="sp",argvs="0.1",lv=20 } } },

{ name="无妄神功",info="依“无妄”卦象所创内功，讲求“天雷无妄，无妄而得，必有所失，必有所得”",yin=60.0,yang=60.0,attack=0.6,critical=0.3,defence=0.6,hard=7.0,icon="chuanyunjian",
trigger={ 
{ name="eq_talent",argvs="破甲",lv=10 },
{ name="eq_talent",argvs="真气护体",lv=10 },
{ name="eq_talent",argvs="金钟罩",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="sp",argvs="0.25",lv=15 } } },

{ name="太玄神功",info="侠客岛石壁上记载的神奇无上内功",yin=80.0,yang=80.0,attack=0.7,critical=0.1,defence=0.65,hard=7.0,icon="cjjfjf",
trigger={ 
{ name="eq_talent",argvs="真气护体",lv=10 },
{ name="eq_talent",argvs="百穴归一",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="attack",argvs="100,20",lv=15 },
{ name="talent",argvs="吴钩霜雪",lv=20 } } },

{ name="血海魔功",info="血刀门神秘的邪恶内功",yin=90.0,yang=90.0,attack=1.0,critical=0.2,defence=0.0,hard=7.0,icon="cjmenghanquan",
trigger={ 
{ name="eq_talent",argvs="血海魔功",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="powerup_skill",argvs="血刀大法,15",lv=12 },
{ name="xi",argvs="25",lv=14 },
{ name="powerup_skill",argvs="血刀大法,15",lv=16 },
{ name="powerup_aoyi",argvs="血刀大法奥义.血海无边,37,12",lv=18 },
{ name="critical",argvs="10.0",lv=19 },
{ name="talent",argvs="魔神降临",lv=20 } } },

{ name="混元功",info="华山派由内而外的内功，需配合混元掌使用。",yin=40.0,yang=40.0,attack=0.5,critical=0.1,defence=0.5,hard=7.0,icon="cjmenghanxinfa",
trigger={ 
{ name="eq_talent",argvs="拳掌封印",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="powerup_skill",argvs="混元掌,15",lv=12 },
{ name="powerup_skill",argvs="混元掌,15",lv=14 },
{ name="powerup_skill",argvs="混元掌,15",lv=15 },
{ name="powerup_skill",argvs="混元掌奥义.劈石破玉拳,15,8",lv=16 },
{ name="powerup_skill",argvs="混元掌奥义.劈石破玉拳,15,8",lv=18 },
{ name="powerup_skill",argvs="混元掌奥义.劈石破玉拳,15,10",lv=20 } } },

{ name="寒冰真气",info="嵩山派掌门左冷禅的独门内功",yin=70.0,yang=-70.0,attack=0.5,critical=0.1,defence=0.5,hard=7.0,icon="dafengche",
trigger={ 
{ name="eq_talent",argvs="拳掌封印",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="talent",argvs="寒冰真气",lv=14 },
{ name="powerup_internalskill",argvs="寒冰真气,40",lv=20 } } },

{ name="日月心经",info="日月神教代代相传的心法",yin=70.0,yang=70.0,attack=0.6,critical=0.3,defence=0.6,hard=7.0,icon="dalangquan",
trigger={ 
{ name="eq_talent",argvs="拳掌封印",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="attribute",argvs="根骨,12",lv=14 },
{ name="sp",argvs="0.1",lv=15 } } },

{ name="八荒六合唯我独尊功",info="易经归藏，天地至理，八荒六合，唯我独尊",yin=75.0,yang=75.0,attack=0.8,critical=0.3,defence=0.6,hard=8.0,icon="dizihua",
trigger={ 
{ name="eq_talent",argvs="不老长春",lv=10 },
{ name="eq_talent",argvs="金钟罩",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="animation",argvs="化身为天山童姥,guoxiang",lv=14 },
{ name="powerup_skill",argvs="天山折梅手,25",lv=14 },
{ name="powerup_aoyi",argvs="灵鹫宫绝学.天地唯我独尊,25,10",lv=16 },
{ name="powerup_aoyi",argvs="灵鹫宫绝学.天地唯我独尊,25,10",lv=18 },
{ name="sp",argvs="0.1",lv=20 } } },

{ name="神照功",info="有神罩着，当然牛逼了",yin=70.0,yang=70.0,attack=0.7,critical=0.25,defence=0.75,hard=8.0,icon="dulequan",
trigger={ 
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="eq_talent",argvs="无尽斗志",lv=10 },
{ name="attribute",argvs="根骨,12",lv=14 },
{ name="powerup_skill",argvs="连城剑法,12",lv=16 },
{ name="eq_talent",argvs="我就是神",lv=18 } } },

{ name="先天功",info="先天真气，生生不息",yin=70.0,yang=70.0,attack=0.7,critical=0.25,defence=0.5,hard=8.0,icon="erhupuyang",
trigger={ 
{ name="eq_talent",argvs="真气护体",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="anti_debuff",argvs="5",lv=12 },
{ name="attribute",argvs="根骨,12",lv=14 },
{ name="powerup_aoyi",argvs="全真绝学.三花聚顶,15,5",lv=16 },
{ name="powerup_aoyi",argvs="全真绝学.三花聚顶.炼神返虚,15,5",lv=18 },
{ name="powerup_internalskill",argvs="九阴神功,12",lv=20 } } },

{ name="纯阳无极功",info="武当派张三丰所创至高心法，必须处男才能使哦~",yin=-50.0,yang=100.0,attack=0.65,critical=0.2,defence=0.7,hard=9.0,icon="cjmenghanxinfa",
trigger={ 
{ name="eq_talent",argvs="诸般封印",lv=10 },
{ name="eq_talent",argvs="真气护体",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="powerup_skill",argvs="太极拳,12",lv=10 },
{ name="powerup_skill",argvs="太极剑,12",lv=10 },
{ name="powerup_aoyi",argvs="武当绝学.太极拳奥义,10,6",lv=15 },
{ name="powerup_aoyi",argvs="武当绝学.太极剑奥义,10,6",lv=15 },
{ name="sp",argvs="0.1",lv=20 } } },

{ name="龙象般若功",info="雪山密宗的盖世奇功",yin=80.0,yang=80.0,attack=0.65,critical=0.35,defence=0.8,hard=9.0,icon="dafengche",
trigger={ 
{ name="eq_talent",argvs="斗魂",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="defence",argvs="0,100",lv=15 },
{ name="anti_debuff",argvs="10",lv=18 } } },

{ name="铁血大旗功",info="铁剑门绝传内功,大成后周身运转无碍,有夺天之造化",yin=80.0,yang=80.0,attack=0.8,critical=0.1,defence=0.7,hard=9.0,icon="dalangquan",
trigger={ 
{ name="eq_talent",argvs="攀云乘龙",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="attribute",argvs="身法,15",lv=13 },
{ name="powerup_aoyi",argvs="铁剑门绝学.银河落九天,15,10",lv=16 },
{ name="eq_talent",argvs="神行百变",lv=17 },
{ name="talent",argvs="铁剑掌门",lv=20 } } },

{ name="易筋经",info="少林至高无上的内功宝典",yin=90.0,yang=90.0,attack=0.7,critical=0.2,defence=0.8,hard=10.0,icon="dizihua",
trigger={ 
{ name="eq_talent",argvs="普照",lv=10 },
{ name="eq_talent",argvs="清心",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="defence",argvs="40,5",lv=12 },
{ name="anti_debuff",argvs="20.0",lv=16 },
{ name="anti_debuff",argvs="20.0",lv=20 } } },

{ name="九阴神功",info="至高无上的内功心法",yin=100.0,yang=40.0,attack=0.9,critical=0.5,defence=0.45,hard=10.0,icon="dulequan",
trigger={ 
{ name="eq_talent",argvs="破甲",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="attack",argvs="40,5",lv=12 },
{ name="attack",argvs="40,5",lv=16 },
{ name="eq_talent",argvs="怒不可遏",lv=20 },
{ name="critical",argvs="15.0",lv=20 } } },

{ name="逆运九阴神功",info="走火入魔的九阴神功",yin=100.0,yang=0.0,attack=1.0,critical=1.0,defence=0.0,hard=10.0,icon="erhupuyang",
trigger={ 
{ name="eq_talent",argvs="破甲",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="attack",argvs="40,5",lv=12 },
{ name="attack",argvs="40,5",lv=16 },
{ name="eq_talent",argvs="我是疯子",lv=20 },
{ name="sp",argvs="0.1",lv=20 } } },

{ name="九阳神功",info="至高无上的内功心法",yin=40.0,yang=100.0,attack=0.6,critical=0.3,defence=0.9,hard=10.0,icon="paiji",
trigger={ 
{ name="eq_talent",argvs="金钟罩",lv=10 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="defence",argvs="15,15",lv=12 },
{ name="anti_debuff",argvs="10",lv=16 },
{ name="eq_talent",argvs="至刚至阳",lv=20 } } },

{ name="葵花宝典",info="欲练神功，必先自宫",yin=100.0,yang=-100.0,attack=1.0,critical=0.4,defence=0.6,hard=10.0,icon="pllhd",
trigger={ 
{ name="eq_talent",argvs="自我主义",lv=1 },
{ name="eq_talent",argvs="斗魂",lv=5 },
{ name="eq_talent",argvs="飘然",lv=8 },
{ name="attribute",argvs="根骨,12",lv=10 },
{ name="powerup_skill",argvs="辟邪剑法,6",lv=12 },
{ name="powerup_skill",argvs="辟邪剑法,6",lv=15 },
{ name="powerup_skill",argvs="辟邪剑法,6",lv=18 },
{ name="animation",argvs="化身为东方不败,dongfang",lv=20 } } },

{ name="黑炎心法",info="神秘的黑暗武学",yin=100.0,yang=100.0,attack=1.0,critical=1.0,defence=1.0,hard=12.0,icon="polangjue",
trigger={ 
{ name="eq_talent",argvs="魔神降临",lv=10 },
{ name="attribute",argvs="根骨,5",lv=10 } } },

{ name="墨阴神功",info="传自战国墨家的古老心法，适宜女性使用",yin=130.0,yang=100.0,attack=1.0,critical=1.0,defence=1.0,hard=14.0,icon="qianlizhongyunsi",
trigger={ 
{ name="attribute",argvs="定力,20",lv=5 },
{ name="powerup_internalskill",argvs="墨阳神功,40",lv=10 },
{ name="sp",argvs="0.2",lv=12 } } },

{ name="墨阳神功",info="传自战国墨家的古老心法，适宜男性使用",yin=100.0,yang=130.0,attack=1.0,critical=1.0,defence=1.0,hard=14.0,icon="qiannianshengong",
trigger={ 
{ name="attribute",argvs="福源,20",lv=5 },
{ name="powerup_internalskill",argvs="墨阴神功,40",lv=10 },
{ name="sp",argvs="0.2",lv=12 } } },

}
return internal_skill