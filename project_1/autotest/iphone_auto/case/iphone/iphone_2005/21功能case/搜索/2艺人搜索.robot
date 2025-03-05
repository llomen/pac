*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot

*** Test Cases ***
艺人搜索热门作品3个
    首页-搜索
    comment    tap    name=search_textField    20    10
    搜索首页－输入搜索词    何炅
    搜索-点击搜索
    comment    公共-页面包含元素    主持人/歌手/演员/导演 32.7万人关注 上传视频：471条
    公共-页面包含文本    主持人/歌手/演员/导演
    公共-页面包含文本    32.7万人关注
    公共-页面包含文本    上传视频：471条
    热门作品个数    3

热门作品播放
    公共－点击页面文本    向往的生活
    点播播放页-返回

艺人更多热门作品
    公共－点击页面文本    更多何炅的作品
    sleep    2
    公共-页面包含元素    何炅的作品
    公共-页面包含元素    快乐大本营
    公共-页面包含元素    向往的生活
    Comment    非播放页-返回

艺人作品tab切换
    公共－点击页面文本    参加综艺
    公共-页面包含元素    天天向上：汪涵何炅合体秀恩爱 快乐家族集体穿越
    公共－点击页面文本    电视剧
    公共-页面包含元素    欢喜密探

艺人饭团
    非播放页-返回
    公共－点击页面文本    进入饭团
    comment    公共-页面包含元素    高情商 逆生长 暖男属性的何老师☀
    公共-页面包含元素    全部动态
    公共-页面包含元素    作品
    非播放页-返回

艺人相关搜索-6个
    comment    公共-滑动页面    热门作品    相关搜索
    上滑
    上滑
    上滑
    相关搜索个数    6

点相关搜索跳转
    公共－xpath    //XCUIElementTypeStaticText[@name="相关搜索"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[1]

艺人-少于三个作品
    搜索－x
    搜索首页－输入搜索词    杨超越
    搜索-点击搜索
    公共-页面包含元素    热门作品
    公共-页面包含元素    快乐中国毕业歌会
    公共-页面不包含元素    更多杨超越的作品
    热门作品个数    2

电视剧搜索-大于12个
    搜索－x
    搜索首页－输入搜索词    青云志
    搜索-点击搜索
    单行剧集个数    6    //XCUIElementTypeStaticText[@name="青云志"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton
    单行剧集个数    6    //XCUIElementTypeStaticText[@name="青云志"]/../following-sibling::XCUIElementTypeCell[2]/XCUIElementTypeButton
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="青云志"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[6]    label    ...
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="青云志"]/../following-sibling::XCUIElementTypeCell[2]/XCUIElementTypeButton[last()]    label    58

选集
    公共－xpath    //XCUIElementTypeStaticText[@name="青云志"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[last()]
    公共-页面包含元素    选集
    comment    公共-页面包含元素    58集全
    非播放页-返回

电视剧搜索-6-12
    搜索－x
    搜索首页－输入搜索词    如果爱 张柏芝版
    搜索-点击搜索
    单行剧集个数    6    //XCUIElementTypeStaticText[@name="如果爱 张柏芝版"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton
    单行剧集个数    2    //XCUIElementTypeStaticText[@name="如果爱 张柏芝版"]/../following-sibling::XCUIElementTypeCell[2]/XCUIElementTypeButton
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="如果爱 张柏芝版"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[6]    label    6
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="如果爱 张柏芝版"]/../following-sibling::XCUIElementTypeCell[2]/XCUIElementTypeButton[last()]    label    8

电视剧搜索-小于6
    搜索－x
    搜索首页－输入搜索词    她很漂亮 互怼版
    搜索-点击搜索
    单行剧集个数    3    //XCUIElementTypeStaticText[@name="她很漂亮 互怼版"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="她很漂亮 互怼版"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[last()]    label    3

搜索播单
    搜索－x
    搜索首页－输入搜索词    三生三世十里桃花
    搜索-点击搜索

播放播单
    公共－xpath    (//XCUIElementTypeStaticText[@name="播放"])[1]
    sleep    3
    公共-页面包含元素    杨洋刘亦菲虐心三世情缘
    公共-页面包含元素    影片列表
    点播播放页-返回

*** Keywords ***
热门作品个数
    [Arguments]    ${num}
    ${length}    元素个数    xpath=//XCUIElementTypeStaticText[@name="热门作品"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton
    Should Be Equal As Integers    ${num}    ${length}    num should be ${num} ,acture    ${length}

相关搜索个数
    [Arguments]    ${num}
    ${length}    元素个数    xpath=//XCUIElementTypeStaticText[@name="相关搜索"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton
    Should Be Equal As Integers    ${num}    ${length}    num should be ${num} ,acture    ${length}
