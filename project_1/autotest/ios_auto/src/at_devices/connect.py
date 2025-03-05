import logging,os
from at_devices.stf_aphone import StfaPhone
from time import sleep
import requests


#日志配置
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s %(filename)s[line:%(lineno)d]%(levelname)s%(message)s')

def get_device(serial):
    '''
    获取设备stf地址并连接
    :param serial: 
    :return: 
    '''

    TOKEN = '365cd9634d7640719657cd307fcbbdb98f8677837b1243028cca014aff1986ad'  # jenkins token
    DEVICES_URL = 'http://172.31.36.77:7100/api/v1/devices'  # 设备访问接口

    #连接设备
    try:
        s = StfaPhone(DEVICES_URL,TOKEN)
        s.using_device(serial)

        logging.info('*************获取设备:【%s】STF地址***************'%(get_deviceName(serial)))
        remoteConnectUrl = str(s.device_remote_connect(serial)['remoteConnectUrl'])

        logging.info('【%s】的STF地址为:%s' %(get_deviceName(serial),remoteConnectUrl))
        connect_devices(remoteConnectUrl,serial)
        sleep(2)
        return remoteConnectUrl

    except BaseException :

        logging.info('【%s】STF地址获取失败！准备重新获取设备STF地址...' %(get_deviceName(serial)))
        sleep(2)
        logging.info('正在重新获取【%s】STF地址...' %(get_deviceName(serial)))
        try:
            s = StfaPhone(DEVICES_URL, TOKEN)
            s.using_device(serial)
            remoteConnectUrl = str(s.device_remote_connect(serial)['remoteConnectUrl'])
            connect_devices(remoteConnectUrl,serial)
            sleep(2)
            return remoteConnectUrl

        except BaseException :
            logging.info('【%s】重试获取失败,请检查设备连接状态！' %(get_deviceName(serial)))
            return False

def connect_devices(remoteConnectUrl,serial):
    '''
    连接设备
    :param remoteConnectUrl: stf设备地址
    :return: 
    '''
    logging.info('连接【%s】设备到本地...'%(get_deviceName(serial)))
    # 挂载设备
    cmd = 'adb connect ' + remoteConnectUrl
    logging.info(cmd)
    os.popen(cmd).readlines()
    device = get_deviceName(serial)
    sleep(2)

    if check_device_isconnected(remoteConnectUrl,serial):
        pass

    else:
        logging.info('【%s】设备连接失败！' % device)
        sleep(2)
        logging.info('【%s】正在重试连接...' %device)
        cmd = 'adb connect ' + remoteConnectUrl
        os.popen(cmd).readlines()



def check_device_isconnected(device_url,serial):
    '''
    检测设备连接是否正常
    :param device_url: 设备stf地址
    :param serial:设备id
    :return: 
    '''

    logging.info('【%s】设备连接状态检测...'%(get_deviceName(serial)))
    cmd='adb devices'
    result = os.popen(cmd).readlines()
    # logging.info(result)

    if str(device_url)+'\tdevice\n' in result:
        logging.info('【%s】设备连接正常' %(get_deviceName(serial)))
        return True
    else:
        logging.info('【%s】设备连接异常!' %(get_deviceName(serial)))
        return False

def get_deviceName(serial):
    '''
    获取设备名称
    :param serial: 设备id
    :return: 设备名称
    '''

    # oppo k1
    if serial=='8de1cad4':
        device_name='oppo k1'
        return device_name

    # oppo R15
    elif serial == '8PO7DYEY8TUGFADM':
        device_name = ' oppo R15'
        return device_name

    # meizu x8
    elif serial=='852QLDTP23XVK':
        device_name = 'meizu x8'
        return device_name

    # meizu mx4
    elif serial=='750BBKL22GDN':
        device_name = 'meizu mx4'
        return device_name

    # vivo x23
    elif serial=='41d12549':
        device_name = 'vivo x23'
        return device_name

    # vivo x20
    elif serial == '2be56844':
        device_name = 'vivo x20'
        return device_name

    # htc x9u
    elif serial == 'HT5CNBK00676':
        device_name = 'htc x9u'
        return device_name

    # oppo R11
    elif serial == 'c70dacf1':
        device_name = 'oppo R11'
        return device_name

    # meizu M15
    elif serial == '871QADSJCFZXM':
        device_name = 'meizu M15'
        return device_name

    # vivo x21
    elif serial == '8e00da6f':
        device_name = 'vivo x21'
        return device_name

    # xiaomi MI8
    elif serial == '1de9e99d':
        device_name = 'xiaomi MI8'
        return device_name

    #Redmi Note7
    elif serial == 'aedbea5':
        device_name = 'Redmi Note7'
        return device_name

    # 华为荣耀10
    elif serial == 'VBJDU19410003232':
        device_name = 'Honor 10'
        return device_name

    # 华为P20
    elif serial == 'CLB0219309005027':
        device_name = 'Huawei p20'
        return device_name

    # 华为 Nova4
    elif serial == '46FDU19409009319':
        device_name = 'Huawei Nova4'
        return device_name


    else:
        logging.info('设备serial值错误!')

def return_device(serial):
    '''
    释放设备
    :param SERIAL: 设备id
    :return: 
    '''

    TOKEN='365cd9634d7640719657cd307fcbbdb98f8677837b1243028cca014aff1986ad'    #jenkins token
    DEVICES_URL = 'http://172.31.36.77:7100/api/v1/devices'                    # 设备访问接口
    USER_DEVICES_URL = 'http://172.31.36.77:7100/api/v1/user/devices/'

    s = StfaPhone(DEVICES_URL, TOKEN)
    remoteConnectUrl = str(s.device_remote_connect(serial)['remoteConnectUrl'])

    # 断开连接
    logging.info('【%s】设备正在断开连接...' %(get_deviceName(serial)))
    cmd = 'adb disconnect ' + remoteConnectUrl
    result = os.popen(cmd).readlines()
    # logging.info(result)

    url=USER_DEVICES_URL+serial
    headers = {
        'Authorization': "Bearer {}".format(TOKEN)
    }
    result=requests.delete(url,headers=headers)
    # logging.info(result.text)
    if '"success":true' in result.text:
        logging.info('【%s】设备释放成功!' %(get_deviceName(serial)))
    else:
        logging.info('【%s】设备释放失败!' %(get_deviceName(serial)))




if __name__ == '__main__':
    # serial='852QLDTP23XVK' #meizu x8
    # serial='8de1cad4' #oppo k1
    # serial='8PO7DYEY8TUGFADM' #oppo R15
    # serial='750BBKL22GDN' #meizu mx4
    # serial='HT5CNBK00676' #htc x9u

    # serial='41d12549' #vivo x23
    serial='2be56844' #vivo x20
    # serial='c70dacf1' #oppo R11
    # serial='871QADSJCFZXM' #魅族 M15
    # serial = '8e00da6f'  # vivo x21

    # serial = '1de9e99d'  # 小米8
    # serial = 'aedbea5'  # 红米 Note7
    # serial = 'VBJDU19410003232'  # 华为荣耀10
    # serial = 'CLB0219309005027'  # 华为P20
    # serial = '46FDU19409009319'  # 华为Nova4

    get_device(serial)
    # devices_url='172.31.36.77:7481'
    # check_device_isconnected(devices_url,serial)
    # return_device(serial)