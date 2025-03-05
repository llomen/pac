*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1
Resource          ../5.3对象库.robot

*** Variables ***
${hb3_cj}         {'ht':'0','act':'hb'}
${hb5_cj}         {'ht':'1','act':'hb'}
${hb_end_cj}      {'ht':'2','act':'hb'}

*** Test Cases ***
进入点播页
    首页-搜索
    搜索首页－输入搜索词    快乐大本营
    搜索-点击搜索
    comment    公共－xpath    (//XCUIElementTypeButton[@name="2"])[1]
    公共－点击页面文本    2018-08-11 流星四子解锁新技能现场秀唱功
    sleep    18
    点播播放页-暂停
    公共-删除数据

滑动到feed流
    公共-删除数据
    新版点播-滑动到feed流

feed流playfeedshow
    公共-校验数据    ${playfeedshow}    playfeedshow_001    ${table_playfeedshow}    1

自动播放playfeedclick
    公共-删除数据
    新版点播-feed流点播放
    公共-校验数据    ${playfeedclick}    playfeedclick_001    ${table_playfeedclick}    1

点击置顶滑动playfeedshow
    公共-校验数据    ${playfeedshow}    playfeedshow_001    ${table_playfeedshow}    1

播放不上报pvs
    公共-校验数据    ${pvs}    pinglun_006    ${table_pvs}    0

feed流可播比cp1
    公共-校验数据    ${cp1}    ke2_01    ${table_cp}    1

feed流连播sp
    公共-校验数据    ${sp}    feed_003    ${table_sp}    1

feed流cdn1
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

feed流cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    1

feed流cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    1

feed流播放定时上报cdn-r1
    公共-校验数据    ${r1}    iphone_feed_1    mpp_cdnq_5_iphone    1

feed流buffer
    公共-校验数据    ${buffer}    feed_001    ${table_buffer}    1

feed流视频播放aplay
    公共-校验数据    ${aplay}    feed_001    ${table_vv}    1

feed流大数据心跳hb3
    sleep    8
    公共-校验数据    ${hb3}    feed_03    ${table_hb_sdk}    1

feed流大数据心跳hb5
    公共-校验数据    ${hb5}    feed_05    ${table_hb_sdk}    1

上滑自动播放playfeedclick
    公共-删除数据
    上滑
    sleep    3
    公共-校验数据    ${playfeedclick}    playfeedclick_003    ${table_playfeedclick}    1

feed流show
    公共-校验数据    ${show}    show_pinglun    ${table_show}    1

feed流大数据心跳停止hb
    公共-校验数据    ${hb_end}    feed_end    ${table_hb_sdk}    1

feed流播放定时上报cdn-r3
    公共-校验数据    ${r3}    iphone_feed_3    mpp_cdnq_5_iphone    1

下一个sp
    公共-校验数据    ${sp}    feed_004    ${table_sp}    1
