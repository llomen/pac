*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot

*** Variables ***
${icon_download}    Channel Download iCON
${icon_history}    Channel History iCON
${icon_notice}    Channel Notice iCON
${zhibo_hanhua}    LiveRoom Call Normal
${zhibo_liwu}     LiveRoom Gift iCON

*** Test Cases ***
直播频道
    首页-频道管理
    公共－点击页面文本    直播
    公共-页面包含元素    name=${icon_saoma}

电视台图标显示
    #显示4个电视台
    单行剧集个数    4    //XCUIElementTypeStaticText[@name="电视台"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton
    公共-页面包含元素    快乐购
    公共-页面包含元素    湖南经视
    公共-页面包含元素    湖南娱乐
    公共-页面包含元素    湖南都市

直播首页进电视台
    点击不可见文本    快乐购
    sleep    5
    #公共-页面包含元素    ${zhibo_hanhua}
    #公共-页面包含元素    ${zhibo_liwu}

进入电视台列表
    直播-退出
    公共-页面包含元素    直播大事件
    公共－点击页面文本    查看更多
    公共-页面包含元素    金鹰卡通

电视台列表进入电视台
    sleep    3
    点击不可见文本    金鹰卡通

返回电视台列表
    直播-退出
    公共-页面包含元素    湖南电视剧

返回直播首页
    非播放页-返回
    公共-页面包含元素    直播大事件

直播大事件详情
    公共-页面包含元素    2月26
    公共-页面包含元素    19:25
    公共-页面包含元素    少年说3
    公共-页面包含元素    一起聆听少年的声音

直播大事件个数
    单行剧集个数    4    //XCUIElementTypeStaticText[@name="直播大事件"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeTable/XCUIElementTypeCell

点关注跳转登录页
    公共－xpath    (//XCUIElementTypeButton[@name="预约"])[1]
    #公共-页面包含元素    登录
    登录页-关闭
    公共-页面包含元素    直播大事件

直播大事件展开
    #上滑
    公共－点击页面文本    点击展开
    单行剧集个数    6    //XCUIElementTypeStaticText[@name="直播大事件"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeTable/XCUIElementTypeCell
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="直播大事件"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeTable/XCUIElementTypeCell[6]/XCUIElementTypeStaticText[3]    label    天天向上

收起直播大事件
    公共－点击页面文本    点击收起
    公共-页面包含元素    点击展开

精彩回顾显示
    Element Should Be Visible    name=精彩回顾    NONE

精彩回顾一行2个
    #每一个包含2个text，标题与内容
    单行剧集个数    4    //XCUIElementTypeStaticText[@name="精彩回顾"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeStaticText

点击精彩回顾跳点播页
    公共－点击页面文本    第91届奥斯卡金像奖
    公共-页面包含文本    评论

*** Keywords ***
上滑
    swipe    122    504    4    -387
    capture page screenshot
