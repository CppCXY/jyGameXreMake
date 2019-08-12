local mission={

{ belongMissionPlace="大理.有间客栈.任务",missionName="找野兽皮",desc=[=[宁静村的老伯要为过冬准备一件衣服,他希望得到足够的兽皮]=],completeDesc=[=[找到足够兽皮了,快去宁静村找老伯吧]=],tag="任务.大理.找兽皮",
condition={ 
{ type="CHAPTER",value="俗世凡尘" } },limit=1,
need={ 
{ type="item",value="兽皮,3" } },
cost={ 
{ type="item",value="兽皮,3" } } },

{ belongMissionPlace="大理.有间客栈.任务",missionName="找银手镯",desc=[=[段王府的小孩丢了一个银手镯,希望你能给他一个银手镯]=],completeDesc=[=[找到了银手镯,去段王府找找小孩]=],tag="任务.大理.找手镯",
condition={ 
{ type="CHAPTER",value="俗世凡尘" } },limit=1,
need={ 
{ type="item",value="银手镯,1" } },
cost={ 
{ type="item",value="银手镯,1" } } },

{ belongMissionPlace="大理.有间客栈.任务",missionName="除恶虎",desc=[=[最近乱葬岗附近有恶虎伤人,希望你能除掉它]=],completeDesc=[=[已经除掉了恶虎快回客栈领取报酬吧]=],tag="任务.大理.除虎",
condition={ 
{ type="CHAPTER",value="俗世凡尘" } },limit=1,
need={ 
{ type="kill",value="乱葬岗恶虎,1" } },
cost={  } },

{ belongMissionPlace="大理.有间客栈.任务",missionName="三次元",desc=[=[这附近有两个友情客串的npc,请找到他们.]=],completeDesc=[=[已经找到了两个客串npc,快去客栈领取奖励吧]=],tag="任务.大理.三次元",
condition={ 
{ type="CHAPTER",value="俗世凡尘" } },limit=1,
need={ 
{ type="meet",value="待定" },
{ type="meet",value="扎西" } },
cost={  } },

{ belongMissionPlace="大理.有间客栈.任务",missionName="大战木头人",desc=[=[你太菜了,需要打败木头人]=],completeDesc=[=[已经打败了木头人,快去客栈领取奖励吧]=],tag="任务.大理.木头人",
condition={ 
{ type="CHAPTER",value="俗世凡尘" } },limit=1,
need={ 
{ type="kill",value="大理木头人,1" } },
cost={  } },

{ belongMissionPlace="大理.有间客栈.任务",missionName="完成以上所有任务",desc=[=[完成以上所有任务,将开启世界剧情]=],completeDesc=[=[任务已经完成,快回客栈吧.]=],tag="任务.大理.完成以上所有任务",
condition={ 
{ type="CHAPTER",value="俗世凡尘" } },limit=1,
need={ 
{ type="complete",value="大理.有间客栈.任务,找野兽皮" },
{ type="complete",value="大理.有间客栈.任务,找银手镯" },
{ type="complete",value="大理.有间客栈.任务,除恶虎" },
{ type="complete",value="大理.有间客栈.任务,三次元" } },
cost={  } },

}
return mission