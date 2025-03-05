# coding:utf-8
import function.public as pub

class recommend(object):
    def diff_recommend(self,act,uuid, region, videoid):
        sqlite=pub.sqlite()
        count,data=sqlite.get_data()
        Public1 = pub.Public_old()
        data1, errdata1 = Public1.diff_pub(eval(data['log.rc.hunantv.com'][0]), uuid)
        if 'pix' in errdata1:
            errdata1.pop('pix')
        if 'isdebug' in errdata1:
            if errdata1['isdebug']!=0:
                errdata1['isdebug'] = data['isdebug']
            else:
                errdata1.pop('isdebug')
        if 'net' in errdata1:
            if errdata1['net']!=1:
                errdata1['net'] = data['net']
            else:
                errdata1.pop('net')
        data, errdata2 = self.recommend(data1, act, region,videoid)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def recommend(self,data,act,region,videoid):
        errdata = {}
        if 'act' in data:
            if data['act'] != act:
                errdata['act'] = data['act']
            data.pop('act')
        else:
            errdata['act'] = 'no_field'   
             
        if 'hitid' in data:
            if data['hitid'] == None:
                errdata['hitid'] = data['hitid']
            data.pop('hitid')
        else:
            errdata['hitid'] = 'no_field'       
            
        if 'rcdata' in data:
            if data['rcdata'] == None:
                errdata['rcdata'] = data['rcdata']
            data.pop('rcdata')
        else:
            errdata['rcdata'] = 'no_field'      
            
        if 'region' in data:
            str2 = region.encode('utf-8')
            print(type(str2))
            print(type(data['region']))
            if data['region'] != int(str2):
                errdata['region'] = data['region']
            data.pop('region')
        else:
            errdata['region'] = 'no_field'    
            
        if 'reqid' in data:
            if data['reqid'] == None:
                errdata['reqid'] = data['reqid']
            data.pop('reqid')
        else:
            errdata['reqid'] = 'no_field'  
            
        if 'ver' in data:
            if data['ver'] == None:
                errdata['ver'] = data['ver']
            data.pop('ver')
        else:
            errdata['ver'] = 'no_field'  
            
        if 'pos' in data:
            if data['pos'] == None:
                errdata['pos'] = data['pos']
            data.pop('pos')
        else:
            errdata['pos'] = 'no_field'  
            
        if 'videoid' in data:
            if data['videoid'] != videoid:
                errdata['videoid'] = data['videoid']
            data.pop('videoid')
        else:
            errdata['videoid'] = 'no_field'  
        return(data, errdata)
