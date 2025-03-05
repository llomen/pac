*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${text}           kuaile
${action}         {'act':'action'}

*** Test Cases ***
推荐词搜索search
    首页-搜索
    搜索首页－输入搜索词    ${text}
    公共-删除数据
    公共－点击页面文本    快乐大本营2019
    sleep    3
    公共-校验数据    ${search}    suggest_002    mpp_search_5_5_iphone    1

推荐词搜索view
    sleep    3
    公共-校验数据    ${view}    suggest_002    mpp_view_5_5_iphone    1

推荐词进点播页pvs
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

推荐词进点播页pvs1
    公共-校验数据    ${pvs1}    sousuo_002    ${table_pvs1}    1

进入节目饭团click
    公共-删除数据
    公共－点击页面文本    进入饭团
    sleep    3
    公共-校验数据    ${click}    mingxing_001    mpp_click_5_5_iphone    1

进入节目饭团pvs
    公共-校验数据    ${pvs}    sousuo_012    ${table_pvs_other}    1

进入节目饭团pvs1
    公共-校验数据    ${pvs1}    sousuo_012    ${table_pvs1}    1

饭团返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    sousuo_013    ${table_pvs_other}    1

饭团返回pvs1
    公共-校验数据    ${pvs1}    sousuo_013    ${table_pvs1}    1

历史搜索search
    搜索－取消
    首页-搜索
    下滑
    sleep    3
    公共-删除数据
    搜索-历史搜索
    公共-校验数据    ${search}    lishi_001    mpp_search_5_5_iphone    1

历史搜索view
    公共-校验数据    ${view}    lishi_001    mpp_view_5_5_iphone    1

热门搜索search
    搜索－取消
    首页-搜索
    sleep    3
    公共-删除数据
    公共－点击页面文本    1
    公共-校验数据    ${search}    remen_002    mpp_search_5_5_iphone    1

热门搜索view
    公共-校验数据    ${view}    lishi_001    mpp_view_5_5_iphone    1
