*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${newsfeedclick}    {'act':'newsfeedclick'}
${newsfeedshow}    {'act':'newsfeedshow'}
${table_chnewsclick}    mpp_ip_chfeedclick_1
${table_chnewshow}    mpp_ip_chfeedclick_1

*** Test Cases ***
进入新闻频道pvs
    首页-频道管理
    公共-删除数据
    公共－点击页面文本    新闻
    公共-校验数据    {'act':'pvs','cpid':'94'}    fantuan_pindao_001    ${table_pvs}    1

进入新闻频道pvs1
    公共-校验数据    {'logtype':'pv','cntp':'ch_channel'}    fantuan_pindao_001    ${table_pvs1}    1

进入新闻频道-推荐pvs
    公共-校验数据    {'act':'pvs','cpid':'100001'}    fantuan_pindao_001    ${table_pvs}    1

进入新闻频道-推荐pvs1
    公共-校验数据    {'logtype':'pv','cntp':'ch_newRec'}    fantuan_pindao_001    ${table_pvs1}    1

切换发现tab页pvs
    公共-删除数据
    公共－点击页面文本    发现
    公共-校验数据    ${pvs}    fantuan_pindao_001    ${table_pvs}    1

切换发现tab页pvs1
    公共-校验数据    ${pvs1}    fantuan_pindao_001    ${table_pvs1}    1

发现页曝光newsfeedshow
    公共-校验数据    ${newsfeedshow}    chhotshow_001    ${table_chnewsclick}    1

发现页-点视频播放newsfeedclick
    公共-删除数据
    新闻频道-点播放
    sleep    30
    公共-校验数据    ${newsfeedclick}    chhotshow_001    ${table_chnewsclick}    1

buff
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

cdn1
    公共-校验数据    ${cdn1}    aphone_dianbo_001    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    aphone_dianbo_002    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    aphone_dianbo_003    mpp_cdn_5_iphone    1

cdn-r1
    公共-校验数据    ${r1}    aphone_dianbo_1    mpp_cdnq_5_iphone    1

3hb
    公共-校验数据    ${hb3}    bodan_3    ${table_hb_sdk}    1

5hb
    公共-校验数据    ${hb5}    bodan_5    ${table_hb_sdk}    1

15hb
    公共-校验数据    ${hb15}    bodan_5    ${table_hb_sdk}    1

hb_end
    公共-校验数据    ${hb_end}    bodan_5    ${table_hb_sdk}    1

cdn-r3
    sleep    2
    公共-校验数据    ${r3}    aphone_dianbo_3    mpp_cdnq_5_iphone    1

看正片newsfeedclick
    公共-删除数据
    按坐标点击元素    xpath=(//XCUIElementTypeButton[@name="ShortVideo Pause iCON"])[1]
    sleep    3
    公共-校验数据    ${newsfeedclick}    chhotshow_001    ${table_chnewsclick}    1

点正片跳点播页pvs
    公共-校验数据    ${pvs}    fantuan_pindao_001    ${table_pvs_dianbo}    1

点正片跳点播页pvs1
    公共-校验数据    ${pvs1}    fantuan_pindao_001    ${table_pvs1}    1

返回新闻页pvs1
    #旧版pv存在遗留问题，会上报3个pv，暂不校验
    公共-删除数据
    点播播放页-返回
    公共-校验数据    {'logtype':'pv','cntp':'ch_channel'}    fantuan_pindao_001    ${table_pvs1}    1

返回新闻发现页pvs1
    公共-校验数据    {'logtype':'pv','cntp':'ch_newRec'}    fantuan_pindao_001    ${table_pvs1}    1

点标题newsfeedclick
    公共-删除数据
    新闻频道-点播放
    公共-校验数据    ${newsfeedclick}    chhotshow_001    ${table_chnewsclick}    1

返回发现页
    点播播放页-返回

切换到推荐tab页pvs
    公共-删除数据
    公共－点击页面文本    推荐
    公共-校验数据    ${pvs}    fantuan_pindao_001    ${table_pvs}    1

切换到推荐tab页pvs1
    公共-校验数据    ${pvs1}    fantuan_pindao_001    ${table_pvs1}    1

点视频进点播页pvs
    上滑
    公共－点击页面文本    湘食一场
    公共-校验数据    ${pvs}    fantuan_pindao_001    ${table_pvs}    1

点视频进点播页pvs1
    公共-校验数据    ${pvs1}    fantuan_pindao_001    ${table_pvs1}    1

返回推荐页
    点播播放页-返回

推荐页曝光newsfeedshow
    上滑
    上滑
    上滑
    上滑
    公共-校验数据    ${newsfeedshow}    chhotshow_001    ${table_chnewsclick}    1

推荐页-点视频播放newsfeedclick
    公共-删除数据
    新闻频道-点播放
    sleep    30
    公共-校验数据    ${newsfeedclick}    chhotshow_001    ${table_chnewsclick}    1

推荐页buff
    公共-校验数据    ${buffer}    dianboxiayige_001    ${table_buffer}    1

推荐页aplay
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1
