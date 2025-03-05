*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${show}           {'logtype':'show'}
${sp}             {'act':'sp'}
${table_show}     mpp_show_5_iphone_sdk
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_pvs_dianbo}    mpp_pv_5_5_iphone_sdk_dianbo
${table_cjplayshow}    mpp_ip_cjplayshow
${table_cjplayclick}    mpp_ip_cjpalyclick
${table_cjplayhb}    mpp_ip_cjplayhb
${cjplayshow}     {'act':'cjplayshow'}
${cjplayclick}    {'act':'cjplayclick'}
${table_sp}       mpp_sp_iphone
${share}          {'act':'share'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {'r':'1'}
${hb3}            {'ht':'0','act':'hb'}
${hb5}            {'ht':'1','act':'hb'}
${hb_end}         {'ht':'2','act':'hb'}
${hb3_cj}         {'ht':'0','act':'hb'}
${hb5_cj}         {'ht':'1','act':'hb'}
${hb_end_cj}      {'ht':'2','act':'hb'}

*** Test Cases ***
沉浸式切后台pvs
    公共－点击页面文本    漫威之父斯坦李去世
    sleep    5
    公共-删除数据
    Background App
    公共-校验数据    ${pvs}    cjs_001    ${table_pvs_dianbo}    1

切后台st
    公共-校验数据    ${st}    iphone_qidong    mpp_st_iphone    1

切后台show
    公共-校验数据    ${show}    index_shantu    ${table_show}    1

切后台cjplayshow
    公共-校验数据    ${cjplayshow}    cjplayshow_001    ${table_cjplayshow}    1

切后台sp
    公共-校验数据    ${sp}    chenjin_001    ${table_sp}    1

点看正片cjplayclick
    公共-校验数据    ${cjplayclick}    cjplayclick_001    ${table_cjplayclick}    1

沉浸式停止播放cdn-r3
    公共-校验数据    ${r3}    iphone_feed_3    mpp_cdnq_5_iphone    0

大数据心跳停止hb
    公共-校验数据    ${hb_end}    dianboxiayige_001    mpp_hb_5_iphone_sdk    0

沉浸式心跳停止hb
    公共-校验数据    ${hb_end_cj}    cjplayhb_03    ${table_cjplayhb}    0

点播页连播sp
    公共-校验数据    ${sp}    chenjin_001    ${table_sp}    1

点播播放定时上报cdn-r1
    公共-校验数据    ${r1}    iphone_feed_1    mpp_cdnq_5_iphone    1

点播页可播比cp10
    公共-获取结果    ${cp10}    ke2_10    ${table_cp}    1

沉浸式进点播页pvs
    公共-校验数据    ${pvs}    cjs_002    ${table_pvs_dianbo}    1

点播页返回沉浸式pvs
    公共-校验数据    ${pvs}    cjs_002    ${table_pvs_dianbo}    1

点播播放定时上报cdn-r3
    公共-校验数据    ${r3}    iphone_feed_3    mpp_cdnq_5_iphone    1

返回无连播sp
    公共-校验数据    ${sp}    chenjin_001    ${table_sp}    0

退出沉浸式pvs
    公共-删除数据
    沉浸式-返回
    公共-校验数据    ${pvs}    cjs_002    ${table_pvs_dianbo}    1

退出沉浸式cdn-r3
    公共-校验数据    ${r3}    iphone_feed_3    mpp_cdnq_5_iphone    1

退出-大数据心跳停止hb
    公共-校验数据    ${hb_end}    dianboxiayige_001    ${table_hb_sdk}    1

退出-沉浸式心跳停止hb
    公共-校验数据    ${hb_end_cj}    cjplayhb_03    ${table_cjplayhb}    1
