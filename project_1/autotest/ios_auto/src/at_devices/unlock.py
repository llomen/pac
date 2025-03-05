import os
import subprocess,logging
from time import sleep
from at_devices.connect import get_device,get_deviceName

xiaomi_huawi_devices=['1de9e99d','aedbea5','CLB0219309005027','46FDU19409009319']

def check_screen_status(device_url,serial):

    cmd = 'adb -s ' + device_url + ' shell "dumpsys window policy | grep mAwake"'
    mAwake = os.popen(cmd).readlines()
    logging.info(mAwake)
    logging.info('检测【%s】设备是否亮屏' %(get_deviceName(serial)))

    if serial in xiaomi_huawi_devices:
        if '    mAwake=truemScreenOnEarly=true mScreenOnFully=true\n' in mAwake:
            logging.info("【%s】设备已经亮屏" %(get_deviceName(serial)))
            return True
        else:
            logging.info("【%s】设备未亮屏!" %(get_deviceName(serial)))
            return False

    else:
        if '    mAwake=true\n' in mAwake:
            logging.info("【%s】设备已经亮屏" %(get_deviceName(serial)))
            return True
        elif '    mAwake=false\n' in mAwake:
            logging.info("【%s】设备未亮屏!" %(get_deviceName(serial)))
            return False
        else:
            logging.info("【%s】设备亮屏状态检测异常" %(get_deviceName(serial)))
            return False

def activate_screen(device_url,serial):
    '''
    点亮屏幕
    :param device_url: 设备地址
    :return: 
    '''
    logging.info('【%s】正在点亮屏幕' %(get_deviceName(serial)))
    subprocess.call("adb -s" + device_url + "  shell input keyevent 26", shell=True)  # 点亮屏幕
    sleep(2)

def unlock_devices(serial,device_url):
    '''
    执行滑动解锁操作
    :param serial: 设备序列号
    :param device_url: 设备stf地址
    :return: 
    '''

    logging.info('执行【%s】设备解锁...' %(get_deviceName(serial)))

    # oppo k1
    if serial=='8de1cad4':
        subprocess.call("adb -s "+ device_url +" shell input swipe 540 2270 540 240 100", shell=True)  # 向上滑动解锁屏幕
        sleep(2)
        logging.info('点击连接方式取消按钮') #点文件传输连接方式会导致设备掉线
        subprocess.call("adb -s " + device_url + " shell input tap 530 2192", shell=True)  # 重启之后弹窗处理

    # vivo x20  vivo设备记得打开usb安全权限
    elif serial=='2be56844':
        subprocess.call("adb -s "+ device_url +" shell input swipe 490 2015 490 238 200", shell=True)

    # vivo x23
    elif serial=='41d12549':
        subprocess.call("adb -s "+ device_url +" shell input swipe 500 2250 500 245 200", shell=True)

    # meizu x8
    elif serial=='852QLDTP23XVK':
        subprocess.call("adb -s "+ device_url +" shell input swipe 500 2250 500 245 200", shell=True)

    # oppo R15
    elif serial=='8PO7DYEY8TUGFADM':
        subprocess.call("adb -s "+ device_url +" shell input swipe 500 2250 500 245 200", shell=True)

    # meizu mx4
    elif serial=='750BBKL22GDN':
        subprocess.call("adb -s "+ device_url +" shell input swipe 540 1700 540 300 200", shell=True)

    # htc x9u
    elif serial=='HT5CNBK00676':
        pass

    # oppo R11
    elif serial=='c70dacf1':
        subprocess.call("adb -s "+ device_url +" shell input swipe 490 1815 490 300 200", shell=True)

    # vivo x21
    elif serial=='8e00da6f':
        subprocess.call("adb -s "+ device_url +" shell input swipe 520 2178 520 200 200", shell=True)

    # meizu M15
    elif serial=='871QADSJCFZXM':
        pass

    #xiaomi 8
    elif serial=='1de9e99d':
        # subprocess.call("adb -s " + device_url + " shell input swipe 520 2167 520 132 200", shell=True)
        pass #已经在设备去除了锁屏设置

    #Redmi Note7
    elif serial == 'aedbea5':
        # subprocess.call("adb -s " + device_url + " shell input swipe 520 2208 520 150 200", shell=True)
        pass

    # Honor 10
    elif serial == 'VBJDU19410003232':
        logging.info('点击连接方式取消按钮')  # 点文件传输连接方式会导致设备掉线
        subprocess.call("adb -s " + device_url + " shell input tap 535 2018", shell=True)  # 重启之后弹窗处理

    # 华为P20
    elif serial == 'CLB0219309005027':
        logging.info('点击连接方式取消按钮')  # 点文件传输连接方式会导致设备掉线
        subprocess.call("adb -s " + device_url + " shell input tap 535 2086", shell=True)  # 重启之后弹窗处理

    #华为 nova4
    elif serial == '46FDU19409009319':
        pass


    else:
        logging.error('serial error!')

    logging.info('【%s】解锁完成！' %(get_deviceName(serial)))

    sleep(1)  # 解锁成功后等待1s进行其他操作

def unlock(serial,device_url):
    '''
    解锁方法，根据serial获取设备，然后判断是否解锁，如果未解锁就执行解锁操作
    :param serial: 设备序列号
    :return: 
    '''

    #判断设备是否亮屏，然后再进行滑动解锁
    if check_screen_status(device_url,serial):
        unlock_devices(serial, device_url)
    else:
        activate_screen(device_url,serial)
        unlock_devices(serial,device_url)
    sleep(2)



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
    # serial='8e00da6f' #vivo x21

    # serial = '1de9e99d'  # 小米8
    # serial = 'aedbea5'  # 红米 Note7
    # serial = 'VBJDU19410003232'  # 华为荣耀10
    # serial = 'CLB0219309005027'  # 华为P20
    # serial = '46FDU19409009319'  # 华为Nova4


    device_url = get_device(serial)
    unlock(serial,device_url)




