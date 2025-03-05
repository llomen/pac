*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot

*** Variables ***
${aplay}          {'act':'aplay'}
${type0}          {'type':'0','l':'/app/player'}
${type1}          {'type':'1','l':'/app/player'}
${type3}          {'type':'3'}
${type4}          {'type':'4'}
${type5}          {'type':'5'}
${type6}          {'type':'6'}
${dianbo}         下一站是幸福
${hudongju}       明星大侦探5 互动版
${chenjinshi}     我的特工爷爷

*** Test Cases ***
进入点播页
    公共-删除数据
    点击不可见文本    一夜新娘
    sleep    10

点暂停
    广告-暂停

广告曝光impression
    公共-校验数据    {'t':'0','s':'200009'}    qiantie_03    mpp_ad_jiance_iphone    1

点了解详情click
    公共-删除数据
    广告-了解详情
    sleep    5
    公共-校验数据    {'t':'0'}    qiantie_03    mpp_ad_jiance_iphone    1

广告丢失adlost
    公共-校验数据    {'st':'2','s':'200009'}    qiantie_03    mpp_ad_jiance_iphone    1
