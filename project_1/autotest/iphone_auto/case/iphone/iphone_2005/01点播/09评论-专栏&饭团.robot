*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1
Resource          ../5.3对象库.robot


*** Variables ***
${show}           {'logtype':'show'}
${comment}        {'act':'comment'}
${table_show}     mpp_show_5_iphone_sdk
${table_cjplayshow}    mpp_ip_chzlshow
${table_cjlayclick}    mpp_ip_chzlclick_2
${cjplayshow}     {'act':'cjplayshow'}
${cjplayclick}    {'act':'cjplayclick'}
${table_sp}       mpp_sp_iphone
${share}          {'act':'share'}
${cp10}           {'act':'cp1'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {'r’:'1'}
${hb3}            {'ht':'0','act':'hb'}
${hb5}            {'ht':'1','act':'hb'}
${hb_end}         {'ht':'2','act':'hb'}
${hb3_cj}         {'ht':'0','act':'hb'}
${hb5_cj}         {'ht':'1','act':'hb'}
${hb_end_cj}      {'ht':'2','act':'hb'}

*** Test Cases ***
饭团评论show
    首页-搜索
    搜索首页－输入搜索词    楚乔传
    搜索－点击搜索
    sleep    5
    搜索-点击剧集的集数2
    公共-删除数据
    sleep    3
    点播播放页-评论
    公共-校验数据    ${pfc}    pfc_pinglun_new    ${table_click}    1
