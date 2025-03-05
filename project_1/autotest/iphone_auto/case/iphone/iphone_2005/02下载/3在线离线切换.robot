*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${switch}         {'act':'switch'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {‘r’:'1'}
${st}             {'act':'st'}
${as}             {'act':'as'}
${ae}             {'act':'ae'}
${pv}             {'act':'pv'}
${vv}             {'act':'vv'}
${share}          {'act':'share'}
${buffer}         {'act':'buffer'}
${hb}             {'act':'hb','ht':'2'}

*** Test Cases ***
进入播单底层页cp1
    首页-搜索
    搜索首页－输入搜索词    我的特工爷爷
    搜索-点击搜索
    公共-删除数据
    搜索－结果页点播单
    sleep    10
    公共-校验数据    ${cp1}    ke2_01    ${table_cp}    1

广告type0
    sleep    5
    公共-校验数据    {'type':'0'}    ke2_02    ${table_adcdn}    1

广告type1
    公共-校验数据    {'type':'1'}    ke2_03    ${table_adcdn}    1

广告type3
    公共-校验数据    {'type':'3'}    ke2_04    ${table_adcdn}    1

广告type4
    sleep    4
    公共-校验数据    {'type':'4'}    ke2_05    ${table_adcdn}    1

广告type6
    公共-校验数据    {'type':'6'}    ke2_06    ${table_adcdn}    1

cdn1
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    1

点击分享按钮share
    点播播放页-暂停
    公共-删除数据
    点播播放页-分享
    sleep    2
    公共-校验数据    {'act':'share','pos':'9'}    share_bodan_01    ${table_click}    1

分享浮层弹出share
    公共-校验数据    {'act':'share','pos':'16'}    share_bodan_16    ${table_click}    1

分享到朋友圈share
    点播播放页-分享到    朋友圈
    sleep    2
    公共-校验数据    ${share}    share_bodan_02    ${table_click}    1

分享到微信share
    Comment    sleep    5
    点击确认按钮
    Comment    公共－点击坐标点    100    100
    点播播放页-分享到    微信
    公共-校验数据    ${share}    share_bodan_03    ${table_click}    1

分享到微博share
    Comment    sleep    5
    点击确认按钮
    Comment    公共－点击坐标点    100    100
    Comment    点播播放页-分享到    微博
    公共-校验数据    ${share}    share_bodan_04    ${table_click}    1

分享到QQshare
    Comment    sleep    5
    点击确认按钮
    Comment    公共－点击坐标点    100    100
    Comment    点播播放页-分享到    QQ
    公共-校验数据    ${share}    share_bodan_05    ${table_click}    1

分享到QQ空间share
    Comment    sleep    5
    Comment    公共－点击坐标点    100    100
    点击确认按钮
    Comment    点播播放页-分享到    QQ空间
    点击确认按钮
    公共-校验数据    ${share}    share_bodan_06    ${table_click}    1

切换下一个视频pvs
    Capture Page Screenshot
    comment    scroll    name=刘德华冯绍峰组型男天团    name=刘德华秒变坏爸爸
    公共-删除数据
    公共－点击页面文本    刘德华秒变坏爸爸
    sleep    5
    公共-校验数据    ${pvs}    dianboxiayige_001    ${table_pvs_dianbo}    1

切换下一个视频pvs1
    公共-校验数据    ${pvs1}    dianboxiayige_001    ${table_pvs1}    1

切换下一个视频hb
    sleep    3
    公共-校验数据    ${hb}    dianboxiayige_001    ${table_hb_sdk}    1

切换下一个视频aplay
    sleep    18
    公共-校验数据    ${aplay}    dianboxiayige_001    ${table_vv}    1

sdkload
    公共-校验数据    {'act':'sdkload'}    dianbo_004    mpp_sdkload_iphone    1

切换下一个视频buffer
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1
