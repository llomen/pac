*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
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
    sleep    5
    搜索－结果页点播单
    sleep    5
    公共-校验数据    ${cp1}    ke2_01    ${table_cp}    1

cdn1
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    1
    Set Global Variable    ${result}

播单页pvs
    公共-校验数据    ${pvs}    bodan_001    ${table_pvs_dianbo}    1

播单页pvs1
    公共-校验数据    ${pvs1}    bodan_001    ${table_pvs1}    1

buffer
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

aplay
    公共-校验数据    ${aplay}    iphone_bodan_001    ${table_vv}    1

sdkload
    公共-校验数据    {'act':'sdkload'}    bodan_001    mpp_sdkload_iphone    1

进入播单sp
    公共-校验数据    ${sp}    bodan_001    ${table_sp}    1

播单列表加载vl
    公共-校验数据    {'act':'vl','pos':'3'}    vl_bodan    ${table_click}    1

播单模块曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=3'}    show_dianbo_3    ${table_show}    1

点播3hb
    公共-校验数据    ${hb3}    bodan_3    ${table_hb_sdk}    1

点播5hb
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

上滑到看了还会看
    点播播放页-暂停
    swipe    200    500    200    200

播单曝光bdrelatepv
    公共-校验数据    ${bdrelatepv}    iphone_bodan_001    mpp_recommendpv_bdrelatepv    1

播单点击bdrecommend_rel
    公共-删除数据
    公共－点击页面文本    刘德华张学友陈伟霆！演戏唱歌两不误的香港歌手
    公共-校验数据    ${bdrecommend_rel}    iphone_bodan_001    mpp_bdrecommend_rel    1

切换下一个视频pvs
    sleep    3
    公共-校验数据    ${pvs}    dianboxiayige_001    ${table_pvs_dianbo}    1

切换下一个视频pvs1
    公共-校验数据    ${pvs1}    dianboxiayige_001    ${table_pvs1}    1

切换下一个视频hb
    sleep    3
    公共-校验数据    ${hb_end}    dianboxiayige_001    ${table_hb_sdk}    1

切换下一个视频aplay
    公共-校验数据    ${aplay}    dianboxiayige_001    ${table_vv}    1

播放结束hb
    公共-校验数据    ${hb_end}    dianboxiayige_001    ${table_hb_sdk}    1

切换视频sdkload
    公共-校验数据    {'act':'sdkload'}    dianbo_004    mpp_sdkload_iphone    1

切换视频buffer
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

连播看了还会看sp
    公共-校验数据    ${sp}    dianboxiayige_001    ${table_sp}    1

退出播放pvs
    sleep    2
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    bodan_002    ${table_pvs}    1

退出播放pvs1
    公共-校验数据    ${pvs1}    bodan_002    ${table_pvs1}    1

滑动到底后切换到评论pvs
    搜索－结果页点播单
    sleep    5
    公共-删除数据
    上滑
    sleep    2
    公共-校验数据    ${pvs}    bodan_002    ${table_pvs}    0

滑动到底后切换到评论pvs1
    公共-校验数据    ${pvs1}    bodan_002    ${table_pvs1}    0

正片列表浮层曝光cv
    公共-校验数据    ${cv}    comment_1    ${table_cv}    1
