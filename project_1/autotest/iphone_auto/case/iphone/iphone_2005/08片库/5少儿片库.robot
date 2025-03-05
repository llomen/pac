*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${tagselect}      {'act':'tag-select'}
${list}           {'act':'list'}
${dataclick}      {'act':'data-click'}

*** Test Cases ***
全部list
    首页-频道管理
    sleep    2
    公共－点击页面文本    少儿
    公共-删除数据
    sleep    2
    公共－xpath    //XCUIElementTypeButton[@name="全部"]
    公共-校验数据    ${list}    pianku_shaoer_002    mpp_pianku_list_iphone_shaoer    1

少儿节目list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "搞笑动画")]
    公共-校验数据    ${list}    pianku_shaoer_003    mpp_pianku_list_iphone_shaoer    1

筛选0-3岁list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "0-3岁")]
    公共-校验数据    ${list}    pianku_shaoer_004    mpp_pianku_list_iphone_shaoer    1

最热list
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "最新")]
    公共-校验数据    ${list}    pianku_shaoer_005    mpp_pianku_list_iphone_shaoer    1

点击视频播放data-click
    公共-删除数据
    公共－xpath    (//XCUIElementTypeImage[1]/following-sibling::XCUIElementTypeButton[1])[1]
    公共-校验数据    ${dataclick}    pianku_shaoer_004    mpp_pianku_dataclick_shaixuan_iphone    1
