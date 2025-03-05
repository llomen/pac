*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot

*** Variables ***
${icon_download}    Channel Download iCON
${icon_history}    Channel History iCON
${icon_notice}    Channel Notice iCON
${pianku_search}    navigantionbar search

*** Test Cases ***
首页精选频道-按钮展示
    公共-页面包含元素    name=${icon_saoma}

频道切换-点击跳转综艺
    公共－点击页面文本    综艺
    公共-页面不包含元素    name=${icon_saoma}

综艺频道-显示片库
    公共-页面包含元素    name=王牌
    公共-页面包含元素    name=音乐
    公共-页面包含元素    name=全部

频道切换-左滑到电视剧频道
    左滑
    公共-页面包含元素    name=甜蜜
    公共-页面包含元素    name=仙侠
    公共-页面包含元素    name=全部

频道切换-右滑回综艺频道
    右滑
    公共-页面包含元素    name=王牌
    公共-页面包含元素    name=音乐
    公共-页面包含元素    name=全部

跳转频道管理
    首页-频道管理
    公共-页面包含元素    全部频道
    公共-页面包含元素    排序
    公共-页面包含元素    精选
    公共-页面包含元素    电视剧
    公共-页面包含元素    直播
    公共-页面包含元素    xpath=//XCUIElementTypeStaticText[@name="少儿"]/preceding-sibling::XCUIElementTypeOther[1]/XCUIElementTypeImage

频道管理返回
    非播放页-返回
    公共-页面包含元素    name=王牌

频道管理跳电视剧频道
    首页-频道管理
    公共－点击页面文本    电视剧
    公共-页面包含元素    name=甜蜜

点击跳转片库
    公共－点击页面文本    全部
    sleep    10
    公共-页面包含元素    电视剧
    公共-页面包含元素    热搜

片库筛选-类型
    #判断片库筛选类型、区域、推荐搜索
    公共-页面包含文本    甜蜜互宠
    公共-页面包含文本    虐恋情深
    公共-页面包含文本    青涩校园

片库筛选-区域
    公共-页面包含文本    内地
    公共-页面包含文本    日韩
    公共-页面包含文本    港台

片库筛选-热搜
    公共-页面包含元素    赵丽颖
    公共-页面包含元素    冯绍峰
    公共-页面包含元素    唐嫣

片库视频元素判断
    #判断第一个视频名称、集数显示等
    公共-页面包含元素    奈何boss要娶我
    公共-页面包含元素    徐开骋,易柏辰,王双,杨昊铭,刘贾玺,黄千硕,孙嘉琪,陈欣孺
    公共-页面包含文本    VIP免费
    公共-页面包含文本    20集全

切换标签-类型
    #切换标签后判断第一个视频
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "甜蜜互宠")]
    sleep    3
    公共-页面包含元素    幸福照相馆
    公共-页面包含元素    林永健,左小青,王婉娟
    公共-页面包含文本    40集全
    公共-页面不包含元素    xpath=(//XCUIElementTypeImage)[1]/XCUIElementTypeStaticText[2]

切换标签-区域
    #切换标签后判断第一个视频
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "港台")]
    sleep    3
    公共-页面包含元素    情深深雨濛濛
    公共-页面包含元素    赵薇,林心如,苏有朋,古巨基,高鑫,李钰,王琳,寇振海
    公共-页面包含文本    46集全
    公共-页面不包含元素    xpath=(//XCUIElementTypeImage)[1]/XCUIElementTypeStaticText[2]

切换标签-排序
    #切换标签后判断第一个视频
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "最新")]
    sleep    3
    公共-页面包含元素    狮子王强大
    公共-页面包含元素    曹晏豪,周晓涵,刘书宏,阳靓
    公共-页面包含文本    VIP免费
    公共-页面包含文本    25集全

点击片库搜索
    公共－点击页面文本    ${pianku_search}
    sleep    2
    公共-页面包含元素    搜索历史
    公共－点击页面文本    取消

点击片库热搜
    公共－点击页面文本    赵丽颖
    公共-页面包含元素    赵丽颖的热门作品
    公共-页面包含元素    进入空间

搜索结果页返回
    公共－点击页面文本    取消

切换片库-全部频道
    公共－点击页面文本    电视剧
    公共-页面包含元素    全部频道
    Element Attribute Should Match    name=狮子王强大    visible    false

片库筛选元素判断-动漫
    公共－点击页面文本    动漫
    sleep    5
    公共-页面包含文本    恋爱少女
    公共-页面包含文本    热血
    公共-页面包含文本    轻松搞笑
    公共-页面包含文本    剧场版
    公共-页面包含文本    TV版
    公共-页面包含文本    OVA版
    公共-页面不包含元素    热搜

片库视频元素判断-动漫
    #判断第一个视频名称、集数显示等
    公共-页面包含文本    汪汪队

*** Keywords ***
左滑
    swipe    340    467    85    467
    capture page screenshot

右滑
    swipe    85    467    340    467
    capture page screenshot
