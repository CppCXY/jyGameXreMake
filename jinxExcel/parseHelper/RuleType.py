

import parseHelper.DataStruct as ds
import parseHelper.LuaType as lt
import parseHelper.Base as bs

class NoKeyFind(Exception):
    pass
class UnKownRule(Exception):
    pass


class BaseRule(bs.IGet):
    def __init__(self,rule:dict):
        self._rule=rule
        self._childs=list()
        self._levels=dict()
        self._nameQueue=ds.Queue()
        self.compile()
    def get(self,key:str,level=1):
        result:dict=self._rule.get(key)
        if result==None:
            for child in self._childs:
                result,newlevel=child.get(key,level+1)
                if result!=None :
                    childqueue:ds.Queue=child.getNameQueue()
                    while not childqueue.empty():
                        self._nameQueue.enqueue(childqueue.dequeue())
                    return result,newlevel
            else:
                return None,0

        else:
            return result,level
    def getName(self):
        return self._nameQueue.dequeue()
    def getNameQueue(self):
        return self._nameQueue

    def compile(self):
        for _,val in self._rule.items():
            if  isinstance(val,BaseRule):
                self._childs.append(val)
                val.compile()

    
class NormalRule(BaseRule):
    def __init__(self,rule:dict):
        super(NormalRule,self).__init__(rule)
    def get(self,key:str,level=1):
        result:dict=self._rule.get(key)
        if result==None:
            for child in self._childs:
                result,newlevel=child.get(key,level+1)
                if result!=None :
                    childqueue:ds.Queue=child.getNameQueue()
                    while not childqueue.empty():
                        self._nameQueue.enqueue(childqueue.dequeue())
                    return result,newlevel                    
            else:
                raise NoKeyFind("没有找到，这个key: "+key)
        else:
            return result,level



class ExtendRule(BaseRule):
    def __init__(self,fromIndex,toIndex,name:str,startKey:str,endKey:str,rule:dict):
        self._fromIndex=fromIndex
        self._toIndex=toIndex+1
        self._name=name
        self._endIndexDict=set()
        self._start=startKey.replace("[index]","1")
        self._end=endKey.replace("[index]",str(toIndex))
        for i in range(self._fromIndex,self._toIndex):
            self._endIndexDict.add(endKey.replace("[index]",str(i)))
        super(ExtendRule,self).__init__(rule)
        
    def get(self,key:str,level=1):
        level=level+1
        if key in self._endIndexDict:
            level=level-1
        if key==self._end:
            level=level-1
        if key==self._start:
            self._nameQueue.enqueue(self._name)
        return super(ExtendRule,self).get(key,level)
        
    def compile(self:BaseRule):
        newRule=dict()
        for key,val in self._rule.items():
            if isinstance(val,BaseRule):
                self._childs.append(val)
                val.compile()
            elif isinstance(val,dict):
                for i in range(self._fromIndex,self._toIndex):
                    newRule[key.replace("[index]",str(i))]=val
            else:
                raise UnKownRule("未知规则")

        self._rule=newRule

        


