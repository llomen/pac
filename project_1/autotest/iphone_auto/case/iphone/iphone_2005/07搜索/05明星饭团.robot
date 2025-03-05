*** Settings ***
Documentation     明星搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
明星搜索pvs
    sleep    5
    首页-搜索
    搜索首页－输入搜索词    赵丽颖
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

明星搜索pvs1
    公共-校验数据    ${pvs1}    sousuo_002    ${table_pvs1}    1

明星搜索search
    公共-校验数据    ${search}    mingxing_001    mpp_search_5_5_iphone    1

明星搜索view
    公共-校验数据    ${view}    mingxing_001    mpp_view_5_5_iphone    1

进入饭团click
    公共-删除数据
    公共－点击页面文本    进入饭团
    sleep    2
    公共-校验数据    ${click}    mingxing_001    mpp_click_5_5_iphone    1

进入饭团action
    sleep    2
    公共-校验数据    ${action}    mingxing_kongjian    mpp_action_5_5_iphone    1

明星饭团主页pvs
    sleep    2
    公共-校验数据    ${pvs}    sousuo_geren1    ${table_pvs}    1

明星饭团主页pvs1
    公共-校验数据    ${pvs1}    sousuo_geren1    ${table_pvs1}    1

饭团主页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    sousuo_geren2    ${table_pvs_search}    1

饭团主页返回pvs1
    公共-校验数据    ${pvs1}    sousuo_geren2    ${table_pvs1}    1
