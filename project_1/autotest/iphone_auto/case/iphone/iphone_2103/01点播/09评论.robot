*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1
Resource          ../5.3对象库.robot

*** Variables ***

*** Test Cases ***
点击评论pfc
    首页-搜索
    搜索首页－输入搜索词    楚乔传
    搜索－点击搜索
    sleep    5
    搜索-点击剧集的集数
    sleep    8
    公共-删除数据
    点播播放页-评论
    #公共-校验结果    ${pfc}    pfc_pinglun_new    ${table_click}    1

点评论pvs
    #已用浮层上报代替
    公共-校验无结果    ${pvs}    pinglun_001    ${table_pvs}

点评论pvs1
    ${result}    公共-校验无结果    ${pvs1}    pinglun_001    ${table_pvs1}

评论浮层曝光cv
    ${result}    公共-校验结果    ${cv}    comment_2    ${table_cv}    1

普通评论show
    公共-校验数据    {'logtype':'show','lob':'smod=119'}    show_pinglun    ${table_show}    1

热门评论show
    公共-校验数据    {'logtype':'show','lob':'smod=131'}    show_pinglun_remen    ${table_show}    1

评论话题show
    公共-校验数据    {'logtype':'show','lob':'smod=130'}    show_pinglun_huati    ${table_show}    1

点话题更多comment
    公共-删除数据
    新版评论-点更多话题
    公共-校验数据    ${comment}    comment_007    ${table_click}    1

跳转话题列表pvs
    公共-校验数据    ${pvs}    pinglun_011    ${table_pvs}    1

跳转话题列表pvs1
    公共-校验数据    ${pvs1}    pinglun_011    ${table_pvs1}    1

话题列表返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    pinglun_012    ${table_pvs}    1

话题列表返回pvs1
    公共-校验数据    ${pvs1}    pinglun_012    ${table_pvs1}    1

点单个话题comment
    公共-删除数据
    新版评论-点单个话题
    sleep    2
    公共-校验数据    ${comment}    comment_008    ${table_click}    1

跳转话题详情pvs
    公共-校验数据    ${pvs}    pinglun_013    ${table_pvs}    1

跳转话题详情pvs1
    公共-校验数据    ${pvs1}    pinglun_013    ${table_pvs1}    1

话题详情返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    pinglun_014    ${table_pvs}    1

话题详情返回pvs1
    公共-校验数据    ${pvs1}    pinglun_014    ${table_pvs1}    1

评论页点赞comment
    sleep    1
    公共-删除数据
    新版评论-点赞
    公共-校验数据    {'act':'comment','pos':'1'}    comment_002    ${table_click}    1

点赞跳转登录页pvs
    公共-校验数据    ${pvs}    pinglun_001    ${table_pvs}    1

点赞跳转登录页pvs1
    公共-校验数据    ${pvs1}    pinglun_001    ${table_pvs1}    0

登录浮层cv
    公共-校验数据    ${cv}    login_02    ${table_cv}    1

登录页返回评论pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

登录页返回评论pvs1
    公共-校验数据    ${pvs1}    pinglun_002    ${table_pvs1}    0

评论页点评论comment
    公共-删除数据
    新版评论-点回复
    公共-校验数据    {'act':'comment','pos':'1'}    comment_001    ${table_click}    1

点评论跳转登录页pvs
    公共-校验数据    ${pvs}    pinglun_001    ${table_pvs}    1

点评论跳转登录页pvs1
    公共-校验数据    ${pvs1}    pinglun_001    ${table_pvs1}    0

登录页返回评论2pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

登录页返回评论2pvs1
    公共-校验数据    ${pvs1}    pinglun_002    ${table_pvs1}    0

点评论头像comment
    公共-删除数据
    新版评论-点评论者头像
    公共-校验数据    ${comment}    comment_004    ${table_click}    1

跳转个人主页pvs
    公共-校验数据    ${pvs}    pinglun_003    ${table_pvs}    1

跳转个人主页pvs1
    公共-校验数据    ${pvs1}    pinglun_003    ${table_pvs1}    1

个人主页返回pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    pinglun_004    ${table_pvs}    1

个人主页返回pvs1
    公共-校验数据    ${pvs1}    pinglun_004    ${table_pvs1}    1

点分享comment
    公共-删除数据
    新版评论-点更多
    公共-校验数据    ${comment}    comment_006    ${table_click}    1

分享框弹出share
    公共-校验数据    ${share}    comment_share_005    ${table_click}    1

分享到微信share
    公共-删除数据
    公共－点击页面文本    微信
    点击确认按钮
    公共-校验数据    ${share}    comment_share_006    ${table_click}    1

点举报comment
    新版评论-点更多
    公共-删除数据
    公共－点击页面文本    举报
    公共－点击页面文本    取消
    公共-校验数据    ${comment}    comment_014    ${table_click}    1

点评论中话题comment
    公共-删除数据
    新版评论-点评论中话题
    公共-校验数据    ${comment}    comment_021    ${table_click}    1

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
    #未登录点添加评论未上报
    #公共-校验数据    {'act':'comment','pos':'1'}    comment_005    ${table_click}    1

离开评论页stay
    登录页-关闭
    公共-删除数据
    公共－点击页面文本    视频
    公共-校验数据    ${stay}    stay_24    ${table_stay}    1

点评论tab切换cv
    公共-删除数据
    公共－点击页面文本    评论
    公共-校验数据    ${cv}    comment_2    ${table_cv}    1
