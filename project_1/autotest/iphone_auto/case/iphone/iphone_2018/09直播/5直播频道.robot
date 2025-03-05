*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}
${aplay}          {'act':'aplay'}
${livepmm}        {'act':'livepmm'}

*** Test Cases ***
直播性能livepmm
    首页-频道管理
    公共－点击页面文本    直播
    sleep    2
    公共-校验数据    ${livepmm}    iphone_zhibo    mpp_livepmm_5_iphone    1

直播pd
    公共-校验数据    ${pd}    pd_1    ${table_click}    1

电视台列表pvs
    公共-删除数据
    Comment    直播－搜索
    公共－点击页面文本    查看更多
    公共-校验数据    ${pvs}    zhiboguanzhu_001    ${table_pvs}    1

电视台列表pvs1
    公共-校验数据    ${pvs1}    zhiboguanzhu_001    ${table_pvs1}    1

进入电视台直播pvs
    公共-删除数据
    公共－点击页面文本    快乐购
    公共-校验数据    ${pvs}    zhiboguanzhu_002    ${table_pvs}    1

进入电视台直播pvs1
    公共-校验数据    ${pvs1}    zhiboguanzhu_002    ${table_pvs1}    1

返回电视台列表pvs
    公共-删除数据
    直播-退出
    公共-校验数据    ${pvs}    dianshitai_001    ${table_pvs}    1

返回电视台列表pvs1
    公共-校验数据    ${pvs1}    dianshitai_001    ${table_pvs1}    1

返回直播频道pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    dianshitai_005    ${table_pvs}    1

返回直播频道pvs1
    公共-校验数据    ${pvs1}    dianshitai_005    ${table_pvs1}    1

频道电视播放pvs
    公共-删除数据
    点击不可见文本    快乐购
    公共-校验数据    ${pvs}    dianshitai_002    ${table_pvs}    1

频道电视播放pvs1
    公共-校验数据    ${pvs1}    dianshitai_002    ${table_pvs1}    1

aplay
    sleep    5
    公共-校验数据    ${aplay}    aphone_dianshi_001    ${table_vv_zhibo}    1

退出播放pvs
    公共-删除数据
    直播-退出
    公共-校验数据    ${pvs}    dianshitai_003    ${table_pvs}    1

退出播放pvs1
    公共-校验数据    ${pvs1}    dianshitai_003    ${table_pvs1}    1

直播大事件pvs
    公共-删除数据
    公共－点击页面文本    少年说3
    公共-校验数据    ${pvs}    zhibo_dashijian1    ${table_pvs_dianbo}    1

直播大事件pvs1
    公共-校验数据    ${pvs1}    zhibo_dashijian1    ${table_pvs1}    1

直播大事件返回pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    zhibo_dashijian2    ${table_pvs}    1

直播大事件返回pvs1
    公共-校验数据    ${pvs1}    zhibo_dashijian2    ${table_pvs1}    1

直播大厅-登录页pvs
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="关注"])[1]
    公共-校验数据    ${pvs}    bu2_005    ${table_pvs}    1

直播大厅-登录页pvs1
    公共-校验数据    ${pvs1}    bu2_005    ${table_pvs1}    1

登录页-直播大厅pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    bu2_006    ${table_pvs}    1

登录页-直播大厅pvs1
    公共-校验数据    ${pvs1}    bu2_006    ${table_pvs1}    1
