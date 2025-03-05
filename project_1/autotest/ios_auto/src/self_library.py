# coding:utf-8
import library.adplay as adplay
import library.public as pub
import library.aplay as aplay
import library.ad as ad
import library.cdn as cdn
import library.search as search
import library.pvsource as pvsource
import library.pay as pay
import library.share as share
import library.recommend as recommend

def check_result(field,platform,test_point,field_table,act_count):
    import urllib
    import urllib2
    test_data = {}
    test_data['field']=field
    test_data['platform']=platform
    test_data['test_point']=test_point
    test_data['field_table']=field_table
    test_data['act_count']=act_count
    test_data_urlencode = urllib.urlencode(test_data)
    #requrl = "http://172.31.28.129:80/test"
    requrl = "http://192.168.8.239:80/test"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    res=eval(res)
    return(res)
def delete(platform):
    import urllib
    import urllib2
    test_data = {}
    test_data['platform']=platform
    test_data_urlencode = urllib.urlencode(test_data)
    requrl = "http://192.168.8.239:80/delete"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    return(res)
    
#print(check_result('act', 'dianbo_001', 'mpp_aplay_data',1))
def delete_data():
    """清除数据表get_data数据
                传入参数：
                无
                返回值：
                无    
    """
    pu=pub.sqlite()
    return(pu.delete_data())

def report_time(host,field,field_value):
    """count字典中对应act是否存在
                传入参数：
                host：事件host
                field：以什么字段分割数据
                field_value：对应字段值用来取数据
                返回值：
                成功标示：1-达到预期，0-未达到预期
                校验信息：当标示为1时，返回空，当标示为0时，返回count
    """
    pu=pub.sqlite()
    count=pu.cut_count(host, field)
    if len(count)!=0:
        if field_value in count:
            return(1,'')
        else:
            return(0,count)
    else:
        return(0,'not data report')
    
def report_number(host,field,field_value,act_count,all):
    """count字典中对应act条数和总条数是否正确
                  传入参数：
                host：事件host
                field_value：对应字段值用来取数据
                act_count：act上报条数
                all：count字典包含条数
                  返回值：
                成功标示：1-达到预期，0-未达到预期
                校验信息：当标示为1时，返回空，当标示为0时，返回count
    """
    pu=pub.sqlite()
    count=pu.cut_count(host, field)
    all1=int(all)
    act_count=int(act_count)
    if field_value in count:
        if count[field_value]==act_count and len(count)==all1:
            return(1,'')
        else:
            return(0,count)
    else:
        return(0,'not data report')
    
def field(host,field,field_value,field_table,field_public=None):
    """字段校验函数，校验上报数据字段名是否正确
                  传入参数：
                host：事件host
                field：以field字段名分割数据
                field_value：对应字段值用来取数据
                field_table：私有字段数据表名
                field_public：公共字段数据表名。默认为空
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段list
    """
    sq=pub.sqlite()
    data=sq.cut_data(host, field)
    da=pub.data()
    errdata=da.field_verification(data[field_value][0], field_table, field_public)
    if len(errdata['redundant'])==0 and len(errdata['missing'])==0:
        return(1,'')
    else:
        return(0,errdata)

def diff_adplay(test_point, public_point):
    """ adplay字段值校验函数
                  传入参数：
                test_point:需要对比的数据标识，对应数据库config_adplay表里test_point字段值
                public_point:公共字段测试点，对应config_adplay_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """ 
    pvs=adplay.adplay()
    data=pvs.diff_adplay(test_point, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)

def diff_aplay(test_point,public_point):
    """ adplay字段值校验函数
                  传入参数：
                test_point:需要对比的数据标识，对应数据库config_aplay表里test_point字段值
                public_point:公共字段测试点，对应config_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """
    ap=aplay.aplay
    data=ap.diff_adplay(test_point, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)

def diff_minevent(act, type,public_point):
    """ adplay字段值校验函数
                  传入参数：
                act：上报事件名称
                type:上报事件type值
                public_point:公共字段测试点，对应config_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """
    mi=aplay.Min_event()
    data=mi.diff_event(act, type, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)

def diff_search(act_value, test_point, data_table, public_point):
    """ search,view,click字段值校验函数
                  传入参数：
                act_value：上报事件名
                test_point:要对比的数据标识，对应数据库config_XX表里test_point字段值
                data_table:要对比的数据表，对应数据库config_XX表
                public_point:公共字段测试点，对应config_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """
    se=search.search()
    data=se.diff_search(act_value, test_point, data_table, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)

def diff_pvsource(test_point, public_point):
    """ pvsource字段值校验函数
                  传入参数：
                test_point:需要对比的数据标识，对应数据库config_pvsource表里test_point字段值
                public_point:公共字段测试点，对应config_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """ 
    pvs=pvsource.pvsource()
    data=pvs.diff_pvs(test_point, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)

def diff_share(test_point, public_point):
    """ share字段值校验函数
                  传入参数：
                test_point:需要对比的数据标识，对应数据库config_pvsource表里test_point字段值
                public_point:公共字段测试点，对应config_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """ 
    pvs=share.share()
    data=pvs.diff_share(test_point, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)
   
def diff_pay(act_value, test_point, data_table, public_point):
    """ pay(vip,bug,result,order)字段值校验函数
                  传入参数：
                act_value：上报事件名
                test_point:要对比的数据标识，对应数据库config_XX表里test_point字段值
                data_table:要对比的数据表，对应数据库config_XX表
                public_point:公共字段测试点，对应config_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """
    se=pay.pay()
    data=se.diff_pay(act_value, test_point, data_table, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)
    
def diff_recommend(act_value, test_point, data_table, public_point):
    """ recommend字段值校验函数
                  传入参数：
                act_value：上报事件名
                test_point:要对比的数据标识，对应数据库config_XX表里test_point字段值
                data_table:要对比的数据表，对应数据库config_XX表,hot pv和userpv使用config_recommend表，relatepv和interestpv使用config_recommend_表
                public_point:公共字段测试点，对应config_public表里test_point字段值
                  返回值：
                成功标示：1：data为空，0：data不为空
                校验信息：当标示为1时，返回空，当标示为0时，返回有错误的字段dict
    """
    se=recommend.recommend()
    data=se.diff_recommend(act_value, test_point, data_table, public_point)
    if len(data)==0:
        return(1,'')
    else:
        return(0,data)
    

def diff_ad(uuid, b, ss, cpp, cc, e, v, ci):
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
    a=ad.log_da()
    return(a.diff_da(uuid, b, ss, cpp, cc, e, v, ci))
    
def cdn_three_fieldvalue(s, test_point):
    """ cdn三层字段值校验函数
                  传入参数：
                s:当前上报的第几层
                test_point:测试点，对应数据库config_cdn_three表里面test_point列值
                  返回值：
                errdata:有异常的字段值字典
    """
    c=cdn.v2_log()
    errdata=c.cdn_three_fieldvalue(s, test_point)
    return(errdata)
    