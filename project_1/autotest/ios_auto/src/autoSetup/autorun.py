# coding:utf-8

import os
import subprocess

import multiprocessing
import  time

PROJECT_DIR='/Users/stf/Downloads/autotest/case/iphone/2005'
CONFIG_DIR=PROJECT_DIR+'/config'
REPORT_DIR=PROJECT_DIR+'/report'
TAG1='g1'
TAG2='g2'
TAG_SMOKE='smoke'
CONIFG1='iphone8plus'
CONIFG2='iphoneXR'
time1=time.strftime("%Y-%m-%d_%H:%M:%S", time.localtime()) 
#time1=str(int(time.time()))
report_dir= REPORT_DIR+'/'+time1+'/'
var_file= CONFIG_DIR+'/'


def run():

    worker_1 = multiprocessing.Process(name='worker 1',target=worker1)
    worker_2 = multiprocessing.Process(name='worker 2',target=worker2) 

    worker_1.start()
    worker_2.start()
    worker_1.join()
    worker_2.join()
    cmd=mage_report(report_dir,report_dir+CONIFG1,report_dir+CONIFG2)
    print(cmd)
    os.system(cmd)

def command(main_url,tag,var_file,report_url):
    command = 'pybot -V ' +var_file+ ' -d '+report_url +' -i ' +tag +' '+' '+main_url
    return command

def mage_report(maindir,report1,report2):
    command = 'rebot --merge '+ ' -d '+maindir+ ' -o ' +maindir+'output.xml'+' '+report1+'/output.xml' +' '+report2+'/output.xml'
    return command

def worker1():
    cmd1=command(PROJECT_DIR,TAG1,var_file+CONIFG1+'.py',report_dir+CONIFG1)

    print('cmd1 start:'+cmd1)
    subprocess.call(cmd1,shell=True)

def worker2():
    cmd2=command(PROJECT_DIR,TAG2,var_file+CONIFG2+'.py',report_dir+CONIFG2)
    
    #cmd2=command(PROJECT_DIR,TAG2,var_file+CONIFG2+'.py',report_dir)
    print('cmd2 start:'+cmd2)
    subprocess.call(cmd2,shell=True)

def worker3(name,model):
    cmd1=command(PROJECT_DIR,TAG1,var_file+CONIFG1+'.py',report_dir+CONIFG1)
    
    #cmd1=command(PROJECT_DIR,TAG1,var_file+CONIFG1+'.py',report_dir)
    print('cmd1 start:'+cmd1)
    subprocess.call(cmd1,shell=True)

if __name__ == '__main__':
    Name=""
    Model=""
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
    run()

    
    #worker_1 = multiprocessing.Process(target=worker3,args=("test1","test2"))
    #worker_1.start()

    
    #print(time1)
    #AppName='ImgoTV-ipad-AppStore.ipa'
    #time1=str(int(time.time()))
    #name=time1+AppName
    #str='curl http://172.28.211.134:8080/job/iPad-AdHoc/303/artifact/build/adHoc/ImgoTV-ipad-AppStore.ipa --user Guest:Guest -o ~/Desktop/app/1562233178ImgoTV-ipad-AppStore.ipa'
    #a=os.system(str)
    #a=Get_Job_Url('iPad-AdHoc',AppName)
    #b=Get_App_By_Url(a,name)
    #print(a)
    #assert 1==1 , 'not equal'
    #print(b)

    





