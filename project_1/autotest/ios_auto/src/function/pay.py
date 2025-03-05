# coding:utf-8
import function.config as conf
import function.public as pub


class Pay(object):
    def diff_entry(self,uuid,vid,sovid,plid,soplid,cid,lcid,act,isad,pt,def1,pagename,pver):
        Public1 =pub.Public_old()
        sqlite=pub.sqlite()
        count,data=sqlite.get_data()
        data1, errdata1 = Public1.diff_pub(data['audit.aaa.mgtv.com'][0],uuid)
        if 'isdebug' in errdata1:
            errdata1.pop('isdebug')
        data, errdata2 = self.pay_entry(data1,vid,sovid,plid,soplid,cid,lcid,act,isad,pt,def1,pagename,pver)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata) 
    def pay_entry(self,data,vid,sovid,plid,soplid,cid,lcid,act,isad,pt,def1,pagename,pver):
        """购买入口上报事件私有字段校验"""
        errdata={}
        if 'vid' in data:
            if data['vid']!=vid:
                errdata['vid']=data['vid']
            data.pop('vid')
        else:
            errdata['vid']='no_field'
            
        if 'sovid' in data:
            if data['sovid']!=sovid:
                errdata['sovid']=data['sovid']
            data.pop('sovid')
        else:
            errdata['sovid']='no_field'
            
        if 'plid' in data:
            if data['plid']!=plid:
                errdata['plid']=data['plid']
            data.pop('plid')
        else:
            errdata['plid']='no_field'
            
        if 'soplid' in data:
            if data['soplid']!=soplid:
                errdata['soplid']=data['soplid']
            data.pop('soplid')
        else:
            errdata['soplid']='no_field'
            
        if 'cid' in data:
            if data['cid']!=cid:
                errdata['cid']=data['cid']
            data.pop('cid')
        else:
            errdata['cid']='no_field'
            
        if 'lcid' in data:
            if data['lcid']!=lcid:
                errdata['lcid']=data['lcid']
            data.pop('lcid')
        else:
            errdata['lcid']='no_field'
            
        if 'act' in data:
            if data['act']!=act:
                errdata['act']=data['act']
            data.pop('act')
        else:
            errdata['act']='no_field'
            
        if 'isad' in data:
            if data['isad']!=isad:
                errdata['isad']=data['isad']
            data.pop('isad')
        else:
            errdata['isad']='no_field'
            
        if 'pt' in data:
            if data['pt']!=pt:
                errdata['pt']=data['pt']
            data.pop('pt')
        else:
            errdata['pt']='no_field'
            
        if 'def' in data:
            if data['def']!=def1:
                errdata['def']=data['def']
            data.pop('def')
        else:
            errdata['def']='no_field'
            
        if 'pagename' in data:
            if data['pagename']!=pagename:
                errdata['pagename']=data['pagename']
            data.pop('pagename')
        else:
            errdata['pagename']='no_field'
            
        if 'pver' in data:
            if data['pver']!=pver:
                errdata['pver']=data['pver']
            data.pop('pver')
        else:
            errdata['pver']='no_field'
            
        if 'ext1' in data:
            data.pop('ext1')
        else:
            errdata['ext1']='no_field'
            
        if 'ext2' in data:
            data.pop('ext2')
        else:
            errdata['ext2']='no_field'
            
        if 'ext3' in data:
            data.pop('ext3')
        else:
            errdata['ext3']='no_field'
            
        if 'ext4' in data:
            data.pop('ext4')
        else:
            errdata['ext4']='no_field'
            
        if 'ext5' in data:
            data.pop('ext5')
        else:
            errdata['ext5']='no_field'
        return(data,errdata)
      
    def diff_order(self,uuid,p, c, o, vid, sovid):
        Public1 =pub.Public_old()
        sqlite=pub.sqlite()
        count,data=sqlite.get_data()
        data1, errdata1 = Public1.diff_pub(data['audit.aaa.mgtv.com'][0],uuid)
        if 'isdebug' in errdata1:
            errdata1.pop('isdebug')
        data, errdata2 = self.order(data1, p, c, o, vid, sovid)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)    
    def order(self,data,p,c,o,vid,sovid):
        """下单页上报事件私有字段校验"""
        errdata={}
        if 'p' in data:
            if data['p']!=p:
                errdata['p']=data['p']
            data.pop('p')
        else:
            errdata['p']='no_field'
            
        if 'c' in data:
            if data['c']!=c:
                errdata['c']=data['c']
            data.pop('c')
        else:
            errdata['c']='no_field'
            
        if 'o' in data:
            if data['o']!=o:
                errdata['o']=data['o']
            data.pop('o')
        else:
            errdata['o']='no_field'
            
        if 'act' in data:
            if data['act']!='order':
                errdata['act']=data['act']
            data.pop('act')
        else:
            errdata['act']='no_field'
            
        if 'vid' in data:
            if data['vid']!=vid:
                errdata['vid']=data['vid']
            data.pop('vid')
        else:
            errdata['vid']='no_field'

        if 'sovid' in data:
            if data['sovid']!=sovid:
                errdata['sovid']=data['sovid']
            data.pop('sovid')
        else:
            errdata['sovid']='no_field'
            
        if 'ext1' in data:
            data.pop('ext1')
        else:
            errdata['ext1']='no_field'
            
        if 'ext2' in data:
            data.pop('ext2')
        else:
            errdata['ext2']='no_field'
            
        if 'ext3' in data:
            data.pop('ext3')
        else:
            errdata['ext3']='n  o_field'
            
        if 'ext4' in data:
            data.pop('ext4')
        else:
            errdata['ext4']='no_field'
            
        if 'ext5' in data:
            data.pop('ext5')
        else:
            errdata['ext5']='no_field'
        return(data,errdata)
    def diff_result(self,uuid,r, o, vid, sovid):
        Public1 =pub.Public_old()
        sqlite=pub.sqlite()
        count,data=sqlite.get_data()
        data1, errdata1 = Public1.diff_pub(data['audit.aaa.mgtv.com'][0],uuid)
        if 'isdebug' in errdata1:
            errdata1.pop('isdebug')
        data, errdata2 = self.pay_result(data1, r, o, vid, sovid)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)   
    def pay_result(self,data,r,o,vid,sovid):
        errdata={}
        if 'r' in data:
            if data['r']!=r:
                errdata['r']=data['r']
            data.pop('r')
        else:
            errdata['r']='no_field'
        
        if 'o' in data:
            if data['o']!=o:
                errdata['o']=data['o']
            data.pop('o')
        else:
            errdata['o']='no_field'
            
        if 'act' in data:
            if data['act']!='result':
                errdata['act']=data['act']
            data.pop('act')
        else:
            errdata['act']='no_field'
            
        if 'vid' in data:
            if data['vid']!=vid:
                errdata['vid']=data['vid']
            data.pop('vid')
        else:
            errdata['vid']='no_field'

        if 'sovid' in data:
            if data['sovid']!=sovid:
                errdata['sovid']=data['sovid']
            data.pop('sovid')
        else:
            errdata['sovid']='no_field'
            
        if 'ext1' in data:
            data.pop('ext1')
        else:
            errdata['ext1']='no_field'
            
        if 'ext2' in data:
            data.pop('ext2')
        else:
            errdata['ext2']='no_field'
            
        if 'ext3' in data:
            data.pop('ext3')
        else:
            errdata['ext3']='no_field'
            
        if 'ext4' in data:
            data.pop('ext4')
        else:
            errdata['ext4']='no_field'
            
        if 'ext5' in data:
            data.pop('ext5')
        else:
            errdata['ext5']='no_field'
        return(data,errdata)
        
