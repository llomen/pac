*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${oc}             {'act':'oc'}
${pfc16}          {'act':'pfc','pos':'16'}
${pfc17}          {'act':'pfc','pos':'17'}

*** Test Cases ***
下载到正在缓存pvs
    sleep    3
    首页-搜索
    搜索首页－输入搜索词    ${longfilm}
    搜索－点击搜索
    搜索-点击播放
    sleep    8
    点播播放页-下载
    sleep    2
    下载电影
    公共-删除数据
    公共－点击页面文本    查看缓存
    公共-校验数据    ${pvs}    huancun_017    ${table_pvs}    1

下载到正在缓存pvs1
    公共-校验数据    ${pvs1}    huancun_017    ${table_pvs1}    1

暂停下载
    #品屏幕关闭初次提示
    sleep    1
    click a point    100    100
    sleep    1
    公共－点击页面文本    全部暂停

点缓存个数oc
    公共-删除数据
    公共－点击页面文本    同时缓存个数·1
    公共-校验数据    ${oc}    oc_01    ${table_click}    1

个数列表pvs
    公共-校验数据    ${pvs}    huancun_018    ${table_pvs}    1

个数列表cv
    公共-校验数据    ${cv}    huancun_01    ${table_cv}    1

点2个oc
    公共-删除数据
    公共－点击页面文本    2个
    公共-校验数据    ${oc}    oc_03    ${table_click}    1

跳转会员页pvs
    公共-校验数据    ${pvs}    huancun_019    ${table_pvs}    1

跳转会员页pvs1
    公共-校验数据    ${pvs1}    huancun_019    ${table_pvs1}    1

会员页返回pvs
    公共-删除数据
    sleep    3
    开通会员－返回
    公共-校验数据    ${pvs}    huancun_020    ${table_pvs}    1

会员页返回pvs1
    公共-校验数据    ${pvs1}    huancun_020    ${table_pvs1}    1

点3个oc
    公共-删除数据
    公共－点击页面文本    3个
    sleep    3
    开通会员－返回
    公共-校验数据    ${oc}    oc_04    ${table_click}    1

点1个oc
    公共-删除数据
    公共－点击页面文本    1个
    公共-校验数据    ${oc}    oc_02    ${table_click}    1

关闭个数列表
    公共-校验数据    ${pvs}    huancun_020    ${table_pvs}    1

点开通会员oc
    公共-删除数据
    公共－点击页面文本    开通会员
    公共-校验数据    ${oc}    oc_05    ${table_click}    1

跳转会员页2pvs
    公共-校验数据    ${pvs}    huancun_022    ${table_pvs}    1

跳转会员页2pvs1
    公共-校验数据    ${pvs1}    huancun_019    ${table_pvs1}    1

会员页返回2pvs
    公共-删除数据
    开通会员－返回
    公共-校验数据    ${pvs}    huancun_023    ${table_pvs}    1

会员页返回2pvs1
    公共-校验数据    ${pvs1}    huancun_020    ${table_pvs1}    1

删除视频
    公共-删除数据
    删除全部缓存

自动跳转回下载页pvs
    公共-校验数据    ${pvs}    huancun_024    ${table_pvs}    1

自动跳转回下载页pvs1
    公共-校验数据    ${pvs1}    huancun_024    ${table_pvs1}    1

*** Keywords ***
下载播放视频
    点击不可见文本    playlist-nowplay

删除后下载
    公共－点击页面文本    删除
    下载播放视频

下载电影
    下载播放视频
    ${res}=    run keyword and return status    page should not contain text    删除
    run keyword if    ${res}==False    删除后下载
