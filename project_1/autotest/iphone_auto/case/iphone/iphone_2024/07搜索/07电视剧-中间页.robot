*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        smoke
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
电视剧search
    首页-搜索
    搜索首页－输入搜索词    青云志
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${search}    dianshi_001    mpp_search_5_5_iphone    1

电视剧view
    公共-校验数据    ${view}    dianshi_001    mpp_view_5_5_iphone    1

电视剧click
    公共-删除数据
    搜索-点击剧集的...
    sleep    2
    公共-校验数据    ${click}    dianshi_shenglvehao    mpp_click_5_5_iphone    1

电视剧action
    公共-校验数据    ${action}    zongyi_kongjian    mpp_action_5_5_iphone    1

中间页pvs
    公共-校验数据    ${pvs}    soudianshiju_zhongjianye    ${table_pvs_search}    1

中间页pvs1
    公共-校验数据    ${pvs1}    soudianshiju_zhongjianye    ${table_pvs1}    1

中间页点击pvs
    公共-删除数据
    搜索-中间页点击集数
    sleep    2
    公共-校验数据    ${pvs}    zhongjianye_xuanjidian    ${table_pvs_dianbo}    1

中间页点击pvs1
    公共-校验数据    ${pvs1}    zhongjianye_xuanjidian    ${table_pvs1}    1

中间页点击click
    sleep    2
    公共-校验数据    ${click}    zhongjianye_jujidian    mpp_click_5_5_iphone    0
