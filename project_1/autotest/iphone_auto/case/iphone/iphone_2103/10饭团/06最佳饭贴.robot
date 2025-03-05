*** Settings ***
Documentation     实时播报、发布
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${my}             {'act':'my'}
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${pvs1_H5}        {'logtype':'pv','cntp':'qt_webview'}

*** Test Cases ***
最佳饭贴动态show
    首页-饭团
    公共-删除数据
    饭团广场-最佳饭贴标题
    sleep    2
    公共-校验数据    {'logtype':'show','smod':'1'}    square_07    ${table_show_ft}    1

入选规则pvs
    公共-删除数据
    公共－点击页面文本    入选规则
    公共-校验数据    ${pvs}    ft_guangchang_01    ${table_pvs}    1

入选规则pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_01    ${table_pvs1}    1

入选规则返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_02    ${table_pvs}    1

入选规则返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_02    ${table_pvs1}    1
