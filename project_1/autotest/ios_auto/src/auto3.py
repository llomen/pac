# coding:utf-8
def check_result(field,platform,test_point,field_table,act_count):
    import urllib
    import urllib2
    import time
    test_data = {}
    test_data['field']=field
    test_data['platform']=platform
    test_data['test_point']=test_point
    test_data['field_table']=field_table
    test_data['act_count']=act_count
    test_data_urlencode = urllib.urlencode(test_data)
    #requrl = "http://172.31.64.179:80/test"
    requrl = "http://10.200.131.140:80/test"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    res=eval(res)
        #if res['count'][1]=='not data report':
        #time.sleep(3)
        #print "not data report,sleep 3s,retry"
        #req = urllib2.Request(url = requrl,data =test_data_urlencode)
        #res_data = urllib2.urlopen(req)
        #res = res_data.read()
        #res=eval(res)
    return(res)

def delete_data(platform):
    import urllib
    import urllib2
    test_data = {}
    test_data['platform']=platform
    test_data_urlencode = urllib.urlencode(test_data)
    #requrl = "http://172.31.28.104:80/delete"
    requrl = "http://10.200.131.140:80/delete"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    return(res)

def delete_cdn():
    import urllib
    import urllib2
    test_data = {}
    test_data_urlencode = urllib.urlencode(test_data)
    #requrl = "http://172.31.64.186:80/cdndelete"
    requrl = "http://10.200.131.140:80/cdndelete"
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
    #requrl = "http://172.31.64.179:80/request"
    requrl = "http://10.200.131.140:80/test"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    res=eval(res)
    return(res)

def insert_cdn_config(platform):
    import urllib
    import urllib2
    test_data={}
    test_data['platform']=platform
    test_data_urlencode = urllib.urlencode(test_data)
    #requrl = "http://172.31.64.204:80/insert"
    requrl = "http://10.200.131.140:80/insert"
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    return(res)

    
#cc=check_result({'act':'hb'}, 'Darwin/15.6.0', 'ipad_shikan_15', 'mpp_hb_5_ipad', 1)
#print(cc)
#interface_data={'a':1,'b':2}
#delete_data('mpp')
#print(insert_cdn_config('404'))
