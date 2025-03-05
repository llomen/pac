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
    频道页-切换tab    电视剧
    sleep    2
    公共-校验数据    ${interestpv}    iphone_dianshiju_001    mpp_recommendpv_interestpv    1

电视剧看了会喜欢recommended_user
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[@name="楚乔传"])[1]/following-sibling::XCUIElementTypeButton[1]
    公共-校验数据    ${recommended_user}    iphone_dianshiju_001    mpp_recommend_user    1

电视剧看了会喜欢change
    点播播放页-返回
    公共-滑动页面    看了还会看    你喜欢赵丽颖，所以猜你还喜欢
    公共-删除数据
    公共－点击页面文本    换一换
    公共-校验数据    ${change}    iphone_dianshiju_huanyihuan    mpp_recommendpv_more    1

看了还会看点击“所以猜你喜欢”more
    公共-删除数据
    公共－点击页面文本    你喜欢赵丽颖，所以猜你还喜欢
    sleep    2
    公共-校验数据    ${more}    iphone_kanlehai_more    mpp_recommendpv_more    1

看了还会看点击“所以猜你喜欢”interestpv
    公共-校验数据    ${interestpv}    iphone_kanlehai_more    mpp_recommendpv_interestpv    1

为您推荐切换tab的pvs
    公共-校验数据    ${pvs}    weinituijian_tab    mpp_pv_5_5_iphone_sdk_qita    1

为您推荐视频点击recommend_user
    公共-删除数据
    tap    陈伟霆赵丽颖调皮扮初见    10    10
    公共-校验数据    ${recommended_user}    iphone_weinituijian    mpp_recommend_user    1

电视剧看了会喜欢aplay
    sleep    17
    公共-校验数据    ${aplay}    dianbokanxihuan_001    ${table_vv}    1

sdkload
    公共-校验数据    {'act':'sdkload'}    dianbo_007    mpp_sdkload_iphone    1

*** Keywords ***
上滑
    swipe    128    640    128    240
