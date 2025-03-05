*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Test Cases ***
猜你喜欢曝光view
    滑动到猜你喜欢
    sleep    10
    公共-校验数据    {'event':'view','mdid':'114'}    view_06    mpp_ip_view    1

猜你喜欢点大图播放click
    公共-删除数据
    猜你喜欢-点大图播放
    sleep    3
    公共-校验数据    ${click}    click_41    ${table_channel_click}    1

buff
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    1

3hb
    公共-校验数据    ${hb3}    bodan_3    ${table_hb_sdk}    1

5hb
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

点标题click
    公共-删除数据
    猜你喜欢-点大图标题
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点大图标题进入点播页pvs
    公共-校验数据    ${pvs}    ai_duanshipin_02    ${table_pvs_dianbo}    1

点大图标题进入点播页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_02    ${table_pvs1}    1

点大图标题进入点播页aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

返回频道
    点播播放页-返回

点看正片click
    公共-删除数据
    猜你喜欢-点看正片
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点正片进入点播页pvs
    公共-校验数据    ${pvs}    ai_duanshipin_02    ${table_pvs_dianbo}    1

点正片进入点播页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_02    ${table_pvs1}    1

点正片进入点播页aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

返回频道2
    点播播放页-返回

点短片标题click
    滑动到猜你喜欢-短片
    公共-删除数据
    sleep    3
    猜你喜欢-点小图标题
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1

点短片进入点播页pvs
    公共-校验数据    ${pvs}    ai_duanshipin_02    ${table_pvs_dianbo}    1

点短片进入点播页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_02    ${table_pvs1}    1

点短片进入点播页aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

返回频道3
    点播播放页-返回

点短片图片click
    公共-删除数据
    猜你喜欢-点小图图片
    sleep    3
    公共-校验数据    ${click}    click_02    ${table_channel_click}    1
