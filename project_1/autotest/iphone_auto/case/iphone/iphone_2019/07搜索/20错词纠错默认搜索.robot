*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${word1}          hxs
${word2}          好先生

*** Test Cases ***
错词纠错pvs
    [Setup]
    首页-搜索
    公共-删除数据
    搜索首页－输入搜索词    ${word1}
    搜索-点击搜索
    sleep    3
    公共-校验数据    ${pvs}    sousuo_jiucuo    ${table_pvs_search}    1

错词纠错search
    sleep    3
    公共-校验数据    ${search}    jiucuo_001    mpp_search_5_5_iphone    1

错词纠错view
    公共-校验数据    ${view}    jiucuo_001    mpp_view_5_5_iphone    1

错词纠错结果检查
    Page Should Contain Element    ${word2}

仍搜索pvs
    公共-删除数据
    公共－点击页面文本    ${word1}
    sleep    2
    公共-校验数据    ${pvs}    sousuo_005    ${table_pvs_search}    1

仍搜索pvs1
    公共-校验数据    ${pvs1}    sousuo_005    ${table_pvs1}    1

仍搜索search
    sleep    3
    公共-校验数据    ${search}    jiucuo_002    mpp_search_5_5_iphone    1

仍搜索view
    公共-校验数据    ${view}    jiucuo_001    mpp_view_5_5_iphone    1

默认搜索search
    搜索－取消
    首页-搜索
    公共-删除数据
    搜索-点击搜索
    sleep    3
    公共-校验数据    ${search}    jiucuo_003    mpp_search_5_5_iphone    1

默认搜索view
    公共-校验数据    ${view}    jiucuo_001    mpp_view_5_5_iphone    1
