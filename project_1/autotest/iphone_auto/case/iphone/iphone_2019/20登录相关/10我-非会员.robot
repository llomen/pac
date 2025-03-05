*** Settings ***
Documentation     页面跳转（首页-片库页-播放页）
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${my}             {'act':'my'}
${msgc}           {'act':'msgc'}
${account}        yh1@mgtv.com
${password}       111111
${account_name}    yh139gcW
${account_vip}    yh2@mgtv.com
${password_vip}    111111
${fantuan}        {'act':'fantuan'}

*** Test Cases ***
个人动态pvs
    公共－用户登录    ${mail_account}    ${mail_pwd}
    首页-我
    sleep    3
    公共-删除数据
    comment    进入个人头像
    公共－点击页面文本    ${mail_name}
    公共-校验数据    ${pvs}    shezhi_009    ${table_pvs}    1

个人动态pvs1
    公共-校验数据    ${pvs1}    shezhi_009    ${table_pvs1}    1

点击头像my
    公共-校验数据    ${my}    my_touxiang    ${table_click}    1

个人动态返回pvs
    公共-删除数据
    非播放页-返回
    comment    公共－点击页面文本    backbg icon
    公共-校验数据    ${pvs}    shezhi_010    ${table_pvs}    1

个人动态返回pvs1
    公共-校验数据    ${pvs1}    shezhi_010    ${table_pvs1}    1

我的消息pvs
    公共-删除数据
    我的-消息中心
    公共-校验数据    ${pvs}    xiaoxizhongxin_list    ${table_pvs}    1

我的消息pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_list    ${table_pvs1}    1

我的消息my
    公共-校验数据    ${my}    my_xiaoxi    ${table_click}    1

我的消息msgc
    公共-校验数据    ${msgc}    msgc_xiaoxi_login    ${table_click}    1

评论回复pvs
    公共-删除数据
    公共－点击页面文本    评论/回复
    sleep    2
    公共-校验数据    ${pvs}    xiaoxizhongxin_010    ${table_pvs}    1

评论回复pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_010    ${table_pvs1}    1

评论回复msgc
    公共-校验数据    ${msgc}    msgc_pinglun    ${table_click}    1

评论设置msgc
    公共-删除数据
    公共－点击页面文本    设置
    公共-校验数据    ${msgc}    msgc_pinglun_set    ${table_click}    1

评论设置取消msgc
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${msgc}    msgc_pinglun_setcancel    ${table_click}    1

评论回复返回pvs
    公共-删除数据
    公共－点击页面文本    back icon
    公共-校验数据    ${pvs}    xiaoxizhongxin_back_pinglun    ${table_pvs}    1

评论回复返回pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_back_pinglun    ${table_pvs1}    1

点赞pvs
    公共-删除数据
    公共－点击页面文本    点赞
    sleep    2
    公共-校验数据    ${pvs}    xiaoxizhongxin_002    ${table_pvs}    1

点赞pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_002    ${table_pvs1}    1

点赞msgc
    公共-校验数据    ${msgc}    msgc_zan    ${table_click}    1

点赞设置置顶msgc
    公共－点击页面文本    设置
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    取消置顶
    run keyword if    ${aa}    置顶状态还原
    公共-删除数据
    公共－点击页面文本    消息置顶
    公共-校验数据    ${msgc}    msgc_dianzan_up    ${table_click}    1

点赞取消置顶msgc
    公共－点击页面文本    设置
    公共-删除数据
    公共－点击页面文本    取消置顶
    公共-校验数据    ${msgc}    msgc_dianzan_upcancel    ${table_click}    1

点赞返回pvs
    公共-删除数据
    公共－点击页面文本    back icon
    公共-校验数据    ${pvs}    xiaoxizhongxin_back_dianzan    ${table_pvs}    1

点赞返回pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_back_dianzan    ${table_pvs1}    1

系统消息pvs
    公共-删除数据
    公共－点击页面文本    系统消息
    sleep    2
    公共-校验数据    ${pvs}    xiaoxizhongxin_003    ${table_pvs}    1

系统消息pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_003    ${table_pvs1}    1

系统消息msgc
    公共-校验数据    ${msgc}    msgc_xitongxiaoxi    ${table_click}    1

消息免打扰msgc
    公共－点击页面文本    设置
    公共-删除数据
    公共－点击页面文本    消息免打扰
    sleep    2
    公共-校验数据    ${msgc}    msgc_xitongxiaoxi_01    ${table_click}    1

取消消息免打扰msgc
    公共－点击页面文本    设置
    公共-删除数据
    公共－点击页面文本    恢复消息提醒
    公共-校验数据    ${msgc}    msgc_xitongxiaoxi_02    ${table_click}    1

系统消息返回pvs
    公共-删除数据
    公共－点击页面文本    back icon
    公共-校验数据    ${pvs}    xiaoxizhongxin_back_xitong    ${table_pvs}    1

系统消息返回pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_back_xitong    ${table_pvs1}    1

消息中心返回pvs
    公共-删除数据
    公共－点击页面文本    back icon
    公共-校验数据    ${pvs}    xiaoxizhongxin_back    ${table_pvs}    1

消息中心返回pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_back    ${table_pvs1}    1

播放记录列表播放pvs
    公共-删除数据
    公共－点击页面文本    《我的特工爷爷》MV—爷爷的情书
    comment    公共－xpath    //XCUIElementTypeStaticText[@name="播放记录"]/following-sibling::XCUIElementTypeStaticText[last()]
    sleep    3
    公共-校验数据    ${pvs}    bofangjilu_bofang_02    ${table_pvs_dianbo}    1

播放记录列表播放pvs1
    公共-校验数据    ${pvs1}    bofangjilu_bofang_02    ${table_pvs1}    1

播放记录列表播放my
    公共-校验数据    ${my}    my_bofang_play_list    ${table_click}    1

点播页返回个人中心pvs
    公共-删除数据
    点播播放页-返回
    sleep    3
    公共-校验数据    ${pvs}    bofangjilu_back_list    ${table_pvs}    1

点播页返回个人中心pvs1
    公共-校验数据    ${pvs1}    bofangjilu_back_list    ${table_pvs1}    1

播放记录pvs
    Comment    点播播放页-返回
    公共-删除数据
    公共－点击页面文本    播放记录
    公共-校验数据    ${pvs}    bofangjilu_001    ${table_pvs}    1

播放记录pvs1
    公共-校验数据    ${pvs1}    bofangjilu_001    ${table_pvs1}    1

播放记录my
    公共-校验数据    ${my}    my_bofang_enter    ${table_click}    1

播放记录页播放pvs
    公共-删除数据
    公共－xpath    //XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[1]
    sleep    3
    公共-校验数据    ${pvs}    bofangjilu_bofang    ${table_pvs_dianbo}    1

播放记录页播放pvs1
    公共-校验数据    ${pvs1}    bofangjilu_bofang    ${table_pvs1}    1

播放记录页播放my
    公共-校验数据    ${my}    my_bofang_play_page    ${table_click}    1

播放记录播放返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    bofangjilu_back_page    ${table_pvs}    1

播放记录播放返回pvs1
    公共-校验数据    ${pvs1}    bofangjilu_back_page    ${table_pvs1}    1

播放记录返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    bofangjilu_002    ${table_pvs}    1

播放记录返回pvs1
    公共-校验数据    ${pvs1}    bofangjilu_002    ${table_pvs1}    1

会员中心pvs
    公共-删除数据
    我－会员中心
    sleep    2
    公共-校验数据    ${pvs}    huiyuanzhongxin_001    ${table_pvs}    1

会员中心pvs1
    公共-校验数据    ${pvs1}    huiyuanzhongxin_001    ${table_pvs1}    1

VIP会员my
    公共-校验数据    ${my}    my_huiyuan    ${table_click}    1

VIP会员返回pvs
    公共-删除数据
    会员中心-VIP返回
    公共-校验数据    ${pvs}    huiyuanzhongxin_002    ${table_pvs}    1

VIP会员返回pvs1
    公共-校验数据    ${pvs1}    huiyuanzhongxin_002    ${table_pvs1}    1

点我的饭团my
    公共-删除数据
    公共－点击页面文本    我的饭团
    公共-校验数据    ${my}    my_ft_01    ${table_click}    1

进入我的饭团pvs
    公共-校验数据    ${pvs}    wo_004    ${table_pvs}    1

进入我的饭团pvs1
    公共-校验数据    ${pvs1}    wo_004    ${table_pvs1}    1

我的饭团点明星饭团fantuan
    公共-删除数据
    ${aa}    run keyword and return status    Element Should Be Visible    刘涛
    run keyword if    ${aa}==False    上滑
    公共－点击页面文本    刘涛
    公共-校验数据    ${fantuan}    my_ft_03    ${table_click}    1

我的饭团进入明星饭团pvs
    公共-校验数据    ${pvs}    wo_005    ${table_pvs}    1

我的饭团进入明星饭团pvs1
    公共-校验数据    ${pvs1}    wo_005    ${table_pvs1}    1

明星饭团返回我的饭团pvs
    公共-删除数据
    Page Should Contain Text    全部动态
    非播放页-返回
    公共-校验数据    ${pvs}    wo_006    ${table_pvs}    1

明星饭团返回我的饭团pvs1
    公共-校验数据    ${pvs1}    wo_006    ${table_pvs1}    1

我的饭团点节目饭团fantuan
    公共-删除数据
    公共－点击页面文本    快乐大本营
    公共-校验数据    ${fantuan}    my_ft_03    ${table_click}    1

我的饭团进入节目饭团pvs
    公共-校验数据    ${pvs}    wo_007    ${table_pvs}    1

我的饭团进入节目饭团pvs1
    公共-校验数据    ${pvs1}    wo_007    ${table_pvs1}    1

节目饭团返回我的饭团pvs
    公共-删除数据
    Page Should Contain Text    全部动态
    非播放页-返回
    公共-校验数据    ${pvs}    wo_008    ${table_pvs}    1

节目饭团返回我的饭团pvs1
    公共-校验数据    ${pvs1}    wo_008    ${table_pvs1}    1

我的饭团返回我的pvs
    公共-删除数据
    Page Should Contain Text    我的饭团
    非播放页-返回
    公共-校验数据    ${pvs}    wo_009    ${table_pvs}    1

我的饭团返回我的pvs1
    公共-校验数据    ${pvs1}    wo_009    ${table_pvs1}    1

我的点明星饭团my
    公共-删除数据
    ${aa}    run keyword and return status    Element Should Be Visible    刘涛
    run keyword if    ${aa}==False    上滑
    公共－点击页面文本    刘涛
    公共-校验数据    ${my}    my_ft_03    ${table_click}    1

我的进入明星饭团pvs
    公共-校验数据    ${pvs}    wo_005    ${table_pvs}    1

我的进入明星饭团pvs1
    公共-校验数据    ${pvs1}    wo_005    ${table_pvs1}    1

明星饭团返回我的pvs
    公共-删除数据
    Page Should Contain Text    全部动态
    非播放页-返回
    公共-校验数据    ${pvs}    wo_006    ${table_pvs}    1

明星饭团返回我的pvs1
    公共-校验数据    ${pvs1}    wo_006    ${table_pvs1}    1

我的点节目饭团my
    公共-删除数据
    公共－点击页面文本    快乐大本营
    公共-校验数据    ${my}    my_ft_03    ${table_click}    1

我的进入节目饭团pvs
    公共-校验数据    ${pvs}    wo_007    ${table_pvs}    1

我的进入节目饭团pvs1
    公共-校验数据    ${pvs1}    wo_007    ${table_pvs1}    1

节目饭团返回我的pvs
    公共-删除数据
    Page Should Contain Text    全部动态
    非播放页-返回
    公共-校验数据    ${pvs}    wo_008    ${table_pvs}    1

节目饭团返回我的pvs1
    公共-校验数据    ${pvs1}    wo_008    ${table_pvs1}    1

账号与安全pvs
    滚动到设置
    公共－点击页面文本    设置
    公共-删除数据
    设置-账号与安全
    公共-校验数据    ${pvs}    shezhi_007    ${table_pvs}    1

账号与安全pvs1
    公共-校验数据    ${pvs1}    shezhi_007    ${table_pvs1}    1

绑定手机pvs
    公共-删除数据
    comment    公共－点击页面文本    绑定手机
    设置-绑定手机
    公共-校验数据    ${pvs}    shezhi_005    ${table_pvs}    1

绑定手机pvs1
    公共-校验数据    ${pvs1}    shezhi_005    ${table_pvs1}    1

绑定手机返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_006    ${table_pvs}    1

绑定手机返回pvs1
    公共-校验数据    ${pvs1}    shezhi_006    ${table_pvs1}    1

账号与安全返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_008    ${table_pvs}    1

账号与安全返回pvs1
    公共-校验数据    ${pvs1}    shezhi_008    ${table_pvs1}    1

*** Keywords ***
进入个人头像
    公共－xpath    //XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeButton[1]
    ${aa}    Run Keyword And Return Status    page should contain text    加入的饭团
    run keyword if    ${aa} ==False    公共－xpath    //XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeButton[1]

滑动到离线缓存
    ${aa}    Run Keyword And Return Status    Element Should Be Visible    name=离线中心
    run keyword if    ${aa} ==False    滚动到设置

置顶状态还原
    公共－点击页面文本    取消置顶
    公共－点击页面文本    设置
