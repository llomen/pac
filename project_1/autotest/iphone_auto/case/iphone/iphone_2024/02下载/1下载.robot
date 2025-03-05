*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${hb15}           {'act':'hb','ht':'3'}
${cdn1}           {'s':'1'}
${cdn3}           {'s':'3'}
${switch}         {'act':'switch'}
${cdn2}           {'s':'2'}
${r3}             {‘r’:'3'}
${r1}             {‘r’:'1'}
${pfc16}          {'act':'pfc','pos':'16'}
${pfc17}          {'act':'pfc','pos':'17'}
${oc_start}       {'act':'oc','pos':'5'}
${oc_end}         {'act':'oc','pos':'6'}
${bdrecommend_rel}    {'act':'bdrecommend_rel'}
${bdrelatepv}     {'act':'bdrelatepv'}
${filmfreedown}    小猪佩奇第二季
${filmvipdown}    青云志
${filmcannotdown}    汪汪队立大功第六季

*** Test Cases ***
清空缓存
    sleep    5
    首页-我
    我的-缓存
    删除全部缓存
    非播放页-返回
    公共-删除数据

空白缓存页pvs
    sleep    2
    我的-缓存
    公共-校验数据    ${pvs}    huancun_010    ${table_pvs}    1

空白缓存页pvs1
    公共-校验数据    ${pvs1}    huancun_010    ${table_pvs1}    1

空白缓存页提示
    Page Should Contain Text    暂无缓存视频

空白缓存页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    huancun_011    ${table_pvs}    1

空白缓存页返回pvs1
    公共-校验数据    ${pvs1}    huancun_011    ${table_pvs1}    1

进入普通视频
    首页-精选
    首页-搜索
    搜索首页－输入搜索词    ${filmfreedown}
    搜索－点击搜索
    公共-删除数据
    搜索-点击播放

点击下载按钮pfc
    sleep    3
    点播播放页-暂停
    公共-删除数据
    点播播放页-下载
    公共-校验数据    ${pfc}    pfc-download    ${table_click}    1

下载pvs
    公共-校验数据    ${pvs}    xiazai_001    ${table_pvs}    1

下载pvs1
    公共-校验数据    ${pvs1}    xiazai_001    ${table_pvs1}    0

下载浮层曝光cv
    公共-校验数据    ${cv}    play_03    ${table_cv}    1

查看缓存-空白pvs
    公共-删除数据
    公共－点击页面文本    查看缓存
    公共-校验数据    ${pvs}    huancun_015    ${table_pvs}    1

查看缓存-空白pvs1
    公共-校验数据    ${pvs1}    huancun_015    ${table_pvs1}    1

空白缓存返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    huancun_016    ${table_pvs}    1

查看缓存返回pvs1
    公共-校验数据    ${pvs1}    huancun_016    ${table_pvs1}    1

下载cdn1
    点播播放页-下载集数    (//XCUIElementTypeStaticText[@name="1"])[1]
    sleep    5
    公共-校验数据    ${cdn1}    iphone_xiazai_01    mpp_cdn_5_iphone_download    1

下载开始事件ds
    公共-校验数据    {'act':'ds'}    ds_001    mpp_kpi_ds_iphone    1

开始下载oc
    Comment    公共-删除数据
    Comment    点击不可见文本    xpath=(//XCUIElementTypeImage[@name="choice-iconD1"])[1]
    公共-校验数据    ${oc_start}    oc_start    ${table_click}    1

下载cdn2
    sleep    2
    公共-校验数据    ${cdn2}    iphone_xiazai_02    mpp_cdn_5_iphone_download    1

下载cdn3-start
    #下载开始报z=0,下完报z=1
    sleep    3
    公共-校验数据    {'s':'3','z':'0'}    iphone_xiazai_03    mpp_cdn_5_iphone_download    1

下载cdn3-end
    #下载开始报z=0,下完报z=1
    sleep    5
    公共-校验数据    {'s':'3','z':'1'}    iphone_xiazai_04    mpp_cdn_5_iphone_download    1

下载结束oc
    公共-校验数据    ${oc_end}    oc_end    ${table_click}    1

查看缓存-已缓存pvs
    公共-删除数据
    公共－点击页面文本    查看缓存
    sleep    2
    公共-校验数据    ${pvs}    huancun_004    ${table_pvs}    1

查看缓存-已缓存pvs1
    公共-校验数据    ${pvs1}    huancun_004    ${table_pvs1}    1

查看缓存pfc
    公共-校验数据    ${pfc}    pfc-huancun    ${table_click}    1

已缓存返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    huancun_003    ${table_pvs}    1

已缓存返回pvs1
    公共-校验数据    ${pvs1}    huancun_003    ${table_pvs1}    1

点击全部缓存pfc
    公共－点击页面文本    全部缓存
    公共-校验数据    ${pfc16}    pfc-huancun-click    ${table_click}    1

全部缓存展示pfc
    公共-校验数据    ${pfc17}    pfc-huancun-show    ${table_click}    1

全部缓存取消pfc
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pfc}    pfc-alldownload_cancle    ${table_click}    1

退出下载pvs
    公共-删除数据
    点播播放页-退出下载
    sleep    2
    公共-校验数据    ${pvs}    xiazai_002    ${table_pvs_dianbo}    1

不可下载点击下载按钮pfc
    点播播放页-返回
    搜索－x
    搜索首页－输入搜索词    ${filmcannotdown}
    sleep    2
    搜索-点击播放
    sleep    3
    公共-删除数据
    公共－点击页面文本    Media Download disabled
    公共-校验数据    ${pfc}    pfc-download    ${table_click}    1

不可下载提示
    comment    公共-页面存在元素值    因版权限制，赞不支持本国家/地区缓存

不可下载下载pvs
    公共-校验数据    ${pvs}    xiazai_001    ${table_pvs}    0

不可下载下载浮层曝光cv
    公共-校验数据    ${cv}    play_03    ${table_cv}    0

进入vip视频
    点播播放页-返回
    sleep    2
    搜索－x
    搜索首页－输入搜索词    ${filmvipdown}
    sleep    2
    搜索-点击播放

vip下载点击下载按钮pfc
    sleep    3
    公共-删除数据
    点播播放页-下载
    公共-校验数据    ${pfc}    pfc-download    ${table_click}    1

vip下载下载pvs
    公共-校验数据    ${pvs}    xiazai_001    ${table_pvs}    0

vip下载下载浮层曝光cv
    公共-校验数据    ${cv}    play_03    ${table_cv}    0

vip下载提示
    sleep    2
    公共-页面存在元素值    该视频为VIP专享, 开通VIP即可缓存

跳转会员页面pvs
    公共-删除数据
    公共－点击页面文本    确定
    sleep    2
    公共-校验数据    ${pvs}    xiazai_003    ${table_pvs}    1

跳转会员页面pvs1
    公共-校验数据    ${pvs}    xiazai_003    ${table_pvs}    1

会员页面返回pvs
    公共-删除数据
    sleep    3
    开通会员－返回
    公共-校验数据    ${pvs}    xiazai_004    ${table_pvs}    1

会员页面返回pvs1
    公共-校验数据    ${pvs}    xiazai_004    ${table_pvs}    1
