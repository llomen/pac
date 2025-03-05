*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Force Tags        g2
Resource          ../5.3对象库.robot


*** Variables ***
${aplay}          {'act':'aplay'}
${type0}          {'type':'0','l':'/app/player'}
${type1}          {'type':'1','l':'/app/player'}
${type3}          {'type':'3'}
${type4}          {'type':'4'}
${type5}          {'type':'5'}
${type6}          {'type':'6'}
${dianbo}         下一站是幸福
${hudongju}       明星大侦探5 互动版
${chenjinshi}     下一站是幸福

*** Test Cases ***
点播页有广告上报type0
    sleep    3
    公共-删除数据
    首页-搜索
    搜索首页－输入搜索词    ${dianbo}
    搜索－点击搜索
    sleep    3
    搜索-点击播放
    sleep    80
    公共-校验数据    ${type0}    bofangzhong_type0    ${table_adcdn}    1

点播页有广告上报type1
    公共-校验数据    ${type1}    bofangzhong_type1    ${table_adcdn}    1

点播页有广告上报type3
    公共-校验数据    ${type3}    bofangzhong_type3    ${table_adcdn}    1

点播页有广告上报type4
    公共-校验数据    ${type4}    bofangzhong_type4    ${table_adcdn}    1

点播页有广告上报type6
    公共-校验数据    ${type6}    bofangzhong_type6    ${table_adcdn}    1

进入互动剧
    非播放页-返回
    搜索－取消

互动剧有广告上报type0
    首页-搜索
    搜索首页－输入搜索词    ${hudongju}
    搜索－点击搜索
    sleep    3
    搜索-点击播放
    sleep    4
    互动剧-点播放
    sleep    20
    公共-校验数据    ${type0}    bofangzhong_type0    ${table_adcdn}    1

互动剧有广告上报type1
    公共-校验数据    ${type1}    bofangzhong_type1    ${table_adcdn}    1

互动剧有广告上报type3
    公共-校验数据    ${type3}    bofangzhong_type3    ${table_adcdn}    1

互动剧有广告上报type4
    公共-校验数据    ${type4}    bofangzhong_type4    ${table_adcdn}    1

互动剧有广告上报type6
    公共-校验数据    ${type6}    bofangzhong_type6    ${table_adcdn}    1
