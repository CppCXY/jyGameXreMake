LJ� 
 ( `  9  B    9 B+  6  B X�6  9B9 9 B   X�6 '	  &BX�6  B
 X� + = = = 6 99= 6  9B999 9' &= +  = +  = 6 99= 6 99= 6 B= 6 B=  6 99!6#  9 9 9	 B="   9% B=$   9& B  9' 9 BK  setBackGroundregisterNodeEventcreateBattleSpriteMatbattleSpriteMatBattleFieldManagerfieldManagerbattleFieldBeginPointspriteArray
arrayselectNodeblockYyBlockNumblockXxBlockNumtimeLabelbackGround	.jpgmapkeybattleBg	root	PathbackPathedgeLenBattleFieldExtendmodblockEdgeLengthbattlecontroller	auto
table&error :not find battle battleKey 
errorgetbattlesQuerygetInstanceResScriptManagerstring	typeLUIObject__superV     X�X	�  X�6 ' B-   9BK   �destroy
print	exit
enter:  3    9  B2  �K  registerScriptHandler �   9   9BX�9 9BER�6  9B 9BK  clearSkillAnimationgetInstanceAnimateManager
clearspriteAnimation	iterspriteArray� a-   9 9 B+ )�  X�-   99 B 9 B  X� 9B-  9' 9	 '
 -   9	B'
 - &BX:�-   9	B-  X�-  9' BK  6 ' ) 6	 9		B 9)	 )
  B 9
 9	B	9		)
  B 9	 
 B 9	 B-   99	 
  B-  9'	 9
 '  '
 - &		BK  ���当前选中insertsetTag
addTo
widthgetContentSizesetPositionsetAnchorPointREDcc选中createLabel不能再选了 / 	size 已选 	name当前取消showTipsremoveFromParentgetChildByTagdelkeyget�  7-     9   B 	   X �-    9  ' B K  -  9  9    9  ' B 6   BH� X�-   9	 B  X	�-  9'
 	 '
 &
BK  FR�-  9B-  9-  - - BK  �� ���initBattleremove 不能开始战斗当前未选 has
pairs#
split	mustbattle&还没选人，不能开始战斗showTips	size � %�6  B6  B 99 B 9  )d B6 B6 B)  6 9 9BH
�) =	9
 X�  9 BX� 9 BF
R
�6 9 9BH
�) =	9
  X�9
 X� 9 BF
R
�6 9 9BH
�) =	9  X�9 X� 9 BF
R
�6 B6 9	 9		BH� 9 BFR�= 	 9B6	  9
B
'   3 B	9	 9			 X
�6
 
 9

B
9


 9

	 B
 
 X�6  9B 99
B 9
' B
 9
'  9 9!&B
6
 5" B
6 B 93# B 9$
  B2  �K  setMenu   进入战斗	must<请选择角色参与战斗，当前必须参与角色 showTitleshowTips
valueplayMusic
AudiogetresourcesQuerygetInstanceResScriptManager
music elemTouchedgetMatconnect	size
drops	namerandom_rolesyour_rolespush_backkey	teamour_rolesbattle
pairs
array
addTobackPathsetBackGroundRoleUImapv 	    9  B  9    B  9 B  9 BK  updateSpriteMatonControllerinitSpriteinitUI/   9   9  BK  	bindcontrollers 9 	  X�-  9  X� 96 99BX� 9+  BK    
runAIAImod
setAI	auto	team� 	 -   -  9  =  -   9  9    9  3 B -    9  -  9   X�6 9  X�6 9B K   ��
WHITEREDccsetColor for_eachspriteArraycontroller	auto�
 C6  9 9B 9B  9 B 9  ) B= 6 ' )( 6  9	B 9
) ) B3 6  9 9B6  9 9 B 9 B 9 B 99 9		 	B 9
) )	 B 9  )	
 B2  �K  height
widthsetPositionaddChildregisterScriptTapHandlerMenuItemLabelcreate	Menu setAnchorPoint
WHITE自动createLabel
addTocreateTimeLabeltimeLabelgetVisibleSizegetInstanceDirectorccx�  �6  B)  9BX	� 9
 BE	R	� 9 BX	8�9  X�+ X�+ 6 999B9	 X�) X�9=9	 X�) X�9=6	  9
  
  9  B 9  ) B 99 9 999B A9  9 B E	R	� 9BX	;�6 9
B9
  X�+ X�+ 6 99
9
B9	 X�) X�9=9	 X�) X�9=6	  9
    9
  B 9  ) B 99 9 999B A9  9 B E	R	�K  key	RolespriteArrayatmatfieldManagersetPosition
addTo	teamcreateBattleSpriteyxpcc	facezippush_back	iter
array /   6  9 9 D yBlockNumxBlockNummatM  
9 -  9 999 BK   �yxsetbattleSpriteMatposn  9   9B9 9 93 B2  �K   for_eachspriteArraycontroller
clearbattleSpriteMat[     X�6  9  B 9  999D yxatbattleSpriteMatpcc�  )  6  9 6 ' ) B 96  9B 9  BL setPositionLEFT_TOPsetAnchorPoint时间 0/0createLabelcydisplay3   9   9 BK  setStringtimeLabel� 6  -  9 - B-  9 B-  999B 9 B 9-  ) BK      �
addTosetPositionyxatpush_backblockEdgeLengthcreateOctagon����̙��� -  9 9-  9-  999- -  B 93 B2  �K   ����� for_eachposcurrentSpritecontrollergetCoverArraymatfieldManager     K  (    9 BK  removeFromParent_ -   9 3 B-   9B  X�- - - BK  ����
clear for_eachV  6  B3 3	 3
 6   	 
 + B2  �K  onNodeTouchIn   
array!    -   - - B K   ���/6  -  9 - B-  9 9 B-  999B 9 B 9-  )
 B-   X�-   9	 -  	 -
 - BX�6
  3 B2  �K   ������ onNodeTouchsetCover
addTosetPositionyxatpush_backselectNodeblockEdgeLengthcreateOctagon����̙���   9  B9 96 9)  )  )	  *
  B 93	 B2  �K   for_eachc4fccmatfieldManagerclearSelectNode�̙����(    9 BK  removeFromParentp  9   9B  X�2 
�9   93 B9   9BK  K  
clear for_each
emptyselectNodeo   9 9  X�9 )  X�99  X�9)  X�+ X�+ L yBlockNumyxBlockNumxi   9  9 9BX�99 X�+ L ER�K  	name	role	iterspriteArraycontroller;   9   96  B C tonumberatspriteArrayH   
9    X�9   9B+  =  K  removeFromParentdisplay)   -     9   B K   �clearDetail�	  T  9  B6 96 96 9B6  B 9)d )d B 9	)  )  B 9
  )�B= 6 B 9 B 9)  )  B 9
9 B6 ' ) 6 9B 9	) ) B 999B 9
9 B6  3 B6  9B) B 99B 9 B2  �K  setInnerNodesetWidthtoString onNodeTouchheight
widthRED返回createLabelsetContentSizeScrollView
addTosetAnchorPointsetPositioncreateBlockdetailcycxdisplay	sizeccclearDetailG   
9    X�9   9B+  =  K  removeFromParentdetail�  ?6   9    9  -  9B 6   - B 96  9- -  	 X�)  X�- B A6 -  9) 6  9	B 9
* * B 9- B 9)  -  	 X�-    X�)  B 9 )d B-  =L �  �  
skill
addTosetWidthsetAnchorPointRED	namecreateLabelpsetPositiongetHexClippicPathcreateSpritecc��������6 -   9 3 B2  �K  ���� push_back2   -     9   - B K   �showDetailInfo�#w 9 )
 B  Xp�96 9 99B6  -   B- 9 9 -	 B  X�	 9B+  . 	 9	B
 9	
* * B	
 9	99B	
 9	- B	
 9	 - B	6	 
 3 B	-	 
	 9		 B	6
 9

9

	
 X
�-
 
 9

 - B
X
)�-
 
 9

B
'
 6 99	 X�'
 X�6 99	 X�'
 X�6 99	 X�'
 X�6 99	 X�'
   96! 
 ) 6 9"B A2 �K  � �	���REDcreateLabel封印BANCD不可用NOT_AVALIBLE内力不足MP_NOT_ENOUGH怒气不足BALL_NOT_ENOUGHclearSelectNodeshowAttackBlockAVALIBLESKILL_STATUS	ENUMcheckSkillStatus onNodeTouchaddChildsetTagheight
widthsetPositionsetAnchorPointgetContentSizeremoveFromParentcurrentgetHexClippicPathcreateSpritecc
skillgetChildByTag�̙�������������̙��� a  9  B6 9 9B 9  )d B=  9B+  9  6 B6	 9
)	 *
  B"	 93
 B6 6	 9		6
 9



B	6
 9

B	 9)
� )  B	 9
 B	 96
 9

B
 A	 99
 )d B
 9	B	)	�6
  '  3 B
6
 B

 9

)  )  B

 9

)  )  B

 9

9 B
=
 2  �K  setAnchorPointcreateHexagoncurrent cellTouchedconnectreloadDatasetCellSizesetCreateArraysetPosition$SCROLLVIEW_DIRECTION_HORIZONTALcx	sizeTableView for_eachpow	math
arrayblockEdgeLengthgetSkills
addTocreate	NodeccdisplayclearDisplay���������̙������     9  B  9 B  9 B  9 B  9 B9  9BK  	nextcontrollerupdateSpriteMatclearDetailclearMenuclearDisplayclearSelectNode�  ?6   9    9  -  9B 6   - B 96  9- -  	 X�)  X�- B A6 -  9) 6  9	B 9
* * B 9- B 9)  -  	 X�-    X�)  B 9 )d B-  =L �  �  	item
addTosetWidthsetAnchorPoint	BLUE	namecreateLabelpsetPositiongetHexClippicPathcreateSpritecc��������6 -   9 3 B2  �K  ���� push_back2   -     9   - B K   �showDetailInfo�P 9 )
 B  XI�96 9 99B6  -   B- 99  X�9 9	B+  = 9
B	 9*
 * B	 99


9B	 9
 )d B=6 9	3
 B- 9	 X�- 	 9
 - BX�- 	 9B	 96
 ' ) 6 9B
 A2 �K  � ��	BLUECd不可用createLabelclearSelectNodeshowItemBlockcd onNodeTouchaddChildheight
widthsetPositionsetAnchorPointgetContentSizeremoveFromParentchildNodecurrentgetHexClippicPathcreateSpritecc	itemgetChildByTag�̙�������������̙�� � e  9  B6 9 9B 9  B= 6  9B 96	 5
 B A+  9  6 B6 9)	 *
  B"	 93
 B6 6	 9		6
 9



B	6
 9

B
 9	 B	
	 9		6 9B A	
	 9		)� )  B	
	 9		9 B	
	 9		B	6	 
 '  3 B	6	 
B	
	 9		)  )  B	
	 9		)  )  B	
	 9		9 B	=	 2  �K  setAnchorPointcreateHexagoncurrent cellTouchedconnectreloadDatasetPositionsetCellSizesetCreateArray$SCROLLVIEW_DIRECTION_HORIZONTALcx	sizeTableView for_eachpow	math
arrayblockEdgeLength   setgetItemsByTypegetInstanceRuntimeData
addTocreate	NodeccdisplayclearDisplay���������̙������ 	 %6  B-   9- 999 - B 9BX�- 	 9
 B  X	�
 9	 B	ER�-  9-  -  BK  � ��useItemedpush_backgetSprite	iterposcurrentSpritecontrollergetCoverArray
array� 	&6  9)  )  ) *  B6 B 9 B 9BX	
�  9 
 B  X� 9
 BE	R	�  9  	 
 3 B2  �K   setBlockpush_backinBattleField	itergetCastArray
arrayc4fcc�̙����     K  .   -     9   B K  �removeFromParent�
  >6  B9 9 9BX� 99	BER�6 9 9B 9	  )'B6
  3 + B6  B 9	 )�B 9+ B6  '  ' B6  5 B6  4 3 >B 9 	 B2  �K  setMenu   返回showRoleDetailroleBlockTouchedconnectsetNotAlterRoleUI onNodeTouch
addTocreate
Layercc	rolepush_back	iterspriteArraycontroller
array5     9   B  9 BK  toNextrestedf  -   9 -  B-  + =-   9BK   ��clearSelectNode_disableMove
moved� 	%6  9*  *  )  * B6 B 9B 9BX
�  9
 	 B
 
 X� 9
	 B
ER�  9  +  	 3
 B2  �K   setBlockpush_backinBattleField	itergetMoveArray
arrayc4fcc������̙����� 	 %6  B-   9- 999 - B 9BX�- 	 9
 B  X	�
 9	 B	ER�-  9-  -  BK  � ��attackedpush_backgetSprite	iterposcurrentSpritecontrollergetCoverArray
array� 	&6  9*  * * * B6 B 9 B 9BX	
�  9 
 B  X� 9
 BE	R	�  9  	 
 3 B2  �K   setBlockpush_backinBattleField	itergetCastArray
arrayc4fcc͙���̙���̙�����̙����I   
-   9     X �-     9  - B K   ��showMove_disableMove-   -     9   - B K   ��showSkill,   -     9   - B K   ��showItem*   -     9   - B K   ��doRest*   -     9   B K   �showProperty�	 $�  9  B+ = )( 6 9)  )  )  *  B6 9) * B"6 9B6 9 99		9	
	B 9*	 *
 B 96	 9				6
 9



B 9	 B 9	  B= 6 	 
 B	 99


 

9 B	 96
 ' ) B

 9

  B
 A	 9
 B6	 
  B	
	 9		9 9!B	
	 9		6 ' ) B 9  B A	
	 9		 B	6
   B

 9

99 B

 9

6 ' ) B 9  B A

 9

 B
6   B 99!9!B 96 ' ) B 9  B A 9 B6   B 999!B 96 ' ) B 9  B A 9 B6  3 B6  3 B6 
 3  B6 	 3! B6  3" B  9#  B2  �K  showSkill     onNodeTouch信息移动物品休息技能createLabeladdChildheight
widthcreateHexagon	menu
addTosetContentSizecycxdisplaysetPositionsetAnchorPointpicPath	rolecreateSprite	sizepow	mathc4fcc_disableMoveclearMenu�̙�����������������̙����� E   
9    X�9   9B+  =  K  removeFromParent	menuL    	6   9    9  B   9  B K  popScenegetInstanceDirectorcc� ?�)  )  )  )  )  9   9BX
�9	  X�99 99 X�99 9 9BE
R
�##!) )	  	 X	�	 				"	X	�			)
  
	 X	�			 	 X
�)	  "	"+	  6
 
 9

B
9
	
6
 99
 X
�6
 
 9

B
=	
'
 6
 99 XS�'	 9  9BXJ�6 9B  XD�6 9 9' B A   X(�6  9B9 9 B 9B 96 )  B A96 99B6  9B 9   B
  '!  '" &
X�6 99B6  9B 9 9 B
 9'!  '" &
ER�X�'	# )  	 
 &	9   9BX�9  X�9=$	 9 9%B&	9 9&B9 X�6  9B 9'6
 9(9)99BER�  9* B6+ 96, 9-6, 9.B60  B 916, 9-6, 9.B 92)  )  B 93  )�)�B=/ 64 B 95 B 91)  )  B 939/ B66 '7 ) 6+ 98B 92) ) B 91999:B 939/ B6;  3< B66 	 ) B 9=99B 9> BK  setInnerNodesetWidth onNodeTouchheight
widthRED确定createLabelsetContentSizeScrollView
addTosetAnchorPointsetPositioncreateBlockdetailcycxdisplayccclearDetailKILL_ROLERUNTIME_EVENTsendEventonResulttoStringexp失败：
	个
 addItemByNameto	from	namerandIntat	sizegetitemsDropQueryResScriptManagerlv(%d)
matchkeytonumber	probprobability
drops胜利: 
WIN获得物品:
	WAITBATTLE_RESULT_STATUS	ENUMbattleResultStatusgetInstanceRuntimeDatacalculatestatistics
level	role	team	iterspriteArray
������	  U�6   ' B 7  6  ' B 6  ' B 6  ' B 6  ' B 6  '	 B 4 6
 + B>6 6 9B>6 6 B>6 9B>6 9B>6 9B>6 9B ?  B 6 	 3 =	 6 	 3 = 6 	 3 = 6 	 3 = 6 	 3 = 6 	 3 = 6 	 3  = 6 	 3" =! 6 	 3$ =# 6 	 3& =% 6 	 3( =' 6 	 3* =) 6 	 3, =+ 6 	 3. =- 6 	 30 =/ 6 	 32 =1 6 	 34 =3 6 	 36 =5 6 	 38 =7 6 	 3: =9 6 	 3< =; 6 	 3> == 6 	 3@ =? 6 	 3B =A 6 	 3D =C 6 	 3F =E 6 	 3H =G 6 	 3J =I 6 	 3L =K 6 	 3N =M 6 	 3P =O 6 	 3R =Q 6 	 3T =S 6 	 2  �L   showEnd clearMenu showMenu showAttackBlock showMove doRest showProperty showItemBlock showItem toNext showSkill clearDetail showDetailInfo clearDisplay findIdentifier nameInBattleField inBattleField clearSelectNode setBlock setCover setTimeString createTimeLabel getSprite updateSpriteMat createBattleSpriteMat initSprite initUI onController initBattle showRoleSelect destroy registerNodeEvent useItemed
movedattackedrestedSINGALLUIObject
Scenecc
superCLASS_DEBUGBattleScene
classui	gamecontainerluaClassusing_namespace	_ENV
viewsnamespace���� 