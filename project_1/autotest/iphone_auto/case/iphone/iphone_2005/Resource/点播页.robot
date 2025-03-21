*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot

*** Variables ***
${play_download}    Player Floor DownLoad

*** Keywords ***
点播播放页-返回
    sleep    2
    comment    公共－点击页面文本    player back Shadow
    click element    nsp= name=="player back Shadow" and visible==true
    sleep    2

点播播放页-暂停
    tap    xpath=//XCUIElementTypeButton[@name="player back Shadow"]/..    100    50    count=2

点播播放页-点屏幕
    sleep    2
    comment    click element    xpath=//XCUIElementTypeButton[@name="player back Shadow"]/..
    click a point    100    100

点播播放页-反映厅
    公共－点击页面文本    VideoHall EnteriCON

点播播放页-投屏
    公共－点击页面文本    play dlnaicon nor

点播播放页-赞
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor Share"]/preceding-sibling::XCUIElementTypeButton[last()]

点播播放页-下载
    Comment    公共－点击页面文本    Player Floor DownLoad
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor DownLoad"]

点播播放页-退出下载
    公共－点击页面文本    close icon

点播播放页-下载集数
    [Arguments]    ${xpath}
    公共－xpath    ${xpath}
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    取消缓存
    run keyword if    ${aa}    点播播放页-删除并下载    ${xpath}    取消缓存
    ${bb}=    Run Keyword And Return Status    Page Should Contain Text    删除
    run keyword if    ${bb}    点播播放页-删除并下载    ${xpath}    删除

点播播放页-删除并下载
    [Arguments]    ${xpath}    ${name}
    公共－点击页面文本    ${name}
    公共－xpath    ${xpath}

点播播放页-收藏
    公共－点击页面文本    Player Floor Collect Normal
    comment    公共－xpath    //XCUIElementTypeButton[@name="down icon nor"]/following-sibling::XCUIElementTypeButton[1]

点播播放页-分享
    公共－点击页面文本    Player Floor Share
    comment    公共－点击页面文本    share icon nor

点播播放页-分享到
    [Arguments]    ${end_locator}
    公共-分享到    Player Floor Share    ${end_locator}

点播播放页-节目详情
    comment    公共－xpath    //XCUIElementTypeButton[@name="down icon nor"]/preceding-sibling::XCUIElementTypeButton[3]
    comment    公共－点击页面文本    青云志 DVD版
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor Share"]/following-sibling::XCUIElementTypeButton[1]

点播播放页-评论
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor Share"]/following-sibling::XCUIElementTypeButton[last()]
    comment    公共－点击页面文本    评论

点播播放页-评论详情
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/..

点播播放页-评论返回
    公共－xpath    //XCUIElementTypeStaticText[@name="评论"]/following-sibling::XCUIElementTypeButton[1]

点播播放页-评论详情返回
    公共－xpath    //XCUIElementTypeStaticText[@name="评论详情"]/following-sibling::XCUIElementTypeButton[1]

点播播放页-全屏
    Comment    公共－点击坐标点    180    100
    comment    click element    name=big nor nor new
    tap    big nor nor    0    0

点播播放页-开通会员
    sleep    1
    Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIAButton[4]
    sleep    1

点播播放页-节目空间
    公共－xpath    (//XCUIElementTypeStaticText[@name="青云志"])[2]

点播播放页-正片列表
    公共－xpath    //XCUIElementTypeStaticText[@name="正片"]/preceding-sibling::XCUIElementTypeButton[1]

点播播放页-正片列表关闭
    comment    公共－xpath    //XCUIElementTypeStaticText[@name="青云志 DVD版" and @visible=true]/following-sibling::XCUIElementTypeButton[1]
    公共－xpath    //XCUIElementTypeStaticText[@name="青云志 DVD版" and (@visible='true')]/following-sibling::XCUIElementTypeButton[1]

点播播放页-花絮列表关闭
    comment    公共－xpath    (//XCUIElementTypeStaticText[@name="花絮片段"])[2]/following-sibling::XCUIElementTypeButton[1]
    公共－xpath    //XCUIElementTypeStaticText[@name="花絮片段" and (@visible='true')]/following-sibling::XCUIElementTypeButton[1]
    comment    tap    nsp= name=='花絮片段' AND visible ==true    380    10

点播播放页-花絮
    ${aa}    Run Keyword And Return Status    Element Should Be Visible    name=花絮片段
    run keyword if    ${aa}== False    上滑
    公共－xpath    //XCUIElementTypeStaticText[@name="花絮片段"]/preceding-sibling::XCUIElementTypeButton[1]

点播播放页-明星空间
    ${aa}    Run Keyword And Return Status    Element Should Be Visible    name=赵丽颖
    run keyword if    ${aa}== False    公共-滑动页面    青云志 DVD版    赵丽颖
    公共－点击页面文本    赵丽颖

全屏播放-返回
    sleep    1
    Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIAButton[5]
    sleep    1

互动剧播放-返回
    公共－点击页面文本    back nobg

点播播放页-超清
    Comment    公共－点击坐标点    300    150
    Comment    sleep    10
    tap    300    150
    click element    name=标清
    click element    name=蓝光
    sleep    1
    comment    location: {333.5, 287.5}
    comment    size: {120, 70.000007629394531}
    comment    xpath: //UIAApplication[1]/UIAWindow[1]/UIAButton[8]

点播播放页-播放正片
    sleep    1
    Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[2]/UIACollectionView[1]/UIACollectionCell[4]
    sleep    1

点播播放页-会员看全集
    Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]/UIAButton[1]

点播播放页-确定开通vip
    Click Element    xpath=//UIAApplication[1]/UIAWindow[4]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]

点播播放页-拖动进度条
    [Arguments]    ${text}
    公共－点击坐标点    100    100
    input value    xpath=//UIAApplication[1]/UIAWindow[1]/UIASlider[1]    ${text}

点播-关闭右滑
    公共－点击页面文本    Gesture_ClosePlayer_Background

新版点播-评论
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor Share"]/following-sibling::XCUIElementTypeButton[last()]

新版点播-下载
    公共－点击页面文本    Player Floor DownLoad

新版点播-分享
    公共－点击页面文本    Player Floor Share

新版点播-加入看单
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor Collect Normal"]

新版点播-点赞
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor Share"]/preceding-sibling::XCUIElementTypeButton[last()]

新版点播-节目详情
    公共－xpath    //XCUIElementTypeButton[@name="Player Floor Share"]/following-sibling::XCUIElementTypeButton[1]

新版点播-滑动到feed流
    comment    公共-滑动页面    快乐大本营 2018    积木宝宝
    上滑

新版点播-feed流点播放
    公共－xpath    (//XCUIElementTypeButton[@name="ShortVideo Pause iCON"])[1]

新版点播-feed流看正片
    公共－xpath    (//XCUIElementTypeButton[@name="看正片"])[1]

新版点播-feed流点举报
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]
    公共－点击页面文本    不感兴趣
    公共－点击页面文本    取消

新版评论-点更多
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]

新版评论-点分享
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]

新版评论-点赞
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeButton[1]

新版评论-点回复
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeButton[2]
    验证手机

新版评论-点更多话题
    comment    公共－xpath    //XCUIElementTypeOther[@name="话题"]
    tap    话题    10    20

新版评论-点单个话题
    公共－xpath    //XCUIElementTypeButton[@name="#青春芒果节#"]

新版评论-点评论者头像
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeImage[1]

新版评论-点评论中话题
    tap    xpath=(//XCUIElementTypeButton[@name="Discuss More Gray"])[1]//preceding-sibling::XCUIElementTypeOther[1]    270    10

新版评论-点评论内容
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeStaticText[last()]

新版评论-点添加评论
    公共－点击页面文本    添加评论...

发表评论-点话题图标
    公共－点击页面文本    Comment Topic Normal

发表评论-关闭
    公共－xpath    //XCUIElementTypeButton[@name="Comment Iput Emoj"]/preceding-sibling::XCUIElementTypeButton[1]

发表评论-点话题
    公共－xpath    //XCUIElementTypeStaticText[@name="#青春芒果节#" and @visible="true"]

新版评论详情页-点回复
    公共－xpath    //XCUIElementTypeButton[@name="Discuss More Gray" and @visible="true"]/preceding-sibling::XCUIElementTypeButton[2]
    验证手机

新版评论详情页-点赞
    公共－xpath    //XCUIElementTypeButton[@name="Discuss More Gray" and @visible="true"]/preceding-sibling::XCUIElementTypeButton[1]

新版评论详情页-点分享
    公共－xpath    //XCUIElementTypeButton[@name="Discuss More Gray" and @visible="true"]

新版评论详情页-点更多
    公共－xpath    //XCUIElementTypeButton[@name="Discuss More Gray" and @visible="true"]

详情页回复点赞
    公共－xpath    //XCUIElementTypeOther[@name="是的"]/following-sibling::XCUIElementTypeButton[1]

点播页-关闭角标
    run keyword and ignore error    公共－点击页面文本    DBPlayer CornerAd

验证手机
    判断后点击    稍后再验证

分享到QQ
    sleep    10
    判断后点击    重新登录
    sleep    3
    公共－xpath    //XCUIElementTypeStaticText[@name="我的电脑"]
    公共－点击页面文本    发送
    sleep    2
    公共－点击页面文本    返回芒果TV
    sleep    10

分享到QQ取消
    sleep    5
    判断后点击    重新登录
    sleep    3
    公共－点击页面文本    取消
    sleep    2

分享到QQ空间
    sleep    5
    判断后点击    重新登录
    sleep    3
    公共－点击页面文本    发表
    comment    公共－点击页面文本    返回芒果TV
    sleep    3

返回芒果TV
    公共－点击页面文本    breadcrumb
    sleep    2

互动剧-点播放
    按坐标点击元素    nsp= name=="互动播放" and type=="XCUIElementTypeButton"
