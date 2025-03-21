*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot

*** Test Cases ***
搜索入口-首页
    首页-搜索
    公共-页面包含元素    搜索历史
    公共-页面包含元素    热门搜索

搜索页取消
    公共－点击页面文本    取消
    公共-页面包含元素    精选

直播搜索
    首页-搜索
    搜索首页－输入搜索词    少年说
    搜索-点击搜索
    #公共-页面包含文本    距离直播开始
    公共-页面包含元素    开始时间：2月12日 19:25

点名字跳转
    公共－点击页面文本    少年说3
    直播-退出

点精彩抢先看
    公共－点击页面文本    精彩抢先看
    直播-退出

搜索结果页取消
    公共－点击页面文本    取消
    公共-页面包含元素    精选

综艺多季-全部
    首页-搜索
    搜索首页－输入搜索词    快乐大本营2016
    搜索-点击搜索
    点击不可见文本    全部
    sleep    2
    公共-页面包含元素    快乐大本营20161231期：TFBOYS吴亦凡领群星拼歌斗舞齐跨年 张杰谢娜同台嗨唱川味Rap
    公共-页面包含元素    TFBOYS领群星拼歌斗舞齐跨年
    公共-页面包含文本    万次播放
    非播放页-返回

综艺多季-相同系列
    单行剧集个数    2    //XCUIElementTypeStaticText[@name="相同系列"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton
    单行剧集个数    2    //XCUIElementTypeStaticText[@name="相同系列"]/../following-sibling::XCUIElementTypeCell[2]/XCUIElementTypeButton
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="相同系列"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[1]    label    快乐大本营2019
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="相同系列"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[2]    label    快乐大本营2018
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="相同系列"]/../following-sibling::XCUIElementTypeCell[2]/XCUIElementTypeButton[1]    label    快乐大本营2017
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="相同系列"]/../following-sibling::XCUIElementTypeCell[2]/XCUIElementTypeButton[2]    label    快乐大本营2015

综艺多季-查看全部
    comment    上滑
    scroll    name=全部    name=查看全部·共17部
    公共－点击页面文本    查看全部·共17部
    sleep    3
    公共-页面包含元素    快乐大本营20161231期：TFBOYS吴亦凡领群星拼歌斗舞齐跨年 张杰谢娜同台嗨唱川味Rap
    公共－点击页面文本    2015
    公共-页面包含元素    快乐大本营20151226期：李易峰示意吴亦凡抱抱
    公共－点击页面文本    2017
    sleep    3
    公共-页面包含元素    快乐大本营20171230期 ：王俊凯何炅戏精上身“对呛”不断 热巴变身可爱小鸡跳萌舞
    非播放页-返回

综艺多季-单季
    搜索－x
    搜索首页－输入搜索词    亲爱的客栈
    搜索-点击搜索
    公共-页面不包含元素    查看全部
    公共-页面不包含元素    相同系列

综艺多季-纠错
    搜索－x
    搜索首页－输入搜索词    最动厅的事
    搜索-点击搜索
    公共-页面包含元素    已为您搜索“最动听的事” ，仍搜索:
    公共－xpath    //XCUIElementTypeButton[@name="最动厅的事"]
    sleep    3
    公共-页面不包含元素    最动听的事

综艺多季-纠错2
    搜索－x
    搜索首页－输入搜索词    超女
    搜索-点击搜索
    sleep    3
    公共-页面包含元素    已为您搜索“超级女声” ，仍搜索:
    公共-页面包含元素    2006超级女声
    公共－xpath    //XCUIElementTypeButton[@name="超女"]
    公共-页面包含元素    超女掌萌人

综艺多季-纠错3
    搜索－x
    搜索首页－输入搜索词    haoxians
    搜索-点击搜索
    sleep    3
    公共-页面包含元素    已为您搜索“好先生” ，仍搜索:
    公共－xpath    //XCUIElementTypeButton[@name="haoxians"]
    公共-页面包含元素    热门推荐

站外搜索
    搜索－x
    搜索首页－输入搜索词    奔跑吧
    搜索-点击搜索
    sleep    3
    搜索-点击播放
    sleep    3
    公共-页面包含元素    相关视频
    公共-页面包含元素    看了还会看

跳转外站H5
    公共－xpath    //XCUIElementTypeButton[@name="backbg icon"]/following-sibling::XCUIElementTypeButton[1]
    公共－点击页面文本    网页播放
    comment    公共-页面包含元素    无法连接到网络，点击重试
    非播放页-返回
    公共-页面包含元素    相关视频
    公共－点击页面文本    backbg icon
    公共-页面包含元素    播放
