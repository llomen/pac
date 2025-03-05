*** Settings ***
Documentation     明星搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Resource          ../5.3对象库.robot

*** Variables ***
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}

*** Test Cases ***
明星搜索search
    [Setup]
    sleep    5
    首页-搜索
    搜索首页－输入搜索词    成龙
    公共-删除数据
    Comment    Hide Keyboard    key_name=Return
    搜索-点击搜索
    公共-校验数据    ${search}    mingxing_002    mpp_search_5_5_iphone    1

明星搜索view
    公共-校验数据    ${view}    mingxing_003    mpp_view_5_5_iphone    1

相关明星搜索search
    [Setup]
    滑动到相关搜索
    sleep    5
    公共-删除数据
    搜索-相关搜索
    sleep    2
    公共-校验数据    ${search}    mingxing_004    mpp_search_5_5_iphone    1

相关明星搜索view
    公共-校验数据    ${view}    mingxing_003    mpp_view_5_5_iphone    1

艺人搜索search
    [Setup]
    sleep    5
    搜索－取消
    首页-搜索
    搜索首页－输入搜索词    杨幂
    公共-删除数据
    搜索-点击搜索
    sleep    2
    公共-校验数据    ${search}    mingyi_001    mpp_search_5_5_iphone    1

艺人搜索view
    公共-校验数据    ${view}    mingxing_003    mpp_view_5_5_iphone    1

相关艺人点击click
    [Setup]
    sleep    3
    滑动到相关明星
    公共-删除数据
    #搜索-相关搜索
    sleep    2
    公共－点击页面文本    李易峰
    公共-校验数据    ${click}    yiren_003    mpp_click_5_5_iphone    1

进入明星饭团pvs
    公共-校验数据    ${pvs}    sousuo_008    ${table_pvs_other}    1

进入明星饭团pvs1
    公共-校验数据    ${pvs1}    sousuo_008    ${table_pvs1}    1

明星饭团返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    sousuo_009    ${table_pvs_other}    1

明星饭团返回pvs1
    公共-校验数据    ${pvs1}    sousuo_009    ${table_pvs1}    1

*** Keywords ***
上滑
    sleep    1
    swipe    200    588    200    185
    sleep    1

滑动到相关搜索
    上滑
    上滑
    上滑

滑动到相关明星
    上滑
    上滑
    上滑
    上滑
    上滑
