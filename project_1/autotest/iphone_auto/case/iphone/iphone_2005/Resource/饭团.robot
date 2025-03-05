*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot

*** Keywords ***
饭团-推荐
    公共－点击页面文本    推荐

饭团-我的饭团
    公共－点击页面文本    我的饭团

饭团-电视台
    公共－点击页面文本    Live Navigantion Bar Live TV

饭团-我的头像
    comment    公共－点击页面文本    headshot personal
    comment    公共－xpath    //XCUIElementTypeButton[@name="Live Navigantion Bar Live TV"]/following-sibling::XCUIElementTypeButton[1]
    首页-我
    我-点名字

饭团-我的头像-返回
    comment    公共－点击页面文本    backbg icon
    非播放页-返回

饭团-消息
    comment    公共－点击页面文本    Channel Notice iCON
    公共－xpath    //XCUIElementTypeTextField[@name="search_textField"]/../following-sibling::XCUIElementTypeButton[1]

饭团-搜索
    公共－点击页面文本    search_textField

饭团-搜索-输入
    [Arguments]    ${text}
    input text    xpath=//XCUIElementTypeTextField[@name="search_textField"]    ${text}
    搜索－点击搜索
    sleep    10

饭团-顶部分享
    公共－点击页面文本    web more

饭团-发布
    公共－点击页面文本    fantuan Home page release

饭团-发布-取消
    公共－点击页面文本    取消
    #取消保存提示
    判断后点击    取消

饭团-发布-提交
    Comment    公共－点击页面文本    Comment input Send
    公共－点击页面文本    Comment Send Disable iCON

饭团-发布-选择饭团
    公共－点击页面文本    请选择

饭团-发布-输入标题
    [Arguments]    ${text}
    input text    xpath=//XCUIElementTypeStaticText[@name="标题:"]/following-sibling::XCUIElementTypeTextField[1]    ${text}

饭团-发布-输入内容
    [Arguments]    ${text}
    comment    input text    xpath=//XCUIElementTypeStaticText[@name="我来说两句..."]/..    ${text}
    input text    xpath=//XCUIElementTypeStaticText[@name="标题:"]/../../following-sibling::XCUIElementTypeTextView[1]    ${text}

饭团-发布-选择图片
    公共－点击页面文本    Addition Pictures Normal
    判断后点击    不允许

饭团-发布-选择视频
    公共－点击页面文本    Addition Video Normal
    判断后点击    不允许

饭团-动态-分享
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]

饭团-分享到
    [Arguments]    ${name}
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    ${name}
    run keyword if    ${aa}==False    拉起饭团分享
    公共－点击页面文本    ${name}
    Run Keyword And Ignore Error    公共－点击页面文本    确认

拉起饭团分享
    饭团-动态-分享
    公共-删除数据

饭团-动态-来自饭团
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/preceding-sibling::XCUIElementTypeButton[1]

饭团-动态-评论
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeButton[2]
    饭团-动态-关闭评论框

饭团-动态-关闭评论框
    判断后点击    稍后再验证
    ${bb}    Run Keyword And Return Status    Page Should Contain Element    xpath=//XCUIElementTypeButton[@name="Comment Iput Emoj"]/preceding-sibling::XCUIElementTypeButton[1]
    run keyword if    ${bb}==True    公共－xpath    //XCUIElementTypeButton[@name="Comment Iput Emoj"]/preceding-sibling::XCUIElementTypeButton[1]

饭团-动态-点赞
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeButton[1]

饭团-动态-更多
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]

饭团-动态-发布者
    comment    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeStaticText[last()-1]
    comment    公共－xpath    (//XCUIElementTypeStaticText[@name="甜言幂语"])[1]
    sleep    1
    click element    nsp= name=="甜言幂语"
    sleep    1

饭团-动态-内容
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]/preceding-sibling::XCUIElementTypeOther[1]

饭团-详情-饭团首页
    公共－点击页面文本    fantuan_livesub_background

饭团-详情-个人头像
    公共－点击页面文本    headshot none

饭团-明星-更多
    公共－点击页面文本    web more

饭团-明星-返回
    非播放页-返回

饭团-明星-加入饭团
    公共－点击页面文本    + 加入

饭团-明星-作品
    公共－点击页面文本    作品

饭团-明星-全部动态
    公共－点击页面文本    全部动态

饭团-明星-退出饭团
    饭团-明星-更多
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    退出饭团
    run keyword if    ${aa}    公共－点击页面文本    退出饭团
    ...    ELSE    饭团-关闭浮层

饭团-关闭浮层
    点击不可见文本    web more

饭团-明星-粉丝
    公共－点击页面文本    粉丝

饭团-明星-人气榜
    公共－点击页面文本    人气榜

饭团-明星-签到
    ${aa}    Run Keyword And Return Status    Page Should Contain Element    签到
    run keyword if    ${aa}    公共－点击页面文本    签到

饭团-明星-打榜
    公共－xpath    //XCUIElementTypeButton[contains(@label, "打榜")]

饭团-明星-饭团头衔
    comment    公共－点击页面文本    Fans level0 big bright
    公共－xpath    //XCUIElementTypeButton[contains(@name, "big bright")]

饭团-明星-动态头衔
    comment    公共－点击页面文本    Fans level4 small bright
    公共－xpath    //XCUIElementTypeButton[contains(@name, "small bright")]

退出饭团
    饭团-明星-更多
    公共－点击页面文本    退出饭团

饭团-我的饭团-饭团列表
    公共－点击页面文本    arrow right

饭团-我的饭团-更多饭团
    公共－点击页面文本    更多饭团

饭团-我的饭团-进入第一个饭团
    公共－xpath    //XCUIElementTypeButton[@name="进饭团"][1]

饭团-个人主页-粉丝
    公共－点击页面文本    粉丝

饭团-个人主页-关注
    公共－xpath    //XCUIElementTypeButton[@name="关注"]

饭团-个人主页-饭团
    公共－xpath    //XCUIElementTypeButton[@name="饭团"]

饭团-个人主页-加入的饭团
    公共－点击页面文本    加入的饭团

饭团-个人主页-返回
    comment    公共－点击页面文本    backbg icon
    公共－点击页面文本    fantuan user back default
    comment    非播放页-返回

饭团-个人主页-更多
    公共－点击页面文本    Combined Shape

饭团-ta的饭团-加入第一个
    ${aa}    Get Element Attribute    xpath=//XCUIElementTypeButton[@name="+ 加入"][1]/preceding-sibling::XCUIElementTypeStaticText[1]    name
    公共－xpath    //XCUIElementTypeButton[@name="+ 加入"][1]
    公共－点击页面文本    ${aa}

饭团-结果页-饭团主页
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    + 加入
    run keyword if    ${aa}    搜索结果页-点击饭团头像
    ...    ELSE    公共－点击页面文本    进入

饭团-结果页-第一个发布者
    公共－xpath    //XCUIElementTypeOther[@name="全部动态"]/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeImage[1]

饭团广场-快捷icon芒果人气榜
    comment    公共－xpath    //XCUIElementTypeStaticText[@name="芒果人气榜"]/following-sibling::XCUIElementTypeButton[1]
    公共－点击页面文本    fantuan card bg01

饭团广场-快捷icon明星来了
    comment    公共－xpath    //XCUIElementTypeStaticText[@name="芒果人气榜"]/following-sibling::XCUIElementTypeButton[2]
    公共－点击页面文本    fantuan card bg02

饭团广场-热门话题title
    公共－点击页面文本    热门话题

饭团广场-热门话题第一个
    sleep    1
    click element    nsp= name CONTAINS '李权哲空降饭团'
    sleep    1

饭团广场-实时播报
    公共－点击页面文本    饭团榜单实时播报

饭团广场-实时播报点头像
    公共－xpath    //XCUIElementTypeStaticText[@name="1"]/preceding-sibling::XCUIElementTypeButton[2]

饭团广场-实时播报点名字
    公共－xpath    //XCUIElementTypeStaticText[@name="1"]/preceding-sibling::XCUIElementTypeButton[1]

饭团广场-实时播报点打榜
    公共－xpath    //XCUIElementTypeStaticText[@name="1"]/following-sibling::XCUIElementTypeButton[1]

饭团广场-预约
    公共－点击页面文本    预约

饭团广场-明星来了title
    公共－xpath    //XCUIElementTypeButton[@name="预约"]/../preceding-sibling::XCUIElementTypeOther[1]

饭团广场-明星来了内容
    公共－xpath    //XCUIElementTypeButton[@name="预约"]/following-sibling::XCUIElementTypeButton[1]

饭团广场-最佳饭贴标题
    公共－点击页面文本    最佳饭贴

饭团广场-点banner
    tap    fantuan card bg01    50    -50

饭团广场-点单个饭贴
    公共－点击页面文本    不是在最好的时光遇见了你，而是因为有你在，我才有了最好的时光

饭团广场-立即参与
    公共－点击页面文本    立即参与

饭团-投票成功tab
    公共－点击页面文本    投票成功

饭团-开通饭团
    公共－点击页面文本    开通饭团

饭团人气榜-返回
    非播放页-返回

饭团人气榜-分享
    公共－点击页面文本    web more

明星来了-点头像
    公共－点击页面文本    李权哲

明星来了-查看详情
    公共－xpath    (//XCUIElementTypeButton[@name="查看详情"])[1]

活动中心-点活动
    公共－点击页面文本    5月明星个站人气榜

热门话题-明星饭团
    公共－xpath    //XCUIElementTypeStaticText[@name="相关饭团"]/following-sibling::XCUIElementTypeCollectionView[1]/XCUIElementTypeCell[2]

热门话题-节目饭团
    公共－xpath    //XCUIElementTypeStaticText[@name="相关饭团"]/following-sibling::XCUIElementTypeCollectionView[1]/XCUIElementTypeCell[1]

热门话题-明星来了
    公共－点击页面文本    明星来了

热门话题-热门互动
    公共－点击页面文本    热门互动

热门互动-动态分享
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]

热门互动-动态评论
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/following-sibling::XCUIElementTypeButton[1]

热门互动-动态点赞
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/following-sibling::XCUIElementTypeButton[2]

热门互动-动态举报
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]

热门互动-动态的饭团
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/preceding-sibling::XCUIElementTypeButton[1]

热门互动-动态头像
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/preceding-sibling::XCUIElementTypeImage[1]

热门互动-动态内容
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/preceding-sibling::XCUIElementTypeOther[1]

获取屏幕中心点
    获取屏幕大小
    ${x1} =    evaluate    ${屏幕宽度}*0.5
    ${y1} =    evaluate    ${屏幕高度}*0.5
    set global variable    ${mid_x}    ${x1}
    set global variable    ${mid_y}    ${y1}

点击屏幕中心点
    click a point    ${mid_x}    ${mid_y}
    sleep    1

饭团-详情页-饭团主页
    点击不可见文本    fantuan_livesub_background

饭团-详情页-发布者头像
    公共－点击页面文本    甜言幂语

饭团-详情页-评论输入框
    公共－点击页面文本    添加评论...
    饭团-动态-关闭评论框

饭团-详情页-点视频
    tap    Discuss Share iCON    0    -100
    comment    公共－xpath    //XCUIElementTypeStaticText[@name="00:32"]

饭团-视频详情页-点关注
    公共－点击页面文本    shortEntranceUnFollow

饭团-视频详情页-点分享
    公共－点击页面文本    shortEntranceShare

饭团-视频详情页-点发布人
    公共－点击页面文本    //XCUIElementTypeButton[@name="shortEntranceShare"]/following-sibling::XCUIElementTypeButton[1]

饭团-视频详情页-点赞
    公共－xpath    //XCUIElementTypeButton[@name="shortEntranceShare"]/preceding-sibling::XCUIElementTypeButton[2]

饭团-视频详情页-点评论
    公共－xpath    //XCUIElementTypeButton[@name="shortEntranceShare"]/preceding-sibling::XCUIElementTypeButton[1]

饭团-视频详情页-暂停视频
    点击屏幕中心点
    sleep    1
    点击屏幕中心点

饭团-点图片
    tap    xpath=(//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]    0    300

饭团-图片浏览-展开
    公共－点击页面文本    展开

饭团-图片浏览-收起
    公共－点击页面文本    收起

饭团-图片浏览-点赞
    公共－xpath    //XCUIElementTypeButton[@name="imgBrowserShare"]/following-sibling::XCUIElementTypeButton[2]

饭团-图片浏览-点评论
    公共－xpath    //XCUIElementTypeButton[@name="imgBrowserShare"]/following-sibling::XCUIElementTypeButton[1]

饭团-图片浏览-点分享
    公共－点击页面文本    imgBrowserShare

饭团-图片浏览-点下载
    公共－点击页面文本    imgBrowserDownload

饭团-图片浏览-点内容
    公共－xpath    //XCUIElementTypeButton[@name="imgBrowserShare"]/preceding-sibling::XCUIElementTypeOther[1]

饭团-图片浏览-点内容中的话题
    tap    xpath=//XCUIElementTypeButton[@name="imgBrowserShare"]/preceding-sibling::XCUIElementTypeOther[1]    50    10

饭团-图片浏览-点图片
    tap    //XCUIElementTypeButton[@name="imgBrowserShare"]    0    -100
