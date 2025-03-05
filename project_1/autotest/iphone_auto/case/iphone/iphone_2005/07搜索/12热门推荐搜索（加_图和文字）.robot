*** Settings ***
Documentation     综艺推荐和搜索按钮搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Resource          ../5.3对象库.robot


*** Variables ***
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
热门推荐切换tab action
    sleep    5
    频道页-切换tab    综艺
    sleep    2
    首页-搜索
    公共-删除数据
    下滑
    sleep    3
    Comment    上滑
    搜索-入口页切换tab    动漫
    sleep    3
    公共-校验数据    ${action}    top_001    mpp_action_5_5_iphone    1

热门推荐（动漫）搜索search
    公共-删除数据
    公共－点击页面文本    小猪佩奇全集
    sleep    3
    公共-校验数据    ${search}    top_001    mpp_search_5_5_iphone    1

热门推荐（动漫）click
    公共－点击页面文本    播放
    sleep    2
    公共-校验数据    ${click}    top_001    mpp_click_5_5_iphone    1

热门推荐（动漫）action
    公共-校验数据    ${action}    top_002    mpp_action_5_5_iphone    0

播放返回pvs
    公共-删除数据
    点播播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    sou_bo01    ${table_pvs}    1

播放返回pvs1
    公共-校验数据    ${pvs1}    sou_bo01    ${table_pvs1}    1

热门推荐（综合）搜索search
    搜索－取消
    首页-搜索
    下滑
    公共-删除数据
    公共－点击页面文本    奈何boss要娶我
    sleep    2
    公共-校验数据    ${search}    top_001    mpp_search_5_5_iphone    1

热门推荐（综合）view
    公共-校验数据    ${view}    dianying_001    mpp_view_5_5_iphone    1

热门推荐（综合）action
    公共-校验数据    ${action}    top_003    mpp_action_5_5_iphone    1
