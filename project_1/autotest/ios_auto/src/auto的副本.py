
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


def delete_data(platform):
    import urllib
    import urllib2
    test_data = {}
    test_data['platform']=platform
    test_data_urlencode = urllib.urlencode(test_data)
    #requrl = "http://172.31.28.104:80/delete"
    requrl = "http://192.168.8.239:80/delete"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    return(res)

def request_result(test_point,interface_table,interface_data):
    import urllib
    import urllib2
    test_data = {}
    test_data['test_point']=test_point
    test_data['interface_table']=interface_table
    test_data['interface_data']=interface_data
    test_data_urlencode = urllib.urlencode(test_data)
    requrl = "http://172.31.28.75:80/request"
    #requrl = "http://192.168.8.239:80/test"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    res=eval(res)
    return(res)

def insert_cdn_config(config):
    import urllib
    import urllib2
    test_data={}
    test_data['platform']=config
    test_data_urlencode = urllib.urlencode(test_data)
    #requrl = "http://172.31.64.204:80/insert"
    requrl = "http://192.168.8.239:80/insert"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    return(res)

#interface_data={'a':1,'b':2}
#print(request_result('10000','mpp_interface',interface_data))

#print(check_result({'act':'pvs'}, 'ipad', 'search_001', 'mpp_pvs_ipad', 1))
