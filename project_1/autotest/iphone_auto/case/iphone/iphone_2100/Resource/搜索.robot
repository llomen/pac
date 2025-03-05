*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot
Library           AppiumLibrary

*** Variables ***
${search_del}     search delete

*** Keywords ***
搜索－点击搜索
    公共－点击页面文本    Search
    sleep    4

搜索首页－输入搜索词
    [Arguments]    ${text}
    comment    input text    xpath=//XCUIElementTypeTextField[@name="search_textField"]    ${text}
    搜索－输入搜索词    ${text}

搜索－仍然搜索
    sleep    1
    Click Element    xpath=//XCUIElementTypeButton[@name="kuaile"]
    sleep    1

直播－搜索
    公共－点击页面文本    navigantionbar search

vip-搜索
    公共－点击页面文本    Vip navigantionbar search

搜索－x
    点击不可见文本    search_textField
    &{size} =    get element size    name=search_textField
    &{location} =    get element location    name=search_textField
    ${x} =    evaluate    ${location.x}+${size.width}-10
    ${y} =    evaluate    ${location.y}+${size.height}/2
    click a point    ${x}    ${y}

搜索－取消
    公共－点击页面文本    取消

搜索－筛选展开
    sleep    1
    Click Element    name=search screen n
    sleep    1

搜索-点击搜索
    comment    公共－点击页面文本    确认
    comment    公共－点击页面文本    搜索
    comment    sleep    2
    搜索－点击搜索

搜索-点击热门作品
    点击不可见文本    欢乐颂2

搜索-点击进入空间
    公共－点击页面文本    进入空间

搜索-点击综艺结果全部
    sleep    2
    comment    Click Element    xpath=(//XCUIElementTypeStaticText[@name="全部"])[1]
    Click Element    nsp= name=="全部" and visible==true
    sleep    2

搜索-点击相同系列
    sleep    3
    Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIATableView[2]/UIATableCell[8]/UIAButton[2]
    sleep    2

搜索-点击剧集的...
    公共－点击页面文本    ...

搜索-点击剧集的集数
    comment    公共－点击页面文本    1
    comment    点击第N个元素    name=1    0
    公共－xpath    //XCUIElementTypeButton[@name="1"]

搜索-点击剧集的集数2
    公共－xpath    //XCUIElementTypeButton[@name="2"]

搜索-历史搜索
    sleep    1
    Click Element    xpath=//XCUIElementTypeStaticText[@name="搜索历史"]/../following-sibling::XCUIElementTypeCell[1]
    sleep    1

搜索-相关搜索
    sleep    1
    Click Element    xpath=//XCUIElementTypeStaticText[@name="相关搜索"]/../following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[1]
    sleep    1

搜索-中间页点击集数
    公共－点击页面文本    1

搜索-入口页切换tab
    [Arguments]    ${tab}
    公共－点击页面文本    ${tab}

搜索-点击更多作品
    comment    上滑
    Comment    公共-滑动页面    查看更多    更多杨幂的作品
    公共－点击页面文本    更多杨幂的作品

搜索-点击播放
    公共－xpath    (//XCUIElementTypeStaticText[@name="播放"])[1]
    comment    click element    nsp= name=="播放" and visible==true

搜索-点击缓存
    按坐标点击元素    缓存

搜索结果页-点击饭团头像
    公共－xpath    //XCUIElementTypeButton[@name="+ 加入"]/preceding-sibling::XCUIElementTypeStaticText[2]

搜索－输入搜索词
    [Arguments]    ${value}
    Input Value    name=search_textField    ${value}
    comment    sleep    2

搜索－返回
    sleep    2
    Click Element    name=NavigantionBar OrangeBack
    comment    Click Element    name=back white nor

搜索－search
    sleep    1
    Click Element    name=SearchStart
    sleep    1

搜索结果－最新
    sleep    1
    Click Element    name=最新
    sleep    1

搜索结果－最热
    sleep    1
    Click Element    name=最热
    sleep    1

搜索结果－点击短片
    Click Element    name=发布时间：2014-08-22
    Comment    Click Element    name=吻戏来啦！清锁长恭触不及防的一吻
    sleep    1

搜索无结果－查看全部
    sleep    1
    Click Element    name=查看全部搜索结果
    sleep    2

搜索无结果－播放第一个视频
    sleep    1
    Click Element    name=快乐大本营 2017
    sleep    1

搜索－删除搜索历史
    comment    Click Element    name＝${search_del}
    Click Element    xpath=//XCUIElementTypeButton[@name="search delete"]
    sleep    3
    run keyword and ignore error    Click Element    xpath=//XCUIElementTypeButton[@name="确定"]

搜索-删除历史记录
    ${aa}    Run Keyword And Return Status    Page Should Contain Element    搜索历史
    run keyword if    ${aa}==True    搜索－删除搜索历史

搜索－键盘搜索
    sleep    1
    Click Element    name=Search
    sleep    1
    ${res}    is element exist    name=Search
    log    ${res}
    Run keyword If    "${res}"=="${true}"    Click element    name=Search
    sleep    1

搜索－点击搜索框
    sleep    1
    comment    Click Element    name=searchTextField
    Click Element    xpath=//XCUIElementTypeTextField[@name="search_textField"]/..

搜索－关闭点播列表
    Click Element    name=vodInfo cancel
    sleep    3

搜索－相关明星
    swipe    400    700    400    200
    tap    相关明星    492    129
    Comment    Click Element    name=房祖名
    sleep    1

搜索－相关艺人
    swipe    400    700    400    200
    swipe    400    700    400    200
    Click Element    name=李易峰
    sleep    1

搜索－上传视频
    swipe    400    700    400    200
    tap    综合    0    700
    Comment    Click Element    name=偶像来了1
    sleep    1

搜索－上传视频更多
    Click Element    xpath=(//XCUIElementTypeStaticText[@name="更多"])[2]
    sleep    1

片库－播放第一个
    sleep    1
    tap    全部    40    200
    sleep    5

片库－播放第一个2
    sleep    1
    tap    全部    40    100
    sleep    5

片库列表－屏幕上滑
    swipe_by_percent    50    65    80    65
    sleep    1

站外中间页-返回
    公共－点击页面文本    backbg icon

搜索－屏幕左滑
    Comment    swipe    950    500    0    -500
    swipe    750    100    350    100
    sleep    1

搜索－屏幕右滑
    Comment    swipe    950    500    0    200
    swipe    350    100    750    100
    sleep    1

搜索－下载
    Click Element    name=下载
    sleep    3

搜索－删除下载
    Click Element    name=8
    sleep    2
    Click Element    name=删除
    sleep    3

搜索－关闭缓存列表
    Click Element    name=close icon
    sleep    3

搜索－结果页点播单
    公共－xpath    (//XCUIElementTypeStaticText[@name="我的特工爷爷"])[2]/preceding-sibling::XCUIElementTypeButton[1]

单行剧集个数
    [Arguments]    ${num}    ${xpath}
    ${length}    元素个数    xpath=${xpath}
    Should Be Equal As Integers    ${num}    ${length}    num should be ${num} ,acture    ${length}
