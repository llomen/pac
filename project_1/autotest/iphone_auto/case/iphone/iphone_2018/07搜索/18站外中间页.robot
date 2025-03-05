*** Settings ***
Documentation     站外中间页
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Force Tags        smoke
Resource          ../5.3对象库.robot

*** Variables ***
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
站外中间页pvs
    [Setup]
    sleep    5
    首页-搜索
    搜索首页－输入搜索词    奔跑吧
    搜索-点击搜索
    sleep    2
    公共-删除数据
    搜索-点击播放
    公共-校验数据    ${pvs}    zhanwai_zhongjian    ${table_pvs_search}    1

跳站外大图action
    公共-删除数据
    comment    点击不可见文本    follow_play_button
    tap    backbg icon    200    200
    公共－点击页面文本    网页播放
    sleep    2
    公共-校验数据    ${action}    zhanwai_datu    mpp_action_5_5_iphone    0

跳站外大图pvs
    公共-校验数据    ${pvs}    zhanwai_datu    ${table_pvs}    1

跳站外大图pvs1
    公共-校验数据    ${pvs1}    zhanwai_datu    ${table_pvs1}    1

相关视频action
    公共－点击页面文本    back icon
    公共-删除数据
    公共－点击页面文本    奔跑吧，追光少年！
    公共-校验数据    ${action}    zhanwai_xiangguan    mpp_action_5_5_iphone    1

看了还会看action
    点播播放页-返回
    公共-删除数据
    comment    scroll    name=奔跑吧    name=看了还会看
    上滑
    公共－xpath    //XCUIElementTypeStaticText[@name="女儿们的恋爱"]/following-sibling::XCUIElementTypeButton[1]
    sleep    2
    公共-校验数据    ${action}    zhanwai_kanle    mpp_action_5_5_iphone    1
