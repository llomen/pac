*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g1
Resource          ../5.3对象库.robot

*** Variables ***
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
