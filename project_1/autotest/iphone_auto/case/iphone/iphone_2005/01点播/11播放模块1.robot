*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot


*** Variables ***
${pfc}            {'act':'pfc'}

*** Test Cases ***
进入点播页
    sleep    3
    公共-删除数据
    首页-青云志
    点播页-关闭角标

正片加载事件vl
    sleep    3
    公共-校验数据    {'act':'vl','pos':'1'}    vl_zhengpian    ${table_click}    1

花絮加载事件vl
    公共-校验数据    {'act':'vl','pos':'2'}    vl_huaxu    ${table_click}    1

正片模块曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=1'}    show_dianbo_1    ${table_show}    1

花絮模块曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=2'}    show_dianbo_2    ${table_show}    1

相关明星加载事件vl
    sleep    5
    公共-校验数据    {'act':'vl','pos':'5'}    vl_xiangguan    ${table_click}    1

看了还会看加载事件vl
    公共-校验数据    {'act':'vl','pos':'8'}    vl_xihuan    ${table_click}    1

进入点播页sp
    公共-校验数据    ${sp}    zhengpian_001    ${table_sp}    1

正片列表pvs
    公共-删除数据
    点播播放页-正片列表
    公共-校验数据    ${pvs}    dianbo_zhengpian_001    ${table_pvs}    0

正片列表pvs1
    公共-校验数据    ${pvs1}    dianbo_zhengpian_001    ${table_pvs1}    0

正片列表浮层曝光cv
    公共-校验数据    ${cv}    play_04    ${table_cv}    1

正片列表pfc
    公共-校验数据    ${pfc}    pfc-zhengpian    ${table_click}    1

正片更多播放pvs
    公共-删除数据
    comment    公共－点击页面文本    碧瑶张小凡街头初遇
    公共－xpath    (//XCUIElementTypeStaticText[@name="2"])[2]
    sleep    2
    公共-校验数据    ${pvs}    dianbo_zhengpian_002    ${table_pvs_dianbo}    1

正片更多播放pvs1
    公共-校验数据    ${pvs1}    dianbo_zhengpian_002    ${table_pvs1}    1

正片跳转正片sp
    公共-校验数据    ${sp}    zhengpian_002    ${table_sp}    1

正片列表返回pvs
    公共-删除数据
    点播播放页-正片列表关闭
    公共-校验数据    ${pvs}    dianbo_zhengpian_003    ${table_pvs_dianbo}    0

花絮列表pvs
    公共-删除数据
    点播播放页-花絮
    sleep    2
    公共-校验数据    ${pvs}    dianbo_duanpian_001    ${table_pvs}    0

花絮列表pvs1
    公共-校验数据    ${pvs1}    dianbo_duanpian_001    ${table_pvs1}    0

花絮列表浮层曝光cv
    Comment    公共-删除数据
    Comment    点播播放页-花絮
    公共-校验数据    ${cv}    play_05    ${table_cv}    1

花絮列表pfc
    公共-校验数据    ${pfc}    pfc-huaxu    ${table_click}    1

更多短片返回pvs
    公共-删除数据
    点播播放页-花絮列表关闭
    公共-校验数据    ${pvs}    dianbo_duanpian_002    ${table_pvs_dianbo}    0

看了还会看曝光show
    公共-删除数据
    sleep    1
    点播页上滑1
    sleep    3
    公共-校验数据    {'logtype':'show','lob':'smod=8'}    show_dianbo_8    ${table_show}    1

相关饭团人气榜更多曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=133'}    show_dianbo_133    ${table_show}    1

相关饭团明星曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=134'}    show_dianbo_134    ${table_show}    1

周边大放送模块曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=17'}    show_dianbo_17    ${table_show}    1

明星饭团pfc
    公共-删除数据
    公共－点击页面文本    赵丽颖
    公共-校验数据    ${pfc}    pfc_fantuan    ${table_click}    1

明星饭团pvs
    公共-校验数据    ${pvs}    dianbo_mingxing_001    ${table_pvs_other}    1

明星饭团pvs1
    公共-校验数据    ${pvs1}    dianbo_mingxing_001    ${table_pvs1}    1

明星饭团返回pvs
    公共-删除数据
    非播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    dianbo_mingxing_002    ${table_pvs_dianbo}    1

明星饭团返回pvs1
    公共-校验数据    ${pvs1}    dianbo_mingxing_002    ${table_pvs1}    1

节目饭团pfc
    公共-删除数据
    公共－xpath    (//XCUIElementTypeStaticText[@name="青云志"])[1]
    公共-校验数据    ${pfc}    pfc_fantuan    ${table_click}    1

节目饭团pvs
    公共-校验数据    ${pvs}    dianbo_jiemu    ${table_pvs_other}    1

节目饭团pvs1
    公共-校验数据    ${pvs1}    dianbo_jiemu    ${table_pvs1}    1

节目饭团返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    dianbo_jiemu1    ${table_pvs}    1

节目饭团返回pvs1
    公共-校验数据    ${pvs1}    dianbo_jiemu1    ${table_pvs1}    1

饭团人气榜pfc
    公共-删除数据
    点播页饭团人气榜
    sleep    3
    公共-校验数据    ${pfc}    pfc_renqibang    ${table_click}    1

饭团人气榜pvs
    公共-校验数据    ${pvs}    dianbo_zhifu_001    ${table_pvs}    1

饭团人气榜pvs1
    公共-校验数据    ${pvs1_H5}    dianbo_zhifu_001    ${table_pvs1}    1

饭团人气榜返回pvs
    公共-删除数据
    非播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    dianbo_zhifu_002    ${table_pvs}    1

饭团人气榜返回pvs1
    公共-校验数据    ${pvs1}    dianbo_zhifu_002    ${table_pvs1}    1

点击周边大放送pfc
    公共-删除数据
    公共－点击页面文本    立即预订
    公共-校验数据    ${pfc}    pfc-zhoubian    ${table_click}    1

周边大放送pvs
    sleep    2
    公共-校验数据    ${pvs}    fangsong_01    ${table_pvs_other}    1

周边大放送pvs1
    公共-校验数据    ${pvs1}    dianbo_zhifu_002    ${table_pvs1}    0

周边大放送半屏曝光cv
    公共-校验数据    ${cv}    play_16    ${table_cv}    1

关闭周边大放送pvs
    公共-删除数据
    点播播放页-点屏幕
    sleep    2
    公共-校验数据    ${pvs}    fangsong_02    ${table_pvs_other}    1

看了还会看pvs
    公共-删除数据
    公共－点击页面文本    初恋那件小事
    公共-校验数据    ${pvs}    dianbo_kanlhaihuikan_001    ${table_pvs_dianbo}    1

看了还会看pvs1
    公共-校验数据    ${pvs1}    dianbo_kanlhaihuikan_001    ${table_pvs1}    1

看了还会看sp
    公共-校验数据    ${sp}    zhengpian_003    ${table_sp}    1

*** Keywords ***
点播页上滑1
    comment    swipe    128    450    120    200
    swipe    200    600    200    270
    capture page screenshot

点播页饭团人气榜
    tap    相关饭团    380    10

频道下滑
    swipe    250    276    240    600
    capture page screenshot
