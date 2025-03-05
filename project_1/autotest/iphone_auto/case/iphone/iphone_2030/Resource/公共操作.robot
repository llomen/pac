*** Keywords ***
快速启动应用
    Open Application    ${appium_server}    platformName=iOS    deviceName=${deviceName}    platformVersion=${platformVersion}    newCommandTimeout=600    bundleId=com.hunantv.imgotv
    ...    udid=${udid}    AutomationName=XCUITest

启动应用-智能首页
    开启智能首页
    启动应用

关闭应用-智能首页
    开启普通首页
    log    111111111
    公共－关闭应用

启动应用
    快速启动应用
    sleep    10

启动应用2
    comment    Open Application    http://10.200.12.73:4735/wd/hub    platformName=iOS    deviceName=${deviceName}    platformVersion=12.4    newCommandTimeout=600
    ...    bundleId=com.hunantv.imgotv    udid=${udid}    AutomationName=XCUITest
    Open Application    ${appium_server}    platformName=iOS    deviceName=${deviceName}    platformVersion=${platformVersion}    newCommandTimeout=600    bundleId=com.hunantv.imgotv
    ...    udid=${udid}    AutomationName=XCUITest    autoAcceptAlerts=true

公共－启动应用
    启动应用
    公共-启动应用前退出登录

公共－关闭应用
    Run Keyword And Ignore Error    Close All Applications

公共－滑动到某一控件
    [Arguments]    ${text}
    sleep    1
    scroll to    ${text}
    sleep    1

公共－选中键盘第一个
    sleep    2
    Click Element    xpath=//UIAApplication[1]/UIAWindow[4]/UIAKeyboard[1]/UIAElement[1]
    sleep    3

点击xxx
    [Arguments]    ${text}
    Wait Until Page Contains Element    name=${text}    timeout=5
    Click Element    name=${text}

公共－xpath
    [Arguments]    ${xpath}
    sleep    1
    Click Element    xpath=${xpath}
    sleep    1

公共－点击页面文本
    [Arguments]    ${text}
    sleep    1
    Click Element    name=${text}
    sleep    1

点击不可见文本
    [Arguments]    ${text}
    sleep    2
    tap    ${text}    10    10
    sleep    1

点击文本
    [Arguments]    ${text}
    click element    nsp= name =='${text}' and type=='XCUIElementTypeStaticText' and visible == True

点击按钮
    [Arguments]    ${text}
    click element    nsp= name =='${text}' and type=='XCUIElementTypeButton' and visible == True

获取元素坐标
    [Arguments]    ${text}
    &{size} =    get element size    ${text}
    &{location} =    get element location    ${text}
    ${x} =    evaluate    ${location.x}+${size.width}/2
    ${y} =    evaluate    ${location.y}+${size.height}/2
    [Return]    ${x}    ${y}

按坐标点击元素
    [Arguments]    ${text}
    ${x}    ${y}    获取元素坐标    ${text}
    #&{size} =    get element size    ${text}
    #&{location} =    get element location    ${text}
    #${x} =    evaluate    ${location.x}+${size.width}/2
    #${y} =    evaluate    ${location.y}+${size.height}/2
    click a point    ${x}    ${y}

公共－点击页面文本－忽略错误
    [Arguments]    ${text}
    sleep    1
    Run Keyword And Ignore Error    click element    ${text}
    sleep    1

公共－点击坐标点
    [Arguments]    ${x}    ${y}
    click a point    ${x}    ${y}

公共－上划屏幕
    sleep    1
    swipe    170    560    170    300

公共－左滑屏幕
    sleep    1
    swipe    330    300    30    300
    sleep    1

公共-上滑页面
    [Arguments]    ${xpath}
    scroll down    xpath=${xpath}
    sleep    1

公共-下滑页面
    [Arguments]    ${xpath}
    scroll up    xpath=${xpath}
    sleep    4

公共－快进
    sleep    1
    swipe    50    120    300    120
    sleep    1
    swipe    50    120    300    120
    swipe    50    120    300    120
    swipe    50    120    300    120
    swipe    50    120    300    120
    swipe    50    120    300    120
    swipe    50    120    300    120
    swipe    50    120    300    120
    swipe    50    120    300    120
    swipe    50    120    300    120
    sleep    30

公共－home
    Background App
    sleep    3

公共
    [Arguments]    ${result}
    should be true    ${result['count'][0]}==1    ${result['count'][1]}

公共-字段
    [Arguments]    ${result}
    should be true    ${result['field'][0]}==1    ${result['field'][1]}

公共-字段值
    [Arguments]    ${result}
    should be true    ${result['errdata'][0]}==1    ${result['errdata'][1]}

公共－校验结果
    [Arguments]    ${field}    ${test_point}    ${field_table}    ${act_count}
    ${result}    Check Result    ${field}    ${platform2}    ${test_point}    ${field_table}    ${act_count}
    [Return]    ${result}

公共-验证页面元素value
    [Arguments]    ${xpath}    ${text}
    ${path}    set variable    ${xpath}
    ${value}    get element attribute    ${path}    value
    should be equal as integers    ${value}    ${text}

公共-验证页面元素name
    [Arguments]    ${xpath}    ${text}
    ${path}    set variable    ${xpath}
    ${value}    get element attribute    ${path}    name
    should be equal    ${value}    ${text}

公共-页面存在元素值
    [Arguments]    ${text}
    page should contain text    ${text}

公共-页面不存在元素值
    [Arguments]    ${text}
    page should not contain text    ${text}

公共-元素可见
    [Arguments]    ${name}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${name}

公共-元素不可见
    [Arguments]    ${name}
    ${aa}    run keyword and return status    Element Should Be Visible    ${name}
    Run Keyword And Continue On Failure    Should Be True    "${aa}"=="False"

获取屏幕大小
    &{dict}=    get element size    class=Window
    set global variable    ${屏幕宽度}    ${dict.width}
    set global variable    ${屏幕高度}    ${dict.height}
    [Return]    ${dict.width}    ${dict.height}

左滑
    获取屏幕大小
    ${x1} =    evaluate    ${屏幕宽度}*0.8
    ${y1} =    evaluate    ${屏幕高度}*0.5
    ${x2} =    evaluate    -${屏幕宽度}*0.6
    ${y2} =    evaluate    0
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    capture page screenshot

右滑
    获取屏幕大小
    ${x1} =    evaluate    ${屏幕宽度}*0.2
    ${y1} =    evaluate    ${屏幕高度}*0.5
    ${x2} =    evaluate    ${屏幕宽度}*0.6
    ${y2} =    evaluate    0
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    capture page screenshot

上滑
    获取屏幕大小
    ${x1} =    evaluate    ${屏幕宽度}*0.5
    ${y1} =    evaluate    ${屏幕高度}*0.8
    ${x2} =    evaluate    ${屏幕宽度}*0.6
    ${y2} =    evaluate    -${屏幕高度}*0.6
    log    ${x1},${y1},${x2},${y2}
    sleep    1
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    sleep    2

下滑
    获取屏幕大小
    ${x1} =    evaluate    ${屏幕宽度}*0.2
    ${y1} =    evaluate    ${屏幕高度}*0.2
    ${x2} =    evaluate    0
    ${y2} =    evaluate    ${屏幕高度}*0.5
    sleep    1
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    sleep    2

按元素左滑
    [Arguments]    ${locator}
    &{location} =    get element location    ${locator}
    ${x1} =    evaluate    ${location.x}*1.0
    ${y1} =    evaluate    ${location.y}*1.0
    ${x2} =    evaluate    ${屏幕宽度}*0.9
    ${y2} =    evaluate    0
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}

按元素右滑
    [Arguments]    ${locator}
    &{location} =    get element location    ${locator}
    ${x1} =    evaluate    ${location.x}*1.0
    ${y1} =    evaluate    ${location.y}*1.0
    ${x2} =    evaluate    ${屏幕宽度}*-0.9
    ${y2} =    evaluate    0
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}

发帖上滑
    ${x1} =    evaluate    ${屏幕宽度}*0.5
    ${y1} =    evaluate    ${屏幕高度}*0.5
    ${x2} =    evaluate    0
    ${y2} =    evaluate    -${屏幕高度}*0.3
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}

点击
    [Arguments]    &{a}
    [Documentation]    点击相对坐标
    ${x} =    evaluate    ${屏幕宽度}*&{a}[x]
    ${y} =    evaluate    ${屏幕高度}*&{a}[y]
    click a point    ${x}    ${y}

点击元素
    [Arguments]    ${a}    ${i}
    [Documentation]    元素转换成相对坐标来点击 ${a}是元素定位, ${i}是数组下标,从0开始,0代表第一个元素
    @{b} =    get webelements    ${a}
    &{size} =    get element size    @{b}[${i}]
    &{location} =    get element location    @{b}[${i}]
    ${x} =    evaluate    ${location.x}+${size.width}/2
    ${y} =    evaluate    ${location.y}+${size.height}/2
    click a point    ${x}    ${y}

点击第N个元素
    [Arguments]    ${a}    ${i}
    [Documentation]    ${a}是元素定位, ${i}是数组下标,从0开始,0代表第一个元素
    @{b} =    get webelements    ${a}
    click element    @{b}[${i}]

首页头部左滑
    ${x1} =    evaluate    ${屏幕宽度}*0.8
    ${y1} =    evaluate    ${屏幕高度}*0.46
    ${x2} =    evaluate    -${屏幕宽度}*0.6
    ${y2} =    evaluate    0
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    capture page screenshot

首页头部右滑
    ${x1} =    evaluate    ${屏幕宽度}*0.2
    ${y1} =    evaluate    ${屏幕高度}*0.46
    ${x2} =    evaluate    ${屏幕宽度}*0.6
    ${y2} =    evaluate    0
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    capture page screenshot

上滑到首页顶部banner运营位
    ${x1} =    evaluate    ${屏幕宽度}*0.5
    ${y1} =    evaluate    ${屏幕高度}*0.6
    ${x2} =    evaluate    0
    ${y2} =    evaluate    -${屏幕高度}*0.2
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
    capture page screenshot

公共-滑动页面
    [Arguments]    ${start_locator}    ${end_locator}
    sleep    3
    scroll    name=${start_locator}    name=${end_locator}
    sleep    1

公共-向上滑动
    [Arguments]    ${start_locator}    ${end_locator}
    &{start}    Get Element Location    ${start_locator}
    &{end}    Get Element Location    ${end_locator}
    ${y}    evaluate    ${end.y}-${start.y}
    swipe    ${end.x}    ${end.y}    0    -${y}

select-xpath
    [Arguments]    ${xpath12}    ${xpath13}
    ${aa}    run keyword and return status    should match    ${platform2}    *iPhoneiOS12*
    ${result}=    set variable if    ${aa}    ${xpath12}    ${xpath13}
    log    ${result}
    [Return]    ${result}

点击元素尾部
    [Arguments]    ${locator}
    &{size} =    get element size    ${locator}
    ${x} =    evaluate    ${size.width} -10
    tap    ${locator}    ${x}    0
