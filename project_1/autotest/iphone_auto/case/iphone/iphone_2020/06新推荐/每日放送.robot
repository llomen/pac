*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${btclick}        {'act':'btclick'}

*** Test Cases ***
首页点图标进每日放送pvs1
    公共-删除数据
    sleep    5
    首页-每日放送
    sleep    2
    公共-校验数据    ${pvs1}    meirifangsong_01    ${table_pvs1}    1

加入看单click
    公共-删除数据
    每日放送-加入看单
    公共-校验数据    ${btclick}    show_zl_01    ${table_click}    1

取消加入看单click
    公共-删除数据
    每日放送-取消加入看单
    公共-校验数据    ${btclick}    show_zl_01    ${table_click}    1

点每日放送视频pvs1
    每日放送-点视频
    公共-校验数据    ${pvs1}    meirifangsong_02    ${table_pvs1}    1

每日放送视频vv
    sleep    15
    公共-校验数据    ${aplay}    meirifangsong_03    ${table_pvs1}    1

每日放送视频返回pvs1
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs1}    meirifangsong_03    ${table_pvs1}    1

切换tab无pvs1
    公共-删除数据
    每日放送-切换tab
    公共-校验数据    ${pvs1}    meirifangsong_03    ${table_pvs1}    0

每日放送返回首页pvs1
    公共-删除数据
    非播放页-返回
    sleep    2
    公共-校验数据    ${pvs1}    meirifangsong_04    ${table_pvs1}    1

点更多节目pvs

每日放送页面加入看单click

每日放送页面取消看单click

频道页取消看单
