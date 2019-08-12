local story={

{ name="游戏开场选择",
action={ 
{ type="SELECT",value=[=[主角#金庸群侠传X的作者是谁#汉家松鼠#寒假松鼠#韩家松鼠#汉家松树]=] } },
result={ 
{ ret=0,type="story",value=[=[回答0_2]=],
condition={  } },
{ ret=1,type="story",value=[=[回答0]=],
condition={  } },
{ ret=2,type="story",value=[=[回答0]=],
condition={  } },
{ ret=3,type="story",value=[=[回答0]=],
condition={  } } } },

{ name="问题1",
action={ 
{ type="SELECT",value=[=[主角#你希望主角是男的还是女的#男的#女的]=] } },
result={ 
{ ret=0,type="story",value=[=[回答1]=],
condition={  } },
{ ret=1,type="story",value=[=[回答1_2]=],
condition={  } } } },

{ name="问题2",
action={ 
{ type="SELECT",value=[=[主角#你希望拥有怎样的故事#平凡#辛酸#快乐#忧愁]=] } },
result={ 
{ ret=0,type="story",value=[=[回答2_1]=],
condition={  } },
{ ret=1,type="story",value=[=[回答2_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答2_3]=],
condition={  } },
{ ret=3,type="story",value=[=[回答2_4]=],
condition={  } } } },

{ name="问题2_2",
action={ 
{ type="SELECT",value=[=[主角#你希望拥有怎样的故事#静好#风尘#沧桑#孤独]=] } },
result={ 
{ ret=0,type="story",value=[=[回答2_2_1]=],
condition={  } },
{ ret=1,type="story",value=[=[回答2_2_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答2_2_3]=],
condition={  } },
{ ret=3,type="story",value=[=[回答2_2_4]=],
condition={  } } } },

{ name="问题3",
action={ 
{ type="SELECT",value=[=[主角#你觉得有情人终成？#兄妹#眷属#路人]=] } },
result={ 
{ ret=0,type="story",value=[=[回答3]=],
condition={  } },
{ ret=1,type="story",value=[=[回答3_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答3_3]=],
condition={  } } } },

{ name="问题4",
action={ 
{ type="SELECT",value=[=[主角#以下句子你最喜欢哪个#人生百年，吾道不孤。#有情人终成兄妹！#既不回头,何必不忘,若是无缘,何须誓言.#两情若是久长时 又岂在朝朝暮暮.]=] } },
result={ 
{ ret=0,type="story",value=[=[回答4]=],
condition={  } },
{ ret=1,type="story",value=[=[回答4_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答4_3]=],
condition={  } },
{ ret=3,type="story",value=[=[回答4_4]=],
condition={  } } } },

{ name="问题5",
action={ 
{ type="SELECT",value=[=[主角#你相信命运吗?#我的命运属于我,怎么会由别人定下.#或许冥冥中,真的有一些事早已被定下了吧.#不知道]=] } },
result={ 
{ ret=0,type="story",value=[=[回答5]=],
condition={  } },
{ ret=1,type="story",value=[=[回答5_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答5_3]=],
condition={  } },
{ ret=3,type="story",value=[=[回答5_4]=],
condition={  } } } },

{ name="问题6",
action={ 
{ type="SELECT",value=[=[主角#你相信爱情吗?#我希望有一天,我的意中人,会踏着七彩祥云,来娶我.#颜值即是正义。#信或不信，有这么重要吗？#愿得一人心，白首不相离]=] } },
result={ 
{ ret=0,type="story",value=[=[回答6_1_1]=],
condition={  } },
{ ret=1,type="story",value=[=[回答6_1_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答6_1_3]=],
condition={  } },
{ ret=3,type="story",value=[=[回答6_1_4]=],
condition={  } } } },

{ name="问题6_2",
action={ 
{ type="SELECT",value=[=[主角#一见钟情是什么感觉？#此生再无其他！#与君初相识，似是故人归。#孩子叫什么我都想好了。#请知乎"一见钟情是什么感觉、体验？"]=] } },
result={ 
{ ret=0,type="story",value=[=[回答6_2_1]=],
condition={  } },
{ ret=1,type="story",value=[=[回答6_2_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答6_2_3]=],
condition={  } },
{ ret=3,type="story",value=[=[回答6_2_4]=],
condition={  } } } },

{ name="问题7",
action={ 
{ type="SELECT",value=[=[主角#你愿意为你爱的人赴死吗?#愿意#不愿意#不知道]=] } },
result={ 
{ ret=0,type="story",value=[=[回答7]=],
condition={  } },
{ ret=1,type="story",value=[=[回答7_2]=],
condition={  } },
{ ret=2,type="story",value=[=[回答7_3]=],
condition={  } } } },

{ name="回答0",
action={ 
{ type="DIALOG",value=[=[主角#这你都猜不对，你玩没玩过游戏啊。]=] } },
result={ 
{ ret=0,type="story",value=[=[问题1]=],
condition={  } } } },

{ name="回答0_2",
action={ 
{ type="DIALOG",value=[=[主角#这你都猜对了，这是给你的奖励]=] },
{ type="ITEM",value=[=[汉家松鼠纪念章#1]=] } },
result={ 
{ ret=0,type="story",value=[=[问题1]=],
condition={  } } } },

{ name="回答1",
action={ 
{ type="DIALOG",value=[=[主角#男的就男的吧]=] },
{ type="SET.SEX",value=[=[主角#MAN]=] },
{ type="SET.TAG",value=[=[男]=] },
{ type="HEAD.SELECT",value=[=[主角#开始男头像选择]=] } },
result={ 
{ ret=0,type="story",value=[=[问题2]=],
condition={  } } } },

{ name="回答1_2",
action={ 
{ type="DIALOG",value=[=[主角#我觉得屏幕前的你可能是一个猥琐男？]=] },
{ type="SET.SEX",value=[=[主角#WOMAN]=] },
{ type="SET.TAG",value=[=[女]=] },
{ type="HEAD.SELECT",value=[=[主角#开始女头像选择]=] } },
result={ 
{ ret=0,type="story",value=[=[问题2_2]=],
condition={  } } } },

{ name="回答2_1",
action={ 
{ type="DIALOG",value=[=[主角#平平淡淡才是真,不过,有点波澜未必不好]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答2_2",
action={ 
{ type="DIALOG",value=[=[主角#这尘世究竟如何？便是如人饮水，冷暖自知。]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答2_3",
action={ 
{ type="DIALOG",value=[=[主角#不知红颜远，不懂相思苦，不晓世事艰深。这样的日子何其难。]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答2_4",
action={ 
{ type="DIALOG",value=[=[主角#抽刀断水水更流，举杯消愁愁更愁。人生在世不称意，明朝散发弄扁舟。]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答2_2_1",
action={ 
{ type="DIALOG",value=[=[主角#岁月静好，岁月却也无情!这世间没有什么能逃得过岁月的摧残。]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答2_2_2",
action={ 
{ type="DIALOG",value=[=[主角#俗世凡尘，各有悲欢。但愿人长久，但愿少别离。]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答2_2_3",
action={ 
{ type="DIALOG",value=[=[主角#人间沧桑，又见新颜！]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答2_2_4",
action={ 
{ type="DIALOG",value=[=[主角#这前路，艰难险阻，却再不能回头。]=] } },
result={ 
{ ret=0,type="story",value=[=[问题3]=],
condition={  } } } },

{ name="回答3",
action={ 
{ type="DIALOG",value=[=[主角#对，有情人终成兄妹，这是给你的奖励]=] },
{ type="UPGRADE.DINGLI",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题4]=],
condition={  } } } },

{ name="回答3_2",
action={ 
{ type="DIALOG",value=[=[主角#什么？？？有情人是不可能成为眷属的。下一个问题]=] } },
result={ 
{ ret=0,type="story",value=[=[问题4]=],
condition={  } } } },

{ name="回答3_3",
action={ 
{ type="DIALOG",value=[=[主角#何苦来哉！年纪不大经历不少，领悟颇深。]=] },
{ type="UPGRADE.FUYUAN",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题4]=],
condition={  } } } },

{ name="回答4",
action={ 
{ type="DIALOG",value=[=[主角#越来越多的人，会理解你。]=] },
{ type="UPGRADE.GENGU",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题5]=],
condition={  } } } },

{ name="回答4_2",
action={ 
{ type="DIALOG",value=[=[主角#很多有情人，即使不受到诅咒，他们依然亲昵的称呼对方是兄妹。]=] },
{ type="UPGRADE.WUXING",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题5]=],
condition={  } } } },

{ name="回答4_3",
action={ 
{ type="DIALOG",value=[=[主角#今日种种，似水无痕，明日何兮，君已陌路。]=] },
{ type="UPGRADE.SHENFA",value=[=[主角#15]=] } },
result={ 
{ ret=0,type="story",value=[=[问题5]=],
condition={  } } } },

{ name="回答4_4",
action={ 
{ type="DIALOG",value=[=[主角#有情的人啊，你们真的有情吗。等到以后再回首时，才知道自己究竟错过了什么？]=] } },
result={ 
{ ret=0,type="story",value=[=[问题5]=],
condition={  } } } },

{ name="回答5",
action={ 
{ type="DIALOG",value=[=[主角#不知道云天河说出我命由我，不由天的时候，是怎样的心情。]=] },
{ type="UPGRADE.FUYUAN",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题6]=],
condition={ 
{ type="HAS.TAG",value="女" } } },
{ ret=0,type="story",value=[=[问题6_2]=],
condition={ 
{ type="HAS.TAG",value="男" } } } } },

{ name="回答5_2",
action={ 
{ type="DIALOG",value=[=[主角#就算有所谓命运，难道就不去做抗争？]=] } },
result={ 
{ ret=0,type="story",value=[=[问题6]=],
condition={ 
{ type="HAS.TAG",value="女" } } },
{ ret=0,type="story",value=[=[问题6_2]=],
condition={ 
{ type="HAS.TAG",value="男" } } } } },

{ name="回答5_3",
action={ 
{ type="DIALOG",value=[=[主角#有或者没有，这和我有什么关系呢]=] },
{ type="UPGRADE.DINGLI",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题6]=],
condition={ 
{ type="HAS.TAG",value="女" } } },
{ ret=0,type="story",value=[=[问题6_2]=],
condition={ 
{ type="HAS.TAG",value="男" } } } } },

{ name="回答6_1_1",
action={ 
{ type="DIALOG",value=[=[主角#或许他更应该披着金甲圣衣？而且得是一个英雄。如果是平凡的人，偶得七彩祥云，踏着它来，你会不会嫁？]=] },
{ type="UPGRADE.FUYUAN",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答6_1_2",
action={ 
{ type="DIALOG",value=[=[主角#颜值，好或者不好有那么重要吗？若是有一天你也变丑了，你又如何期许？]=] },
{ type="UPGRADE.BILI",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答6_1_3",
action={ 
{ type="DIALOG",value=[=[主角#确实不重要，求而既得，求而不得，唯心而已。]=] },
{ type="UPGRADE.WUXING",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答6_1_4",
action={ 
{ type="DIALOG",value=[=[主角#若是一生不得人心，又会如何？退而求其次？或是一直等下去。]=] },
{ type="UPGRADE.WUXING",value=[=[主角#15]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答6_2_1",
action={ 
{ type="DIALOG",value=[=[主角#或许这才是负责任的态度。]=] },
{ type="UPGRADE.DINGLI",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答6_2_2",
action={ 
{ type="DIALOG",value=[=[主角#天涯明月新，朝暮最相思。]=] },
{ type="UPGRADE.GENGU",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答6_2_3",
action={ 
{ type="DIALOG",value=[=[主角#这都想好了，还不行动？单身一辈子吗。]=] },
{ type="UPGRADE.BILI",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答6_2_4",
action={ 
{ type="DIALOG",value=[=[主角#像你这样机智的同学，平时作业也是抄的吧。]=] },
{ type="UPGRADE.WUXING",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[问题7]=],
condition={  } } } },

{ name="回答7",
action={ 
{ type="DIALOG",value=[=[主角#如此决断，当真想过？]=] },
{ type="LEARN.TALENT",value=[=[主角#痴情]=] } },
result={ 
{ ret=0,type="story",value=[=[开场改名]=],
condition={  } } } },

{ name="回答7_2",
action={ 
{ type="DIALOG",value=[=[主角#如此理智，不觉得可惜吗？]=] } },
result={ 
{ ret=0,type="story",value=[=[开场改名]=],
condition={  } } } },

{ name="回答7_3",
action={ 
{ type="DIALOG",value=[=[主角#我一个单身狗，怎么会知道。你这都是些什么问题，我怀疑你们歧视单身狗。]=] },
{ type="ITEM",value=[=[单身狗之证#1]=] } },
result={ 
{ ret=0,type="story",value=[=[开场改名]=],
condition={  } } } },

{ name="开场改名",
action={ 
{ type="ALTER.NAME",value=[=[主角]=] } },
result={ 
{ ret=0,type="story",value=[=[最后的问题]=],
condition={  } } } },

{ name="最后的问题",
action={ 
{ type="DIALOG",value=[=[主角#对了，还有最后一个问题。]=] },
{ type="SELECT",value=[=[主角#世界上最好的编程语言是什么？#对不起PHP天下第一。#C++真的可以为所欲为。#C语言表示以上的各位都是弟弟。#Csharp躲在角落瑟瑟发抖#java抱着Csharp不敢说话。#python静静看着各位装逼。#lua跟在C语言后面狐假虎威。#js，ts，sql，ruby，html，css等觉得这个问题完全没什么意义嘛。#lisp睡眼惺忪，不想理睬这个问题。#我又不是程序员我怎么会知道？]=] } },
result={ 
{ ret=0,type="story",value=[=[PHP_NO_1]=],
condition={  } },
{ ret=1,type="story",value=[=[CPP_LANGUAGE]=],
condition={  } },
{ ret=2,type="story",value=[=[C_LANGUAGE]=],
condition={  } },
{ ret=3,type="story",value=[=[CSHARP_LANGUAGE]=],
condition={  } },
{ ret=4,type="story",value=[=[JAVA_LANGUAGE]=],
condition={  } },
{ ret=5,type="story",value=[=[PYTHON_LANGUAGE]=],
condition={  } },
{ ret=6,type="story",value=[=[LUA_LANGUAGE]=],
condition={  } },
{ ret=7,type="story",value=[=[OTHER_LANGUAGE]=],
condition={  } },
{ ret=8,type="story",value=[=[LISP_SLEEP]=],
condition={  } },
{ ret=9,type="story",value=[=[WE_CAN_NOT_KOWN]=],
condition={  } } } },

{ name="PHP_NO_1",
action={ 
{ type="DIALOG",value=[=[主角#PHP天下第一！]=] },
{ type="UPGRADE.FUYUAN",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="CPP_LANGUAGE",
action={ 
{ type="DIALOG",value=[=[主角#这么有眼光，你一定是个单身狗吧]=] },
{ type="UPGRADE.BILI",value=[=[主角#15]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="C_LANGUAGE",
action={ 
{ type="DIALOG",value=[=[主角#竟然选到我了，好吧这或许就是你的命运？]=] },
{ type="UPGRADE.WUXING",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="CSHARP_LANGUAGE",
action={ 
{ type="DIALOG",value=[=[主角#原版金X就是unity所作，]=] },
{ type="UPGRADE.SHENFA",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="JAVA_LANGUAGE",
action={ 
{ type="DIALOG",value=[=[主角#很好，我赐你荣耀]=] },
{ type="UPGRADE.GENGU",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="PYTHON_LANGUAGE",
action={ 
{ type="DIALOG",value=[=[主角#我是一门超级语言，我就问第三方包，谁有我多。]=] },
{ type="UPGRADE.DINGLI",value=[=[主角#10]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="LUA_LANGUAGE",
action={ 
{ type="DIALOG",value=[=[主角#不要选我啊，要选选我大哥]=] },
{ type="UPGRADE.WUXING",value=[=[主角#5]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="OTHER_LANGUAGE",
action={ 
{ type="DIALOG",value=[=[主角#好感动，竟然有人选我们]=] },
{ type="UPGRADE.BILI",value=[=[主角#5]=] },
{ type="UPGRADE.DINGLI",value=[=[主角#5]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="LIST_SLEEP",
action={ 
{ type="DIALOG",value=[=[主角#小伙子这么有前途？]=] },
{ type="UPGRADE.FUYUAN",value=[=[主角#15]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="WE_CAN_NOT_KOWN",
action={ 
{ type="DIALOG",value=[=[主角#不要废话了啊，快开始游戏啊。]=] },
{ type="UPGRADE.DINGLI",value=[=[主角#15]=] } },
result={ 
{ ret=0,type="story",value=[=[开始游戏]=],
condition={  } } } },

{ name="开始游戏",
action={ 
{ type="DIALOG",value=[=[主角#开始游戏]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.男主.开始剧情]=],
condition={ 
{ type="HAS.TAG",value="男" } } },
{ ret=0,type="story",value=[=[开场.变为男]=],
condition={ 
{ type="HAS.TAG",value="女" } } } } },

{ name="开场.变为男",
action={ 
{ type="SPEAK",value=[=[我还没写女主剧情，所以就不要多想了，变成男生吧！]=] },
{ type="DEL.TAG",value=[=[女]=] },
{ type="SET.TAG",value=[=[男]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.男主.开始剧情]=],
condition={  } } } },

{ name="任务.大理.找手镯",
action={ 
{ type="DIALOG",value=[=[大理小孩#谢谢你帮我找到手镯.]=] },
{ type="ITEM",value=[=[铜钱#500]=] },
{ type="DEL.TAG",value=[=[任务.大理.找手镯]=] },
{ type="COMPLETE.MISSION",value=[=[大理.有间客栈.任务找银手镯]=] } },
result={  } },

{ name="任务.大理.找兽皮",
action={ 
{ type="DIALOG",value=[=[大理宁静村老伯#谢谢你给我弄到兽皮..]=] },
{ type="ITEM",value=[=[铜钱#800]=] },
{ type="DEL.TAG",value=[=[任务.大理.找兽皮]=] },
{ type="COMPLETE.MISSION",value=[=[大理.有间客栈.任务找野兽皮]=] } },
result={  } },

{ name="任务.大理.除虎",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#哦?你除掉了恶虎,这是你的奖励]=] },
{ type="ITEM",value=[=[铜钱#998]=] },
{ type="DEL.TAG",value=[=[任务.大理.除虎]=] },
{ type="COMPLETE.MISSION",value=[=[大理.有间客栈.任务除恶虎]=] } },
result={  } },

{ name="任务.大理.三次元",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#你找到了隐藏npc,这是你的奖励]=] },
{ type="ITEM",value=[=[铜钱#888]=] },
{ type="DEL.TAG",value=[=[任务.大理.三次元]=] },
{ type="COMPLETE.MISSION",value=[=[大理.有间客栈.任务三次元]=] } },
result={  } },

{ name="任务.大理.完成以上所有任务",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#嘻嘻嘻]=] },
{ type="ITEM",value=[=[铜钱#1000]=] },
{ type="DEL.TAG",value=[=[任务.大理.完成以上所有任务]=] },
{ type="COMPLETE.MISSION",value=[=[大理.有间客栈.任务完成以上所有任务]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.有间客栈.阴影之下]=],
condition={  } } } },

{ name="任务.大理.木头人",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#你终于打败了木头人]=] },
{ type="ITEM",value=[=[铜钱#200]=] },
{ type="DEL.TAG",value=[=[任务.大理.木头人]=] },
{ type="COMPLETE.MISSION",value=[=[大理.有间客栈.任务大战木头人]=] } },
result={  } },

{ name="大理.男主.开始剧情",
action={ 
{ type="BACKGROUND",value=[=[地图.大理.石头村.家]=] },
{ type="DIALOG",value=[=[大理男主母亲#臭小子快起床了！！！]=] },
{ type="DIALOG",value=[=[主角#啊！娘不要打我啊。我这就起来，这就起来。]=] },
{ type="DIALOG",value=[=[大理男主母亲#你真是，三天不打上房揭瓦。这都什么时辰了，还睡？快起来干活了。]=] },
{ type="DIALOG",value=[=[主角#啊~我已经睡过头了吗？我这就起来，这就起来。]=] },
{ type="DIALOG",value=[=[大理男主母亲#今天家里没米了，去隔壁宁静村换点米来。]=] },
{ type="DIALOG",value=[=[主角#啊？换，拿什么换啊。]=] },
{ type="DIALOG",value=[=[大理男主母亲#哎，最近家里不宽裕，只好拿你养的那只鸡了。]=] },
{ type="DIALOG",value=[=[主角#我的鸡？娘，小红不能换啊。他跟了我一年了。]=] },
{ type="DIALOG",value=[=[大理男主母亲#你去年捡了这只鸡回来，这只鸡就只会吃，吃的是普通鸡的三倍，还不下蛋，也不长个，你爹又走得早，家里劳动力不足，我们也不能白养一直鸡吧。]=] },
{ type="DIALOG",value=[=[大理男主母亲#我们也要生活，也要生存，其实我也舍不得小红的，毕竟那么长时间了。]=] },
{ type="DIALOG",value=[=[大理男主母亲#我们是穷苦人家，不能学人家富家子弟养宠物。我们承担不起。]=] },
{ type="DIALOG",value=[=[主角#娘别说了，我知道了。]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.男主.鸡]=],
condition={  } } } },

{ name="大理.男主.鸡",
action={ 
{ type="DIALOG",value=[=[主角#小红，我…我们不能养你了，你吃得比较多，我们家穷，承担不起这些。]=] },
{ type="DIALOG",value=[=[菜鸡#咕咕咕？咕咕咕咕咕…咕咕！咕————]=] },
{ type="DIALOG",value=[=[主角#我们必须拿你换点米...]=] },
{ type="DIALOG",value=[=[菜鸡#咕咕咕？？(突然跳进了 {{主角}} 怀里，安静的呆着）。]=] },
{ type="DIALOG",value=[=[主角#一只鸡竟然都这么懂事...]=] },
{ type="DIALOG",value=[=[主角#希望你能够找到新的主人。他会敬你爱你，疼你惜你，不用跟着我们受这般苦。]=] },
{ type="DIALOG",value=[=[菜鸡#咕咕咕。。。]=] } },
result={ 
{ ret=0,type="map",value=[=[大理石头村家]=],
condition={  } } } },

{ name="大理.宁静村.讨米",
action={ 
{ type="DIALOG",value=[=[主角#老伯~]=] },
{ type="DIALOG",value=[=[大理宁静村老伯#欸，{{主角}} 又来换米啊。]=] },
{ type="DIALOG",value=[=[主角#是啊。]=] },
{ type="DIALOG",value=[=[大理宁静村老伯#这回你用什么换啊？上次，上次好像是你们家的猪吧，换了十石米啊，这么快就吃完了？]=] },
{ type="DIALOG",value=[=[主角#嗯…这次是一只鸡。]=] },
{ type="DIALOG",value=[=[大理宁静村老伯#鸡？我没有听错吧，一只鸡？可我们这也不养鸡啊。要不你去别处问问？]=] },
{ type="DIALOG",value=[=[主角#老伯，别…这里就两个村，哪里还有别的地方啊。]=] },
{ type="DIALOG",value=[=[大理宁静村老伯#去城里看看，那里可富裕着呢，我看你这鸡毛色不错，兴许能给别人当当宠物呢。]=] },
{ type="DIALOG",value=[=[主角#那我去城里看看吧，谢谢老伯。]=] } },
result={  } },

{ name="大理.石头村.家.母亲",
action={ 
{ type="DIALOG",value=[=[主角#娘，我走了。]=] },
{ type="DIALOG",value=[=[大理男主母亲#走吧，一定要讨价还价，多换点米来。]=] },
{ type="DIALOG",value=[=[主角#嗯…]=] } },
result={  } },

{ name="大理.石头村.家.床",
action={ 
{ type="DIALOG",value=[=[主角#这是你睡觉的床。]=] } },
result={  } },

{ name="大理.有间客栈.打尖住店",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#客官，打尖还是住店。]=] },
{ type="DIALOG",value=[=[主角#对...对...不起我没钱。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#（笑容逐渐消失）哦，没钱，那你有何贵干啊。]=] },
{ type="DIALOG",value=[=[主角#我就是看看，能不能换东西？]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#哦？换点什么，你应该去典当铺换啊。]=] },
{ type="DIALOG",value=[=[主角#我没怎么来过城里，不知道应该去哪里。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#小朋友去别去换吧，我这里不收东西.]=] } },
result={  } },

{ name="大理.青楼.绿珠儿",
action={ 
{ type="DIALOG",value=[=[主角#姐姐，你买鸡吗.]=] },
{ type="DIALOG",value=[=[绿珠儿#小孩子真乖巧，知道叫姐姐.可是姐姐现在没有空呢]=] },
{ type="DIALOG",value=[=[主角#哦...]=] },
{ type="DIALOG",value=[=[绿珠儿#不过我跟你讲，你可千万别去里面哦，这里不是你这种小孩子该来的地方.]=] },
{ type="DIALOG",value=[=[主角#为什么啊.]=] },
{ type="DIALOG",value=[=[绿珠儿#因为。。。我们这里是风月之地。]=] },
{ type="DIALOG",value=[=[主角#什么是风月之地啊。]=] },
{ type="DIALOG",value=[=[绿珠儿#。。。]=] },
{ type="DIALOG",value=[=[绿珠儿#走啦，别问这么多。]=] },
{ type="DIALOG",value=[=[主角#哦。。。]=] } },
result={  } },

{ name="大理.青楼.陈小媛",
action={ 
{ type="DIALOG",value=[=[主角#姐姐，你买鸡吗？]=] },
{ type="DIALOG",value=[=[陈小媛#弟弟，我不买.]=] },
{ type="DIALOG",value=[=[主角#哦…]=] },
{ type="DIALOG",value=[=[陈小媛#你跟着父亲一起来的吗?]=] },
{ type="DIALOG",value=[=[主角#我父亲早就过世了，我自己来的。]=] },
{ type="DIALOG",value=[=[陈小媛#真是苦命人。]=] },
{ type="DIALOG",value=[=[主角#姐姐，那我走了。]=] },
{ type="DIALOG",value=[=[陈小媛#嗯，走吧，不要再来了。]=] },
{ type="DIALOG",value=[=[主角#哦。。。]=] } },
result={  } },

{ name="大理.青楼.顾影莲",
action={ 
{ type="DIALOG",value=[=[主角#姐姐，你买鸡吗.]=] },
{ type="DIALOG",value=[=[顾影莲#...]=] },
{ type="DIALOG",value=[=[主角#姐姐？]=] },
{ type="DIALOG",value=[=[顾影莲#。。。]=] },
{ type="DIALOG",value=[=[主角#好吧，我走了。]=] } },
result={  } },

{ name="大理.大理寺.不能进",
action={ 
{ type="DIALOG",value=[=[大理寺守卫#闲杂人等，不准入内。]=] } },
result={  } },

{ name="大理.段王府.小怜",
action={ 
{ type="SET.MUSIC",value=[=[音乐.只为你活一天]=] },
{ type="DIALOG",value=[=[主角#这里怎么围着这么多人，去看看。]=] },
{ type="DIALOG",value=[=[路人甲#哎，真可怜啊。]=] },
{ type="DIALOG",value=[=[路人乙#太可怜了。但是谁又敢和段王府作对呢。]=] },
{ type="DIALOG",value=[=[主角#这位大哥，这里发生什么事了？]=] },
{ type="DIALOG",value=[=[路人乙#这里一个女娃，在卖身葬母。哎，他们说女娃的母亲在外面有奸情，被抓住了当场打死了。女娃也被怀疑不是段家的血脉，就被一起赶了出来。]=] },
{ type="DIALOG",value=[=[主角#...这么可怜。]=] },
{ type="DIALOG",value=[=[路人乙#哎。。。这女娃也是倔强，什么也不肯说.就在那里立了块牌子，就跪在那里，一个上午了。可是谁又敢去帮她呢。段王府，我们惹不得，不说了，不说了。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="SPEAK",value=[=[突然段王府走出来一个衣着光鲜的男子，满脸却是戾气，气冲冲地走向那个在地上跪着的女孩。]=] },
{ type="DIALOG",value=[=[段鹏#你个贱种，不要在我段王府外面跪着。你就算不是我段家的人了，但是段家的尊严也绝不容你践踏，今天有我在，我看谁敢帮你！]=] },
{ type="SPEAK",value=[=[那个女孩就这样沉默着，沉默的忍受一旁的谩骂，脏兮兮的小手，握紧了又松开，然后握的更紧，手指被握的发白，手在不住的发抖。她抬眼看了看围观的众人，眼神愈发的空洞。]=] },
{ type="SPEAK",value=[=[围观的路人，忽然觉得有一股寒意，如芒在背。不禁都退了一步，只有{{主角}}还傻傻的样子，一动不动，从后排变成了前排。]=] },
{ type="SPEAK",value=[=[忽然，那个女孩，双手合在一起，伏在地上，然后重重地磕了三个头，不知道向的哪里，或许是向九天之上的神明祈祷？又或许，是向九幽之下的恶鬼许诺？又或许。。。是向在场的诸人乞求?]=] },
{ type="SPEAK",value=[=[然后就那样趴在那里，不肯起来。或许每个人都知道这是为什么，但是没有人做出其他的举动，就那样沉默的，淡淡的看着。。。看着这女孩爬在地上，绝望地颤抖。]=] },
{ type="SPEAK",value=[=[有风轻吹过，有雨轻声落。一旁的树木枝头，飞来了几只麻雀，叽叽喳喳叫个不停，也不知道在议论什么。只是{{主角}}怀里的鸡，东张张，西望望，开始不安分了起来。]=] },
{ type="SPEAK",value=[=[突然鸡咕咕叫了起来。从{{主角}} 怀里跳了出来，飞扑向了{{段鹏}}]=] },
{ type="DIALOG",value=[=[段鹏#啊呀，你这只臭鸡，竟然敢啄我。好大的胆子。]=] },
{ type="DIALOG",value=[=[主角#我的鸡！]=] },
{ type="DIALOG",value=[=[段鹏#来人，快来给我抓住这只鸡！看我不把你抓来炖了，一泄心头之恨！被鸡给啄了，晦气（便回府去了）]=] },
{ type="SPEAK",value=[=[{{主角}}看着这突然混乱的场面，心中有一些莫名的冲动，想帮一帮那个无助的女孩。于是，他走向了这个女孩，蹲下身去。]=] },
{ type="DIALOG",value=[=[主角#喂——额...你还好吧。]=] },
{ type="SPEAK",value=[=[那个绝望的女孩，忽然抖了一下，然后，慢慢的起身，转头望向声音的来源。]=] },
{ type="DIALOG",value=[=[段小怜#我叫小怜...段小怜。]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.段王府.小怜2]=],
condition={  } } } },

{ name="大理.段王府.小怜2",
action={ 
{ type="DIALOG",value=[=[主角#我没有钱…]=] },
{ type="DIALOG",value=[=[段小怜#(又慢慢低下了头)嗯…]=] },
{ type="DIALOG",value=[=[主角#不过我可以帮帮你。]=] },
{ type="DIALOG",value=[=[段小怜#（眼神忽然明亮了起来，转头看向{{主角}}，深深的看着眼前这个人，然后破涕为笑）嗯！谢谢哥哥。]=] },
{ type="DIALOG",value=[=[主角#别。。。我还什么都没做呢。我。。。 给你找一辆牛车，帮你把你娘亲埋了吧。]=] },
{ type="DIALOG",value=[=[段小怜#嗯。]=] },
{ type="SET.TAG",value=[=[大理鸡开始]=] },
{ type="SET.TAG",value=[=[大理小怜]=] },
{ type="SUGGEST",value=[=[去找辆牛车。]=] } },
result={  } },

{ name="大理.牛车",
action={ 
{ type="DIALOG",value=[=[主角#老伯，能帮帮忙吗.]=] },
{ type="DIALOG",value=[=[牛车老伯#小朋友，找我什么事啊]=] },
{ type="SPEAK",value=[=[{{主角}}将小怜的事情说与{{牛车老伯}}听。]=] },
{ type="DIALOG",value=[=[牛车老伯#哎，真是可怜，带我去吧，这一趟我免费帮你.]=] },
{ type="DIALOG",value=[=[主角#谢谢。]=] },
{ type="SET.TAG",value=[=[大理牛车]=] } },
result={  } },

{ name="大理.段王府.小怜3",
action={ 
{ type="DIALOG",value=[=[主角#小怜！]=] },
{ type="DIALOG",value=[=[段小怜#哥哥！]=] },
{ type="DIALOG",value=[=[主角#我把牛车老伯找来了。]=] },
{ type="SPEAK",value=[=[{{主角}}帮着{{段小怜}}把她的娘亲抬上了牛车，{{牛车老伯}}驱赶着牛车走向了乱葬岗。{{主角}}和{{段小怜}}一直跟着牛车]=] },
{ type="DIALOG",value=[=[主角#啊！我忘记了，我的鸡呢？]=] },
{ type="BACKGROUND",value=[=[地图.大理.乱葬岗]=] },
{ type="DIALOG",value=[=[段小怜#啊。。。那只鸡啊，我不记得了，可能飞走了吧。]=] },
{ type="DIALOG",value=[=[主角#那我回家肯定要挨骂了。出来一趟米也没换着，鸡也没了。]=] },
{ type="DIALOG",value=[=[段小怜#啊~那可怎么办呀，不如哥哥你回去找找？我自己一个人也是可以的。]=] },
{ type="DIALOG",value=[=[主角#不了，这鸡估计是找不着了，我好人就做到底吧。]=] },
{ type="DIALOG",value=[=[段小怜#哥哥。。。我还不知道你叫什么呢。]=] },
{ type="DIALOG",value=[=[主角#啊？我没说过吗？]=] },
{ type="DIALOG",value=[=[段小怜#嗯，我想哥哥的名字一定很好听。]=] },
{ type="DIALOG",value=[=[主角#。。。（你取名这么搓我好意思讲吗？)]=] },
{ type="DIALOG",value=[=[主角#啊，我姓。。。石，对大家都叫我石头。]=] },
{ type="DIALOG",value=[=[段小怜#哥哥连名字也不肯告诉小怜。。。]=] },
{ type="DIALOG",value=[=[主角#啊！？没有啊，我真的姓石呢，啊。。。大家叫我石头。]=] },
{ type="DIALOG",value=[=[段小怜#那我可以叫你石头哥哥吗？]=] },
{ type="DIALOG",value=[=[主角#嗯，可以啊。]=] },
{ type="DIALOG",value=[=[段小怜#石头哥哥？]=] },
{ type="DIALOG",value=[=[主角#嗯！额。。。我该怎么叫你呢？]=] },
{ type="DIALOG",value=[=[段小怜#叫我小怜就可以了。]=] },
{ type="DIALOG",value=[=[主角#小怜~。]=] },
{ type="DIALOG",value=[=[段小怜#嗯....]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.乱葬岗.小怜1]=],
condition={  } } } },

{ name="大理.乱葬岗.小怜1",
action={ 
{ type="SPEAK",value=[=[天真的两人有一句没一句的说着，无数年来憋在心里从未对他人吐露的话，此刻都说与对方听，或许此时的欢声笑语就是他们二人最快乐的时光。或许此后的一生，就算再艰难，此刻的回忆都会让他们继续前行。]=] },
{ type="DIALOG",value=[=[段小怜#石头哥哥.]=] },
{ type="DIALOG",value=[=[主角#怎么了.]=] },
{ type="DIALOG",value=[=[段小怜#要到了…]=] },
{ type="DIALOG",value=[=[主角#嗯，等会我帮你.]=] },
{ type="DIALOG",value=[=[段小怜#哥哥，不用你帮了，我想最后和我娘亲待一会.]=] },
{ type="DIALOG",value=[=[主角#好吧]=] },
{ type="SET.TAG",value=[=[大理小怜结束]=] } },
result={ 
{ ret=0,type="map",value=[=[大理乱葬岗]=],
condition={  } } } },

{ name="大理.乱葬岗.奇怪1",
action={ 
{ type="DIALOG",value=[=[主角#这里怎么阴风阵阵。]=] },
{ type="DIALOG",value=[=[主角#希望小怜不要出什么事.]=] } },
result={  } },

{ name="大理.乱葬岗.奇怪2",
action={ 
{ type="DIALOG",value=[=[主角#奇怪，怎么突然变冷了。]=] },
{ type="DIALOG",value=[=[主角#小怜那么单薄的衣服。。。希望她不会冻着。]=] } },
result={  } },

{ name="大理.乱葬岗.奇怪3",
action={ 
{ type="DIALOG",value=[=[主角#这么久了，小怜还不下来。]=] },
{ type="DIALOG",value=[=[段小怜#啊！！！！！！！]=] },
{ type="DIALOG",value=[=[主角#好像是小怜的声音，快去看看。]=] } },
result={  } },

{ name="大理.乱葬岗.韦一笑",
action={ 
{ type="DIALOG",value=[=[主角#小怜~]=] },
{ type="DIALOG",value=[=[韦一笑#哦？还有活人？]=] },
{ type="SPEAK",value=[=[{{主角}}来到乱葬岗的这一边，看见一个微微隆起的土坡，一个身形怪异的男子，还有——倒在地上的两个人！这分明是老伯和小怜。]=] },
{ type="DIALOG",value=[=[韦一笑#啊，竟然是个小伙子。可惜我今天吸饱了血，可以饶你一命.]=] },
{ type="DIALOG",value=[=[主角#你!!!你是恶魔，恶魔！]=] },
{ type="DIALOG",value=[=[韦一笑#呵呵，哪里来的小鬼怎地胡乱冤枉人呢？我明教中人虽然都非善类，但也绝不是恶人，今日我寒毒发作，寒冷难耐，不得以吸了这两人的血，却也不见得是害了他们。]=] },
{ type="DIALOG",value=[=[主角#你个恶人！连人都杀了还不是恶人？！]=] },
{ type="DIALOG",value=[=[韦一笑#如果杀人便是恶人。那这世间的好汉不都是恶人？如果我是恶人，你还能在这里跟我讲话吗？]=] },
{ type="DIALOG",value=[=[主角#狡辩！狡辩！！！！]=] },
{ type="DIALOG",value=[=[韦一笑#我刚来的时候就看见了旁边的这座坟，这女娃又在一旁哭诉，想来是年幼丧母！如今世道这么乱，一个弱小的女子，能够是怎样的命运？]=] },
{ type="DIALOG",value=[=[韦一笑#这女娃衣裳的材质不错，却都是脏兮兮的，想来之前是过的富贵，却又不知道什么原因家道中落或者是被赶出家门，这样的女娃锦衣玉食惯了，又能在这世道存活多久？]=] },
{ type="DIALOG",value=[=[韦一笑#我这不是害她，是帮她，与其受到这些苦楚不如早日和下面的亲人团聚？至于这老伯，这么老了还在赶着牛车，想必膝下并无子嗣.]=] },
{ type="DIALOG",value=[=[韦一笑#以后甚至可能没人送终，我提前送他一程罢了.等会我还可以帮点小忙，把他俩埋了.]=] },
{ type="DIALOG",value=[=[主角#你，你，你!!!!!]=] },
{ type="DIALOG",value=[=[主角#恶鬼!恶魔!我跟你拼了.]=] },
{ type="DIALOG",value=[=[韦一笑#哼!我满手血腥，却是不想再造杀孽，你一心求死，我也不会拒绝.]=] },
{ type="BATTLE",value=[=[大理.韦一笑.战]=] } },
result={ 
{ ret="win",type="story",value=[=[作弊]=],
condition={  } },
{ ret="lose",type="story",value=[=[章节过度序章]=],
condition={  } } } },

{ name="章节过度序章",
action={ 
{ type="SPEAK",value=[=[与韦一笑一战终究是差距太大，仅仅是一击，{{主角}}便吐血倒地。韦一笑见{{主角}}已经受了这么重的伤了，想来是不能活了，便没有继续出手。]=] },
{ type="SPEAK",value=[=[在这乱世，所有人都是不幸的，没有武功的人，就更加不幸了，强者就是道理，弱小便只能接受这样的道理。]=] },
{ type="SPEAK",value=[=[{{主角}}的命运又当如何，这尘世上又会上演怎样的离合悲欢呢？]=] },
{ type="SPEAK",value=[=[序章完。]=] },
{ type="SPEAK",value=[=[下一章——俗世凡尘。]=] },
{ type="SET.CHAPTER",value=[=[俗世凡尘]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.绿珠儿.房间.醒来]=],
condition={  } } } },

{ name="大理.青楼.绿珠儿.房间.醒来",
action={ 
{ type="BACKGROUND",value=[=[地图.绿珠儿房间]=] },
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="DIALOG",value=[=[主角#嗯？这是哪？我——我不是死了吗。]=] },
{ type="DIALOG",value=[=[主角#原来阴曹地府长这样。]=] },
{ type="DIALOG",value=[=[主角#这里怎么。。。还有点香气。]=] },
{ type="DIALOG",value=[=[主角#啊，头有点痛。]=] },
{ type="DIALOG",value=[=[绿珠儿#嗯？你醒了啊。]=] },
{ type="DIALOG",value=[=[主角#你是。。。？姐姐？原来你也死了吗。]=] },
{ type="DIALOG",value=[=[绿珠儿#呸，我还活的长着呢。你也没有死啊。]=] },
{ type="DIALOG",value=[=[主角#我还没有死？那小怜呢？小怜呢！]=] },
{ type="DIALOG",value=[=[绿珠儿#小怜？小怜是你什么人？你可在昏睡的时候叫了这个名字784次。]=] },
{ type="DIALOG",value=[=[绿珠儿#784次，这个人欠你很多钱？]=] },
{ type="DIALOG",value=[=[主角#姐姐你是怎么找到我的？]=] },
{ type="DIALOG",value=[=[绿珠儿#你姐姐我啊，昨天有事正好要路过乱葬岗，就看到，一个小孩子倒在地上，就走过去仔细一看，不就是你吗。我就把你小子，背了回来，看把我累的。]=] },
{ type="DIALOG",value=[=[主角#一个人？一个人！没有看到其他人吗？]=] },
{ type="DIALOG",value=[=[陈小媛#（推门而进）哟，小弟弟醒了啊，你姐姐可不像她说的那么轻描淡写，当时她快急死了。还是我给你请的大夫，影莲姐帮你抓的药呢。]=] },
{ type="DIALOG",value=[=[主角#是我着急了。。。谢谢，谢谢各位姐姐。]=] },
{ type="DIALOG",value=[=[绿珠儿#算你小子还有点良心，我当时...看见了你。。。还有两座新坟。应该没有了。]=] },
{ type="DIALOG",value=[=[主角#两座新坟。。。两座新坟。。。]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.绿珠儿.房间.做工]=],
condition={  } } } },

{ name="大理.青楼.绿珠儿.房间.做工",
action={ 
{ type="DIALOG",value=[=[主角#我知道了。。。]=] },
{ type="DIALOG",value=[=[绿珠儿#你也不要太伤心了。]=] },
{ type="DIALOG",value=[=[主角#嗯。。。]=] },
{ type="DIALOG",value=[=[主角#姐姐们，我还要回去和娘亲报平安。]=] },
{ type="DIALOG",value=[=[绿珠儿#我们托人给你娘捎过话，你娘是知道的..]=] },
{ type="DIALOG",value=[=[主角#这样啊，那多谢姐姐了.]=] },
{ type="DIALOG",value=[=[主角#姐姐，你救了我，我无以为报，家中贫寒，也没有可以给你的，唯一的一只鸡也不见了，我可以过来做做帮工吗?]=] },
{ type="DIALOG",value=[=[绿珠儿#你可知道这里是什么地方?这里做工会坏你名声的。]=] },
{ type="DIALOG",value=[=[主角#。。。这里做工有什么不妥的吗？这里的姐姐愿意救我，想来心肠是比外面的那些人好上十倍。]=] },
{ type="DIALOG",value=[=[绿珠儿#。。。弟弟你能这样想，姐姐我很高兴。但是我说了不算，你得去问问妈妈。]=] },
{ type="DIALOG",value=[=[主角#妈妈？]=] },
{ type="DIALOG",value=[=[绿珠儿#我还是帮你叫她吧。]=] },
{ type="DIALOG",value=[=[主角#谢谢姐姐。]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.老鸨]=],
condition={  } } } },

{ name="大理.青楼.老鸨",
action={ 
{ type="DIALOG",value=[=[大理老鸨#是你小子要来我这里做工？]=] },
{ type="DIALOG",value=[=[主角#嗯。]=] },
{ type="DIALOG",value=[=[大理老鸨#既然你小子不怕坏了名声，我也不会亏待你，你就每天给我招呼客人好了，工钱自然少不了你的。]=] },
{ type="DIALOG",value=[=[主角#谢谢，谢谢！]=] },
{ type="DIALOG",value=[=[大理老鸨#你小子说话还挺中听的。看起来会来事。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] } },
result={ 
{ ret=0,type="map",value=[=[绿珠儿房间]=],
condition={  } } } },

{ name="大理.青楼.内阁.绿珠儿日常",
action={ 
{ type="DIALOG",value=[=[主角#绿姐姐好啊。]=] },
{ type="DIALOG",value=[=[绿珠儿#还算你小子有良心，知道来看我。]=] } },
result={  } },

{ name="大理.青楼.内阁.陈小媛1",
action={ 
{ type="DIALOG",value=[=[主角#陈姐姐！]=] },
{ type="DIALOG",value=[=[陈小媛#哎哟，这小嘴甜的，不知道以后得祸害多少姑娘。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] } },
result={  } },

{ name="大理.青楼.内阁.顾影自怜1",
action={ 
{ type="DIALOG",value=[=[主角#顾姐姐，谢谢你为我抓药。]=] },
{ type="DIALOG",value=[=[顾影莲#。。。]=] },
{ type="DIALOG",value=[=[主角#姐姐还是不愿意说话？]=] },
{ type="DIALOG",value=[=[顾影莲#。。。]=] },
{ type="DIALOG",value=[=[主角#打扰了。。。不过还是多谢姐姐了。]=] } },
result={  } },

{ name="大理.石头村.家.母亲.我回来",
action={ 
{ type="DIALOG",value=[=[主角#娘!!!]=] },
{ type="DIALOG",value=[=[大理男主母亲#哎哟我的孩子啊。你可算回来了。]=] },
{ type="DIALOG",value=[=[主角#娘，我差点就回不来了。]=] },
{ type="DIALOG",value=[=[大理男主母亲#娘知道，娘知道，这世道乱啊。]=] },
{ type="DIALOG",value=[=[主角#娘，我去外面找了一份差事，这样就不用那么苦了.]=] },
{ type="DIALOG",value=[=[大理男主母亲#差事?看起来你真的开始出息了.]=] },
{ type="DIALOG",value=[=[主角#娘…]=] },
{ type="DIALOG",value=[=[大理男主母亲#这样娘就放心多了，以后就好好出去闯，家里的事不用操心，有空回来看一看就行了.]=] } },
result={  } },

{ name="大理.乡间小路.深山.待定",
action={ 
{ type="DIALOG",value=[=[主角#你是?叔叔?]=] },
{ type="DIALOG",value=[=[待定#???]=] },
{ type="DIALOG",value=[=[待定#我有这么老吗?]=] },
{ type="DIALOG",value=[=[主角#那是?]=] },
{ type="DIALOG",value=[=[待定#叫哥哥!]=] },
{ type="DIALOG",value=[=[主角#你看起来像坏人!]=] },
{ type="DIALOG",value=[=[待定#乖啊，叔叔啊呸，哥哥给你糖吃.]=] },
{ type="DIALOG",value=[=[主角#???不要!]=] },
{ type="DIALOG",value=[=[待定#好吧，你不要扯闲话了.]=] },
{ type="DIALOG",value=[=[主角#不是你扯的吗???]=] },
{ type="DIALOG",value=[=[待定#...看来你是不想要奖励了.]=] },
{ type="DIALOG",value=[=[主角#刚才我什么都没有说，什么都没有讲，哥哥快给我奖励吧.]=] },
{ type="DIALOG",value=[=[待定#(这厚脸皮，有我当年风范)既然遇到我了，那也少不了你的好处，这里给你]=] },
{ type="ITEM",value=[=[铜钱#998]=] },
{ type="DIALOG",value=[=[主角#谢谢!谢谢!]=] },
{ type="DIALOG",value=[=[待定#差点忘了，欢迎报考重庆理工大学]=] },
{ type="DIALOG",value=[=[主角#嗯!]=] } },
result={  } },

{ name="大理.石头村.后山.山洞.扎西1",
action={ 
{ type="DIALOG",value=[=[主角#啊这里有个可爱的妹妹?!]=] },
{ type="DIALOG",value=[=[扎西#???]=] },
{ type="DIALOG",value=[=[扎西#叫姐姐!!!]=] },
{ type="DIALOG",value=[=[主角#哦!姐姐好啊.]=] },
{ type="DIALOG",value=[=[扎西#算你小子识相，我也不能让你白遇见我]=] },
{ type="DIALOG",value=[=[扎西#送你个东西吧.]=] },
{ type="ITEM",value=[=[银手镯#1]=] },
{ type="DIALOG",value=[=[主角#嗯?谢谢，谢谢!]=] },
{ type="DIALOG",value=[=[扎西#啊，我差点忘了，欢迎报考重庆邮电大学.欢迎来找学姐哦!]=] },
{ type="DIALOG",value=[=[主角#那我是一定要去，考不上我都要去.]=] },
{ type="DIALOG",value=[=[扎西#好啊，我等你哦.]=] } },
result={  } },

{ name="大理.青楼.老鸨1",
action={ 
{ type="DIALOG",value=[=[主角#我来做工了.]=] },
{ type="DIALOG",value=[=[大理老鸨#你来了啊，我找个人带带你吧.]=] },
{ type="DIALOG",value=[=[大理老鸨#小草，过来一下.]=] },
{ type="DIALOG",value=[=[陆小草#我来了，什么事情啊.]=] },
{ type="DIALOG",value=[=[大理老鸨#这里一个新人，带一带他.]=] },
{ type="DIALOG",value=[=[陆小草#那你跟我来吧.]=] },
{ type="SET.TAG.DELAY",value=[=[大理.青楼.太菜了#10#0]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.陆小草1]=],
condition={  } } } },

{ name="大理.青楼.陆小草1",
action={ 
{ type="BACKGROUND",value=[=[地图.大理.青楼.运营]=] },
{ type="DIALOG",value=[=[主角#我应该怎么称呼姐姐?]=] },
{ type="DIALOG",value=[=[陆小草#你怎么叫谁都是姐姐啊，我跟你差不多大的.大家都叫我小草，你也可以这样叫.]=] },
{ type="DIALOG",value=[=[主角#这样不好吧…我觉得叫姐姐挺好的.]=] },
{ type="DIALOG",value=[=[陆小草#不行!你这是把我叫老了.女人很看重自己年龄的.]=] },
{ type="DIALOG",value=[=[主角#这样啊.那…小草?]=] },
{ type="DIALOG",value=[=[陆小草#嗯.]=] },
{ type="DIALOG",value=[=[陆小草#对了我怎么叫你呢?]=] },
{ type="DIALOG",value=[=[主角#(同样的问题…不知道小怜…)]=] },
{ type="DIALOG",value=[=[陆小草#嗯?]=] },
{ type="DIALOG",value=[=[主角#啊我叫石..]=] },
{ type="DIALOG",value=[=[陆小草#那就叫你小石头好了.小草，小石头在一起挺好听的嘛.]=] },
{ type="DIALOG",value=[=[主角#...]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.陆小草2]=],
condition={  } } } },

{ name="大理.青楼.陆小草2",
action={ 
{ type="DIALOG",value=[=[陆小草#你要知道，来我们这里的人，极有可能是达官显贵，所以说话的时候不能冒失，不论是你冲撞了别人，还是别人撞上了你，你都一定要赔礼道歉.]=] },
{ type="DIALOG",value=[=[主角#为什么?]=] },
{ type="DIALOG",value=[=[陆小草#这里面的许多人是我们这辈子都惹不得的.恰逢乱世，有个地方能安身立命，便是相当不易的.不要为了一时冲动毁了自己前程.]=] },
{ type="DIALOG",value=[=[主角#所以就算他们欺负我们?我们都要道歉?]=] },
{ type="DIALOG",value=[=[陆小草#对…]=] },
{ type="DIALOG",value=[=[主角#我知道了.]=] },
{ type="DIALOG",value=[=[陆小草#(不知怎地，心中有一丝悲凉，过早的交代这一切或许对他并不合适)知道了就好]=] },
{ type="SPEAK",value=[=[{{陆小草}}又交代了许多重要的事情，几乎每一件事情，都刷新了{{主角}}的三观.{{主角}}也知道了什么是青楼，也知道了自己的姐姐们做的是什么行当.心中更生一分敬意.]=] },
{ type="SPEAK",value=[=[人生在世，谁都不容易。]=] },
{ type="DIALOG",value=[=[陆小草#该知道的你都知道了，快工作吧。]=] },
{ type="DIALOG",value=[=[主角#嗯。。。还有一件事情，是怎样的上工时间呢?]=] },
{ type="DIALOG",value=[=[陆小草#这个嘛，当然是996了.]=] },
{ type="DIALOG",value=[=[主角#什么意思?]=] },
{ type="DIALOG",value=[=[陆小草#辰时开工，戌时下工.一周工作六天.]=] },
{ type="DIALOG",value=[=[主角#这么长的加班时间?]=] },
{ type="DIALOG",value=[=[陆小草#所以我们没有加班费，这样就不算加班了。]=] },
{ type="DIALOG",value=[=[主角#...他们的良心不会痛吗？]=] },
{ type="DIALOG",value=[=[陆小草#这不是你我能够议论的事情.]=] },
{ type="DIALOG",value=[=[主角#好吧...开始工作了。]=] },
{ type="SET.TAG",value=[=[大理.青楼.运营1]=] } },
result={ 
{ ret=0,type="map",value=[=[大理青楼运营]=],
condition={  } } } },

{ name="大理.青楼.结算",
action={ 
{ type="DIALOG",value=[=[大理老鸨#今天做的不错，这是你的工钱]=] },
{ type="ITEM.RAND.NUMBER",value=[=[铜钱#10#50]=] },
{ type="DEL.TAG",value=[=[大理.青楼.当日结算]=] },
{ type="SET.TAG.DELAY",value=[=[大理.青楼.可打工#1#0]=] } },
result={ 
{ ret=0,type="map",value=[=[大理青楼内阁]=],
condition={  } } } },

{ name="大理.青楼.运营.陆小草1",
action={ 
{ type="DIALOG",value=[=[主角#小草，这些客人似乎从不正眼看我们，你以前也是这般过的吗?]=] },
{ type="DIALOG",value=[=[陆小草#...]=] },
{ type="DIALOG",value=[=[陆小草#便是他们对我，动手动脚，我又能如何?女子一入青楼，就算只是个侍女，便与清白和过往再无关系.]=] },
{ type="DIALOG",value=[=[陆小草#这里本是寻欢的场所，无数想法，回忆和坚持，都会埋葬在欢声笑语中.所以我也不例外.就当这些事都发生在别人身上吧.]=] },
{ type="DIALOG",value=[=[主角#...]=] },
{ type="SET.TAG",value=[=[大理.青楼.当日结算]=] } },
result={  } },

{ name="大理.青楼.运营.绿珠儿1",
action={ 
{ type="DIALOG",value=[=[主角#姐姐!]=] },
{ type="DIALOG",value=[=[绿珠儿#今天陆妹妹都给你说了吧.]=] },
{ type="DIALOG",value=[=[主角#该知道的我都知道了.]=] },
{ type="DIALOG",value=[=[绿珠儿#你一定，很看不起我吧.]=] },
{ type="DIALOG",value=[=[主角#没有的，没有的.我知道姐姐对我好，比外面的人好上十倍，百倍，千倍.但是...我不知道姐姐你为什么对我好.]=] },
{ type="DIALOG",value=[=[绿珠儿#因为…你很像我的弟弟.]=] },
{ type="DIALOG",value=[=[主角#你弟弟?现在过的可好?]=] },
{ type="DIALOG",value=[=[绿珠儿#我和弟弟一起从战乱的地方逃出来，后来他饿死了，我也快饿死了，后来遇上了好心人.他救了我.后来我为了生存，又来到了这里.]=] },
{ type="DIALOG",value=[=[主角#对不起，说到你的伤心事了...]=] },
{ type="DIALOG",value=[=[绿珠儿#没事的，已经过了那么久了.]=] },
{ type="DIALOG",value=[=[主角#可是，为什么非要是这里.]=] },
{ type="DIALOG",value=[=[绿珠儿#我们这些风尘女子，大多是生不由己，如果不是为了生存，谁又愿意对那些人曲意逢迎?]=] },
{ type="DIALOG",value=[=[主角#既然不愿，为何不离开?]=] },
{ type="DIALOG",value=[=[绿珠儿#走，又哪是这么容易.]=] },
{ type="DIALOG",value=[=[绿珠儿#我刚来的时候，对这里很反感，可是待得越久，却越是适应.]=] },
{ type="DIALOG",value=[=[绿珠儿#我本想攒够了赎身的钱，就离开这里.可是这样的想法却越来越淡了.]=] },
{ type="DIALOG",value=[=[主角#为什么?]=] },
{ type="DIALOG",value=[=[绿珠儿#离开了青楼，我又能去哪里?已非清白之身，又去哪里找个好人家?]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.运营.绿珠儿2]=],
condition={  } } } },

{ name="大理.青楼.运营.绿珠儿2",
action={ 
{ type="DIALOG",value=[=[主角#却是我想的简单了.]=] },
{ type="DIALOG",value=[=[主角#那顾影莲姐姐呢?也是和你一般的遭遇?]=] },
{ type="DIALOG",value=[=[绿珠儿#你顾姐姐，可比我惨多了.她是被卖过来的.]=] },
{ type="DIALOG",value=[=[绿珠儿#你顾姐姐，本是富贵人家.但是却爱上了一个穷秀才，家里人不同意，他们私奔逃了出来，却也是命运在捉弄他们，逃到一半，遇上了饥荒，他们挨饿的走到了这里，穷秀才动了点心思，把你莲姐姐卖到这里，自己拿着钱跑了.]=] },
{ type="DIALOG",value=[=[绿珠儿#所以你莲姐姐不愿意和男人说话，但心肠却是好的.]=] },
{ type="DIALOG",value=[=[主角#原来是这样.]=] },
{ type="DIALOG",value=[=[绿珠儿#你莲姐姐也不容易，被男人伤透了心.却要在这个满是男人的地方曲意逢迎。]=] },
{ type="DIALOG",value=[=[主角#....]=] },
{ type="SET.TAG",value=[=[大理.支线.落尘寰]=] } },
result={  } },

{ name="大理.乡间小路.深山.老林",
action={ 
{ type="DIALOG",value=[=[主角#山里面太危险，不能去.]=] } },
result={  } },

{ name="大理.青楼.日常运营1",
action={ 
{ type="DIALOG",value=[=[主角#我今天来打工了.]=] },
{ type="DIALOG",value=[=[大理老鸨#去吧.]=] },
{ type="SET.TAG",value=[=[大理.青楼.运营2]=] },
{ type="DEL.TAG",value=[=[大理.青楼.可打工]=] } },
result={ 
{ ret=0,type="map",value=[=[大理青楼运营]=],
condition={  } } } },

{ name="大理.大理寺.不能进",
action={ 
{ type="DIALOG",value=[=[主角#大理寺这种地方不是我们这种小人物能进去的.]=] } },
result={  } },

{ name="大理.段王府.不能进",
action={ 
{ type="DIALOG",value=[=[主角#这里还是不要去了.]=] } },
result={  } },

{ name="大理.青楼.端茶送水",
action={ 
{ type="DIALOG",value=[=[主角#客官，您点的茶，慢用。]=] } },
result={  } },

{ name="大理.青楼.运营.陆小草欺辱",
action={ 
{ type="DIALOG",value=[=[主角#这里怎么了?]=] },
{ type="DIALOG",value=[=[绿珠儿#刚才陆妹妹撞到那位公子了.妹妹赔过礼道过歉了.但是那位公子还是不依.想要大闹一场的样子.]=] },
{ type="DIALOG",value=[=[主角#难道这位公子不知道，这里有很多后台吗?]=] },
{ type="DIALOG",value=[=[绿珠儿#但是他姓段.大理又有谁敢惹姓段的呢?]=] },
{ type="DIALOG",value=[=[主角#(又姓段?)…]=] },
{ type="DIALOG",value=[=[绿珠儿#你可不要冲动啊.]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.运营.陆小草欺辱2]=],
condition={  } } } },

{ name="大理.青楼.运营.陆小草欺辱2",
action={ 
{ type="DIALOG",value=[=[主角#这位公子，能不能讲点道理。]=] },
{ type="DIALOG",value=[=[段鹏#哦?道理?那你说说，什么是道理。]=] },
{ type="DIALOG",value=[=[主角#小草确实冲撞了你，她赔过礼，道过歉了.那你就应该放过她啊.]=] },
{ type="DIALOG",value=[=[段鹏#那你的意思是如果我打了你，然后我赔礼道歉，然后就当无事发生过?]=] },
{ type="DIALOG",value=[=[主角#你怎么不讲道理呢。]=] },
{ type="DIALOG",value=[=[段鹏#我和你讲了道理，只是我的道理你无法接受，你就认为我就是没有道理了？]=] },
{ type="DIALOG",value=[=[主角#...你！(一时语塞)]=] },
{ type="DIALOG",value=[=[陆小草#小石头!别说了。]=] },
{ type="DIALOG",value=[=[主角#可是!]=] },
{ type="DIALOG",value=[=[陆小草#别说了!]=] },
{ type="DIALOG",value=[=[陆小草#公子，你到底要我怎样?]=] },
{ type="DIALOG",value=[=[段鹏#这里有一坛酒，喝完，我们既往不咎!]=] },
{ type="DIALOG",value=[=[主角#不行!]=] },
{ type="DIALOG",value=[=[陆小草#好!]=] },
{ type="DIALOG",value=[=[主角#小草!]=] },
{ type="DIALOG",value=[=[陆小草#不要说了，我喝。]=] },
{ type="DIALOG",value=[=[段鹏#哈哈哈哈!想不到女流之辈，也是这般爽快.若你是男子，我倒真想和你结识。]=] },
{ type="DIALOG",value=[=[陆小草#公子，看好了。]=] },
{ type="SPEAK",value=[=[说罢，{{陆小草}}拿起了那坛酒，举了起来，给众人看过之后，直接抱着坛子就喝了起来，豪气不输在场的众人，围观众人，多有叫好之声，只是除了{{主角}}.]=] },
{ type="SPEAK",value=[=[{{主角}}感觉有一块石头堵在自己的胸口一样，有话说不出，就像是自己真的做错了什么事，却无法再挽回.恨自己不善言辞，哀小草身不由己.]=] },
{ type="DIALOG",value=[=[陆小草#公子...我可以走了吧.]=] },
{ type="DIALOG",value=[=[段鹏#哈哈哈!好，这青楼不简单啊.]=] },
{ type="SET.TAG",value=[=[大理.青楼.陆小草2]=] } },
result={  } },

{ name="大理.青楼.屋顶.陆小草",
action={ 
{ type="DIALOG",value=[=[陆小草#今天…多谢你了.]=] },
{ type="DIALOG",value=[=[主角#我…什么也没帮上，还害你喝了那么大一坛酒.]=] },
{ type="DIALOG",value=[=[陆小草#没事的，其实我挺能喝的.这也不算为难我了.倒是你，如果当时要你喝的话，又不知道如何是好.]=] },
{ type="DIALOG",value=[=[主角#我确实不会喝酒…这样的事情经常发生吗?]=] },
{ type="DIALOG",value=[=[陆小草#...你知道我们是青楼女子，他们看不起我们，他们有各种办法来戏弄我们，但是我们没有办法，我们只能在他们面前演戏.]=] },
{ type="DIALOG",value=[=[主角#这样的生活你不倦吗?]=] },
{ type="DIALOG",value=[=[陆小草#我们都曾是无路可走的人，在这里的那一刻起，心就已经死了.无所谓倦与不倦.]=] },
{ type="DIALOG",value=[=[主角#...或许还有别的可能?]=] },
{ type="DIALOG",value=[=[陆小草#没有了，这是我们的命。]=] },
{ type="DIALOG",value=[=[主角#...跟我走吧!离开这里!]=] },
{ type="DIALOG",value=[=[陆小草#(静静的看着{{主角}}，然后深吸了一口气)...你要是早来那么半个月，或许事情有所不同。]=] },
{ type="DIALOG",value=[=[陆小草#之前也有一个人和你说过类似的话。]=] },
{ type="DIALOG",value=[=[陆小草#然后...我答应他了。]=] },
{ type="DIALOG",value=[=[主角#...]=] },
{ type="DIALOG",value=[=[主角#我知道了...]=] },
{ type="DIALOG",value=[=[主角#我自己离开这里好了.]=] },
{ type="DIALOG",value=[=[陆小草#为什么要离开?]=] },
{ type="DIALOG",value=[=[主角#因为今天我得罪了段府的人.我就算不走也会出事，希望你能知会姐姐们，我大概没机会告别了。]=] },
{ type="DIALOG",value=[=[陆小草#...]=] },
{ type="DIALOG",value=[=[主角#告辞，有缘再见!]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.青楼.离开0]=],
condition={  } } } },

{ name="大理.青楼.离开0",
action={ 
{ type="SPEAK",value=[=[{{主角}}不知道的是，他走之后，楼中隐隐传来呜咽之声。或许有些事，错过了便再难回头.{{主角}}一走此生与{{陆小草}}再难相见。]=] },
{ type="SPEAK",value=[=[天上白云聚散，人生往复如斯.旧日情缘难明，再忆白首相离!]=] },
{ type="SPEAK",value=[=[{{主角}}离开了青楼。]=] },
{ type="SET.TAG",value=[=[大理.青楼.离开]=] } },
result={ 
{ ret=0,type="map",value=[=[大理]=],
condition={  } } } },

{ name="大理.有间客栈.黑话1",
action={ 
{ type="DIALOG",value=[=[大理包打听#听说这客栈不简单呐.]=] },
{ type="DIALOG",value=[=[主角#哦?有什么不同吗?]=] },
{ type="DIALOG",value=[=[大理包打听#这里表面上是一个客栈，实际上不止这么简单.]=] },
{ type="DIALOG",value=[=[大理包打听#几乎每一座大城，都有一间有间客栈]=] },
{ type="DIALOG",value=[=[主角#这么可怕的吗…]=] },
{ type="DIALOG",value=[=[大理包打听#有一次我在洛阳，有间客栈门口.待了半天，就看见各色人等往这里进出.其中不乏一些当地的达官显贵.]=] },
{ type="DIALOG",value=[=[大理包打听#但是我进去的时候一切正常，就像普通的客栈一般.所以我觉得应该是有什么切口.]=] },
{ type="DIALOG",value=[=[主角#那切口是什么呢?]=] },
{ type="DIALOG",value=[=[大理包打听#我也不知道，我只隐约听到像是在念诗.]=] },
{ type="DIALOG",value=[=[主角#念诗?有没有听到什么相关的词语?]=] },
{ type="DIALOG",value=[=[大理包打听#地什么高岗.后面我就不得而知了.]=] },
{ type="DIALOG",value=[=[主角#谢谢，我想想...]=] },
{ type="SET.TAG",value=[=[有间客栈.黑话]=] } },
result={  } },

{ name="大理.有间客栈.黑话2",
action={ 
{ type="SELECT",value=[=[主角#说什么呢?#地振高冈，一派溪山千古秀#地震高岗，一合江水万年流.]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.有间客栈.黑话3]=],
condition={  } },
{ ret=1,type="story",value=[=[大理.有间客栈.黑话失败]=],
condition={  } } } },

{ name="大理.有间客栈.黑话3",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#门朝大海，三河合水万年流]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#原来是自家兄弟.]=] },
{ type="SELECT",value=[=[主角#你想干点什么#买点东西#接取任务.]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.有间客栈.商店]=],
condition={  } },
{ ret=1,type="story",value=[=[大理.有间客栈.任务]=],
condition={  } } } },

{ name="大理.有间客栈.黑话失败",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#我不知道你在说什么.]=] } },
result={  } },

{ name="大理.有间客栈.商店",
action={ 
{ type="SHOP",value=[=[大理.有间客栈.商店]=] } },
result={  } },

{ name="大理.有间客栈.任务",
action={ 
{ type="MISSION",value=[=[大理.有间客栈.任务]=] } },
result={  } },

{ name="大理.练习.木头人",
action={ 
{ type="DIALOG",value=[=[主角#老板我来打木头人了]=] },
{ type="BATTLE",value=[=[大理.大战木头人]=] } },
result={ 
{ ret="win",type="story",value=[=[大理.练习.木头人.赢了]=],
condition={  } },
{ ret="lose",type="story",value=[=[大理.练习.木头人.输了]=],
condition={  } } } },

{ name="大理.练习.木头人.赢了",
action={ 
{ type="DIALOG",value=[=[主角#木头人不过如此！]=] } },
result={  } },

{ name="大理.练习.木头人.输了",
action={ 
{ type="DIALOG",value=[=[主角#木头人我都打不过，看来要好好练习。]=] } },
result={  } },

{ name="大理.乱葬岗.大战老虎",
action={ 
{ type="DIALOG",value=[=[主角#恶虎!拿命来.]=] },
{ type="BATTLE",value=[=[大理.大战老虎]=] } },
result={  } },

{ name="大理.乡间小路.深山.熊",
action={ 
{ type="DIALOG",value=[=[主角#这里居然有熊!兽皮这回有着落了.]=] },
{ type="BATTLE",value=[=[大理.熊]=] } },
result={  } },

{ name="大理.落尘寰1",
action={ 
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="DIALOG",value=[=[主角#影莲姐房里有动静?我去听听.]=] },
{ type="DIALOG",value=[=[齐自华#影莲，我…真的喜欢你.跟我走吧!]=] },
{ type="DIALOG",value=[=[顾影莲#无数人来过，都会说这样的话.你们男人只会让人从良。]=] },
{ type="DIALOG",value=[=[齐自华#我是真心的.天地为鉴!]=] },
{ type="DIALOG",value=[=[顾影莲#你走吧。]=] },
{ type="DIALOG",value=[=[齐自华#影莲!]=] },
{ type="DIALOG",value=[=[顾影莲#...走吧。]=] },
{ type="DIALOG",value=[=[齐自华#能给我一首词的时间吗?]=] },
{ type="DIALOG",value=[=[顾影莲#随你。]=] },
{ type="DIALOG",value=[=[齐自华#那一日，我闭目在论语经典中.募然听见你吟诵的真言。]=] },
{ type="DIALOG",value=[=[齐自华#那一月，挥舞自己的毛笔，不为书写，只为画下你的容颜。]=] },
{ type="DIALOG",value=[=[齐自华#那一年，我跪拜在文庙，不为见圣，只为回忆你的温暖。]=] },
{ type="DIALOG",value=[=[齐自华#那一世，我看山看水看世界，不为见识，只为途中与你相见。]=] },
{ type="DIALOG",value=[=[齐自华#这一天，我来到大理，不为山水，只为寻找你的身影。]=] },
{ type="DIALOG",value=[=[齐自华#这一夜，我来到勾栏，不为风月，只为与你相见。]=] },
{ type="DIALOG",value=[=[齐自华#这一刻，我与你相见.....]=] },
{ type="DIALOG",value=[=[顾影莲#相见....之后呢?]=] },
{ type="DIALOG",value=[=[齐自华#希望你能跟我走!]=] },
{ type="DIALOG",value=[=[顾影莲#...文采不错，若是肯用功应当中个功名.而不是流连烟花柳巷!]=] },
{ type="DIALOG",value=[=[顾影莲#你走吧!]=] },
{ type="DIALOG",value=[=[齐自华#哎!]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.落尘寰2]=],
condition={  } } } },

{ name="大理.落尘寰2",
action={ 
{ type="SPEAK",value=[=[{{齐自华}}走了]=] },
{ type="DIALOG",value=[=[顾影莲#进吧来!你小子躲在外面干嘛。]=] },
{ type="DIALOG",value=[=[主角#啊~你都知道我在外面了啊。]=] },
{ type="DIALOG",value=[=[顾影莲#你在门外那么大的影子.我也不瞎。]=] },
{ type="DIALOG",value=[=[主角#刚才那个人才华那么好，为什么不答应他?]=] },
{ type="DIALOG",value=[=[顾影莲#他们男人都一样…]=] },
{ type="DIALOG",value=[=[主角#为什么?]=] },
{ type="DIALOG",value=[=[顾影莲#当初和我一起私奔的人，无论文采还是气质都远胜于他!结果呢?]=] },
{ type="DIALOG",value=[=[主角#...]=] },
{ type="DIALOG",value=[=[顾影莲#那些山盟海誓，终究敌不过现实。]=] },
{ type="DIALOG",value=[=[主角#怎样的现实?]=] },
{ type="DIALOG",value=[=[顾影莲#直面生死！]=] },
{ type="DIALOG",value=[=[主角#如果是姐姐你的事，我一定会全力以赴的!]=] },
{ type="DIALOG",value=[=[顾影莲#...我要睡了，你走吧。]=] },
{ type="DIALOG",value=[=[主角#嗯!]=] } },
result={  } },

{ name="大理.青楼.屋顶.顾影莲",
action={ 
{ type="DIALOG",value=[=[主角#影莲姐，你也在这里啊。]=] },
{ type="DIALOG",value=[=[顾影莲#嗯。。。]=] },
{ type="DIALOG",value=[=[主角#你是有什么心事吗？]=] },
{ type="DIALOG",value=[=[顾影莲#没什么，有时候心乱的时候就会来屋顶，看看夜空。]=] },
{ type="DIALOG",value=[=[主角#因为那天那个人吗？]=] },
{ type="DIALOG",value=[=[顾影莲#我早就对男人不抱希望了。我只是在想，等我攒够了钱，有没有可能离开这里，去看看更广阔的世界。]=] },
{ type="DIALOG",value=[=[主角#我也不知道外面的世界是怎样的。]=] },
{ type="DIALOG",value=[=[顾影莲#外面啊。。。你还是不要去看了。]=] },
{ type="DIALOG",value=[=[主角#为什么？]=] },
{ type="DIALOG",value=[=[顾影莲#太乱了。你年纪还小，外面的世界勾心斗角尔虞我诈，太多了。]=] },
{ type="DIALOG",value=[=[主角#那为什么你还要去?]=] },
{ type="DIALOG",value=[=[顾影莲#我了无牵挂。只是想尽可能的多走走，多看看。]=] },
{ type="DIALOG",value=[=[主角#可是你说的江湖险恶。。。]=] },
{ type="DIALOG",value=[=[顾影莲#便是身死也无所谓，这一世走到哪算哪吧！]=] },
{ type="DIALOG",value=[=[主角#。。。我感觉你很厌世。]=] },
{ type="DIALOG",value=[=[顾影莲#如果有人给你莫大的希望，再把你抛弃，你会有什么感觉？]=] },
{ type="DIALOG",value=[=[主角#我。。。不知道。]=] },
{ type="DIALOG",value=[=[顾影莲#这世间我最相信的人都会抛弃我，那别人呢?会不会一直在算计我?]=] },
{ type="DIALOG",value=[=[主角#我觉得你偏激了，这世上有很多人是可以相信的。比如我就相信你说的任何事。]=] },
{ type="DIALOG",value=[=[顾影莲#。。。你。。。]=] },
{ type="DIALOG",value=[=[顾影莲#要是早些能遇见你，事情或许有所不同。不过都太晚了。]=] },
{ type="DIALOG",value=[=[顾影莲#许多事情都无法逆转了，被伤害过的心，在那一刻就已经死了，不过还是谢谢你能跟我讲这么多话。]=] },
{ type="DIALOG",value=[=[主角#果然还是没有任何作用吗。。。]=] },
{ type="DIALOG",value=[=[顾影莲#不，你说的很有用，或许我以后会重新考虑很多事情。]=] },
{ type="DIALOG",value=[=[主角#那就好。]=] },
{ type="DIALOG",value=[=[顾影莲#也没什么好东西，我这里有别人的一副拳套，我觉得你以后可以防身用。]=] },
{ type="ITEM",value=[=[精钢拳套#1]=] },
{ type="DIALOG",value=[=[主角#谢谢！]=] },
{ type="DIALOG",value=[=[顾影莲#嗯！去吧。]=] } },
result={  } },

{ name="大理.青楼.太菜了",
action={ 
{ type="SPEAK",value=[=[你因为太菜了被赶出了青楼。]=] } },
result={  } },

{ name="大理.青楼.离开",
action={ 
{ type="SPEAK",value=[=[你离开了青楼，不会再去了。]=] } },
result={  } },

{ name="大理.有间客栈.阴影之下",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#我看你并非是自己人]=] },
{ type="DIALOG",value=[=[主角#???]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#不知道你是怎么得到我们的切口的。]=] },
{ type="DIALOG",value=[=[主角#...]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#不过既然白嫖了我有间客栈，自然是不能轻易放过你的。]=] },
{ type="DIALOG",value=[=[主角#你想怎样?]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#加入，或者去死?]=] },
{ type="DIALOG",value=[=[主角#我…(怎么办)]=] },
{ type="DIALOG",value=[=[主角#我有什么好处?]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#还没进就想着好处?]=] },
{ type="DIALOG",value=[=[主角#那我…加入吧。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#欢迎你成为这间客栈的一份子.接下来好好练功，工作。]=] },
{ type="SET.TAG",value=[=[大理.有间客栈]=] },
{ type="SET.TAG.DELAY",value=[=[大理.有间客栈.江湖#15#0]=] } },
result={  } },

{ name="大理.有间客栈.店小二1",
action={ 
{ type="DIALOG",value=[=[大理店小二#{{主角}}你好啊.]=] },
{ type="DIALOG",value=[=[主角#你在这店里是干嘛的.]=] },
{ type="DIALOG",value=[=[大理店小二#就是擦擦桌子端端菜.]=] },
{ type="DIALOG",value=[=[大理店小二#闲暇时候练练功啥的.]=] },
{ type="DIALOG",value=[=[主角#你还会练功呢?]=] },
{ type="DIALOG",value=[=[大理店小二#练得不好，也就会那么几招.在店里一直都是挨打的那个.]=] },
{ type="DIALOG",value=[=[主角#那有时间我们切磋一下?]=] },
{ type="DIALOG",value=[=[大理店小二#是吗，我很菜的.我怕会出事.]=] },
{ type="DIALOG",value=[=[主角#没事没事，来嘛.我会让你的.]=] },
{ type="DIALOG",value=[=[大理店小二#好吧!]=] },
{ type="BATTLE",value=[=[大理.有间客栈.店小二]=] } },
result={ 
{ ret="win",type="story",value=[=[大理.有间客栈.店小二.无敌]=],
condition={  } },
{ ret="lose",type="story",value=[=[大理.有间客栈.店小二.正常]=],
condition={  } } } },

{ name="大理.有间客栈.店小二.无敌",
action={ 
{ type="DIALOG",value=[=[大理店小二#哇!你好厉害，以后要多多切磋]=] } },
result={  } },

{ name="大理.有间客栈.店小二.正常",
action={ 
{ type="DIALOG",value=[=[大理店小二#我是说，我怕失手把你打死.]=] },
{ type="DIALOG",value=[=[主角#...]=] } },
result={  } },

{ name="大理.有间客栈.厨子1",
action={ 
{ type="DIALOG",value=[=[大理厨子#你好啊，新来的.]=] },
{ type="DIALOG",value=[=[主角#嗯…我该怎么称呼?]=] },
{ type="DIALOG",value=[=[大理厨子#这个啊，他们都叫我老丁.你也这样叫好了.]=] },
{ type="DIALOG",value=[=[主角#老丁?]=] },
{ type="DIALOG",value=[=[大理厨子#诶，你叫什么啊.]=] },
{ type="DIALOG",value=[=[主角#我叫{{主角}}.]=] },
{ type="DIALOG",value=[=[大理厨子#哦{{主角}}，要不要跟我学做菜啊.]=] },
{ type="DIALOG",value=[=[主角#做菜…(也算是一门手艺)]=] },
{ type="DIALOG",value=[=[主角#好啊.]=] },
{ type="DIALOG",value=[=[大理厨子#我也不耽误你时间，每天跟我学几个时辰就好了.]=] },
{ type="DIALOG",value=[=[主角#嗯.]=] } },
result={  } },

{ name="大理.有间客栈.算账1",
action={ 
{ type="DIALOG",value=[=[大理算账先生#哟，新来的啊.]=] },
{ type="DIALOG",value=[=[主角#嗯，你是算账先生?]=] },
{ type="DIALOG",value=[=[大理算账先生#是啊.我就是个算账的.]=] },
{ type="DIALOG",value=[=[大理算账先生#有没有兴趣跟我学学读书写字啊.]=] },
{ type="DIALOG",value=[=[主角#读书?写字?]=] },
{ type="DIALOG",value=[=[大理算账先生#嗯.就是读书写字.]=] },
{ type="DIALOG",value=[=[主角#可是我都不会啊.]=] },
{ type="DIALOG",value=[=[大理算账先生#所以就要学嘛.]=] },
{ type="DIALOG",value=[=[主角#哦…]=] },
{ type="DIALOG",value=[=[大理算账先生#这里一本基本内功精要，拿去.]=] },
{ type="DIALOG",value=[=[主角#!!!]=] },
{ type="DIALOG",value=[=[主角#这么好的东西.]=] },
{ type="DIALOG",value=[=[大理算账先生#这些都是小玩意.]=] },
{ type="DIALOG",value=[=[主角#谢谢，谢谢!]=] },
{ type="ITEM",value=[=[基本内功精要#1]=] } },
result={  } },

{ name="大理.有间客栈.端茶送水",
action={ 
{ type="DIALOG",value=[=[主角#诶客官，您要的水.]=] } },
result={  } },

{ name="大理.有间客栈.店小二.日常",
action={ 
{ type="DIALOG",value=[=[大理店小二#你要和我切磋吗?]=] },
{ type="DIALOG",value=[=[主角#是啊.]=] },
{ type="DIALOG",value=[=[大理店小二#嗯.]=] },
{ type="BATTLE",value=[=[大理.有间客栈.店小二.弱]=] } },
result={ 
{ ret="win",type="story",value=[=[大理.有间客栈.店小二.赢1]=],
condition={  } },
{ ret="lose",type="story",value=[=[大理.有间客栈.店小二.输1]=],
condition={  } } } },

{ name="大理.有间客栈.店小二.赢1",
action={ 
{ type="DIALOG",value=[=[大理店小二#不错，有点实力。]=] } },
result={  } },

{ name="大理.有间客栈.店小二.输1",
action={ 
{ type="DIALOG",value=[=[大理店小二#你还要多多练习啊。]=] } },
result={  } },

{ name="大理.有间客栈.厨子.日常",
action={ 
{ type="DIALOG",value=[=[大理厨子#来，跟我一起练习炒菜.]=] },
{ type="UPGRADE.BILI",value=[=[主角#2]=] },
{ type="COST_DAY",value=[=[1]=] } },
result={  } },

{ name="大理.有间客栈.算账.日常",
action={ 
{ type="DIALOG",value=[=[大理算账先生#来跟我一起学习论语，三字经，周易…]=] },
{ type="UPGRADE.WUXING",value=[=[主角#3]=] },
{ type="COST_DAY",value=[=[1]=] } },
result={  } },

{ name="大理.有间客栈.算账.进阶1",
action={ 
{ type="DIALOG",value=[=[大理算账先生#资质不错嘛.]=] },
{ type="DIALOG",value=[=[大理算账先生#那我出个题考考你.]=] },
{ type="DIALOG",value=[=[大理算账先生#你说是中午的太阳离我们近还是早上的太阳离我们近?]=] },
{ type="DIALOG",value=[=[主角#额…]=] },
{ type="SELECT",value=[=[主角#我该说什么呢?#早上的太阳近，因为早上的太阳最大#中午的太阳近，因为中午很热.#这种问题我怎么会知道?我觉得这个问题没什么意义.]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.有间客栈.算账.进阶1.结果1]=],
condition={  } },
{ ret=1,type="story",value=[=[大理.有间客栈.算账.进阶1.结果2]=],
condition={  } },
{ ret=2,type="story",value=[=[大理.有间客栈.算账.进阶1.结果3]=],
condition={  } } } },

{ name="大理.有间客栈.算账.进阶1.结果1",
action={ 
{ type="DIALOG",value=[=[大理算账先生#哦?那为什么中午的太阳会更热?难道更热不是因为更近吗?]=] },
{ type="DIALOG",value=[=[主角#...不知道.]=] },
{ type="DIALOG",value=[=[大理算账先生#你智力有待提高啊.]=] },
{ type="UPGRADE.WUXING",value=[=[主角#4]=] } },
result={  } },

{ name="大理.有间客栈.算账.进阶1.结果2",
action={ 
{ type="DIALOG",value=[=[大理算账先生#哦?那为什么早上的太阳会看起来更大，难道更大不是因为更近吗?]=] },
{ type="DIALOG",value=[=[主角#...不知道.]=] },
{ type="DIALOG",value=[=[大理算账先生#你智力有待提高啊.]=] },
{ type="UPGRADE.WUXING",value=[=[主角#4]=] } },
result={  } },

{ name="大理.有间客栈.算账.进阶1.结果3",
action={ 
{ type="DIALOG",value=[=[大理算账先生#这个问题确实没有意义，太阳与你我，终究是太过遥远.所有看法都不过是猜测.你这智力有点高啊]=] },
{ type="DIALOG",value=[=[主角#....]=] },
{ type="UPGRADE.WUXUE",value=[=[主角#30]=] } },
result={  } },

{ name="大理.有间客栈.算账.进阶2",
action={ 
{ type="DIALOG",value=[=[大理算账先生#悟性已经这么高了，那再问一个问题吧.]=] },
{ type="DIALOG",value=[=[大理算账先生#过去的时间在哪里消失?未来的时间在何处停止?]=] },
{ type="DIALOG",value=[=[主角#这问题太深奥了吧.]=] },
{ type="SELECT",value=[=[主角#我该怎么回答呢?#过去的时间在过去的那一刻消失，未来的时间在他成为过去的那一刻停止.#时间从未消失，无所谓过去与未来.#没有过去与未来，时间的流逝是假象，所有不同的时刻都是一起发生的.#我觉得这个问题没什么意义嘛.]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.有间客栈.算账.进阶2.结果1]=],
condition={  } },
{ ret=1,type="story",value=[=[大理.有间客栈.算账.进阶2.结果2]=],
condition={  } },
{ ret=2,type="story",value=[=[大理.有间客栈.算账.进阶2.结果3]=],
condition={  } },
{ ret=3,type="story",value=[=[大理.有间客栈.算账.进阶2.结果4]=],
condition={  } } } },

{ name="大理.有间客栈.算账.进阶2.结果1",
action={ 
{ type="DIALOG",value=[=[大理算账先生#有那么一点道理啊.]=] },
{ type="DIALOG",value=[=[主角#....]=] },
{ type="UPGRADE.WUXUE",value=[=[主角#20]=] } },
result={  } },

{ name="大理.有间客栈.算账.进阶2.结果2",
action={ 
{ type="DIALOG",value=[=[大理算账先生#太玄妙了，我不懂]=] },
{ type="DIALOG",value=[=[主角#....]=] },
{ type="UPGRADE.WUXUE",value=[=[主角#20]=] } },
result={  } },

{ name="大理.有间客栈.算账.进阶2.结果3",
action={ 
{ type="DIALOG",value=[=[大理算账先生#你考虑的这么深，你妈妈知道吗?]=] },
{ type="DIALOG",value=[=[主角#....]=] },
{ type="UPGRADE.WUXUE",value=[=[主角#20]=] } },
result={  } },

{ name="大理.有间客栈.算账.进阶2.结果4",
action={ 
{ type="DIALOG",value=[=[大理算账先生#不能回答不代表没有意义.时间是一个永恒的话题 ]=] },
{ type="DIALOG",value=[=[主角#....]=] },
{ type="UPGRADE.WUXUE",value=[=[主角#15]=] } },
result={  } },

{ name="大理.有间客栈.店小二.进阶1",
action={ 
{ type="DIALOG",value=[=[大理店小二#和我练了这么多把了看你有没有长进.]=] },
{ type="DIALOG",value=[=[主角#好!]=] },
{ type="BATTLE",value=[=[大理.有间客栈.店小二]=] } },
result={ 
{ ret="win",type="story",value=[=[大理.有间客栈.店小二.好强啊]=],
condition={  } },
{ ret="lose",type="story",value=[=[大理.有间客栈.店小二.菜死了]=],
condition={  } } } },

{ name="大理.有间客栈.店小二.好强啊",
action={ 
{ type="DIALOG",value=[=[大理店小二#哇你这么强，你妈妈知道吗?]=] },
{ type="UPGRADE.DINGLI",value=[=[主角#10]=] } },
result={  } },

{ name="大理.有间客栈.店小二.菜死了",
action={ 
{ type="DIALOG",value=[=[大理店小二#太菜了，教你一手吧]=] },
{ type="LEARN.SKILL",value=[=[主角#参合指#1#10]=] } },
result={  } },

{ name="大理.有间客栈.店小二.进阶2",
action={ 
{ type="DIALOG",value=[=[大理店小二#这次我不让你了啊]=] },
{ type="BATTLE",value=[=[大理.有间客栈.店小二]=] } },
result={ 
{ ret="win",type="story",value=[=[大理.有间客栈.店小二.好强啊2]=],
condition={  } },
{ ret="lose",type="story",value=[=[大理.有间客栈.店小二.菜死了2]=],
condition={  } } } },

{ name="大理.有间客栈.店小二.好强啊2",
action={ 
{ type="DIALOG",value=[=[大理店小二#很强!想不到你都这么强了]=] },
{ type="UPGRADE.GENGU",value=[=[主角#20]=] } },
result={  } },

{ name="大理.有间客栈.店小二.菜死了2",
action={ 
{ type="DIALOG",value=[=[大理店小二#你怎么还这么菜啊.]=] },
{ type="UPGRADE.GENGU",value=[=[主角#10]=] } },
result={  } },

{ name="大理.有间客栈.厨子.进阶1",
action={ 
{ type="DIALOG",value=[=[大理厨子#要不要跟我学点新的?]=] },
{ type="DIALOG",value=[=[主角#新的?]=] },
{ type="DIALOG",value=[=[大理厨子#烤肉啊.来来来，边聊边教.]=] },
{ type="DIALOG",value=[=[主角#为什么要学烤肉啊.]=] },
{ type="DIALOG",value=[=[大理厨子#以后出门在外，没东西吃，打个兔子啥的.还能自己对付对付.]=] },
{ type="DIALOG",value=[=[主角#这样啊.]=] },
{ type="DIALOG",value=[=[大理厨子#哎，当年我和…别人一起从绝地逃出生天.饿了好些天了.我们就打了个兔子，还好我当年会点厨艺，而且随身带了些盐巴和调料.弄的烤兔子还挺香的.]=] },
{ type="DIALOG",value=[=[主角#那和你一起逃出来的同伴怎么评价你的烤兔子呢?]=] },
{ type="DIALOG",value=[=[大理厨子#她这一生中吃过最好吃的东西，就是我当时烤的那只兔子.]=] },
{ type="DIALOG",value=[=[大理厨子#往事，不堪回首.]=] },
{ type="DIALOG",value=[=[主角#你手上的，是不是烤糊了.]=] },
{ type="DIALOG",value=[=[大理厨子#啊，忘记了!你来烤吧，我教你]=] },
{ type="DIALOG",value=[=[主角#好!]=] },
{ type="UPGRADE.BILI",value=[=[主角#10]=] } },
result={  } },

{ name="大理.有间客栈.天地世间",
action={ 
{ type="DIALOG",value=[=[主角#老板好!]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#哦?难得，你还会来找我。]=] },
{ type="DIALOG",value=[=[主角#我想知道为什么，为什么你会让我加入你们。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#你应该接触过厨子，算账的和店小二了吧。你觉得他们如何？]=] },
{ type="DIALOG",value=[=[主角#非常强，深不可测，我和他们混在一起压力好大。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#哈哈，外人可不会这么觉得。那些普通的客人，那些在大理的普通人都只会觉得这里的每个人都非常普通。]=] },
{ type="DIALOG",value=[=[主角#为什么，明明很有实力却要这样?]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#许多事情，身不由己。盲目的展示自己的实力并没有好处。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#你知道20年前的异象吗?]=] },
{ type="DIALOG",value=[=[主角#那时候我还未出生，所以应该不知道。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#20年前发生了一次天星尽摇。。。]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.有间客栈.天星尽摇]=],
condition={  } } } },

{ name="大理.有间客栈.天星尽摇",
action={ 
{ type="DIALOG",value=[=[主角#这又是什么说法?]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#天上的星星，如果有一两颗坠落世间，见者往往会闭目诚心许愿，这便是流星。而如果有数不清的流星同时坠落.]=] },
{ type="DIALOG",value=[=[主角#我知道，这就叫流星雨！]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#。。。这便是天星尽摇。]=] },
{ type="DIALOG",value=[=[主角#这有什么不同吗？]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#所谓物极必反，少许的流星或是吉兆。而天星尽摇便是大凶之兆。]=] },
{ type="DIALOG",value=[=[主角#那那次天星尽摇预示着什么？]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#没有人知道，不过不久之后，世间就开始传着各种传言。其中最危险的传言是当朝皇帝恰好会印证凶兆。]=] },
{ type="DIALOG",value=[=[主角#这样的传言都有，那当时皇上如何处置的？]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#当然是杀，抓到任何敢提及此事的人一律杀了，传的越凶就杀的越多，杀的越多，传的就更凶。事已至此却也真是印证了那些传言。]=] },
{ type="DIALOG",value=[=[主角#后来呢?]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#君王暴行，自然有许多地方开始集结义士。逐渐形成反抗，而有些地方地处偏远，不容易管辖，就独立了出来。就像大理，大理名义上还是归朝廷管，实际上已经归段王府和慕容氏了.]=] },
{ type="DIALOG",value=[=[主角#...]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#不过管的还算井井有条.与外面相比，这里算是相当不错.你也算是幸运，生在了这里.就算是普通百姓家，也比外面逃亡的有钱有势的人好上许多了。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#这世道一天比一天乱，江湖上的各大门派也不再广收门徒了。大多闭门清修，不过门派不收人传承就会断了，所以各大门派每四年会联合举办一个武林试。]=] } },
result={ 
{ ret=0,type="story",value=[=[大理.有间客栈.武林试]=],
condition={  } } } },

{ name="大理.有间客栈.武林试",
action={ 
{ type="DIALOG",value=[=[主角#武林试?]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#战乱之后，中原武林各派成立了武林联盟，以求生存，这个联盟没有盟主，但有长老，长老由各门派掌门担任。共同决定武林大事，而武林试就是武林联盟统一招收门徒的方式。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#每一次武林试都会有各路江湖豪杰，世家子弟，以及各种来路不明的人参加。他们齐聚一堂，切磋论道，逐渐淘汰最后会有一个综合排名，排名靠前就有机会拜入门派。可以说是天下英雄的一次大聚集也不为过。]=] },
{ type="DIALOG",value=[=[主角#说的我心向往之。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#我要你加入我们，就是因为我想让你去参加武林试。]=] },
{ type="DIALOG",value=[=[主角#原来是这样。。。但是我平平无奇为什么会是我？]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#虽然功夫太弱但是根骨还算不错稍加练习还是有希望进去的。]=] },
{ type="DIALOG",value=[=[主角#那么目的呢？]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#这个就要等进去之后再说与你听了。]=] },
{ type="DIALOG",value=[=[主角#好吧。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#在这里待十几天我就送你出去，好好努力吧。]=] } },
result={  } },

{ name="大理.有间客栈.江湖行",
action={ 
{ type="DIALOG",value=[=[大理有间客栈老板#好了，时间快到了，再不走赶不上报名了。]=] },
{ type="DIALOG",value=[=[主角#。。。要走了吗？我还挺想念这里的。]=] },
{ type="DIALOG",value=[=[大理有间客栈老板#走吧!拿个好名次.]=] },
{ type="SPEAK",value=[=[此去江湖，{{主角}}将面对怎样的人情冷暖，离合悲欢。又将闯出怎样的风雨，留下怎样的传说？]=] },
{ type="SPEAK",value=[=[第一章——俗世凡尘完]=] },
{ type="SPEAK",value=[=[第二章——人间百态。]=] },
{ type="SET.CHAPTER",value=[=[人间百态]=] },
{ type="SET.TAG",value=[=[江湖行]=] },
{ type="DEL.TAG",value=[=[大理.有间客栈]=] } },
result={ 
{ ret=0,type="map",value=[=[大地图]=],
condition={  } } } },

{ name="北京.卖花",
action={ 
{ type="DIALOG",value=[=[卖花的小姑娘#卖花了,哥哥你买花吗?]=] },
{ type="DIALOG",value=[=[主角#嗯？谢谢，我不需要。]=] },
{ type="DIALOG",value=[=[卖花的小姑娘#求求哥哥了，买一朵吧。]=] },
{ type="DIALOG",value=[=[主角#为什么呢？]=] },
{ type="DIALOG",value=[=[卖花的小姑娘#我要给爹爹凑赶考的费用。]=] },
{ type="DIALOG",value=[=[主角#！！为什么是你来凑，不是你爹呢？]=] },
{ type="DIALOG",value=[=[卖花的小姑娘#我爹爹要用功读书啊。。。]=] },
{ type="DIALOG",value=[=[主角#你娘呢？]=] },
{ type="DIALOG",value=[=[卖花的小姑娘#我娘。。。我爹年年考，年年不中，家里已经没钱了，但是我爹还是要考，我娘就回娘家了。]=] },
{ type="DIALOG",value=[=[主角#。。。为什么你还要帮着你爹？不跟着你娘回去？]=] },
{ type="DIALOG",value=[=[卖花的小姑娘#我爹没什么错，如果都离开了，我爹一定活不下去的。]=] },
{ type="DIALOG",value=[=[主角#举全家之力，就为了你那不成器的爹？]=] },
{ type="DIALOG",value=[=[卖花的小姑娘#哥哥你不懂，科举入仕对我们这些普通老百姓有多重要！]=] },
{ type="DIALOG",value=[=[主角#。。。我知道了，你有多少花，我全买了！]=] },
{ type="DIALOG",value=[=[卖花的小姑娘#真的吗！谢谢哥哥！嗯。。。加起来一千铜钱,不过哥哥你一次买这么多,我便宜你4个铜钱好了！]=] },
{ type="DIALOG",value=[=[主角#这么多？？？额。。。好吧.]=] },
{ type="ITEM",value=[=[铜钱#-996]=] },
{ type="ITEM",value=[=[996花#1]=] } },
result={  } },

{ name="北京.乞丐",
action={ 
{ type="DIALOG",value=[=[乞丐#年轻人，有一道灵光从你的天灵盖喷出来你知道吗？]=] },
{ type="DIALOG",value=[=[主角#是吗？]=] },
{ type="DIALOG",value=[=[乞丐#是啊,我看你就是百年一遇的练武奇才。]=] },
{ type="DIALOG",value=[=[主角#我怎么不知道，我感觉我谁都打不过。]=] },
{ type="DIALOG",value=[=[乞丐#若是有一天打通你的任督二脉,你就飞龙上天了。]=] },
{ type="DIALOG",value=[=[主角#是吗？]=] },
{ type="DIALOG",value=[=[乞丐#我这里有几本武林秘籍，买一本回去好好练，将来维护世界和平的任务就交给你了。]=] },
{ type="SELECT",value=[=[主角#我买什么秘籍呢？#武林外传#儒林外史#三侠五义#二刻拍案惊奇#聊斋志异#小孩子才做选择题，我全都要]=] } },
result={ 
{ ret=0,type="story",value=[=[北京.乞丐.武林外传]=],
condition={  } },
{ ret=1,type="story",value=[=[北京.乞丐.儒林外史]=],
condition={  } },
{ ret=2,type="story",value=[=[北京.乞丐.三侠五义]=],
condition={  } },
{ ret=3,type="story",value=[=[北京.乞丐.二刻拍案惊奇]=],
condition={  } },
{ ret=4,type="story",value=[=[北京.乞丐.聊斋志异]=],
condition={  } },
{ ret=5,type="story",value=[=[北京.乞丐.全都要]=],
condition={  } } } },

{ name="北京.乞丐.武林外传",
action={ 
{ type="DIALOG",value=[=[乞丐#不得了不得了，你竟然会选这本，也许这就是你的机缘。]=] },
{ type="DIALOG",value=[=[主角#？？？我怎么听不懂呢]=] },
{ type="ITEM",value=[=[武林外传#1]=] },
{ type="ITEM",value=[=[铜钱#-1000]=] } },
result={  } },

{ name="北京.乞丐.儒林外史",
action={ 
{ type="DIALOG",value=[=[乞丐#不得了不得了，你竟然会选这本，也许这就是你的机缘。]=] },
{ type="DIALOG",value=[=[主角#？？？我怎么听不懂呢]=] },
{ type="ITEM",value=[=[儒林外史#1]=] },
{ type="ITEM",value=[=[铜钱#-1000]=] } },
result={  } },

{ name="北京.乞丐.三侠五义",
action={ 
{ type="DIALOG",value=[=[乞丐#不得了不得了，你竟然会选这本，也许这就是你的机缘。]=] },
{ type="DIALOG",value=[=[主角#？？？我怎么听不懂呢]=] },
{ type="ITEM",value=[=[三侠五义#1]=] },
{ type="ITEM",value=[=[铜钱#-1000]=] } },
result={  } },

{ name="北京.乞丐.二刻拍案惊奇",
action={ 
{ type="DIALOG",value=[=[乞丐#不得了不得了，你竟然会选这本，也许这就是你的机缘。]=] },
{ type="DIALOG",value=[=[主角#？？？我怎么听不懂呢]=] },
{ type="ITEM",value=[=[二刻拍案惊奇#1]=] },
{ type="ITEM",value=[=[铜钱#-1000]=] } },
result={  } },

{ name="北京.乞丐.聊斋志异",
action={ 
{ type="DIALOG",value=[=[乞丐#不得了不得了，你竟然会选这本，也许这就是你的机缘。]=] },
{ type="DIALOG",value=[=[主角#？？？我怎么听不懂呢]=] },
{ type="ITEM",value=[=[聊斋志异#1]=] },
{ type="ITEM",value=[=[铜钱#-1000]=] } },
result={  } },

{ name="北京.乞丐.全都要",
action={ 
{ type="DIALOG",value=[=[乞丐#全都要.jpg?不可能的，怎么可能全都要]=] },
{ type="DIALOG",value=[=[主角#？？？我怎么听不懂呢]=] },
{ type="ITEM.RAND",value=[=[武林外传|1#儒林外史|1#二刻拍案惊奇|1#聊斋志异|1#三侠五义|1]=] },
{ type="ITEM",value=[=[铜钱#-1000]=] } },
result={  } },

{ name="北京.潘家园.不能进",
action={ 
{ type="DIALOG",value=[=[主角#咱也没钱，这种地方不是我这种渣渣能来的，赶紧走吧。]=] } },
result={  } },

{ name="长安.说书人",
action={ 
{ type="DIALOG",value=[=[主角#这里有人说书，听一段吧。]=] } },
result={ 
{ ret=0,type="story",value=[=[说书.风陵渡口]=],
condition={  } } } },

{ name="说书.风陵渡口",
action={ 
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="SPEAK",value=[=[（注：改编自网络文章）]=] },
{ type="SPEAK",value=[=[今天要讲的是女侠郭襄。]=] },
{ type="SPEAK",value=[=[郭襄姓郭，单名一个襄字，女侠年少的时候聪慧明媚，然而到如今，却是一片痴心许杨过，苦苦追寻，求而不得。]=] },
{ type="SPEAK",value=[=[这一切都要从她16岁说起。]=] },
{ type="SPEAK",value=[=[郭襄女侠16岁的时候已经是楚楚动人的少女了，在风陵渡口听闻神雕侠的事迹之后，已是芳心暗许，机缘巧合之下与杨过相遇，没想到这一遇便误了终身。]=] },
{ type="SPEAK",value=[=[那时的杨过大侠，已经名满江湖，有才华，有能力，还痴情。这些优秀的特质深深吸引着情窦初开的郭襄女侠。]=] },
{ type="SPEAK",value=[=[杨过给了郭襄女侠三根金针，说是可以满足她三个愿望。当时郭襄女侠就用了两根，便看见了杨过的面目，又一起过了生日。]=] },
{ type="SPEAK",value=[=[可是既然是任何愿望，为什么郭襄女侠不直接换来爱情？]=] },
{ type="SPEAK",value=[=[我想若是以此换取杨过的爱情，她便不是郭襄；若杨过大侠因此放弃小龙女，也不再是杨过。]=] },
{ type="SPEAK",value=[=[郭襄女侠有时痴情，有时傻在蒙古军营中，曾这样说“可惜我迟生了二十年，倘若妈妈先生的我，再生的姐姐，我学会了师傅的龙象般若功和无上瑜伽密乘,在全真教道观外住了下来,自称大龙女,小杨过在全真教中受师傅欺侮,逃到我家,我收留了她教他武功,他慢慢的自会跟我好了。他再遇到小龙女，最多不过拉住他的手，给她三枚金针，说道：小妹子，你很可爱，我心里也挺喜欢你。不过我心已属大龙女了。请你莫怪！你有什么事，拿一枚金针来，我一定给你办到。”]=] },
{ type="SPEAK",value=[=[绝情谷底，郭襄女侠用了第三根金针，求杨过不要轻生。可是杨过大侠苦等未果，死意已决，想要一跃解千愁，怎会听郭襄的？但是没想到郭襄女侠便是片刻都未思量，便随杨过一跃。]=] },
{ type="SPEAK",value=[=[哎。。。郭襄女侠就算这样，依然是什么都没得到。]=] },
{ type="SPEAK",value=[=[杨过大侠最后一次出现在江湖上说的是：“今番良晤，豪兴不浅，他日江湖相逢，再当杯酒欢。咱们就此别过。”]=] },
{ type="SPEAK",value=[=[此后杨过小龙女就此消失。郭襄女侠还在苦苦追寻。]=] } },
result={  } },

{ name="长安.招兵",
action={ 
{ type="DIALOG",value=[=[长安官兵#招兵了，招兵了，快来看看啊。诶，你吃不了亏，上不了当。]=] },
{ type="DIALOG",value=[=[路人甲#你这怎么个方式？]=] },
{ type="DIALOG",value=[=[长安官兵#保证你饿不死，每个月还有月钱发。]=] },
{ type="DIALOG",value=[=[路人乙#这么好！给我一个位置。]=] },
{ type="DIALOG",value=[=[路人甲#我也要！]=] },
{ type="DIALOG",value=[=[主角#怎么给的这么低就能招这么多人。真是廉价呢！看来外面有点乱。]=] } },
result={  } },

{ name="长安.商店",
action={ 
{ type="DIALOG",value=[=[三三#客官要点什么？]=] },
{ type="DIALOG",value=[=[主角#你这里有什么？]=] },
{ type="DIALOG",value=[=[三三#客官你自己看嘛。]=] },
{ type="SHOP",value=[=[长安.老笔斋.商店]=] },
{ type="DIALOG",value=[=[三三#谢谢回顾！]=] } },
result={  } },

{ name="切磋.失败",
action={ 
{ type="DIALOG",value=[=[主角#此番切磋受益良多，告辞。]=] } },
result={ 
{ ret=0,type="map",value=[=[大地图]=],
condition={  } } } },

{ name="少林.切磋",
action={ 
{ type="DIALOG",value=[=[主角#听闻少林是天下武学正宗，我想来切磋一下。]=] },
{ type="DIALOG",value=[=[少林方丈#施主年纪轻轻却有这种志气！]=] },
{ type="DIALOG",value=[=[少林方丈#十八铜人甲！]=] },
{ type="DIALOG",value=[=[十八铜人甲#在！]=] },
{ type="DIALOG",value=[=[少林方丈#你去和施主切磋吧！]=] },
{ type="DIALOG",value=[=[十八铜人甲#是！]=] },
{ type="BATTLE",value=[=[少林.大战铜人甲]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="少林.武林试",
action={ 
{ type="DIALOG",value=[=[主角#这里就是武林试的场地吗？]=] },
{ type="DIALOG",value=[=[少林寺小和尚#嗯！施主你要报名吗？]=] },
{ type="DIALOG",value=[=[主角#是啊！]=] },
{ type="DIALOG",value=[=[少林寺小和尚#那施主就要去旁边的演武场通过基础考核才可以。]=] },
{ type="DIALOG",value=[=[主角#还有考试！！考什么啊！]=] },
{ type="DIALOG",value=[=[少林寺小和尚#大多是一些武学常识以及然后打败考官就可以了！]=] },
{ type="DIALOG",value=[=[少林寺小和尚#施主这边走。]=] } },
result={ 
{ ret=0,type="map",value=[=[少林演武场]=],
condition={  } } } },

{ name="北京.皇宫.不能进",
action={ 
{ type="DIALOG",value=[=[主角#你想死了！连皇宫也想闯。]=] } },
result={  } },

{ name="武当.切磋",
action={ 
{ type="DIALOG",value=[=[主角#听闻武当太极拳刚柔并济，我想来切磋一下。]=] },
{ type="DIALOG",value=[=[张三丰#哦？好吧。]=] },
{ type="BATTLE",value=[=[武当.真武七截阵]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="武当.拒绝进入",
action={ 
{ type="DIALOG",value=[=[武当弟子#武当后山，闲人免进！]=] } },
result={  } },

{ name="高昌.迷宫.不要去",
action={ 
{ type="DIALOG",value=[=[主角#听说这里是迷宫，我还是不要去为好。]=] } },
result={  } },

{ name="高昌.除暴安良",
action={ 
{ type="DIALOG",value=[=[主角#这里土匪太多,我得灭他几波]=] },
{ type="BATTLE",value=[=[高昌.土匪]=] } },
result={  } },

{ name="西夏.卖儿卖女",
action={ 
{ type="DIALOG",value=[=[主角#那里发生了什么,去看看。]=] },
{ type="DIALOG",value=[=[主角#怎么这里围着这么多人。]=] },
{ type="DIALOG",value=[=[路人乙#哎，这里有个老汉，要卖掉自己的女儿。]=] },
{ type="DIALOG",value=[=[主角#这还了得！]=] },
{ type="DIALOG",value=[=[路人乙#据说他们是从战区逃出来的。一路乞讨才走到了这里。老汉不想女儿受到这种苦，所以希望卖到有钱人家。就算是使唤丫头，也比跟着他自己好上许多。]=] },
{ type="DIALOG",value=[=[主角#。。。这，他真的舍得？]=] },
{ type="DIALOG",value=[=[路人乙#毕竟是自己的亲生骨肉，做出这种决定又需要多大的勇气啊！]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[路人乙#刚才有人准备买了。老汉和他女儿哭的真是惨。]=] },
{ type="DIALOG",value=[=[主角#不卖不行吗？]=] },
{ type="DIALOG",value=[=[路人乙#如果你去过战乱的地方，或许不会这样说了。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] } },
result={  } },

{ name="西夏.求学",
action={ 
{ type="DIALOG",value=[=[家长甲#先生！这最后一个入学名额给我孩子吧！我出一万铜钱！]=] },
{ type="DIALOG",value=[=[家长乙#我出两万!]=] },
{ type="DIALOG",value=[=[主角#这里在干什么呢？]=] },
{ type="DIALOG",value=[=[路人甲#听说这里在抢这个私塾的入学名额。]=] },
{ type="DIALOG",value=[=[主角#入学？这也需要抢吗？]=] },
{ type="DIALOG",value=[=[路人甲#当然不简单，听说这里的私塾和上面通了关系，可以保乡试稳过，而且教的也还行。]=] },
{ type="DIALOG",value=[=[主角#。。。有这么重要？]=] },
{ type="DIALOG",value=[=[路人甲#要是我有儿子，我也要让他读这里，可惜是个女儿。]=] },
{ type="DIALOG",value=[=[主角#女儿怎么了？]=] },
{ type="DIALOG",value=[=[路人甲#女儿是赔钱货啊！以后嫁出去了，哪里会想到娘家。而且女子无才便是德，读书干嘛？]=] },
{ type="DIALOG",value=[=[主角#我觉得。。。你说的不对。我见过很多女子，他们才气不输男子。难道他们的父母和你想法一样吗？]=] },
{ type="DIALOG",value=[=[路人甲#得，我没怎么读过书，不会说也说不过你。再见！]=] } },
result={  } },

{ name="西夏.酒楼.旧情如梦",
action={ 
{ type="DIALOG",value=[=[主角#这里有弹琴,唱歌,听一段吧!]=] },
{ type="DIALOG",value=[=[琴女#细雨飘，清风摇，凭借痴心般情长。]=] },
{ type="DIALOG",value=[=[琴女#皓雪落，黄河浊，任由他绝情心伤….]=] },
{ type="DIALOG",value=[=[主角#真感人啊。这词背后可有什么故事？]=] },
{ type="DIALOG",value=[=[琴女#公子是在问我吗？]=] },
{ type="DIALOG",value=[=[主角#是啊！]=] },
{ type="DIALOG",value=[=[琴女#我丈夫兵役去了南方，三年了还没有归来。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[琴女#我不敢乱想，所幸每月我都会拿到丈夫寄来的钱，我天天等着他，希望他能早日归来。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] } },
result={  } },

{ name="西夏.酒楼.旧梦破碎",
action={ 
{ type="SET.MUSIC",value=[=[音乐.只为你活一天]=] },
{ type="DIALOG",value=[=[主角#姑娘。。。]=] },
{ type="DIALOG",value=[=[琴女#公子，你又来了。公子有事吗？]=] },
{ type="DIALOG",value=[=[主角#这些东西是不是你的。（拿出了发簪和书信]=] },
{ type="DIALOG",value=[=[琴女#（双手不住的颤抖，不敢置信的看着{{主角}}手中的发簪，哭泣着）是。。。是我的簪子。]=] },
{ type="SPEAK",value=[=[{{主角}}将老兵的话复述了一遍。]=] },
{ type="SPEAK",value=[=[{{琴女}}失声痛哭，昏了过去。]=] },
{ type="DIALOG",value=[=[主角#（这便是许多人必然的命运吗？或许这一趟便不该来的。就那样让她活在过去或许还有寄托？）]=] },
{ type="DIALOG",value=[=[主角#(不，谎言终究会被击穿的，虚假的期许，终究是在耽误自己。）]=] },
{ type="SET.TAG",value=[=[西夏.琴女]=] } },
result={  } },

{ name="南少林.切磋",
action={ 
{ type="DIALOG",value=[=[主角#听闻南少林武学颇有造诣，特来领教一番。]=] },
{ type="DIALOG",value=[=[南少林方丈#哦？施主这边请。]=] },
{ type="BATTLE",value=[=[南少林.切磋]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="衡山派.切磋",
action={ 
{ type="DIALOG",value=[=[主角#听说衡山派在曲乐方面的功夫特别有造诣，特地来领教一番。]=] },
{ type="DIALOG",value=[=[莫掌门#也好，让徒儿们也练练。]=] },
{ type="BATTLE",value=[=[衡山派.切磋]=] } },
result={  } },

{ name="星宿派.切磋",
action={ 
{ type="DIALOG",value=[=[主角#星宿老仙，法力无边！]=] },
{ type="DIALOG",value=[=[丁春秋#不错,很有前途,有何贵干啊.]=] },
{ type="DIALOG",value=[=[主角#我觉得星宿派很强，想和你的弟子切磋一下。]=] },
{ type="DIALOG",value=[=[丁春秋#难得，去吧。]=] },
{ type="BATTLE",value=[=[星宿派.切磋]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="恒山派.切磋",
action={ 
{ type="DIALOG",value=[=[主角#恒山派听说很强，我想来学习一下。]=] },
{ type="DIALOG",value=[=[恒山派掌门#可以，请吧。]=] },
{ type="BATTLE",value=[=[恒山派.切磋]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="峨眉派.切磋",
action={ 
{ type="BACKGROUND",value=[=[地图.峨眉派]=] },
{ type="DIALOG",value=[=[主角#听说峨眉派的女子,巾帼不让须眉，特来领教！]=] },
{ type="DIALOG",value=[=[灭绝师太#算你小子有点见识。去吧。]=] },
{ type="BATTLE",value=[=[峨眉派.切磋]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="青城派.切磋",
action={ 
{ type="BACKGROUND",value=[=[地图.青城派]=] },
{ type="DIALOG",value=[=[主角#青城派武功有其独到的见解，来领教领教]=] },
{ type="DIALOG",value=[=[青城子#可以]=] },
{ type="BATTLE",value=[=[青城派.切磋]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="全真教.切磋",
action={ 
{ type="DIALOG",value=[=[主角#听闻全真教全真七子，武功非常高，我不敢领教，所以我来找门下弟子切磋一下。]=] },
{ type="DIALOG",value=[=[全真教掌门#哦？可以，可以。去吧。]=] },
{ type="BATTLE",value=[=[全真教.切磋]=] } },
result={ 
{ ret="lose",type="story",value=[=[切磋.失败]=],
condition={  } } } },

{ name="灵鹫宫.切磋",
action={ 
{ type="DIALOG",value=[=[主角#我听说灵鹫宫生死符天下一绝。我不敢领教，告辞。]=] } },
result={  } },

{ name="白驼山.不可进",
action={ 
{ type="DIALOG",value=[=[主角#这里常年封山，也不知道里面在搞什么。还是不去了。]=] } },
result={  } },

{ name="神仙姐姐.磕头",
action={ 
{ type="DIALOG",value=[=[主角#这里有这么漂亮的石象姐姐！]=] },
{ type="DIALOG",value=[=[主角#简直就是神仙姐姐！]=] },
{ type="DIALOG",value=[=[主角#我得拜上一拜。]=] } },
result={  } },

{ name="神仙姐姐.秘籍",
action={ 
{ type="DIALOG",value=[=[主角#哎呀，这蒲团破了。]=] },
{ type="DIALOG",value=[=[主角#嗯？这里发现一本书。]=] },
{ type="ITEM",value=[=[北冥神功从入门到精通#1]=] } },
result={  } },

{ name="说书.襄阳",
action={ 
{ type="DIALOG",value=[=[主角#这里有人在说书，听一段吧。]=] },
{ type="SPEAK",value=[=[却说那日…算了不讲了，今天累了，不想说书了，散了吧。]=] } },
result={  } },

{ name="襄阳.道士",
action={ 
{ type="DIALOG",value=[=[道士#人道渺渺。仙道莽莽。鬼道乐兮。当人生门。仙道贵生。鬼道贵终。 ]=] },
{ type="DIALOG",value=[=[道士#仙道常自吉。鬼道常自凶。高上清灵美。悲歌朗太空。惟愿仙道成。不欲人道穷。]=] },
{ type="DIALOG",value=[=[道士#北都泉苗府。中有万鬼群。但欲遏人算。断绝人命门。阿人歌洞章。以摄北罗酆。束诵妖魔精。斩馘六鬼锋。诸天气荡荡。我道日兴隆。]=] },
{ type="DIALOG",value=[=[主角#你在说什么啊。]=] },
{ type="DIALOG",value=[=[道士#每日念上一遍，神清气爽，其间真意，到并不重要了。]=] },
{ type="DIALOG",value=[=[主角#你这样的修行有什么用呢？]=] },
{ type="DIALOG",value=[=[道士#我们讲究的是顺其自然，不是折腾，也不会死板。一句话有千百种理解，究竟什么意思。在说的那一刻才知道，而不是事前事后的分析。]=] },
{ type="DIALOG",value=[=[主角#那你们修的是什么？]=] },
{ type="DIALOG",value=[=[道士#有的人修心，有的人修德，有的人修仙，而我修的是顺其自然。]=] },
{ type="DIALOG",value=[=[主角#什么是自然？]=] },
{ type="DIALOG",value=[=[道士#这一刻，我与你在论道，这就是自然。我并不会随便与人论说，机缘到了自然就会说了。]=] },
{ type="DIALOG",value=[=[主角#。。。听不懂。]=] },
{ type="DIALOG",value=[=[道士#有缘再见吧。]=] } },
result={  } },

{ name="西部战场.老兵传奇",
action={ 
{ type="DIALOG",value=[=[主角#这里是旧战场，那边怎么会有人呢？过去看看。]=] },
{ type="DIALOG",value=[=[主角#这位…?]=] },
{ type="DIALOG",value=[=[老兵#他们都叫我老冰。]=] },
{ type="DIALOG",value=[=[主角#老兵？老冰？！]=] },
{ type="DIALOG",value=[=[老兵#这无所谓，这两样我都是。]=] },
{ type="DIALOG",value=[=[主角#你在这里多久了？]=] },
{ type="DIALOG",value=[=[老兵#这里打了多久，我就基本上待了多久了。]=] },
{ type="DIALOG",value=[=[主角#那应该…非常久了。]=] },
{ type="DIALOG",value=[=[老兵#我眼见着我的战友一个个的来到这里，然后又一个个的死去。]=] },
{ type="DIALOG",value=[=[老兵#他们把命留到了这里，而我把一生都留到了这里。]=] },
{ type="DIALOG",value=[=[主角#。。。为什么?]=] },
{ type="DIALOG",value=[=[老兵#他们救了我的命,用他们自己的性命。而我只能每月给战友的亲人寄钱，报答我的战友。]=] },
{ type="DIALOG",value=[=[老兵#寄信的出发地是这里，他们的家人会以为他们还活着。这也是一种寄托。]=] },
{ type="DIALOG",value=[=[老兵#小子，你哪里来的。]=] },
{ type="DIALOG",value=[=[主角#大理的小村庄。]=] },
{ type="DIALOG",value=[=[老兵#大理。。。大理好啊，风调雨顺，也没有战火硝烟。比上我们，却是好上太多了。]=] },
{ type="DIALOG",value=[=[主角#也有人跟我这么说过。]=] },
{ type="DIALOG",value=[=[老兵#因为这就是常识，不过外面的人非常羡慕大理生活的人，而大理的人似乎都想出去。]=] },
{ type="DIALOG",value=[=[主角#为什么会有战火？]=] },
{ type="DIALOG",value=[=[老兵#你不知道？或许你确实不知道。二十年前天星尽摇之后谣言四起。各地愈发的混乱，朝廷出兵镇压各地的混乱。我们这些人就是从附近征兵过来的。这里原本是一座大城，有心人起兵占领了这座城。为了压制这股叛乱，巨大的城池也被夷为平地。]=] },
{ type="DIALOG",value=[=[主角#为什么会有那么多谣言？]=] },
{ type="DIALOG",value=[=[老兵#天降异象，这本就会引发混乱。谣言，便是因为有的人处心积虑，趁着这样的异象，到处散播。]=] },
{ type="DIALOG",value=[=[主角#究竟是为了什么？]=] },
{ type="DIALOG",value=[=[老兵#不得而知，或许是皇权？或许又是别的什么目的？这是我们普通人无法知道的。]=] },
{ type="DIALOG",value=[=[主角#谢谢，我知道了。]=] } },
result={  } },

{ name="西部战场.旧战场.啥也没有",
action={ 
{ type="DIALOG",value=[=[主角#我找找这里有没有什么好东西。]=] },
{ type="DIALOG",value=[=[主角#。。。没有，什么都没有！]=] } },
result={  } },

{ name="西部战场.旧战场.有点啥",
action={ 
{ type="DIALOG",value=[=[主角#我找找这里有没有什么好东西。]=] },
{ type="ITEM",value=[=[带血发簪#1]=] },
{ type="ITEM",value=[=[带血的书信#1]=] },
{ type="DIALOG",value=[=[主角#这。。。竟然会这样。]=] } },
result={  } },

{ name="西部战场.旧战场.衣服",
action={ 
{ type="DIALOG",value=[=[主角#我找找这里有没有什么好东西。]=] },
{ type="ITEM",value=[=[破烂的金甲圣衣#1]=] },
{ type="DIALOG",value=[=[主角#看起来不错，收下了。]=] } },
result={  } },

{ name="坠星村.石碑",
action={ 
{ type="SPEAK",value=[=[星坠于野，天将大乱。铸石于此，镇压邪祟。开山建村，祭祀神明。日夜祈福，以求平安。]=] } },
result={  } },

{ name="坠星村.神明",
action={ 
{ type="SPEAK",value=[=[前面正在举行祭祀大典。{{主角}}潜伏在草丛偷听到两个人的谈话。]=] },
{ type="DIALOG",value=[=[祭祀甲#我们就算日日祈福，也不见外面变的有多安定。祭祀真的有用吗？]=] },
{ type="DIALOG",value=[=[祭祀乙#举头三尺有神明，可不敢胡说。]=] },
{ type="DIALOG",value=[=[祭祀甲#可是。。。神明真的会帮我们吗？]=] },
{ type="DIALOG",value=[=[祭祀乙#我不知道，或许我们诚心祈福，神明终究会来帮我们的。]=] },
{ type="DIALOG",value=[=[祭祀甲#二十年了，神明没有出现一点征兆。。。或许这一切终究是我们的假象罢了。]=] },
{ type="DIALOG",value=[=[祭祀乙#。。。我不知道，我们不能继续猜测了。这是大不敬。]=] },
{ type="DIALOG",value=[=[主角#神明，真的存在吗？算了不想了。]=] } },
result={  } },

{ name="坠星村.石刻",
action={ 
{ type="DIALOG",value=[=[主角#这块石头上刻了些很小的字，看一看。]=] },
{ type="SPEAK",value=[=[祭祀不能再下去了，劳民伤财，根本没有神明！]=] },
{ type="SPEAK",value=[=[星坠中原，必然是大凶之兆，未来几十年必有风雨。]=] },
{ type="SPEAK",value=[=[离开这里，离开这里！祭祀只是个谎言。]=] },
{ type="SPEAK",value=[=[要是早知道。。。]=] },
{ type="SPEAK",value=[=[终究还是逃不了。。。]=] },
{ type="DIALOG",value=[=[主角#究竟发生了什么？怎么会刻有这些话。以后有机会一定要调查调查。]=] } },
result={  } },

{ name="武林试初试规则",
action={ 
{ type="SPEAK",value=[=[武林试初试规则：必须同时通过文试和武试。文试主要考验的是历史，哲学和武林常识。武试只需要打败考官。通过之后会被送到武林联盟处等待武林试正试的开始]=] } },
result={  } },

{ name="武林试初试文试",
action={ 
{ type="LOAD.QUESTION",value=[=[武林试初试]=] } },
result={ 
{ ret=0,type="story",value=[=[武林试文试过]=],
condition={ 
{ type="SCORES.GREATER.THAN",value="武林试初试,7" } } },
{ ret=0,type="story",value=[=[武林试文试没过]=],
condition={  } } } },

{ name="武林试文试过",
action={ 
{ type="DIALOG",value=[=[文试官#好，你过了。]=] },
{ type="SET.TAG",value=[=[武林试初试文试.过]=] } },
result={  } },

{ name="武林试文试没过",
action={ 
{ type="DIALOG",value=[=[文试官#你准确率不高，不能过，半个月之后再来吧。]=] },
{ type="SET.TAG",value=[=[武林试.不能进]=] },
{ type="DEL.TAG.DELAY",value=[=[武林试.不能进#15#0]=] } },
result={ 
{ ret=0,type="map",value=[=[大地图]=],
condition={  } } } },

{ name="武林试初试武试",
action={ 
{ type="DIALOG",value=[=[武试官#这里十八般武器，自己选一个吧。]=] },
{ type="DIALOG",value=[=[主角#我还是用我自己的好了。]=] },
{ type="DIALOG",value=[=[武试官#那就得罪了！]=] },
{ type="BATTLE",value=[=[武林试.初试.武试官]=] } },
result={ 
{ ret="win",type="story",value=[=[武林试武试过]=],
condition={  } },
{ ret="lose",type="story",value=[=[武林试武试没过]=],
condition={  } } } },

{ name="武林试武试过",
action={ 
{ type="DIALOG",value=[=[武试官#好，你过了。]=] },
{ type="SET.TAG",value=[=[武林试初试武试.过]=] } },
result={  } },

{ name="武林试武试没过",
action={ 
{ type="DIALOG",value=[=[武试官#你太弱了，半个月之后再来吧。]=] },
{ type="SET.TAG",value=[=[武林试.不能进]=] },
{ type="DEL.TAG.DELAY",value=[=[武林试.不能进#15#0]=] } },
result={ 
{ ret=0,type="map",value=[=[大地图]=],
condition={  } } } },

{ name="武林联盟.正赛规则",
action={ 
{ type="SPEAK",value=[=[武林试正试规则：武林试是武林联盟统一招收优秀弟子的方式。每一届只收前16名，比赛采用单淘汰的赛制，胜者晋级，败者保留名次，每场比赛有有一位长老负责监管，特别地前四名的角逐需要在所有长老面前进行。所有比赛结束之后入选者可以自由选择要加入的门派]=] } },
result={  } },

{ name="武林联盟.谈论1",
action={ 
{ type="DIALOG",value=[=[主角#他们在谈论什么呢？凑过去听听。]=] },
{ type="DIALOG",value=[=[路人甲#听说今年入围的形势很不好。]=] },
{ type="DIALOG",value=[=[路人乙#哦？有什么不同吗。]=] },
{ type="DIALOG",value=[=[路人甲#听说今年要搞什么大动作，各世家都派出的最优秀的弟子来参加武林试。]=] },
{ type="DIALOG",value=[=[路人乙#那今年你我这样的普通人似乎没有机会了？]=] },
{ type="DIALOG",value=[=[路人甲#哎，就算我们再怎么努力，也比不过那些世家弟子。]=] },
{ type="DIALOG",value=[=[路人乙#那今年就当见识见识，四年后再来吧。]=] },
{ type="SET.TAG",value=[=[武林联盟.谈论1]=] } },
result={  } },

{ name="武林联盟.谈论2",
action={ 
{ type="DIALOG",value=[=[主角#这里也有人在谈论什么，凑过去听听。]=] },
{ type="DIALOG",value=[=[路人丙#今天我看见好几个姑娘也来参加比赛，好像还有个十六七岁的。这么小的姑娘也来参加这种比赛]=] },
{ type="DIALOG",value=[=[路人丁#说归说，别流口水。。。]=] },
{ type="DIALOG",value=[=[路人丙#你说，她要是遇见了我，我会狠心下手吗？]=] },
{ type="DIALOG",value=[=[路人丁#你怕是任打都不会还手。]=] },
{ type="DIALOG",value=[=[路人丙#是啊，谁下得了手呢？]=] },
{ type="DIALOG",value=[=[主角#十六七岁也来参加比赛？真不知道怎么想的。]=] },
{ type="SET.TAG",value=[=[武林联盟.谈论2]=] } },
result={  } },

{ name="武林联盟.谈论3",
action={ 
{ type="DIALOG",value=[=[姬书术#诶小兄弟，你也来参加武林试的吗？]=] },
{ type="DIALOG",value=[=[主角#是的啊。]=] },
{ type="DIALOG",value=[=[姬书术#不得了，这里的人下手可狠了，你要小心了。]=] },
{ type="DIALOG",value=[=[主角#为什么？]=] },
{ type="DIALOG",value=[=[姬书术#因为名额需要的是竞争，下手自然就要狠一点了。不过应该死不了。每场比试都有人看着，觉得可能出事会及时制止的。不过上一届就有人被打的残废的。]=] },
{ type="DIALOG",value=[=[主角#你不是说没事的吗？]=] },
{ type="DIALOG",value=[=[姬书术#但是刀剑无眼，就算制止，也没有那么快的。]=] },
{ type="DIALOG",value=[=[主角#你也是参加比试的？]=] },
{ type="DIALOG",value=[=[姬书术#是啊，不过我不喜欢也不会打架。我更喜欢读书。]=] },
{ type="DIALOG",value=[=[主角#那你还来参加。]=] },
{ type="DIALOG",value=[=[姬书术#没办法啊，家里人要求的。我估计我就是这次武林试里面垫底的。]=] },
{ type="DIALOG",value=[=[主角#你不要灰心，我也和你差不多。几个月之前我还只会种田呢。]=] },
{ type="DIALOG",value=[=[姬书术#哈哈哈哈，那你可要小心了，小心保护好自己才是。]=] },
{ type="DIALOG",value=[=[主角#我会的。]=] },
{ type="DIALOG",value=[=[姬书术#对了你住哪里呢？]=] },
{ type="DIALOG",value=[=[主角#不知道呢，我还没去找我的临时住处。]=] },
{ type="DIALOG",value=[=[姬书术#没关系，一起去吧，我也不知道住哪里。]=] },
{ type="SUGGEST",value=[=[去找住处。]=] },
{ type="SET.TAG",value=[=[武林联盟.谈论3]=] } },
result={  } },

{ name="武林联盟.男登记",
action={ 
{ type="DIALOG",value=[=[武林联盟登记#你们来申请住处？]=] },
{ type="DIALOG",value=[=[主角#是啊]=] },
{ type="DIALOG",value=[=[姬书术#是啊]=] },
{ type="DIALOG",value=[=[武林联盟登记#要住一起吗？]=] },
{ type="DIALOG",value=[=[主角#是啊。]=] },
{ type="DIALOG",value=[=[武林联盟登记#（嫌弃的看了{{主角}}一眼）]=] },
{ type="DIALOG",value=[=[姬书术#不是不是，我们还是两个房间，离的近一些就行了。]=] },
{ type="DIALOG",value=[=[武林联盟登记#这样啊。你们的住处安排好了，去吧。]=] },
{ type="SET.TAG",value=[=[武林联盟.男登记]=] } },
result={  } },

{ name="武林联盟.姬书术有话",
action={ 
{ type="DIALOG",value=[=[姬书术#你听说了吗，这次武林试汇集天下英才。]=] },
{ type="DIALOG",value=[=[主角#嗯，我有听到。所以我们几乎就不能出线。]=] },
{ type="DIALOG",value=[=[姬书术#也不是这样，听说很多人提前就知道了他们今年就不参加武林试了。导致今年参加武林试正试的人只有63人。]=] },
{ type="DIALOG",value=[=[主角#63人？那岂不是有人会轮空。]=] },
{ type="DIALOG",value=[=[姬书术#是啊，也不知道谁会这么幸运。轮空之后只需要胜利一轮就必然可以出线。不会是你吧？]=] },
{ type="DIALOG",value=[=[主角#我也希望是这样呢，不过我从小就没这样的运气。]=] },
{ type="DIALOG",value=[=[姬书术#哈哈哈，要相信自己。不过你看到要参加武林试的姑娘没有，他们说特别好看。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[姬书术#要不要一起去看看？]=] },
{ type="DIALOG",value=[=[主角#？？？ 我怀疑你来参加比试的目的地就不单纯。]=] },
{ type="DIALOG",value=[=[姬书术#哈哈哈，欣赏别人的美也是一种修行。]=] },
{ type="DIALOG",value=[=[主角#我就不去了。]=] },
{ type="DIALOG",value=[=[姬书术#（退后了一步）我怀疑你不喜欢女人。]=] },
{ type="DIALOG",value=[=[主角#。。。那我去吧。]=] },
{ type="DIALOG",value=[=[姬书术#我们女休息处见！]=] },
{ type="SET.TAG",value=[=[姬书术.会面]=] } },
result={  } },

{ name="武林联盟.女禁止入内",
action={ 
{ type="DIALOG",value=[=[武林联盟守卫#这里是女子休息处，侠客止步。]=] },
{ type="DIALOG",value=[=[主角#好吧。（怎么才能进去呢）]=] } },
result={  } },

{ name="武林联盟.女休息处.姬书术",
action={ 
{ type="DIALOG",value=[=[姬书术#没想到你年纪不大，干这种事一点也不含糊。]=] },
{ type="DIALOG",value=[=[主角#（突然觉得眼前这个相识不到一天，长相儒雅随和的男人竟然是极度的猥琐）哪里看嘛。]=] },
{ type="DIALOG",value=[=[姬书术#想不到你比我还急！前面你都是装的吧！]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[姬书术#我打听清楚了，武林联盟女子休息处的待遇可比我们男的好多了，她们住的地方后山有温泉。。。]=] },
{ type="DIALOG",value=[=[主角#所以你是想要偷窥！！！]=] },
{ type="DIALOG",value=[=[姬书术#小声点，小声点！我们现在可不是在干什么光明正大的事，被发现就完了！]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[姬书术#跟着跟着。。。]=] },
{ type="SPEAK",value=[=[{{主角}}跟着姬书术偷偷摸摸的走到了温泉处，听得几声嬉戏，顿时便脸红了起来，看着姬书术依然是一身正气的样子，就好像这样的事已不是第一次干了。自己难道上了贼船？]=] },
{ type="DIALOG",value=[=[姬书术#我跟你讲，跟着我，你才有这样的眼福，但是千万不可泄露出去，不然你我武功低微肯定要被打死的。]=] },
{ type="DIALOG",value=[=[主角#。。。我感觉被你带坏了。]=] },
{ type="DIALOG",value=[=[姬书术#我这是带你领略美，欣赏美。这真实感受可比书上有趣多了。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[姬书术#书上什么都有，但是书本上的大多是理论。那些参加科举的秀才们，终其一生所得不过是书本。只有跟实践相结合，理论才能更迅速的掌握。而实践依托理论的基础，才会有更大的体悟。]=] },
{ type="DIALOG",value=[=[主角#话是好话，可是怎么感觉很别扭呢？]=] },
{ type="DIALOG",value=[=[姬书术#我见过一些酒肉和尚，他们喝酒吃肉，但是他们依然敬畏佛祖，信仰佛法，他们常说酒肉穿肠过，佛祖心中留。]=] },
{ type="DIALOG",value=[=[姬书术#所以形式并不重要，就像我现在带着你来欣赏美丽的风景，你的心思被旁边的女人吸引了，所以看见的想到的和我自然是不同的。]=] },
{ type="DIALOG",value=[=[主角#所以这就是看山不是山？]=] },
{ type="DIALOG",value=[=[姬书术#你思想觉悟一下子就提高了，加油，有觉悟就会有进步。]=] } },
result={ 
{ ret=0,type="story",value=[=[武林联盟.温泉.我见犹怜]=],
condition={  } } } },

{ name="武林联盟.温泉.我见犹怜",
action={ 
{ type="SET.MUSIC",value=[=[音乐.永恒的回忆]=] },
{ type="DIALOG",value=[=[姬书术#好了，一起来欣赏吧。]=] },
{ type="SPEAK",value=[=[姬书术拔开了旁边的草丛，温泉里的嬉戏声突然变得清晰了起来，眼见的是一片蒙蒙雾气，隐约可见温泉中苗条但并不清晰的身影。随着雾浓雾淡，而若隐若现。此情此景确实超过了{{主角}}的想象。]=] },
{ type="SPEAK",value=[=[有一阵清风吹过，雾气被带走了许多。温泉之中的女孩慢慢变得清晰，{{主角}}看见温泉之中的一个女子，脑袋突然就蒙了。]=] },
{ type="SPEAK",value=[=[一直以来萦绕在内心深处的一个念想，一件久远之前的故事，虽是萍水相逢却是深刻异常的人。那温泉之中，清丽却藏不住一抹哀思的女子不是段小怜，又是何人？]=] },
{ type="SPEAK",value=[=[内心深处曾有的无数次的挣扎，那一丝不安的愧疚，此时此刻都不见了，取而代之的是巨大的，层层的疑惑。一个必死之人为何出现在这里？当时我昏过去之后究竟发生了什么？手无缚鸡之力的女子又是如何跨越千山万水，来到这里的？]=] },
{ type="SPEAK",value=[=[疑惑笼罩在{{主角}}的心头，真想立刻跑到她面前把这些疑惑都一一对质，可是残存的理智告诉他还不能这么做。毕竟现在还在做不太光彩的事。]=] },
{ type="DIALOG",value=[=[主角#喂，走了吧。]=] },
{ type="DIALOG",value=[=[姬书术#哦？可有中意的了？]=] },
{ type="DIALOG",value=[=[主角#没有，快走吧。等会要被发现了。]=] },
{ type="DIALOG",value=[=[姬书术#也是，回去吧。]=] },
{ type="SET.TAG",value=[=[武林联盟.偷窥]=] } },
result={ 
{ ret=0,type="map",value=[=[武林联盟]=],
condition={  } } } },

{ name="武林联盟.睡觉",
action={ 
{ type="DIALOG",value=[=[主角#该睡觉了。]=] } },
result={ 
{ ret=0,type="story",value=[=[武林联盟.彻夜难眠]=],
condition={ 
{ type="HAS.TAG",value="武林联盟.偷窥" },
{ type="should_not_finish",value="武林联盟.彻夜难眠" } } },
{ ret=0,type="story",value=[=[武林联盟.日思夜想]=],
condition={ 
{ type="HAS.TAG",value="武林联盟.私会" },
{ type="should_not_finish",value="武林联盟.日思夜想" } } },
{ ret=0,type="story",value=[=[武林联盟.意难平]=],
condition={ 
{ type="HAS.TAG",value="武林联盟.雨夜" },
{ type="should_not_finish",value="武林联盟.意难平" } } },
{ ret=0,type="story",value=[=[武林联盟.睡醒了]=],
condition={  } } } },

{ name="武林联盟.睡醒了",
action={ 
{ type="DIALOG",value=[=[主角#又是新的一天。]=] } },
result={  } },

{ name="武林联盟.别乱闯房间",
action={ 
{ type="DIALOG",value=[=[姬书术#不要乱闯房间啊。]=] },
{ type="DIALOG",value=[=[主角#哦。]=] } },
result={  } },

{ name="武林联盟.彻夜难眠",
action={ 
{ type="DIALOG",value=[=[主角#今天我遇到的真的是段小怜没错，她究竟是怎么来到这里的呢？]=] },
{ type="DIALOG",value=[=[主角#当初韦一笑没有杀死她？可是珠儿姐明明说有两座新坟。。。]=] },
{ type="DIALOG",value=[=[主角#不对！当时有三个人——她，她死去的娘亲，还有牛车老伯，所以两座新坟是她娘亲和牛车老伯的。我当时想岔了，忽略了她的娘亲。]=] },
{ type="DIALOG",value=[=[主角#那她又是怎样逃脱的呢？逃脱之后为什么没有回来找我呢。。。这里面疑问太多了。最重要的是她竟然能通过初试。想必是有一番不得了的奇遇。]=] },
{ type="DIALOG",value=[=[主角#遇见了一定要问个明白。。。]=] },
{ type="DIALOG",value=[=[主角#。。。。。。]=] },
{ type="COST_HOUR",value=[=[5]=] },
{ type="DIALOG",value=[=[主角#新的一天到了]=] },
{ type="SET.TAG",value=[=[武林联盟.抽签]=] } },
result={  } },

{ name="武林联盟.集会",
action={ 
{ type="DIALOG",value=[=[张三丰#各位都是来自五湖四海的世家子弟，江湖侠客，今日有缘相聚在此处，以武会友，切磋论道，不论对现在还是将来，无论是否出线入选。必然都会有莫大的好处。]=] },
{ type="DIALOG",value=[=[张三丰#虽然为了出线，应该全力施为，但是不可剑走偏锋，兵行险着，对自己和他人的性命不管不顾。比试的赛场之上你我是对手，比试之后可以结交成为好友，就算不能，也不要伤了和气。]=] },
{ type="DIALOG",value=[=[张三丰#此次比试正试总计63人参赛采用抽签的方式，1号对阵64号，2号对阵倒数63号…但是由于64号空出，所以1号首轮轮空。我们讨论过这种方式是否合理，但是最后我们觉得运气也是实力的一部分。所以在场的各位不应该抱怨，而是努力准备出线。每天只比试一场，剩下的时候可以休息切磋。]=] },
{ type="DIALOG",value=[=[张三丰#好了，话说的够多了，各位自己去抽签，然后去对应的比试场地开始比试。]=] },
{ type="SET.TAG",value=[=[武林联盟.开始抽签]=] } },
result={  } },

{ name="武林联盟.抽签",
action={ 
{ type="DIALOG",value=[=[主角#开始抽签了，希望拿到一号签。]=] },
{ type="INNER.BEGIN",value=[=[]=] },
{ type="INNER.TABLE",value=[=[{num=randInt(1,63)}]=] },
{ type="DIALOG",value=[=[主角#我抽中了,[[num]]号签]=] } },
result={ 
{ ret=0,type="story",value=[=[武林联盟.轮空]=],
condition={ 
{ type="INNER.VAR.EQUAL",value="num,1" } } },
{ ret=0,type="story",value=[=[武林联盟.第一轮比试]=],
condition={  } } } },

{ name="武林联盟.轮空",
action={ 
{ type="INNER.END",value=[=[]=] },
{ type="DIALOG",value=[=[主角#我竟然抽中了1号签！]=] },
{ type="DIALOG",value=[=[姬书术#你居然是那个幸运儿。]=] },
{ type="DIALOG",value=[=[主角#我也没想到呢。]=] },
{ type="DIALOG",value=[=[姬书术#我感觉你似乎特别好运？]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[姬书术#我就没你那么好运了，我要去和别人比试了。祝我好运吧]=] },
{ type="SET.TAG",value=[=[武林试.32强]=] } },
result={  } },

{ name="武林联盟.第一轮比试",
action={ 
{ type="INNER.END" },
{ type="DIALOG",value=[=[主角#我运气不好啊]=] },
{ type="DIALOG",value=[=[姬书术#是啊我运气也不好，看起来要跟人比试了。]=] },
{ type="DIALOG",value=[=[主角#没办法，希望对手不太强吧。]=] },
{ type="DIALOG",value=[=[姬书术#希望我们能通过首轮比试吧。]=] },
{ type="DIALOG",value=[=[主角#我去场地了。]=] },
{ type="DIALOG",value=[=[主角#请问。。。]=] },
{ type="INNER.BEGIN",value=[=[]=] },
{ type="INNER.TABLE",value=[=[{key=randTable{"林宇","绥风","楚瑜","江莱"}}]=] },
{ type="DIALOG",value=[=[[[key]]#我叫[[key]]，兄台请吧]=] },
{ type="BATTLE",value=[=[武林试.[[key]]]=] },
{ type="INNER.END",value=[=[]=] } },
result={ 
{ ret="win",type="story",value=[=[武林联盟.第一轮.胜利]=],
condition={  } },
{ ret="lose",type="story",value=[=[武林联盟.第一轮.失败]=],
condition={  } } } },

{ name="武林联盟.第一轮.胜利",
action={ 
{ type="DIALOG",value=[=[主角#啊！！！我竟然能赢！]=] },
{ type="DIALOG",value=[=[主角#我竟然这么强。]=] },
{ type="DIALOG",value=[=[主角#回去好好休息。]=] },
{ type="SET.TAG",value=[=[武林试.32强]=] } },
result={  } },

{ name="武林联盟.第一轮.失败",
action={ 
{ type="DIALOG",value=[=[主角#我好菜啊。第一轮就输了，看来是与各大门派无缘了。]=] },
{ type="DIALOG",value=[=[主角#接下来的我只能当一个看客了。]=] },
{ type="SET.TAG",value=[=[武林试.失败]=] } },
result={  } },

{ name="武林联盟.失败",
action={ 
{ type="SET.MUSIC",value=[=[音乐.永恒的回忆]=] },
{ type="DIALOG",value=[=[姬书术#啊，你怎么样了。真想不到竟然还有比我弱的人。]=] },
{ type="DIALOG",value=[=[主角#你赢了吗？]=] },
{ type="DIALOG",value=[=[姬书术#是的啊。]=] },
{ type="DIALOG",value=[=[主角#我输了。]=] },
{ type="DIALOG",value=[=[姬书术#。。。没关系的，四年后再来嘛。]=] },
{ type="DIALOG",value=[=[主角#（。。。我就这样失败，真是有点不甘心呢）]=] },
{ type="DIALOG",value=[=[主角#我只能祝你接下来好运了。]=] },
{ type="DIALOG",value=[=[姬书术#（看着这个认识没有几天的朋友，如此失落，突然有一丝不忍，一个从底层爬起来的人，靠着自己的努力好不容易的走到了武林试正试的赛场之上，却在首轮比试就惨遭淘汰，或许这世间多数努力的人都是同样的命运？）]=] },
{ type="DIALOG",value=[=[姬书术#（或许这世间一开始就划分好了吧，出生的那一刻，若是世家子弟，便是再不努力也比大多数人好上许多了）]=] },
{ type="DIALOG",value=[=[姬书术#那你打算怎么办？]=] },
{ type="DIALOG",value=[=[主角#几个月之前我才从大理出来，一心备战武林试。沿途风景美丽，却无心欣赏。我想。。。或许这样出去看看也不错。]=] },
{ type="DIALOG",value=[=[主角#（小怜。。。大概也是缘分不够吧，想来我是问不了她了，希望她能拿个好名次）]=] },
{ type="DIALOG",value=[=[主角#我走了。]=] },
{ type="DIALOG",value=[=[姬书术#不留下来看看吗？]=] },
{ type="DIALOG",value=[=[主角#哎，江湖再见吧。]=] } },
result={ 
{ ret=0,type="story",value=[=[武林联盟.无门派.第三章]=],
condition={  } } } },

{ name="武林联盟.无门派.第三章",
action={ 
{ type="SPEAK",value=[=[武林试失败之后，{{主角}}将去往何方？将见证怎样的门派之争，正邪之战？天星尽摇究竟预示着什么？{{主角}}和段小怜会以怎样的方式再见呢？]=] },
{ type="SPEAK",value=[=[第二章——人间百态完]=] },
{ type="SPEAK",value=[=[第三章——江山风雨]=] },
{ type="SET.CHAPTER",value=[=[江山风雨]=] } },
result={ 
{ ret=0,type="story",value=[=[劣质游戏.测试.完]=],
condition={  } } } },

{ name="劣质游戏.测试.完",
action={ 
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="SPEAK",value=[=[到这里，开源劣质游戏——金庸群侠传X重制测试版就结束了。]=] },
{ type="SPEAK",value=[=[这一路走来不知道各位有什么样的体验，或许你也会有很多疑惑，为什么作者很多地方挖坑不填。为什么游戏到这里就结束了。为什么游戏会这么劣质。为什么在游戏里面我看见了许多熟悉的人物名字和形象。为什么明明叫金庸群侠传，似乎群侠并没有出现？]=] },
{ type="SPEAK",value=[=[我挖坑不填是因为我当时没有想好写什么，比如之前提及的人物陆小草，描绘的篇幅还是挺多的但是并没有后续剧情。再比如顾影莲，取名出自顾影自怜，原本的设计是被齐自华打动，想跟着齐自华一起跑路的，但是最后发现齐自华也不过是为了骗取她的钱财，对这人世间极度的失望然后上吊自杀了。这样悲剧的人物用来刻画当前的章节是比较合适的。]=] },
{ type="SPEAK",value=[=[但是我觉得我创造的人物形象死的太快了，所以重新思考了这一段，改为屋顶对话。但是应该在后续世界剧情中遇见的，但是我没有写。]=] },
{ type="SPEAK",value=[=[游戏之所以到这里就结束了，是因为本来我只想写个demo剧情，但是觉得这样剧情太少了，就加了这么多。虽然依然非常少，但是能勉强表达一个简单的主题。]=] },
{ type="SPEAK",value=[=[至于游戏为什么会这么劣质，主要是因为我自己没有美术资源，我又不会画，又不想去找，很多都是沿用金X的素材。]=] },
{ type="SPEAK",value=[=[说到游戏人物形象和熟悉的名字，没错我就是抄袭了一些小说中的人物，一些原因是有些小说作者弃坑了，我就很不服，那我只好狗尾续貂，希望这些人物能有一个结局。]=] },
{ type="SPEAK",value=[=[最后就谈到，明明是金群系列，却很少出现金群人物，一部分原因呢，是我看的书少，我很多东西都来自电视剧，我不敢妄言一些我知道的人物和形象，另一方面到结局这里，整个世界剧情才刚刚展开，入了门派之后才会逐渐涉及金群人物。实际上和金X做对比，我写的部分其实也就是新手村剧情，南贤给你发放门派。但是我觉得直接发门派太傻了，就扩写了这部分内容。]=] },
{ type="SPEAK",value=[=[如果你觉得游戏题材不错，如果觉得游戏剧情可以更宏大一些，如果想抛弃我写的剧情，如果有各种更大胆，更奇怪的想法。你可以在这个游戏的基础上，自己做一个mod。mod开发一开始就作为这个游戏的主要内容。]=] },
{ type="SPEAK",value=[=[那么这个劣质游戏的demo剧情会不会继续写下去呢？整个游戏会不会就这么劣质下去呢？劣质游戏既然都开源了，那是不是意味着作者要弃坑了，不会更新游戏系统了？]=] },
{ type="SPEAK",value=[=[如果我有时间和精力我当然是会更新剧情的了。游戏会不会劣质下去我当然不知道了，至于会不会咕咕咕咕咕咕咕咕咕咕咕咕咕，看这个游戏项目有没有star了，可以去这个游戏的项目地址催更https://github.com/CppCXY/jyGameXreMake ]=] },
{ type="SPEAK",value=[=[最后 good luck! have fun]=] },
{ type="SPEAK",value=[=[下一周目！]=] },
{ type="SPEAK",value=[=[其实游戏暂时还不好玩，所以下周目是没必要的，但是为了体现游戏功能上的完整性，所以还是做了这么一个东西。]=] },
{ type="NEXT.ROUND" } },
result={  } },

{ name="武林联盟.姬书术.首轮",
action={ 
{ type="DIALOG",value=[=[姬书术#我看你这么高兴，难道你过了？]=] },
{ type="DIALOG",value=[=[主角#是啊，我也想不到我能赢。你呢？]=] },
{ type="DIALOG",value=[=[姬书术#我呀，我想不到有人比我还弱，所以就勉为其难晋级了。]=] },
{ type="DIALOG",value=[=[主角#那你运气和我一样好啊。]=] },
{ type="DIALOG",value=[=[姬书术#一般一般吧 。好好休息，争取进16强出线！]=] },
{ type="DIALOG",value=[=[主角#我觉得我的实力也就到这里了。]=] },
{ type="DIALOG",value=[=[姬书术#哈哈，不会的。吉人自有天相。]=] },
{ type="DIALOG",value=[=[主角#你还会看相？]=] },
{ type="DIALOG",value=[=[姬书术#没有没有，就是看过几本书，会胡乱编些话，做不得数的。]=] },
{ type="DIALOG",value=[=[主角#我可宁愿你说的都是真的呢。]=] },
{ type="DIALOG",value=[=[姬书术#但愿吧。]=] } },
result={  } },

{ name="武林联盟.女休息处.私会",
action={ 
{ type="DIALOG",value=[=[主角#今天我一定要问个明白。]=] },
{ type="DIALOG",value=[=[主角#嗯？女寝前面居然有个男人？]=] },
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="DIALOG",value=[=[陆见平#小怜！我是真心的。]=] },
{ type="DIALOG",value=[=[段小怜#公子请你离开，不要打扰我们休息。]=] },
{ type="DIALOG",value=[=[陆见平#从我第一眼看见你我就。。。难以自拔。]=] },
{ type="DIALOG",value=[=[段小怜#公子好意小怜心领了，只是这并不合适。]=] },
{ type="DIALOG",value=[=[陆见平#这没什么不合适的，我未娶，你未嫁。我心仪于你，我们之间也算是郎才女貌。这不正是天造地设的姻缘吗？]=] },
{ type="DIALOG",value=[=[段小怜#公子想多了我。。。心里已经有人了。]=] },
{ type="DIALOG",value=[=[陆见平#谁！你告诉我，我和他可以谈的。]=] },
{ type="DIALOG",value=[=[段小怜#公子你走吧。]=] },
{ type="DIALOG",value=[=[陆见平#哼！]=] },
{ type="SPEAK",value=[=[陆见平走后。屋中传来另一个女人的声音。]=] },
{ type="DIALOG",value=[=[黎余#我的师妹啊，你怎么这么讨人喜欢？在门里的时候所有师兄师弟都给你献殷勤，在外面了，每天都有人来找你。]=] },
{ type="DIALOG",value=[=[段小怜#师姐!别取笑我了。]=] },
{ type="DIALOG",value=[=[黎余#我可是第一次听说你有喜欢的人了。是哪个小伙子？前天那个灵鹫宫的师兄？还是之前的许师弟？]=] },
{ type="DIALOG",value=[=[段小怜#都不是，师姐你就不要问了。]=] },
{ type="DIALOG",value=[=[黎余#好好好，我不问了。也不知道谁这么大的福气。]=] },
{ type="DIALOG",value=[=[主角#。。。小怜有喜欢的人了。。。]=] },
{ type="DIALOG",value=[=[主角#（小怜有喜欢的人了，这是好事。可是为什么我胸口焖的慌？为什么我的心好像很痛，就像是突然失去了什么，难道我得病了吗？）]=] },
{ type="DIALOG",value=[=[主角#今天不宜见面。溜了溜了。]=] },
{ type="SET.TAG",value=[=[武林联盟.私会]=] } },
result={  } },

{ name="武林联盟.日思夜想",
action={ 
{ type="DIALOG",value=[=[主角#今天有人称小怜是师妹，那么小怜是已经加入了某门派，那么为何还来参加武林试？这里面疑问太多了，我下次要问清楚。]=] },
{ type="DIALOG",value=[=[主角#。。。。。。]=] },
{ type="COST_HOUR",value=[=[5]=] },
{ type="DIALOG",value=[=[主角#新的一天到了]=] },
{ type="SET.TAG",value=[=[武林联盟.二轮]=] } },
result={  } },

{ name="武林联盟.二轮",
action={ 
{ type="DIALOG",value=[=[主角#又要比试了，不知道今日的对手会是谁呢。]=] },
{ type="DIALOG",value=[=[陆见平#兄台，请吧，出线战你我当性命相搏。]=] },
{ type="DIALOG",value=[=[主角#（竟然是他，昨天骚扰小怜的人）]=] },
{ type="BATTLE",value=[=[武林试.陆见平]=] } },
result={ 
{ ret="win",type="story",value=[=[武林联盟.出线]=],
condition={  } },
{ ret="lose",type="endGame",value=[=[胜败乃兵家常事，请大侠重头再来！
陆见平下手太重，主角不幸身亡。]=],
condition={  } } } },

{ name="武林联盟.出线",
action={ 
{ type="DIALOG",value=[=[主角#差一点就输了。兄台，承让！]=] },
{ type="DIALOG",value=[=[陆见平#咳咳咳，兄台好手段。]=] },
{ type="SET.TAG",value=[=[武林联盟.16强]=] } },
result={  } },

{ name="武林联盟.姬书术.二轮",
action={ 
{ type="DIALOG",value=[=[主角#啊！我出线了。]=] },
{ type="DIALOG",value=[=[姬书术#哦？看起来你挺不错的嘛。竟然能出线。]=] },
{ type="DIALOG",value=[=[主角#那你呢？过了吗。]=] },
{ type="DIALOG",value=[=[姬书术#我一不小心也晋级了。]=] },
{ type="DIALOG",value=[=[主角#还能这样？]=] },
{ type="DIALOG",value=[=[姬书术#我也不知道为什么，突然就晋级了，和对手打着打着他就昏倒了。]=] },
{ type="DIALOG",value=[=[主角#那我打的可辛苦了。我感觉我下一轮是过不了了。]=] },
{ type="DIALOG",value=[=[姬书术#哈哈哈，我也是。不过基本目标已经完成了，剩下的也就排个名次。]=] },
{ type="DIALOG",value=[=[主角#话说这个排名有什么用。]=] },
{ type="DIALOG",value=[=[姬书术#这个排名大概就是决定初入门派时能获得的资源，依据排名，当选择门派之后会获得对应的奖励。]=] },
{ type="DIALOG",value=[=[主角#这个看起来我们不能奢求了。]=] },
{ type="DIALOG",value=[=[姬书术#是啊。]=] },
{ type="DIALOG",value=[=[主角#看起来要下雨了。]=] },
{ type="DIALOG",value=[=[姬书术#休息吧。]=] },
{ type="SET.TAG",value=[=[武林联盟.再探]=] } },
result={  } },

{ name="武林联盟.雨夜",
action={ 
{ type="DIALOG",value=[=[主角#今天我一定要见到小怜。]=] },
{ type="SET.MUSIC",value=[=[音乐.永恒的回忆]=] },
{ type="SPEAK",value=[=[{{主角}}偷偷的走到小怜的住处。想了想就直接敲门询问。]=] },
{ type="DIALOG",value=[=[主角#请问段小怜在吗？]=] },
{ type="DIALOG",value=[=[黎余#谁啊？！]=] },
{ type="DIALOG",value=[=[主角#你好，我找小怜。]=] },
{ type="DIALOG",value=[=[黎余#（打量了一眼眼前这个土里土气的男人，也不知道他是哪里来的勇气敢来找小怜师妹）哦？就你？小怜是你叫的吗？]=] },
{ type="DIALOG",value=[=[主角#我。。。]=] },
{ type="DIALOG",value=[=[黎余#哼！小怜不会见你的！]=] },
{ type="DIALOG",value=[=[主角#为什么？]=] },
{ type="DIALOG",value=[=[黎余#告辞！]=] },
{ type="SPEAK",value=[=[说着，黎余就关了门。]=] },
{ type="SPEAK",value=[=[黎余不知道的是，随着这扇门一起关掉的，是{{主角}}在经历过各种艰难和磨练之后仅存的少年心性。或许许多事，只是老天的捉弄，造化弄人罢了。]=] },
{ type="SPEAK",value=[=[雨下的突然大了起来，{{主角}}恍惚的离开了这里。小怜已经有了自己的人生，多余的话只是徒增烦恼。这一趟也许本就不该来。]=] },
{ type="SET.TAG",value=[=[武林联盟.雨夜]=] } },
result={ 
{ ret="map",type="武林联盟男休息处",value=[=[]=],
condition={  } } } },

{ name="武林联盟.意难平",
action={ 
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="DIALOG",value=[=[主角#天下无不散之宴席，我和小怜的缘，也许早就结束了。]=] },
{ type="DIALOG",value=[=[主角#算账先生曾经问我，相信命运吗？]=] },
{ type="DIALOG",value=[=[主角#当时懵懂，还以为我命由我不由天。]=] },
{ type="DIALOG",value=[=[主角#我不相信命运，我从大理闯出来，走过这万水千山，看尽云卷云舒，人世繁华。经历艰险磨难，披荆斩棘来到这里，以为自己是能掌握命运的人。]=] },
{ type="DIALOG",value=[=[主角#现在想来不过是命运在戏弄我罢了。]=] },
{ type="DIALOG",value=[=[主角#我突然觉得影莲姐说得对，如果给你莫大的希望，然后再将它毁去。]=] },
{ type="DIALOG",value=[=[主角#人是难以承受这样的痛楚。]=] },
{ type="DIALOG",value=[=[主角#我不过是个在江山大势中浮沉的小人物。想这些奇怪的干嘛呢？还是好好睡觉准备明天的比试吧。]=] },
{ type="DIALOG",value=[=[主角#新的一天到了]=] },
{ type="SET.TAG",value=[=[武林联盟.三轮]=] } },
result={  } },

{ name="武林联盟.三轮.相见",
action={ 
{ type="SET.MUSIC",value=[=[音乐.永恒的回忆]=] },
{ type="DIALOG",value=[=[主角#今天看台之下怎么有这么多人？]=] },
{ type="DIALOG",value=[=[主角#也是，今日比试之人都会是武林联盟各门派的弟子。]=] },
{ type="DIALOG",value=[=[主角#许多人淘汰之后也没有离开，看的人多一些也很正常。]=] },
{ type="DIALOG",value=[=[主角#不知道今天的对手是谁。]=] },
{ type="SPEAK",value=[=[忽地，风停了，台下的嘈杂声也静了，一位气质出尘的女子慢慢走上了擂台，然后俏生生的立在那里看着{{主角}}。{{主角}}抬头看去，四目相对，这一刻，时间彷佛静止。]=] },
{ type="SPEAK",value=[=[那立在对面的女子，不是小怜又是何人？]=] },
{ type="SPEAK",value=[=[第一次看见小怜的时候，全身脏兮兮，既不漂亮也不讨人喜欢，只是一双眼睛，带着一股不服输的倔强与坚韧，此刻再见小怜，少了那股违和感，多了一分出尘，一分自信和隐藏在深处那一抹不易察觉的哀思。]=] },
{ type="SPEAK",value=[=[{{段小怜}}再次见到{{主角}}，平日修身养气的功夫都乱了。那记忆深刻的一日，现在想来彷佛就在昨天，深心处的记忆，再次被唤醒，那个曾经素不相识的男子，在冷漠的人群中挺身而出。。。]=] },
{ type="SPEAK",value=[=[{{主角}}对小怜有过的埋怨，不解，疑惑。在这一刻终究化为了一句话。]=] },
{ type="DIALOG",value=[=[主角#你。。。还好吧。]=] },
{ type="DIALOG",value=[=[段小怜#嗯。。。]=] },
{ type="SPEAK",value=[=[一年未见的二人，一句简单的问候与回答,却道尽了人间沧桑。]=] },
{ type="SPEAK",value=[=[{{主角}}闭目平静了一会，深吸了一口气。]=] },
{ type="DIALOG",value=[=[主角#开始吧！]=] },
{ type="BATTLE",value=[=[武林联盟.段小怜]=] } },
result={ 
{ ret="win",type="story",value=[=[武林联盟.强行终结]=],
condition={  } },
{ ret="lose",type="story",value=[=[武林联盟.终]=],
condition={  } } } },

{ name="武林联盟.强行终结",
action={ 
{ type="SPEAK",value=[=[这你也能赢？你作弊吧。]=] } },
result={ 
{ ret=0,type="endGame",value=[=[我怀疑你作弊，但是我没有证据，但是谁叫我可以关闭游戏呢？]=],
condition={  } } } },

{ name="武林联盟.终",
action={ 
{ type="DIALOG",value=[=[主角#小怜厉害啊！我。。。咳咳咳。。。]=] },
{ type="DIALOG",value=[=[主角#。。。咳咳咳。。。（渐渐昏倒了过去）]=] },
{ type="DIALOG",value=[=[段小怜#石头哥哥！！！]=] } },
result={ 
{ ret=0,type="story",value=[=[武林联盟.有门派.第三章]=],
condition={  } } } },

{ name="武林联盟.有门派.第三章",
action={ 
{ type="SPEAK",value=[=[{{主角}}终于和段小怜相认了，昏倒之后又会发生怎样的故事。未来{{主角}}会进入怎样的门派，学习怎样的绝世武功呢？大理的客栈老板究竟会让{{主角}}进入门派之后做些什么呢？武林试真正的目的又是什么呢？天星尽摇，对这浮沉的江山将带来怎样的变化呢？]=] },
{ type="SPEAK",value=[=[第二章——人间百态完]=] },
{ type="SPEAK",value=[=[第三章——是昔流芳]=] },
{ type="SET.CHAPTER",value=[=[是昔流芳]=] } },
result={ 
{ ret=0,type="story",value=[=[劣质游戏.测试.完]=],
condition={  } } } },

{ name="少林.不准入.藏经阁",
action={ 
{ type="DIALOG",value=[=[主角#看我偷偷进藏经阁。]=] },
{ type="DIALOG",value=[=[少林方丈#施主，少林重地，可不要乱进啊。]=] },
{ type="DIALOG",value=[=[主角#对不起，对不起，我走错了。]=] } },
result={  } },

{ name="少林.翻阅经书",
action={ 
{ type="DIALOG",value=[=[主角#我翻翻看有什么经书。。。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="ITEM.RAND",value=[=[法华经入门经典|1#少林九阳功历史考究|1#|1#罗汉拳拳法精要|1#易筋经从入门到入土|1#铜钱|998#拈花指导论|1#伸腿瞪眼丸|1]=] },
{ type="SET.TAG",value=[=[藏经阁.不可进]=] },
{ type="DEL.TAG.DELAY",value=[=[藏经阁.不可进#3#0]=] } },
result={  } },

{ name="少林.有人.离开",
action={ 
{ type="DIALOG",value=[=[主角#不好，有人来了。赶紧溜走]=] } },
result={ 
{ ret=0,type="map",value=[=[少林]=],
condition={  } } } },

{ name="少林.扫地僧",
action={ 
{ type="DIALOG",value=[=[无名老僧#施主？]=] },
{ type="DIALOG",value=[=[主角#？？？有人（我竟然没有发现）！]=] },
{ type="DIALOG",value=[=[无名老僧#在看书呢？]=] },
{ type="DIALOG",value=[=[主角#是啊。]=] },
{ type="DIALOG",value=[=[无名老僧#虽然少林也是联盟成员。但是藏经阁依然不是对外开放的。]=] },
{ type="DIALOG",value=[=[主角#。。。]=] },
{ type="DIALOG",value=[=[无名老僧#走吧。]=] },
{ type="SET.TAG",value=[=[藏经阁.不可进]=] } },
result={ 
{ ret=0,type="map",value=[=[少林]=],
condition={  } } } },

{ name="松鼠仓库.日常",
action={ 
{ type="WAREHOUSE" } },
result={  } },

{ name="松鼠仓库.首次",
action={ 
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="DIALOG",value=[=[汉家松鼠#你是谁！]=] },
{ type="DIALOG",value=[=[主角#这里干嘛的。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我不知道。]=] },
{ type="DIALOG",value=[=[主角#那你又在这里干嘛。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我不知道。]=] },
{ type="DIALOG",value=[=[主角#那你是谁？]=] },
{ type="DIALOG",value=[=[汉家松鼠#我不知道。]=] },
{ type="DIALOG",value=[=[主角#那你知道什么？]=] },
{ type="DIALOG",value=[=[汉家松鼠#我不知道。]=] },
{ type="DIALOG",value=[=[主角#我遇到一个傻子，妈妈不让我跟傻子玩。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我听出来了，你在骂我。]=] },
{ type="DIALOG",value=[=[主角#。。。你是失忆了嘛？]=] },
{ type="DIALOG",value=[=[汉家松鼠#我不知道。]=] },
{ type="DIALOG",value=[=[主角#那就是了。]=] },
{ type="DIALOG",value=[=[主角#跟我走吧，我带你找回你的记忆。]=] },
{ type="DIALOG",value=[=[汉家松鼠#。。。]=] },
{ type="SET.TAG",value=[=[松鼠的记忆]=] },
{ type="JOIN",value=[=[汉家松鼠]=] } },
result={  } },

{ name="时光之书.不开放",
action={ 
{ type="DIALOG",value=[=[主角#时光之书内容没有写，只是占个位置。]=] } },
result={  } },

{ name="风陵渡口.汉家松鼠.回忆1",
action={ 
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="DIALOG",value=[=[主角#怎么了？]=] },
{ type="DIALOG",value=[=[汉家松鼠#我对这里有印象。]=] },
{ type="DIALOG",value=[=[主角#哦？]=] },
{ type="DIALOG",value=[=[汉家松鼠#我在这里被人救起来过。]=] },
{ type="DIALOG",value=[=[主角#你还落水了？]=] },
{ type="DIALOG",value=[=[汉家松鼠#嗯。。。我被一个姑娘救了。]=] },
{ type="DIALOG",value=[=[主角#还有这种好事。]=] },
{ type="DIALOG",value=[=[汉家松鼠#。。。被救之后。。。记不起来了。]=] },
{ type="DIALOG",value=[=[主角#那你又怎么落水的呢？]=] },
{ type="DIALOG",value=[=[汉家松鼠#好像也是她推的。]=] },
{ type="DIALOG",value=[=[主角#。。。小两口吵架？]=] },
{ type="DIALOG",value=[=[汉家松鼠#。。。不知道。]=] },
{ type="DIALOG",value=[=[主角#那你知道什么？]=] },
{ type="DIALOG",value=[=[汉家松鼠#不知道。]=] },
{ type="DIALOG",value=[=[主角#我可能真的遇到一个傻子。]=] },
{ type="DIALOG",value=[=[汉家松鼠#。。。]=] },
{ type="SET.TAG",value=[=[松鼠回忆1]=] } },
result={  } },

{ name="北京.汉家松鼠.回忆2",
action={ 
{ type="SET.MUSIC",value=[=[音乐.一生所爱]=] },
{ type="DIALOG",value=[=[主角#你又怎么了。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我对这里有印象。]=] },
{ type="DIALOG",value=[=[汉家松鼠#在这里，我和别人一起逛过街。]=] },
{ type="DIALOG",value=[=[主角#？？？不得了。看起来还是那个女的？]=] },
{ type="DIALOG",value=[=[汉家松鼠#嗯！不过之后的事，我想不起来了。]=] },
{ type="DIALOG",value=[=[主角#禽兽！]=] },
{ type="DIALOG",value=[=[汉家松鼠#？？？]=] },
{ type="DIALOG",value=[=[主角#你记忆全失，但是和那个女的有关的地方你却记得住，这或许是个突破口。]=] },
{ type="DIALOG",value=[=[汉家松鼠#可能是吧。]=] },
{ type="DIALOG",value=[=[主角#过去这么久还让你久久不能忘怀。连失忆都还深深的记得，这说明这个人对你很重要。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我又想起一些事情。]=] },
{ type="DIALOG",value=[=[主角#嗯？]=] },
{ type="DIALOG",value=[=[汉家松鼠#我和她第一次见面是在风陵渡口，她聪慧机敏，天真无邪。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我们一见如故，把酒言欢，后来她要去万兽山庄，她说她要找一个人。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我们在客栈里别过，后来不知道她经历了什么，再见的时候，她已经没有初见时的无邪。]=] },
{ type="DIALOG",value=[=[汉家松鼠#那天我带着她，逛在北京的大街小巷，希望她能开心一点。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我看得出来，她是有什么心事。但是我知道她想说的话，一定会自己说的。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我没有问，她也没有说。我们找了个地方休息，第二天，她不告而别。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我想她又去寻找那个人了。我不知道是谁，不然我可以帮她一起找。]=] },
{ type="DIALOG",value=[=[汉家松鼠#之后一年的时间，我也不知道在干嘛，似乎有点浑浑噩噩。所以我决定去找她。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我觉得她必然还会回到风陵渡口。我就去了那间客栈。]=] },
{ type="DIALOG",value=[=[汉家松鼠#后来，她确实回来了，不过看上去心情很不好，她看见了我，我俩又坐在了一起，不过这一次没有酒，也没有多余的话。她眼里尽是悲伤。我想去安慰她，但是又不知道如何做。]=] },
{ type="DIALOG",value=[=[汉家松鼠#出了客栈之后，来了一群黑衣人，他们似乎要追杀她。我们就一起跑，跑到了河边，无路可走。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我不会游泳，她见我犹犹豫豫，就把我推了下去，然后自己也跳了下去，把我拉住了。]=] },
{ type="DIALOG",value=[=[汉家松鼠#我们躲过了追杀之后，她把我救了起来，我没有问她为什么，她也没有主动给我说。]=] },
{ type="DIALOG",value=[=[汉家松鼠#休息一夜之后，她又走了，之后我们就再也没有见过了。]=] },
{ type="DIALOG",value=[=[汉家松鼠#在这之后我也没有记忆。]=] },
{ type="DIALOG",value=[=[主角#。。。所以你还会去找她吗？]=] },
{ type="DIALOG",value=[=[汉家松鼠#是的，既然已经想起这么多了，剩下的线索应该在她身上。]=] },
{ type="DIALOG",value=[=[汉家松鼠#不过我得一个人去找她。告辞了。]=] },
{ type="LEAVE",value=[=[汉家松鼠]=] },
{ type="DIALOG",value=[=[主角#真奇怪。。。]=] },
{ type="SUGGEST",value=[=[松鼠仓库可以使用了。]=] },
{ type="SET.TAG",value=[=[松鼠仓库]=] } },
result={  } },

}
return story