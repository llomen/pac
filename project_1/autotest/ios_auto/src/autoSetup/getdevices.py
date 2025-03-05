# coding:utf-8
import sys
sys.path.append('../')
from at_devices.iOS_remote import AtxiOS
import os
from pprint import pprint
import requests
import datetime, time
from jenkinsapi.jenkins import *
from jenkinsapi.job import *
from jenkinsapi.build import Build
class DeviceManager():
    def __init__(self):
        self.STF_URL ='http://172.28.122.23:4000'
        self.Token='f2f20eabe8b840c1912d9b8488d6885f'
        self.udid='3a48b102de42ae32091c8b0a8150c4c259cf9349'  #iphone8p
        self.atx=AtxiOS(self.STF_URL,self.Token)

    def get_all_device(self):
        devices=self.atx.get_all_iOS_devices()
        #pprint(devices)

    def get_device_by_udid(self,udid):
        device=self.atx.get_iOS_device_by_udid(udid)
        #return device['device']['source']['wdaUrl']
    def install_iOS_app(self,udid,url):
        self.atx.install_iOS_app(udid,url)

    #def Url_Get_Job_List(self,url=‘jenkins address’, username=‘username’, password=‘pwd’):
        #jenkins = Jenkins(url, username, password)
        #count = 0
        #for job_name in jenkins.keys():
        #my_job = jenkins.get_job(job_name)
        #count = count + 1
        #print “Job” + str(count) + " : "+job_name
        #print job_name

    def test(self):
        string='pybot --argumentfile /var/folders/8p/g4f7_fj14b984966vzg2s2dc0000gn/T/RIDERwn1B_.d/argfile.txt --listener /Library/Python/2.7/site-packages/robotide/contrib/testrunner/TestRunnerAgent.py:52028:False /Users/klyg/Downloads/autotest/iphone_auto/case/iphone/iphone_inter'
        with os.popen(string) as stdout:
            result = stdout.read()
#print(result)

if __name__ == '__main__':
    udid='3a48b102de42ae32091c8b0a8150c4c259cf9349'
    udid2='00008020-001139E82292002E'
    url='http://ugc.hitv.com/platform_oss/1588165108787/MGTV-iPhone-appstore.ipa'
    dm=DeviceManager()
    dm.get_all_device()
    #dm.get_device_by_udid(udid2)
    #dm.install_iOS_app(udid2,url)
    #print(result['device']['source']['wdaUrl'])
    #dm.test()

    





