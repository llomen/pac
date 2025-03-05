import sys
import os
import warnings
import datetime
#import urllib3
import subprocess
import http.cookiejar
#from pprint import pprint
import urllib
from urllib.request import HTTPPasswordMgrWithDefaultRealm, HTTPBasicAuthHandler, build_opener
from urllib.request import urlretrieve
import requests
import datetime, time
from jenkinsapi.jenkins import *
from jenkinsapi.job import *
from jenkinsapi.build import Build
from jenkinsapi.custom_exceptions import UnknownJob
sys.path.append('../')
from at_devices.iOS_remote import AtxiOS
#import psutil
JENKINS_URL='http://172.28.211.134:8080/'
JENKINS_USER='Guest'
JENKINS_PWD='Guest'
AppName='MGTV-iPhone-appstore.ipa'
JobName='iPhone-AdHoc'
#jobname,packagename,
class Jenkinsool():
    def __init__(self):
        self.jenkins_url=JENKINS_URL
        self.jenkins_user=JENKINS_USER
        self.jenkins_pwd=JENKINS_PWD
        self.jobname=JobName
        self.appname=AppName

    def Get_Job_Url(self,build_num=0):
        jenkins = Jenkins(self.jenkins_url, self.jenkins_user, self.jenkins_pwd)
        try:
            my_job=jenkins.get_job(self.jobname)

            build=my_job.get_last_stable_build()
            if build_num != 0 :
                build=my_job.get_build(build_num)

            url=build.get_build_url()
            print("url"+url+'\n')
            httpurl=url+'artifact/build/adHoc/'+self.appname
            return httpurl
 
        except UnknownJob as unjob:
            print(unjob)
        except NotFound as notfound:
            print(notfound)
        return None

    def Get_App_By_Url(self):
            #str = "curl " +url+ " --user {}:{} -o ".format(self.jenkins_user,self.jenkins_pwd)+path+self.appname
            #return os.system(str)
            str = "curl http://ugc.hitv.com/platform_oss/1588165108787/MGTV-iPhone-appstore.ipa" +" -o ~/Desktop/ImgoTV-ipad-AppStore.ipa"
            with os.popen(str) as stdout:
                result = stdout.read()
            print(str)

    def Down_Ios_App(self,url):
        local = os.path.join('~/Downloads/',self.appname)
        print(local)
        print('开始下载iOS App...')
        
      
        # 下载图片

        username = JENKINS_USER
        password = JENKINS_PWD
        url1 = JENKINS_URL
        p = HTTPPasswordMgrWithDefaultRealm()            
        p.add_password(None, url, username, password)    
        auth_handler = HTTPBasicAuthHandler(p)   
        opener = build_opener(auth_handler)              
        response = opener.open(url)                      
        #with open('MGTV-iPhone-appstore.ipa', 'wb') as fp:
            # 写入的文件是响应的二进制读取内容
        #    fp.write(content.read())
        print('iOS App 下载完成')

    
if __name__ == '__main__':
    AppName='MGTV-iPhone-appstore.ipa'
    test = Jenkinsool()
    test.Get_App_By_Url()

    str="ps -e | grep appium |  awk '{print $1 $4 $5}'"
    (test1,test2)=subprocess.getstatusoutput(str)
    print(test1)
    print("test111111\n")

    str2= test2.split("\n")
    print(len(str2))
    for test in range(len(str2)):
         print(str2[test])
    #jenkins=Jenkins_tool()
    #print("auto bulid:")
    #url=jenkins.Get_Job_Url()
    #print("point bulid:")

    #jenkins.Get_App_By_Url(url,"~/Downloads/")
    #jenkins.Down_Ios_App(url)
    #time1=str(int(time.time()))
    #name=time1+AppName
    #str='curl http://172.28.211.134:8080/job/iPad-AdHoc/303/artifact/build/adHoc/ImgoTV-ipad-AppStore.ipa --user Guest:Guest -o ~/Desktop/app/1562233178ImgoTV-ipad-AppStore.ipa'
    #a=os.system(str)
    #a=Get_Job_Url('iPhone-AdHoc',AppName)
    #print(a)
    

    #b=Get_App_By_Url(a,name)
    #print(a)
    #print(b)

    





