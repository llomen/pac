*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${newpush}        {'act':'newpush'}

*** Test Cases ***
青少年模式pvs
    sleep    5
    首页-我
    进入退出登录
    公共-删除数据
    点击不可见文本    青少年模式
    公共-校验数据    ${pvs}    shezhi_021    ${table_pvs}    1

青少年模式pvs1
    公共-校验数据    ${pvs1}    shezhi_021    ${table_pvs1}    1

开启青少年模式pvs
    公共-删除数据
    公共－点击页面文本    开启青少年模式
    公共-校验数据    ${pvs}    shezhi_022    ${table_pvs}    1

开启青少年模式pvs1
    公共-校验数据    ${pvs1}    shezhi_022    ${table_pvs1}    1

返回青少年模式pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_023    ${table_pvs}    1

返回青少年模式pvs1
    公共-校验数据    ${pvs1}    shezhi_023    ${table_pvs1}    1

青少年返回设置pvs
    公共-删除数据
    page should contain element    青少年模式
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_024    ${table_pvs}    1

青少年返回设置pvs1
    公共-校验数据    ${pvs1}    shezhi_024    ${table_pvs1}    1

点播放记录同步
    公共-删除数据
    Element Value Should Be    //XCUIElementTypeSwitch[@name="同步芒果TV客户端播放记录"]    0
    公共－xpath    //XCUIElementTypeSwitch[@name="同步芒果TV客户端播放记录"]
    公共－xpath    //XCUIElementTypeButton[@name="登录"]

登录pvs
    公共-校验数据    ${pvs}    shezhi_025    ${table_pvs}    1

登录框弹出cv
    公共-校验数据    ${cv}    login_08    ${table_cv}    1

关闭登录pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    shezhi_026    ${table_pvs}    1

点推送设置newpush
    公共-删除数据
    点击不可见文本    消息推送设置
    公共-校验数据    ${newpush}    newpush_01    ${table_click}    1

进入消息设置pvs
    公共-校验数据    ${pvs}    shezhi_027    ${table_pvs}    1

进入消息设置pvs1
    公共-校验数据    ${pvs1}    shezhi_027    ${table_pvs1}    1

点热门消息关newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="热门消息"]
    公共-校验数据    ${newpush}    newpush_02    ${table_click}    1

点热门消息开newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="热门消息"]
    公共-校验数据    ${newpush}    newpush_03    ${table_click}    1

点签到提醒关newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="签到提醒"]
    公共-校验数据    ${newpush}    newpush_04    ${table_click}    1

点签到提醒开newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="签到提醒"]
    公共-校验数据    ${newpush}    newpush_05    ${table_click}    1

点预约提醒关newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="预约提醒"]
    公共-校验数据    ${newpush}    newpush_06    ${table_click}    1

点预约提醒开newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="预约提醒"]
    公共-校验数据    ${newpush}    newpush_07    ${table_click}    1

点系统通知关newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="系统通知"]
    公共-校验数据    ${newpush}    newpush_08    ${table_click}    1

点系统通知开newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="系统通知"]
    公共-校验数据    ${newpush}    newpush_09    ${table_click}    1

点免打扰设置newpush
    公共-删除数据
    公共－点击页面文本    免打扰设置
    公共-校验数据    ${newpush}    newpush_10    ${table_click}    1

点免打扰完成newpush
    公共-删除数据
    公共－点击页面文本    完成
    公共-校验数据    ${newpush}    newpush_11    ${table_click}    1

点互动消息newpush
    公共-删除数据
    公共－点击页面文本    互动消息
    公共-校验数据    ${newpush}    newpush_12    ${table_click}    1

进入互动消息设置pvs
    公共-校验数据    ${pvs}    shezhi_028    ${table_pvs}    1

进入互动消息设置pvs1
    公共-校验数据    ${pvs1}    shezhi_028    ${table_pvs1}    1

点评论关newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="评论"]
    公共-校验数据    ${newpush}    newpush_13    ${table_click}    1

点评论开newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="评论"]
    公共-校验数据    ${newpush}    newpush_14    ${table_click}    1

点赞关newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="赞"]
    公共-校验数据    ${newpush}    newpush_15    ${table_click}    1

点赞开newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="赞"]
    公共-校验数据    ${newpush}    newpush_16    ${table_click}    1

点被关注关newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="被关注"]
    公共-校验数据    ${newpush}    newpush_17    ${table_click}    1

点被关注开newpush
    公共-删除数据
    公共－xpath    //XCUIElementTypeSwitch[@name="被关注"]
    公共-校验数据    ${newpush}    newpush_18    ${table_click}    1

返回消息设置pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_029    ${table_pvs}    1

返回消息设置pvs1
    公共-校验数据    ${pvs1}    shezhi_029    ${table_pvs1}    1

返回设置pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_030    ${table_pvs}    1

返回设置pvs1
    公共-校验数据    ${pvs1}    shezhi_030    ${table_pvs1}    1
