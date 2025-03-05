import logging,subprocess
from time import sleep
from stf_aphone import StfaPhone
import os



devices_list = [
    '8PO7DYEY8TUGFADM',  # oppo R15
    '8de1cad4', # oppo k1
    '2be56844', #vivo x20
    '871QADSJCFZXM', #魅族M15
    '852QLDTP23XVK', #meizu x8
    '8e00da6f', #vivo x21
    # 'HT5CNBK00676', #htc x9u
    '41d12549', #vivo x23
    '1de9e99d',  # 小米8
    'aedbea5',  # 红米 Note7
    'VBJDU19410003232',  # 华为荣耀10
    'CLB0219309005027',  # 华为P20
    '46FDU19409009319',  # 华为Nova4

]

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

        logging.info('*************获取设备:【%s】STF地址***************s'%(get_deviceName(serial)))
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

def check_device_isconnected(device_url,serial):
    '''
    检测设备连接是否正常
    :param device_url: 设备stf地址
    :param serial:设备id
    :return: 
    '''

    cmd='adb devices'
    result = os.popen(cmd).readlines()
    # logging.info(result)

    if str(device_url)+'\tdevice\n' in result:
        logging.info('【%s】设备连接正常' %(get_deviceName(serial)))
        return True
    else:
        logging.info('【%s】设备连接异常!' %(get_deviceName(serial)))
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
    result = os.popen(cmd).readlines()

    device = get_deviceName(serial)

    # 判断设备是否连接成功
    if 'error'  in result:
        logging.info('【%s】设备连接失败！' %device)
        sleep(3)

        logging.info('【%s】正在重试连接...' %device)
        cmd = 'adb connect ' + remoteConnectUrl
        logging.info(cmd)

        os.popen(cmd).readlines()
        check_device_isconnected(remoteConnectUrl,serial)
        logging.info('【%s】重试连接失败，请检查设备状态！')

    else:
        logging.info('【%s】设备连接成功！' %device)

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

def reboot_device(serial):
    '''
    重启设备
    :param serial: 设备id
    :return: 
    '''

    try:

        device_url = get_device(serial)
        sleep(2)
        device_name=get_deviceName(serial)

        logging.info('正在重启设备:%s..' % device_name)
        subprocess.call("adb -s" + device_url + "  shell reboot", shell=True)

    except BaseException :
        logging.info('设备连接异常，无法重启！')



if __name__ == '__main__':

    for serial in devices_list:
        reboot_device(serial)

