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
    sleep    3
    公共-删除数据
    搜索-点击搜索
    sleep    2
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
    公共-校验数据    ${click}    mingxing_000    mpp_click_5_5_iphone    1

进入饭团action
    sleep    2
    #公共-校验数据    ${action}    mingxing_kongjian    mpp_action_5_5_iphone    1

明星饭团主页pvs
    sleep    2
    公共-校验数据    ${pvs}    sousuo_008    ${table_pvs_other}    1

明星饭团主页pvs1
    公共-校验数据    ${pvs1}    sousuo_008    ${table_pvs1}    1

饭团主页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    sousuo_009    ${table_pvs_other}    1

饭团主页返回pvs1
    公共-校验数据    ${pvs1}    sousuo_009    ${table_pvs1}    1

进入饭团排行榜click
    公共-删除数据
    tap    饭团人气榜    100    10
    sleep    2
    公共-校验数据    ${click}    mingxing_000    mpp_click_5_5_iphone    1

进入饭团排行榜pvs
    sleep    2
    公共-校验数据    ${pvs}    sousuo_010    ${table_pvs}    1

进入饭团排行榜pvs1
    公共-校验数据    ${pvs1_H5}    sousuo_010    ${table_pvs1}    1

饭团排行榜返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    sousuo_011    ${table_pvs}    1

饭团排行榜返回pvs1
    公共-校验数据    ${pvs1}    sousuo_011    ${table_pvs1}    1
