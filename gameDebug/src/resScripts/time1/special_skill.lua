local special_skill={

{ name="华佗再世",info="治疗一个角色，治疗血量受自身的根骨与福缘加成。",coverType=0,castSize=1,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=200,cd=1,costball=0,hitself=false,icon="paiji",buff="" },

{ name="一刀两断",info="威力无匹的攻击，一定几率减对方一半气血",coverType=3,castSize=1,coverSize=0,audio="音效.利器4",animation="test",costMp=400,cd=5,costball=3,hitself=false,icon="pllhd",buff="" },

{ name="沉鱼落雁",info="美人顾盼，消除对方的怒气",coverType=4,castSize=1,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=100,cd=4,costball=1,hitself=false,icon="polangjue",buff="" },

{ name="打鸡血",info="通过自我激励，增加自身怒气值和攻击力",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=100,cd=4,costball=0,hitself=false,icon="qianlizhongyunsi",buff="攻击强化.3.5.100" },

{ name="诗酒飘零",info="进入醉酒模式，攻击变得不可理喻",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=300,cd=2,costball=2,hitself=false,icon="qiannianshengong",buff="醉酒.0.3.100" },

{ name="凌波微步",info="使身形变得飘忽不可见",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=250,cd=10,costball=3,hitself=false,icon="qingfengzhang",buff="飘渺.8.3.100#神行.1.3.100" },

{ name="雪遁步行",info="血刀门的身法技能，可以增加自身闪避及集气速度。",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=100,cd=12,costball=1,hitself=false,icon="qmscd",buff="飘渺.3.5.100#神行.1.2.100" },

{ name="同归剑法",info="全真教绝技，对自己同时造成1000点真实伤害，对敌人造成更大伤害",coverType=0,castSize=1,coverSize=0,audio="音效.利器4",animation="test",costMp=250,cd=6,costball=1,hitself=false,icon="paiji",buff="" },

{ name="天地同寿",info="以死亡和减少10点生命上限为代价，予以与自身残余气血相关的极大伤害。",coverType=0,castSize=1,coverSize=0,audio="音效.利器4",animation="test",costMp=0,cd=1,costball=0,hitself=false,icon="pllhd",buff="" },

{ name="笑傲江湖曲",info="一曲笑傲惊天下，增强我方全体攻击力",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=500,cd=5,costball=2,hitself=false,icon="polangjue",buff="" },

{ name="襄儿的心愿",info="襄儿的心愿，就是随时可以召唤大哥哥保护自己！对敌人造成随机真实伤害。攻击上限随襄儿等级提升。",coverType=1,castSize=1,coverSize=0,audio="音效.利器4",animation="test",costMp=300,cd=5,costball=2,hitself=false,icon="qianlizhongyunsi",buff="" },

{ name="火枪",info="韦小宝的掏出他的火枪向敌人射击，造成真实伤害（无视护甲）及重伤敌人。伤害取决于敌我“福缘”的差距。",coverType=0,castSize=0,coverSize=0,audio="音效.手枪",animation="test",costMp=50,cd=2,costball=0,hitself=false,icon="qiannianshengong",buff="伤害加深.3.3.100#缓速.3.3.100" },

{ name="撒石灰",info="韦小宝的下三滥手段，撒出石灰粉迷住对方的眼睛",coverType=1,castSize=0,coverSize=0,audio="音效.暗器1",animation="test",costMp=100,cd=3,costball=0,hitself=false,icon="qingfengzhang",buff="致盲.10.2.100" },

{ name="溜须拍马",info="千穿万穿，马屁不穿。韦小宝的护身绝技。",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=0,cd=5,costball=0,hitself=false,icon="qmscd",buff="溜须拍马.0.3.100" },

{ name="易容术",info="阿朱的易容绝技，可藏身于敌阵之中。暗中突袭，威力巨大。",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=100,cd=3,costball=0,hitself=false,icon="qiannianshengong",buff="" },

{ name="过肩摔",info="将对手摔到身后并定身、麻痹，造成基于敌我定力之差的真实伤害",coverType=0,castSize=1,coverSize=0,audio="音效.闷拳",animation="test",costMp=0,cd=2,costball=1,hitself=false,icon="qingfengzhang",buff="定身.0.4.100#麻痹.3.4.100" },

{ name="神龙摆尾",info="一脚将对手踢开并定身、麻痹，造成基于移动距离的真实伤害",coverType=0,castSize=1,coverSize=0,audio="音效.闷拳",animation="test",costMp=0,cd=2,costball=1,hitself=false,icon="qmscd",buff="定身.0.4.100#麻痹.3.4.100" },

{ name="闪电貂",info="钟灵所饲养的毒性极强的闪电貂。",coverType=0,castSize=5,coverSize=0,audio="音效.利器4",animation="test",costMp=100,cd=5,costball=2,hitself=false,icon="quyueburugui",buff="中毒.20.3.100" },

{ name="清心普善咒",info="清雅脱俗，宁神静气。解除全体队友异常状态。",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=200,cd=3,costball=0,hitself=false,icon="shuiyuechenghua",buff="" },

{ name="阿碧的歌声",info="阿碧的歌声，柔美秀丽，解除全体队友异常状态。",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=100,cd=3,costball=0,hitself=false,icon="quyuefenghuaxueyue",buff="" },

{ name="吴侬软语",info="吴侬软语，闻者心醉，解除敌人所有增益状态。",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=100,cd=3,costball=0,hitself=false,icon="paiji",buff="" },

{ name="武穆兵法",info="武穆兵法排兵布阵，增强所有队友能力",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=500,cd=5,costball=4,hitself=false,icon="pllhd",buff="" },

{ name="解毒",info="不管多么强的毒，一律清除",coverType=4,castSize=10,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=200,cd=1,costball=0,hitself=false,icon="polangjue",buff="" },

{ name="梯云纵",info="武当派冠绝天下的身法，能加快战斗集气速度。",coverType=0,castSize=0,coverSize=0,audio="音效.恢复类物品",animation="test",costMp=350,cd=10,costball=5,hitself=false,icon="qianlizhongyunsi",buff="神行.4.2.100" },

{ name="六合劲",info="以武当派精纯的内功对对手进行攻击，可以立即打散对手的集气。",coverType=1,castSize=3,coverSize=0,audio="音效.内功攻击5",animation="test",costMp=50,cd=8,costball=4,hitself=false,icon="qiannianshengong",buff="麻痹.1.2.100" },

{ name="腐尸毒",info="立即清算敌人的中毒，造成真实伤害。",coverType=4,castSize=2,coverSize=0,audio="音效.内功攻击5",animation="test",costMp=300,cd=6,costball=4,hitself=false,icon="qingfengzhang",buff="" },

{ name="飞星术",info="星宿派狠毒的招数，不管敌我，全场随机中毒。",coverType=0,castSize=0,coverSize=0,audio="音效.利器3",animation="test",costMp=600,cd=7,costball=0,hitself=false,icon="qmscd",buff="" },

}
return special_skill