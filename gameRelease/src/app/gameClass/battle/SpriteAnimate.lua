LJ� 	 	 =  = = = = + = 6 )d B= = K  animation
queueactionQueueinAction	move
standdefendattackspritel   9   9B9  9B9  9B9  9BK  
stand	movedefendreleaseattack�   6   B X�9  95 ==BX
�9  95  9B==B9	   X�  9
 BL  doActioninAction  retain	nameaction  push_backactionQueuefunction	typeR   
-   + =  -     9  - 9B K   ��	namecheckActionQueueinAction�  ,+ =    9 B9  9B96  B X	� B+ =    9 9BX�9	  9
6 9 9 9B6 9	 93
 B A A2  �K   CallFuncreleasecreateSequenceccrunActionsprite	namecheckActionQueuefunction	typeactionpop_frontactionQueuestopStandinAction.   -     9   - B K   ��actionDone� 9   9B  X	�  9 B6 9 *  3 BX�  9 B2  �K  doAction spritedelayCalldoStand
emptyactionQueue����� 
 ;=  9= 9  9  X�) X�)��9 9"B= 6 9 9 9	'
 B A 6  B   X�  X� 6  B 6 9  B9  99 9B9  9 B 99 )	
 BK  addChildsetAnchorPointsetScaleYpcctonumber#
splitanchorPointunpackspriteAnimation
scaleanimationsetScaleXspritebattleFieldbattleSprite)     9    BK  runAction6   9   99 BK  
standrunActionsprite7   9   99 BK  
standstopActionsprite0     9  9 ' BK  attackrunAction0     9  9 ' BK  defendrunAction�  H9  999 X�99 X�K  99!)   X�9  99 9BX�99!)   X�9  99 9 B= 99B  9	 6
 9	 99
 6
 9 9 B A'	 B  X
� 9	6
 9	 9
  B AK  MoveToDelayTime	movecreate
SpawnccrunActionsetZOrder
scaleanimationsetScaleXspriteyxposbattleSprite�����.   -     9   B K  �removeFromParent�  26   9B9 9 B6 9 9B 99 B 9	 B 9
9B 96 9 96	 
	 9		B	
	 9		 B	6
 9


 9

3 B
 A A2  �K   CallFuncgetSkillAnimationAnimateManagerSequencerunAction
scalesetScalesetPositionbattleField
addTocreateSpriteccgetskillAnimationsQuerygetInstanceResScriptManager�  %36   ' B 7  6  ' B 6  ' B 6  ' B 4 6 + B>6	 9
' B ?  B 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# K   doEffect doMove doDefend doAttack stopStand doStand doCallBack 	bind checkActionQueue doAction runAction 
clear actionNameactionDoneSINGALCLASS_DEBUGSpriteAnimate
classcontainerluaClassusing_namespace	_ENV	gamenamespace���� 