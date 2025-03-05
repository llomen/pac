*** Settings ***
Documentation     新闪图、猜你在追、当季热播
Suite Setup       启动应用-智能首页
Suite Teardown    关闭应用-智能首页
Resource          ../5.3对象库.robot
Resource          ../Resource/智能首页.robot

*** Variables ***
${page}           {'event':'page'}
${click}          {'event':'click'}
${table_channel_click}    mpp_ip_click
${table_channel_view}    mpp_ip_view
${table_channel_request}    mpp_ip_request
${table_channel_page}    mpp_ip_page

*** Test Cases ***
启动应用st
    公共-删除数据
    sleep    2
    快速启动应用
    sleep    5
    公共-校验数据    ${st}    iphone_qidong2    mpp_st_iphone    1

启动应用st1
    公共-校验数据    ${st1}    iphone_qidong2    mpp_st_iphone_v2    1

启动pvs
    公共-校验数据    ${pvs}    setup_pvs    ${table_pvs}    1

启动pvs1
    公共-校验数据    ${pvs1}    setup_pvs    ${table_pvs1}    1

启动page
    公共-校验数据    ${page}    page_01    mpp_ip_page    1

dsl-request
    公共-校验数据    {'event':'request','url':'dsl'}    request_02    mpp_ip_request    1

index-request
    公共-校验数据    {'event':'request','url':'https:\/\/dc.bz.mgtv.com\/dynamic\/v1\/channel\/index\'}    request_01    mpp_ip_request    1

闪图view
    公共-校验数据    {'event':'view','mdid':'87'}    view_01    mpp_ip_view    1

闪图下图标view
    公共-校验数据    {'event':'view','mdid':'89'}    view_02    mpp_ip_view    1

猜你在追view
    公共-校验数据    {'event':'view','mdid':'91'}    view_03    mpp_ip_view    1

点击小图click
    #公共-删除数据
    #闪图-点第一个
    #公共-校验数据    ${click}    click_01    ${table_channel_click}    1

闪图自动播aplay
    sleep    2
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

buffer
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    1

定时上报cdn-r1
    公共-校验数据    ${r1}    aphone_dianbo_1    mpp_cdnq_5_iphone    1

点播3hb
    公共-校验数据    ${hb3}    bodan_3    ${table_hb_sdk}    1

点播5hb
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

再次点小图click
    #公共-删除数据
    #闪图-点第一个
    #公共-校验数据    ${click}    click_01    ${table_channel_click}    1

点击小图进点播页pvs
    #sleep    3
    #公共-校验数据    ${pvs}    big_dianbo    ${table_pvs_dianbo}    1

点击小图进点播页pvs1
    #公共-校验数据    ${pvs1}    big_dianbo    ${table_pvs1}    1

闪图进点播页aplay
    #公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

闪图点大图click
    #点播播放页-返回
    公共-删除数据
    闪图-点大图
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点击大图进点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    big_dianbo    ${table_pvs_dianbo}    1

点击大图进点播页pvs1
    公共-校验数据    ${pvs1}    big_dianbo    ${table_pvs1}    1

点击大图进点播页aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

容器曝光view
    公共-校验数据    {'event':'view'}    view_01    mpp_ip_view    1

点闪图下的图标click
    点播播放页-返回
    公共-删除数据
    点闪图下图标
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1
    芒果文学返回

滑到当季热播
    上滑
    sleep    3

当季热播view
    公共-校验数据    {'event':'view','mdid':'107'}    view_01    mpp_ip_view    1

点猜你在追click
    公共-删除数据
    新猜你在追-点标题
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点猜你在追进点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    big_dianbo    ${table_pvs_dianbo}    1

点猜你在追进点播页pvs1
    公共-校验数据    ${pvs1}    big_dianbo    ${table_pvs1}    1

点猜你在追进点播页aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

点举报click
    点播播放页-返回
    公共-删除数据
    新猜你在追-点举报
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点举报选项click
    sleep    2
    公共-删除数据
    点举报选项
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点当季热播click
    公共-删除数据
    点当季热播
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点当季热播进点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    big_dianbo    ${table_pvs_dianbo}    1

点当季热播进点播页pvs1
    公共-校验数据    ${pvs1}    big_dianbo    ${table_pvs1}    1

点当季热播进点播页aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

返回频道
    点播播放页-返回

活动窗口模块曝光view
    公共-删除数据
    上滑
    公共-校验数据    {'event':'view','mdid':'90'}    view_01    mpp_ip_view    1

评论模块曝光view
    公共-校验数据    {'event':'view','mdid':'109'}    view_01    mpp_ip_view    1

活动窗口点击click
    公共-删除数据
    sleep    5
    点击活动窗口
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

进入活动窗口pvs
    sleep    3
    公共-校验数据    ${pvs}    wo_002    ${table_pvs}    1

进入活动窗口pvs1
    开启普通首页
    公共-校验数据    ${pvs1_H5}    wo_002    ${table_pvs1}    1
