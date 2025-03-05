*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        smoke
Resource          ../5.3对象库.robot


*** Variables ***
${tagselect}      {'act':'tag-select'}
${list}           {'act':'list'}
${dataclick}      {'act':'data-click'}

*** Test Cases ***
王牌综艺pvs
    sleep    2
    首页-频道管理
    公共－点击页面文本    综艺
    sleep    2
    公共-删除数据
    公共－xpath    //XCUIElementTypeButton[@name="王牌"]
    sleep    2
    公共-校验数据    ${pvs}    pianku_zongyi_002    ${table_pvs}    1

王牌综艺pvs1
    公共－xpath    //XCUIElementTypeButton[@name="王牌"]
    公共-校验数据    ${pvs1}    pianku_zongyi_002    ${table_pvs1}    1

全部list
    公共-删除数据
    sleep    1
    公共－xpath    (//XCUIElementTypeStaticText[contains(@name, "全部")])[1]
    sleep    2
    公共-校验数据    ${list}    pianku_zongyi_004    mpp_pianku_list_iphone_zongyi    1

大咖秀场list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "大咖秀场")]
    sleep    2
    公共-校验数据    ${list}    pianku_zongyi_005    mpp_pianku_list_iphone_zongyi    1

港台list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "港台")]
    sleep    2
    公共-校验数据    ${list}    pianku_zongyi_006    mpp_pianku_list_iphone_zongyi    1

最新list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "最新")]
    sleep    2
    公共-校验数据    ${list}    pianku_zongyi_007    mpp_pianku_list_iphone_zongyi    1

香港变为全部list
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[contains(@label, "全部")])[2]
    sleep    2
    公共-校验数据    ${list}    pianku_zongyi_008    mpp_pianku_list_iphone_zongyi    1

点击视频播放data-click
    公共-删除数据
    公共－xpath    (//XCUIElementTypeImage[1]/following-sibling::XCUIElementTypeButton[1])[1]
    sleep    3
    公共-校验数据    ${dataclick}    pianku_zongyi_009    mpp_pianku_dataclick_shaixuan_iphone    1

点击视频播放pvs
    公共-校验数据    ${pvs}    pianku_zongyi_010    ${table_pvs}    1

点击视频播放pvs1
    公共-校验数据    ${pvs1}    pianku_zongyi_010    ${table_pvs1}    1

返回片库pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    pianku_zongyi_011    ${table_pvs}    1

返回片库pvs1
    公共-校验数据    ${pvs1}    pianku_zongyi_011    ${table_pvs1}    1
