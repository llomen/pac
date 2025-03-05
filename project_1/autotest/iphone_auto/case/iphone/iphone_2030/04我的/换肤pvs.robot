*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${pvs}            {'act':'pvs'}

*** Test Cases ***
进入皮肤列表pvs
    首页-我
    滑动到设置
    公共-删除数据
    我的-皮肤
    公共-校验数据    ${pvs}    pifu_001    ${table_pvs}    1

进入皮肤列表pvs1
    公共-校验数据    ${pvs1}    pifu_001    ${table_pvs1}    1

点击皮肤my
    公共-校验数据    {'act':'my'}    my_wode_pifu    ${table_click}    1

进入皮肤详情页pvs
    公共-删除数据
    进入芒果橙
    公共-校验数据    ${pvs}    pifu_002    ${table_pvs}    1

皮肤详情页返回pvs
    公共-删除数据
    皮肤详情页返回
    公共-校验数据    ${pvs}    pifu_003    ${table_pvs}    1

皮肤列表换vip皮肤pvs
    公共-删除数据
    皮肤详情页返回
    公共-校验数据    ${pvs}    pifu_004    ${table_pvs}    1

皮肤列表换vip皮肤pvs
    公共-校验数据    ${pvs}    pifu_004    ${table_pvs}    1
