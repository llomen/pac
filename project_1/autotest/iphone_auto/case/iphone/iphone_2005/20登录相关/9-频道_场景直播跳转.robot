*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${cdn1}           {'s':'1'}
${cdn3}           {'s':'3'}
${switch}         {'act':'switch'}
${r3}             {'r':'3'}
${r1}             {'r':'1'}
${cdn2}           {'s':'2'}
${share}          {'act':'share'}

*** Test Cases ***
直播页pvs
    首页-精选
    comment    公共-滑动页面    头条要闻    赵丽颖
    上滑
    上滑
    上滑
    上滑
    公共-删除数据
    点击不可见文本    多机位VIP直播测试
    sleep    2
    公共-校验数据    ${pvs}    changjing_001    ${table_pvs}    1

aplay
    sleep    25
    Comment    公共－点击坐标点    25    28
    公共-校验数据    ${aplay}    aphone_changjing_001    ${table_vv_zhibo}    1

开始定时卡顿
    公共-校验数据    ${r1}    aphone_changjing_1    mpp_cdnq_5_iphone    1

heartbeat
    sleep    65
    公共-校验数据    ${heartbeat}    aphone_changjing_001    mpp_heartbeat_5_iphone    1

cdn1
    公共-校验数据    ${cdn1}    aphone_changjing_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_changjing_002    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    aphone_changjing_003    mpp_cdn_5_iphone    1

点击分享按钮share
    公共-删除数据
    公共－点击页面文本    share player
    公共-校验数据    ${share}    share_changjing_002    ${table_click}    0

分享到朋友圈share
    公共-删除数据
    公共－点击页面文本    朋友圈
    公共-校验数据    ${share}    share_changjing_002    ${table_click}    1

分享到微信share
    sleep    2
    公共－点击页面文本－忽略错误    确认
    公共－点击页面文本    share player
    公共-删除数据
    公共－点击页面文本    微信
    公共-校验数据    ${share}    share_changjing_003    ${table_click}    1

分享到微博share
    sleep    2
    公共－点击页面文本－忽略错误    确认
    公共－点击页面文本    share player
    公共-删除数据
    公共－点击页面文本    微博
    公共-校验数据    ${share}    share_changjing_004    ${table_click}    1

分享到QQshare
    sleep    2
    公共－点击页面文本－忽略错误    确认
    公共－点击页面文本    share player
    公共-删除数据
    公共－点击页面文本    QQ
    公共-校验数据    ${share}    share_changjing_005    ${table_click}    1

分享到QQ空间share
    sleep    2
    公共－点击页面文本－忽略错误    确认
    公共－点击页面文本    share player
    公共-删除数据
    公共－点击页面文本    QQ空间
    公共-校验数据    ${share}    share_changjing_006    ${table_click}    1

切换机位Vip播放aplay
    sleep    15
    公共－点击页面文本－忽略错误    确认
    公共－点击页面文本    live camera
    公共-删除数据
    公共－点击坐标点    240    320
    sleep    20
    公共-校验数据    ${aplay}    aphone_changjing_002    ${table_vv_zhibo}    1

切换机位Vip播放heartbeat
    sleep    63
    公共-校验数据    ${heartbeat}    aphone_changjing_002    mpp_heartbeat_5_iphone    1

退出直播pvs
    公共－点击坐标点    150    170
    公共-删除数据
    直播-退出
    sleep    3
    公共-校验数据    ${pvs}    changjing_002    ${table_pvs}    1

退出完成卡顿
    公共-校验数据    ${r3}    aphone_changjing_3    mpp_cdnq_5_iphone    1
