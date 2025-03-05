*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${show}           {'logtype':'show'}
${table_chfwatchshow}    mpp_ip_chfwatchshow
${table_chfwatchclick}    mpp_ip_chfwatchclick
${table_chfwatchclick_jubao}    mpp_ip_chfwatchclick_jubao
${chfwatchshow}    {'act':'chfwatchshow'}
${chfwatchclick}    {'act':'chfwatchclick'}

*** Test Cases ***
频道追剧show
    首页-频道管理
    公共-删除数据
    公共－点击页面文本    动漫
    sleep    3
    公共-校验数据    {'logtype':'show'}    show_zl_01    ${table_show}    1

频道追剧chfwatchshow
    公共-校验数据    ${chfwatchshow}    chfwatchshow_001    ${table_chfwatchshow}    1

点标题chfwatchclick
    公共-删除数据
    追剧-点标题
    公共-校验数据    ${chfwatchclick}    chfwatchclick_001    ${table_chfwatchclick}    1

点标题pvs
    sleep    2
    公共-校验数据    ${pvs}    zhuiju_001    ${table_pvs_dianbo}    1

点标题pvs1
    公共-校验数据    ${pvs1}    zhuiju_001    ${table_pvs1}    1

点播页返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    zhuiju_002    ${table_pvs}    1

点播页返回pvs1
    公共-校验数据    ${pvs1}    zhuiju_002    ${table_pvs1}    1

点图片chfwatchclick
    公共-删除数据
    追剧-点图片
    公共-校验数据    ${chfwatchclick}    chfwatchclick_001    ${table_chfwatchclick}    1

退出点播页
    点播播放页-返回

举报chfwatchclick
    公共-删除数据
    追剧-举报
    追剧-点举报内容
    公共-校验数据    ${chfwatchclick}    chfwatchclick_002    ${table_chfwatchclick_jubao}    1

*** Keywords ***
测试上滑
    ${x1} =    evaluate    ${屏幕宽度}*0.5
    ${y1} =    evaluate    ${屏幕高度}*0.7
    ${x2} =    evaluate    0
    ${y2} =    evaluate    -${屏幕高度}*0.5
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
