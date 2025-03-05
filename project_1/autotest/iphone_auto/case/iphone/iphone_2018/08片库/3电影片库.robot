*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${tagselect}      {'act':'tag-select'}
${list}           {'act':'list'}
${dataclick}      {'act':'data-click'}
${pvs}            {'act':'pvs'}

*** Test Cases ***
全部list
    首页-频道管理
    公共－点击页面文本    电影
    公共-删除数据
    sleep    2
    公共－xpath    //XCUIElementTypeButton[@name="全部"]
    sleep    2
    公共-校验数据    ${list}    pianku_dianying_001    mpp_pianku_list_iphone_dianying    1

进入片库show
    公共-校验数据    ${show}    index_pianku_01    ${table_show}    1

华语强档list
    公共-删除数据
    comment    公共－点击页面文本    华语强档
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "华语强档")]
    公共-校验数据    ${list}    pianku_dianying_002    mpp_pianku_list_iphone_dianying    1

切换标签show
    sleep    2
    公共-校验数据    ${show}    index_pianku_01    ${table_show}    1

VIP免费list
    公共-删除数据
    comment    公共－点击页面文本    VIP免费
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "VIP免费")]
    公共-校验数据    ${list}    pianku_dianying_004    mpp_pianku_list_iphone_dianying    1

评分list
    公共-删除数据
    comment    公共－点击页面文本    评分
    公共－xpath    //XCUIElementTypeStaticText[contains(@label, "评分")]
    公共-校验数据    ${list}    pianku_dianying_005    mpp_pianku_list_iphone_dianying    1

点第5个视频data-click
    公共-删除数据
    公共－点击页面文本    最好的我们
    公共-校验数据    ${dataclick}    pianku_dianying_004    mpp_pianku_dataclick_zuhe_iphone    1

点播页返回
    sleep    3
    公共-删除数据
    点播播放页-返回

其他页面返回show
    sleep    2
    公共-校验数据    ${show}    index_pianku_01    ${table_show}    1

点热搜跳搜索结果页pvs
    公共-删除数据
    公共－点击页面文本    周星驰
    公共-校验数据    ${pvs}    pianku_zongyi_003    ${table_pvs}    1

取消返回片库pvs
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pvs}    pianku_zongyi_004    ${table_pvs}    1

点搜索跳搜索页pvs
    公共-删除数据
    公共－点击页面文本    navigantionbar search
    公共-校验数据    ${pvs}    pianku_zongyi_005    ${table_pvs}    1

返回片库pvs
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pvs}    pianku_zongyi_006    ${table_pvs}    1

*** Keywords ***
片库下拉刷新
    swipe    150    300    0    150
