*** Settings ***
Documentation     即将上线、专栏、精选短视频、芒果圈、猜你喜欢
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${page}           {'event':'page'}
${click}          {'event':'click'}
${table_channel_click}    mpp_ip_click
${table_channel_view}    mpp_ip_view
${table_channel_request}    mpp_ip_request
${table_channel_page}    mpp_ip_page

*** Test Cases ***
即将上线曝光view
    滑动到即将上线
    sleep    10
    公共-校验数据    {'event':'view','mdid':'108'}    view_05    mpp_ip_view    1

即将上线自动播放buff
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

即将上线自动播放aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    1

定时上报cdn-r1
    公共-校验数据    ${r1}    iphone_feed_1    mpp_cdnq_5_iphone    1

3hb
    公共-校验数据    ${hb3}    bodan_3    ${table_hb_sdk}    1

5hb
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

点小图切换click
    公共-删除数据
    即将上线-点小图
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

hb停止
    公共-校验数据    ${hb_end}    bodan_5    ${table_hb_sdk}    1

定时上报cdn-r3
    公共-校验数据    ${r3}    iphone_feed_3    mpp_cdnq_5_iphone    1

点小图进点播页click
    公共-删除数据
    即将上线-点小图
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点小图进点播页pvs
    公共-校验数据    ${pvs}    wo_002    ${table_pvs}    1

点小图进点播页pvs1
    公共-校验数据    ${pvs1}    wo_002    ${table_pvs1}    1

点小图aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

返回首页
    点播播放页-返回

点大图click
    即将上线-点大图
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点大图pvs
    公共-校验数据    ${pvs}    wo_002    ${table_pvs}    1

点大图pvs1
    公共-校验数据    ${pvs1}    wo_002    ${table_pvs1}    1

点大图aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

返回首页2
    点播播放页-返回

点预约click
    公共-删除数据
    即将上线-点预约
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

登录页pvs
    公共-校验数据    ${pvs}    wo_002    ${table_pvs}    1

登录浮层cv
    公共-校验数据    ${cv}    wo_002    ${table_cv}    1

首页stay
    公共-校验数据    ${stay}    wo_002    ${table_stay}    1

关闭登录框pvs
    登录页-关闭
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

点我的预约click
    公共-删除数据
    即将上线-点我的预约
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

登录框关闭
    登录页-关闭
