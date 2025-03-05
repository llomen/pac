import os,logging
from at_devices.unlock import get_device
from at_devices.connect import get_deviceName
from time import sleep



vivo_devices=['2be56844','8e00da6f','41d12549']
meizu_devices=['750BBKL22GDN','852QLDTP23XVK','871QADSJCFZXM']
xiaomi_devices=['1de9e99d','aedbea5']
huawei_devices=['VBJDU19410003232','CLB0219309005027','46FDU19409009319']

def set_keyboard_appium(device_url,serial):
    '''
    将设备的输入法替换为appium输入法
    :param device_url: 设备stf url
    :return: 
    '''

    #将输入法设置为appium输入法
    logging.info('切换【%s】输入法为appium输入法...' %(get_deviceName(serial)))
    cmd = "adb  -s " + device_url + "  shell ime set io.appium.settings/.UnicodeIME "
    result = os.popen(cmd).readlines()
    logging.info('【%s】输入法切换为appium输入法完成:%s' % (get_deviceName(serial), result))

def set_keyboard_default(device_url,serial):
    '''
    将输入法切换回系统默认输入法
    :param device_url: 设备stf url
    :param serial: 设备id
    :return: 
    '''

    # 将输入法设置为系统默认输入法
    logging.info('设置【%s】输入法为系统默认输入法...' %(get_deviceName(serial)))

    # htc x9u
    if serial=='HT5CNBK00676':
        cmd = "adb  -s " + device_url + "  shell ime set com.htc.sense.ime/.HTCIMEService "
        result = os.popen(cmd).readlines()
        logging.info('【%s】系统默认输入法切换完成:%s'%(get_deviceName(serial),result))

    # 魅族 mx4/x8/M15
    elif serial in meizu_devices:
        cmd = "adb  -s " + device_url + "  shell ime set com.meizu.flyme.input/com.meizu.input.MzInputService "
        result = os.popen(cmd).readlines()
        logging.info('【%s】系统默认输入法切换完成:%s' % (get_deviceName(serial), result))

    # vivo x20/x21/x23
    elif serial in vivo_devices :
        cmd = "adb  -s " + device_url + "  shell ime set com.sohu.inputmethod.sogou.vivo/.SogouIME "
        result = os.popen(cmd).readlines()
        logging.info('【%s】系统默认输入法切换完成:%s' % (get_deviceName(serial), result))

    # oppo R11
    elif serial=='c70dacf1':
        cmd = "adb  -s " + device_url + "  shell ime set com.sohu.inputmethod.sogouoem/.SogouIME "
        result = os.popen(cmd).readlines()
        logging.info('【%s】系统默认输入法切换完成:%s' % (get_deviceName(serial), result))

    # xiaomi 8/redmi Note7
    elif serial in xiaomi_devices:
        cmd = "adb  -s " + device_url + "  shell ime set com.sohu.inputmethod.sogou.xiaomi/.SogouIME "
        result = os.popen(cmd).readlines()
        logging.info('【%s】系统默认输入法切换完成:%s' % (get_deviceName(serial), result))

    #荣耀10/华为p20/nova4
    elif serial in huawei_devices:
        cmd = "adb  -s " + device_url + "  shell ime set com.baidu.input_huawei/.ImeService "
        result = os.popen(cmd).readlines()
        logging.info('【%s】系统默认输入法切换完成:%s' % (get_deviceName(serial), result))

    else:
        logging.info('该设备不支持输入法自动切换！')


def hide_keyboard_action(driver):
    '''
    收起输入框
    :param driver: 
    :return: 
    '''
    logging.info('收起输入法键盘')
    driver.hide_keyboard()


if __name__ == '__main__':

    # serial='41d12549' #vivo x23
    # serial = '2be56844'  # vivo x20
    # serial = '8de1cad4'  # oppo k1——不支持输入法切换
    # serial='8PO7DYEY8TUGFADM' #oppo R15——不支持


    # serial='750BBKL22GDN' #meizu mx4
    # serial='852QLDTP23XVK' #meizu x8
    # serial='HT5CNBK00676' #htc x9u
    # serial='871QADSJCFZXM' #魅族 M15
    # serial = '8e00da6f'  # vivo x21
    # serial = 'c70dacf1'  # oppo R11

    # serial = '1de9e99d'  # 小米8
    # serial = 'aedbea5'  # 红米 Note7
    # serial = 'VBJDU19410003232'  # 华为荣耀10
    # serial = 'CLB0219309005027'  # 华为P20
    serial = '46FDU19409009319'  # 华为Nova4

    device_url = get_device(serial)
    # set_keyboard_appium(device_url,serial)
    set_keyboard_default(device_url,serial)

    # hide_keyboard_action(driver)