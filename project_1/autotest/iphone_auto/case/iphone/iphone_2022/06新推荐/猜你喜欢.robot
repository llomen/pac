*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${show}           {'logtype':'show'}
${table_show}     mpp_show_5_iphone_sdk
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_pvs_dianbo}    mpp_pv_5_5_iphone_sdk_dianbo
${table_chfeedshow}    mpp_ip_chzlshow
${table_chfeedclick}    mpp_ip_chfeedclick_1
${table_chfeedhb}    mpp_ip_chfeedhb
${table_chfeedclick_jubao}    mpp_ip_chfeedclick_3
${chfeedshow}     {'act':'chfeedshow'}
${chfeedclick}    {'act':'chfeedclick'}
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${buffer}         {'act':'buffer'}
${hb_end}         {'act':'hb','ht':'2'}
${hb3}            {'act':'hb','ht':'0'}
${hb5}            {'act':'hb','ht':'1'}
${chfeedhb3}      {'act':'hb','ht':'0','platform':'iphone'}
${chfeedhb5}      {'act':'hb','ht':'1','platform':'iphone'}
${chfeedhb_end}    {'act':'hb','ht':'2','platform':'iphone'}

*** Test Cases ***
猜你喜欢模块show
    公共-删除数据
    滑动到猜你喜欢
    sleep    5
    公共-校验数据    {'logtype':'show','lob':'smod=13453'}    show_feed_01    ${table_show}    1

猜你喜欢标题曝光chfeedshow
    公共-校验数据    {'act':'chfeedshow','rcdata':'vfdtitle'}    chfeedshow_003    ${table_chfeedshow}    1

猜你喜欢长片曝光chfeedshow
    公共-校验数据    {'act':'chfeedshow','rcdata':'vfdlvod'}    chfeedshow_003    ${table_chfeedshow}    1

长片点播放chfeedclick
    公共-删除数据
    猜你喜欢-点长片播放
    公共-校验数据    ${chfeedclick}    chfeedclick_003    ${table_chfeedclick}    1

cdn1
    sleep    10
    公共-校验数据    ${cdn1}    ke2_07    mpp_cdn_5_iphone    1

cdn2
    公共-校验数据    ${cdn2}    ke2_08    mpp_cdn_5_iphone    1

cdn3
    公共-校验数据    ${cdn3}    ke2_09    mpp_cdn_5_iphone    1

播放视频buffer
    公共-校验数据    ${buffer}    pindao_feed_01    ${table_buffer}    1

视频播放aplay
    公共-校验数据    ${aplay}    pindao_feed_01    ${table_vv}    1

心跳hb3
    sleep    3
    公共-校验数据    ${hb3}    pindao_feed_01    ${table_hb_sdk}    1

心跳hb5
    sleep    3
    公共-校验数据    ${hb5}    pindao_feed_02    ${table_hb_sdk}    1

心跳chfeedhb3
    公共-校验数据    ${chfeedhb3}    chfeedhb_01    ${table_chfeedhb}    1

心跳chfeedhb5
    公共-校验数据    ${chfeedhb5}    chfeedhb_02    ${table_chfeedhb}    1

长片-点标题chfeedclick
    公共-删除数据
    猜你喜欢-点长片标题
    公共-校验数据    ${chfeedclick}    chfeedclick_002    ${table_chfeedclick}    1

无心跳hb停止
    公共-校验数据    ${hb_end}    dianboxiayige_001    ${table_hb_sdk}    0

无心跳chfeedhb停止
    公共-校验数据    ${chfeedhb_end}    chfeedhb_03    ${table_chfeedhb}    0

点长片标题跳转点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    feed_002    ${table_pvs_dianbo}    1

点长片标题跳转点播页pvs1
    公共-校验数据    ${pvs1}    feed_002    ${table_pvs1}    1

点长片标题跳转点播页aplay
    公共-校验数据    ${aplay}    pindao_feed_01    ${table_vv}    1

点播页返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    feed_04    ${table_pvs}    1

点播页返回pvs1
    公共-校验数据    ${pvs1}    feed_04    ${table_pvs1}    1

点观看正片chfeedclick
    公共-删除数据
    猜你喜欢-点观看正片
    公共-校验数据    ${chfeedclick}    chfeedclick_004    ${table_chfeedclick}    1

点看正片跳转点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    feed_002    ${table_pvs_dianbo}    1

点看正片跳转点播页pvs1
    公共-校验数据    ${pvs1}    feed_002    ${table_pvs1}    1

点看正片跳转点播页aplay
    公共-校验数据    ${aplay}    pindao_feed_01    ${table_vv}    1

长片举报chfeedclick
    点播播放页-返回
    公共-删除数据
    猜你喜欢-点长片举报
    猜你喜欢-点举报内容
    公共-校验数据    ${chfeedclick}    chfeedclick_008    ${table_chfeedclick_jubao}    1

播放新视频buffer
    公共-删除数据
    sleep    3
    猜你喜欢-点长片播放
    sleep    10
    公共-校验数据    ${buffer}    pindao_feed_01    ${table_buffer}    1

播放新视频aplay
    公共-校验数据    ${aplay}    pindao_feed_01    ${table_vv}    1

播放新视频心跳hb3
    公共-校验数据    ${hb3}    pindao_feed_01    ${table_hb_sdk}    1

播放新视频心跳chfeedhb3
    公共-校验数据    ${chfeedhb3}    chfeedhb_01    ${table_chfeedhb}    1

播放完成hb停止
    sleep    45
    公共-校验数据    ${hb_end}    dianboxiayige_001    ${table_hb_sdk}    1

播放完成chfeedhb停止
    公共-校验数据    ${chfeedhb_end}    chfeedhb_03    ${table_chfeedhb}    1

猜你喜欢短片曝光chfeedshow
    公共-删除数据
    滑动到猜你喜欢短片
    sleep    2
    公共-校验数据    {'act':'chfeedshow','rcdata':'vfdsvod'}    chfeedshow_002    ${table_chfeedshow}    1

点短片标题chfeedclick
    猜你喜欢-点短片标题
    公共-校验数据    ${chfeedclick}    chfeedclick_001    ${table_chfeedclick}    1

点短片标题跳转点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

点短片标题跳转点播页pvs1
    公共-校验数据    ${pvs1}    feed_001    ${table_pvs1}    1

点短片标题跳转点播页aplay
    公共-校验数据    ${aplay}    pindao_feed_01    ${table_vv}    1

短片举报chfeedclick
    点播播放页-返回
    公共-删除数据
    猜你喜欢-点短片举报
    猜你喜欢-点举报内容
    公共-校验数据    ${chfeedclick}    chfeedclick_008    ${table_chfeedclick_jubao}    1

点替换后短片chfeedclick
    猜你喜欢-替换后点短片标题
    公共-校验数据    ${chfeedclick}    chfeedclick_001    ${table_chfeedclick}    1

点替换后短片跳转点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

点替换后短片跳转点播页pvs1
    公共-校验数据    ${pvs1}    feed_001    ${table_pvs1}    1

点替换后短片跳转点播页aplay
    公共-校验数据    ${aplay}    pindao_feed_01    ${table_vv}    1

点标签进标签主页pvs
    sleep    3
    点播播放页-返回
    公共-删除数据
    猜你喜欢-点标签
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

点标签进标签主页pvs1
    公共-校验数据    ${pvs1}    feed_001    ${table_pvs1}    1

标签主页曝光tagplayshow
    公共-校验数据    ${tagplayshow}    chfeedclick_001    ${table_chfeedclick}    1

标签主页点击tagplayclick
    公共-校验数据    ${tagplayshow}    chfeedclick_001    ${table_chfeedclick}    1
