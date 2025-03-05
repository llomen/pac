*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}
${pfc}            {'act':'pfc'}
${dologin}        {'act':'DoLogin'}
${buffer}         {'act':'buffer'}
${hb}             {'act':'hb','ht':'2'}
${pjr}            {'act':'pjr'}
${share}          {'act':'share'}
${shareresult}    {'act':'shareresult'}
${oflhb}          {'act':'oflhb'}
${ppv}            {'act':'ppv'}
${pvv}            {'act':'pvv'}
${pend}           {'act':'pend'}

*** Test Cases ***
进已缓存pvs
    首页-我
    公共-删除数据
    我的-缓存
    公共-校验数据    ${pvs}    huancun_013    ${table_pvs}    1

进已缓存pvs1
    公共-校验数据    ${pvs1}    huancun_013    ${table_pvs1}    1

离线缓存页进入剧集页pvs
    公共-删除数据
    公共－点击页面文本    小猪佩奇 第二季
    公共-校验数据    ${pvs}    lixian_01    ${table_pvs}    1

离线缓存页进入剧集页pvs1
    公共-校验数据    ${pvs1}    lixian_01    ${table_pvs1}    1

播放离线视频pvs
    公共-删除数据
    公共－点击页面文本    第1集
    sleep    18
    公共-校验数据    ${pvs}    lixian_02    ${table_pvs_dianbo}    1

播放离线视频pvs1
    公共-校验数据    ${pvs1}    lixian_02    ${table_pvs1}    1

离线ppv
    公共-校验数据    ${ppv}    ppv_ofl    mobile_ppv_ipad    1

离线pvv
    sleep    18

离线vv
    公共-校验数据    ${aplay}    lixian    ${table_vv}    1

buffer
    公共-校验数据    ${buffer}    iphone_001    ${table_buffer}    0

可播比cp1
    公共-校验数据    {'act':'cp1'}    iphone_001    ${table_cp}    1

连播sp
    公共-校验数据    ${sp}    feed_001    ${table_sp}    1

cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    0

cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    0

在线3hb
    公共-校验数据    ${hb3}    shikan_3    ${table_hb_sdk}    0

在线5hb
    公共-校验数据    ${hb5}    shikan_5    ${table_hb_sdk}    0

退出播放pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    lixian_03    ${table_pvs}    1

退出播放pvs1
    公共-校验数据    ${pvs1}    lixian_03    ${table_pvs1}    1

退出pend
    sleep    5
    公共-校验数据    ${pend}    mobile_02    mobile_pend_ipad    1

离线oflhb
    公共-校验数据    ${oflhb}    002    mpp_ap_oflhb    1

退出剧集页pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    lixian_04    ${table_pvs}    1

退出剧集页pvs1
    公共-校验数据    ${pvs1}    lixian_04    ${table_pvs1}    1

已缓存返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    huancun_014    ${table_pvs}    1

已缓存返回pvs1
    公共-校验数据    ${pvs1}    huancun_014    ${table_pvs1}    1

点播放记录进入离线切换在线剧集
    sleep    5
    公共－点击页面文本    小猪佩奇 第二季 第1集 波利的假期
    sleep    5
    公共-删除数据
    公共－点击页面文本    2

切换剧集pend
    公共-校验数据    ${pend}    mobile_02    mobile_pend_ipad    1

切换剧集离线oflhb
    公共-校验数据    ${oflhb}    002    mpp_ap_oflhb    1

切换剧集pvs
    公共-校验数据    ${pvs}    lixian_010    ${table_pvs_dianbo}    1

切换剧集pvs1
    公共-校验数据    ${pvs1}    lixian_010    ${table_pvs1}    1

在线vv
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

在线buffer
    公共-校验数据    ${buffer}    iphone_002    ${table_buffer}    1

在线视频可播比cp1
    公共-校验数据    {'act':'cp1'}    iphone_001    ${table_cp}    1

切换剧集连播sp
    公共-校验数据    ${sp}    feed_001    ${table_sp}    1

在线cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

在线cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    1

在线cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    1

切换在线3hb
    公共-校验数据    ${hb3}    shikan_3    ${table_hb_sdk}    1

切换在线5hb
    公共-校验数据    ${hb5}    shikan_5    ${table_hb_sdk}    1
