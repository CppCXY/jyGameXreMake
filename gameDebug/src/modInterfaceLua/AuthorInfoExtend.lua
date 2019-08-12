
_ENV=namespace "mod"
using_namespace "luaClass"
using_namespace "container"
--必须遵守的协议是，作者信息保留原作者和重制版作者以及游戏框架作者。
--如果你修改了游戏框架，你可以在游戏框架加上自己
--如果你删掉了demo剧情，重新开始写，你可以完全修改游戏设计，世界观设计，剧情设计。
--我写这么多栏目并不是我需要这些。我只是希望mod的制作如果是一个团体，他们的工作应该在这里有记录。
local authorInfo=
[[
    原作作者：汉家松鼠工作室

    重制版作者：菜鸡

    游戏框架：菜鸡

    脚本设计：菜鸡
    
    游戏设计：菜鸡

    世界观设计：菜鸡

    剧情设计：菜鸡

    友情参与：

    重庆邮电大学-小扎西
    重庆理工大学-待定

    最后：

    欢迎报考西南科技大学
]]

local musicInfo=
[[
    因为喜欢这些曲子，所以使用了他们的作品。
    这里列出使用过的音乐，以及相关演奏者，原作者。
    演奏的不一定是原作者，原作者也不一定完全正确。

    名称                   演奏       原作者
    天之痕（钢琴版）       群星        吴欣睿
    如忆玉儿曲            水玥儿       吴欣睿
    美丽拍档              胡伟立       胡伟立    
    昔影                 吴欣睿       吴欣睿     
    琵琶语               向小㐰(信)    林海
    只为你活一天         刘家昌        ————
    永恒的回忆           麦振鸿        麦振鸿      
    一生所爱             许明远        卢冠廷
    Stretching Lighthouse    Buckethead  ————
    魔剑斩妖            曾志豪          曾志豪
    月河河畔            曾志豪          曾志豪
]]




AuthorInfoArray=array()

AuthorInfoArray:push_back({key="作者们",info=authorInfo})
AuthorInfoArray:push_back({key="音乐查询",info=musicInfo})
