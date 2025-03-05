# coding:utf-8
import sqlite3
import collections
import webpy

class sqlite(object):
    def get_data(self):
        """ 数据获取函数：从数据库get_data表获取数据
                    传入参数：无
                    返回值：
                    data:数据字典,字典格式data={'host':'[data1,data2]'}
        """
        data=collections.defaultdict(list)
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute("select * from get_data")
        da=c.fetchall()
        conn.commit()  
        conn.close()
        for a,b in da:
            data[a].append(b)
            #count[a]+=1
        return(data)
    def delete_data(self):
        """ 步骤操作后数据清除函数：清空get_data表数据
                    传入参数：无
                    返回值：无
        """
        conn=sqlite3.connect(webpy.path)
        conn.execute("delete from get_data")
        conn.commit()  
        conn.close()
    def cut_data(self,host,field='act'):
        """ 数据切割函数：以act值切割data字典数据，返回各act数据
                    传入参数：
                    host：上报数据host域名
                    field：以哪个字段分隔数据，默认以act分隔，
                    返回值：
                    data:数据字典,字典格式data={'act':'[data1,data2]'}
        """
        da=collections.defaultdict(list)
        data=self.get_data()
        if host in data:
            hostdata=data[host]
            for i in range(0,len(hostdata)):
                daa=eval(hostdata[i])
                if isinstance(daa,dict)==True:
                    da[daa[field]].append(daa)
                elif isinstance(daa,list)==True:
                    for line in daa:
                        if isinstance(line,dict):
                            da[line[field]].append(line)
                        else:
                            da['piliang'].append(line)
                
        return(da)
    def cut_count(self,host,field='act'):
        """ 数据切割函数：以act值切割data字典数据,返回各act上报条数
                    传入参数：
                    host：上报数据host域名
                    field：以哪个字段分隔数据，默认以act分隔，
                    返回值：
                    count：上报条数字典，字典格式count={‘act’:'条数'}
        """
        count=collections.defaultdict(int)
        data=self.get_data()
        if host in data:
            hostdata=data[host]
            for i in range(0,len(hostdata)):
                daa=eval(hostdata[i])
                if isinstance(daa,dict)==True:
                    count[daa[field]]+=1
                elif isinstance(daa,list)==True:
                    for line in daa:
                        if isinstance(line,dict):
                            count[line[field]]+=1
                        else:
                            count['piliang']+=1
        return(count)
    
    def get_fieldName(self,field_table,field_public=None):
        ''' 获取 field_table1，field_table2表对应列名，以list形式返回
        '''
        field_name=[]
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        
        c.execute("PRAGMA table_info('%s')"%field_public) 
        field1=c.fetchall()
        
        if field_public!=None:
            c.execute("PRAGMA table_info('%s')"%field_table) 
            field2=c.fetchall()
            field=field1+field2
        else:
            field=field1
            
        conn.commit()
        conn.close() 
    
        for line in field:
            if line[1]!='test_point':
                field_name.append(line[1])

        return(field_name)
    
    def get_table_data(self,test_point,field_table):
        ''' 获取 field_table表test_point条数据，以字典形式返回'''
        config_data={}
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute('select * from '+field_table+' where test_point= ' +test_point)
        da=c.fetchall()
        data=da[0]
        c.execute("PRAGMA table_info('%s')"%field_table)  
        field=c.fetchall()
        conn.commit()
        conn.close() 
        for line in field:
            config_data[line[1]]=data[line[0]]
        return(config_data)
    
    def get_config_data(self,test_point,field_table,public_point=None,field_public=None):
        ''' 获取测试数据，test_point：私有字段表对应test_point值，field_table：私有字段表表名，
        public_point:公共字典表对应testpoint，field_public公共字段表表名，返回测试数据字典config_data'''
        config_data={}
        table_data=self.get_table_data(test_point, field_table)
        table_data.pop('test_point')
        if field_public!=None:
            public_data=self.get_table_data(public_point, field_public)
            public_data.pop('test_point')
            config_data=dict(table_data.items() + public_data.items())
        else:
            config_data=table_data
        return(config_data)
            
    def field_verification(self,host,field,field_value,testdata_sql,testdata_table):
        errdata={}
        surplus_field=[]
        missing_field=[]
        data=self.cut_data(host, field)
        if len(data)!=0:
            check_data=data[field_value][0]
            config_data=self.get_config_cdn(testdata_sql,testdata_table)
            config_data.pop('test_point')
            for line in config_data:
                if line not in check_data:
                    surplus_field.append(line)
                else:
                    config_data[line]=1
                if config_data[line]!=1:
                    missing_field.append(line)
            errdata['surplus_field']=surplus_field
            errdata['missing_field']=missing_field
        else:
            errdata['data_number']=0
        return(errdata)

class data(object):
    def field_verification(self,realtime_data,field_table,field_public=None):
        """字段校验函数
                      传入参数：
                    realtime_data：实时上报数据字典
                    field_table：私有字段表
                    field_public：公共字段表，默认
                      返回值：
                missing：缺失字段
                redundant：多余字段
        """
        errdata={}
        redundant=[]
        missing=[]
        aa=sqlite()
        cc=aa.get_fieldName(field_table,field_public)
        for line in cc:
            if line in realtime_data:
                realtime_data.pop(line)
            else:
                missing.append(line)
        if len(realtime_data)!=0:
            for line in realtime_data.keys():
                redundant.append(line)
        errdata['redundant']=redundant
        errdata['missing']=missing
        return(errdata)


class public_field(object):
    def diff_pub(self,aa,uuid,mod):
        """ 公共字段校验函数，返回值包括三个，分别为：字段校验结果：pass或者fail；多余字段集合aa，错误字段集合errdata"""
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute("select * from config_data where public_mod='%s'"%mod) 
        config=c.fetchall()
        conn.commit()
        conn.close()
        errdata = {}
        if "bid" in aa:
            if aa['bid'] =='2.2.0':
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
            if len(aa['sid']) !=36:
                errdata['sid'] = aa["sid"]
            aa.pop("sid")
        else:
            errdata['sid'] = 'no_field'
        return(aa, errdata)
