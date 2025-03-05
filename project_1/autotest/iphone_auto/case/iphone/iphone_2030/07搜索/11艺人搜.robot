*** Settings ***
Documentation     电影搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
艺人搜索pvs
    [Setup]
    首页-搜索
    搜索首页－输入搜索词    mgtest17
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

艺人搜索search
    公共-校验数据    ${search}    yiren_001    mpp_search_5_5_iphone    1

艺人搜索view
    公共-校验数据    ${view}    dianying_001    mpp_view_5_5_iphone    1

搜索结果返回首页pvs
    公共-删除数据
    搜索－取消
    sleep    3
    公共-校验数据    ${pvs}    sousuo_shouye1    ${table_pvs}    1

有空间艺人搜索pvs
    [Setup]
    首页-搜索
    搜索首页－输入搜索词    杨幂
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

有空间艺人搜索search
    公共-校验数据    ${search}    yiren_002    mpp_search_5_5_iphone    1

有空间艺人搜索view
    公共-校验数据    ${view}    mingxing_001    mpp_view_5_5_iphone    1

有空间艺人空间click
    公共-删除数据
    公共－点击页面文本    进入饭团
    sleep    4
    公共-校验数据    ${click}    yiren_002    mpp_click_5_5_iphone    1

有空间艺人空间pvs
    公共-校验数据    ${pvs}    sousuo_kongjian1    ${table_pvs}    1
