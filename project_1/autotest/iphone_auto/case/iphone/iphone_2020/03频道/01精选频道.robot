*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Test Cases ***
首页-扫一扫pvs
    公共-删除数据
    sleep    5
    首页-扫一扫
    公共-校验数据    ${pvs}    bu2_016    ${table_pvs}    1

首页-扫一扫pvs1
    公共-校验数据    ${pvs1}    bu2_016    ${table_pvs1}    1

同意相机权限
    判断后点击    好

扫一扫-首页pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    bu2_017    ${table_pvs}    1

扫一扫-首页pvs1
    公共-校验数据    ${pvs1}    bu2_017    ${table_pvs1}    1

列表频道pvs
    公共-删除数据
    公共－点击页面文本    更多VIP福利等你拿
    公共-校验数据    ${pvs}    liebiao_002    ${table_pvs}    1

列表频道pvs1
    公共-校验数据    ${pvs1}    liebiao_002    ${table_pvs1}    1

列表频道返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    liebiao_001    ${table_pvs}    1

列表频道返回pvs1
    公共-校验数据    ${pvs1}    liebiao_001    ${table_pvs1}    1

邮箱登录-忘记密码pvs
    首页-我
    我的-点击登录
    登录-是否有历史页面
    登录-切换邮箱登录
    公共-删除数据
    公共－点击页面文本    忘记密码？
    公共-校验数据    ${pvs}    bu2_010    ${table_pvs}    1

邮箱登录-忘记密码pvs1
    公共-校验数据    ${pvs1}    bu2_010    ${table_pvs1}    1

忘记密码-邮箱登录pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    bu2_011    ${table_pvs}    1

忘记密码-邮箱登录pvs1
    公共-校验数据    ${pvs1}    bu2_011    ${table_pvs1}    1

*** Keywords ***
频道上滑
    swipe    128    450    120    200
    capture page screenshot

频道下滑
    swipe    250    276    240    600
    capture page screenshot
