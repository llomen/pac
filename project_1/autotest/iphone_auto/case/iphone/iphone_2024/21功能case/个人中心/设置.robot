*** Settings ***
Resource          ./网络.txt
Resource          ./Variables.txt
Resource          ./公共事件.txt
Resource          ./公共操作.txt

*** Keywords ***
滚动到关于我们
    scroll    name=账号与安全    name=关于我们

滚动到其他
    scroll    name=播放问题    name=其他

滚动到饭团消息
    scroll    name=Freedom50SWFM    name=来自饭团：极光之恋

滚动到看了还会看
    scroll    name=我的特工爷爷    name=看了还会看

滚动到我的特工爷爷
    scroll    name=看了还会看    name=我的特工爷爷

频道页缓存入口
    公共－xpath    //XCUIElementTypeButton[@name="Channel Download iCON"]

关闭-离线缓存更多列表浮层
    公共－xpath    //XCUIElementTypeButton[@name="close icon"]

缓存页编辑按钮
    公共－xpath    //XCUIElementTypeButton[@name="编辑"]

缓存删除的勾选框
    公共－xpath    (//XCUIElementTypeButton[@name="ChoiceGray"])[1]

点播页-缓存按钮
    公共－xpath

设置－3g/4g播放提醒
    sleep    1
    Click Element    xpath=//XCUIElementTypeSwitch[@name="3G/4G流量播放时提醒我"]
    sleep    1

设置－跳过片头片尾
    sleep    1
    Click Element    xpath=//XCUIElementTypeSwitch[@name="跳过片头片尾"]
    sleep    1

设置－小窗播放
    sleep    1
    Click Element    xpath=//XCUIElementTypeSwitch[@name="小窗播放功能"]
    sleep    1

设置－3g/4g流量离线缓存
    sleep    1
    Click Element    xpath=//XCUIElementTypeSwitch[@name="3G/4G流量离线缓存"]
    sleep    1

设置－播放记录同步
    sleep    1
    Click Element    xpath=(//XCUIElementTypeSwitch[@name="同步芒果TV客户端播放记录"])[2]
    sleep    1

账号密码登录
    [Arguments]    ${account}    ${password}
    登录-是否有历史页面
    公共－点击页面文本    帐号密码登录
    芒果登录－输入账号    ${account}
    芒果登录－输入密码    ${password}
    公共－点击页面文本    登录
    sleep    2

消息设置-热门消息
    sleep    1
    Click Element    xpath=(//XCUIElementTypeSwitch[@name="热门消息"])[2]
    sleep    1

账号登录
    登录-是否有历史页面
    登录-切换邮箱登录
    芒果登录－输入账号    shuang3@yopmail.com
    芒果登录－输入密码    111111
    公共－点击页面文本    登录

历史页面-登录
    ${bb}    if page contain text    切换账号
    Run keyword if    ${bb} == 1    登录上次账号

设置-扫码入口
    公共－xpath    //XCUIElementTypeButton[@name="My icon RichScan"]

判断登录-扫码入口
    ${bb}    If Page Contain Text    点击登录
    run keyword if    ${bb}==1    扫码不允许
    ...    ELSE    扫码允许

扫码允许
    设置-扫码入口
    公共-页面存在元素值    “芒果TV”想访问您的相机
    公共-页面存在元素值    不允许
    公共-页面存在元素值    好
    公共－点击页面文本    好
    非播放页-返回

扫码不允许
    设置-扫码入口
    公共－点击页面文本    不允许
    非播放页-返回

是否绑定手机号-显示
    ${bb}    If Page Contain Text    绑定手机
    run keyword if    ${bb}==1    未绑定手机
    ...    ELSE    已绑定手机

已绑定手机
    公共-页面存在元素值    验证手机
    公共-页面存在元素值    ****
    公共-页面存在元素值    获取验证码
    公共－点击页面文本    下一步

未绑定手机
    公共-页面存在元素值    绑定手机
    公共-页面存在元素值    输入手机号码
    公共-页面存在元素值    请输入校验码
    公共－点击页面文本    绑定

合集元素显示个数
    [Arguments]    ${num}    ${xpath}
    ${length}    元素个数    xpath=${xpath}
    Should Be Equal As Integers    ${num}    ${length}    num should be ${num} ,acture    ${length}

播单元素显示个数
    [Arguments]    ${num}    ${xpath}
    ${length}    元素个数    xpath=${xpath}
    Should Be Equal As Integers    ${num}    ${length}    num should be ${num} ,acture    ${length}
