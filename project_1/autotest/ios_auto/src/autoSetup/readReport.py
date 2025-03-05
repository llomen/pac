# coding:utf-8
import sys
sys.path.append('../')
import requests
import json
from robot.api import ExecutionResult
from robot.utils import elapsed_time_to_string

from autoSetup.config import reporturl, platform, Version, resulturl


class readReport():
    def __init__(self,source):
        self.source = source
        self.result = ExecutionResult(source)
        self.suites=[]
        self.tests=[]

    def addReport(self,time,udid):
        suite = self.result.suite
        if not suite :
            return None
        else :
            self.suites.append(suite)
        report={'version':Version,'platform':platform,'starttime':suite.starttime,'endtime':suite.endtime}
        report['elapsedtime'] = elapsed_time_to_string(suite.elapsedtime)
        list = [resulturl, Version, time, udid, 'report.html']
        report['reporturl']= '/'.join(list)
        result = suite.statistics.all.get_attributes()
        report.update(result)
        #report['suites']=[]
        while  self.suites:
            suites = self.suites.pop(0)
            if suites.suites:
                for child in suites.suites:
                    self.suites.append(child)
            if suites.tests:
                children = []

                case = {'suitename': suites.name, 'starttime': suites.starttime,'endtime':suites.endtime}
                case['elapsedtime'] = elapsed_time_to_string(suites.elapsedtime)
                case['dir']=suites.source.replace(suite.source, '')
                result = suites.statistics.all.get_attributes()
                case.update(result)

                for child in suites.tests:
                    c={}
                    c['name'] = child.name
                    c['status']=child.status
                    c['message']=child.message
                    children.append(c)
                case['cases']= children
                self.tests.append(case)
        report['suites'] = self.tests
        #print(report)
        return report

#def run2():
    # DIR = reportpath
    # report = readReport(DIR)
    # result = report.addReport()
    # requrl = reporturl
    # aa = json.dumps(result)
    # #req = requests.post(requrl, data=aa)
    # print(aa)

#if __name__ == '__main__':
    #run2()