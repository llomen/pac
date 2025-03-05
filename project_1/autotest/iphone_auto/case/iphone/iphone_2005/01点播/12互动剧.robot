*** Settings ***
Documentation     正片、花絮、相关饭团、看了还会看
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pfc}            {'act':'pfc'}

*** Test Cases ***
进入互动剧pvs
    sleep    3
    首页-搜索
    搜索首页－输入搜索词    明星大侦探5 互动版
    搜索－点击搜索
    公共-删除数据
    公共－点击页面文本    2019-12-21 范丞丞陷入迷局等你来解救！
    公共-校验数据    ${pvs}    hudongju_001    ${table_pvs_dianbo}    1

进入互动剧pvs1
    公共-校验数据    ${pvs1}    hudongju_001    ${table_pvs1}    1

进入互动剧sp
    公共-校验数据    ${sp}    hudongju_001    ${table_sp}    1

正片加载事件vl
    sleep    3
    公共-校验数据    {'act':'vl','pos':'1'}    vl_hudongju    ${table_click}    1

进入互动剧无vv
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    0

进入互动剧无buffer
    公共-校验数据    ${buffer}    feed_001    ${table_buffer}    0

进入互动剧无hb
    公共-校验数据    ${hb3}    bodan_3    ${table_hb_sdk}    0

互动剧分享点击pfc
    公共-删除数据
    点播播放页-分享
    sleep    2
    公共-校验数据    ${pfc}    pfc-share-hudongju    ${table_click}    1

点击分享按钮share
    公共-校验数据    {'act':'share','pos':'9'}    share_hudongju_01    ${table_click}    1

分享浮层弹出share
    公共-校验数据    {'act':'share','pos':'16'}    share_hudongju_16    ${table_click}    1

分享到朋友圈share
    点播播放页-分享到    朋友圈
    sleep    2
    公共－点击页面文本    确认
    公共-校验数据    ${share}    share_hudongju_02    ${table_click}    1

切换下一个互动剧pvs
    公共-删除数据
    公共－点击页面文本    难倒何炅魏大勋的难题等你来挑战
    sleep    3
    公共-校验数据    ${pvs}    hudongju_002    ${table_pvs_dianbo}    1

切换下一个互动剧pvs1
    公共-校验数据    ${pvs1}    hudongju_002    ${table_pvs1}    1

切换下一个互动剧sp
    公共-校验数据    ${sp}    hudongju_002    ${table_sp}    1

退出互动剧pvs
    公共-删除数据
    互动剧播放-返回
    公共-校验数据    ${pvs}    hudongju_003    ${table_pvs}    1

退出互动剧pvs1
    公共-校验数据    ${pvs1}    hudongju_003    ${table_pvs1}    1

互动剧vv
    公共－点击页面文本    2019-12-21 范丞丞陷入迷局等你来解救！
    sleep    3
    公共-删除数据
    按坐标点击元素    nsp= name=="互动播放" and type=="XCUIElementTypeButton"
    sleep    10
    公共-校验数据    ${aplay}    hudongju_001    ${table_vv}    1

互动剧buffer
    公共-校验数据    ${buffer}    hudongju_001    ${table_buffer}    1

互动剧3hb
    公共-校验数据    ${hb3}    hudongju_03    ${table_hb_sdk}    1

互动剧5hb
    公共-校验数据    ${hb5}    hudongju_05    ${table_hb_sdk}    1

点播播放定时上报cdn-r1
    公共-校验数据    ${r1}    aphone_dianbo_1    mpp_cdnq_5_iphone    1

退出卡顿
    sleep    5
    公共-校验数据    ${r3}    aphone_dianbo_3    mpp_cdnq_5_iphone    1

互动剧结束hb
    公共-校验数据    ${hb_end}    hudongju_end    ${table_hb_sdk}    1
