*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${show}           {'logtype':'show'}
${table_show}     mpp_show_5_iphone_sdk
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_pvs_dianbo}    mpp_pv_5_5_iphone_sdk_dianbo
${table_chzlshow}    mpp_ip_chzlshow
${table_chzlclick}    mpp_ip_chzlclick_2
${table_chzlclick_jubao}    mpp_ip_chzlclick_1
${chzlshow}       {'act':'chzlshow'}
${chzlclick}      {'act':'chzlclick'}
${columnist}      {'act':'columnist'}
${share}          {'act':'share'}
${stay}           {'act':'stay'}
${table_stay}     mpp_ip_chzlclick_1
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {‘r’:'1'}

*** Test Cases ***
搜索页进入沉浸式pvs
    首页-搜索
    搜索首页－输入搜索词    我的特工爷爷
    搜索-点击搜索
    sleep    5
    公共-删除数据
    搜索－结果页点播单
    sleep    10
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

连播sp
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

返回搜索页pvs
    公共-获取结果    ${pvs}    feed_001    ${table_pvs_dianbo}    1

播放记录进沉浸式pvs
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

连播2sp
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

返回我的pvs
    公共-获取结果    ${pvs}    feed_001    ${table_pvs_dianbo}    1

播放记录详情进沉浸式pvs
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

连播3sp
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

返回播放记录详情pvs
    公共-获取结果    ${pvs}    feed_001    ${table_pvs_dianbo}    1
