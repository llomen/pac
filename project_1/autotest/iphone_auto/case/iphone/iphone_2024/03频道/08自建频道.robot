*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${input_field}    (//XCUIElementTypeImage[@name="searchpop-search"])[1]/following-sibling::XCUIElementTypeTextField[1]
${crech}          {'act':'crech'}

*** Test Cases ***
频道管理cv
    sleep    5
    公共-删除数据
    首页-频道管理
    公共-校验数据    ${cv}    channel_01    ${table_cv}    1

点击创建crech
    公共-删除数据
    公共－点击页面文本    创建我的频道
    公共-校验数据    ${crech}    crech_01    ${table_click}    1
    sleep    3

跳转创建频道页pvs
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

跳转创建频道页pvs1
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

推荐剧集曝光show
    #有引导页
    run keyword and ignore error    公共－点击页面文本    创建
    公共-校验数据    ${show}    pinglun_002    ${table_show}    1

推荐tab添加剧集crech
    公共-删除数据
    创建频道-推荐tab点击
    公共-校验数据    ${crech}    crech_02    ${table_click}    1

推荐tab取消添加crech
    公共-删除数据
    创建频道-推荐tab点击
    公共-校验数据    ${crech}    crech_03    ${table_click}    1

推荐tab输入搜索词crech
    sleep    2
    点击搜索框
    公共-删除数据
    Input Value    xpath=${input_field}    以家人之名
    sleep    2
    公共-校验数据    ${crech}    crech_04    ${table_click}    1

推荐tab确认搜索crech
    公共-删除数据
    公共－点击页面文本    Search
    公共-校验数据    ${crech}    crech_04    ${table_click}    1

推荐tab结果页添加
    公共-删除数据
    创建频道-搜索页添加
    公共-校验数据    ${crech}    crech_06    ${table_click}    1

关闭搜索页
    公共－点击页面文本    取消

切换明星tab页show
    创建频道-切换明星tab
    公共-校验数据    ${show}    pinglun_002    ${table_show}    1

明星tab添加明星crech
    公共-删除数据
    创建频道-明星tab点击
    公共-校验数据    ${crech}    crech_07    ${table_click}    1

明星tab取消添加crech
    公共-删除数据
    创建频道-明星tab点击
    公共-校验数据    ${crech}    crech_08    ${table_click}    1

明星tab输入搜索词crech
    sleep    2
    点击搜索框
    公共-删除数据
    Input Value    xpath=${input_field}    赵丽
    公共-校验数据    ${crech}    crech_10    ${table_click}    1

明星tab确认搜索crech
    公共-删除数据
    click element    nsp = name=="赵丽颖" and visible == true
    公共-校验数据    ${crech}    crech_09    ${table_click}    1

明星tab结果页添加
    公共-删除数据
    创建频道-搜索页添加
    公共-校验数据    ${crech}    crech_05    ${table_click}    1

切换节目tab页show
    公共-删除数据
    创建频道-切换节目tab
    公共-校验数据    ${show}    pinglun_002    ${table_show}    0

节目tab页添加标签
    公共-删除数据
    公共－点击页面文本    芒果出品
    公共-校验数据    ${crech}    crech_07    ${table_click}    1

节目tab页取消标签
    公共-删除数据
    公共－点击页面文本    芒果出品
    公共-校验数据    ${crech}    crech_08    ${table_click}    1

节目tab添加多个
    公共-删除数据
    公共－点击页面文本    真人秀
    公共－点击页面文本    亲子
    公共－点击页面文本    旅游
    公共-校验数据    ${crech}    crech_07    ${table_click}    3

切换UP主tab页show
    公共-删除数据
    创建频道-切换节目tab
    公共-校验数据    ${show}    pinglun_002    ${table_show}    0

UP主tab页添加标签
    公共-删除数据
    公共－点击页面文本    娱乐
    公共-校验数据    ${crech}    crech_07    ${table_click}    1

UP主tab页取消标签
    公共-删除数据
    公共－点击页面文本    娱乐
    公共-校验数据    ${crech}    crech_08    ${table_click}    1

*** Keywords ***
点击搜索框
    公共－xpath    ${input_field}
