*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Test Cases ***
精选页pmm
    #公共-校验数据    {'act':'pmm'}    iphone_jingxuan    mpp_livepmm_5_iphone    1

综艺页pmm
    公共-删除数据
    频道页-切换tab    综艺
    公共-校验数据    {'act':'pmm'}    iphone_zongyi    mpp_livepmm_5_iphone    1

电视剧页pmm
    公共-删除数据
    频道页-切换tab    电视剧
    公共-校验数据    {'act':'pmm'}    iphone_dianshiju    mpp_livepmm_5_iphone    1

电影页pmm
    公共-删除数据
    频道页-切换tab    电影
    sleep    3
    公共-校验数据    {'act':'pmm'}    iphone_dianying    mpp_livepmm_5_iphone    1

少儿页pmm
    频道页-切换tab    直播
    公共-删除数据
    sleep    3
    频道页-切换tab    少儿
    公共-校验数据    {'act':'pmm'}    iphone_shaoer    mpp_livepmm_5_iphone    1

动漫页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    动漫
    公共-校验数据    {'act':'pmm'}    iphone_dongman    mpp_livepmm_5_iphone    1

新闻页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    新闻
    公共-校验数据    {'act':'pmm'}    iphone_xinwen    mpp_livepmm_5_iphone    1

纪录片页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    纪录片
    公共-校验数据    {'act':'pmm'}    iphone_jilupian    mpp_livepmm_5_iphone    1

游戏页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    游戏
    公共-校验数据    {'act':'pmm'}    iphone_yuanchuang    mpp_livepmm_5_iphone    1

原创页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    原创
    公共-校验数据    {'act':'pmm'}    iphone_yuanchuang    mpp_livepmm_5_iphone    1

爱豆页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    爱豆
    公共-校验数据    {'act':'pmm'}    iphone_aidou    mpp_livepmm_5_iphone    1

乐活页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    乐活
    公共-校验数据    {'act':'pmm'}    iphone_lehuo    mpp_livepmm_5_iphone    1

教育页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    教育
    公共-校验数据    {'act':'pmm'}    iphone_jiaoyu    mpp_livepmm_5_iphone    1

音乐页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    音乐
    公共-校验数据    {'act':'pmm'}    iphone_yinyue    mpp_livepmm_5_iphone    1

体育页pmm
    公共-删除数据
    sleep    3
    频道页-切换tab    体育
    公共-校验数据    {'act':'pmm'}    iphone_tiyu    mpp_livepmm_5_iphone    1
