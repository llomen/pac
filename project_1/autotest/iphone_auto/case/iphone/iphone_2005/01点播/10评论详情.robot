*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1
Resource          ../5.3对象库.robot


*** Variables ***
${show}           {'logtype':'show'}
${comment}        {'act':'comment'}
${table_show}     mpp_show_5_iphone_sdk
${table_cjplayshow}    mpp_ip_chzlshow
${table_cjlayclick}    mpp_ip_chzlclick_2
${cjplayshow}     {'act':'cjplayshow'}
${cjplayclick}    {'act':'cjplayclick'}
${table_sp}       mpp_sp_iphone
${share}          {'act':'share'}
${cp10}           {'act':'cp1'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {'r’:'1'}
${hb3}            {'ht':'0','act':'hb'}
${hb5}            {'ht':'1','act':'hb'}
${hb_end}         {'ht':'2','act':'hb'}
${hb3_cj}         {'ht':'0','act':'hb'}
${hb5_cj}         {'ht':'1','act':'hb'}
${hb_end_cj}      {'ht':'2','act':'hb'}

*** Test Cases ***
进入评论
    首页-搜索
    搜索首页－输入搜索词    楚乔传
    搜索－点击搜索
    sleep    5
    搜索-点击剧集的集数
    sleep    5
    点播播放页-评论
    sleep    3

点评论内容comment
    公共-删除数据
    sleep    3
    comment    新版评论-点评论内容
    comment    公共－点击页面文本    查看全部115条回复
    公共－点击页面文本    2017年06月06日
    公共-校验数据    {'act':'comment','pos':'1'}    comment_003    ${table_click}    1

跳转详情页pvs
    #使用浮层替代
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    0

跳转详情页pvs1
    #使用浮层替代
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    0

评论详情页浮层曝光cv
    公共-校验数据    ${cv}    play_02    ${table_cv}    1

评论详情页点赞comment
    sleep    1
    公共-删除数据
    评论详情页-点赞
    公共-校验数据    {'act':'comment','pos':'2'}    comment_012    ${table_click}    1

点赞跳转登录页pvs
    公共-校验数据    ${pvs}    pinglun_001    ${table_pvs}    1

点赞跳转登录页pvs1
    公共-校验数据    ${pvs1}    pinglun_007    ${table_pvs1}    0

登录浮层cv
    公共-校验数据    ${cv}    login_02    ${table_cv}    1

登录页返回评论pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

登录页返回评论pvs1
    公共-校验数据    ${pvs1}    pinglun_002    ${table_pvs1}    0

评论详情页点评论comment
    公共-删除数据
    评论详情页-点评论
    公共-校验数据    {'act':'comment','pos':'2'}    comment_013    ${table_click}    1

关闭登录浮层
    登录页-关闭

详情页点评论头像comment
    公共-删除数据
    评论详情页-点头像
    公共-校验数据    ${comment}    comment_018    ${table_click}    1

跳转个人主页pvs
    公共-校验数据    ${pvs}    pinglun_003    ${table_pvs}    1

跳转个人主页pvs1
    公共-校验数据    ${pvs1}    pinglun_008    ${table_pvs1}    1

个人主页返回pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    pinglun_004    ${table_pvs}    1

个人主页返回pvs1
    公共-校验数据    ${pvs1}    pinglun_004    ${table_pvs1}    1

点分享comment
    公共-删除数据
    评论详情页-点更多
    公共-校验数据    ${comment}    comment_015    ${table_click}    1

分享框弹出share
    公共-校验数据    ${share}    comment_share_005    ${table_click}    1

分享到微信share
    公共-删除数据
    公共－点击页面文本    微信
    公共－点击页面文本    确认
    公共-校验数据    ${share}    comment_share_006    ${table_click}    1

点举报comment
    评论详情页-点更多
    公共-删除数据
    公共－点击页面文本    举报
    公共－点击页面文本    取消
    公共-校验数据    ${comment}    comment_016    ${table_click}    1

点评论中话题comment
    公共-删除数据
    评论详情页-点评论中的话题
    公共-校验数据    ${comment}    comment_017    ${table_click}    1

跳转话题详情2pvs
    公共-校验数据    ${pvs}    pinglun_013    ${table_pvs}    1

跳转话题详情2pvs1
    公共-校验数据    ${pvs1}    pinglun_013    ${table_pvs1}    1

话题详情返回2pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    pinglun_014    ${table_pvs}    1

话题详情返回2pvs1
    公共-校验数据    ${pvs}    pinglun_014    ${table_pvs}    1

点添加评论comment
    公共-删除数据
    新版评论-点添加评论
    公共-校验数据    {'act':'comment','pos':'2'}    comment_019    ${table_click}    1

关闭评论详情页comment
    登录页-关闭
    公共-删除数据
    点播播放页-评论详情返回
    公共-校验数据    ${comment}    comment_020    ${table_click}    1

评论详情页返回pvs
    公共-校验数据    ${pvs}    pinglun_003    ${table_pvs}    0

详情页返回pvs1
    公共-校验数据    ${pvs1}    pinglun_003    ${table_pvs1}    0

离开评论详情页stay
    公共-校验数据    ${stay}    stay_25    ${table_stay}    1

*** Keywords ***
评论详情页-点头像
    公共－xpath    //XCUIElementTypeStaticText[@name="评论详情"]/../following-sibling::XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeImage

评论详情页-点评论
    公共－xpath    //XCUIElementTypeStaticText[@name="评论详情"]/../following-sibling::XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[last()-2]

评论详情页-点赞
    公共－xpath    //XCUIElementTypeStaticText[@name="评论详情"]/../following-sibling::XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[last()-1]

评论详情页-点更多
    公共－xpath    //XCUIElementTypeStaticText[@name="评论详情"]/../following-sibling::XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[last()]

评论详情页-点评论中的话题
    tap    xpath=//XCUIElementTypeStaticText[@name="评论详情"]/../following-sibling::XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeOther[2]    270    10
