import subprocess,logging
from time import sleep
from at_devices.unlock import get_device,unlock
from at_devices.connect import *
import threading,os



def install_app(device_url,serial,app_path):
    '''
    安装app
    :param device_url: 设备stf地址
    :param app_path: app安装路径 
    :return: 
    '''
    install_result=''

    #判断设备是否连接
    if check_device_isconnected(device_url,serial):
        logging.info('【%s】设备连接正常,准备开始安装app...' %(get_deviceName(serial)))
        cmd="adb -s " + device_url + " install " + app_path
        install_result = os.popen(cmd).readlines()
        # logging.info(install_result)
    else:
        logging.info('【%s】设备未连接,准备重新连接...' %(get_deviceName(serial)))
        connect_devices(device_url,serial)


    if 'Success\n' in install_result:
        logging.info(' 【%s】设备安装成功！' %(get_deviceName(serial)))
    else:
        logging.info('【%s】安装应用%s失败！'%((get_deviceName(serial)),app_path))

def install_dialog_handle(serial,device_url):
    '''
    安装时设备弹窗密码处理
    :param serial: 设备序列号
    :param device_url: stf设备地址
    :return: 
    '''
    logging.info('【%s】安装准备进行弹窗处理'%(get_deviceName(serial)))
    # oppo k1
    if serial=='8de1cad4':
        sleep(12)
        logging.info('【%s】输入密码' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input text 'mgtv2018' ", shell=True) #开始输入密码
        sleep(3)
        logging.info('【%s】点击安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 756 1441", shell=True) #appium输入法安装
        subprocess.call("adb -s " + device_url + " shell input tap 740 1010", shell=True) #默认输入法安装
        sleep(7)
        logging.info('【%s】点击底部安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 508 1998", shell=True) #点击底部安装
        sleep(3)
        logging.info('【%s】点击底部完成' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 517 2162", shell=True) #点击底部完成

    # oppo R15
    elif serial == '8PO7DYEY8TUGFADM':
        sleep(10)
        logging.info('【%s】输入密码' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input text 'mgtv2018' ", shell=True)  # 开始输入密码
        sleep(3)
        logging.info('【%s】点击确定' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 746 973", shell=True)  # 默认输入法时点击弹窗界面安装
        subprocess.call("adb -s " + device_url + " shell input tap 746 1373", shell=True)  # appium输入法点击弹窗界面安装
        sleep(7)
        logging.info('【%s】点击安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 508 1947", shell=True)  # 点击底部安装
        sleep(3)
        logging.info('【%s】点击底部完成' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 500 2113", shell=True)  # 点击底部完成

    # meizu x8
    elif serial=='852QLDTP23XVK':
        sleep(10)
        logging.info('【%s】点击允许' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 696 1322", shell=True) #点击允许

    # meizu M15
    elif serial=='871QADSJCFZXM':
        sleep(10)
        logging.info('【%s】点击允许' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 660 1250", shell=True) #点击允许

    # meizu mx4
    elif serial=='750BBKL22GDN':
        sleep(10)
        logging.info('【%s】点击允许' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 737 1228", shell=True) #点击允许

    # vivo x23
    elif serial=='41d12549':

        sleep(10)
        logging.info('【%s】输入密码' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input text 'mgtv2018' ", shell=True)  # 开始输入密码
        sleep(3)
        logging.info('【%s】点击确定' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 800 1260", shell=True)  # 默认输入法输入法下的确定按钮位置
        subprocess.call("adb -s " + device_url + " shell input tap 800 2091", shell=True)  # appium输入法下的确定按钮位置
        sleep(4)
        logging.info('【%s】点击继续安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 531 2051", shell=True)  # 继续安装
        sleep(4)
        logging.info('【%s】点击底部安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 531 2051", shell=True)  # 安装
        sleep(5)
        logging.info('【%s】点击底部完成' % get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 531 2245", shell=True)  # 完成

    # vivo x20
    elif serial == '2be56844':
        sleep(8)
        logging.info('【%s】输入密码' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input text 'mgtv2018' ", shell=True)  # 开始输入密码
        sleep(2)
        logging.info('【%s】点击确定' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 325 937", shell=True)  # 默认输入法时确定
        subprocess.call("adb -s " + device_url + " shell input tap 309 1338", shell=True)  # appium输入法时确定按钮
        sleep(4)
        logging.info('【%s】点击继续安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 532 1780", shell=True)  # 继续安装
        sleep(5)
        logging.info('【%s】点击安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 504 1765", shell=True)  # 安装
        sleep(5)
        logging.info('【%s】点击打开' % get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 530 1798", shell=True)  # 打开
        sleep(4)
        logging.info('【%s】点击允许' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 320 1350", shell=True)  # 允许
        sleep(2)
        logging.info('【%s】再次点击允许' % get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 320 1350", shell=True)  # 允许

    #vivo x21
    elif serial == '8e00da6f':
        sleep(7)
        logging.info('【%s】输入密码' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input text 'mgtv2018' ", shell=True)  # 开始输入密码
        sleep(2)
        logging.info('【%s】点击确定' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 778 1185", shell=True)  # 确定
        sleep(4)
        logging.info('【%s】点击继续安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 532 1994", shell=True)  # 继续安装
        sleep(3)
        logging.info('【%s】点击安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 504 1974", shell=True)  # 安装
        sleep(4)
        logging.info('【%s】点击完成' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 535 2167", shell=True)  # 完成

    # htc x9u
    elif serial == 'HT5CNBK00676':
        sleep(25)
        logging.info('【%s】点击确定' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 516 1834", shell=True)  # 点击权限界面确定按钮

    # oppo R11
    elif serial =='c70dacf1':
        sleep(7)
        logging.info('【%s】输入密码' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input text 'mgtv2018'", shell=True)  # 输入密码
        sleep(2)
        logging.info('【%s】点击确定' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 787 732 ", shell=True)  # 默认输入法点击确认按钮
        subprocess.call("adb -s " + device_url + " shell input tap 750 1135 ", shell=True)  # appium输入法点击确认按钮
        sleep(7)
        logging.info('【%s】点击底部安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 572 1636", shell=True)  # 点击底部安装
        sleep(5)
        logging.info('【%s】点击底部完成' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 553 1760", shell=True)  # 点击底部完成

    # xiaomi 8
    elif serial == '1de9e99d':
        sleep(9)
        logging.info('【%s】点击继续安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 277 2129 ", shell=True)

    #红米Note7
    elif serial == 'aedbea5':
        sleep(9)
        logging.info('【%s】点击继续安装' %get_deviceName(serial))
        subprocess.call("adb -s " + device_url + " shell input tap 282 2236 ", shell=True)

    #华为 honor10
    elif serial == 'VBJDU19410003232':
        # sleep(5)
        # logging.info('【%s】点击继续安装' % get_deviceName(serial))
        # subprocess.call("adb -s " + device_url + " shell input tap 789 2009 ", shell=True)
        # sleep(8)
        # logging.info('【%s】再次点击继续安装' % get_deviceName(serial))
        # subprocess.call("adb -s " + device_url + " shell input tap 520 1867 ", shell=True)
        # sleep(5)
        # logging.info('【%s】再次点击完成' % get_deviceName(serial))
        # subprocess.call("adb -s " + device_url + " shell input tap 266 2032 ", shell=True)
        pass

    # 华为 P20
    elif serial == 'CLB0219309005027':
        # sleep(5)
        # logging.info('【%s】点击继续安装' % get_deviceName(serial))
        # subprocess.call("adb -s " + device_url + " shell input tap 800 2080 ", shell=True)
        # sleep(7)
        # logging.info('【%s】再次点击继续安装' % get_deviceName(serial))
        # subprocess.call("adb -s " + device_url + " shell input tap 530 1992 ", shell=True)
        # sleep(5)
        # logging.info('【%s】再次点击完成' % get_deviceName(serial))
        # subprocess.call("adb -s " + device_url + " shell input tap 278 2140 ", shell=True)
        pass

    #华为 nova4
    elif serial == '46FDU19409009319':
        pass


    else:
        logging.info('该设备还未适配！')

def install_action(serial,device_url,app_path):
    '''
    多线程安装app，自动处理安装过程中的弹窗
    :param serial: 设备id
    :param app_path: 安装包路径
    :return: 
    '''
    threads = []

    #多线程处理弹窗
    p1 = threading.Thread(target=install_app, args=(device_url,serial,app_path))
    threads.append(p1)
    p2 = threading.Thread(target=install_dialog_handle, args=(serial, device_url))
    threads.append(p2)

    #执行安装操作
    for p in threads:
        p.start()
    for p in threads:
        p.join()

def uninstall(device_url,app_package,serial):
    '''
    卸载app，首先判断设备是否安装对应的应用，如果有则卸载对应的app。
    :param device_url: 设备地址
    :param app_package: 卸载包的包名
    :param serial:设备id
    :return: 
    '''
    #获取设备上的安装应用列表
    cmd="adb -s  " + device_url + "  shell pm list packages "
    pacackage_list=os.popen(cmd).readlines()
    sleep(1)

    #判断是否安装对应的包
    if 'package:'+str(app_package)+'\n' in pacackage_list:
        logging.info('【%s】正在卸载...' %(get_deviceName(serial)))

        cmd="adb -s " + device_url + " uninstall " + app_package
        result=os.popen(cmd).readlines()
        # logging.info(result)

        if 'Success\n' in result:
            logging.info('【%s】卸载成功!' %(get_deviceName(serial)))
        else:
            logging.info('【%s】卸载失败！' %(get_deviceName(serial)))

    else:
        logging.info('【%s】设备上面没有此应用,无需卸载!' %(get_deviceName(serial)))


if __name__ == '__main__':

    # serial='852QLDTP23XVK' #meizu x8
    # serial='41d12549' #vivo x23
    serial='2be56844' #vivo x20
    # serial='8de1cad4' #oppo k1
    # serial='8PO7DYEY8TUGFADM' #oppo R15

    # serial='750BBKL22GDN' #meizu mx4
    # serial = 'HT5CNBK00676'  # htc x9u
    # serial='c70dacf1' #oppo R11
    # serial='871QADSJCFZXM' #魅族 M15
    # serial = '8e00da6f'  # vivo x21

    # serial = '1de9e99d'  # 小米8
    # serial = 'aedbea5'  # 红米 Note7
    # serial = 'VBJDU19410003232'  # 华为荣耀10
    # serial = 'CLB0219309005027'  # 华为P20
    # serial = '46FDU19409009319'  # 华为Nova4

    device_url=get_device(serial)
    # sleep(1)

    # 卸载
    #
    app_package = 'com.mgtv.data.sdk'
    uninstall(device_url, app_package,serial)

    # unlock(serial,device_url)

    # device_url='172.31.36.77:7569'

    sleep(1)
    app_path=r'C:\Users\Shuqing\Desktop\app-debug.apk'
    install_action(serial,device_url,app_path)

    #






