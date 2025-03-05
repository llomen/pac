*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Test Cases ***
精选pvs
    首页-我
    公共-删除数据
    首页-精选
    公共-校验数据    ${pvs}    shouye_001    ${table_pvs}    1

精选pvs1
    公共-校验数据    ${pvs1}    shouye_001    ${table_pvs1}    1

频道管理pvs
    公共-删除数据
    首页-频道管理
    公共-校验数据    ${pvs}    pingdao_001    ${table_pvs}    0

频道管理pvs1
    公共-校验数据    ${pvs1}    pingdao_001    ${table_pvs1}    0

频道管理cv
    公共-校验数据    ${cv}    channel_01    ${table_cv}    1

频道管理返回pvs
    公共-删除数据
    频道管理-返回
    公共-校验数据    ${pvs}    pingdao_002    ${table_pvs}    0

频道管理返回pvs1
    公共-校验数据    ${pvs1}    pingdao_002    ${table_pvs1}    0

综艺pvs
    公共-删除数据
    sleep    2
    频道页-切换tab    综艺
    公共-校验数据    ${pvs}    zongyi_001    ${table_pvs}    1

综艺pvs1
    公共-校验数据    ${pvs1}    zongyi_001    ${table_pvs1}    1

综艺页pmm
    公共-校验数据    {'act':'pmm'}    iphone_zongyi    mpp_livepmm_5_iphone    1

左滑到电视剧频道pvs
    公共-删除数据
    频道左滑
    公共-校验数据    ${pvs}    dianshiju_001    ${table_pvs}    1

左滑到电视剧频道pvs1
    公共-校验数据    ${pvs1}    dianshiju_001    ${table_pvs1}    1

右滑回综艺频道pvs
    公共-删除数据
    频道右滑
    公共-校验数据    ${pvs}    dianshiju_004    ${table_pvs}    1

右滑到电视剧频道pvs1
    公共-校验数据    ${pvs1}    dianshiju_004    ${table_pvs1}    1

电视剧pvs
    公共-删除数据
    sleep    2
    频道页-切换tab    电视剧
    公共-校验数据    ${pvs}    dianshiju_001    ${table_pvs}    1

电视剧pvs1
    公共-校验数据    ${pvs1}    dianshiju_001    ${table_pvs1}    1

电视剧pd
    公共-校验数据    ${pd}    pd_1    ${table_click}    1

电视剧页pmm
    公共-校验数据    {'act':'pmm'}    iphone_dianshiju    mpp_livepmm_5_iphone    1

电视剧片库pvs
    公共-删除数据
    频道页-全部
    公共-校验数据    ${pvs}    dianshiju_002    ${table_pvs}    1

电视剧片库pvs1
    公共-校验数据    ${pvs1}    dianshiju_002    ${table_pvs1}    1

电视剧片库返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    dianshiju_003    ${table_pvs}    1

电视剧片库返回pvs1
    公共-校验数据    ${pvs1}    dianshiju_003    ${table_pvs1}    1

电影pvs
    公共-删除数据
    sleep    2
    频道页-切换tab    电影
    公共-校验数据    ${pvs}    dianying_001    ${table_pvs}    1

电影pvs1
    公共-校验数据    ${pvs1}    dianying_001    ${table_pvs1}    1

电影页pmm
    公共-校验数据    {'act':'pmm'}    iphone_dianying    mpp_livepmm_5_iphone    1

电影片库pvs
    公共-删除数据
    频道页-全部
    公共-校验数据    ${pvs}    dianying_002    ${table_pvs}    1

电影片库pvs1
    公共-校验数据    ${pvs1}    dianying_002    ${table_pvs1}    1

电影片库返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    dianying_003    ${table_pvs}    1

电影片库返回pvs1
    公共-校验数据    ${pvs1}    dianying_003    ${table_pvs1}    1

少儿pvs
    首页-频道管理
    comment    公共－点击页面文本    直播
    公共-删除数据
    频道页-切换tab    少儿
    公共-校验数据    ${pvs}    shaoer_001    ${table_pvs}    1

少儿pvs1
    公共-校验数据    ${pvs1}    shaoer_001    ${table_pvs1}    1

少儿页pmm
    公共-校验数据    {'act':'pmm'}    iphone_shaoer    mpp_livepmm_5_iphone    1

动漫pvs
    公共-删除数据
    频道页-切换tab    动漫
    公共-校验数据    ${pvs}    dongman_001    ${table_pvs}    1

动漫pvs1
    公共-校验数据    ${pvs1}    dongman_001    ${table_pvs1}    1

动漫页pmm
    公共-校验数据    {'act':'pmm'}    iphone_dongman    mpp_livepmm_5_iphone    1

动漫片库pvs
    公共-删除数据
    sleep    2
    频道页-全部
    公共-校验数据    ${pvs}    dongman_002    ${table_pvs}    1

动漫片库pvs1
    公共-校验数据    ${pvs1}    dongman_002    ${table_pvs1}    1

动漫片库返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    dongman_003    ${table_pvs}    1

动漫片库返回pvs1
    公共-校验数据    ${pvs1}    dongman_003    ${table_pvs1}    1

新闻pvs
    公共-删除数据
    频道页-切换tab    新闻
    公共-校验数据    {'act':'pvs','cpid':'94'}    xinwen_001    ${table_pvs}    1

进入新闻频道pvs1
    公共-校验数据    {'logtype':'pv','cntp':'ch_channel'}    xinwen_001    ${table_pvs1}    1

进入新闻频道-推荐pvs
    公共-校验数据    {'act':'pvs','cpid':'100001'}    pingdao_003    ${table_pvs}    1

进入新闻频道-推荐pvs1
    公共-校验数据    {'logtype':'pv','cntp':'ch_newRec'}    pingdao_003    ${table_pvs1}    1

新闻页pmm
    公共-校验数据    {'act':'pmm'}    iphone_xinwen    mpp_livepmm_5_iphone    1

纪录片pvs
    公共-删除数据
    频道页-切换tab    纪录片
    公共-校验数据    ${pvs}    jilupian_001    ${table_pvs}    1

纪录片pvs1
    公共-校验数据    ${pvs1}    jilupian_001    ${table_pvs1}    1

纪录片页pmm
    公共-校验数据    {'act':'pmm'}    iphone_jilupian    mpp_livepmm_5_iphone    1

娱乐pvs
    公共-删除数据
    sleep    2
    频道页-切换tab    娱乐
    公共-校验数据    ${pvs}    dianshiju_005    ${table_pvs}    1

娱乐pvs1
    公共-校验数据    ${pvs1}    dianshiju_005    ${table_pvs1}    1

娱乐页pmm
    公共-校验数据    {'act':'pmm'}    iphone_yuanchuang    mpp_livepmm_5_iphone    1

生活pvs
    公共-删除数据
    sleep    2
    频道页-切换tab    生活
    公共-校验数据    ${pvs}    dianshiju_005    ${table_pvs}    1

生活pvs1
    公共-校验数据    ${pvs1}    dianshiju_005    ${table_pvs1}    1

生活页pmm
    公共-校验数据    {'act':'pmm'}    iphone_yuanchuang    mpp_livepmm_5_iphone    1

教育pvs
    公共-删除数据
    频道页-切换tab    教育
    公共-校验数据    ${pvs}    dianshiju_005    ${table_pvs}    1

教育pvs1
    公共-校验数据    ${pvs1}    dianshiju_005    ${table_pvs1}    1

教育页pmm
    公共-校验数据    {'act':'pmm'}    iphone_aidou    mpp_livepmm_5_iphone    1

投教pvs
    公共-删除数据
    频道页-切换tab    投教
    公共-校验数据    ${pvs}    dianshiju_005    ${table_pvs}    1

投教pvs1
    公共-校验数据    ${pvs1}    dianshiju_005    ${table_pvs1}    1

投教页pmm
    公共-校验数据    {'act':'pmm'}    iphone_lehuo    mpp_livepmm_5_iphone    1

音乐pvs
    公共-删除数据
    频道页-切换tab    音乐
    公共-校验数据    ${pvs}    dianshiju_005    ${table_pvs}    1

音乐pvs1
    公共-校验数据    ${pvs1}    dianshiju_005    ${table_pvs1}    1

音乐页pmm
    公共-校验数据    {'act':'pmm'}    iphone_yinyue    mpp_livepmm_5_iphone    1

时尚pvs
    公共-删除数据
    频道页-切换tab    时尚
    公共-校验数据    ${pvs}    dianshiju_005    ${table_pvs}    1

时尚pvs1
    公共-校验数据    ${pvs1}    dianshiju_005    ${table_pvs1}    1

时尚页pmm
    公共-校验数据    {'act':'pmm'}    iphone_tiyu    mpp_livepmm_5_iphone    1
