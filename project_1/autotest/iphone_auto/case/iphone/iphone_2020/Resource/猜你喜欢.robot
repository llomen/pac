*** Settings ***
Library           AppiumLibrary

*** Keywords ***
猜你喜欢-滑动到短片
    comment    scroll    xpath=(//XCUIElementTypeButton[@name="Discuss More Gray"])[1]    xpath=(//XCUIElementTypeButton[@name="Discuss More Gray"])[3]

猜你喜欢-滑动到长片
    comment    scroll    xpath=(//XCUIElementTypeButton[@name="Discuss More Gray"])[1]    xpath=(//XCUIElementTypeButton[@name="ShortVideo Pause iCON"])[1]
    上滑

猜你喜欢-点短片标题
    点击不可见文本    《琉璃美人煞》MV 爱若琉璃 周深献唱诠释十世情劫

猜你喜欢-替换后点短片标题
    点击不可见文本    先导片：王俊凯杨紫姐弟重逢

猜你喜欢-点短片举报
    公共－xpath    //XCUIElementTypeStaticText[@name="《琉璃美人煞》MV 爱若琉璃 周深献唱诠释十世情劫"]/preceding-sibling::XCUIElementTypeButton[last()]

猜你喜欢-点举报内容
    公共－点击页面文本    对此条内容不感兴趣

猜你喜欢-点长片标题
    点击不可见文本    时光与你都很甜 第17集

猜你喜欢-点长片播放
    公共－点击页面文本    ShortVideo Pause iCON

猜你喜欢-点长片举报
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]

猜你喜欢-点观看正片
    公共－点击页面文本    看正片

猜你喜欢-点标签
    公共－点击页面文本    文渊

猜你喜欢-播放框点观看正片
    tap    xpath=(//XCUIElementTypeButton[@name="ShortVideo Pause iCON"])[1]    0    0

猜你喜欢-播放框点加看单
    tap    xpath=(//XCUIElementTypeButton[@name="ShortVideo Pause iCON"])[1]    0    140

猜你喜欢-播放框点重播
    tap    xpath=(//XCUIElementTypeButton[@name="ShortVideo Pause iCON"])[1]    0    -140
