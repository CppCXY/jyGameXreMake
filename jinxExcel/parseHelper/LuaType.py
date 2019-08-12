

import parseHelper.Base as bs
def toInt(val):
    try:
        return int(val)
    except:
        return 0
def toStr(val):
    try:
        return str(val)
    except:
        return ""

def toFloat(val):
    try:
        return float(val)
    except:
        return 0.0



class LuaType:
    def __init__(self,value:str,rule:bs.IGet):
        self._value=value
        self._rule=rule
    def serilize(self):
        pass
    def isEmpty(self):
        return self._value==""

class LuaInt(LuaType):
    def __init__(self,value,rule=None):
        super(LuaInt,self).__init__(value,rule)
    def serilize(self):
        if self._rule:
            return  self._rule.get('to')+"="+str(toInt(self._value))
        else:
            return str(toInt(self._value))
class LuaBool(LuaType):
    def __init__(self,value,rule):
        super(LuaBool,self).__init__(value,rule)
    def serilize(self):
        return  self._rule.get('to')+"="+("true" if self._value=="true" else "false")
class LuaIntOrStr(LuaType):
    def __init__(self,value,rule):
        super(LuaIntOrStr,self).__init__(value,rule)
    def serilize(self):
        value=None
        try:
            value=str(int(self._value))
        except:
            value= "\""+str(self._value)+"\""
        return  self._rule.get('to')+"="+value

class LuaStr(LuaType):
    def __init__(self,value,rule=None):
        super(LuaStr,self).__init__(value,rule)
    def serilize(self):
        if self._rule:
            return   self._rule.get('to')+"=\""+toStr(self._value)+"\""
        else:
            return "\""+toStr(self._value)+"\""
class LuaParseStr(LuaType):
    def __init__(self,value,rule):
        super(LuaParseStr,self).__init__(value,rule)
    def serilize(self):
        name:str=self._rule.get("to")
        rule:dict=self._rule.get("rule",None)
        splits:str=self._rule.get("split")
        splitList=list(splits)
        if len(splitList)==1:
            split1=splitList[0]
            base=LuaTable(name)

            for lineData in self._value.split(split1):
                base.append(LuaStr(lineData))
            return base.serilize()

        elif len(splitList)==2:
            split1,split2=splitList
            try:
                base=LuaTable(name)
                for lineData in self._value.split(split1):
                    lineTable=LuaTable()
                    colList=lineData.split(split2)
                    for i in  range(0,len(colList)):
                        subRule:dict=rule.get(i)
                        lineTable.append(subRule.get("type")(colList[i],subRule))
                    base.append(lineTable)
                return base.serilize()
            except:
                raise Exception(self._value)
        else:
            raise Exception("不支持两个以上split，因为一个表格写三维以上数据很不靠谱")
class LuaBlockStr(LuaType):
    def __init__(self,value,rule):
        super(LuaBlockStr,self).__init__(value,rule)
    def serilize(self):
        return   self._rule.get('to')+"=[=["+toStr(self._value)+"]=]"

class LuaDouble(LuaType):
    def __init__(self,value,rule=None):
        super(LuaDouble,self).__init__(value,rule)
    def serilize(self):
        if self._rule:
            return self._rule.get('to')+"="+str(toFloat(self._value))
        else:
            return str(toFloat(self._value))
    
class LuaTable(LuaType):
    def __init__(self,name=None):
        super(LuaTable,self).__init__(",",None)
        self._list=list()
        self._name= "" if name==None else (name+"=")
    def serilize(self):
        if self.isEmpty():
            return ""
        newList=[]
        for obj in self._list:
            if isinstance(obj,LuaTable) and obj.isEmpty():
                continue
            newList.append(obj.serilize())
        return  "\n{0}{{ {1} }}".format(self._name,self._value.join(newList))
    def append(self,value):
        self._list.append(value)
    def isEmpty(self):
        if self._name:
            return False
        for obj in self._list:
            if not obj.isEmpty():
                return False
        return True

