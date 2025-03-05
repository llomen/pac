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
    公共－点击页面文本    2019-09-05 小朋友吃荷包蛋看起来特别香

点节目账号pvs
    sleep    5
    #存在进入定位到正片，遮挡账号
    swipe    200    600    200    700
    公共-删除数据
    点击不可见文本    xpath=(//XCUIElementTypeStaticText[@name="小吃播"])[1]
    公共-校验数据    ${pvs}    shuping_11    ${table_pvs_other}    1

点节目账号pvs1
    公共-校验数据    ${pvs1}    shuping_11    ${table_pvs1}    1

他人主页返回pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    shuping_12    ${table_pvs_other}    1

他人主页返回pvs1
    公共-校验数据    ${pvs1}    shuping_12    ${table_pvs1}    1

点+关注弹出登录框pvs
    公共-删除数据
    公共－点击页面文本    关注
    公共-校验数据    ${pvs}    pinglun_001    ${table_pvs}    1

弹出登录框cv
    公共-校验数据    ${cv}    login_02    ${table_cv}    1

点播页stay
    公共-校验数据    ${stay}    stay_31    ${table_stay}    1

关闭登录框pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

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
    公共-校验数据    ${pfc}    pfc-share-banping    ${table_click}    1

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

周边大放送加载事件vl
    公共-删除数据
    竖屏下滑
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
    公共－点击页面文本    立即阅读
    sleep    2
    公共-校验数据    ${pfc}    pfc-zhoubian    ${table_click}    1

周边大放送pvs
    sleep    2
    公共-校验数据    ${pvs}    fangsong_01    ${table_pvs_other}    1

周边大放送pvs1
    公共-校验数据    ${pvs1}    dianbo_zhifu_002    ${table_pvs1}    0

周边大放送半屏曝光cv
    公共-校验数据    ${cv}    play_16    ${table_cv}    1

关闭周边大放送pvs
    公共-删除数据
    点播播放页-点屏幕
    sleep    2
    公共-校验数据    ${pvs}    fangsong_02    ${table_pvs_other}    1

退出播放pvs
    公共-删除数据
    点播播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    bodan_002    ${table_pvs}    1

退出播放pvs1
    公共-校验数据    ${pvs1}    bodan_002    ${table_pvs1}    1

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
    ${y2} =    evaluate    ${屏幕高度}*0.4
    log    ${x1},${y1},${x2},${y2}
    sleep    1
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    sleep    2
