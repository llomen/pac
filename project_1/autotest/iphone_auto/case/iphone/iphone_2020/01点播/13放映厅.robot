*** Settings ***
Documentation     正片、花絮、相关饭团、看了还会看
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pfc}            {'act':'pfc'}

*** Test Cases ***
频道进入放映厅pvs
    sleep    3
    首页-搜索
    搜索首页－输入搜索词    明星大侦探5 互动版
    搜索－点击搜索
    公共-删除数据
    公共－点击页面文本    2019-12-21 范丞丞陷入迷局等你来解救！
    公共-校验数据    ${pvs}    hudongju_001    ${table_pvs_dianbo}    1

频道进入放映厅pvs1
    公共-校验数据    ${pvs1}    hudongju_001    ${table_pvs1}    1

放映厅aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

buffer
    公共-校验数据    ${buffer}    iphone_001    ${table_buffer}    1

cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    1

定时上报cdn-r1
    公共-校验数据    ${r1}    aphone_dianbo_1    mpp_cdnq_5_iphone    1

3hb
    公共-校验数据    ${hb3}    bodan_3    ${table_hb_sdk}    1

5hb
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

热聊tab曝光show
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

切换tab明星来了show
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

切换tab明星来了pv
    公共-校验数据    ${pvs}    hudongju_001    ${table_pvs}    1

切换tab活动show
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

切换tab活动pv
    公共-校验数据    ${pvs}    hudongju_001    ${table_pvs}    1

切换tab排片表show
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

切换tab排片表pvs
    公共-校验数据    ${pvs}    hudongju_001    ${table_pvs}    1

排播表跳频道pvs
    #先跳频道，频道再跳点播页
    公共-校验数据    ${pvs}    hudongju_001    ${table_pvs}    1

频道跳点播页pvs
    公共-校验数据    ${pvs}    hudongju_001    ${table_pvs}    1

排播表跳频道pvs1
    公共-校验数据    ${pvs1}    hudongju_001    ${table_pvs1}    1

频道跳点播页pvs1
    公共-校验数据    ${pvs1}    hudongju_001    ${table_pvs1}    1

切换下一个视频hb
    sleep    3
    公共-校验数据    ${hb_end}    dianboxiayige_001    ${table_hb_sdk}    1

定时上报cdn-r3
    公共-校验数据    ${r3}    aphone_dianbo_1    mpp_cdnq_5_iphone    1

再次进入放映厅

切换影厅show
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

点击影厅pjr
    公共-校验数据    ${pjr}    air-button_click    ${table_click}    1
