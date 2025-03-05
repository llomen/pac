*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${switch}         {'act':'switch'}
${pvs}            {'act':'pvs'}
${aplay}          {'act':'aplay'}
${oflhb}          {'act':'oflhb'}
${ppv}            {'act':'ppv'}
${pvv}            {'act':'pvv'}
${pend}           {'act':'pend'}

*** Test Cases ***
离线缓存页进入剧集页pvs
    首页-我
    滚动到设置
    我的-缓存
    公共-删除数据
    page should contain text    青云志
    公共－点击页面文本    青云志
    公共-校验数据    ${pvs}    lixian_01    ${table_pvs}    1

播放离线视频pvs
    公共-删除数据
    公共－点击页面文本    第1集
    sleep    18
    公共-校验数据    ${pvs}    lixian_02    ${table_pvs_dianbo}    1

离线ppv
    公共-校验数据    ${ppv}    ppv_ofl    mobile_ppv_ipad    1

离线广告
    sleep    4
    公共-校验数据    {'type':'4'}    ke2_05    ${table_adcdn}    1

离线pvv
    sleep    3
    公共-校验数据    ${pvv}    mobile_02    mobile_pvv_ipad    1

离线vv
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

退出播放pvs
    公共-删除数据
    click a point    100    100
    sleep    1
    click element    name=backbg icon
    公共-校验数据    ${pvs}    lixian_03    ${table_pvs}    1

退出pend
    sleep    5
    公共-校验数据    ${pend}    mobile_02    mobile_pend_ipad    1

离线oflhb
    公共-校验数据    ${oflhb}    oflhb_1    mpp_hb_5_iphone_sdk    1

退出剧集页pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    lixian_04    ${table_pvs}    1

*** Keywords ***
暂停视频
    wq_double_tap    xpath=//XCUIElementTypeButton[@name="player back Shadow"]/..
