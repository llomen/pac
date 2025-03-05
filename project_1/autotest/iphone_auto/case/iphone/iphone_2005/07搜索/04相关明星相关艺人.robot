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
    sleep    5
    Comment    公共-滑动页面    成龙    洪金宝
    Comment    scroll up    xpath=//XCUIElementTypeStaticText[@name="张曼玉"]
    上滑
    上滑
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
    上滑
    上滑
    公共-删除数据
    搜索-相关搜索
    sleep    2
    公共-校验数据    ${click}    yiren_003    mpp_click_5_5_iphone    0
