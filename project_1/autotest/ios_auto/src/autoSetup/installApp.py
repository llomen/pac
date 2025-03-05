# coding:utf-8
import json
import os
import urllib.parse
import urllib.request
from autoSetup.utils import Utils
from autoSetup.config import filepath, bundleid


class AppOpt():
    def __init__(self):
        self.savepath= filepath
        self.bundleid = bundleid


    def deviceExist(self,udid=""):
        str = "ios-deploy -c"
        result = Utils().exeLocalcmd(str)

        if  result.find("Found")==-1:
            print("can't find any devices")
            return False
        if udid.strip() and result.find(udid) ==-1 :
            print("can't find device --" +udid)
            return False
        return True


    def uninstall(self,udid = ""):
        isExist = self.deviceExist(udid)
        if not isExist:
            return
        str = "ios-deploy -9 -1 " + bundleid
        if udid:
            str = str +" -i " + udid
        Utils().exeLocalcmd(str)

    def install(self ,udid="",uninstall=0):
        isExist = self.deviceExist(udid)
        if not isExist:
            return False
        str = "ios-deploy "  + "-b " +self.savepath
        if udid:
            str = str + " -i " + udid

        if uninstall :
            str = str + " -r -1 " + bundleid
        print("----------install app -----------")
        Utils().exeLocalcmd(str)
        return True