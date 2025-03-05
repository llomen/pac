*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${search}         {'act':'search'}
${view}           {'act':'view'}
${click}          {'act':'click'}

*** Test Cases ***
原词搜索pvs
    sleep    5
    首页-搜索
    搜索首页－输入搜索词    花儿与少年
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${pvs}    yuanci_001    ${table_pvs_search}    1

新词搜索pvs
    搜索首页－输入搜索词    第三季
    公共-删除数据
    搜索-点击搜索
    公共-校验数据    ${pvs}    yuanci_002    ${table_pvs_search}    1
