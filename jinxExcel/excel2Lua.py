import sys
import io
import xlrd
import os
import time
import importlib
import parseHelper.RuleType as rt
import parseHelper.DataStruct as ds
import parseHelper.LuaType as lt
import re
import traceback
sys.stdout = io.TextIOWrapper(sys.stdout.buffer,encoding='utf-8')

inputPath=os.getcwd()+"/excel/"
outputPath=os.getcwd()+"/../gameDebug/src/resScripts/time1/"
defaultTaskPath="translateRule"


def buildQuery(sheet:xlrd.sheet.Sheet):
    query=list()
    for col in range(sheet.ncols):
        firstRowCell=sheet.cell(0,col)
        query.append(firstRowCell.value)
    return query

def needParse(buildTask:dict):
    targetfilePath=outputPath+buildTask.get("target")+".lua"
    if os.path.exists(targetfilePath)==False:
        return True
    targettime=os.path.getmtime(targetfilePath)
    for sourcefile in buildTask.get('source'):
        sourcetime=os.path.getmtime(inputPath+sourcefile)
        if sourcetime>targettime:
            return True
    return False
    
def parseTask(module):
    for buildTask in module.BUILD:
        if needParse(buildTask)==False:
            print("当前目标已经是最新的")
            continue       
        
        targetName=buildTask.get('target')        
        targetFileHandle=open(outputPath+targetName+".lua",'w',encoding="utf8")
        targetFileHandle.write("local "+targetName+"={\n")
        try:
            for source in buildTask.get("source"):    
                xlsfileHandle=xlrd.open_workbook(inputPath+source)
                for sheetTuple in buildTask.get("sheet"):
                    sheetName:str=sheetTuple[0]
                    rule:rt.BaseRule=sheetTuple[1]
                    sheet:xlrd.sheet.Sheet=xlsfileHandle.sheet_by_name(sheetName)
                    query=buildQuery(sheet)
                    parseStack=ds.Stack()
                    for row in range(1,sheet.nrows):
                        parseStack.push(lt.LuaTable())
                        for col in range(sheet.ncols):
                            subRule,level=rule.get(query[col])
                            parseStackSize=parseStack.size()
                            if level>parseStackSize:
                                for _ in range(parseStackSize,level):
                                    parseStack.push(lt.LuaTable(rule.getName()))
                                
                            elif level<parseStackSize:
                                parseStack.top().append(subRule.get('type')(sheet.cell(row,col).value,subRule))
                                for _ in range(level,parseStackSize):
                                    luaTable=parseStack.pop()
                                    parseStack.top().append(luaTable)
                                continue
                            
                            parseStack.top().append(subRule.get('type')(sheet.cell(row,col).value,subRule))
                            
                        targetFileHandle.write("{0},\n".format( parseStack.pop().serilize()))
        except Exception as e:
            print("文件转化异常",e)
            print("文件",targetFileHandle.name,"转化失败")
            msg = traceback.format_exc() 
            print (msg)
            
            filename=targetFileHandle.name
            try:
                targetFileHandle.close()
            finally:
                os.remove(filename)
            
            
        targetFileHandle.write("\n}\nreturn "+targetName)
        targetFileHandle.close()

def defaultTasks():
    pt=re.compile(r'(?P<modName>.+)\.py')
    s=time.process_time()

    try:
        for fileName in os.listdir(os.getcwd()+"/"+defaultTaskPath):
            mc=pt.match(fileName)
            if mc:
                modName=mc.group("modName")
                mod=importlib.import_module(defaultTaskPath+"."+modName)
                start=time.process_time()
                parseTask(mod)
                end=time.process_time()
                print("任务:"+modName+"解析成功","耗时",end-start,"s")            
    except Exception as e:
        print("发生异常：")
        print(e)

        input("按任意键关闭")
        exit(0)
    else:
        e=time.process_time()
        print("没有发生异常，解析总耗时",(e-s),"s")
        input("按任意键关闭")
        exit(0)
        

defaultTasks()