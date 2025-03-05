# coding:utf-8
import library.public as pub
import os
import sqlite3
import webpy

class log_da(object):
    def diff_da(self,uuid,b,mod,ss=None, cpp=None, cc=None, e=None, v='', ci=''):
        """ ad私有字段校验函数
                      传入参数：
                    uuid:用户uuid
                    b:播放器id
                    ss：当前广告位id
                    cpp:当前播放广告投放id
                    cc:当前播放广告创意id
                    e:播放事件
                    v:当前页面视频id
                    ci:当前页面视频的合集id
                      返回值：
                    aa:本次上报多余字段字典
                    errdata:异常值字段和缺失字段字典
        """
        sqlite=pub.sqlite()
        dat=sqlite.cut_data('log.da.hunantv.com','ty')
        if 'e' in dat:
            data1, errdata1 = self.publc_field(dat['e'][0], uuid,mod)
            data, errdata2 = self.e(data1, v, ci,b)
            errdata = dict(errdata1.items() + errdata2.items())
            return(data,errdata)
        elif 'p' in dat:
            data1, errdata1 = self.publc_field(dat['p'][0], uuid)
            data, errdata2 = self.p(data1, ss, cpp, cc, e, v, ci,b)
            errdata = dict(errdata1.items() + errdata2.items())
            return(data,errdata)
        else:
            print(data)
           
    def p(self, data, s, cp, c, e, v, ci,b):
        """ ty：e私有字段校验函数
                      传入参数：
                    data:本次操作上报字段字典
                    b:播放器id
                    ss：当前广告位id
                    cpp:当前播放广告投放id
                    cc:当前播放广告创意id
                    e:播放事件
                    v:当前页面视频id
                    ci:当前页面视频的合集id
                      返回值：
                    aa:本次上报多余字段字典
                    errdata:异常值字段和缺失字段字典
        """
        errdata = {}
        # 1 ty
        if 'ty' in data:
            if data['ty'] != 'p':
                errdata['ty'] = data['ty']
            data.pop('ty')
        else:
            errdata['ty'] = 'no_field'
        # 2 ur
        if 'ur' in data:
            data.pop('ur')
        else:
            errdata['ur'] = 'no_field'
        # 3 v
        if 'v' in data:
            if data['v'] != v:
                errdata['v'] = data['v']
            data.pop('v')
        else:
            errdata['v'] = 'no_field'
        # 4 ci
        if 'ci' in data:
            if data['ci'] != ci:
                errdata['ci'] = data['ci']
            data.pop('ci')
        else:
            errdata['ci'] = 'no_field'
        # 5 b
        if 'b' in data:
            if data['b'] not in b:
                errdata['b'] = data['b']
            data.pop('b')
        else:
            errdata['b'] = 'no_field'
        # 6 s
        if 's' in data:
            if data['s'] not in s:
                errdata['s'] = data['s']
            data.pop('s')
        else:
            errdata['s'] = 'no_field'
        # 7 cp
        if 'cp' in data:
            if data['cp'] not in cp:
                errdata['cp'] = data['cp']
            data.pop('cp')
        else:
            errdata['cp'] = 'no_field'
        # 8 c
        if 'c' in data:
            if data['c'] not in c:
                errdata['c'] = data['c']
            data.pop('c')
        else:
            errdata['c'] = 'no_field'
        # 9 ct
        if "ct" in data:
            if data["ct"] == None:
                errdata['ct'] = data["ct"]
            data.pop("ct")
        else:
            errdata['ct'] = 'no_field'
        # 10 o
        if 'o' in data:
            if data['o'] == None:
                errdata['o'] = data['o']
            data.pop('o')
        else:
            errdata['o'] = 'no_field'
        # 11e
        if 'e' in data:
            if data['e'] != e:
                errdata['e'] = data['e']
            data.pop('e')
        else:
            errdata['e'] = 'no_field'
        return(data, errdata)        
    def e(self, data, v, ci,b):
        """ty： p事件私有字段校验函数
                      传入参数：
                    data:本次操作上报字段字典
                    b:播放器id
                    v:当前页面视频id
                    ci:当前页面视频的合集id
                      返回值：
                    aa:本次上报多余字段字典
                    errdata:异常值字段和缺失字段字典
        """
        errdata = {}
        # 1 ty:事件类型
        if 'ty' in data:
            if data['ty'] != 'e':
                errdata['ty'] = data['ty']
            data.pop('ty')
        else:
            errdata['ty'] = 'no_field'
        
        # 2 ur当前页面url，可为空
        if 'ur' in data:
            data.pop('ur')
        else:
            errdata['ur'] = 'no_field'
        # 3 v
        if 'v' in data:
            if data['v'] != v:
                errdata['v'] = data['v']
            data.pop('v')
        else:
            errdata['v'] = 'no_field'
        # 4 ci
        if 'ci' in data:
            if data['ci'] != ci:
                errdata['ci'] = data['ci']
            data.pop('ci')
        else:
            errdata['ci'] = 'no_field'
        # 5 b
        if 'b' in data:
            if data['b'] not in b:
                errdata['b'] = data['b']
            data.pop('b')
        else:
            errdata['b'] = 'no_field'
        # 6 rs
        if 'rs' in data:
            if data['rs'] != '0':
                errdata['rs'] = data['rs']
            data.pop('rs')
        else:
            errdata['rs'] = 'no_field'
        # 7 l 
        if 'l' in data:
            if data['l'] == None:
                errdata['l'] = data['l']
            data.pop('l')
        else:
            errdata['l'] = 'no_field'
        # 8td
        if 'td' in data:
            if data['td'] == None:      
                errdata['td'] = data['td']
            data.pop('td')
        else:
            errdata['td'] = 'no_field'
        # 9 
        if 'req' in data:
            if data['req'] == None:
                errdata['req'] = data['req']
            data.pop('req')
        else:
            errdata['req'] = 'no_field'     
        return(data, errdata)

    def publc_field(self, data, uuid,mod):
        """ adplay公共字段校验函数
                    传入参数：
                    data:本次操作上报字段字典
                    uuid:用户uuid
                    返回值：
                    aa:剩余未校验字段和多余字段字典
                    errdata:异常值字段和缺失字段字典
        """
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute("select * from config_data where public_mod=%s"%mod)
        config=c.fetchall()
        conn.commit()
        conn.close()
        errdata = {} 
        # 1 pf
        if 'pf' in data:
            if data['pf'] != '010101':
                errdata['pf'] = data['pf']
            data.pop('pf')
        else:
            errdata['pf'] = 'no_field'
        # 2 d
        if 'd' in data:
            if data['d'] != config[1]:
                errdata['d'] = data['d']   
            data.pop('d')
        else:
            errdata['d'] = 'no_field'
        # u       
        if 'u' in data:
            if data['u']!= uuid:       
                errdata['u'] = data['u']
            data.pop('u')
        else:
            errdata['u'] = 'no_field'
        # net
        if 'net' in data:
            if data['net'].find('1') == -1:
                errdata['net'] = data['net']
            data.pop('net')
        else:
            errdata['net'] = 'no_field'
        # os
        if 'os' in data:
            if data['os'] != config[8]:       
                errdata['os'] = data['os']
            data.pop('os')
        else:
            errdata['os'] = 'no_field'
        # mf
        if 'mf' in data:
            if data['mf'] != config[2]:       
                errdata['mf'] = data['mf']
            data.pop('mf')
        else:
            errdata['mf'] = 'no_field'
        # mod
        if 'mod' in data:
            if data['mod'] != config[3]:       
                errdata['mod'] = data['mod']
            data.pop('mod')
        else:
            errdata['mod'] = 'no_field'
        # app
        if 'app' in data:
            if data['app'] != config[4]:       
                errdata['app'] = data['app']
            data.pop('app')
        else:
            errdata['app'] = 'no_field'
        # ts
        if 'ts' in data:
            if data['ts'] == None:
                errdata['ts'] = data['ts']
            data.pop('ts')
        else:
            errdata['ts'] = 'no_field'
        # si
        if 'si' in data:
            if len(data['si']) != 36:   
                errdata['si'] = data['si']
            data.pop('si')
        else:
            errdata['si'] = 'no_field'
        return(data, errdata) 

class err_da(object):
    def diff_errda(self,path,uuid,code, s, cp, c, o,ci,v):
        pu=log_da()
        data=self.get_log_da_data(path)
        if len(data)!=0:
            data1, errdata1 = pu.publc_field(data[0], uuid)
            if 'ci' in data1:
                if data1['ci']!=ci:
                    errdata1['ci']=data1['ci']
                data1.pop('ci')
            else:
                errdata1['ci']='no_field'
            if 'v' in data1:
                if data1['v']!=v:
                    errdata1['v']=data1['v']
                data1.pop('v')
            else:
                errdata1['v']='no_field'
                    
            data, errdata2 = self.errda(data1, code, s, cp, c, o)
            errdata = dict(errdata1.items() + errdata2.items())
            return(data,errdata)
        else:
            return('no_data_report','no_data_report')
    def errda(self,data,code,s,cp,c,o,b):
        errdata={}
        if 'code' in data:
            if data['code'] != code:
                errdata['code'] = data['code']
            data.pop('code')
        else:
            errdata['code'] = 'no_field'
        if 'errorMsg' in data:
            data.pop('errorMsg')
        else:
            errdata['errorMsg'] = 'no_field'
        if 'url' in data:
            if data['url'] == None:
                errdata['url'] = data['url']
            data.pop('url')
        else:
            errdata['url'] = 'no_field'
        if 's' in data:
            if data['s'] not in s:
                errdata['s'] = data['s']
            data.pop('s')
        else:
            errdata['s'] = 'no_field'
        if 'cp' in data:
            if data['cp'] not in cp:
                errdata['cp'] = data['cp']
            data.pop('cp')
        else:
            errdata['cp'] = 'no_field'
        if 'c' in data:
            if data['c'] not in c:
                errdata['c'] = data['c']
            data.pop('c')
        else:
            errdata['c'] = 'no_field'
        if 'b' in data:
            if data['b'] not in b:
                errdata['b'] = data['b']
            data.pop('b')
        else:
            errdata['b'] = 'no_field'
        if 'o' in data:
            if data['o'] not in o:
                errdata['o'] = data['o']
            data.pop('o')
        else:
            errdata['o'] = 'no_field'
        return(data,errdata)
