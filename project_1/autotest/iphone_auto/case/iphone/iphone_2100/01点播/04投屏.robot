*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot

*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${hb15}           {'act':'hb','ht':'3'}
${cdn1}           {'s':'1'}
${cdn3}           {'s':'3'}
${switch}         {'act':'switch'}
${cdn2}           {'s':'2'}
${r3}             {‘r’:'3'}
${r1}             {‘r’:'1'}
${pfc16}          {'act':'pfc','pos':'16'}
${pfc17}          {'act':'pfc','pos':'17'}
${bdrecommend_rel}    {'act':'bdrecommend_rel'}
${bdrelatepv}     {'act':'bdrelatepv'}
${filmfreedown}    小猪佩奇全集
${filmvipdown}    青云志
${filmcannotdown}    汪汪队立大功

*** Test Cases ***
投屏按钮曝光cv
    sleep    5
    首页-搜索
    搜索首页－输入搜索词    青云志
    搜索－点击搜索
    sleep    3
    公共－xpath    //XCUIElementTypeButton[@name="2"]
    #搜索-点击播放
    sleep    10
    点播播放页-暂停
    公共-删除数据
    点播播放页-点屏幕
    公共-校验数据    ${cv}    play_17    ${table_cv}    1

点投屏按钮air
    公共-删除数据
    点播播放页-投屏
    公共-校验数据    ${air}    air-button_click    ${table_click}    1

投屏pvs
    公共-校验数据    ${pvs}    air_001    ${table_pvs}    1

投屏pvs1
    公共-校验数据    ${pvs1}    air_001    ${table_pvs1}    0

投屏半屏曝光cv
    公共-校验数据    ${cv}    play_15    ${table_cv}    1

Airplay air
    公共-删除数据
    公共－点击页面文本    AirPlay
    comment    公共－点击页面文本    取消
    公共-校验数据    ${air}    air-airplay_click    ${table_click}    1

Airplay pvs
    公共-校验数据    ${pvs}    air_002    ${table_pvs}    1

Airplay pvs1
    公共-校验数据    ${pvs1}    air_002    ${table_pvs1}    0

*** Keywords ***
点播页-点击屏幕
    click element    xpath=//XCUIElementTypeButton[@name="player back Shadow"]/..
