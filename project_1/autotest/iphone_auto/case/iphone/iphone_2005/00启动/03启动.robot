*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1    g2
Resource          ../5.3对象库.robot

*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${buffer}         {'act':'buffer'}
${cdn1}           {'s':'1'}
${cdn3}           {'s':'3'}
${switch}         {'act':'switch'}
${cdn2}           {'s':'2'}
${r3}             {'r':'3'}
${r1}             {'r':'1'}
${st}             {'act':'st'}
${as}             {'act':'as'}
${ae}             {'act':'ae'}
${pv}             {'act':'pv'}
${vv}             {'act':'vv'}
${pfc}            {'act':'pfc'}

*** Test Cases ***
启动应用st
    公共-删除数据
    sleep    2
    启动应用2
    sleep    5
    ${result}    公共-校验数据    ${st}    iphone_qidong2    mpp_st_iphone    1

启动应用st1
    ${result}    公共-校验数据    ${st1}    iphone_qidong2    mpp_st_iphone_v2    1

开机广告cdn1
    ${result}    公共-校验数据    ${cdn1}    kaiji_001    mpp_adcdn_iphone    4

开机广告cdn3
    ${result}    公共-校验数据    ${cdn3}    kaiji_003    mpp_adcdn_iphone    1

启动pvs
    sleep    5
    ${result}    公共-校验数据    ${pvs}    setup_pvs    ${table_pvs}    1

启动pvs1
    sleep    5
    ${result}    公共-校验数据    ${pvs1}    setup_pvs    ${table_pvs1}    1

精选页pmm
    ${result}    公共-校验数据    {'act':'pmm'}    iphone_jingxuan    mpp_livepmm_5_iphone    1

首页闪图show
    ${result}    公共-校验数据    ${show}    index_shantu    ${table_show}    1

首页pd
    ${result}    公共-校验数据    ${pd}    pd_1    ${table_click}    1

清空缓存
    首页-我
    我的-缓存
    删除全部缓存
    非播放页-返回
    首页-精选

切后台
    公共-删除数据
    Background App

切后台启动st
    公共-删除数据
    sleep    2
    启动应用2
    sleep    5
    公共-校验数据    ${st}    iphone_qidong    mpp_st_iphone    1

切后台启动st1
    公共-校验数据    ${st1}    iphone_qidong    mpp_st_iphone_v2    1

切后台启动pvs
    sleep    5
    公共-校验数据    ${pvs}    setup_pvs    ${table_pvs}    1

切后台启动pvs1
    sleep    5
    公共-校验数据    ${pvs1}    setup_pvs    ${table_pvs1}    1
