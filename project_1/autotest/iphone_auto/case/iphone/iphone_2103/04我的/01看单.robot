*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${show}           {'logtype':'show'}
${table_show}     mpp_show_5_iphone_sdk
${btclick}        {'act':'btclick'}
${my}             {'act':'my'}
${aplay}          {'act':'aplay'}

*** Test Cases ***
我的看单页面删除所有视频
    首页-我
    我的-看单
    sleep    2
    公共－点击页面文本    节目
    看单-删除
    公共－点击页面文本    视频
    看单-删除
    非播放页-返回
    首页-精选
    comment    启动应用
    sleep    5

看单为空show
    公共-删除数据
    sleep    2
    首页-我
    公共-校验数据    ${show}    show_kandan    ${table_show}    0

点播页-合集加入看单btclick
    首页-精选
    首页-搜索
    搜索首页－输入搜索词    楚乔传
    搜索-点击搜索
    公共－点击页面文本    播放
    公共-删除数据
    sleep    3
    新版点播-加入看单
    公共-校验数据    ${btclick}    btclick_001    ${table_click}    1

点播页-加入看单pfc
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    0

点播页-取消加入看单btclick
    公共-删除数据
    新版点播-加入看单
    公共-校验数据    ${btclick}    btclick_002    ${table_click}    1

点播页-取消加入看单pfc
    公共-校验数据    ${pfc}    pfc-collect    ${table_click}    0

点播页-取消后再加入看单btclick
    公共-删除数据
    新版点播-加入看单
    公共-校验数据    ${btclick}    btclick_001    ${table_click}    1

点播页-返回
    点播播放页-返回

点播页-单视频加入看单btclick
    公共－点击页面文本    电影
    公共－点击页面文本    微电影《茉莉之恋》发布会：杨洋赵丽颖大谈《楚乔传》和《三生》趣事
    公共-删除数据
    sleep    3
    新版点播-加入看单
    公共-校验数据    ${btclick}    btclick_003    ${table_click}    1

返回首页
    点播播放页-返回
    搜索－取消

我的看单show
    公共-删除数据
    sleep    2
    首页-我
    公共-校验数据    ${show}    show_kandan    ${table_show}    1

点我的看单click
    公共-删除数据
    我的-看单
    sleep    3
    公共-校验数据    ${my}    my_bofang_enter    ${table_click}    0

进入我的看单pvs
    公共-校验数据    ${pvs}    kandan_010    ${table_pvs}    1

跳转登录页pvs
    公共-删除数据
    点击不可见文本    立刻登录
    公共-校验数据    ${pvs}    kandan_013    ${table_pvs}    1

登录页返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    kandan_014    ${table_pvs}    1

切换到tab视频pvs
    公共-删除数据
    看单-视频
    公共-校验数据    ${pvs}    kandan_011    ${table_pvs}    1

再次切换到节目pvs
    公共-删除数据
    看单-节目
    公共-校验数据    ${pvs}    kandan_012    ${table_pvs}    1

删除节目tab中视频
    看单-删除

看单节目返回我的pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    kandan_018    ${table_pvs}    1

看单节目返回我的pvs1
    公共-校验数据    ${pvs1}    kandan_018    ${table_pvs1}    1

节目tab无数据进视频tab页pvs
    公共-删除数据
    我的-看单
    公共-校验数据    ${pvs}    kandan_017    ${table_pvs}    1

进入看单视频pvs
    公共-删除数据
    看单-点单视频
    sleep    3
    公共-校验数据    ${pvs}    kandan_002    ${table_pvs_dianbo}    1

进入看单视频vv
    公共-校验数据    ${aplay}    big_dianbo    ${table_vv}    1

点播页返回我的看单pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    kandan_015    ${table_pvs}    1

看单视频返回我的pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    kandan_016    ${table_pvs}    1

看单视频返回我的pvs1
    公共-校验数据    ${pvs1}    kandan_016    ${table_pvs1}    1
