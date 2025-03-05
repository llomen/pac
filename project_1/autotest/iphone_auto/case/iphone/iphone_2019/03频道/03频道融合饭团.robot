*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${pfc}            {'act':'pfc'}
${fantuan}        {'act':'fantuan'}

*** Test Cases ***
融合饭团曝光show
    公共-删除数据
    上滑
    sleep    2
    频道上滑
    sleep    2
    频道上滑
    Capture Page Screenshot
    sleep    3
    公共-校验数据    {'logtype':'show','lob':'smod=fantuancall'}    index_fantuan    ${table_show}    1

点明星名字fantuan
    公共-删除数据
    点明星名字
    公共-校验数据    ${fantuan}    fantuan_pindao_01    ${table_click}    1

进入明星饭团pvs
    公共-校验数据    ${pvs}    fantuan_pindao_001    ${table_pvs}    1

进入明星饭团pvs1
    公共-校验数据    ${pvs1}    fantuan_pindao_001    ${table_pvs1}    1

明星饭团返回频道pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    fantuan_pindao_002    ${table_pvs}    1

明星饭团返回频道pvs1
    公共-校验数据    ${pvs1}    fantuan_pindao_002    ${table_pvs1}    1

点打榜fantuan
    公共-删除数据
    点打榜
    sleep    2
    公共-校验数据    ${fantuan}    fantuan_pindao_02    ${table_click}    1

饭团返回频道
    非播放页-返回

点更多进排行榜fantuan
    公共-删除数据
    点更多
    公共-校验数据    ${fantuan}    fantuan_pindao_03    ${table_click}    1

进入排行榜pvs
    公共-校验数据    ${pvs}    fantuan_pindao_003    ${table_pvs}    1

进入排行榜pvs1
    公共-校验数据    ${pvs1_H5}    fantuan_pindao_003    ${table_pvs1}    1

排行榜返回频道pvs
    公共-删除数据
    非播放页-返回
    sleep    2
    公共-校验数据    ${pvs}    fantuan_pindao_004    ${table_pvs}    1

排行榜返回频道pvs1
    公共-校验数据    ${pvs1}    fantuan_pindao_004    ${table_pvs1}    1

切换新晋榜fantuan
    公共-删除数据
    切换tab-新晋榜
    公共-校验数据    ${fantuan}    fantuan_pindao_05    ${table_click}    1

新晋榜曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=fantuancall'}    index_fantuan    ${table_show}    1

切换上升榜fantuan
    公共-删除数据
    切换tab-上升榜
    公共-校验数据    ${fantuan}    fantuan_pindao_05    ${table_click}    1

上升榜曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=fantuancall'}    index_fantuan    ${table_show}    1

滑动到更多
    公共-滑动页面    李沁    梁振伦
    sleep    3
    comment    get source
    sleep    10

更多按钮曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=fantuancallmore'}    index_fantuan_more    ${table_show}    1

更多明星fantuan
    公共-删除数据
    公共－xpath    (//*[@name="更多"])[2]
    公共-校验数据    ${fantuan}    fantuan_pindao_04    ${table_click}    1

进入排行榜2pvs
    公共-校验数据    ${pvs}    fantuan_pindao_003    ${table_pvs}    1

进入排行榜2pvs1
    公共-校验数据    ${pvs1_H5}    fantuan_pindao_003    ${table_pvs1}    1

*** Keywords ***
点明星名字
    公共－点击页面文本    邓紫棋

点打榜
    公共－xpath    (//XCUIElementTypeButton[@name="打榜"])[1]

点更多
    公共－点击页面文本    更多

切换tab-新晋榜
    公共－点击页面文本    新晋榜
    sleep    2

切换tab-上升榜
    公共－点击页面文本    上升榜
    sleep    2

切换tab-芒果人气榜
    公共－点击页面文本    芒果人气榜
