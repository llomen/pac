*** Settings ***
Documentation     电视剧搜索
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
动漫pvs
    [Setup]
    首页-搜索
    搜索首页－输入搜索词    宝宝巴士儿歌
    公共-删除数据
    搜索-点击搜索
    sleep    2
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

动漫search
    公共-校验数据    ${search}    dianshi_002    mpp_search_5_5_iphone    1

动漫view
    公共-校验数据    ${view}    dianshi_001    mpp_view_5_5_iphone    1

动漫click
    公共-删除数据
    搜索-点击剧集的集数
    sleep    3
    公共-校验数据    ${click}    dianshi_001    mpp_click_5_5_iphone    1

动漫播放pvs
    公共-校验数据    ${pvs}    soudianshi_002    ${table_pvs_dianbo}    1

动漫播放返回pvs
    公共-删除数据
    点播播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    soudianshiju_002    ${table_pvs_search}    1

搜素结果返回搜素首页pvs
    公共-删除数据
    搜索－x
    sleep    2
    公共-校验数据    ${pvs}    sousuo_003    ${table_pvs_search}    1

热门搜索search
    Comment    下滑
    Comment    sleep    2
    公共-删除数据
    公共－点击页面文本    1
    sleep    2
    公共-校验数据    ${search}    remen_001    mpp_search_5_5_iphone    1

热门搜索view
    公共-校验数据    ${view}    remen_001    mpp_view_5_5_iphone    1

热门搜素结果返回搜素首页pvs
    公共-删除数据
    搜索－x
    sleep    2
    公共-校验数据    ${pvs}    sousuo_003    ${table_pvs_search}    1

返回首页pvs
    公共-删除数据
    搜索－取消
    sleep    2
    公共-校验数据    ${pvs}    sousuo_007    ${table_pvs}    1

电视剧pvs
    [Setup]
    首页-搜索
    搜索首页－输入搜索词    楚乔传
    公共-删除数据
    搜索-点击搜索
    sleep    2
    公共-校验数据    ${pvs}    sousuo_002    ${table_pvs_search}    1

电视剧search
    公共-校验数据    ${search}    dianshi_003    mpp_search_5_5_iphone    1

电视剧view
    公共-校验数据    ${view}    dianshi_001    mpp_view_5_5_iphone    1

电视剧上传视频click
    公共-删除数据
    公共－点击页面文本    电影
    公共－点击页面文本    微电影《茉莉之恋》发布会：杨洋赵丽颖大谈《楚乔传》和《三生》趣事
    sleep    3
    公共-校验数据    ${click}    dianshi_shangchuan    mpp_click_5_5_iphone    1

电视剧上传视频action
    sleep    3
    #公共-校验数据    ${action}    dianshi_shangchuan    mpp_action_5_5_iphone    1
