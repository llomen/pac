*** Settings ***
Library           AppiumLibrary

*** Keywords ***
场景直播-关闭
    click a point    200    200
    sleep    1
    comment    click element    name=player close
    click element    name=player back Shadow
    sleep    1

场景直播-切换机位
    click element    name=live camera
    sleep    1

场景直播-切换码率
    click element    name=高清
    sleep    1

直播-点VIP机位
    tap    live_icon_VIPTag    0    10

动态详情－关闭
    Comment    Click Element    name=back
    tap    back    2    0
    sleep    1

直播-退出
    sleep    2
    click element    name=Live player back Shadow
    sleep    2

直播-分享
    click element    name=Player NewShare iCON

直播-礼物开关
    click element    name=Player ShieldGift Default iCO

直播-喊话开关
    click element    name=LiveRoom Call Normal

直播-点礼物
    click element    name=LiveRoom Gift iCON

直播-输入聊天
    click element    xpath=//XCUIElementTypeButton[@name="LiveRoom Gift iCON"]/preceding-sibling::XCUIElementTypeOther[1]/XCUIElementTypeTextField
