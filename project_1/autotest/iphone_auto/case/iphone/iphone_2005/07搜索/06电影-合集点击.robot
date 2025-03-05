*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}

*** Test Cases ***
电影搜索search
    sleep    5
    首页-搜索
    搜索首页－输入搜索词    叶问外传
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${search}    dianying_001    mpp_search_5_5_iphone    1

电影搜索view
    公共-校验数据    ${view}    dianying_001    mpp_view_5_5_iphone    1

电影搜索click
    搜索-点击播放
    sleep    2
    公共-校验数据    ${click}    dianying_001    mpp_click_5_5_iphone    1
