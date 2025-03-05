*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${show}           {'logtype':'show'}
${table_show}     mpp_show_5_iphone_sdk
${btclick}        {'act':'btclick'}
${my}             {'act':'my'}
${aplay}          {'act':'aplay'}
${table_aplay}    mpp_vv_5_5_iphone_sdk

*** Test Cases ***
我的积分曝光show
    sleep    5
    公共-删除数据
    首页-我
    公共-校验数据    ${show}    show_kandan    ${table_show}    1

登录pvs
    公共-删除数据
    我的-点击登录
    公共-校验数据    ${pvs}    denglu_001    ${table_pvs}    1

登录pvs1
    公共-校验数据    ${pvs1}    denglu_001    ${table_pvs1}    1

点击我的积分score
    公共-删除数据
    公共-校验数据    ${show}    show_kandan    ${table_show}    1
