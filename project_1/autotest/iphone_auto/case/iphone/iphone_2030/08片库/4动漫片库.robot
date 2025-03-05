*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${tagselect}      {'act':'tag-select'}
${list}           {'act':'list'}
${dataclick}      {'act':'data-click'}
${pvs}            {'act':'pvs'}

*** Test Cases ***
少女list
    首页-频道管理
    sleep    2
    公共－点击页面文本    动漫
    sleep    2
    公共-删除数据
    公共－xpath    //XCUIElementTypeButton[@name="全部"]
    公共-校验数据    ${list}    pianku_dongman_002    mpp_pianku_list_iphone_dongman    1

全部list
    公共-删除数据
    sleep    2
    公共－xpath    (//XCUIElementTypeStaticText[contains(@label, "全部")])[1]
    sleep    2
    公共-校验数据    ${list}    pianku_dongman_001    mpp_pianku_list_iphone_dongman    1

恋爱少女list
    公共-删除数据
    sleep    2
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "恋爱少女")]
    sleep    2
    公共-校验数据    ${list}    pianku_dongman_002    mpp_pianku_list_iphone_dongman    1

内地list
    公共-删除数据
    comment    公共－点击页面文本    内地
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "内地")]
    公共-校验数据    ${list}    pianku_dongman_003    mpp_pianku_list_iphone_dongman    1

TV版list
    公共-删除数据
    comment    公共－点击页面文本    TV版
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "TV版")]
    公共-校验数据    ${list}    pianku_dongman_004    mpp_pianku_list_iphone_dongman    1

最新list
    公共-删除数据
    comment    公共－点击页面文本    最新
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "最新")]
    公共-校验数据    ${list}    pianku_dongman_005    mpp_pianku_list_iphone_dongman    1

点击视频播放data-click
    comment    公共-删除数据
    公共－点击页面文本    汪汪队立大功 第五季
    公共-校验数据    ${dataclick}    pianku_dongman_007    mpp_pianku_dataclick_shaixuan_iphone    1
