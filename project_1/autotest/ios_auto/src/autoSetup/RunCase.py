# coding:utf-8
import os
import subprocess

import multiprocessing
import time
from autoSetup.config import suitepath

PROJECT_DIR = '/Users/stf/Downloads/autotest/case/iphone/2005'
CONFIG_DIR = PROJECT_DIR + '/config'
REPORT_DIR = PROJECT_DIR + '/report'
time1 = time.strftime("%Y-%m-%d_%H-%M-%S", time.localtime())

TAG1 = 'g1'
TAG2 = 'g2'
TAG_SMOKE = 'smoke'
CONIFG1 = 'iphone8plus'
CONIFG2 = 'iphoneXR'

# time1=str(int(time.time()))
report_dir = REPORT_DIR + '/' + time1 + '/'
var_file = CONFIG_DIR + '/'

class RunCases():
    def __init__(self,name):
        self.suitedir = suitepath
        self.devicename = name
        self.tag = ""
        self.varDir = suitepath + '/config/'+name+'.py'
        #self.varDir =""
        self.reportdir = "/Users/klyg/Downloads/iphone_2005/report/"
        self.bot= "robot"
        self.suites = []

    def addAttribute(self,attrs,arg):
        cmd = ''
        for attr in attrs:
            if len(attr)!=0:
                cmd +=' ' + arg + ' ' + attr
        return cmd

    def addsuite(self,suites):
        return self.addAttribute(suites,'-s')

    def addtag(self,tags):
        return self.addAttribute(tags,'-i')

    def addVar(self,varFiles):
        return self.addAttribute(varFiles,'-V')

    def command(self,suites,reportdir):
        varlist = []
        varlist.append(self.varDir)
        command = self.bot+ self.addVar(varlist) + self.addsuite(suites) + ' -d ' + reportdir +' '+ self.suitedir
        return command

    def exc(self,suites,reportdir):
        cmd= self.command(suites,reportdir)
        print('cmd1 start:' + cmd)
        subprocess.call(cmd, shell=True)



#def run():
    #cmd = mage_report(report_dir, report_dir + CONIFG1, report_dir + CONIFG2)
    #print(cmd)
    #os.system(cmd)

def mage_report(maindir, report1, report2):
    command = 'rebot --merge ' + ' -d ' + maindir + ' -o ' + maindir + 'output.xml' + ' ' + report1 + '/output.xml' + ' ' + report2 + '/output.xml'
    return command


if __name__ == '__main__':
    Name = ""
    Model = ""
    run = RunCases("8p")
    run.exc([])
    print(report_dir)
    # try:
    #     opts, args = getopt.getopt(sys.argv[1:],"hn:m:",["name=","model="])
    # except getopt.GetoptError:
    #     print('autorun.py -n <name> -m <model>')
    #     sys.exit(2)
    # for opt, arg in opts:
    #     if opt == '-h':
    #      print('autorun.py -n <name> -m <model>')
    #      sys.exit()
    #     elif opt in ("-n", "--name"):
    #      Name = arg
    #     elif opt in ("-m", "--model"):
    #      Model = arg
    #run()

    # worker_1 = multiprocessing.Process(target=worker3,args=("test1","test2"))
    # worker_1.start()

    # print(time1)
    # AppName='ImgoTV-ipad-AppStore.ipa'
    # time1=str(int(time.time()))
    # name=time1+AppName
    # str='curl http://172.28.211.134:8080/job/iPad-AdHoc/303/artifact/build/adHoc/ImgoTV-ipad-AppStore.ipa --user Guest:Guest -o ~/Desktop/app/1562233178ImgoTV-ipad-AppStore.ipa'
    # a=os.system(str)
    # a=Get_Job_Url('iPad-AdHoc',AppName)
    # b=Get_App_By_Url(a,name)
    # print(a)
    # assert 1==1 , 'not equal'
    # print(b)







