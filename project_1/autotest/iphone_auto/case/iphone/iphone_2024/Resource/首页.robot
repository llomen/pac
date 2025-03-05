*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot

*** Variables ***
${icon_fangsong}    Channel subscribe iCON
${icon_saoma}     Channel scanning icon

*** Keywords ***
首页-精选
    公共－xpath    //XCUIElementTypeTabBar/XCUIElementTypeButton[1]

首页-直播
    Click Element    name=直播
    sleep    2

首页-vip
    Comment    Click Element    name=会员
    公共－xpath    //XCUIElementTypeTabBar/XCUIElementTypeButton[3]
    sleep    8

首页-关注
    公共－点击页面文本    关注
    Comment    ${aa}    Run Keyword And Return Status    Wait Until Page Contains Element    name=followed_fans
    Comment    run keyword if    ${aa}    关注-关闭浮层

首页-我
    comment    公共－点击页面文本    我
    公共－xpath    //XCUIElementTypeTabBar/XCUIElementTypeButton[5]
    comment    Background App

首页-饭团
    comment    公共－点击页面文本    饭团
    公共－xpath    //XCUIElementTypeTabBar/XCUIElementTypeButton[4]

首页-缓存
    公共－点击页面文本    Channel Download iCON

首页-搜索
    点击不可见文本    search_textField

首页-搜索按钮
    公共－xpath    //XCUIElementTypeTextField[@name="search_textField"]/following-sibling::XCUIElementTypeButton[1]

首页-播放记录
    公共－点击页面文本    Channel History iCON

首页-消息中心
    公共－点击页面文本    Channel Notice iCON

首页-每日放送
    公共－点击页面文本    ${icon_fangsong}

首页-扫一扫
    公共－点击页面文本    ${icon_saoma}

首页-频道管理
    公共－xpath    //XCUIElementTypeStaticText[@name="综艺"]/../../../following-sibling::XCUIElementTypeOther[1]/XCUIElementTypeButton

首页-青云志
    comment    公共－xpath    //XCUIElementTypeStaticText[@name="田不易逼李易峰杀赵丽颖以证清白"]/..
    公共－xpath    //XCUIElementTypeTable[1]/XCUIElementTypeCell[1]
    comment    公共－点击页面文本    田不易逼李易峰杀赵丽颖以证清白

频道页-切换tab
    [Arguments]    ${text}
    sleep    2
    点击不可见文本    ${text}
    sleep    2
    comment    ${size1}    获取元素高度    ${text}
    comment    run keyword and ignore error    公共－点击页面文本    ${text}
    comment    ${size2}    获取元素高度    ${text}
    comment    ${re} =    evaluate    ${size1}==${size2}
    comment    run keyword if    ${re}    按坐标点击元素    ${text}

频道页-全部
    频道页-切换tab    全部
    comment    run keyword and ignore error    公共－点击页面文本    全部
    comment    ${re}    run keyword and return status    element should be visible    全部
    comment    run keyword if    ${re}    公共－点击页面文本    全部

首页-关闭历史记录
    comment    run keyword and ignore error    公共－点击页面文本    White Close
    run keyword and ignore error    公共－点击页面文本    pushwindow close

获取元素高度
    [Arguments]    ${text}
    &{size} =    get element size    ${text}
    [Return]    ${size.width}

频道上滑
    sleep    2
    swipe    128    550    128    150
    sleep    1

新闻频道-点播放
    公共－xpath    (//XCUIElementTypeButton[@name="ShortVideo Pause iCON"])[1]

新闻频道-点标题
    公共－点击页面文本    AI合成主播丨宁夏为贫困重度残疾人提供照护服务

芒果文学返回
    sleep    5
    公共－点击页面文本    giftListClose
