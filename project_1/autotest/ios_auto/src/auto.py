# coding=utf-8
'''
auto.py模块提供后端数据校验，清除临时数据表等方法
'''
import logging

def check_result(field,platform,test_point,field_table,act_count):
    '''
    校验结果
    :param field: 要查询的域
    :param platform: 平台类型
    :param test_point: 测试点
    :param field_table: 数据模板表
    :param act_count: 校验条数
    :return: 
    '''
    import urllib
    from urllib.request import urlopen
    from urllib.parse import urlencode
    logging.info('check_result...')
    test_data = {}
    test_data['field']=field
    test_data['platform']=platform
    test_data['test_point']=test_point
    test_data['field_table']=field_table
    test_data['act_count']=act_count

    test_data_urlencode = urllib.parse.urlencode(test_data).encode(encoding='UTF8')
    #requrl = "http://10.200.12.153:80/test"
    #requrl = "http://10.200.19.53:80/test"
    requrl = "http://10.4.128.205:80/test"
    
    req = urllib.request.Request(url = requrl,data =test_data_urlencode)

    res_data = urllib.request.urlopen(req)
    res = res_data.read()
    res=eval(res)
    return(res)

def delete_data(platform):
    '''删除临时表的数据'''
    import urllib
    from urllib.request import urlopen
    from urllib.parse import urlencode

    logging.info('delete_data...')
    test_data = {}
    test_data['platform']=platform
    test_data_urlencode = urllib.parse.urlencode(test_data).encode(encoding='UTF8')
    #requrl = "http://10.200.12.153:80/delete"
    #requrl = "http://10.200.19.53:80/delete"
    requrl = "http://10.4.128.205:80/delete"
    req = urllib.request.Request(url=requrl, data=test_data_urlencode)
    res_data = urllib.request.urlopen(req)
    res = res_data.read()
    return(res)


if __name__ == '__main__':

    # res=insert_cdn_config(404)

    # delete_data('iPhoneiOS12.4.3')


    # delete_cdn()

    # field = {'act':'pfc'}
    # field = {'logtype':'stay'}
    # field = {'act':'comment'}
    field = {'s':'2','f':'0'}
    # field = {'act':'pvs'}

    # table='mpp_jiaohu_ipad_imy'
    table='mpp_cdn_5_ipad'
    # table='mpp_stay_iphone'
    # table='mpp_pvs_ipad'

    test_point='ipad_bodan_003'

    result = check_result(field,  'iPadiOS11.4Scale/2.00', test_point,  table,   1)
    # result = check_result({'act':'aplay'}  , 'iPadiOS11.4Scale/2.00', 'playhistory_list_player ',   'mpp_aplay_5_ipad',    1)
    # result = check_result(field, 'web_wj', 'my_vip_order', 'mpp_order_data_ipad', 1)
    print(result)

