# coding:utf-8
import multiprocessing
import os
import sys
import time

import requests

sys.path.append('../')
sys.path.append('./phones/')
from autoSetup.RunCase import RunCases

import json

from autoSetup.config import suitepath, platform, suiteurl, Version, reportdir, reporturl
from autoSetup.readReport import readReport
from autoSetup.readSuite import readSuite
from autoSetup.getTsApp import AppManager
from autoSetup.installApp import AppOpt


def UpdateCases():
    DIR = suitepath

    suite = readSuite(DIR)
    suite.addSuite()

    test_data = {}
    test_data['version'] = Version
    test_data['platform'] = platform
    test_data['data'] = suite.suites

    requrl = suiteurl
    aa = json.dumps(test_data)
    print("_____start update case ________")
    response=requests.post(requrl, data=aa)
    print(response)
    print("_____update case over________")


def UpdateResults(dir,time,udid):

    report = readReport(dir)
    result = report.addReport(time,udid)
    requrl = reporturl
    aa = json.dumps(result)
    print("_____start update result ________")
    response = requests.post(requrl, data=aa)
    print(response)
    print("_____update result over________")

def DownloadApp(shortLink):
    TM = AppManager()
    if shortLink != "":
        TM.setshortLink(shortLink)
    url = TM.getappurl()
    TM.DownloadApp(url)

def InstallAndRun(udid,suites,time1):
    report_dir = reportdir + '/' + Version + '/' + time1 + '/'
    dir = report_dir + udid + '/'
    op =  AppOpt()
    if not op.install(udid):
        return
    run  = RunCases(udid)
    run.exc(suites,dir)
    dir = dir + 'output.xml'
    print("updateresult:"+dir)
    UpdateResults(dir,time1,udid)


def mage_report(maindir, report1, report2):
    command = 'rebot --merge ' + ' -d ' + maindir + ' -o ' + maindir + 'output.xml' + ' ' + report1 + '/output.xml' + ' ' + report2 + '/output.xml'
    return command


#devices = [{"name":"","udid":""}]
def run(shortLink,devices,suites):
    if devices is None or len(devices) == 0:
        return

    updateCase = multiprocessing.Process(target= UpdateCases)
    downloadApp =  multiprocessing.Process(target= DownloadApp,args=(shortLink,))

    updateCase.start()
    downloadApp.start()
    updateCase.join()
    downloadApp.join()

    time1 = time.strftime("%Y-%m-%d_%H-%M-%S", time.localtime())
    report_dir = reportdir + '/' + Version + '/' + time1 + '/'



    list = []
    for device in devices:
        dir = report_dir + device + '/'
        print("dir:",dir)
        p = multiprocessing.Process( target=InstallAndRun, args=(device,suites,time1))
        list.append(p)
    print(len(list))
    for p in list:
        p.start()
    for p in list:
        p.join()

if __name__ == '__main__':
    shortLink ="adhoc"
    uuid1 = '3a48b102de42ae32091c8b0a8150c4c259cf9349'
    uuid2 = '00008020-001139E82292002E'
    devices=[uuid1]
    suites = ["02推荐词搜索","05明星饭团"]
    #suites =[]
        #UpdateCases()
       # DownloadApp(shortLink)
   # op = AppOpt()
    #op.install(uuid1)
    downurl = os.getenv("DownloadUrl")
    if downurl is not None:
        shortLink = downurl
        devices = os.getenv("DeviceIds").split(',')
        suites = os.getenv("SuiteNames").split(',')

    print(shortLink)
    print(devices)
    print(suites)
    run(shortLink,devices,suites)
