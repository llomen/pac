*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot
Library           AppiumLibrary

*** Keywords ***
沉浸式点击
    [Arguments]    ${x}    ${y}
    tap    ${x}    ${y}

沉浸式-点分享
    公共－xpath    (//XCUIElementTypeButton[@name="immersion more"])[1]

沉浸式-播放框
    公共－xpath    (//XCUIElementTypeImage[@name="FeedPlayer_Default_iCON"])[1]

沉浸式-点评论
    公共－xpath    (//XCUIElementTypeButton[@name="immersion more"])[1]/preceding-sibling::XCUIElementTypeButton[1]

沉浸式-暂停
    tap    xpath=(//XCUIElementTypeImage[@name="FeedPlayer_Default_iCON"])[1]    0    0
    tap    xpath=(//XCUIElementTypeImage[@name="FeedPlayer_Default_iCON"])[1]    0    0

沉浸式-评论返回
    //XCUIElementTypeStaticText[@name="评论"]/following-sibling::XCUIElementTypeButton[1]

沉浸式-点看正片
    公共－xpath    (//XCUIElementTypeButton[@name="看正片"])[1]

沉浸式-点加看单
    公共－xpath    (//XCUIElementTypeButton[@name="immersion Collect Normal"])[1]

沉浸式-点下一个视频
    公共－xpath    (//XCUIElementTypeImage[@name="comment_Play"])[2]
    comment    公共－点击页面文本    斯坦李去世谢耳朵一定很难过

沉浸式-返回
    公共－点击页面文本    immersion player back

沉浸式-顶部分享
    公共－点击页面文本    immersion player back share

沉浸式-收藏
    comment    公共－点击页面文本    收藏
    沉浸式点击    32    460

沉浸式-缓存
    comment    公共－点击页面文本    缓存本地
    沉浸式点击    100    460

沉浸式-分享到朋友圈
    comment    公共－点击页面文本    朋友圈
    沉浸式点击    32    360
    沉浸式点击    160    320
    comment    公共－点击页面文本    确认
