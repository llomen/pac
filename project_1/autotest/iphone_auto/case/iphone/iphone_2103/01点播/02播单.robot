*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot

*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${switch}         {'act':'switch'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {‘r’:'1'}
${st}             {'act':'st'}
${as}             {'act':'as'}
${ae}             {'act':'ae'}
${pv}             {'act':'pv'}
${vv}             {'act':'vv'}
${share}          {'act':'share'}
${buffer}         {'act':'buffer'}
${hb}             {'act':'hb','ht':'2'}

*** Test Cases ***
进入播单底层页cp1
    首页-搜索
    搜索首页－输入搜索词    我的特工爷爷
    搜索-点击搜索
    sleep    5
    公共-删除数据
    搜索－结果页点播单
    sleep    5
    公共-校验数据    ${cp10}    iphone_002    ${table_cp}    1

cdn1
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    1

播单页pvs
    公共-校验数据    ${pvs}    cjs_011    ${table_pvs_dianbo}    1

播单页pvs1
    公共-校验数据    ${pvs1}    cjs_011    ${table_pvs1}    1

buffer
    公共-校验数据    ${buffer}    cjs_01    ${table_buffer}    1

aplay
    公共-校验数据    ${aplay}    cjs_01    ${table_vv}    1

进入播单sp
    公共-校验数据    ${sp}    cjs_01    ${table_sp}    1

沉浸式心跳3hb
    公共-校验数据    ${hb3}    cjs_3    ${table_hb_sdk}    1

沉浸式心跳5hb
    公共-校验数据    ${hb5}    cjs_5    ${table_hb_sdk}    1

切换下一个视频pvs
    sleep    3
    公共-删除数据
    tap    刘德华秒变坏爸爸    0    0
    公共-校验数据    ${pvs}    cjs_012    ${table_pvs_dianbo}    1

切换下一个视频pvs1
    公共-校验数据    ${pvs1}    cjs_012    ${table_pvs1}    1

切换下一个视频hb
    sleep    3
    公共-校验数据    ${hb_end}    cjs_end    ${table_hb_sdk}    1

切换下一个视频aplay
    公共-校验数据    ${aplay}    cjs_02    ${table_vv}    1

连播看了还会看sp
    公共-校验数据    ${sp}    cjs_02    ${table_sp}    1

退出播放pvs
    sleep    2
    公共-删除数据
    沉浸式-返回
    公共-校验数据    ${pvs}    cjs_013    ${table_pvs}    1

退出播放pvs1
    公共-校验数据    ${pvs1}    cjs_013    ${table_pvs1}    1
