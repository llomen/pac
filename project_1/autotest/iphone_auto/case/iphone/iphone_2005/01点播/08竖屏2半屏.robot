*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1
Resource          ../5.3对象库.robot


*** Variables ***
${show}           {'logtype':'show'}
${comment}        {'act':'comment'}
${table_show}     mpp_show_5_iphone_sdk
${table_sp}       mpp_sp_iphone
${share}          {'act':'share'}
${cp10}           {'act':'cp1'}
${cdn1}           {'s':'1'}
${cdn3}           {'s':'3'}
${cdn2}           {'s':'2'}
${hb3}            {'ht':'0','act':'hb'}
${hb5}            {'ht':'1','act':'hb'}
${hb_end}         {'ht':'2','act':'hb'}
${hb3_cj}         {'ht':'0','act':'hb'}
${hb5_cj}         {'ht':'1','act':'hb'}
${hb_end_cj}      {'ht':'2','act':'hb'}
${oc_start}       {'act':'oc','pos':'5'}
${oc_end}         {'act':'oc','pos':'6'}
${pfc22}          {'act':'pfc','pos':'22'}
${pfc23}          {'act':'pfc','pos':'23'}

*** Test Cases ***
进入竖屏已缓存pvs
    首页-搜索
    搜索首页－输入搜索词    小吃播
    搜索－点击搜索
    公共-删除数据
    公共－点击页面文本    2019-09-05 小朋友吃荷包蛋看起来特别香
    sleep    3
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

进入竖屏已缓存pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

进入竖屏cp1
    公共-校验数据    ${cp1}    ke2_01    ${table_cp}    1

连播sp
    公共-校验数据    ${sp}    feed_001    ${table_sp}    1

定时上报cdn-r1
    公共-校验数据    ${r1}    aphone_changjing_1    mpp_cdnq_5_iphone    0

buffer
    公共-校验数据    ${buffer}    feed_001    ${table_buffer}    0

cdn1
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    0

cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    0

aplay
    公共-校验数据    ${aplay}    feed_001    ${table_vv}    1

心跳hb3
    sleep    8
    公共-校验数据    ${hb3}    feed_03    ${table_hb_sdk}    0

心跳hb5
    公共-校验数据    ${hb5}    feed_05    ${table_hb_sdk}    0

点节目账号pvs
    公共-删除数据
    点击不可见文本    xpath=(//XCUIElementTypeStaticText[@name="小吃播"])[1]
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

点节目账号pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

他人主页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

他人主页返回pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

点+关注pvs
    公共-删除数据
    公共－点击页面文本    关注
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

点+关注pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

登录页返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

登录页返回pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

点击下载按钮pfc
    公共-删除数据
    点播播放页-下载
    sleep    2
    公共-校验数据    ${pfc}    pfc-download    ${table_click}    1

下载pvs
    公共-校验数据    ${pvs}    xiazai_001    ${table_pvs}    1

下载pvs1
    公共-校验数据    ${pvs1}    xiazai_001    ${table_pvs1}    0

下载浮层曝光cv
    公共-校验数据    ${cv}    play_03    ${table_cv}    1

退出下载pvs
    公共-删除数据
    公共－点击页面文本    close icon
    sleep    2
    公共-校验数据    ${pvs}    xiazai_002    ${table_pvs_dianbo}    1

退出下载pvs1
    公共-校验数据    ${pvs1}    xiazai_002    ${table_pvs1}    0

点击赞pfc
    公共-删除数据
    sleep    2
    点播播放页-赞
    sleep    2
    公共-校验数据    ${pfc}    pfc-zan    ${table_click}    1

点击分享按钮share
    点播播放页-暂停
    公共-删除数据
    点播播放页-分享
    sleep    2
    公共-校验数据    {'act':'share','pos':'9'}    share_bodan_01    ${table_click}    1

点击分享按钮pfc
    公共-校验数据    {'act':'pfc'}    share_bodan_01    ${table_click}    1

分享浮层弹出share
    公共-校验数据    {'act':'share','pos':'16'}    share_bodan_16    ${table_click}    1

分享到朋友圈share
    公共-删除数据
    公共－点击页面文本    朋友圈
    公共－点击页面文本    确认
    sleep    2
    公共-校验数据    ${share}    share_bodan_02    ${table_click}    1

竖屏加入看单btclick
    公共-删除数据
    新版点播-加入看单
    公共-校验数据    ${btclick}    btclick_001    ${table_click}    1

竖屏加入看单pfc
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    0

竖屏取消加入看单btclick
    公共-删除数据
    新版点播-加入看单
    公共-校验数据    ${btclick}    btclick_002    ${table_click}    1

竖屏取消加入看单pfc
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    0

相关饭团加载事件vl
    公共-删除数据
    竖屏下滑
    sleep    2
    公共-校验数据    {'act':'vl','pos':'5'}    vl_zhanghao    ${table_click}    1

相关饭团曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=133'}    show_dianbo_1    ${table_show}    1

饭团人气榜曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=134'}    show_dianbo_1    ${table_show}    1

正片查看更多pfc
    公共-删除数据
    公共－点击页面文本    查看更多
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    1

正片列表pvs
    公共-校验数据    ${pvs}    xiazai_001    ${table_pvs}    0

正片列表pvs1
    公共-校验数据    ${pvs1}    xiazai_001    ${table_pvs1}    0

正片浮层曝光cv
    公共-校验数据    ${cv}    play_03    ${table_cv}    1

关闭正片列表pvs
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[@name="小吃播"])[4]/following-sibling::XCUIElementTypeButton[1]
    公共-校验数据    ${pvs}    xiazai_001    ${table_pvs}    0

点饭团pfc
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[@name="小吃播"])[3]
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    1

点饭团pvs
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

点饭团pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

他人主页返回2pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

他人主页返回2pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

点人气榜pfc
    公共-删除数据
    sleep    3
    comment    公共－点击页面文本    人气榜
    tap    xpath=(//XCUIElementTypeStaticText[@name="小吃播"])[3]    300    -50
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    1

点人气榜pvs
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

点人气榜pvs1
    公共-校验数据    ${pvs1_H5}    shuping_01    ${table_pvs1}    1

饭团人气榜返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

饭团人气榜返回pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    1

周边大放送加载事件vl
    公共-删除数据
    竖屏下滑
    sleep    2
    公共-校验数据    {'act':'vl','pos':'17'}    vl_zhanghao    ${table_click}    1

周边大放送曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=17'}    show_dianbo_1    ${table_show}    1

看了还会看加载事件vl
    公共-校验数据    {'act':'vl','pos':'8'}    vl_zhanghao    ${table_click}    1

看了还会看曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=8'}    show_dianbo_1    ${table_show}    1

周边大放送点击pfc
    公共-删除数据
    公共－点击页面文本    人气榜
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    1

周边大放送pvs
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

周边大放送pvs1
    公共-校验数据    ${pvs1}    shuping_01    ${table_pvs1}    0

周边大放送浮层曝光cv
    公共-校验数据    ${cv}    play_03    ${table_cv}    1

关闭周边大放送pvs
    公共-删除数据
    点屏幕
    公共-校验数据    ${pvs}    shuping_01    ${table_pvs_dianbo}    1

退出播放pvs
    公共-删除数据
    点播播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    dianbo_002    ${table_pvs}    1

退出播放pvs1
    公共-校验数据    ${pvs1}    dianbo_002    ${table_pvs1}    1

退出卡顿
    sleep    2
    公共-校验数据    ${r3}    aphone_dianbo_3    mpp_cdnq_5_iphone    0

离线hb

*** Keywords ***
点屏幕
    click a point    100    100

播放下一个
    公共－点击页面文本    next icon

竖屏分享
    公共－点击页面文本    share fullscreen icon

竖屏下滑
    获取屏幕大小
    ${x1} =    evaluate    ${屏幕宽度}*0.5
    ${y1} =    evaluate    ${屏幕高度}*0.8
    ${x2} =    evaluate    ${屏幕宽度}*0.6
    ${y2} =    evaluate    ${屏幕高度}*0.2
    log    ${x1},${y1},${x2},${y2}
    sleep    1
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    sleep    2
