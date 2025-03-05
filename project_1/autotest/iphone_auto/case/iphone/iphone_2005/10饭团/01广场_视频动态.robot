*** Settings ***
Documentation     实时播报、发布
Suite Setup       启动应用2
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${my}             {'act':'my'}
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${pvs1_H5}        {'logtype':'pv','cntp':'qt_webview'}

*** Test Cases ***
广场动态曝光show
    公共-删除数据
    首页-饭团
    sleep    3
    公共-校验数据    {'logtype':'show','smod':'1'}    square_06    ${table_show_ft}    1

视频动态自动播放vv
    公共-删除数据
    上滑
    sleep    3
    公共-校验数据    ${aplay}    fantuan_feed_02    ${table_vv}    1

视频动态播放buff
    公共-校验数据    ${buffer}    fantuan_feed_02    ${table_buffer}    1

cdn1
    公共-校验数据    ${cdn1}    cdn_feed_01    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    cdn_feed_02    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    cdn_feed_03    mpp_cdn_5_iphone    1

点播播放定时上报cdn-r1
    公共-校验数据    ${r1}    ft_feed_1    mpp_cdnq_5_iphone    1

点播3hb
    sleep    35
    公共-校验数据    ${hb3}    fantuan_feed_03    mpp_hb_5_iphone    1

点播5hb
    公共-校验数据    ${hb5}    fantuan_feed_05    mpp_hb_5_iphone    1

点播15hb
    公共-校验数据    ${hb15}    fantuan_feed_15    mpp_hb_5_iphone    1

完成卡顿
    sleep    2
    公共-校验数据    ${r3}    ft_feed_3    mpp_cdnq_5_iphone    1

播放停止hb
    公共-校验数据    ${hb_end}    fantuan_feed_end    mpp_hb_5_iphone    1

点视频fantuan
    公共-删除数据
    饭团-详情页-点视频
    公共-校验数据    ${fantuan}    fantuan_guangchang_29    ${table_click}    1

视频动态详情页pvs
    公共-校验数据    ${pvs}    ft_guangchang_46    ${table_pvs}    1

视频动态详情页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_46    ${table_pvs1}    1

视频动态详情页返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_47    ${table_pvs}    1

视频动态详情页返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_47    ${table_pvs1}    1

点击发布者头像fantuan
    公共-删除数据
    饭团-动态-发布者
    sleep    2
    公共-校验数据    ${fantuan}    fantuan_tuijian_08    ${table_click}    1

个人主页pvs
    公共-校验数据    ${pvs}    ft_tuijian_010    ${table_pvs}    1

个人主页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_010    ${table_pvs1}    1

个人主页返回pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    ft_tuijian_011    ${table_pvs}    1

点内容fantuan
    公共-删除数据
    饭团-动态-内容
    公共-校验数据    ${fantuan}    fantuan_tuijian_05    ${table_click}    1

动态详情页pvs
    公共-校验数据    ${pvs}    ft_tuijian_012    ${table_pvs}    1

动态详情页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_012    ${table_pvs1}    1

动态详情返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_tuijian_013    ${table_pvs}    1

动态详情返回pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_013    ${table_pvs1}    1

动态详情页stay
    公共-校验数据    ${stay}    stay_05    ${table_stay}    1

点击更多fantuan
    公共-删除数据
    饭团-动态-更多
    公共-校验数据    ${fantuan}    fantuan_tuijian_13    ${table_click}    1

举报fantuan2
    公共-删除数据
    公共－点击页面文本    举报
    公共－点击页面文本    政治敏感
    公共-校验数据    ${fantuan}    fantuan_tuijian_14_2    ${table_click}    1

举报fantuan3
    饭团-动态-更多
    公共-删除数据
    公共－点击页面文本    举报
    公共－点击页面文本    商业敏感
    公共-校验数据    ${fantuan}    fantuan_tuijian_14_3    ${table_click}    1

举报fantuan5
    饭团-动态-更多
    公共-删除数据
    公共－点击页面文本    举报
    公共－点击页面文本    其他
    公共-校验数据    ${fantuan}    fantuan_tuijian_14_5    ${table_click}    1

更多取消fantuan
    饭团-动态-更多
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_tuijian_16    ${table_click}    1

点赞fantuan
    公共-删除数据
    饭团-动态-点赞
    公共-校验数据    ${fantuan}    fantuan_tuijian_10    ${table_click}    1

点赞跳登录pvs
    公共-校验数据    ${pvs}    ft_guangchang_35    ${table_pvs}    1

点赞跳登录pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_35    ${table_pvs1}    1

登录返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_guangchang_36    ${table_pvs}    1

登录返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_36    ${table_pvs1}    1

评论fantuan
    公共-删除数据
    饭团-动态-评论
    非播放页-返回
    公共-校验数据    ${fantuan}    fantuan_tuijian_11    ${table_click}    1

进入饭团fantuan
    公共-删除数据
    饭团-动态-来自饭团
    公共-校验数据    ${fantuan}    fantuan_tuijian_09    ${table_click}    1

进入饭团主页pvs
    公共-校验数据    ${pvs}    ft_tuijian_031    ${table_pvs}    1

进入饭团主页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_031    ${table_pvs1}    1

饭团主页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_tuijian_032    ${table_pvs}    1

饭团主页返回pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_032    ${table_pvs1}    1

饭团主页stay
    公共-校验数据    ${stay}    stay_04    ${table_stay}    1

分享fantuan
    公共-删除数据
    swipe    200    500    200    200
    sleep    2
    饭团-动态-分享
    公共-校验数据    ${fantuan}    fantuan_tuijian_12    ${table_click}    1

分享到复制链接share
    公共-删除数据
    饭团-分享到    复制链接
    公共-校验数据    ${share}    fantuan_share_06    ${table_click}    1

分享到朋友圈share
    公共-删除数据
    饭团-分享到    朋友圈
    公共-校验数据    ${share}    fantuan_share_01    ${table_click}    1

分享到微信share
    公共-删除数据
    饭团-分享到    微信
    公共-校验数据    ${share}    fantuan_share_02    ${table_click}    1

分享到微博share
    公共-删除数据
    饭团-分享到    微博
    公共-校验数据    ${share}    fantuan_share_03    ${table_click}    1

分享到QQshare
    饭团-动态-分享
    公共-删除数据
    公共－点击页面文本    QQ
    分享到QQ
    公共-校验数据    ${share}    fantuan_share_04    ${table_click}    1

分享到QQ空间share
    饭团-动态-分享
    公共-删除数据
    公共－点击页面文本    QQ空间
    分享到QQ空间
    公共-校验数据    ${share}    fantuan_share_05    ${table_click}    1
