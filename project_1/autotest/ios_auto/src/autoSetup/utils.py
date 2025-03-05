# coding:utf-8
import os
class Utils():
    def exeLocalcmd(self,str):
        print(str)
        with os.popen(str) as stdout:
            result = stdout.read()
        return result
