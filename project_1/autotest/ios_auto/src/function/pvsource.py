# coding:utf-8
import function.config as conf
import function.public as pub

class PvSource(object):
    def diff_pvsource(self,uuid,fpn,fpid,cpn,cpid,cid,plid):
        Public1 =pub.Public()
        sqlite=pub.sqlite()
        count,data=sqlite.get_data()
        
        data1, errdata1 = Public1.diff_pub(eval(data['iphone.v0.mgtv.com'][0]),uuid)
        data, errdata2 = self.pvsource(data1, fpn, fpid, cpn, cpid, cid, plid)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata) 
    def pvsource(self,data,fpn,fpid,cpn,cpid,cid,plid):
        errdata={}
        if 'act' in data:
            if data['act']!=conf.pvsact:
                errdata['act']=data['act']
            data.pop('act')
        else:
            errdata['t']='no_field'
            
        if 'fpn' in data:
            if data['fpn']!=fpn:
                errdata['fpn']=data['fpn']
            data.pop('fpn')
        else:
            errdata['fpn']='no_field'
            
        if 'fpid' in data:
            if data['fpid']!=fpid:
                errdata['fpid']=data['fpid']
            data.pop('fpid')
        else:
            errdata['fpid']='no_field'

        if 'cpn' in data:
            if data['cpn']!=cpn:
                errdata['cpn']=data['cpn']
            data.pop('cpn')
        else:
            errdata['cpn']='no_field'
            
        if 'cpid' in data:
            if data['cpid']!=cpid:
                errdata['cpid']=data['cpid']
            data.pop('cpid')
        else:
            errdata['cpid']='no_field'
            
        if 'cid' in data:
            if data['cid']!=cid:
                errdata['cid']=data['cid']
            data.pop('cid')
        else:
            errdata['cid']='no_field'
            
        if 'plid' in data:
            if data['plid']!=plid:
                errdata['plid']=data['plid']
            data.pop('plid')
        else:
            errdata['plid']='no_field'
        return(data,errdata)
