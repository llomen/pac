*** Variables ***
${软解模式}           //XCUIElementTypeSwitch[1]

*** Keywords ***
启动播放demo
    Open Application    ${appium_server}    platformName=iOS    deviceName=${deviceName}    platformVersion=${platformVersion}    newCommandTimeout=600    bundleId=com.MGPlayer.Sample
    ...    udid=${udid}    AutomationName=XCUITest    autoAcceptAlerts=true
    sleep    5

点击设置
    公共－点击页面文本    设置

点击自研播放器
    公共－点击页面文本    自研播放器

进入播放源
    公共－点击页面文本    播放源

删除输入框内容
    [Arguments]    ${locator}
    tap    ${locator}    0    0
    Long Press    ${locator}
    click element    Select All
    sleep    1
    click element    delete

设置播放源
    [Arguments]    ${locator}    ${value}
    Input Value    ${locator}    ${value}

设置播放源-极速
    [Arguments]    ${value}
    删除输入框内容    xpath=//XCUIElementTypeTextView[1]
    设置播放源    xpath=//XCUIElementTypeTextView[1]    ${value}

设置播放源-标清
    [Arguments]    ${value}
    删除输入框内容    xpath=//XCUIElementTypeTextView[2]
    设置播放源    xpath=//XCUIElementTypeTextView[2]    ${value}

设置播放源-高清
    [Arguments]    ${value}
    删除输入框内容    xpath=//XCUIElementTypeTextView[3]
    设置播放源    xpath=//XCUIElementTypeTextView[3]    ${value}

设置播放源-超清
    [Arguments]    ${value}
    删除输入框内容    xpath=//XCUIElementTypeTextView[4]
    设置播放源    xpath=//XCUIElementTypeTextView[4]    ${value}

设置二层地址
    [Arguments]    ${value}
    删除二层地址
    tap    //XCUIElementTypeTextField[1]    0    0
    设置播放源    //XCUIElementTypeTextField[1]    ${value}
    click element    Return

删除二层地址
    tap    //XCUIElementTypeTextField[1]    0    0
    sleep    1
    Long Press    delete    10000
    click element    Return

更新播放源
    公共－点击页面文本    更新

返回上一页
    公共－点击页面文本    Back

点击start
    click element    name=Start

点击stop
    click element    name=Stop

切换清晰度
    click element    name=切换分辨率

打开软解模式
    click element    ${软解模式}

关闭软解模式
    click element    ${软解模式}

打开开光
    [Arguments]    ${value}
    ${a}    Get Element Attribute    ${value}    value
    run keyword if    ${a}==0    click element    ${value}

关闭开关
    [Arguments]    ${value}
    ${a}    Get Element Attribute    ${value}    value
    run keyword if    ${a}==1    click element    ${value}

自研播放
    [Arguments]    ${value}
    点击设置
    进入播放源
    设置播放源-极速    ${value}
    更新播放源
    返回上一页
    返回上一页
    点击自研播放器
    点击start
    sleep    5
    点击stop
