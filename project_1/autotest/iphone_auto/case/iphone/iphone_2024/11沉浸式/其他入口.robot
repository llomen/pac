*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${show}           {'logtype':'show'}
${table_show}     mpp_show_5_iphone_sdk
${table_cjplayshow}    mpp_ip_cjplayshow
${table_cjplayclick}    mpp_ip_cjpalyclick
${table_cjplayhb}    mpp_ip_cjplayhb
${cjplayshow}     {'act':'cjplayshow'}
${cjplayclick}    {'act':'cjplayclick'}
${chzlshow}       {'act':'chzlshow'}
${chzlclick}      {'act':'chzlclick'}
${columnist}      {'act':'columnist'}
${share}          {'act':'share'}
${stay}           {'act':'stay'}
${table_stay}     mpp_ip_chzlclick_1
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {‘r’:'1'}

*** Test Cases ***
搜索页进入沉浸式pvs
    首页-搜索
    搜索首页－输入搜索词    杨幂
    搜索-点击搜索
    sleep    5
    公共-删除数据
    公共－点击页面文本    《扶摇》杨幂女子力爆棚谱写传奇 与阮经天相爱相随不负初心
    sleep    10
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

连播sp
    公共-校验数据    ${pvs}    feed_001    ${table_pvs_dianbo}    1

点击分享按钮share
    沉浸式-暂停
    公共-删除数据
    沉浸式-点分享
    公共-校验数据    ${share}    share_bodan_01    ${table_click}    1

点分享cjplayclick
    公共-删除数据
    沉浸式-分享到朋友圈
    公共-校验数据    ${cjplayclick}    cjplayclick_001    ${table_cjplayclick}    1

分享到朋友圈share
    公共-校验数据    ${share}    share_bodan_02    mpp_jiaohu_iphone    1

点评论cjplayclick
    公共-删除数据
    沉浸式-点评论
    公共-校验数据    ${cjplayclick}    cjplayclick_001    ${table_cjplayclick}    1

评论页pvs
    公共-校验数据    ${pvs}    cjs_011    ${table_pvs}    1

评论页返回pvs
    公共-删除数据
    沉浸式-评论返回
    公共-校验数据    ${pvs}    cjs_012    ${table_pvs}    1

点收藏cjplayclick
    公共-删除数据
    沉浸式-点加看单
    公共-校验数据    ${cjplayclick}    cjplayclick_001    ${table_cjplayclick}    1
