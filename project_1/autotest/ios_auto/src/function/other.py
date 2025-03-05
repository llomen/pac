# coding:utf-8
'''
每一个类对应一个事件，分类校验不同事件的字段
'''
import os 
import function.public as pu
from function import public
import function.config as conf
from urllib import unquote

def Get_device():
    """返回从 devices.txt文件获取连接电脑的android设备的DeviceName"""
    os.system('adb devices>>D:\\\Auto_android\\data\\devices.txt')
    if os.path.exists('D:\\\Auto_android\\data\\devices.txt'):
        aa = open('D:\\\Auto_android\\data\\devices.txt', 'U').readlines()
        device = aa[len(aa) - 2]
        return(device[0:(len(device) - 7)].strip())
    else:
        print('请确认手机已连接至电脑')    
device = Get_device()
class Public(object):
    """ 数据上报公共字段校验类字段 """
    def diff_pub(self,aa,uuid):
        """ 公共字段校验函数，返回值包括三个，分别为：字段校验结果：pass或者fail；多余字段集合aa，错误字段集合errdata"""
        errdata = {}
        if "aver" in aa:
            if self.aver(aa["aver"]) == 'fail':
                errdata['aver'] = aa["aver"]
            aa.pop("aver")
        else:
            errdata['aver'] = 'no_field'
                
        if "ch" in aa:
            if self.ch(aa["ch"]) == 'fail':
                errdata['ch'] = aa["ch"]
            aa.pop("ch")
        else:
            errdata['ch'] = 'no_field'
            
        if "did" in aa:
            if self.did(aa["did"]) == 'fail':
                errdata['did'] = aa["did"]
            aa.pop("did")
        else:
            errdata['did'] = 'no_field'
    
        if "gps" in aa:
            aa.pop("gps")
        else:
            errdata['gps'] = 'no_field'
            
        if "guid" in aa:
            if self.guid(aa["guid"]) == 'fail':
                errdata['guid'] = aa["guid"]
            aa.pop("guid")
        else:
            errdata['guid'] = 'no_field'
        
        if "isdebug" in aa:
            if self.isdebug(aa["isdebug"]) == 'fail':
                errdata['isdebug'] = aa["isdebug"]
            aa.pop("isdebug")
        else:
            errdata['isdebug'] = 'no_field'
            
        if "mf" in aa:
            if self.mf(aa["mf"]) == 'fail':
                errdata['mf'] = aa["mf"]
            aa.pop("mf")
        else:
            errdata['mf'] = 'no_field'
        
        if "mod" in aa:
            if self.mod(aa["mod"]) == 'fail':
                errdata['mod'] = aa["mod"]
            aa.pop("mod")
        else:
            errdata['mod'] = 'no_field'
            
        if "net" in aa:
            if self.net(aa["net"]) == 'fail':
                errdata['net'] = aa["net"]
            aa.pop("net")
        else:
            errdata['mod'] = 'no_field'
        
        if "sver" in aa:
            if self.sver(aa["sver"]) == 'fail':
                errdata['sver'] = aa["sver"]
            aa.pop("sver")
        else:
            errdata['sver'] = 'no_field'
            
        if "time" in aa:
            if self.time(aa["time"]) == 'fail':
                errdata['time'] = aa["time"]
            aa.pop("time")
        else:
            errdata['time'] = 'no_field'
        
        if "uuid" in aa:
            if self.uuid(aa["uuid"], uuid) == 'fail':
                errdata['uuid'] = aa["uuid"]
            aa.pop("uuid")
        else:
            errdata['uuid'] = 'no_field'
        return(aa, errdata)
    def time(self, time):
        """事件发生的时间点 必填"""
        if time != None:
            return('pass')
        else:
            return('fail')
    def guid(self, guid):
        """通过guid接口获取 必填"""
        if guid != None:
            # 红米note
            if device == '49c55e58':
                if guid == '545024901787299840':
                    return('pass')
                else:
                    return('fail')
            # 三星S4
            elif device == '4d00aa165f5d40ad':
                if guid == '628339858599186432':
                    return('pass')
                else:
                    return('fail')
            # 魅4
            elif device == '750ABKLWYTRV':
                if guid == '537170840782118912':
                    return('pass')
                else:
                    return('fail')
            # oppo find7
            elif device == 'dd510d8f':
                if guid == '552983425653542913':
                    return('pass')
                else:
                    return('fail')
            # 华为麦芒
            elif device == 'PJQDU15924008380':
                if guid == '673498853307453440':
                    return('pass')
                else:
                    return('fail')
            # vivo xplay
            elif device == '1459b93f':
                if guid == '552983660257742848':
                    return('pass')
                else:
                    return('fail')
            else:
                return('fail')     
        else:
            return('fail')
    def did(self, did):
        """设备id 必填"""
        if did != None:
            # 红米note
            if device == '49c55e58':
                if did == 'i865199020592402':
                    return('pass')
                else:
                    return('fail')
            # 三星S4
            elif device == '4d00aa165f5d40ad':
                if did == 'iA000004455A271':
                    return('pass')
                else:
                    return('fail')
            # 魅族
            elif device == '750ABKLWYTRV':  
                if did == 'i865479020952248':
                    return('pass')
                else:
                    return('fail')
            # oppo find7
            elif device == 'dd510d8f':
                if did == 'i865568028809374':
                    return('pass')
                else:
                    return('fail')
            # vivo xplay
            elif device == '1459b93f':
                if did == 'i864394022502407':
                    return('pass')
                else:
                    return('fail')
            # 华为麦芒
            elif device == 'PJQDU15924008380':
                if did == 'i866856027160710':
                    return('pass')
                else:
                    return('fail')
            else:
                return('fail')
        else:
            return('fail')
    def uuid(self, uuid, value):
        """用户id。登录用户必填"""
        if uuid == value:
            return('pass')
        else:
            return('fail')
    def net(self, net):
        """网络状态，必填"""
        if net != None:
            return('pass')
        else:
            return('fail')
    def isdebug(self, isdebug):
        """是否调试状态，必填"""
        if isdebug != None:
            if isdebug == 1 or isdebug == '1':
                return('pass')
            elif isdebug == 0 or isdebug == '0' :
                return('pass')
            else:
                return('fail')
        else:
            return('fail')  
    def mf(self, mf):
        """手机厂家，必填"""
        if mf != None:
            # 红米note
            if device == '49c55e58':
                if mf == 'Xiaomi':
                    return('pass')
                else:
                    return('fail')
            # 中兴v5
            elif device == 'MSM8926':
                if mf == '':
                    return('pass')
                else:
                    return('fail')
            # 三星S4
            elif device == '4d00aa165f5d40ad':
                if mf == 'samsung':
                    return('pass')
                else:
                    return('fail')
            # 魅族4
            elif device == '750ABKLWYTRV':
                if mf == 'Meizu':
                    return('pass')
                else:
                    return('fail')
            # 华为P6
            elif device == '022AQQ2139015290':
                if mf == 'HUAWEI':
                    return('pass')
                else:
                    return('fail')
            # oppo find7
            elif device == 'dd510d8f':
                if mf == 'OPPO':
                    return('pass')
                else:
                    return('fail')
            # XPLAY 3S
            elif device == '1459b93f':
                if mf == 'BBK':
                    return('pass')
                else:
                    return('fail')
            # 华为麦芒
            elif device == 'PJQDU15924008380':
                if mf == 'HUAWEI':
                    return('pass')
                else:
                    return('fail')
        else:
            return('fail')      
    def mod(self, mod):
        """手机型号，必填"""
        if mod != None:
            # 红米note
            if device == '49c55e58':
                if mod == 'HM NOTE 1LTEW':
                    return('pass')
                else:
                    return('fail')
            # 华为麦芒
            elif device == 'PJQDU15924008380':
                if mod == 'HUAWEI RIO-AL00':
                    return('pass')
                else:
                    return('fail')
            # 三星S4
            elif device == '4d00aa165f5d40ad':
                if mod == 'SCH-I959':
                    return('pass')
                else:
                    return('fail')
            # 魅族4
            elif device == '750ABKLWYTRV':
                if mod == 'MX4':
                    return('pass')
                else:
                    return('fail')
            # oppo find7
            elif device == 'dd510d8f':
                if mod == 'X9007':
                    return('pass')
                else:
                    return('fail')
            # vivo xplay
            elif device == '1459b93f':
                if mod == 'vivo Xplay3S' or mod == 'vivo+Xplay3S':
                    return('pass')
                else:
                    return('fail')
            else:
                return('fail')
        else:
            return('fail')   
    def sver(self, sver):
        """手机系统版本，必填"""
        if sver != None:
            # 红米note
            if device == '49c55e58':
                if sver == 'aphone-4.4.2':
                    return('pass')
                else:
                    return('fail')
            # 华为麦芒
            elif device == 'PJQDU15924008380':
                if sver == 'aphone-5.1':
                    return('pass')
                else:
                    return('fail')
            # 中兴v5
            elif device == 'MSM8926':
                if sver == '':
                    return('pass')
                else:
                    return('fail')
            # 三星S4
            elif device == '4d00aa165f5d40ad':
                if sver == 'aphone-4.4.2':
                    return('pass')
                else:
                    return('fail')
            # 魅族4
            elif device == '750ABKLWYTRV':
                if sver == 'aphone-4.4.2':
                    return('pass')
                else:
                    return('fail')
            # 华为P6
            elif device == '022AQQ2139015290':
                if sver == 'aphone-4.2.2':
                    return('pass')
                else:
                    return('fail')
            # oppo find7
            elif device == 'dd510d8f':
                if sver == 'aphone-4.3':
                    return('pass')
                else:
                    return('fail')
            # vivo xplay
            elif device == '1459b93f':
                if sver == 'aphone-4.3':
                    return('pass')
                else:
                    return('fail')
            else:
                return('fail')
        else:
            return('fail')
    def aver(self,aver):
        """ 应用版本，必填 """
        if aver != None:
            if aver ==conf.appversion:
                return('pass')
            else:
                return('fail')
        else:
            return('fail')
    def gps(self, gps):
        """用户地理位置信息，非必填"""
        if gps != None:
            aa = len(gps.split(','))
            if aa == 2:
                return('pass')
            else:
                return('fail')
        else:
            return('fail')                
    def ch(self, ch):
        """视频播放渠道标示，必填"""
        if ch != None:
            if ch =='mgtv':
                return('pass')
            else:
                return('fail')
        else:
            return('fail')     
 
class Search(object):
    def diff_search(self, aa1, ext1, ext3, uuid):
        """ 搜索字段校验结果"""
        Public1 = Public()
        math = pu.data()
        aa = math.cut_recommdata(aa1, 'search')
        data1, errdata1 = Public1.diff_pub(aa[0],uuid)
        data, errdata2 = self.search(data1, ext1, ext3)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata) 

    def search(self, aa, ext1,ext3):
        """ 搜索个性字段校验"""
        errdata = {}
        if "act" in aa:
            if aa["act"] != 'search':
                errdata['act'] = aa("act")
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'  
        
        if "bid" in aa:
            if aa["bid"] != '2.1.11':
                errdata['bid'] = aa("bid")
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field' 
            
        if "ext1" in aa:
            if aa["ext1"] != ext1:
                errdata['ext1'] = aa["ext1"]
            aa.pop("ext1")
        else:
            errdata['ext1'] = 'no_field' 
        
        if "ext2" in aa:
            if aa["ext2"] == None:
                errdata['ext2'] = aa["ext2"]
            aa.pop("ext2")
        else:
            errdata['ext2'] = 'no_field' 
            
        if "ext3" in aa:
            if aa["ext3"] != ext3:
                errdata['ext3'] = aa["ext3"]
            aa.pop("ext3")
        else:
            errdata['ext3'] = 'no_field' 
        
        if "ext4" in aa:  
            if aa["ext4"] == None:
                errdata['ext4'] = aa["ext4"]
            aa.pop("ext4")
        else:
            errdata['ext4'] = 'no_field' 
            
        if "ext5" in aa:  
            if aa["ext5"] == None:
                errdata['ext5'] = aa["ext4"]
            aa.pop("ext5")
        else:
            errdata['ext5'] = 'no_field' 
            
        if "ext6" in aa:  
            if aa["ext6"] == None:
                errdata['ext6'] = aa["ext6"]
            aa.pop("ext6")
        else:
            errdata['ext6'] = 'no_field' 

        if "ext7" in aa:  
            if aa["ext7"] == None:
                errdata['ext7'] = aa["ext7"]
            aa.pop("ext7")
        else:
            errdata['ext7'] = 'no_field' 

        if "ext8" in aa:  
            if aa["ext8"] == None:
                errdata['ext8'] = aa["ext8"]
            aa.pop("ext8")
        else:
            errdata['ext8'] = 'no_field' 
        return(aa, errdata)

class Pay(object):
    def diff_Pay(self,aa1,ext1,ext2,uuid):
        Public1=Public()
        math = pu.data()
        aa = math.cut_recommdata(aa1, 'pay')
        data1,errdata1=Public1.diff_pub(aa[0],uuid)
        data,errdata2=self.Pay(data1, ext1, ext2)
        errdata=dict(errdata1.items()+errdata2.items())
        return(data,errdata) 
    def Pay(self,aa,ext1,ext2):
        errdata={}
        if "act" in aa:
            if aa["act"]!='pay':
                errdata['act']=aa("act")
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'
        
        if "bid" in aa:
            if aa["bid"]!='2.1.11':
                errdata['bid']=aa("bid")
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
            
        if "ext1" in aa:
            if aa["ext1"]!=ext1:
                errdata['ext1'] = aa["ext1"]
            aa.pop("ext1")
        else:
            errdata['ext1'] = 'no_field'
        
        if "ext2" in aa:
            if aa["ext2"]!=ext2:
                errdata['ext2'] = aa["ext2"]
            aa.pop("ext2")
        else:
            errdata['ext2'] = 'no_field'
        return(aa, errdata)
class share(object):
    def diff_share(self, aa1, uuid, ext1, ext2, ext3, ext4):
        Public1 = Public()
        math = pu.data()
        aa = math.cut_recommdata(aa1, 'share')
        data1, errdata1 = Public1.diff_pub(aa[0], uuid)
        data, errdata2 = self.share(data1, ext1, ext2, ext3, ext4)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata) 
    def share(self, aa, ext1, ext2, ext3, ext4):
        errdata = {}
        if "act" in aa:
            if aa["act"] != 'share':
                errdata['act'] = aa("act")
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'
        
        if "bid" in aa:
            if aa["bid"] != '2.1.11':
                errdata['bid'] = aa("bid")
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
            
        if "ext1" in aa:
            if aa["ext1"] != ext1:
                errdata['ext1'] = aa["ext1"]
            aa.pop("ext1")
        else:
            errdata['ext1'] = 'no_field'
        
        if "ext2" in aa:
            if aa["ext2"] != ext2:
                errdata['ext2'] = aa["ext2"]
            aa.pop("ext2")
        else:
            errdata['ext2'] = 'no_field'
            
        if "ext3" in aa:
            if aa["ext3"] != ext3:
                errdata['ext3'] = aa["ext3"]
            aa.pop("ext3")
        else:
            errdata['ext3'] = 'no_field'
        
        if "ext4" in aa:
            if aa["ext4"] != ext4:
                errdata['ext4'] = aa["ext4"]
            aa.pop("ext4")
        else:
            errdata['ext4'] = 'no_field'
        return(aa, errdata)

class aplay(object):
    def diff_liveaplay(self, aa1, uuid,vid, sovid, plid, soplid, cid, tid, lid, pay, ext2, ext5):
        pub = Public()
        math = pu.data()
        aa = math.cut_recommdata(aa1, 'aplay')
        data1, errdata1 = pub.diff_pub(aa[0], uuid)
        
        data, errdata2 = self.liveaplay(data1, vid, sovid, plid, soplid, cid, tid, lid, pay, ext2, ext5)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def diff_searchaplay(self, aa1, uuid,sovid, vid, plid, soplid, cid, ap, pt, def1, lid, bid, tid, pay, istry, isrc, rcsrc,ext2):
        pub = Public()
        math = pu.Data()
        aa = math.cut_data(aa1, 'aplay')
        data1, errdata1 = pub.diff_pub(aa[0], uuid)
        if data1['ext1'] == 'search':
            data1.pop('ext1')
        if data1['ext2'] == ext2:
            data1.pop('ext2')
        if data1['ext4'] == '0':
            data1.pop('ext4')
        data, errdata2 = self.demandaplay(data1, sovid, vid, plid, soplid, cid, ap, pt, def1, lid, bid, tid, pay, istry, isrc, rcsrc)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def diff_demandaplay(self, aa1, uuid,sovid, vid, plid, soplid, cid, ap, pt, def1, lid, bid, tid, pay, istry, isrc, rcsrc):
        pub = Public()
        math = pu.Data()
        aa = math.cut_data(aa1, 'aplay')
        data1, errdata1 = pub.diff_pub(aa[0], uuid)
        if data1['ext4'] == '0':
            data1.pop('ext4')
        data, errdata2 = self.demandaplay(data1, sovid, vid, plid, soplid, cid, ap, pt, def1, lid, bid, tid, pay, istry, isrc, rcsrc)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def diff_tvaplay(self, aa1, uuid,sovid, vid, plid, soplid, cid, ap, pt, def1, lid, bid, tid, pay, istry, isrc, rcsrc):
        pub = Public()
        math = pu.Data()
        aa = math.cut_data(aa1, 'aplay')
        data1, errdata1 = pub.diff_pub(aa[0], uuid)
        data, errdata2 = self.demandaplay(data1, sovid, vid, plid, soplid, cid, ap, pt, def1, lid, bid, tid, pay, istry, isrc, rcsrc)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def demandaplay(self, aa, sovid, vid, plid, soplid, cid, ap, pt, def1, lid, bid,tid,pay,istry,isrc,rcsrc):
        errdata = {}
        if "act" in aa:
            if aa["act"] != 'aplay':
                errdata['act'] = aa["act"]
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'

        if "bid" in aa:
            if aa["bid"] != bid:
                errdata['bid'] = aa["bid"]
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'

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

        if "ref" in aa:
            aa.pop("ref")
        else:
            errdata['ref'] = 'no_field'
            
        if "td" in aa:
            if aa["td"] == None:
                errdata['td'] = aa["td"]
            aa.pop("td")
        else:
            errdata['td'] = 'no_field'
            
        if "url" in aa:
            if aa["url"]== None:
                errdata['url'] = aa["url"]
            aa.pop("url")
        else:
            errdata['url'] = 'no_field'
            
        if "vid" in aa:
            if aa["vid"] != vid:
                errdata['vid'] = aa["vid"]
            aa.pop("vid")
        else:
            errdata['vid'] = 'no_field'
        if "sovid" in aa:
            if aa["sovid"] != sovid:
                errdata['sovid'] = aa["sovid"]
            aa.pop("sovid")
        else:
            errdata['sovid'] = 'no_field'    
        if "plid" in aa:
            if aa["plid"] != plid:
                errdata['plid'] = aa["plid"]
            aa.pop("plid")
        else:
            errdata['plid'] = 'no_field'
        if "soplid" in aa:
            if aa["soplid"] != soplid:
                errdata['soplid'] = aa["soplid"]
            aa.pop("soplid")
        else:
            errdata['soplid'] = 'no_field'
        if "cid" in aa:
            if aa["cid"] != cid:
                errdata['cid'] = aa["cid"]
            aa.pop("cid")
        else:
            errdata['cid'] = 'no_field'
        
        if "pver" in aa:
            if aa["pver"] != 'arcsoft':
                errdata['pver'] = aa["pver"]
            aa.pop("pver")
        else:
            errdata['pver'] = 'no_field'
            
        if "tid" in aa:
            if aa["tid"] != tid:
                errdata['tid'] = aa["tid"]
            aa.pop("tid")
        else:
            errdata['cf'] = 'no_field'
            
        if "purl" in aa:
            if aa["purl"] == None:
                errdata['purl'] = aa["purl"]
            aa.pop("purl")
        else:
            errdata['purl'] = 'no_field'  
            
        if "ap" in aa:
            if aa["ap"] != ap:
                errdata['ap'] = aa["ap"]
            aa.pop("ap")
        else:
            errdata['ap'] = 'no_field'

        if "pt" in aa:
            if aa["pt"] != pt:
                errdata['pt'] = aa["pt"]
            aa.pop("pt")
        else:
            errdata['pt'] = 'no_field'

        if "pay" in aa:
            if aa["pay"] != pay:
                errdata['pay'] = aa["pay"]
            aa.pop("pay")
        else:
            errdata['pay'] = 'no_field'
        if "lid" in aa:
            if aa["lid"] != lid:
                errdata['lid'] = aa["lid"]
            aa.pop("lid")
        else:
            errdata['lid'] = 'no_field'
            
        if "def" in aa:
            if aa["def"] != def1:
                errdata['def'] = aa["def"]
            aa.pop("def")
        else:
            errdata['def'] = 'no_field'

        if "istry" in aa:
            if aa["istry"] != istry:
                errdata['istry'] = aa["istry"]
            aa.pop("istry")
        else:
            errdata['istry'] = 'no_field'
        if "cdnip" in aa:
            aa.pop("cdnip")
        else:
            errdata['cdnip'] = 'no_field'

        if "isrc" in aa:
            if aa["isrc"] != isrc:
                errdata['isrc'] = aa["isrc"]
            aa.pop("isrc")
        else:
            errdata['isrc'] = 'no_field'
        if "rcsrc" in aa:
            if aa["rcsrc"] != rcsrc:
                errdata['rcsrc'] = aa["rcsrc"]
            aa.pop("rcsrc")
        else:
            errdata['rcsrc'] = 'no_field'
        if "suuid" in aa:
            if len(aa["suuid"]) != 36:
                errdata['suuid'] = aa["suuid"]
            aa.pop("suuid")
        else:
            errdata['suuid'] = 'no_field'
        return(aa, errdata)   
    def liveaplay(self,aa,vid,sovid,plid, soplid, cid,tid,lid,pay,ext2,ext5):
        errdata = {}
        if "act" in aa:
            if aa["act"] != 'aplay':
                errdata['act'] = aa["act"]
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'

        if "bid" in aa:
            if aa["bid"] != '2.1.1.1':
                errdata['bid'] = aa["bid"]
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
        
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
        if "vid" in aa:
            if aa["vid"] != vid:
                errdata['vid'] = aa["vid"]
            aa.pop("vid")
        else:
            errdata['vid'] = 'no_field'
        if "sovid" in aa:
            if aa["sovid"] != sovid:
                errdata['sovid'] = aa["sovid"]
            aa.pop("sovid")
        else:
            errdata['sovid'] = 'no_field'    
        if "plid" in aa:
            if aa["plid"] != plid:
                errdata['plid'] = aa["plid"]
            aa.pop("plid")
        else:
            errdata['plid'] = 'no_field'
        if "soplid" in aa:
            if aa["soplid"] != soplid:
                errdata['soplid'] = aa["soplid"]
            aa.pop("soplid")
        else:
            errdata['soplid'] = 'no_field'
        if "cid" in aa:
            if aa["cid"] != cid:
                errdata['cid'] = aa["cid"]
            aa.pop("cid")
        else:
            errdata['cid'] = 'no_field'
        
        if "pver" in aa:
            if aa["pver"] != 'arcsoft':
                errdata['pver'] = aa["pver"]
            aa.pop("pver")
        else:
            errdata['pver'] = 'no_field'
            
        if "tid" in aa:
            if aa["tid"] != tid:
                errdata['tid'] = aa["tid"]
            aa.pop("tid")
        else:
            errdata['tid'] = 'no_field'
            
        if "purl" in aa:
            if aa["purl"] == None:
                errdata['purl'] = aa["purl"]
            aa.pop("purl")
        else:
            errdata['purl'] = 'no_field'  
            
        if "ap" in aa:
            if aa["ap"] != 1:
                errdata['ap'] = aa["ap"]
            aa.pop("ap")
        else:
            errdata['ap'] = 'no_field'

        if "pt" in aa:
            if aa["pt"] != 4:
                errdata['pt'] = aa["pt"]
            aa.pop("pt")
        else:
            errdata['pt'] = 'no_field'

        if "pay" in aa:
            if aa["pay"] != pay:
                errdata['pay'] = aa["pay"]
            aa.pop("pay")
        else:
            errdata['pay'] = 'no_field'
        if "lid" in aa:
            if aa["lid"] != lid:
                errdata['lid'] = aa["lid"]
            aa.pop("lid")
        else:
            errdata['lid'] = 'no_field'
            
        if "def" in aa:
            if aa["def"] != 1:
                errdata['def'] = aa["def"]
            aa.pop("def")
        else:
            errdata['def'] = 'no_field'

        if "suuid" in aa:
            if len(aa["suuid"]) != 36:
                errdata['suuid'] = aa["suuid"]
            aa.pop("suuid")
        else:
            errdata['suuid'] = 'no_field'
        if 'ext1' in aa:
            if aa['ext1'] != 'schema':
                errdata['ext1'] = aa["ext1"]
            aa.pop('ext1')
        else:
            errdata['ext1'] = 'no_field'
        if 'ext2' in aa:
            if aa['ext2'] != ext2:
                errdata['ext2'] = aa["ext2"]
            aa.pop('ext2')
        else:
            errdata['ext2'] = 'no_field'
        if 'ext3' in aa:
            if aa['ext3'] != 'concertPlayer':
                errdata['ext3'] = aa["ext3"]
            aa.pop('ext3')
        else:
            errdata['ext3'] = 'no_field'
            
        if 'ext4' in aa:
            if aa['ext4'] != 'concertPlayer':
                errdata['ext4'] = aa["ext4"]
            aa.pop('ext4')
        else:
            errdata['ext4'] = 'no_field'
        if 'ext5' in aa:
            if aa['ext5'] != ext5:
                errdata['ext5'] = aa["ext5"]
            aa.pop('ext5')
        else:
            errdata['ext5'] = 'no_field'
        return(aa, errdata)
class heartbeat(object):
    def diff_heartbeat(self, aa1, uuid,vid, sovid, plid, soplid, cid, ap, pt, def1, cf,pay,istry,ref,ln):
        math = pu.data()
        Public1 = Public()
        aa = math.cut_recommdata(aa1, 'heartbeat')
        data1, errdata1 = Public1.diff_pub(aa[0], uuid)
        data, errdata2 = self.heartbeat(data1, vid, sovid, plid, soplid, cid, ap, pt, def1, cf, pay, istry, ref, ln)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data, errdata)
    def heartbeat(self, aa, vid, sovid, plid, soplid, cid, ap, pt, def1, cf,pay,istry,ref,ln):
        errdata = {}
        # 1 act
        if "act" in aa:
            if aa["act"] != 'heartbeat':
                errdata['act'] = aa["act"]
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'
        # 2  bid
        if "bid" in aa:
            if aa["bid"] != '2.1.1':
                errdata['bid'] = aa["bid"]
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
        # 3 idx
        if "idx" in aa:
            if aa["idx"] == None:
                errdata['idx'] = aa["idx"]
            aa.pop("idx")
        else:
            errdata['idx'] = 'no_field'
        # 4 ct
        if "ct" in aa:
            if aa["ct"] == None:
                errdata['ct'] = aa["ct"]
            aa.pop("ct")
        else:
            errdata['et'] = 'no_field'
        # 5 et
        if "et" in aa:
            if aa["et"] == None:
                errdata['et'] = aa["et"]
            aa.pop("et")
        else:
            errdata['et'] = 'no_field'
        # 6 td
        if "td" in aa:
            if aa["td"] == None:
                errdata['td'] = aa["td"]
            aa.pop("td")
        else:
            errdata['td'] = 'no_field'
        # 7 suuid
        if "suuid" in aa:
            if len(aa["suuid"]) != 36:
                errdata['suuid'] = aa["suuid"]
            aa.pop("suuid")
        else:
            errdata['suuid'] = 'no_field'
        # 8 url
        if "url" in aa:
            if aa["url"] == None:
                errdata['url'] = aa["url"]
            aa.pop("url")
        else:
            errdata['url'] = 'no_field'
        # 9 vid
        if "vid" in aa:
            if aa["vid"] != vid:
                errdata['vid'] = aa["vid"]
            aa.pop("vid")
        else:
            errdata['vid'] = 'no_field'
        # 10 sovid
        if "sovid" in aa:
            if aa["sovid"] != sovid:
                errdata['sovid'] = aa["sovid"]
            aa.pop("sovid")
        else:
            errdata['sovid'] = 'no_field'
        # 11 plid
        if "plid" in aa:
            if aa["plid"] != plid:
                errdata['plid'] = aa["plid"]
            aa.pop("plid")
        else:
            errdata['plid'] = 'no_field'
        # 12 soplid
        if "soplid" in aa:
            if aa["soplid"] != soplid:
                errdata['soplid'] = aa["soplid"]
            aa.pop("soplid")
        else:
            errdata['soplid'] = 'no_field'
        # 13 cid
        if "cid" in aa:
            if aa["cid"] != cid:
                errdata['cid'] = aa["cid"]
            aa.pop("cid")
        else:
            errdata['cid'] = 'no_field'
        # 14 purl
        if "purl" in aa:
            if aa["purl"] == None:
                errdata['purl'] = aa["purl"]
            aa.pop("purl")
        else:
            errdata['purl'] = 'no_field'
        # 15 ap
        if "ap" in aa:
            if aa["ap"] != ap:
                errdata['ap'] = aa["ap"]
            aa.pop("ap")
        else:
            errdata['ap'] = 'no_field'
        # 16 pt
        if "pt" in aa:
            if aa["pt"] != pt:
                errdata['pt'] = aa["pt"]
            aa.pop("pt")
        else:
            errdata['pt'] = 'no_field'
        # 17 pay
        if "pay" in aa:
            if aa["pay"] != pay:
                errdata['pay'] = aa["pay"]
            aa.pop("pay")
        else:
            errdata['pay'] = 'no_field'
        # 18 def
        if "def" in aa:
            if aa["def"] != def1:
                errdata['def'] = aa["def"]
            aa.pop("def")
        else:
            errdata['def'] = 'no_field'
        # 19 istry
        if "istry" in aa:
            if aa["istry"] !=istry:
                errdata['istry'] = aa["istry"]
            aa.pop("istry")
        else:
            errdata['istry'] = 'no_field'
        # 20 ref
        if "ref" in aa:
            if aa["ref"] != ref:
                errdata['ref'] = aa["ref"]
            aa.pop("ref")
        else:
            errdata['ref'] = 'no_field'
        # 21 cf
        if "cf" in aa:
            if aa["cf"] != cf:
                errdata['cf'] = aa["cf"]
            aa.pop("cf")
        else:
            errdata['cf'] = 'no_field'
        # 22 vts
        if "vts" in aa:
            aa.pop("vts")
        else:
            errdata['vts'] = 'no_field'
        # 23 lcid
        if "lcid" in aa:
            aa.pop("lcid")
        else:
            errdata['lcid'] = 'no_field'
        # 24 sourceid
        if "sourceid" in aa:
            aa.pop("sourceid")
        else:
            errdata['sourceid'] = 'no_field'
        # 25 streamid
        if "streamid" in aa:
            aa.pop("streamid")
        else:
            errdata['streamid'] = 'no_field'
        # 26 ln
        if "ln" in aa:
            if aa["ln"] != ln:
                errdata['ln'] = aa["ln"]
            aa.pop("ln")
        else:
            errdata['ln'] = 'no_field'
        return(aa, errdata)
class pv(object):
    def diff_pv(self, aa1, typ, uuid, act,desc):
        Public1 = Public()
        da1=pu.data()
        aa=da1.cut_recommdata(aa1, act)
        daa,count=da1.re_play(aa)
        data1, errdata1 = Public1.diff_pub(daa[typ], uuid)
        data, errdata2 = self.pv(data1, typ, act,desc)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data, errdata) 
    def pv(self, aa, typ, act,desc):
        errdata = {}
        if "bid" in aa:
            if  aa["bid"] != '2.2.1':
                errdata['bid'] = aa["bid"]
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
            
        if "act" in aa:
            if  aa["act"] != act:
                errdata['act'] = aa["act"]
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'
        
        if "type" in aa:
            if  aa["type"] != typ:
                errdata['type'] = aa["type"]
            aa.pop("type")
        else:
            errdata['type'] = 'no_field'
            
        if "desc" in aa:
            if  aa["desc"] !=desc:
                errdata['desc'] = aa["desc"]
            aa.pop("desc")
        else:
            errdata['desc'] = 'no_field'   
        return(aa, errdata)
class schema(object):
    def diff_schema(self, aa1, ext2, ext5, uuid):
        Public1 = Public()
        math = pu.data()
        aa = math.cut_recommdata(aa1, 'schema')
        data1, errdata1 = Public1.diff_pub(aa[0], uuid)
        data, errdata2 = self.schema(data1, ext2, ext5)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata) 
    def schema(self, aa, ext2, ext5):
        errdata = {}
        if "bid" in aa:
            if  aa["bid"] != '2.1.11':
                errdata['bid'] = aa["bid"]
            aa.pop("bid")
        else:
            errdata['bid'] = 'no_field'
        if "act" in aa:
            if  aa["act"] != 'schema':
                errdata['act'] = aa["act"]
            aa.pop("act")
        else:
            errdata['act'] = 'no_field'
            
        if "ext1" in aa:
            if aa["ext1"] != 'schema':
                errdata['ext1'] = aa["ext1"]
            aa.pop("ext1")
        else:
            errdata['ext1'] = 'no_field'
        
        if "ext2" in aa:
            if aa["ext2"] != ext2:
                errdata['ext2'] = aa["ext2"]
            aa.pop("ext2")
        else:
            errdata['ext2'] = 'no_field'
            
        if "ext3" in aa:
            if aa["ext3"] != 'concertPlayer':
                errdata['ext3'] = aa["ext3"]
            aa.pop("ext3")
        else:
            errdata['ext3'] = 'no_field'
        
        if "ext4" in aa:  
            if aa["ext4"] != '0':
                errdata['ext4'] = aa["ext4"]
            aa.pop("ext4")
        else:
            errdata['ext4'] = 'no_field'
            
        if "ext5" in aa:  
            if aa["ext5"] != ext5:
                errdata['ext5'] = aa["ext5"]
            aa.pop("ext5")
        else:
            errdata['ext4'] = 'no_field'
        return(aa, errdata)
class Push(object):
    def diff_push(self,uuid,app,switchapp,switchglobal,action):
        data=pu.data()
        da=data.cut_recommdata('D:\\Auto_android\\data\\log_mpns')
        count,aa = self.cut_data(da, action)
        data,errdata=self.push(aa[0], uuid, app, switchapp, switchglobal, action)
        return(data,errdata)
    def push(self,aa,uuid,app,switchapp,switchglobal,action):
        errdata={}
        Publi=Public()
        if 'time' in aa:
            if Publi.time(aa['time'])=='fail':
                errdata['time']=aa['time']
            aa.pop('time')
        else:
            errdata['time'] = 'no_field'
            
        if 'uuid' in aa:
            if Publi.uuid(aa['uuid'],uuid)=='fail':
                errdata['uuid']=aa['uuid']
            aa.pop('uuid')
        else:
            errdata['uuid'] = 'no_field'
            
        if 'guid' in aa:
            if Publi.guid(aa['guid'])=='fail':
                errdata['guid']=aa['guid']
            aa.pop('guid')
        else:
            errdata['guid'] = 'no_field'
            
        if 'ch' in aa:
            if Publi.ch(aa['ch'])=='fail':
                errdata['ch']=aa['ch']
            aa.pop('ch')
        else:
            errdata['ch'] = 'no_field' 
            
        if 'mod' in aa:
            if Publi.mod(aa['mod'])=='fail':
                errdata['mod']=aa['mod']
            aa.pop('mod')
        else:
            errdata['mod'] = 'no_field' 
            
        if 'mf' in aa:
            if Publi.mf(aa['mf'])=='fail':
                errdata['mf']=aa['mf']
            aa.pop('mf')
        else:
            errdata['mf'] = 'no_field' 
            
        if 'os' in aa:
            if Publi.sver(aa['os'])=='fail':
                errdata['os']=aa['os']
            aa.pop('os')
        else:
            errdata['act'] = 'no_field'
            
        if 'app' in aa:
            if aa['app']!=app:
                errdata['app']=aa['app']
            aa.pop('app')
        else:
            errdata['app'] = 'no_field'
            
        if 'seqid' in aa:
            if len(aa['seqid'])!=36:
                errdata['seqid']=aa['seqid']
            aa.pop('seqid')
        else:
            errdata['seqid'] = 'no_field'      
        
        if 'type' in aa:
            if aa['type']!='aphone':
                errdata['type']=aa['type']
            aa.pop('type')
        else:
            errdata['type'] = 'no_field'     
            
        if 'switchapp' in aa:
            if aa['switchapp']!=switchapp:
                errdata['switchapp']=aa['switchapp']
            aa.pop('switchapp')
        else:
            errdata['switchapp'] = 'no_field'   

        if 'cid' in aa:
            if len(aa['cid'])!=32:
                errdata['cid']=aa['cid']
            aa.pop('cid')
        else:
            errdata['cid'] = 'no_field' 
            
        if 'switchglobal' in aa:
            if aa['switchglobal']!=switchglobal:
                errdata['switchglobal']=aa['switchglobal']
            aa.pop('switchglobal')
        else:
            errdata['switchglobal'] = 'no_field' 
            
        if 'action' in aa:
            if aa['action']!=action:
                errdata['action']=aa['action']
            aa.pop('action')
        else:
            errdata['action'] = 'no_field'
        if '_elapsed' in aa:
            aa.pop('_elapsed')
        else:
            errdata['_elapsed'] = 'no_field' 
        return(aa, errdata)  
 
    def cut_data(self,data,action):
        line=[]
        count={}
        if len(data)!=0:
            for i in range(0,len(data)):
                if data[i].get('action')!=None:
                    da=data[i]
                    if da['action'] in count:
                            count[da["action"]]+=1
                    else:
                            count[da["action"]]=1
                if data[i].get('action')==action:
                    line.append(data[i])
        return(count,line)

    def  Push_switch(self):
        #红米note
        if device=='49c55e58':
            start_x=610
            end_x=690
            y=975
            return(start_x,y,end_x)
        elif device=='MSM8926':
            start_x=610
            end_x=690
            y=975
            return(start_x,y,end_x)
        #sanxing
        elif device=='4d00aa165f5d40ad':
            start_x=900
            end_x=1030
            y=1470    
            return(start_x,y,end_x)
        elif device=='750ABKLWYTRV':
            start_x=975
            end_x=1100
            y=1530    
            return(start_x,y,end_x)
        elif device=='5fc4bc89':
            start_x=610
            end_x=690
            y=980 
            return(start_x,y,end_x)   
        #o
        elif device=='dd510d8f':
            start_x=900
            end_x=1000
            y=1470
            return(start_x,y,end_x)   
        #
        elif device=='6S8LIJQK7TD6AYFU':
            start_x=610
            end_x=690
            y=980
            return(start_x,y,end_x)  
        elif device=='Coolpad8750-0x1a3b142':
            start_x=610
            end_x=690
            y=980
            return(start_x,y,end_x)  
        elif device=='022AQQ2139015290':
            start_x=610
            end_x=690
            y=980
            return(start_x,y,end_x) 
        #vivo xplay
        elif device=='1459b93f':
            start_x=1200
            end_x=1350
            y=1950
            return(start_x,y,end_x) 
        elif device=='PJQDU15924008380':
            start_x=900
            end_x=1020
            y=1475
            return(start_x,y,end_x)
