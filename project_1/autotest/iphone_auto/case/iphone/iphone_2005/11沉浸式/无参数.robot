*** Settings ***
Suite Setup       启动应用
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
${cp10}           {'act':'cp10'}
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
频道页进入沉浸式pvs
    公共-删除数据
    公共－点击页面文本    漫威之父斯坦李去世
    sleep    5
    comment    Background App
    comment    Reset Application
    公共-校验数据    ${pvs}    cjs_001    ${table_pvs_dianbo}    1

频道页进入沉浸式pvs1
    公共-校验数据    ${pvs1}    cjs_001    ${table_pvs1}    1

进入频道show
    公共-校验数据    ${show}    index_shantu    ${table_show}    1

进入频道cjplayshow
    公共-校验数据    ${cjplayshow}    cjplayshow_001    ${table_cjplayshow}    0

沉浸式可播比cp10
    公共-校验数据    {cp10}    ke1_10    ${table_cp}    1

连播sp
    公共-校验数据    ${sp}    chenjin_001    ${table_sp}    1

cdn1
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    1

点播播放定时上报cdn-r1
    公共-校验数据    ${r1}    aphone_changjing_1    mpp_cdnq_5_iphone    1

buffer
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

视频播放aplay
    公共-校验数据    ${aplay}    dianboxiayige_001    ${table_vv}    1

大数据心跳hb3
    公共-校验数据    ${hb3}    dianboxiayige_001    ${table_hb_sdk}    1

大数据心跳hb5
    公共-校验数据    ${hb5}    dianboxiayige_001    ${table_hb_sdk}    1

沉浸式心跳hb3
    公共-校验数据    ${hb3_cj}    cjplayhb_01    ${table_cjplayhb}    0

沉浸式心跳hb5
    公共-校验数据    ${hb5_cj}    cjplayhb_02    ${table_cjplayhb}    0

点评论cjplayclick
    公共-删除数据
    沉浸式-点评论
    公共-校验数据    ${cjplayclick}    cjplayclick_001    ${table_cjplayclick}    0

退出沉浸式pvs
    公共-删除数据
    沉浸式-返回
    公共-校验数据    ${pvs}    cjs_002    ${table_pvs_dianbo}    1

退出沉浸式pvs1
    公共-删除数据
    沉浸式-返回
    公共-校验数据    ${pvs1}    cjs_002    ${table_pvs1}    1

退出沉浸式cdn-r3
    公共-校验数据    ${r3}    aphone_changjing_1    mpp_cdnq_5_iphone    1

退出-大数据心跳停止hb
    公共-校验数据    ${hb_end}    dianboxiayige_001    ${table_hb_sdk}    1

退出-沉浸式心跳停止hb
    公共-校验数据    ${hb_end_cj}    cjplayhb_03    ${table_cjplayhb}    0
