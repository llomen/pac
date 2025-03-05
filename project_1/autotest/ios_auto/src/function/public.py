# coding:utf-8
import sqlite3
import collections
import webpy

class sqlite(object):
    def get_data(self):
        """ 公共字段校验函数，返回值包括三个，分别为：字段校验结果：pass或者fail；多余字段集合aa，错误字段集合errdata"""
        
        data=collections.defaultdict(list)
        count=collections.defaultdict(int)
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute("select * from get_data")
        da=c.fetchall()
        conn.commit()  
        conn.close()
        for a,b in da:
            data[a].append(b)
            count[a]+=1
        return(count,data)  
    def delete_data(self):
        conn=sqlite3.connect(webpy.path)
        conn.execute("delete from get_data")
        conn.commit()  
        conn.close()
    def cut_data(self,host):
        da=collections.defaultdict(list)
        count,data=self.get_data()
        if host in data:
            hostdata=data[host]
            for i in range(0,len(hostdata)):
                daa=eval(hostdata[i])
                da[daa['act']].append(daa)
        return(da)
    
class Public(object):
    """ 数据上报公共字段校验类字段 """
    def diff_pub(self,aa,uuid):
        """ 公共字段校验函数，返回值包括三个，分别为：字段校验结果：pass或者fail；多余字段集合aa，错误字段集合errdata"""
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute("select * from config_data")
        da=c.fetchall()
        config=da[0]
        conn.commit()
        conn.close()
        errdata = {}
        if "av" in aa:
            if aa["av"]!= config[4]:
                errdata['av'] = aa["av"]
            aa.pop("av")
        else:
            errdata['av'] = 'no_field'
                
        if "ch" in aa:
            if aa["ch"]!= config[5]:
                errdata['ch'] = aa["ch"]
            aa.pop("ch")
        else:
            errdata['ch'] = 'no_field'
            
        if "did" in aa:
            if aa["did"] != config[1]:
                errdata['did'] = aa["did"]
            aa.pop("did")
        else:
            errdata['did'] = 'no_field'
    
        if "gps" in aa:
            aa.pop("gps")
        else:
            errdata['gps'] = 'no_field'
            
        if "guid" in aa:
            if aa["guid"] != config[0]:
                errdata['guid'] = aa["guid"]
            aa.pop("guid")
        else:
            errdata['guid'] = 'no_field'
        
        if "tst" in aa:
            if aa["tst"] != config[7]:
                errdata['tst'] = aa["tst"]
            aa.pop("tst")
        else:
            errdata['tst'] = 'no_field'
            
        if "mf" in aa:
            if aa["mf"] != config[2]:
                errdata['mf'] = aa["mf"]
            aa.pop("mf")
        else:
            errdata['mf'] = 'no_field'
        
        if "md" in aa:
            if aa["md"] != config[3]:
                errdata['md'] = aa["md"]
            aa.pop("md")
        else:
            errdata['md'] = 'no_field'
            
        if "nt" in aa:
            if aa["nt"] != config[6]:
                errdata['nt'] = aa["nt"]
            aa.pop("nt")
        else:
            errdata['nt'] = 'no_field'
        
        if "sv" in aa:
            if aa["sv"] != config[8]:
                errdata['sv'] = aa["sv"]
            aa.pop("sv")
        else:
            errdata['sv'] = 'no_field'
            
        if "t" in aa:
            if aa["t"] == None:
                errdata['t'] = aa["t"]
            aa.pop("t")
        else:
            errdata['t'] = 'no_field'
        
        if "uuid" in aa:
            if aa["uuid"]!=uuid:
                errdata['uuid'] = aa["uuid"]
            aa.pop("uuid")
        else:
            errdata['uuid'] = 'no_field'

        if "sid" in aa:
            if len(aa['sid']) != 36:
                errdata['sid'] = aa["sid"]
            aa.pop("sid")
        else:
            errdata['sid'] = 'no_field'
        return(aa, errdata)
  
class Public_old(object):
    """ 数据上报公共字段校验类字段 """
    def diff_pub(self,aa,uuid):
        """ 公共字段校验函数，返回值包括三个，分别为：字段校验结果：pass或者fail；多余字段集合aa，错误字段集合errdata"""
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute("select * from config_data")
        da=c.fetchall()
        config=da[0]
        conn.commit()
        conn.close()
        errdata = {}
        if "bid" in aa:
            if aa['bid'] ==config[1]:
                errdata['bid'] = aa["bid"]
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
            
        if "aver" in aa:
            if aa["aver"] != config[4]:
                errdata['aver'] = aa["aver"]
            aa.pop("aver")
        else:
            errdata['aver'] = 'no_field'
                
        if "ch" in aa:
            if aa["ch"] != config[5]:
                errdata['ch'] = aa["ch"]
            aa.pop("ch")
        else:
            errdata['ch'] = 'no_field'
            
        if "did" in aa:
            if aa["did"] != config[1]:
                errdata['did'] = aa["did"]
            aa.pop("did")
        else:
            errdata['did'] = 'no_field'
    
        if "gps" in aa:
            aa.pop("gps")
        else:
            errdata['gps'] = 'no_field'
            
        if "guid" in aa:
            if aa["guid"] != config[0]:
                errdata['guid'] = aa["guid"]
            aa.pop("guid")
        else:
            errdata['guid'] = 'no_field'
        
        if "isdebug" in aa:
            if aa["isdebug"] != config[7]:
                errdata['isdebug'] = aa["isdebug"]
            aa.pop("isdebug")
        else:
            errdata['isdebug'] = 'no_field'
            
        if "mf" in aa:
            if aa["mf"] != config[2]:
                errdata['mf'] = aa["mf"]
            aa.pop("mf")
        else:
            errdata['mf'] = 'no_field'
        
        if "mod" in aa:
            if aa["mod"] != config[3]:
                errdata['mod'] = aa["mod"]
            aa.pop("mod")
        else:
            errdata['mod'] = 'no_field'
            
        if "net" in aa:
            if aa["net"] != config[6]:
                errdata['net'] = aa["net"]
            aa.pop("net")
        else:
            errdata['net'] = 'no_field'
        
        if "sver" in aa:
            if aa["sver"] != config[8]:
                errdata['sver'] = aa["sver"]
            aa.pop("sver")
        else:
            errdata['sver'] = 'no_field'
            
        if "time" in aa:
            if aa["time"] == None:
                errdata['time'] = aa["time"]
            aa.pop("time")
        else:
            errdata['time'] = 'no_field'
        
        if "uuid" in aa:
            if aa["uuid"] != uuid:
                errdata['uuid'] = aa["uuid"]
            aa.pop("uuid")
        else:
            errdata['uuid'] = 'no_field'
            
        if "sid" in aa:
            if len(aa["sid"]) != 36:
                errdata['sid'] = aa["sid"]
            aa.pop("sid")
        else:
            errdata['sid'] = 'no_field'                                                             
        return(aa, errdata)