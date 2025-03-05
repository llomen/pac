*** Settings ***
Documentation     片库'fstlvlId', 'chargeInfo'字段删除
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g4
Resource          ../5.3对象库.robot


*** Variables ***
${tagselect}      {'act':'tag-select'}
${list}           {'act':'list'}
${dataclick}      {'act':'data-click'}

*** Test Cases ***
甜蜜互宠list
    sleep    2
    Comment    首页-频道管理
    公共－点击页面文本    电视剧
    sleep    2
    公共-删除数据
    公共－xpath    //XCUIElementTypeButton[@name="甜蜜"]
    sleep    2
    公共-校验数据    ${list}    pianku_dianshi_003    mpp_pianku_list_iphone_dianshiju    1

进入片库pvs
    公共-校验数据    ${pvs}    pianku_dianshi_002    ${table_pvs}    1

虐恋情深list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "虐恋情深")]
    sleep    2
    公共-校验数据    ${list}    pianku_dianshi_004    mpp_pianku_list_iphone_dianshiju    1

回到全部类型list
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[contains(@label, "全部")])[1]
    sleep    2
    公共-校验数据    ${list}    pianku_dianshi_001    mpp_pianku_list_iphone_dianshiju    1

日韩list
    公共-删除数据
    Comment    公共－点击页面文本    韩国
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "日韩")]
    sleep    2
    公共-校验数据    ${list}    pianku_dianshi_005    mpp_pianku_list_iphone_dianshiju    1

回到全部区域list
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[contains(@label, "全部")])[2]
    sleep    2
    公共-校验数据    ${list}    pianku_dianshi_009    mpp_pianku_list_iphone_dianshiju    1

点击视频播放data-click
    公共-删除数据
    公共－点击页面文本    最动听的事
    sleep    2
    公共-校验数据    ${dataclick}    pianku_dianshi_007    mpp_pianku_dataclick_zuhe_iphone    1

返回片库pvs
    sleep    3
    公共-删除数据
    sleep    2
    点播播放页-返回
    公共-校验数据    ${pvs}    pianku_dianshi_008    ${table_pvs}    1

最新list
    公共-删除数据
    sleep    2
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "最新")]
    公共-校验数据    ${list}    pianku_dianshi_010    mpp_pianku_list_iphone_dianshiju    1
