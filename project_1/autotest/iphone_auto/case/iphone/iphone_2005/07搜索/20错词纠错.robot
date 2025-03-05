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
错词纠错pvs
    [Setup]
    首页-搜索
    搜索首页－输入搜索词    太杨的后裔
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${pvs}    sousuo_jiucuo    ${table_pvs_search}    1

错词纠错search
    sleep    3
    公共-校验数据    ${search}    jiucuo_001    mpp_search_5_5_iphone    1

错词纠错结果检查
    sleep    3
    Page Should Contain Text    太阳的后裔

错词纠错view
    公共-校验数据    ${view}    jiucuo_001    mpp_view_5_5_iphone    1

纠错后切换标签
    公共－点击页面文本    综艺
    sleep    3
    Page Should Contain Text    太杨的后裔
