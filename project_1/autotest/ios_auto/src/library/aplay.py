# coding:utf-8
import sqlite3
import webpy
import library.public as pub

class aplay(pub.sqlite):
    def diff_adplay(self,test_point,public_point):
        errdata={}
        data=self.cut_data('log.v2.hunantv.com', 'act')
        if len(data)!=0:
            check_data=data['aplay'][0]
            config_data=self.get_config_data(test_point, 'config_aplay', public_point, 'config_public')
            for line in config_data:
                if line in check_data:
                    if config_data[line]==None:
                        if check_data[line]!='':
                            errdata[line]=check_data[line]
                    else:
                        if check_data[line]!=config_data[line]:
                            errdata[line]=check_data[line]
            err_data=self.aplay(errdata)
        else:
            err_data['data_number']=0
        return(err_data)
    def aplay(self,aa):
        """ adplay公共字段校验函数
                    传入参数：
                    aa:本次操作上报字段字典
                    uuid:用户uuid
                    adtype:广告类型 0-前贴，1-中插
                    返回值：
                    aa:剩余未校验字段和多余字段字典
                    errdata:异常值字段和缺失字段字典
        """
        if "gps" in aa:
            aa.pop("gps")

        if "time" in aa:
            if aa["time"] != None:
                aa.pop("time")

        if "sid" in aa:
            if len(aa['sid']) ==36:
                aa.pop("sid")
            
        if "idx" in aa:
            if aa["idx"] != None:
                aa.pop("idx")
            
        if "ct" in aa:
            if aa["ct"] != None:
                aa.pop("ct")

        if "et" in aa:
            if aa["et"] != None:
                aa.pop("et")
            
        if "td" in aa:
            if aa["td"] != None:
                aa.pop("td")
            
        if "suuid" in aa:
            if len(aa["suuid"]) == 36:
                aa.pop("suuid")
            
        if "url" in aa:
            if aa["url"]!= None:
                aa.pop("url")

        if "purl" in aa:
            if aa["purl"] != None:
                aa.pop("purl")
        return(aa)

class Min_event(pub.sqlite):
    def diff_event(self,act,type,public_point):
        errdata={}
        data=self.cut_data('log.v2.hunantv.com', 'act')
        if len(data)!=0:
            data=self.cut_min(data[act])
            check_data=data[type]
            config_data=self.get_config_data('1', 'config_minor_event', public_point, 'config_public')
            for line in config_data:
                if line in check_data:
                    if config_data[line]==None:
                        if check_data[line]!='':
                            errdata[line]=check_data[line]
                    else:
                        if check_data[line]!=config_data[line]:
                            errdata[line]=check_data[line]
            err_data=self.pv(errdata, act, type)
        else:
            err_data['data_number']=0
        return(err_data) 
    def pv(self,aa,act,type):
        if "gps" in aa:
            aa.pop("gps")

        if "time" in aa:
            if aa["time"] != None:
                aa.pop("time")

        if "sid" in aa:
            if len(aa['sid']) ==36:
                aa.pop("sid")
                
        if 'act' in aa:
            if aa['act']==act:
                aa.pop("sid")

        if 'type' in aa:
            if aa['type']==type:
                aa.pop("type")
        return(aa)
    
    def cut_min(self,data):
        li={}
        for line in data:
                li[line['type']]=line
        return(li)
                
            
            
            
            
            
            
            
            
        