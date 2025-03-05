*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${recommended}    {'act':'recommended'}
${relatepv}       {'act':'relatepv'}
${hotpv}          {'act':'hotpv'}
${interestpv}     {'act':'interestpv'}
${recommend_hot}    {'act':'recommend_hot'}
${recommended_user}    {'act':'recommend_user'}
${more}           {'act':'more'}
${change}         {'act':'change'}
${pvs}            {'act':'pvs'}
${aplay}          {'act':'aplay'}

*** Test Cases ***
电视剧排行榜hotpv
    公共-删除数据
    sleep    3
    频道页-切换tab    电视剧
    sleep    2
    上滑
    公共-校验数据    ${hotpv}    iphone_jingxuan_001    mpp_recommendpv_hotpv    1

排行榜更多more
    公共-删除数据
    tap    最热电视剧TOP榜    10    10
    sleep    2
    公共-校验数据    ${more}    iphone_jingxuan_001    mpp_recommendpv_more    1

排行榜更多hotpv
    公共-校验数据    ${hotpv}    iphone_jingxuan_gengduo    mpp_recommendpv_hotpv    1

排行榜切换tab的pvs
    公共-校验数据    ${pvs}    paihangbang_tab    ${table_pvs}    1

排行榜切换tab的pvs1
    公共-校验数据    ${pvs1}    paihangbang_tab    ${table_pvs1}    1

排行榜页recommend_hot
    公共－点击页面文本    综艺
    公共-删除数据
    公共－点击页面文本    快乐大本营 2017
    公共-校验数据    ${recommend_hot}    iphone_jingxuan_gengduo    mpp_recommend_hot    1

电视剧排行榜点击recommend_hot
    点播播放页-返回
    Comment    click element    //UIAApplication[1]/UIAWindow[1]/UIAButton[12]
    Comment    公共－点击页面文本    backbg icon
    comment    榜单页-返回
    公共-删除数据
    公共－点击页面文本    电视剧
    公共－xpath    (//XCUIElementTypeStaticText[@name="楚乔传"])[1]
    sleep    18
    公共-校验数据    ${recommend_hot}    iphone_jingxuan_bangdan    mpp_recommend_hot    1

电视剧排行榜点击aplay
    公共-校验数据    ${aplay}    dianbopaihangbang_001    ${table_vv}    1

sdkload
    公共-校验数据    {'act':'sdkload'}    dianbo_008    mpp_sdkload_iphone    1

*** Keywords ***
上滑
    swipe    128    640    128    240
