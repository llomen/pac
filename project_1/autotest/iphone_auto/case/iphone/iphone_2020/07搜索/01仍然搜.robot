*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
搜索首页pvs
    [Setup]
    sleep    5
    公共-删除数据
    首页-搜索
    公共-校验数据    ${pvs}    sousuo_001    ${table_pvs_search}    1

搜索首页pvs1
    公共-校验数据    ${pvs1}    sousuo_001    ${table_pvs1}    1

search按钮搜索search
    搜索首页－输入搜索词    kuaile
    公共-删除数据
    搜索－点击搜索
    sleep    3
    公共-校验数据    ${search}    button_001    mpp_search_5_5_iphone    1

search按钮搜索view
    sleep    3
    公共-校验数据    ${view}    button_001    mpp_view_5_5_iphone    1

搜索结果pvs
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

搜索结果pvs1
    公共-校验数据    ${pvs1}    sousuo_002    ${table_pvs1}    1

综艺合集click
    公共-删除数据
    搜索-点击播放
    sleep    3
    公共-校验数据    ${click}    zongyi_001    mpp_click_5_5_iphone    1

搜索播放pvs
    公共-校验数据    ${pvs}    sousuo_bofang    ${table_pvs_dianbo}    1

搜索播放pvs1
    公共-校验数据    ${pvs1}    sousuo_bofang    ${table_pvs1}    1

搜索播放返回pvs
    Comment    公共－点击坐标点    50    40
    公共-删除数据
    点播播放页-返回
    sleep    3
    公共-校验数据    ${pvs}    sousuo_bofang1    ${table_pvs_search}    1

搜索播放返回pvs1
    公共-校验数据    ${pvs1}    sousuo_bofang1    ${table_pvs1}    1

翻页后点击合集click
    公共－点击页面文本    王宝强
    公共-删除数据
    sleep    1
    点击不可见文本    王宝强小岳岳演技感人遭吐槽
    sleep    2
    公共-校验数据    ${click}    fanye_001    mpp_click_5_5_iphone    1

翻页后点击合集action
    公共-校验数据    ${action}    fanye_001    mpp_action_5_5_iphone    1

视频播放返回pvs
    点播播放页-返回

仍然搜search
    公共-删除数据
    搜索－仍然搜索
    sleep    5
    公共-校验数据    ${search}    rengran_001    mpp_search_5_5_iphone    1

仍然搜view
    公共-校验数据    ${view}    rengran_001    mpp_view_5_5_iphone    1

退出搜索页pvs
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pvs}    quxiao_001    ${table_pvs_search}    1

退出搜索页pvs1
    公共-校验数据    ${pvs1}    quxiao_001    ${table_pvs1}    1
