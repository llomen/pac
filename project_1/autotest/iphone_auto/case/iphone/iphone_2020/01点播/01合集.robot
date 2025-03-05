*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
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
点播页pvs
    sleep    5
    公共-删除数据
    #点击频道首页闪图，跳转到视频《青云志》
    首页-青云志
    sleep    3
    公共-校验数据    ${pvs}    big_dianbo    ${table_pvs_dianbo}    1

点播页pvs1
    公共-校验数据    ${pvs1}    big_dianbo    ${table_pvs1}    1

可播比cp1
    公共-校验数据    ${cp1}    iphone_001    ${table_cp}    1

aplay
    sleep    18
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

sdkload
    公共-校验数据    {'act':'sdkload'}    dianbo_001    mpp_sdkload_iphone    1

buffer
    公共-校验数据    ${buffer}    iphone_001    ${table_buffer}    1

cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    1

点播播放定时上报cdn-r1
    公共-校验数据    ${r1}    aphone_dianbo_1    mpp_cdnq_5_iphone    1

点击赞pfc
    公共-删除数据
    点播播放页-赞
    sleep    2
    公共-校验数据    ${pfc}    pfc-zan    ${table_click}    1

点击分享按钮share
    点播播放页-暂停
    公共-删除数据
    点播播放页-分享
    sleep    2
    公共-校验数据    {'act':'share','pos':'9'}    share_dianbo_01    ${table_click}    1

分享浮层弹出share
    公共-校验数据    {'act':'share','pos':'16'}    share_dianbo_16    ${table_click}    1

分享到朋友圈share
    点播播放页-分享到    朋友圈
    sleep    2
    公共-校验数据    ${share}    share_dianbo_02    ${table_click}    1

分享到微信share
    点击确认按钮
    点播播放页-分享到    微信
    公共-校验数据    ${share}    share_dianbo_03    ${table_click}    1

分享到微博share
    点击确认按钮
    点播播放页-分享到    微博
    公共-校验数据    ${share}    share_dianbo_04    ${table_click}    1

分享到QQshare
    点击确认按钮
    Comment    点播播放页-分享到    QQ
    公共-校验数据    ${share}    share_dianbo_04    ${table_click}    1

分享到QQ空间share
    点击确认按钮
    Comment    点播播放页-分享到    QQ空间
    点击确认按钮
    公共-校验数据    ${share}    share_dianbo_04    ${table_click}    1

点击节目简介pfc
    公共-删除数据
    点播播放页-节目详情
    sleep    2
    公共-校验数据    ${pfc}    pfc-brief    ${table_click}    1

退出播放pvs
    公共-删除数据
    点播播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    dianbo_002    ${table_pvs}    1

退出播放pvs1
    公共-校验数据    ${pvs1}    dianbo_002    ${table_pvs1}    1

退出卡顿
    sleep    2
    公共-校验数据    ${r3}    aphone_dianbo_3    mpp_cdnq_5_iphone    1

点播页再次进入pvs
    公共-删除数据
    sleep    5
    首页-青云志
    sleep    18
    公共-校验数据    ${pvs}    big_dianbo    ${table_pvs_dianbo}    1

点播页再次进入pvs1
    公共-校验数据    ${pvs1}    big_dianbo    ${table_pvs1}    1
