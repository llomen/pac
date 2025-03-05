*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${list}           {'act':'list'}
${dataclick}      {'act':'data-click'}

*** Test Cases ***
vippvs
    sleep    5
    公共-删除数据
    首页-vip
    公共-校验数据    ${pvs}    vip_001    ${table_pvs}    1

vippvs1
    公共-校验数据    {'logtype':'pv','cntp':'ch_vipSecondList'}    vip_001    ${table_pvs1}    1

会员首页-会员俱乐部pvs
    公共-删除数据
    频道页-切换tab    会员俱乐部
    公共-校验数据    ${pvs}    vip_002    ${table_pvs}    1

会员首页-会员俱乐部pvs1
    公共-校验数据    {'logtype':'pv','cntp':'ch_vipSecondList'}    vip_002    ${table_pvs1}    1

会员俱乐部-电视剧pvs
    公共-删除数据
    频道页-切换tab    电视剧
    公共-校验数据    ${pvs}    vip_003    ${table_pvs}    1

会员俱乐部-电视剧pvs1
    公共-校验数据    ${pvs1}    vip_003    ${table_pvs1}    1

电视剧片库list
    #公共-校验数据    ${list}    pianku_dianshi_015    mpp_pianku_list_iphone_dianshiju    1
    公共-校验数据    ${list}    pianku_dianshi_002    mpp_pianku_list_iphone_dianshiju    1

甜蜜互宠list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "甜蜜互宠")]
    sleep    2
    #公共-校验数据    ${list}    pianku_dianshi_016    mpp_pianku_list_iphone_dianshiju    1
    公共-校验数据    ${list}    pianku_dianshi_001    mpp_pianku_list_iphone_dianshiju    1

电视剧片库点击视频播放data-click
    公共-删除数据
    公共－点击页面文本    憨媳当家
    sleep    5
    公共-校验数据    ${dataclick}    pianku_dianshi_019    mpp_pianku_dataclick_zuhe_iphone    1

电视剧片库进入点播页pvs
    公共-校验数据    ${pvs}    vip_004    ${table_pvs_dianbo}    1

电视剧片库进入点播页pvs1
    公共-校验数据    ${pvs1}    vip_004    ${table_pvs1}    1

点播页返回电视剧片库pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    vip_005    ${table_pvs}    1

点播页返回电视剧片库pvs1
    公共-校验数据    ${pvs1}    vip_005    ${table_pvs1}    1

点热搜跳搜索页pvs
    公共-删除数据
    公共－点击页面文本    赵丽颖
    sleep    3
    公共-校验数据    ${pvs}    vip_006    ${table_pvs}    1

点热搜跳搜索页pvs1
    公共-校验数据    ${pvs1}    vip_006    ${table_pvs1}    1

取消返回片库pvs
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pvs}    vip_007    ${table_pvs}    1

取消返回片库pvs1
    公共-校验数据    ${pvs1}    vip_007    ${table_pvs1}    1

电视剧-少儿pvs
    公共-删除数据
    频道页-切换tab    少儿
    公共-校验数据    ${pvs}    vip_008    ${table_pvs}    1

电视剧-少儿pvs1
    公共-校验数据    ${pvs1}    vip_008    ${table_pvs1}    1

少儿list
    公共-校验数据    ${list}    pianku_shaoer_001    mpp_pianku_list_iphone_shaoer    1

少儿-探索pvs
    公共-删除数据
    频道页-切换tab    探索
    公共-校验数据    ${pvs}    vip_009    ${table_pvs}    1

少儿-探索pvs1
    公共-校验数据    ${pvs1}    vip_009    ${table_pvs1}    1

会员首页pd
    公共-校验数据    ${pd}    pd_1    ${table_click}    1

点闪图进点播页pvs
    公共-删除数据
    公共－xpath    //XCUIElementTypeTable/XCUIElementTypeCell[1]
    sleep    3
    公共-校验数据    ${pvs}    vip_010    ${table_pvs_dianbo}    1

点闪图进点播页pvs1
    公共-校验数据    ${pvs1}    vip_010    ${table_pvs1}    1

点播页返回探索pvs
    公共-删除数据
    点播播放页-返回
    sleep    3
    公共-校验数据    ${pvs}    vip_011    ${table_pvs}    1

点播页返回探索pvs1
    公共-校验数据    ${pvs1}    vip_011    ${table_pvs1}    1

搜索页pvs
    公共-删除数据
    vip-搜索
    公共-校验数据    ${pvs}    vip_012    ${table_pvs}    1

搜索页pvs1
    公共-校验数据    ${pvs1}    vip_012    ${table_pvs1}    1

搜索页返回pvs
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pvs}    vip_013    ${table_pvs}    1

搜索页返回pvs1
    公共-校验数据    ${pvs1}    vip_013    ${table_pvs1}    1

*** Keywords ***
vip-搜索
    sleep    1
    tap    探索    100    10
    sleep    1
