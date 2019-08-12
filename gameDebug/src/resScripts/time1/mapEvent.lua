local mapEvent={

{ belongMap="大地图",name="风陵渡口",x=500,y=360,pic="",description="",
event={ 
{ type="map",value="风陵渡口",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="风陵渡口",name="松鼠有话说",x=-1,y=-1,pic="头像.汉家松鼠",description="",
event={ 
{ type="story",value="风陵渡口.汉家松鼠.回忆1",image="",description="",repeatTimes="once",probability=30,
condition={ 
{ type="HAS.TAG",value="松鼠的记忆" } } } } },

{ belongMap="风陵渡口",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="大理",x=100,y=70,pic="头像.返回",description="",
event={ 
{ type="map",value="大理",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理",name="乡间小路",x=-1,y=-1,pic="地图.大理.乡间小路",description="",
event={ 
{ type="map",value="大理乡间小路",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理乡间小路",name="宁静村",x=-1,y=-1,pic="地图.大理.宁静村",description="",
event={ 
{ type="map",value="大理宁静村",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理宁静村",name="大伯",x=-1,y=-1,pic="头像.大理宁静村老伯",description="",
event={ 
{ type="story",value="大理.宁静村.讨米",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="CHAPTER",value="序章" } } },
{ type="story",value="任务.大理.找兽皮",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="任务.大理.找兽皮" } } } } },

{ belongMap="大理宁静村",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理乡间小路",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理乡间小路",name="石头村",x=-1,y=-1,pic="地图.大理.石头村",description="",
event={ 
{ type="map",value="大理石头村",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理石头村",name="家",x=-1,y=-1,pic="地图.大理.石头村.家",description="",
event={ 
{ type="map",value="大理石头村家",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="男" } } } } },

{ belongMap="大理石头村家",name="母亲",x=-1,y=-1,pic="头像.大理石头村母亲",description="",
event={ 
{ type="story",value="大理.石头村.家.母亲",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="男" },
{ type="CHAPTER",value="序章" } } },
{ type="story",value="大理.石头村.家.母亲.我回来",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="should_finish",value="大理.青楼.绿珠儿.房间.做工" } } } } },

{ belongMap="大理石头村家",name="自己的床",x=-1,y=-1,pic="team:主角",description="",
event={ 
{ type="story",value="大理.石头村.家.床",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理石头村家",name="石头村",x=-1,y=-1,pic="地图.大理.石头村",description="",
event={ 
{ type="map",value="大理石头村",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理石头村",name="后山",x=-1,y=-1,pic="地图.大理.石头村.后山",description="",
event={ 
{ type="map",value="大理石头村后山",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理石头村后山",name="前面有个山洞",x=-1,y=-1,pic="地图.大理.石头村.后山.山洞",description="",
event={ 
{ type="map",value="大理石头村后山山洞",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理石头村后山",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理石头村",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理石头村后山山洞",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理石头村后山",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理石头村后山山洞",name="扎西",x=-1,y=-1,pic="头像.扎西",description="",
event={ 
{ type="story",value="大理.石头村.后山.山洞.扎西1",image="",description="",repeatTimes="once",probability=20,
condition={ 
{ type="HAS.MISSION",value="大理.有间客栈.任务三次元" } } } } },

{ belongMap="大理石头村",name="大理乡间小路",x=-1,y=-1,pic="地图.大理.乡间小路",description="",
event={ 
{ type="map",value="大理乡间小路",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理乡间小路",name="深山",x=-1,y=-1,pic="地图.大理.深山",description="",
event={ 
{ type="map",value="大理深山",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理深山",name="老林",x=-1,y=-1,pic="地图.老林",description="",
event={ 
{ type="story",value="大理.乡间小路.深山.老林",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理深山",name="熊",x=-1,y=-1,pic="头像.大理熊",description="",
event={ 
{ type="story",value="大理.乡间小路.深山.熊",image="",description="",repeatTimes="",probability=40,
condition={  } } } },

{ belongMap="大理深山",name="待定",x=-1,y=-1,pic="头像.待定",description="",
event={ 
{ type="story",value="大理.乡间小路.深山.待定",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.MISSION",value="大理.有间客栈.任务三次元" } } } } },

{ belongMap="大理深山",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理乡间小路",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理乡间小路",name="大理",x=-1,y=-1,pic="地图.大理",description="",
event={ 
{ type="map",value="大理",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理",name="有间客栈",x=-1,y=-1,pic="地图.大理.有间客栈",description="",
event={ 
{ type="map",value="大理有间客栈",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理有间客栈",name="客栈老板",x=-1,y=-1,pic="头像.大理有间客栈老板",description="",
event={ 
{ type="story",value="大理.有间客栈.打尖住店",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="CHAPTER",value="序章" } } },
{ type="story",value="大理.有间客栈.黑话2",image="",description="",repeatTimes="",probability=30,
condition={ 
{ type="CHAPTER",value="俗世凡尘" },
{ type="HAS.TAG",value="有间客栈.黑话" } } },
{ type="story",value="任务.大理.除虎",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="任务.大理.除虎" } } },
{ type="story",value="任务.大理.三次元",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="任务.大理.三次元" } } },
{ type="story",value="任务.大理.完成以上所有任务",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="任务.大理.完成以上所有任务" } } },
{ type="story",value="任务.大理.木头人",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="任务.大理.木头人" } } } } },

{ belongMap="大理有间客栈",name="木头人",x=-1,y=-1,pic="头像.木头人",description="",
event={ 
{ type="story",value="大理.练习.木头人",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="CHAPTER",value="俗世凡尘" } } } } },

{ belongMap="大理有间客栈",name="包打听",x=-1,y=-1,pic="头像.包打听",description="",
event={ 
{ type="story",value="大理.有间客栈.黑话1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="CHAPTER",value="俗世凡尘" } } } } },

{ belongMap="大理有间客栈",name="大理",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="NOT.HAS",value="大理.有间客栈" } } } } },

{ belongMap="大理",name="青楼",x=-1,y=-1,pic="地图.大理.青楼",description="",
event={ 
{ type="map",value="大理青楼",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理青楼",name="绿珠儿",x=-1,y=-1,pic="头像.绿珠儿",description="",
event={ 
{ type="story",value="大理.青楼.绿珠儿",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="NOT.HAS",value="大理鸡开始" } } } } },

{ belongMap="大理青楼",name="陈小媛",x=-1,y=-1,pic="头像.陈小媛",description="",
event={ 
{ type="story",value="大理.青楼.陈小媛",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="NOT.HAS",value="大理鸡开始" } } } } },

{ belongMap="大理青楼",name="顾影莲",x=-1,y=-1,pic="头像.顾影莲",description="",
event={ 
{ type="story",value="大理.青楼.顾影莲",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="NOT.HAS",value="大理鸡开始" } } } } },

{ belongMap="大理青楼",name="往里走",x=-1,y=-1,pic="地图.大理.青楼.内阁",description="",
event={ 
{ type="map",value="大理青楼内阁",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="NOT.HAS",value="大理.青楼.太菜了" },
{ type="NOT.HAS",value="大理.青楼.离开" } } },
{ type="story",value="大理.青楼.太菜了",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.青楼.太菜了" } } },
{ type="story",value="大理.青楼.离开",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.青楼.离开" } } } } },

{ belongMap="大理青楼内阁",name="老鸨",x=-1,y=-1,pic="头像.大理老鸨",description="",
event={ 
{ type="story",value="大理.青楼.老鸨1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="should_finish",value="大理.石头村.家.母亲.我回来" } } },
{ type="story",value="大理.青楼.日常运营1",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.青楼.可打工" },
{ type="NOT.HAS",value="大理.青楼.离开" },
{ type="NOT.HAS",value="大理.青楼.太菜了" } } } } },

{ belongMap="大理青楼内阁",name="绿珠儿房间",x=-1,y=-1,pic="地图.绿珠儿房间",description="",
event={ 
{ type="map",value="绿珠儿房间",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="CHAPTER",value="俗世凡尘" } } } } },

{ belongMap="绿珠儿房间",name="绿珠儿",x=-1,y=-1,pic="头像.绿珠儿",description="",
event={ 
{ type="story",value="大理.青楼.内阁.绿珠儿日常",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="绿珠儿房间",name="陈小媛",x=-1,y=-1,pic="头像.陈小媛",description="",
event={ 
{ type="story",value="大理.青楼.内阁.陈小媛1",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="绿珠儿房间",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理青楼内阁",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理青楼内阁",name="顾影莲",x=-1,y=-1,pic="头像.顾影莲",description="",
event={ 
{ type="story",value="大理.青楼.内阁.顾影自怜1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="CHAPTER",value="俗世凡尘" } } } } },

{ belongMap="大理青楼内阁",name="去屋顶",x=-1,y=-1,pic="地图.大理.青楼.屋顶",description="",
event={ 
{ type="map",value="大理青楼屋顶",image="",description="",repeatTimes="",probability=100,
condition={ 
{ type="in_time",value="戊#子#丑#寅#卯" } } } } },

{ belongMap="大理青楼内阁",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理青楼",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理青楼",name="大理",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理",name="段王府",x=-1,y=-1,pic="地图.大理.段王府",description="",
event={ 
{ type="map",value="大理段王府",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理段王府",name="王府",x=-1,y=-1,pic="地图.段王府",description="",
event={ 
{ type="story",value="大理.段王府.不能进",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理段王府",name="那边有吵闹声",x=-1,y=-1,pic="头像.路人甲",description="",
event={ 
{ type="story",value="大理.段王府.小怜",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="NOT.HAS",value="大理鸡开始" } } } } },

{ belongMap="大理段王府",name="段小怜",x=-1,y=-1,pic="头像.段小怜",description="",
event={ 
{ type="story",value="大理.段王府.小怜3",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理牛车" } } } } },

{ belongMap="大理段王府",name="小孩",x=-1,y=-1,pic="头像.小孩",description="",
event={ 
{ type="story",value="任务.大理.找手镯",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="任务.大理.找手镯" } } } } },

{ belongMap="大理段王府",name="乱葬岗",x=-1,y=-1,pic="地图.大理.乱葬岗",description="",
event={ 
{ type="map",value="大理乱葬岗",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="CHAPTER",value="俗世凡尘" } } } } },

{ belongMap="大理段王府",name="大理",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理",name="大理寺",x=-1,y=-1,pic="地图.大理寺",description="",
event={ 
{ type="story",value="大理.大理寺.不能进",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理",name="牛车",x=-1,y=-1,pic="头像.牛车老伯",description="",
event={ 
{ type="story",value="大理.牛车",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理小怜" } } } } },

{ belongMap="大理",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="江湖行" } } } } },

{ belongMap="大理乱葬岗",name="回到大理",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="CHAPTER",value="俗世凡尘" } } } } },

{ belongMap="大理乱葬岗",name="这里好奇怪",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="大理.乱葬岗.奇怪1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理小怜结束" } } } } },

{ belongMap="大理乱葬岗",name="这里也很奇怪",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="大理.乱葬岗.奇怪2",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理小怜结束" } } } } },

{ belongMap="大理乱葬岗",name="这里就更奇怪了",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="大理.乱葬岗.奇怪3",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理小怜结束" } } } } },

{ belongMap="大理乱葬岗",name="前面一定发生了什么事情",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="大理.乱葬岗.韦一笑",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="should_finish",value="大理.乱葬岗.奇怪1" },
{ type="should_finish",value="大理.乱葬岗.奇怪2" },
{ type="should_finish",value="大理.乱葬岗.奇怪3" } } } } },

{ belongMap="大理乱葬岗",name="老虎",x=-1,y=-1,pic="头像.老虎",description="",
event={ 
{ type="story",value="大理.乱葬岗.大战老虎",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.MISSION",value="大理.有间客栈.任务除恶虎" } } } } },

{ belongMap="大理青楼运营",name="结束今天的工作",x=-1,y=-1,pic="头像.大理老鸨",description="",
event={ 
{ type="story",value="大理.青楼.结算",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理青楼运营",name="端茶送水",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="大理.青楼.端茶送水",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理青楼运营",name="陆小草",x=-1,y=-1,pic="头像.陆小草",description="",
event={ 
{ type="story",value="大理.青楼.运营.陆小草1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.青楼.运营1" } } } } },

{ belongMap="大理青楼运营",name="那边有吵闹声",x=-1,y=-1,pic="头像.陆小草",description="",
event={ 
{ type="story",value="大理.青楼.运营.陆小草欺辱",image="",description="",repeatTimes="once",probability=20,
condition={ 
{ type="HAS.TAG",value="大理.青楼.运营2" } } } } },

{ belongMap="大理青楼运营",name="绿珠儿",x=-1,y=-1,pic="头像.绿珠儿",description="",
event={ 
{ type="story",value="大理.青楼.运营.绿珠儿1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.青楼.运营1" } } } } },

{ belongMap="大理青楼屋顶",name="陆小草",x=-1,y=-1,pic="头像.陆小草",description="",
event={ 
{ type="story",value="大理.青楼.屋顶.陆小草",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.青楼.陆小草2" } } } } },

{ belongMap="大理青楼屋顶",name="顾影莲",x=-1,y=-1,pic="头像.顾影莲",description="",
event={ 
{ type="story",value="大理.青楼.屋顶.顾影莲",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="should_finish",value="大理.落尘寰2" } } } } },

{ belongMap="大理青楼屋顶",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大理青楼内阁",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大理青楼内阁",name="顾影莲",x=-1,y=-1,pic="头像.顾影莲",description="",
event={ 
{ type="story",value="大理.落尘寰1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.支线.落尘寰" } } } } },

{ belongMap="大理有间客栈",name="店小二",x=-1,y=-1,pic="头像.店小二",description="",
event={ 
{ type="story",value="大理.有间客栈.店小二1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } },
{ type="story",value="大理.有间客栈.店小二.日常",image="",description="",repeatTimes="",probability=30,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" },
{ type="NOT.HAS",value="大理.有间客栈.江湖" } } },
{ type="story",value="大理.有间客栈.店小二.进阶1",image="",description="",repeatTimes="once",probability=10,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } },
{ type="story",value="大理.有间客栈.店小二.进阶2",image="",description="",repeatTimes="once",probability=20,
condition={ 
{ type="should_finish",value="大理.有间客栈.店小二.进阶1" } } } } },

{ belongMap="大理有间客栈",name="炒菜的",x=-1,y=-1,pic="头像.大理厨子",description="",
event={ 
{ type="story",value="大理.有间客栈.厨子1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } },
{ type="story",value="大理.有间客栈.厨子.日常",image="",description="",repeatTimes="",probability=30,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" },
{ type="NOT.HAS",value="大理.有间客栈.江湖" } } },
{ type="story",value="大理.有间客栈.厨子.进阶1",image="",description="",repeatTimes="once",probability=10,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } } } },

{ belongMap="大理有间客栈",name="算账的",x=-1,y=-1,pic="头像.大理算账先生",description="",
event={ 
{ type="story",value="大理.有间客栈.算账1",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } },
{ type="story",value="大理.有间客栈.算账.日常",image="",description="",repeatTimes="",probability=30,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" },
{ type="NOT.HAS",value="大理.有间客栈.江湖" } } },
{ type="story",value="大理.有间客栈.算账.进阶1",image="",description="",repeatTimes="once",probability=10,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } },
{ type="story",value="大理.有间客栈.算账.进阶2",image="",description="",repeatTimes="once",probability=20,
condition={ 
{ type="should_finish",value="大理.有间客栈.算账.进阶1" } } } } },

{ belongMap="大理有间客栈",name="端茶送水",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="大理.有间客栈.端茶送水",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } } } },

{ belongMap="大理有间客栈",name="老板有话说",x=-1,y=-1,pic="头像.大理有间客栈老板",description="",
event={ 
{ type="story",value="大理.有间客栈.天地世间",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈" } } } } },

{ belongMap="大理有间客栈",name="江湖",x=-1,y=-1,pic="头像.大理有间客栈老板",description="",
event={ 
{ type="story",value="大理.有间客栈.江湖行",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="大理.有间客栈.江湖" } } } } },

{ belongMap="大地图",name="少林",x=750,y=360,pic="",description="",
event={ 
{ type="map",value="少林",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="少林",name="少林寺",x=-1,y=-1,pic="地图.少林寺",description="",
event={ 
{ type="story",value="少林.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="少林",name="藏经阁",x=-1,y=-1,pic="地图.少林藏经阁",description="",
event={ 
{ type="story",value="少林.不准入.藏经阁",image="",description="",repeatTimes="",probability=90,
condition={  } },
{ type="map",value="少林藏经阁",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="NOT.HAS",value="藏经阁.不可进" } } } } },

{ belongMap="少林藏经阁",name="溜回去",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="少林",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="少林藏经阁",name="翻阅经书",x=-1,y=-1,pic="物品.四象掌拳谱",description="",
event={ 
{ type="story",value="少林.翻阅经书",image="",description="",repeatTimes=5,probability=50,
condition={ 
{ type="NOT.HAS",value="藏经阁.不可进" } } },
{ type="story",value="少林.有人.离开",image="",description="",repeatTimes="",probability=60,
condition={  } },
{ type="story",value="少林.扫地僧",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="少林",name="武林试",x=-1,y=-1,pic="头像.少林寺小和尚",description="",
event={ 
{ type="story",value="少林.武林试",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="少林",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="少林",name="少林演武场",x=-1,y=-1,pic="地图.少林演武场",description="",
event={ 
{ type="map",value="少林演武场",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="should_finish",value="少林.武林试" },
{ type="NOT.HAS",value="武林试.不能进" } } } } },

{ belongMap="少林演武场",name="小和尚",x=-1,y=-1,pic="头像.少林寺小和尚",description="",
event={ 
{ type="story",value="武林试初试规则",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="少林演武场",name="文试",x=-1,y=-1,pic="头像.文试官",description="",
event={ 
{ type="story",value="武林试初试文试",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="NOT.HAS",value="武林试初试文试.过" } } } } },

{ belongMap="少林演武场",name="武试",x=-1,y=-1,pic="头像.武试官",description="",
event={ 
{ type="story",value="武林试初试武试",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="NOT.HAS",value="武林试初试武试.过" } } } } },

{ belongMap="少林演武场",name="武林试正式场地",x=-1,y=-1,pic="地图.少林演武场",description="",
event={ 
{ type="map",value="武林联盟",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="武林试初试文试.过" },
{ type="HAS.TAG",value="武林试初试武试.过" } } } } },

{ belongMap="大地图",name="长安",x=480,y=320,pic="",description="",
event={ 
{ type="map",value="长安",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="长安",name="临四十七巷",x=-1,y=-1,pic="地图.临四十七巷",description="",
event={ 
{ type="map",value="临四十七巷",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="临四十七巷",name="老笔斋",x=-1,y=-1,pic="地图.临四十七巷",description="",
event={ 
{ type="story",value="长安.商店",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="临四十七巷",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="长安",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="长安",name="说书人",x=-1,y=-1,pic="头像.说书人",description="",
event={ 
{ type="story",value="长安.说书人",image="",description="",repeatTimes="once",probability=50,
condition={  } } } },

{ belongMap="长安",name="这里挺热闹的",x=-1,y=-1,pic="头像.长安官兵",description="",
event={ 
{ type="story",value="长安.招兵",image="",description="",repeatTimes="once",probability=20,
condition={  } } } },

{ belongMap="长安",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="北京",x=710,y=540,pic="",description="",
event={ 
{ type="map",value="北京",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="北京",name="卖花",x=-1,y=-1,pic="头像.卖花的小姑娘",description="",
event={ 
{ type="story",value="北京.卖花",image="",description="",repeatTimes="once",probability=20,
condition={ 
{ type="ITEM.GREATER.THAN",value="铜钱,1000" } } } } },

{ belongMap="北京",name="乞丐",x=-1,y=-1,pic="头像.乞丐",description="",
event={ 
{ type="story",value="北京.乞丐",image="",description="",repeatTimes="once",probability=20,
condition={ 
{ type="ITEM.GREATER.THAN",value="铜钱,1000" } } } } },

{ belongMap="北京",name="潘家园",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="北京.潘家园.不能进",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="北京",name="松鼠有话说",x=-1,y=-1,pic="头像.汉家松鼠",description="",
event={ 
{ type="story",value="北京.汉家松鼠.回忆2",image="",description="",repeatTimes="once",probability=30,
condition={ 
{ type="HAS.TAG",value="松鼠回忆1" } } } } },

{ belongMap="北京",name="皇宫",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="北京.皇宫.不能进",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="北京",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="武当",x=640,y=280,pic="",description="",
event={ 
{ type="map",value="武当",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武当",name="武当派",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="武当.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武当",name="武当后山",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="武当.拒绝进入",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武当",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="高昌",x=200,y=580,pic="",description="",
event={ 
{ type="map",value="高昌",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="高昌",name="迷宫",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="高昌.迷宫.不要去",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="高昌",name="这里有土匪",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="高昌.除暴安良",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="高昌",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="西夏",x=180,y=560,pic="",description="",
event={ 
{ type="map",value="西夏",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="西夏",name="这边发生了奇怪的事情",x=-1,y=-1,pic="头像.路人丙",description="",
event={ 
{ type="story",value="西夏.卖儿卖女",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="西夏",name="私塾",x=-1,y=-1,pic="头像.家长甲",description="",
event={ 
{ type="story",value="西夏.求学",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="西夏",name="西夏酒楼",x=-1,y=-1,pic="地图.西夏酒楼",description="",
event={ 
{ type="map",value="西夏酒楼",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="西夏酒楼",name="这里有人弹琴",x=-1,y=-1,pic="头像.琴女",description="",
event={ 
{ type="story",value="西夏.酒楼.旧情如梦",image="",description="",repeatTimes="once",probability=0,
condition={  } },
{ type="story",value="西夏.酒楼.旧梦破碎",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="have_item",value="带血发簪" },
{ type="have_item",value="带血的书信" } } } } },

{ belongMap="西夏酒楼",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="西夏",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="西夏",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="南少林",x=770,y=120,pic="",description="",
event={ 
{ type="map",value="南少林",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="南少林",name="南少林寺",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="南少林.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="南少林",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="衡山",x=480,y=150,pic="",description="",
event={ 
{ type="map",value="衡山",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="衡山",name="衡山派",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="衡山派.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="衡山",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="星宿派",x=50,y=460,pic="",description="",
event={ 
{ type="map",value="星宿派",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="星宿派",name="星宿派",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="星宿派.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="星宿派",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="恒山派",x=650,y=530,pic="",description="",
event={ 
{ type="map",value="恒山派",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="恒山派",name="恒山派",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="恒山派.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="恒山派",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="峨眉派",x=160,y=200,pic="",description="",
event={ 
{ type="story",value="峨眉派.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="青城派",x=160,y=280,pic="",description="",
event={ 
{ type="story",value="青城派.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="全真教",x=600,y=320,pic="",description="",
event={ 
{ type="map",value="全真教",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="全真教",name="全真教",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="全真教.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="全真教",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="灵鹫宫",x=240,y=540,pic="",description="",
event={ 
{ type="map",value="灵鹫宫",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="灵鹫宫",name="灵鹫宫",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="灵鹫宫.切磋",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="灵鹫宫",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="白驼山",x=30,y=500,pic="",description="",
event={ 
{ type="story",value="白驼山.不可进",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="无量山",x=50,y=50,pic="",description="",
event={ 
{ type="map",value="无量山",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="无量山",name="神仙姐姐",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="神仙姐姐.磕头",image="",description="",repeatTimes=10,probability=0,
condition={  } },
{ type="story",value="神仙姐姐.秘籍",image="",description="",repeatTimes=1,probability=0,
condition={  } } } },

{ belongMap="无量山",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="襄阳",x=420,y=340,pic="",description="",
event={ 
{ type="map",value="襄阳",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="襄阳",name="说书人",x=-1,y=-1,pic="头像.说书人",description="",
event={ 
{ type="story",value="说书.襄阳",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="襄阳",name="道士",x=-1,y=-1,pic="头像.道士",description="",
event={ 
{ type="story",value="襄阳.道士",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="襄阳",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="华山",x=620,y=360,pic="",description="",
event={ 
{ type="map",value="华山",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="华山",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="西部战场",x=130,y=360,pic="",description="",
event={ 
{ type="map",value="西部战场",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="西部战场",name="这里有人",x=-1,y=-1,pic="头像.老兵",description="",
event={ 
{ type="story",value="西部战场.老兵传奇",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="西部战场",name="打扫旧战场",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="西部战场.旧战场.啥也没有",image="",description="",repeatTimes=5,probability=20,
condition={  } },
{ type="story",value="西部战场.旧战场.有点啥",image="",description="",repeatTimes="once",probability=20,
condition={  } },
{ type="story",value="西部战场.旧战场.衣服",image="",description="",repeatTimes="once",probability=20,
condition={  } } } },

{ belongMap="西部战场",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="大地图",name="坠星村",x=120,y=300,pic="",description="",
event={ 
{ type="map",value="坠星村",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="坠星村",name="石碑",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="坠星村.石碑",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="坠星村",name="祭祀大典",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="坠星村.神明",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="坠星村",name="陨石",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="坠星村.石刻",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="坠星村",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武林联盟",name="正赛规则",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="武林联盟.正赛规则",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武林联盟",name="那边有人在谈论",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="武林联盟.谈论1",image="",description="",repeatTimes="once",probability=0,
condition={  } } } },

{ belongMap="武林联盟",name="那边这里也有人在谈论",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="武林联盟.谈论2",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.谈论1" } } } } },

{ belongMap="武林联盟",name="还有人在谈论",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="武林联盟.谈论3",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.谈论2" } } } } },

{ belongMap="武林联盟",name="男休息处",x=-1,y=-1,pic="地图.武林联盟男休息处",description="",
event={ 
{ type="map",value="武林联盟男休息处",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武林联盟",name="女休息处",x=-1,y=-1,pic="地图.武林联盟女休息处",description="",
event={ 
{ type="story",value="武林联盟.女禁止入内",image="",description="",repeatTimes="",probability=60,
condition={  } },
{ type="map",value="武林联盟女休息处",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武林联盟女休息处",name="姬书术",x=-1,y=-1,pic="头像.姬书术",description="",
event={ 
{ type="story",value="武林联盟.女休息处.姬书术",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="姬书术.会面" } } } } },

{ belongMap="武林联盟女休息处",name="那边有人",x=-1,y=-1,pic="头像.陆见平",description="",
event={ 
{ type="story",value="武林联盟.女休息处.私会",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林试.32强" } } } } },

{ belongMap="武林联盟女休息处",name="再探",x=-1,y=-1,pic="team:主角",description="",
event={ 
{ type="story",value="武林联盟.雨夜",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.再探" } } } } },

{ belongMap="武林联盟女休息处",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="武林联盟",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武林联盟男休息处",name="住处登记",x=-1,y=-1,pic="头像.文试官",description="",
event={ 
{ type="story",value="武林联盟.男登记",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.谈论3" } } } } },

{ belongMap="武林联盟男休息处",name="自己的住处",x=-1,y=-1,pic="team:主角",description="",
event={ 
{ type="story",value="武林联盟.睡觉",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.男登记" } } } } },

{ belongMap="武林联盟男休息处",name="姬书术的住处",x=-1,y=-1,pic="头像.姬书术",description="",
event={ 
{ type="story",value="武林联盟.别乱闯房间",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.男登记" } } } } },

{ belongMap="武林联盟男休息处",name="姬书术有话说",x=-1,y=-1,pic="头像.姬书术",description="",
event={ 
{ type="story",value="武林联盟.姬书术有话",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.男登记" } } } } },

{ belongMap="武林联盟男休息处",name="姬书术",x=-1,y=-1,pic="头像.姬书术",description="",
event={ 
{ type="story",value="武林联盟.姬书术.首轮",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林试.32强" } } },
{ type="story",value="武林联盟.姬书术.二轮",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.16强" } } } } },

{ belongMap="武林联盟男休息处",name="姬书术",x=-1,y=-1,pic="头像.姬书术",description="",
event={ 
{ type="story",value="武林联盟.失败",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林试.失败" } } } } },

{ belongMap="武林联盟男休息处",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="武林联盟",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="武林联盟",name="抽签",x=-1,y=-1,pic="team:主角",description="",
event={ 
{ type="story",value="武林联盟.抽签",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.开始抽签" } } } } },

{ belongMap="武林联盟",name="正式比赛集会",x=-1,y=-1,pic="头像.张三丰",description="",
event={ 
{ type="story",value="武林联盟.集会",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.抽签" } } } } },

{ belongMap="武林联盟",name="比试场地 ",x=-1,y=-1,pic="team:主角",description="",
event={ 
{ type="story",value="武林联盟.二轮",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.二轮" } } },
{ type="story",value="武林联盟.三轮.相见",image="",description="",repeatTimes="once",probability=0,
condition={ 
{ type="HAS.TAG",value="武林联盟.三轮" } } } } },

{ belongMap="大地图",name="时光客栈",x=300,y=200,pic="",description="",
event={ 
{ type="map",value="时光客栈",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="时光客栈",name="松鼠仓库",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="松鼠仓库.首次",image="",description="",repeatTimes="once",probability=0,
condition={  } },
{ type="story",value="松鼠仓库.日常",image="",description="",repeatTimes="",probability=0,
condition={ 
{ type="HAS.TAG",value="松鼠仓库" } } } } },

{ belongMap="时光客栈",name="时光之书",x=-1,y=-1,pic="",description="",
event={ 
{ type="story",value="时光之书.不开放",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

{ belongMap="时光客栈",name="返回",x=-1,y=-1,pic="头像.返回",description="",
event={ 
{ type="map",value="大地图",image="",description="",repeatTimes="",probability=0,
condition={  } } } },

}
return mapEvent