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
电视剧看了会喜欢interestpv
    公共-删除数据
    sleep    3
    频道页-切换tab    电视剧
    sleep    2
    公共-校验数据    ${interestpv}    iphone_dianshiju_001    mpp_recommendpv_interestpv    1

电视剧看了会喜欢recommended_user
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[@name="楚乔传"])[1]/following-sibling::XCUIElementTypeButton[1]
    sleep    5
    上滑
    公共-校验数据    ${recommended_user}    iphone_dianshiju_001    mpp_recommend_user    1

返回电视频道
    点播播放页-返回

电视剧看了会喜欢change
    公共-删除数据
    上滑
    公共－点击页面文本    换一换
    公共-校验数据    ${change}    iphone_dianshiju_huanyihuan    mpp_recommendpv_more    1

电影看了会喜欢interestpv
    公共-删除数据
    频道页-切换tab    电影
    sleep    3
    上滑
    comment    scroll    name=看了还会看    name=二代妖精
    公共-校验数据    ${interestpv}    iphone_dianying_001    mpp_recommendpv_interestpv    1

电影看了会喜欢change
    公共-删除数据
    公共－xpath    //XCUIElementTypeButton[@name="换一换"]
    公共-校验数据    ${change}    iphone_dianying_001    mpp_recommendpv_more    1

电影看了会喜欢recommended_user
    公共-删除数据
    sleep    3
    tap    大话西游3    10    10
    公共-校验数据    ${recommended_user}    iphone_dianying_001    mpp_recommend_user    1

返回电影频道
    点播播放页-返回

*** Keywords ***
上滑
    swipe    128    640    128    240
