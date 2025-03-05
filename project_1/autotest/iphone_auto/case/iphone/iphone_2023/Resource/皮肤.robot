*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot

*** Keywords ***
我的-皮肤
    公共－点击页面文本    皮肤
    Page should contain text    主题皮肤

点使用中
    公共－点击页面文本    使用中

皮肤详情页点使用
    公共－点击页面文本    立即使用

进入暗夜黑
    公共－点击页面文本    官方暗夜黑

使用暗夜黑
    公共－xpath    //XCUIElementTypeStaticText[@name="官方暗夜黑"]/following-sibling::XCUIElementTypeButton[1]

进入芒果橙
    公共－点击页面文本    官方芒果橙

使用芒果橙
    公共－xpath    //XCUIElementTypeStaticText[@name="官方芒果橙"]/following-sibling::XCUIElementTypeButton[1]

使用vip皮肤
    公共－xpath    (//XCUIElementTypeStaticText[@name="VIP"])[1]/following-sibling::XCUIElementTypeButton[1]

进入vip皮肤
    公共－xpath    (//XCUIElementTypeStaticText[@name="VIP"])[1]

使用限免皮肤
    公共－xpath    (//XCUIElementTypeStaticText[@name="限时免费"])[1]/following-sibling::XCUIElementTypeButton[1]

皮肤详情页-分享
    公共－点击页面文本    Player Floor ShareNew

皮肤详情页返回
    非播放页-返回

皮肤列表页返回
    非播放页-返回
