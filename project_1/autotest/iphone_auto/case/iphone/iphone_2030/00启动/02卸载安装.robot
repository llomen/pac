*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot

*** Test Cases ***
授权界面
    公共-删除数据
    启动应用
    sleep    5
    公共-页面包含元素    同意并继续
    公共-页面包含元素    不同意

初次进入未上报pvs
    公共-校验数据    ${pvs}    setup_pvs    ${table_pvs}    0

初次进入未上报pvs1
    公共-校验数据    ${pvs1}    setup_pvs    ${table_pvs1}    0

初次进入未上报st
    公共-校验数据    ${st}    iphone_qidong2    mpp_st_iphone    0

初次进入未上报st1
    公共-校验数据    ${st1}    iphone_qidong2    mpp_st_iphone_v2    0

初次进入未上报tf
    公共-校验数据    ${tf}    iphone_tf    mpp_st_iphone    0

初次进入未上报tf1
    公共-校验数据    ${tf1}    iphone_tf    mpp_st_iphone_v2    0

点不同意
    公共－点击页面文本    不同意
    sleep    2
    #页面未跳转
    公共-页面包含元素    同意并继续
    公共-页面包含元素    不同意

不同意点击disagree

点同意
    公共－点击页面文本    同意并继续
    sleep    5
    #页面跳转
    公共-页面不包含元素    同意并继续
    公共-页面不包含元素    不同意

点同意agree

初次启动st
    sleep    3
    公共-校验数据    ${st}    iphone_qidong2    mpp_st_iphone    1

初次启动st1
    公共-校验数据    ${st1}    iphone_qidong2    mpp_st_iphone_v2    1

初次启动tf
    公共-校验数据    ${tf}    iphone_tf    mpp_st_iphone    1

初次启动tf1
    公共-校验数据    ${tf1}    iphone_tf    mpp_st_iphone_v2    1

初次启动pvs
    公共-校验数据    ${pvs}    setup_pvs    ${table_pvs}    1

初次启动pvs1
    公共-校验数据    ${pvs1}    setup_pvs    ${table_pvs1}    1

首页pd
    公共-校验数据    ${pd}    pd_1    ${table_click}    1

初次启动上报曝光show
    公共-校验数据    {'logtype':'show'}    show_dianbo_1    ${table_show}    1

权限-位置
    公共-页面包含元素    允许“芒果TV”访问您的位置？
    公共-页面包含元素    允许一次
    公共-页面包含元素    不允许
    公共-页面包含元素    使用App时允许

同意权限
    公共－点击页面文本    使用App时允许

权限-通知
    公共-页面包含元素    “芒果TV”想给您发送通知
    公共-页面包含元素    允许
    公共-页面包含元素    不允许

同意推送
    公共－点击页面文本    允许
