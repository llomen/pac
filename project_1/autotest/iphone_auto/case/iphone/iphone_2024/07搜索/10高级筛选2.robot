*** Settings ***
Documentation     综艺推荐和搜索按钮搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}

*** Test Cases ***
进入空间click
    首页-搜索
    搜索首页－输入搜索词    快乐大本营
    搜索-点击搜索
    公共-删除数据
    公共－点击页面文本    进入饭团
    sleep    2
    公共-校验数据    ${click}    shaixuan_kongjian    mpp_click_5_5_iphone    1

进入空间pvs
    公共-校验数据    ${pvs}    sousuo_kongjian3    ${table_pvs}    1

进入空间pvs1
    公共-校验数据    ${pvs1}    sousuo_kongjian3    ${table_pvs1}    1

进入空间返回
    非播放页-返回

综艺search
    公共-删除数据
    公共－点击页面文本    综艺
    sleep    2
    公共-校验数据    ${search}    zongyi_002    mpp_search_5_5_iphone    1

综艺view
    公共-校验数据    ${view}    zongyi_002    mpp_view_5_5_iphone    1

综艺pv
    公共-校验数据    ${pvs}    gaoshai_001    ${table_pvs_search}    1

电视剧search
    公共-删除数据
    公共－点击页面文本    电视剧
    sleep    3
    公共-校验数据    ${search}    dianshiju_002    mpp_search_5_5_iphone    1

电视剧view
    公共-校验数据    ${view}    dianshiju_002    mpp_view_5_5_iphone    1

电视剧pvs
    公共-校验数据    ${pvs}    gaoshai_002    ${table_pvs_search}    1

电视剧pvs1
    公共-校验数据    ${pvs1}    gaoshai_002    ${table_pvs1}    1

电影search
    公共-删除数据
    公共－点击页面文本    电影
    sleep    3
    公共-校验数据    ${search}    dianying_002    mpp_search_5_5_iphone    1

电影view
    公共-校验数据    ${view}    dianying_002    mpp_view_5_5_iphone    1

电影pvs
    公共-校验数据    ${pvs}    gaoshai_003    ${table_pvs_search}    1

电影pvs1
    公共-校验数据    ${pvs1}    gaoshai_003    ${table_pvs1}    1

动漫search
    公共-删除数据
    公共－点击页面文本    动漫
    sleep    3
    公共-校验数据    ${search}    dongman_002    mpp_search_5_5_iphone    1

动漫view
    公共-校验数据    ${view}    dongman_002    mpp_view_5_5_iphone    1

动漫pvs
    公共-校验数据    ${pvs}    gaoshai_004    ${table_pvs_search}    1

动漫pvs1
    公共-校验数据    ${pvs1}    gaoshai_004    ${table_pvs1}    1

音乐search
    公共-删除数据
    公共－点击页面文本    音乐
    sleep    3
    公共-校验数据    ${search}    yinyue_002    mpp_search_5_5_iphone    1

音乐view
    公共-校验数据    ${view}    yinyue_002    mpp_view_5_5_iphone    1

音乐pvs
    公共-校验数据    ${pvs}    gaoshai_005    ${table_pvs_search}    1

音乐pvs1
    公共-校验数据    ${pvs1}    gaoshai_005    ${table_pvs1}    1

纪录片search
    公共-删除数据
    公共－点击页面文本    纪录片
    sleep    3
    公共-校验数据    ${search}    jilupian_002    mpp_search_5_5_iphone    1

纪录片view
    公共-校验数据    ${view}    jilupian_002    mpp_view_5_5_iphone    1

纪录片pv
    公共-校验数据    ${pvs}    gaoshai_006    ${table_pvs_search}    1

新闻search
    公共-删除数据
    公共－点击页面文本    新闻
    sleep    3
    公共-校验数据    ${search}    xinwen_002    mpp_search_5_5_iphone    1

新闻view
    公共-校验数据    ${view}    xinwen_002    mpp_view_5_5_iphone    1

新闻pv
    公共-校验数据    ${pvs}    gaoshai_007    ${table_pvs_search}    1

原创search
    公共-删除数据
    公共－点击页面文本    原创
    sleep    3
    公共-校验数据    ${search}    yuanchuang_002    mpp_search_5_5_iphone    1

原创view
    公共-校验数据    ${view}    yuanchuang_002    mpp_view_5_5_iphone    1

原创pv
    公共-校验数据    ${pvs}    gaoshai_008    ${table_pvs_search}    1

生活search
    公共-删除数据
    公共－点击页面文本    生活
    sleep    3
    公共-校验数据    ${search}    shenghuo_002    mpp_search_5_5_iphone    1

生活view
    公共-校验数据    ${view}    shenghuo_002    mpp_view_5_5_iphone    1

生活pv
    公共-校验数据    ${pvs}    gaoshai_009    ${table_pvs_search}    1

教育search
    公共-删除数据
    公共－点击页面文本    教育
    sleep    3
    公共-校验数据    ${search}    jiaoyu_002    mpp_search_5_5_iphone    1

教育view
    公共-校验数据    ${view}    jiaoyu_002    mpp_view_5_5_iphone    1

教育pv
    公共-校验数据    ${pvs}    gaoshai_010    ${table_pvs_search}    1

体育search
    公共-删除数据
    公共－点击页面文本    体育
    sleep    3
    公共-校验数据    ${search}    tiyu_002    mpp_search_5_5_iphone    1

体育view
    公共-校验数据    ${view}    tiyu_002    mpp_view_5_5_iphone    1

体育pv
    公共-校验数据    ${pvs}    gaoshai_011    ${table_pvs_search}    1
