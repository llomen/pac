*** Settings ***
Documentation     竖图、1大四小、即将上线
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
评论模块-点名字click
    公共-删除数据
    上滑
    sleep    3
    上滑
    sleep    2
    评论模块-点名字
    公共-校验数据    ${click}    click_04    ${table_channel_click}    1

评论模块进点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    new_01    ${table_pvs_dianbo}    1

评论模块进点播页pvs1
    公共-校验数据    ${pvs1}    new_01    ${table_pvs1}    1

评论模块进点播页aplay
    公共-校验数据    ${aplay}    new_01    ${table_vv}    1

评论浮层曝光cv
    公共-校验数据    ${cv}    comment_2    ${table_cv}    1

点播返回频道pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    new_02    ${table_pvs}    1

点播返回频道pvs1
    公共-校验数据    ${pvs1}    new_02    ${table_pvs1}    1

评论模块-点内容click
    公共-删除数据
    评论模块-点内容
    sleep    3
    公共-校验数据    ${click}    click_05    ${table_channel_click}    1

评论模块-点视频click
    点播播放页-返回
    公共-删除数据
    评论模块-点视频
    sleep    3
    公共-校验数据    ${click}    click_06    ${table_channel_click}    1

返回频道
    点播播放页-返回

热门话题模块曝光view
    公共-删除数据
    上滑
    sleep    60
    公共-校验数据    {'event':'view','mdid':'103'}    view_01    mpp_ip_view    1

热门话题点单个话题click
    公共-删除数据
    话题模块-点话题
    sleep    4
    公共-校验数据    ${click}    click_07    ${table_channel_click}    1

进入话题详情页pvs
    公共-校验数据    ${pvs}    new_03    ${table_pvs_other}    1

进入话题详情页pvs1
    公共-校验数据    ${pvs1}    new_03    ${table_pvs1}    1

话题详情页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    new_04    ${table_pvs_other}    1

话题详情页返回pvs1
    公共-校验数据    ${pvs1}    new_04    ${table_pvs1}    1

热门话题点话题广场click
    公共-删除数据
    话题模块-点广场
    sleep    2
    公共-校验数据    ${click}    click_07    ${table_channel_click}    1

进入话题广场pvs
    公共-校验数据    ${pvs}    new_05    ${table_pvs_other}    1

进入话题广场pvs1
    公共-校验数据    ${pvs1}    new_05    ${table_pvs1}    1

话题广场返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    new_06    ${table_pvs_other}    1

话题广场返回pvs1
    开启普通首页
    公共-校验数据    ${pvs1}    new_06    ${table_pvs1}    1
