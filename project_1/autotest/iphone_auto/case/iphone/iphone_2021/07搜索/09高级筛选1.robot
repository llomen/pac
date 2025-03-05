*** Settings ***
Documentation     综艺推荐和搜索按钮搜索
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Test Setup
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}
${view}           {'act':'view'}
${click}          {'act':'click'}
${search}         {'act':'search'}

*** Test Cases ***
最新search
    首页-搜索
    搜索首页－输入搜索词    快乐大本营
    搜索-点击搜索
    公共－点击页面文本    筛选
    公共-删除数据
    公共－点击页面文本    最新
    sleep    3
    公共-校验数据    {'act':'search'}    zuixin_001    mpp_search_5_5_iphone    1

最新view
    公共-校验数据    ${view}    zuixin_001    mpp_view_5_5_iphone    1

最热search
    公共-删除数据
    公共－点击页面文本    最热
    sleep    3
    公共-校验数据    ${search}    zuire_001    mpp_search_5_5_iphone    1

最热view
    公共-校验数据    ${view}    zuire_001    mpp_view_5_5_iphone    1

0-10分钟search
    公共-删除数据
    公共－点击页面文本    0-10分钟
    sleep    3
    公共-校验数据    ${search}    0-10_001    mpp_search_5_5_iphone    1

0-10分钟view
    公共-校验数据    ${view}    0-10_001    mpp_view_5_5_iphone    1

10-30分钟search
    公共-删除数据
    公共－点击页面文本    10-30分钟
    sleep    3
    公共-校验数据    ${search}    10-30_001    mpp_search_5_5_iphone    1

10-30分钟view
    公共-校验数据    ${view}    10-30_001    mpp_view_5_5_iphone    1

30-60分钟search
    公共-删除数据
    公共－点击页面文本    30-60分钟
    sleep    3
    公共-校验数据    ${search}    30-60_001    mpp_search_5_5_iphone    1

30-60分钟view
    公共-校验数据    ${view}    30-60_001    mpp_view_5_5_iphone    1

大于60分钟search
    公共-删除数据
    公共－点击页面文本    60分钟以上
    sleep    3
    公共-校验数据    ${search}    60_001    mpp_search_5_5_iphone    1

大于60分钟view
    公共-校验数据    ${view}    60_001    mpp_view_5_5_iphone    1

1天search
    公共-删除数据
    公共－点击页面文本    一天
    sleep    3
    公共-校验数据    ${search}    oneday_001    mpp_search_5_5_iphone    1

1天view
    公共-校验数据    ${view}    oneday_001    mpp_view_5_5_iphone    1

1周search
    公共-删除数据
    公共－点击页面文本    一周
    sleep    3
    公共-校验数据    ${search}    oneweek_001    mpp_search_5_5_iphone    1

1周view
    公共-校验数据    ${view}    oneweek_001    mpp_view_5_5_iphone    1

1月search
    公共-删除数据
    公共－点击页面文本    一月
    sleep    3
    公共-校验数据    ${search}    onemonth_001    mpp_search_5_5_iphone    1

1月view
    公共-校验数据    ${view}    onemonth_001    mpp_view_5_5_iphone    1
