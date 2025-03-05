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
${chenjinshi}     我的特工爷爷

*** Test Cases ***
登录会员
    公共－用户登录    ${mail_account_vip}    ${mail_pwd_vip}
    首页-精选

点播页VIP无广告上报type0
    首页-搜索
    搜索首页－输入搜索词    ${dianbo}
    搜索－点击搜索
    sleep    3
    搜索-点击播放
    sleep    10
    公共-校验数据    ${type0}    bofangzhong_type0    ${table_adcdn}    1

点播页VIP无广告上报type5
    公共-校验数据    ${type5}    bofangzhong_type5    ${table_adcdn}    1

点播页VIP无广告上报type6
    公共-校验数据    ${type6}    bofangzhong_type6    ${table_adcdn}    1

进入沉浸式
    非播放页-返回
    搜索－取消

沉浸式无广告上报type0
    首页-搜索
    搜索首页－输入搜索词    ${chenjinshi}
    搜索－点击搜索
    sleep    3
    搜索－结果页点播单
    公共-校验数据    ${type0}    bofangzhong_type0    ${table_adcdn}    1

沉浸式无广告上报type5
    公共-校验数据    ${type5}    bofangzhong_type5    ${table_adcdn}    1

沉浸式无广告上报type6
    公共-校验数据    ${type6}    bofangzhong_type6    ${table_adcdn}    1

进入互动剧
    非播放页-返回
    搜索－取消

互动剧无广告上报type0
    首页-搜索
    搜索首页－输入搜索词    ${hudongju}
    搜索－点击搜索
    sleep    3
    搜索-点击播放
    sleep    4
    互动剧-点播放
    sleep    20
    公共-校验数据    ${type0}    bofangzhong_type0    ${table_adcdn}    1

互动剧无广告上报type5
    公共-校验数据    ${type5}    bofangzhong_type5    ${table_adcdn}    1

互动剧无广告上报type6
    公共-校验数据    ${type6}    bofangzhong_type6    ${table_adcdn}    1
