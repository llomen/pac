*** Settings ***
Documentation     饭团人气榜、热门话题详情页
Suite Setup       启动应用
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
热门话题顶部分享弹出share
    首页-饭团
    饭团广场-热门话题第一个
    公共-删除数据
    饭团-顶部分享
    公共-校验数据    ${share}    ft_share_12    ${table_click}    1

热门话题顶部分享到朋友圈share
    公共-删除数据
    公共－点击页面文本    朋友圈
    Run Keyword And Ignore Error    公共－点击页面文本    确认
    公共-校验数据    ${share}    ft_share_13    ${table_click}    1

热门话题顶部分享到微信share
    饭团-顶部分享
    公共-删除数据
    公共－点击页面文本    微信
    Run Keyword And Ignore Error    公共－点击页面文本    确认
    公共-校验数据    ${share}    ft_share_14    ${table_click}    1

热门话题顶部分享到微博share
    饭团-顶部分享
    公共-删除数据
    公共－点击页面文本    微博
    Run Keyword And Ignore Error    公共－点击页面文本    确认
    公共-校验数据    ${share}    ft_share_15    ${table_click}    1

热门话题顶部分享到QQ空间share
    饭团-顶部分享
    公共-删除数据
    公共－点击页面文本    QQ空间
    公共-校验数据    ${share}    ft_share_16    ${table_click}    1

热门话题顶部分享到QQ空间shareresult
    公共-删除数据
    分享到QQ空间
    sleep    3
    公共-校验数据    ${shareresult}    ft_share_17    ${table_click}    1

热门话题顶部分享到QQ空间取消shareresult
    饭团-顶部分享
    公共－点击页面文本    QQ空间
    公共-删除数据
    分享到QQ取消
    sleep    3
    公共-校验数据    ${shareresult}    ft_share_18    ${table_click}    1

热门话题取消分享后台切前台pvs
    公共-校验数据    ${pvs}    ft_guangchang_40    ${table_pvs}    1

热门话题取消分享后台切前台pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_40    ${table_pvs1}    1

热门话题取消分享app启动st
    公共-校验数据    ${st}    iphone_qidong    ${table_st}    1

热门话题动态分享弹出share
    公共-删除数据
    热门互动-动态分享
    公共-校验数据    ${share}    ft_share_12    ${table_click}    1

热门话题动态分享到朋友圈share
    公共-删除数据
    公共－点击页面文本    朋友圈
    Run Keyword And Ignore Error    公共－点击页面文本    确认
    公共-校验数据    ${share}    ft_share_13    ${table_click}    1
