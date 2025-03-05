*** Settings ***
Documentation     综艺推荐和搜索按钮搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Force Tags        smoke
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
推荐词搜索search
    首页-搜索
    搜索首页－输入搜索词    快乐大本营
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${search}    suggest_001    mpp_search_5_5_iphone    1

推荐词搜索view
    公共-校验数据    ${view}    suggest_001    mpp_view_5_5_iphone    1

进入饭团click
    公共-删除数据
    Comment    公共-屏幕上滑一小块
    comment    搜索-点击进入空间
    公共－点击页面文本    进入饭团
    sleep    3
    公共-校验数据    ${click}    zongyi_003    mpp_click_5_5_iphone    1

进入饭团action
    公共-校验数据    ${action}    zongyi_kongjian    mpp_action_5_5_iphone    1

进入饭团pvs
    公共-校验数据    ${pvs}    sousuo_kongjian3    ${table_pvs}    1

进入饭团pvs1
    公共-校验数据    ${pvs1}    sousuo_kongjian3    ${table_pvs1}    1

进入饭团返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    sousuo_dongtai1    ${table_pvs_search}    1

进入饭团返回pvs1
    公共-校验数据    ${pvs1}    sousuo_dongtai1    ${table_pvs1}    1

点全部click
    公共-删除数据
    搜索-点击综艺结果全部
    sleep    2
    公共-校验数据    ${click}    zongyi_002    mpp_click_5_5_iphone    1

点全部action
    公共-校验数据    ${action}    zongyi_quanbu    mpp_action_5_5_iphone    1

点全部pvs
    公共-校验数据    ${pvs}    sousuo_quanbu2    ${table_pvs_search}    1

点全部pvs1
    公共-校验数据    ${pvs1}    sousuo_quanbu2    ${table_pvs1}    1

综艺中间页返回pvs
    公共-删除数据
    非播放页-返回
    sleep    3
    公共-校验数据    ${pvs}    sousuo_quanbu1    ${table_pvs_search}    1

综艺中间页返回pvs1
    公共-校验数据    ${pvs1}    sousuo_quanbu1    ${table_pvs1}    1

相同系列点击click
    公共-滑动页面    进入饭团    相同系列
    点击不可见文本    快乐大本营2015
    sleep    2
    公共-校验数据    ${click}    xilie_001    mpp_click_5_5_iphone    1

相同系列点击action
    公共-校验数据    ${action}    zongyi_xilie    mpp_action_5_5_iphone    1
