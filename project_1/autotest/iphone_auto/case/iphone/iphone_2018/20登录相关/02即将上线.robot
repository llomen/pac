*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Force Tags        smoke
Resource          ../5.3对象库.robot


*** Variables ***
${btclick}        {'act':'btclick'}

*** Test Cases ***
未登录点单条预约click
    上滑
    上滑
    上滑
    swipe    200    400    200    150
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="预约"])[1]
    公共-校验数据    ${btclick}    btclick_001    ${table_click}    1

点预约跳登录pvs
    sleep    2
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

点预约跳登录pvs1
    公共-校验数据    ${pvs1}    zhuiju_001    ${table_pvs1}    0

登录浮层弹出cv
    公共-校验数据    ${cv}    login_01    ${table_cv}    1

登录页返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

登录页返回pvs1
    公共-校验数据    ${pvs1}    zhuiju_002    ${table_pvs1}    0

频道点即将上线的视频pvs
    公共-删除数据
    公共－点击页面文本    未来机器城
    公共-校验数据    ${pvs}    zhuiju_001    ${table_pvs_dianbo}    1

频道点即将上线的视频pvs1
    公共-校验数据    ${pvs1}    zhuiju_001    ${table_pvs1}    1

预约视频vv
    Comment    sleep    15
    公共-校验数据    ${aplay}    kandan_01    ${table_vv}    1

点播页返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

点播页返回pvs1
    公共-校验数据    ${pvs1}    zhuiju_002    ${table_pvs1}    1

点我的预约跳登录pvs
    公共-删除数据
    公共－点击页面文本    我的预约
    sleep    2
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

点我的预约跳登录pvs1
    公共-校验数据    ${pvs1}    zhuiju_001    ${table_pvs1}    0

登录浮层弹出2cv
    公共-校验数据    ${cv}    login_01    ${table_cv}    1

登录后返回频道
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}

已登录点预约btclick
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="预约"])[1]
    公共-校验数据    ${btclick}    btclick_001    ${table_click}    1

进入我的预约pvs
    公共-删除数据
    公共－点击页面文本    我的预约
    sleep    2
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

进入我的预约pvs1
    公共-校验数据    ${pvs1}    zhuiju_001    ${table_pvs1}    1

我的预约点视频pvs
    sleep    2
    公共-删除数据
    公共－点击页面文本    初恋那件小事
    sleep    3
    公共-校验数据    ${pvs}    zhuiju_001    ${table_pvs_dianbo}    1

我的预约点视频pvs1
    公共-校验数据    ${pvs1}    zhuiju_001    ${table_pvs1}    1

我的预约视频vv
    Comment    sleep    15
    公共-校验数据    ${aplay}    kandan_01    ${table_vv}    1

点播页返回已预约pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

点播页返回已预约pvs1
    公共-校验数据    ${pvs1}    zhuiju_002    ${table_pvs1}    1

切换tab待上线pvs
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[contains(@name, "待上线")]
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

切换tab待上线pvs1
    公共-校验数据    ${pvs1}    zhuiju_002    ${table_pvs1}    1

退出我的预约pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

退出我的预约pvs1
    公共-校验数据    ${pvs1}    zhuiju_002    ${table_pvs1}    1

取消预约btclick
    公共-删除数据
    公共－xpath    //XCUIElementTypeButton[@name="已预约"]
    公共-校验数据    ${btclick}    btclick_001    ${table_click}    1

进每日放送
    首页-每日放送

加入看单click
    公共-删除数据
    每日放送-加入看单
    公共-校验数据    ${btclick}    show_zl_01    ${table_click}    1

取消加入看单click
    公共-删除数据
    每日放送-取消加入看单
    公共-校验数据    ${btclick}    show_zl_01    ${table_click}    1
