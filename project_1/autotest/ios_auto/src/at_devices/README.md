
# 简介
`at-devices` 工具包适用于aPhone/iPhone端自动化多设备兼容性测试。
目前已经支持Android设备连接、断开、解锁、安装卸载、输入法切换、全局代理设置功能。
iOS设备支持通过API来查看设备信息、占用/释放设备。



# 模块说明
- `connect`:设备连接断开
- `install`:设备的安装卸载操作
- `keyboard_set`:输入法切换
- `unlock`:设备解锁
- `proxy`:全局代理
- `reboot_devices`:设备重启,防止设备过度充电自动断开电源
- `stf-aphone`:Android设备管理
- `run_demo`:使用参考样例
- `iOS_remote`:iOS设备远程管理

# Android支持设备

设备名称 |系统版本|serial|连接断开|解锁|安装卸载|输入法切换|防过充|全局代理|备注
---|---|---|---|---|---|---|---|---|---
HTC x9u | 6.1.0|HT5CNBK00676|支持|支持|支持|支持|支持|支持|
魅族 X8| 8.1.0|852QLDTP23XVK|支持|支持|支持|支持|不支持|支持|该设备系统限制，不支持重启后继续充电
魅族 Mx4|5.1|750BBKL22GDN|支持|支持|支持|支持|支持|不支持
魅族 M15|7.1.2|871QADSJCFZXM|支持|支持|支持|支持|支持|支持|该在stf上面掉电非常快导致关机
OPPO K1|8.1.0|8de1cad4|支持|支持|支持|不支持|支持|不支持|设备系统权限限制(需要`WRITE_SECURE_SETTINGS`权限),暂不支持输入法切换 </br> 
OPPO R15|8.1.0|8PO7DYEY8TUGFADM|支持|支持|支持|不支持|支持|不支持|设备系统权限限制(需要`WRITE_SECURE_SETTINGS`权限),暂不支持输入法切换
OPPO R11|7.1.1|c70dacf1|支持|支持|支持|支持|支持|-|该设备系统非常不稳定，容易掉线和自动关机,已从stf下线
Vivo X20|7.1.1|2be56844|支持|支持|支持|支持|不支持|不支持|系统限制，不支持重启后继续充电 </br>设置全局代理之后设备无法正常访问网络
Vivo X21A|8.1.0|8e00da6f|支持|支持|支持|支持|不支持|不支持|设备系统限制,不支持重启后继续充电</br>设置全局代理之后设备无法正常访问网络
Vivo X23|8.1.0|41d12549|支持|支持|支持|不支持|不支持|不支持|设备权限系统限制,暂不支持输入法切换和防过充</br>设置全局代理之后设备无法正常访问网络
小米8|9|1de9e99d|支持|支持|支持|支持|不支持|支持|运行完成之后会自动卸载appium setting组件
红米Note7|9|aedbea5|支持|支持|支持|支持|不支持|支持|运行完成之后会自动卸载appium setting组件
华为荣耀10|8.1.0|VBJDU19410003232|支持|支持|支持|支持|不支持|支持|在stf上面掉电非常快导致关机
华为P20|8.1.0|CLB0219309005027|支持|支持|支持|支持|不支持|支持|在stf上面掉电非常快导致关机
华为Nova4|9|46FDU19409009319|支持|支持|支持|支持|不支持|支持|在stf上面掉电非常快导致关机

# 快速开始

```python
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

# 输入法切换
set_keyboard_appium(device_url,serial)  #切换未appium输入法
set_keyboard_default(device_url,serial) #切换为默认输入法


#全局代理
set_global_proxy(device_url,serial)    #设置全局代理
delete_global_proxy(device_url,serial) #删除全局代理

#释放设备
return_device(serial)


```

# Android兼容问题说明
### 1.设备长时间充电后需要重新插拔数据线
- 【问题描述】部分设备系统为了避免长时间(连续充电6~8小时)充电对电池的损耗,必须重新插拔数据线才能继续充电，否则会把电池电量消耗完导致关机。
- 【解决方案探索】部分设备可以设置重启后继续充电，但是还有一部分设备重启也无法充电。
- 【不兼容设备】Vivo X23、vivox21、vivox20、小米8、红米Note7、华为荣耀10、华为P20、华为Nova4、魅族x8

### 2.设备安全权限限制
- 【问题描述】设备系统`WRITE_SECURE_SETTINGS`权限限制导致无法修改系统默认输入法
- 【解决方案探索】将设备root后可以获得`WRITE_SECURE_SETTINGS`权限,但是目前Android8.0以上的设备root成功率非常低,因此目前是手动切换默认输入法。
- 【不兼容设备】OPPO K1,OPPO R15、Vivo X23

### 3.多设备并发运行过程中设备掉线
- 【问题描述】在脚本执行过程中,部分设备会掉线导致用例执行失败。
- 【解决方案探索】在多设备并发数量在10台以上时,usb-hub部分设备供电不足会导致设备掉线,目前的解决方案使用进程池限制并发数量保持稳定性。
- 【不兼容设备】魅族x8,红米Note7、vivo x20

### 4.设备系统随机弹窗干扰
- 【问题描述】设备系统随机弹出各种需要确认弹窗干扰自动化运行，如：系统升级弹窗,低电量警告弹窗。
- 【解决方案探索】部分设备可以通过设置里面关闭对应的升级和低电量警告提示，但是还有部分设备无法关闭。
- 【不兼容设备】huawei nova4,华为P20,vivo x20,vivo x21,vivo x23,小米8、红米Note7

### 5.设备系统自动卸载appium-setting依赖组件

- 【问题描述】 MIUI9.0以上系统会自动删除appium-setting依赖app影响脚本执行稳定性
- 【解决方案探索】该问题是由于小米新版系统安全扫描自动清理导致，关闭安装监控也无效。
- 【不兼容设备】小米8/红米Note7

### 6.全局代理设置问题
- 【问题描述】部分设备设备权限限制无法设置全局代理，或者设置之后无法正常访问网络
- 【解决方案探索】无法使用命令的设置全局代理的设备，在wifi设置中进行手动代理设置
- 【不兼容设备】vivo x20/21/23，oppo R15,Mx4，oppo k1

# iOS远程控制
详见wiki:http://wiki.imgo.tv/pages/viewpage.action?pageId=7755093
