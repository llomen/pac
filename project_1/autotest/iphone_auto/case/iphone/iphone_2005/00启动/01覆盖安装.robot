*** Settings ***
Suite Setup
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot

*** Test Cases ***
无授权界面
    公共-删除数据
    启动应用
    sleep    15
    公共-页面不包含元素    同意并继续
    公共-页面不包含元素    不同意

无权限提示
    公共-页面不包含元素    允许
    公共-页面不包含元素    不允许

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

点我的跳个人中心
    #页面无引导遮挡浮层
    首页-我
    sleep    2
    公共-页面包含元素    播放记录
