*** Settings ***
Documentation     电影搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Resource          ../5.3对象库.robot


*** Variables ***
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${interestpv}     {'act':'interestpv'}
${recommended_user}    {'act':'recommend_user'}

*** Test Cases ***
搜索无结果search
    [Setup]
    sleep    3
    首页-搜索
    sleep    1
    公共-删除数据
    搜索首页－输入搜索词    Djjjjjjj
    搜索－点击搜索
    公共-校验数据    ${search}    wujieguo_001    mpp_search_5_5_iphone    1

搜索无结果view
    公共-校验数据    ${view}    wujieguo_001    mpp_view_5_5_iphone    1

无结果pvs
    公共-校验数据    ${pvs}    sousuo_006    ${table_pvs_search}    1

无结果pvs1
    公共-校验数据    ${pvs1}    sousuo_006    ${table_pvs1}    1

精选看了会喜欢interestpv
    公共-校验数据    ${interestpv}    iphone_jingxuan_001    mpp_recommendpv_interestpv    1

搜索无结果click
    公共-删除数据
    公共－点击页面文本    三千鸦杀
    sleep    2
    公共-校验数据    ${click}    cainixihuan_001    mpp_click_5_5_iphone    1

精选看了会喜欢recommended_user
    公共-校验数据    ${recommended_user}    iphone_jingxuan_001    mpp_recommend_user    1
