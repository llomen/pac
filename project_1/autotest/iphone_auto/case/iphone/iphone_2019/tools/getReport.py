#coding:utf-8
import json
import urllib2
import sys
import os
from pyh import *
from __builtin__ import dict
def GetMiddleStr(content,startStr,endStr):
  startIndex = content.index(startStr)
  if startIndex>=0:
    startIndex += len(startStr)
  endIndex = content.index(endStr)
  return content[startIndex:endIndex]

def GetResult(url):
    url='file:'+url
    response = urllib2.urlopen(url) 
    html = response.read()
    text1=GetMiddleStr(html,'["stats"]','window.output["baseMillis"]')
    result = GetMiddleStr(text1,'= [[',']];')
    result1=result.split('],[')
    list=eval(result1[2])
    return list

def OutReport(list,out):
    if os.path.exists(out):
        os.remove(out)
    page = PyH('TestReport')
    #page <<div(style="text-align:center")<< h4('TestReport')
    mytab = page << table(border="1",align="left",cellpadding="3",cellspacing="0",style="margin:auto")
    tr1 = mytab << tr(bgcolor="lightgrey")
    tr1 << th('TestSuite')+th('Pass')+th('Falied')
    if type(list)==dict:
        tr2 = mytab << tr()
        for j in range(1,4):
            tr2 << td(list.values()[j])
            if int(list.values()[3]) > 0:
                tr2.attributes['style']='color:red'
            if int(list.values()[3]) == 0:
                tr2.attributes['style']='color:green'
    else:
        for i in range(len(list)):
            tr2 = mytab << tr()
            for j in range(1,4):
                tr2 << td(list[i].values()[j])
                if int(list[i].values()[3]) > 0:
                    tr2.attributes['style']='color:red'
                if int(list[i].values()[3]) == 0:
                    tr2.attributes['style']='color:green'
    page.printOut(out)

OutReport(GetResult(sys.argv[1]),sys.argv[2])
    
