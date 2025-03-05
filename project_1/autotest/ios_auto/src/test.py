# coding:utf-8
def check_result(field,test_point,field_table,act_count,all1):
    import urllib
    import urllib2
    test_data = {}
    test_data['field']=field
    test_data['test_point']=test_point
    test_data['field_table']=field_table
    test_data['act_count']=act_count
    test_data['all']=all1
    test_data_urlencode = urllib.urlencode(test_data)
    
    requrl = "http://192.168.8.239:80/test"
    
    req = urllib2.Request(url = requrl,data =test_data_urlencode)
    res_data = urllib2.urlopen(req)
    res = res_data.read()
    res=eval(res)
    return(res)

print(check_result('act', 'jingxuan', 'mpp_pvs_ad', 1, ))