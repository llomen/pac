*** Settings ***
Documentation     播放列表3
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot

*** Variables ***
${hb3}            {'act':'hb','ht':'0'}
${hb5}            {'act':'hb','ht':'1'}
${hb15}           {'act':'hb','ht':'3'}
${hb45}           {'act':'hb','ht':'4'}
${hb60}           {'act':'hb','ht':'5'}
${hb180}          {'act':'hb','ht':'6'}
${hb_end}         {'act':'hb','ht':'2'}
${aplay}          {'act':'aplay'}
${buffer}         {'act':'buffer'}

*** Test Cases ***
点播3hb
    公共-删除数据
    首页-搜索
    搜索首页－输入搜索词    ${longfilm}
    搜索－点击搜索
    sleep    3
    搜索-点击播放
    sleep    20
    公共-校验数据    ${hb3}    film_3    ${table_hb_sdk}    1

点播5hb
    公共-校验数据    ${hb5}    film_5    ${table_hb_sdk}    1

点播15hb
    sleep    3
    公共-校验数据    ${hb15}    film_15    ${table_hb_sdk}    1

点播45hb
    sleep    33
    公共-校验数据    ${hb45}    film_45    ${table_hb_sdk}    1

点播60hb
    sleep    20
    公共-校验数据    ${hb60}    film_60    ${table_hb_sdk}    1

点播180hb
    sleep    120
    公共-校验数据    ${hb180}    film_180    ${table_hb_sdk}    1

播放页列表跳转播放aplay
    公共-删除数据
    公共－点击页面文本    猫仙主动替霖之解围
    sleep    10
    公共-校验数据    ${aplay}    dianboliebiao_001    ${table_vv}    1

sdkload
    公共-校验数据    {'act':'sdkload'}    dianbo_005    mpp_sdkload_iphone    1

播放页列表跳转播放buffer
    公共-校验数据    ${buffer}    dianboliebiao_001    ${table_buffer}    1

播放页列表跳转播放hb
    公共-校验数据    ${hb_end}    film_end    ${table_hb_sdk}    1

*** Keywords ***
上滑
    ${x1} =    evaluate    ${屏幕宽度}*0.4
    ${y1} =    evaluate    ${屏幕高度}*0.8
    ${x2} =    evaluate    0
    ${y2} =    evaluate    -${屏幕高度}*0.3
    log    ${x1},${y1},${x2},${y2}
    swipe    ${x1}    ${y1}    ${x2}    ${y2}
