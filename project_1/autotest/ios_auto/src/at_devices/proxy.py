import os,logging
from at_devices.connect import get_device,get_deviceName

proxy_unsupport_devices=['750BBKL22GDN',# mx4
                         '8PO7DYEY8TUGFADM', #oppo R15
                         '8de1cad4',# oppo k1
                         '2be56844',#vivo x20
                         '8e00da6f', #vivo x21
                         '41d12549' #vivo x23
                         ]

def set_global_proxy(device_url,serial,host='172.31.36.77',port='8001'):
    '''
    全局代理设置
    :param device_url: 设备stf地址
    :param host: 代理服务器ip
    :param port: 代理服务器端口
    :return: 
    '''

    if serial in proxy_unsupport_devices:
        logging.info('【%s】不支持设置全局代理' %(get_deviceName(serial)))
    else:
        logging.info('【%s】正在设置全局代理...' %(get_deviceName(serial)))
        cmd = "adb -s " + device_url + " shell settings put global http_proxy " + str(host)+":"+str(port)
        result=os.popen(cmd).readlines()
        # logging.info(result)

        set_fail_attention="Can't not modify the settings in prd firmware!\n"
        if set_fail_attention in result:
            logging.info('【%s】全局代理设置失败！' %(get_deviceName(serial)))
        else:
            logging.info('【%s】全局代理设置成功！' % (get_deviceName(serial)))


def delete_global_proxy(device_url,serial):
    '''
    清除设备全局代理
    :param devices_url: 
    :return: 
    '''

    logging.info('【%s】清除全局代理！' % (get_deviceName(serial)))
    cmd="adb -s " + device_url + " shell settings delete global http_proxy "
    result = os.popen(cmd).readlines()
    logging.info('【%s】清除全局代理 http_proxy结果:%s' %(get_deviceName(serial),result))

    cmd = "adb -s " + device_url + " shell settings delete global global_http_proxy_host "
    result = os.popen(cmd).readlines()
    logging.info('【%s】清除全局代理 global_http_proxy_host结果:%s' %(get_deviceName(serial),result))

    cmd = "adb -s " + device_url + " shell settings delete global global_http_proxy_port "
    result = os.popen(cmd).readlines()
    logging.info('【%s】清除全局代理 global_http_proxy_port结果:%s' %(get_deviceName(serial),result))

    logging.info('【%s】代理清理完成,准备重启设备' %(get_deviceName(serial)))
    cmd="adb -s " + device_url + " reboot "
    os.popen(cmd)




if __name__ == '__main__':

    # serial='750BBKL22GDN' #meizu mx4-不支持设置
    # serial='852QLDTP23XVK' #meizu x8
    # serial='871QADSJCFZXM' #魅族 M15
    # serial = '1de9e99d'  # 小米8
    # serial = 'aedbea5'  # 红米 Note7

    # serial = 'VBJDU19410003232'  # 华为荣耀10
    # serial = 'CLB0219309005027'  # 华为P20
    # serial = '46FDU19409009319'  # 华为Nova4
    # serial = '8de1cad4'  # oppo k1--不支持
    # serial='8PO7DYEY8TUGFADM' #oppo R15--不支持

    # serial='HT5CNBK00676' #htc x9u
    serial = '2be56844'  # vivo x20 --设置全局代理之后无法上网
    # serial = '8e00da6f'  # vivo x21--设置全局代理后无法上网装包
    # serial='41d12549' #vivo x23 --设置全局代理之后无法上网


    device_url=get_device(serial)
    # device_url='172.31.36.77:7569'

    set_global_proxy(device_url,serial)
    # delete_global_proxy(device_url,serial)
