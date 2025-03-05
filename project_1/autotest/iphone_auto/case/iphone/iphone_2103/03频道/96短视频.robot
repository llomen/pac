*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${noah}           {'act':'noah'}
${heartbeat}      {'act':'heartbeat'}
${hb15}           {'act':'hb','ht':'3'}
${cdn1}           {'s':'1'}
${cdn3}           {'s':'3'}
${switch}         {'act':'switch'}
${cdn2}           {'s':'2'}
${r3}             {‘r’:'3'}
${r1}             {‘r’:'1'}
${bdrecommend_rel}    {'act':'bdrecommend_rel'}
${bdrelatepv}     {'act':'bdrelatepv'}

*** Test Cases ***
短视频点标题noah
    sleep    5
    频道页-切换tab    综艺
    公共-删除数据
    短视频-点标题
    sleep    3
    公共-校验数据    ${noah}    noah_001    ${table_click}    1

进入点播页pvs
    公共-校验数据    ${pvs}    duanshipin_01    ${table_pvs_dianbo}    1

进入点播页pvs1
    公共-校验数据    ${pvs1}    duanshipin_01    ${table_pvs1}    1

点播页返回首页pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    duanshipin_02    ${table_pvs_other}    1

点播页返回首页pvs1
    公共-校验数据    ${pvs1}    duanshipin_02    ${table_pvs1}    1

点up主noah
    公共-删除数据
    短视频-点头像
    sleep    3
    公共-校验数据    ${noah}    noah_002    ${table_click}    1

点播页进入个人主页pvs
    公共-校验数据    ${pvs}    duanshipin_03    ${table_pvs_other}    1

点播页进入个人主页pvs1
    公共-校验数据    ${pvs1}    duanshipin_03    ${table_pvs1}    1

个人主页返回首页pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    duanshipin_04    ${table_pvs_other}    1

个人主页返回首页pvs1
    公共-校验数据    ${pvs1}    duanshipin_04    ${table_pvs1}    1

点关注noah
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="channel AddiCON Small"])[1]
    公共-校验数据    ${noah}    noah_003    ${table_click}    1

弹出登录框pv
    公共-校验数据    ${pvs}    bu2_005    ${table_pvs}    1

弹出登录框cv
    公共-校验数据    ${cv}    login_01    ${table_cv}    1

点播页stay
    公共-校验数据    ${stay}    stay_30    ${table_stay}    1

关闭登录框pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    bu2_006    ${table_pvs}    1
