*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
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
点击新版评论pfc
    首页-搜索
    搜索首页－输入搜索词    楚乔传
    搜索－点击搜索
    sleep    5
    搜索-点击剧集的集数
    sleep    5
    公共-删除数据
    点播播放页-评论
    公共-校验数据    ${pfc}    pfc_pinglun    ${table_click}    1

点添加评论comment
    公共-删除数据
    sleep    5
    新版评论-点添加评论
    公共-校验数据    {'act':'comment','pos':'1'}    comment_005    ${table_click}    1

跳转登录页pvs
    公共-校验数据    ${pvs}    pinglun_005    ${table_pvs}    1

登录浮层cv
    公共-校验数据    ${cv}    login_02    ${table_cv}    1

登录页返回pvs
    公共-删除数据
    sleep    3
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}
    sleep    5
    公共-校验数据    ${pvs}    pinglun_006    ${table_pvs}    1

评论点赞comment
    公共-删除数据
    新版评论-点赞
    公共-校验数据    {'act':'comment','pos':'1'}    comment_002    ${table_click}    1

评论取消点赞comment
    公共-删除数据
    新版评论-点赞
    公共-校验数据    {'act':'comment','pos':'1'}    comment_003    ${table_click}    1

再次点添加评论comment
    公共-删除数据
    sleep    5
    新版评论-点添加评论
    公共-校验数据    {'act':'comment','pos':'1'}    comment_005    ${table_click}    1

添加评论点话题comment
    发表评论-点话题图标
    公共-删除数据
    sleep    5
    发表评论-点话题
    公共-校验数据    {'act':'comment','pos':'3'}    comment_005    ${table_click}    1

关闭发表评论
    发表评论-关闭

点回复comment
    公共-删除数据
    sleep    5
    新版评论-点回复
    公共-校验数据    {'act':'comment','pos':'1'}    comment_001    ${table_click}    1

关闭回复框
    发表评论-关闭

点分享comment
    公共-删除数据
    新版评论-点分享
    公共-校验数据    ${comment}    comment_003    ${table_click}    1

分享框弹出share
    公共-校验数据    ${share}    comment_share_001    ${table_click}    1

分享到微信share
    公共-删除数据
    公共－点击页面文本    微信
    公共－点击页面文本    确认
    公共-校验数据    ${share}    comment_share_002    ${table_click}    1

点评论内容comment
    公共-删除数据
    新版评论-点评论内容
    公共-校验数据    {'act':'comment','pos':'1'}    comment_003    ${table_click}    1

详情页评论点赞comment
    公共-删除数据
    新版评论详情页-点赞
    公共-校验数据    {'act':'comment','pos':'2'}    comment_004    ${table_click}    1

评论详情页取消评论点赞comment
    公共-删除数据
    新版评论详情页-点赞
    公共-校验数据    {'act':'comment','pos':'2'}    comment_004    ${table_click}    1

详情页点分享comment
    公共-删除数据
    新版评论详情页-点分享
    公共-校验数据    ${comment}    comment_004    ${table_click}    1

详情页分享弹出share
    公共-校验数据    ${share}    comment_share_003    ${table_click}    1

分享到QQshare
    公共-删除数据
    公共－点击页面文本    QQ
    公共-校验数据    ${share}    comment_share_004    ${table_click}    1

分享到QQshareresult
    公共-删除数据
    分享到QQ
    公共-校验数据    ${shareresult}    comment_share_004    ${table_click}    1

分享后调起pvs
    sleep    3
    公共-校验数据    ${pvs}    dianboye_share    ${table_pvs_dianbo}    1

分享后调起pvs1
    sleep    3
    公共-校验数据    ${pvs1}    dianboye_share    ${table_pvs1}    1

启动应用st
    公共-校验数据    ${st}    iphone_qidong2    mpp_st_iphone    1

启动应用st1
    公共-校验数据    ${st1}    iphone_qidong2    mpp_st_iphone_v2    1

切后台show
    公共-校验数据    ${show}    show_pinglun    ${table_show}    1

切后台sp
    公共-校验数据    ${sp}    chenjin_001    ${table_sp}    1
