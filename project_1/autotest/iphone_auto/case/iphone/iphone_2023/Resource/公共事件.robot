*** Settings ***
Resource          ./公共操作.robot
Resource          ./首页.robot

*** Keywords ***
新手引导
    sleep    3
    run keyword and ignore error    公共－点击页面文本    同意并继续
    run keyword and ignore error    公共－点击页面文本    允许
    run keyword and ignore error    公共－点击页面文本    允许
    sleep    3
    run keyword and ignore error    点击不可见文本    mangoBoy
    sleep    3
    关闭积分引导
    首页-饭团
    sleep    3
    run keyword and ignore error    点击不可见文本    fantuan_square_button
    sleep    3
    run keyword and ignore error    点击不可见文本    fantuan_square_button
    sleep    3
    run keyword and ignore error    点击不可见文本    fantuan_square_button
    sleep    3

关闭积分引导
    首页-我
    我的-积分中心
    sleep    2
    run keyword and ignore error    公共－点击页面文本    我知道了
    非播放页-返回

公共－用户登录
    [Arguments]    ${account}    ${password}
    首页-我
    我的-点击登录
    邮箱登录    ${account}    ${password}

邮箱登录
    [Arguments]    ${account}    ${password}
    登录-是否有历史页面
    登录-切换邮箱登录
    同意用户协议
    芒果登录－输入账号    ${account}
    芒果登录－输入密码    ${password}
    sleep    3
    忽略指纹登录

直接登录
    [Arguments]    ${account}    ${password}    ${username}
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    ${username}
    run keyword if    ${aa}    登录-历史账号登录
    ...    ELSE    邮箱登录    ${account}    ${password}

公共－手机登录
    [Arguments]    ${account}    ${password}
    首页-我
    我的-点击登录
    登录-是否有历史页面
    登录-切换账号登录
    同意用户协议
    手机密码登录－输入手机号    ${account}
    手机密码登录－输入密码    ${password}
    sleep    2
    忽略指纹登录

我的-登录
    [Arguments]    ${account}    ${password}
    我的-点击登录
    邮箱登录    ${account}    ${password}

登录页-关闭
    关闭登录浮层

登录-是否有历史页面
    判断后点击    切换账号

登录-历史账号登录
    同意用户协议
    公共－点击页面文本    登录上次账号
    忽略指纹登录

同意用户协议
    sleep    2
    tap    同意《用户协议》和《隐私政策》    15    10
    sleep    2

忽略指纹登录
    Run Keyword And Ignore Error    公共－点击页面文本    暂不

登录-切换邮箱登录
    ${ios12}=    set variable    icon_mail
    ${ios13}=    set variable    垂直滚动条, 1页
    ${result}=    select-xpath    ${ios12}    ${ios13}
    #审核状态时直接为邮箱登录
    ${aa}    run keyword and return status    page should not contain element    邮箱账号登录
    run keyword if    ${aa}    点击不可见文本    name=${result}

登录-切换账号登录
    公共－点击页面文本    密码登录

关闭登录浮层
    公共－点击页面文本    login close

公共－退出登录
    进入退出登录
    点击退出登录

进入退出登录
    我的-设置

点击退出登录
    滚动到退出登录
    公共－点击页面文本    退出登录
    run keyword and ignore error    公共－点击页面文本    退出
    sleep    4
    滚动到登录

非播放页-返回
    公共－点击页面文本    back icon

公共-启动应用前退出登录
    首页-我
    sleep    2
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    点击登录
    Run keyword if    ${aa} ==False    公共－退出登录
    首页-精选

点击确认按钮
    Run Keyword And Ignore Error    click element    name=确认

公共-分享到
    [Arguments]    ${share_locator}    ${end_locator}
    Comment    ${bb}    run keyword and return status    Element Should Be Visible    ${share_locator}
    Comment    Run keyword if    ${bb}==False    scroll up    ${share_locator}
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    ${end_locator}
    Run keyword if    ${aa}==False    公共－点击页面文本    ${share_locator}
    公共-删除数据
    公共－点击页面文本    ${end_locator}

公共-向上滑动
    [Arguments]    ${start_locator}    ${end_locator}
    &{start}    Get Element Location    ${start_locator}
    &{end}    Get Element Location    ${end_locator}
    ${y}    evaluate    ${end.y}-${start.y}
    swipe    ${end.x}    ${end.y}    0    -${y}

默认登录用户
    [Arguments]    ${account}    ${pwd}    ${name}
    首页-我
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    ${name}
    run keyword if    ${aa}==False    重新登录    ${account}    ${pwd}

重新登录
    [Arguments]    ${account}    ${pwd}
    ${bb}=    Run Keyword And Return Status    Page Should Contain Text    点击登录
    run keyword if    ${bb}    我的-登录    ${account}    ${pwd}
    ...    ELSE    退出登录后登录    ${account}    ${pwd}

退出登录后登录
    [Arguments]    ${account}    ${pwd}
    公共－退出登录
    下滑
    下滑
    我的-登录    ${account}    ${pwd}

登录－后退
    公共－点击页面文本    back icon

芒果登录－输入账号
    [Arguments]    ${accout}
    sleep    1
    input text    xpath=//XCUIElementTypeTextField[@value='请输入邮箱账号']    ${accout}
    sleep    3

芒果登录－输入密码
    [Arguments]    ${password}
    sleep    3
    input text    xpath=//XCUIElementTypeSecureTextField[@value='请输入密码']    ${password}
    click element    name=return
    sleep    10

手机密码登录－输入手机号
    [Arguments]    ${accout}
    sleep    1
    comment    input text    xpath=//XCUIElementTypeTextField[@value='请输入手机号']    ${accout}
    input text    xpath=//XCUIElementTypeStaticText[@name="中国 +86"]/preceding-sibling::XCUIElementTypeTextField[1]    ${accout}
    sleep    1

手机密码登录－输入密码
    [Arguments]    ${pwd}
    sleep    1
    comment    input text    xpath=//XCUIElementTypeSecureTextField[@value='请输入密码']    ${pwd}
    input text    xpath=//XCUIElementTypeButton[@name="mine textbox eye off"]/preceding-sibling::XCUIElementTypeSecureTextField[1]    ${pwd}
    click element    name=return
    sleep    10
    page should contain text    我的消息

登录－芒果登录
    sleep    1
    Click Element    name=mango login icon
    sleep    3

公共-页面包含文本
    [Arguments]    ${text}
    Run Keyword And Continue On Failure    Page Should Contain Text    ${text}    NONE

公共-页面包含元素
    [Arguments]    ${locator}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${locator}    NONE

公共-页面不包含文本
    [Arguments]    ${text}
    Run Keyword And Continue On Failure    Page Should Not Contain Text    ${text}    NONE

公共-页面不包含元素
    [Arguments]    ${locator}
    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${locator}    NONE

元素个数
    [Arguments]    ${loctor}
    @{elements}    Get Webelements    ${loctor}
    ${num} =    Get Length    ${elements}
    [Return]    ${num}

开通会员－返回
    sleep    2
    公共－xpath    //XCUIElementTypeOther[@name="开通会员"]/XCUIElementTypeImage[1]
    sleep    1

开通会员－点击开通
    公共－点击页面文本    确认支付:￥
    sleep    5

开通会员－单片购买
    公共－点击页面文本    确认支付:￥
    sleep    5

会员页续费-返回
    公共－点击页面文本    close icon

短视频-返回
    公共－点击页面文本    player back Shadow

我的服务-全部添加
    @{list}    get webelements    name = My service_set_join
    ${length}    get length    ${list}
    log    ${length}
    : FOR    ${a}    IN RANGE    ${length}
    \    click element    @{list}[0]

我的服务-添加
    [Arguments]    ${name}
    ${aa}    Get Element Attribute    //XCUIElementTypeStaticText[@name="${name}"]/preceding-sibling::XCUIElementTypeImage[1]    name
    ${bb}    Run Keyword And Return Status    Should Be Equal As Strings    ${aa}    My service_set_join
    run keyword if    ${bb}==True    公共－点击页面文本    ${name}

判断后点击
    [Arguments]    ${name}
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    ${name}
    Run keyword if    ${aa}    公共－点击页面文本    ${name}
