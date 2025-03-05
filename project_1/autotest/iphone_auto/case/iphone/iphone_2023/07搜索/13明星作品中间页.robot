*** Settings ***
Documentation     明星搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Force Tags        smoke
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${action}         {'act':'action'}

*** Test Cases ***
明星且艺人搜索pvs
    [Setup]
    首页-搜索
    搜索首页－输入搜索词    杨幂
    公共-删除数据
    搜索-点击搜索
    sleep    5
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

明星且艺人搜索search
    公共-校验数据    ${search}    mingyi_001    mpp_search_5_5_iphone    1

明星且艺人搜索view
    公共-校验数据    ${view}    mingxing_001    mpp_view_5_5_iphone    1

更多作品click
    公共-删除数据
    搜索-点击更多作品
    sleep    4
    公共-校验数据    ${click}    mingyi_001    mpp_click_5_5_iphone    1

进入作品中间页pvs
    公共-校验数据    ${pvs}    yuanci_003    ${table_pvs_search}    1

进入作品中间页pvs1
    公共-校验数据    ${pvs1}    yuanci_003    ${table_pvs1}    1

中间页-明星作品点击action
    公共-删除数据
    点击不可见文本    谈判官
    sleep    2
    公共-校验数据    ${action}    zhongjianye_dianji    mpp_action_5_5_iphone    1

明星作品中间页进点播页pvs
    公共-校验数据    ${pvs}    yuanci_006    ${table_pvs_dianbo}    1

明星作品中间页进点播页pvs1
    公共-校验数据    ${pvs1}    yuanci_006    ${table_pvs1}    1

点播页返回明星作品中间页pvs
    公共-删除数据
    sleep    2
    点播播放页-返回
    公共-校验数据    ${pvs}    yuanci_007    ${table_pvs}    1

点播页返回明星作品中间页pvs1
    公共-校验数据    ${pvs1}    yuanci_007    ${table_pvs1}    1

中间页切换tab综艺pvs
    公共-删除数据
    公共－点击页面文本    综艺
    sleep    2
    公共-校验数据    ${pvs}    yuanci_004    ${table_pvs_search}    1

中间页切换tab综艺pvs1
    公共-校验数据    ${pvs1}    yuanci_004    ${table_pvs1}    1

中间页切换tab综艺action
    公共-校验数据    ${action}    zhongjianye_dianji    mpp_action_5_5_iphone    1

中间页切换tab电影pvs
    公共-删除数据
    公共－点击页面文本    电影
    sleep    2
    公共-校验数据    ${pvs}    yuanci_005    ${table_pvs_search}    1

中间页切换tab电影pvs1
    公共-校验数据    ${pvs1}    yuanci_005    ${table_pvs1}    1

中间页切换tab电影action
    公共-校验数据    ${action}    zhongjianye_dianji    mpp_action_5_5_iphone    1

作品中间页返回搜索结果页pvs
    公共-删除数据
    非播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    yuanci_008    ${table_pvs}    1

作品中间页返回搜索结果页pvs1
    公共-校验数据    ${pvs1}    yuanci_008    ${table_pvs1}    1

结果页点热门作品click
    公共-删除数据
    点击不可见文本    谈判官
    sleep    4
    公共-校验数据    ${click}    mingyi_002    mpp_click_5_5_iphone    1

结果页-热门作品pvs
    公共-校验数据    ${pvs}    sousuo_dongtai2    ${table_pvs}    1

结果页-热门作品pvs1
    公共-校验数据    ${pvs1}    sousuo_dongtai2    ${table_pvs1}    1
