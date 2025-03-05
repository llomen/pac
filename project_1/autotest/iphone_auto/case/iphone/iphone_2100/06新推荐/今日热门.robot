*** Settings ***
Documentation     chhot、chbanner
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${table_chhotshow}    mpp_ip_chzlshow
${table_chhotclick}    mpp_ip_chfeedclick_1
${chhotshow}      {'act':'chhotshow'}
${chbannershow}    {'act':'chbannershow'}
${chhotclick}     {'act':'chhotclick'}
${chbannerclick}    {'act':'chbannerclick'}
${table_chbannerclick}    mpp_ip_chbannerclick
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${buffer}         {'act':'buffer'}
${hb_end}         {'act':'hb','ht':'2'}
${hb3}            {'act':'hb','ht':'0'}
${hb5}            {'act':'hb','ht':'1'}

*** Test Cases ***
今日热门-点内容chhotclick
    sleep    5
    公共-删除数据
    tap    妻子的浪漫旅行3    0    0
    sleep    2
    公共-校验数据    ${chhotclick}    chhotclick_001    ${table_chhotclick}    1

进入频道show
    #曝光机制修改，产生pv后上报
    公共-校验数据    {'logtype':'show','lob':'smod=14374'}    show_feed_01    ${table_show}    1

进入频道曝光chhotshow
    公共-校验数据    ${chhotshow}    chhotshow_001    ${table_chhotshow}    1

进入频道曝光chbannershow
    公共-校验数据    ${chbannershow}    chbannershow_001    ${table_chhotshow}    1

今日热门跳转点播页pvs
    sleep    3
    公共-校验数据    ${pvs}    pindao_001    ${table_pvs_dianbo}    1

今日热门跳转点播页pvs1
    公共-校验数据    ${pvs1}    pindao_001    ${table_pvs1}    1

点播页返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    feed_03    ${table_pvs}    1

点播页返回pvs1
    公共-校验数据    ${pvs1}    feed_03    ${table_pvs1}    1

banner-点内容chbannerclick
    公共-删除数据
    首页-青云志
    sleep    3
    公共-校验数据    ${chbannerclick}    chbannerclick_001    ${table_chbannerclick}    1

banner跳转点播页pvs
    公共-校验数据    ${pvs}    pindao_002    ${table_pvs_dianbo}    1

banner跳转点播页pvs1
    sleep    3
    公共-校验数据    ${pvs1}    pindao_002    ${table_pvs1}    1

返回首页
    sleep    3
    点播播放页-返回

点击banner下图标chbannerclick
    公共-删除数据
    sleep    2
    tap    脱贫攻坚    0    0
    sleep    5
    公共-校验数据    ${chbannerclick}    chbannerclick_002    ${table_chbannerclick}    1

进入专题页pvs
    公共-校验数据    ${pvs}    shouye_01    ${table_pvs_other}    1

进入专题页pvs1
    公共-校验数据    ${pvs1}    shouye_01    ${table_pvs1}    1

专题页返回精选pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shouye_02    ${table_pvs_other}    1

专题页返回精选pvs1
    公共-校验数据    ${pvs1}    shouye_02    ${table_pvs1}    1
