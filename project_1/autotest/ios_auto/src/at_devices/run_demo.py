from at_devices.unlock import unlock
from at_devices.install import  install_action,uninstall
from at_devices.keyboard_set import *
from at_devices.connect import return_device
from at_devices.proxy import set_global_proxy,delete_global_proxy


serial='750BBKL22GDN' #meizu mx4

#连接设备
device_url = get_device(serial)

#解锁
unlock(serial,device_url)

# 卸载
app_package = 'com.mgtv.data.sdk'
uninstall(device_url, app_package,serial)

# 安装
app_path=r'C:\Users\Shuqing\Desktop\app-debug.apk'
install_action(serial,device_url,app_path)

#全局代理
set_global_proxy(device_url,serial)    #设置全局代理
delete_global_proxy(device_url,serial) #删除全局代理


# 输入法切换
set_keyboard_appium(device_url,serial)  #切换未appium输入法
set_keyboard_default(device_url,serial) #切换为默认输入法

#释放设备
return_device(serial)







