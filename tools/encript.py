import sys
import os

inputPath="../gameDebug/src/"
outPath="../gameRelease/src/"

def isLua(fileName):
    return fileName.find(".lua")!=-1

def dumpEncriptLua(dirName):
    files=os.listdir(inputPath+dirName)
    for fileName in files:
        fileNameIn=inputPath+dirName+"/"+fileName
        if os.path.isdir(fileNameIn):
            dumpEncriptLua( dirName+"/"+fileName)
        elif isLua(fileName):
            outdir=outPath+dirName
            fileNameOut=outdir+"/"+fileName
            if os.path.exists(outdir) is False:
                os.makedirs(outdir)
            os.system("luajit-win32 -b "+fileNameIn+" "+fileNameOut)
        else:
            print(fileName,"未知文件，忽略")

try:
    print("加密中")
    dumpEncriptLua("")
    print("加密完成")
finally:
    input("按任意键退出:")
