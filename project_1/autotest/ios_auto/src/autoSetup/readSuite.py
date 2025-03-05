# coding:utf-8
import sys
sys.path.append('../')
import json
from robot.api import TestData
from autoSetup.config import suitepath, platform, suiteurl, Version

import requests
from urllib.request import urlopen

class Testsuite():
    def __init__(self, dir):
        self.suitedir = dir
        self.suitename= ''
        self.suitedetails = []

    def setdir(self,dir):
        self.suitedir = dir
    def setname(self,name):
        self.suitename = name

    def addChild(self, testcase):
        self.suitedetails.append(testcase)

class readSuite():
    def __init__(self,source):
        self.source= source
        self.suites=[]
        self.testdata = TestData(source=source)
        self.dic=[]
        self.version =Version
        #self.version = self.testdata._get_basename()

    def addSuite(self):
        self.dic.append(self.testdata)
        while  self.dic:
            file = self.dic.pop(0)
            if not file.has_tests():
                break
            if file.children:
                for child in file.children:
                    self.dic.append(child)
            else:
                self.suites.append(self.readcase(file))

    def readcase(self,suite):
        testsuite = Testsuite(suite.source)
        testsuite.setname(suite.name)
        #print(suite.name)
        testsuite.setdir(suite.directory.replace(self.source,''))
        i = suite.testcase_table.__iter__()
        for case in i:
            # print (case.name)
            steps = []
            name = case.name
            for step in case.steps:
                # print(step.as_list(indent=True))
                steps.append('    '.join(step.as_list(indent=True)))
            content = '\n'.join(steps)
            # print(content)
            testcase = {}
            testcase['casename']= name
            testcase['casecontent']=content
            testsuite.addChild(testcase)
            # print(json.dumps(testsuite))
        return testsuite.__dict__


def run2():
    DIR = suitepath

    suite = readSuite(DIR)
    suite.addSuite()

    test_data = {}
    test_data['version'] = suite.version
    test_data['platform'] = platform
    test_data['data'] = suite.suites

    requrl = suiteurl
    aa = json.dumps(test_data)
    print(test_data)
    req = requests.post(requrl, data=aa)



if __name__ == '__main__':
    Name=""
    Model=""
    run2()