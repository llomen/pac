*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1
Resource          ../5.3对象库.robot

*** Variables ***
${oc_start}       {'act':'oc','pos':'5'}
${oc_end}         {'act':'oc','pos':'6'}
${pfc22}          {'act':'pfc','pos':'22'}
${pfc23}          {'act':'pfc','pos':'23'}

*** Test Cases ***
进入竖屏pvs
    首页-搜索
    搜索首页－输入搜索词    小吃播
    搜索－点击搜索
    公共-删除数据
    公共－点击页面文本    2019-09-05 小朋友吃荷包蛋看起来特别香
    sleep    8
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

进入竖屏pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

进入竖屏cp1
    公共-校验数据    ${cp1}    ke2_01    ${table_cp}    1

连播sp
    公共-校验数据    ${sp}    shuping_001    ${table_sp}    1

定时上报cdn-r1
    公共-校验数据    ${r1}    iphone_feed_1    mpp_cdnq_5_iphone    1

buffer
    公共-校验数据    ${buffer}    shuping_001    ${table_buffer}    1

cdn1
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    1

aplay
    公共-校验数据    ${aplay}    shuping_001    ${table_vv}    1

正片加载事件vl
    公共-校验数据    {'act':'vl','pos':'1'}    vl_zhengpian    ${table_click}    1

节目账号加载事件vl
    公共-校验数据    {'act':'vl','pos':'4'}    vl_zhanghao    ${table_click}    1

正片模块曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=1'}    show_dianbo_1    ${table_show}    1

节目账号曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=4'}    show_dianbo_1    ${table_show}    1

心跳hb3
    sleep    5
    公共-校验数据    ${hb3}    shikan_3    ${table_hb_sdk}    1

心跳hb5
    公共-校验数据    ${hb5}    shikan_5    ${table_hb_sdk}    1

全屏播放pfc
    点播播放页-暂停
    公共-删除数据
    sleep    5
    点播播放页-点屏幕
    公共－点击页面文本    full ToY icon
    公共-校验数据    ${pfc}    pfc_sp_qp    ${table_click}    1

点设置pfc
    公共-删除数据
    点屏幕
    公共－点击页面文本    play Full screen setting
    公共-校验数据    ${pfc}    pfc_sp_set    ${table_click}    1

设置浮层pvs
    公共-校验数据    ${pvs}    shuping_02    ${table_pvs}    1

设置浮层pvs1
    公共-校验数据    ${pvs1}    pinglun_002    ${table_pvs1}    0

设置浮层曝光cv
    公共-校验数据    ${cv}    play_13    ${table_cv}    1

点离线缓存pfc
    公共-删除数据
    公共－点击页面文本    离线缓存
    公共-校验数据    ${pfc}    pfc_sp_lxhc    ${table_click}    1

离线缓存浮层pvs
    公共-校验数据    ${pvs}    shuping_03    ${table_pvs}    1

离线缓存浮层pvs1
    公共-校验数据    ${pvs1}    pinglun_002    ${table_pvs1}    0

离线缓存浮层曝光cv
    公共-校验数据    ${cv}    play_11    ${table_cv}    1

开始下载oc
    公共-删除数据
    点击不可见文本    xpath=(//XCUIElementTypeImage[@name="choice-iconD1"])[1]
    公共-校验数据    ${oc_start}    oc_start    ${table_click}    1

下载开始事件ds
    sleep    3
    公共-校验数据    {'act':'ds'}    ds_001    mpp_kpi_ds_iphone    1

下载cdn1
    公共-校验数据    ${cdn1}    aphone_xiazai_001    mpp_cdn_5_iphone_download    1

下载cdn2
    公共-校验数据    ${cdn2}    aphone_xiazai_002    mpp_cdn_5_iphone_download    1

下载cdn3
    公共-校验数据    ${cdn3}    aphone_xiazai_003    mpp_cdn_5_iphone_download    1

查看缓存pfc
    公共-删除数据
    公共－点击页面文本    查看缓存
    公共-校验数据    ${pfc}    pfc_sp_ckhc    ${table_click}    1

查看缓存pvs
    公共-校验数据    ${pvs}    shuping_04    ${table_pvs}    1

查看缓存pvs1
    公共-校验数据    ${pvs1}    shuping_04    ${table_pvs1}    1

关闭下载引导提示
    点击屏幕顶部

查看缓存返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shuping_05    ${table_pvs}    1

查看缓存返回pvs1
    公共-校验数据    ${pvs1}    shuping_05    ${table_pvs1}    1

点击全部缓存pfc
    公共－点击页面文本    全部缓存
    公共-校验数据    ${pfc22}    pfc-huancun-click2    ${table_click}    1

全部缓存展示pfc
    公共-校验数据    ${pfc23}    pfc-huancun-show2    ${table_click}    1

全部缓存取消pfc
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pfc}    pfc-alldownload_cancle2    ${table_click}    1

退出下载页pvs
    公共-删除数据
    点屏幕
    公共-校验数据    ${pvs}    shuping_06    ${table_pvs}    1

退出下载页pvs1
    公共-校验数据    ${pvs1}    shuping_05    ${table_pvs1}    0

竖屏全屏分享pfc
    公共-删除数据
    点屏幕
    竖屏分享
    公共-校验数据    ${pfc}    pfc-share-quanping    ${table_click}    1

竖屏全屏分享点击share
    公共-校验数据    {'act':'share','pos':'9'}    share_dianbo_01    ${table_click}    1

竖屏全屏分享弹出share
    公共-校验数据    {'act':'share','pos':'16'}    share_dianbo_16    ${table_click}    1

分享到微信share
    公共-删除数据
    公共－点击页面文本    微信
    公共－点击页面文本    确认
    公共-校验数据    {'act':'share'}    share_dianbo_03    ${table_click}    1

点清晰度pfc
    公共-删除数据
    sleep    5
    点屏幕
    公共－点击页面文本    标清
    公共-校验数据    ${pfc}    pfc-huancun-show2    ${table_click}    1

清晰度浮层pvs
    公共-校验数据    ${pvs}    shuping_07    ${table_pvs}    1

清晰度浮层pvs1
    公共-校验数据    ${pvs1}    pinglun_002    ${table_pvs1}    0

清晰度浮层曝光cv
    公共-校验数据    ${cv}    play_12    ${table_cv}    1

关闭清晰度
    点屏幕

点选集pfc
    公共-删除数据
    点屏幕
    公共－点击页面文本    选集
    公共-校验数据    ${pfc}    pfc-xuanji    ${table_click}    1

选集浮层pvs
    公共-校验数据    ${pvs}    shuping_08    ${table_pvs}    1

选集浮层pvs1
    公共-校验数据    ${pvs1}    pinglun_002    ${table_pvs1}    0

选集浮层曝光cv
    公共-校验数据    ${cv}    play_18    ${table_cv}    1

选集关闭pvs
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[@name="她吃东西的样子真可爱"])[1]
    sleep    5
    公共-校验数据    {'act':'pvs','fpn':'96'}    shuping_09    ${table_pvs}    1

播放选集视频pvs
    公共-校验数据    {'act':'pvs','fpn':'40'}    shuping_10    ${table_pvs_dianbo}    1

播放选集视频pvs1
    公共-校验数据    ${pvs1}    shuping_10    ${table_pvs1}    1

心跳停止hb
    sleep    2
    公共-校验数据    ${hb_end}    quanping_end    ${table_hb_sdk}    1

退出卡顿
    公共-校验数据    ${r3}    iphone_feed_3    mpp_cdnq_5_iphone    1

选集播放连播sp
    公共-校验数据    ${sp}    shuping_002    ${table_sp}    1

选集播放aplay
    公共-校验数据    ${aplay}    shuping_002    ${table_vv}    1

播放下一个pfc
    公共-删除数据
    点屏幕
    播放下一个
    公共-校验数据    ${pfc}    pfc-huancun-show2    ${table_click}    1

播放下一个视频pvs
    sleep    4
    公共-校验数据    ${pvs}    shuping_10    ${table_pvs_dianbo}    1

播放下一个视频pvs1
    公共-校验数据    ${pvs1}    shuping_10    ${table_pvs1}    1

播放下一个连播sp
    公共-校验数据    ${sp}    shuping_003    ${table_sp}    1

播放下一个aplay
    公共-校验数据    ${aplay}    shuping_002    ${table_vv}    1

*** Keywords ***
点屏幕
    click a point    100    100

播放下一个
    公共－点击页面文本    next icon

竖屏分享
    公共－点击页面文本    share fullscreen icon
