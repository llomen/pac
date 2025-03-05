*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Test Cases ***
点击了解详情click
    sleep    3
    首页-青云志
    Wait Until Page Contains Element    name=了解详情    10
    click element    name=了解详情
    sleep    3
    公共-校验数据    {'t':'1'}    qiantie_click    mpp_ad_jiance_iphone    1

点击了解详情adlost
    公共-校验数据    {'lostid':'5'}    adlost_02    mpp_ad_adlost_iphone    1

跳转广告h5页面pvs
    公共-校验数据    ${pvs}    ad_01    ${table_pvs_dianbo}    1

跳转广告h5页面返回pvs
    公共-删除数据
    comment    click element    xpath=(//XCUIElementTypeButton[@name="player back Shadow"])[2]
    sleep    2
    click element    name=close icon
    comment    点播播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    ad_02    ${table_pvs_dianbo}    1

跳转广告h5页面返回landclose
    公共-校验数据    {'t':'60000'}    landclose    mpp_ad_jiance_iphone    1

广告静音mute
    click element    ImgotvInteractiveMediaAds.bundle/ad-voice-nor
    click element    ImgotvInteractiveMediaAds.bundle/ad-voice-nor
    sleep    5
    公共-校验数据    {'t':'20000'}    mute    mpp_ad_jiance_iphone    1

广告取消静音unmute
    公共-校验数据    {'t':'20001'}    unmute    mpp_ad_jiance_iphone    1

未添加离线退出adlost
    点播播放页-返回
    公共-删除数据
    首页-青云志
    点播播放页-返回
    公共-校验数据    {'lostid':'1'}    adlost_01    mpp_ad_adlost_iphone    1
