*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}

*** Test Cases ***
进入语音直播pvs
    [Setup]
    首页-搜索
    搜索首页－输入搜索词    少年说
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

直播搜索pvs1
    公共-校验数据    ${pvs1}    sousuo_002    ${table_pvs1}    1

直播搜索search
    公共-校验数据    ${search}    zhibo_001    mpp_search_5_5_iphone    1

直播搜索view
    公共-校验数据    ${view}    zhibo_001    mpp_view_5_5_iphone    1

直播搜索click
    公共-删除数据
    公共－点击页面文本    少年说3
    sleep    2
    公共-校验数据    ${click}    zhibo_001    mpp_click_5_5_iphone    1

直播播放pvs
    [Setup]
    公共-校验数据    ${pvs}    sousuo_zhibo    mpp_pv_5_5_iphone_sdk_qita    1

直播播放pvs1
    公共-校验数据    ${pvs1}    sousuo_zhibo    ${table_pvs1}    1

直播退出播放pvs
    [Setup]
    公共-删除数据
    sleep    2
    直播-退出
    公共-校验数据    ${pvs}    sousuo_zhibotuichu    mpp_pv_5_5_iphone_sdk_qita    1

直播退出播放pvs1
    公共-校验数据    ${pvs1}    sousuo_zhibotuichu    ${table_pvs1}    1
