# coding:utf-8
import os
import function.public as pub
import function.pvsource as pvs
import function.pay as pa
import function.cdn as cdn
import function.search as search
import function.recommend as recommend
import function.ad as ad

def get_data():
    """获取本次操作上报数据条数count字典，字段data字典"""
    pu=pub.sqlite()
    return(pu.get_data())

def delete_data():
    pu=pub.sqlite()
    return(pu.delete_data())

def report_time(act,count):
    """数据是否上报验证，对应act数据如果上报则返回pass 否则返回fail和数据列表count"""
    if len(count)!=0:
        if act in count:
            return(1,'')
        else:
            return(0,count)
    else:
        return(0,'not data report')
    
def report_number(act,count,act_count,all):
    """数据上报条数1条验证，对应act数据如果上报对应条数则返回pass 否则返回fail和数据列表count"""
    all=int(all)
    act_count=int(act_count)
    if act in count:
        if count[act]==act_count and len(count)==all:
            return(1,'')
        else:
            return(0,count)
    else:
        return(0,'not data report')
    
def field(data):
    """判断传入字典data是否有值，以此来判断是否有错误字段，没有错误字段返回（1，‘’），包含有错误字段返回(0,data)"""
        
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)

def diff_down_v2log(path,s,f,t,h,e,hi,hf,a,c,si,z):
    """cdn下载三层数据上报校验脚本，返回多余字段集合data和错误字段值集合errdata"""
    diff=cdn.v2_log()
    return(diff.diff_download_v2_log(path,s,f,t,h,e,hi,hf,a,c,si,z))
def diff_v2_log(path,s,f,t,h,e,hi,hf,ex):
    """cdn播放三层数据上报校验脚本，返回多余字段集合data和错误字段值集合errdata"""
    
    diff=cdn.v2_log()
    return(diff.diff_v2_log(path,s,f,t,h,e,hi,hf,ex))

def diff_pvsource(uuid, fpn, fpid, cpn, cpid, cid, plid):
    """pvsource数据上报校验脚本，返回多余字段集合data和错误字段值集合errdata"""
    
    diff=pvs.PvSource()
    return(diff.diff_pvsource(uuid, fpn, fpid, cpn, cpid, cid, plid))

def diff_entry(uuid,act,def1,pagename,pver,vid=None,sovid=None,plid=None,soplid=None,cid=None,lcid=None,isad=None,pt=None):
    p=pa.Pay()
    return(p.diff_entry(uuid,vid,sovid,plid,soplid,cid,lcid,act,isad,pt,def1,pagename,pver))

def diff_order(uuid,p, c, o, vid, sovid):
    p=pa.Pay()
    return(p.diff_order(uuid,p, c, o, vid, sovid))

def diff_result(path,uuid,r, o, vid, sovid):
    p=pa.Pay()
    return(p.diff_result(uuid,r, o, vid, sovid))

def diff_search1(uuid,input1, has,page,h,suggest,suggestidx):
    """搜索1数据上报校验脚本，返回多余字段集合data和错误字段值集合errdata"""
        
    diff=search.search_1()
    return(diff.diff_search1(uuid,input1, has,page,h,suggest,suggestidx))

def diff_search_view(uuid, lastquery, query,page,collcnt,shortcnt,cids,vids):
    """search_view数据上报校验脚本，返回多余字段集合data和错误字段值集合errdata"""
        
    diff=search.search_1()
    return(diff.diff_view(uuid,lastquery,query,page,collcnt,shortcnt,cids,vids))
    
def diff_search_click(uuid,query,tp,is_star):
    """search_click数据上报校验脚本，返回多余字段集合data和错误字段值集合errdata"""
    
    diff=search.search_1()
    return(diff.diff_click(uuid,query,tp,is_star))

def diff_recommend(act, uuid, region, videoid):
    """推荐数据校验函数"""
    diff=recommend.recommend()
    return(diff.diff_recommend(act, uuid, region, videoid))


def get_log_da_data():
    """ 获取广告上报文件的数据，返回上报数据个数集合count，上报数据集合data"""
    
    listfile = os.listdir('D:\\\Auto_android\\data\\log_da') 
    data = {}
    count = {}
    for line in listfile:
        aa = open('D:\\\Auto_android\\data\\log_da\\' + line, 'U').readlines()
        cc = {}
        da = aa[0].split('&')
        for i in range(0, len(da)):
            ta = da[i].split('=')
            cc[ta[0]] = ta[1]
        if cc['ty'] == 'e':
            data['ty'] = cc
            if 'ty' in count:
                count['ty'] += 1
            else:
                count['ty'] = 1
        elif cc['ty'] == 'p':
            data[cc['e']] = cc
            if cc['e']  in count:
                count[cc['e']] += 1
            else:
                count[cc['e']] = 1
    return(count, data)

def open_l(data):
    """分析data数据，返回l中s、cp、c集合"""
    
    l = data['l']
    aa = l.split('%7C')
    bb = {}
    s = []
    cp = []
    c = []
    for i in range(0, len(aa)):
        bb[i] = aa[i].split('%2C')
        ad = bb[i]
        s.append(ad[0])
        cp.append(ad[1])
        c.append(ad[2])
    return(s, cp, c)

def diff_log_da(data, uuid, ss, cpp, cc, e, v, ci):
    """广告数据上报校验脚本，返回多余字段集合data和错误字段值集合errdata"""
    
    diff=ad.log_da()
    return(diff.diff_da(data, uuid, ss, cpp, cc, e, v, ci))

def write_l(s,cp,c):
    
    aa=open('D:\\\Auto_android\\data\\para.txt','w')
    for line in s:
        aa.writelines(line)
        aa.writelines(' ')
    aa.writelines('\n')
    for line in cp:
        aa.writelines(line)
        aa.writelines(' ')
    aa.writelines('\n')
    for line in c:
        aa.writelines(line)
        aa.writelines(' ')
    aa.close()

def read_l():
    aa=open('D:\\\Auto_android\\data\\para.txt','U')
    cc=aa.readlines()
    s=cc[0].split(' ')
    cp=cc[1].split(' ')
    c=cc[2].split(' ')
    aa.close()
    return(s,cp,c)

def err_ad_number(path):
    err=ad.err_da()
    data=err.get_log_da_data(path)
    if len(data)!=0:
        return(1,'')
    else:
        return(0,len(data))
def err_ad_time(path,ma):
    ma=int(ma)
    err=ad.err_da()
    data=err.get_log_da_data(path)
    if len(data)==ma:
        return(1,'')
    else:
        return(0,len(data))
def diff_errda(path,uuid,code, s, cp, c, o,ci,v):
    err=ad.err_da()
    return(err.diff_errda(path,uuid,code, s, cp, c, o,ci,v))