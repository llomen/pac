*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot

*** Keywords ***
我的-点击登录
    ${aa}    run keyword and return status    element should be visible    name=点击登录
    run keyword if    ${aa}==False    滚动到登录
    公共－点击页面文本    点击登录

我－会员中心
    公共－xpath    //XCUIElementTypeStaticText[@name="VIP会员"]/following-sibling::XCUIElementTypeButton[1]

会员中心-VIP返回
    sleep    3
    comment    tap    我的VIP会员    118    5
    click a point    39    66
    sleep    1

我的-元素
    [Arguments]    ${locator}
    ${aa}    run keyword and return status    element should be visible    name=${locator}
    run keyword if    ${aa}==False    滚动到设置
    公共－点击页面文本    ${locator}

我的-缓存
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    离线缓存
    run keyword if    ${aa}    公共－点击页面文本    离线缓存
    ...    ELSE    公共－点击页面文本    离线中心

我的-消息中心
    comment    公共－xpath    //XCUIElementTypeStaticText[@name="我的消息"]/following-sibling::XCUIElementTypeButton[2]
    公共－xpath    //XCUIElementTypeButton[@name="扫一扫"]/preceding-sibling::XCUIElementTypeButton[1]

我的-看单
    公共－点击页面文本    我的看单

我的-积分中心
    公共－点击页面文本    签到领会员

设置-账号与安全
    公共－xpath    //XCUIElementTypeStaticText[@name="账号与安全"]/preceding-sibling::XCUIElementTypeButton[1]

设置-绑定手机
    sleep    1
    tap    绑定手机    30    5
    sleep    1

设置-关于我们
    sleep    1
    tap    关于我们    30    5
    sleep    1

滚动到设置
    comment    scroll    name=播放记录    name=设置
    上滑

滚动到登录
    comment    scroll    name=设置    name=点击登录
    下滑
    下滑

滚动到退出登录
    comment    scroll    name=播放记录    name=设置
    上滑

我-点名字
    滚动到登录
    公共－xpath    //XCUIElementTypeButton[@name="${mail_name}"]

退出芒果星球
    非播放页-返回

删除全部缓存
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    暂无缓存视频
    run keyword if    ${aa} ==False    删除缓存

删除缓存
    公共－点击页面文本    编辑
    公共－点击页面文本    全选
    click text    删除
    判断后点击    删除
