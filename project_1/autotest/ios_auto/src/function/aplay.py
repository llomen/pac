# coding:utf-8
import sqlite3
import webpy
import function.public as pub

class aplay(object):
    def diff_adplay(self,uuid,video_type,def1,ref,ln):
        sqlite=pub.sqlite()
        pub_field=pub.Public_old()
        data=sqlite.cut_data('log.v2.hunantv.com')
        data1, errdata1 = pub_field.diff_pub(eval(data['aplay'][0]),uuid)
        data, errdata2 = self.adplay(data1,video_type,def1,ref,ln)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata) 
    def aplay(self, aa,video_type,def1,ref,ln):
        """ adplay公共字段校验函数
                    传入参数：
                    aa:本次操作上报字段字典
                    uuid:用户uuid
                    adtype:广告类型 0-前贴，1-中插
                    返回值：
                    aa:剩余未校验字段和多余字段字典
                    errdata:异常值字段和缺失字段字典
        """
        conn=sqlite3.connect(webpy.path)
        c=conn.cursor()
        c.execute("select * from config_aplay")
        da1=c.fetchall()
        if video_type=='1':
            config1=da1[0]
        elif video_type=='2':
            config1=da1[1]
        elif video_type=='3':
            config1=da1[2]
        conn.commit()
        conn.close()
        errdata = {}
        
        if "act" in aa:
            if aa["act"] != config1[19]: 
                errdata['act'] = aa["act"]
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'
            
        if "idx" in aa:
            if aa["idx"] == None:
                errdata['idx'] = aa["idx"]
            aa.pop("idx")
        else:
            errdata['idx'] = 'no_field'
            
        if "ct" in aa:
            if aa["ct"] == None:
                errdata['ct'] = aa["ct"]
            aa.pop("ct")
        else:
            errdata['ct'] = 'no_field'

        if "et" in aa:
            if aa["et"] == None:
                errdata['et'] = aa["et"]
            aa.pop("et")
        else:
            errdata['et'] = 'no_field'
            
        if "td" in aa:
            if aa["td"] == None:
                errdata['td'] = aa["td"]
            aa.pop("td")
        else:
            errdata['td'] = 'no_field'
            
        if "suuid" in aa:
            if len(aa["suuid"]) != 36:
                errdata['suuid'] = aa["suuid"]
            aa.pop("suuid")
        else:
            errdata['suuid'] = 'no_field'
            
        if "url" in aa:
            if aa["url"]== None:
                errdata['url'] = aa["url"]
            aa.pop("url")
        else:
            errdata['url'] = 'no_field'
            
        if "vid" in aa:
            if aa["vid"] != config1[1]:
                errdata['vid'] = aa["vid"]
            aa.pop("vid")
        else:
            errdata['vid'] = 'no_field'
            
        if "sovid" in aa:
            if aa["sovid"] != config1[2]:
                errdata['sovid'] = aa["sovid"]
            aa.pop("sovid")
        else:
            errdata['sovid'] = 'no_field' 
               
        if "plid" in aa:
            if aa["plid"] != config1[3]:
                errdata['plid'] = aa["plid"]
            aa.pop("plid")
        else:
            errdata['plid'] = 'no_field'
            
        if "soplid" in aa:
            if aa["soplid"] != config1[4]:
                errdata['soplid'] = aa["soplid"]
            aa.pop("soplid")
        else:
            errdata['soplid'] = 'no_field'
            
        if "cid" in aa:
            if aa["cid"] != config1[5]:
                errdata['cid'] = aa["cid"]
            aa.pop("cid")
        else:
            errdata['cid'] = 'no_field'
            
        if "purl" in aa:
            if aa["purl"] == None:
                errdata['purl'] = aa["purl"]
            aa.pop("purl")
        else:
            errdata['purl'] = 'no_field' 
            
        if "ap" in aa:
            if aa["ap"] != config1[6]:
                errdata['ap'] = aa["ap"]
            aa.pop("ap")
        else:
            errdata['ap'] = 'no_field'

        if "pt" in aa:
            if aa["pt"] != config1[7]:
                errdata['pt'] = aa["pt"]
            aa.pop("pt")
        else:
            errdata['pt'] = 'no_field'

        if "pay" in aa:
            if aa["pay"] != config1[8]:
                errdata['pay'] = aa["pay"]
            aa.pop("pay")
        else:
            errdata['pay'] = 'no_field'
            
        if "def" in aa:
            if aa["def"] != def1:
                errdata['def'] = aa["def"]
            aa.pop("def")
        else:
            errdata['def'] = 'no_field'
            
        if "istry" in aa:
            if aa["istry"] != config1[9]:
                errdata['istry'] = aa["istry"]
            aa.pop("istry")
        else:
            errdata['istry'] = 'no_field'  
            
        if "bid" in aa:
            if aa["bid"] != config1[10]:
                errdata['bid'] = aa["bid"]
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
            
        if "bdid" in aa:
            if aa["bdid"] != config1[11]:
                errdata['bdid'] = aa["bdid"]
            aa.pop("bdid")
        else:
            errdata['bdid'] = 'no_field'

        if "fpn" in aa:
            if aa["fpn"] != config1[12]:
                errdata['fpn'] = aa["fpn"]
            aa.pop("fpn")
        else:
            errdata['fpn'] = 'no_field'

        if "fpid" in aa:
            if aa["fpid"] != config1[13]:
                errdata['fpid'] = aa["fpid"]
            aa.pop("fpid")
        else:
            errdata['fpid'] = 'no_field'


        if "ref" in aa:
            if aa["ref"] != ref:
                errdata['ref'] = aa["ref"]
            aa.pop("ref")
        else:
            errdata['ref'] = 'no_field'
            
        if "cf" in aa:
            if aa["cf"] != config1[14]:
                errdata['cf'] = aa["cf"]
            aa.pop("cf")
        else:
            errdata['cf'] = 'no_field'
            
        if "vts" in aa:
            if aa["vts"] != config1[15]:
                errdata['vts'] = aa["vts"]
            aa.pop("vts")
        else:
            errdata['vts'] = 'no_field'
            
        if "lcid" in aa:
            if aa["lcid"] != config1[16]:
                errdata['lcid'] = aa["lcid"]
            aa.pop("lcid")
        else:
            errdata['lcid'] = 'no_field'
            
        if "sourceid" in aa:
            if aa["sourceid"] != config1[17]:
                errdata['sourceid'] = aa["sourceid"]
            aa.pop("sourceid")
        else:
            errdata['sourceid'] = 'no_field'
            
        if "streamid" in aa:
            if aa["streamid"] != config1[18]:
                errdata['streamid'] = aa["streamid"]
            aa.pop("streamid")
        else:
            errdata['streamid'] = 'no_field'
            
        if "ln" in aa:
            if aa["ln"] != ln:
                errdata['ln'] = aa["ln"]
            aa.pop("ln")
        else:
            errdata['ln'] = 'no_field'

        return(aa, errdata)   
