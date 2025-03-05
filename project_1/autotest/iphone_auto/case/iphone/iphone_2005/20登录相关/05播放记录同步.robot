*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${aplay}          {'act':'aplay'}

*** Test Cases ***
未登录播放记录同步
    sleep    3
    首页-我
    进入退出登录
    滚动到退出登录
    Element Value Should Be    //XCUIElementTypeSwitch[@name="同步芒果TV客户端播放记录"]    0
    公共－xpath    //XCUIElementTypeSwitch[@name="同步芒果TV客户端播放记录"]
    公共－xpath    //XCUIElementTypeButton[@name="登录"]

登录后返回频道
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}
    sleep    3
    Element Value Should Be    //XCUIElementTypeSwitch[@name="同步芒果TV客户端播放记录"]    1

播放记录下一集pvs
    非播放页-返回
    下滑
    公共－点击页面文本    播放记录
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[@name="下一集"])[1]
    sleep    20
    公共-校验数据    ${pvs}    bofangjilu_next    ${table_pvs}    1

播放记录下一集aplay
    公共-校验数据    ${aplay}    bofangjilu_next    ${table_vv}    1
