*** Settings ***
Resource          ../5.3对象库.robot


*** Test Cases ***
case1
    测试index

case2
    测试index

case3
    测试index

case4
    测试index

case5
    测试index

case6
    测试index

case7
    测试index

case8
    测试index

case9
    测试index

case10
    测试index

case11
    测试index

case12
    测试index

case13
    测试index

case14
    测试index

case15
    测试index

case16
    测试index

case17
    测试index

case18
    测试index

case19
    测试index

case20
    测试index

case21
    测试index

case22
    测试index

case23
    测试index

case24
    测试index

case25
    测试index

case26
    测试index

case27
    测试index

case28
    测试index

case29
    测试index

case30
    测试index

case31
    测试index

case32
    测试index

case33
    测试index

case34
    测试index

case35
    测试index

case36
    测试index

case37
    测试index

case38
    测试index

case39
    测试index

case40
    测试index

case41
    测试index

case42
    测试index

case43
    测试index

case44
    测试index

case45
    测试index

case46
    测试index

case47
    测试index

case48
    测试index

case49
    测试index

case50
    测试index

case51
    测试index

case52
    测试index

case53
    测试index

case54
    测试index

case55
    测试index

case56
    测试index

case57
    测试index

*** Keywords ***
测试index
    启动应用
    sleep    5
    上滑
    公共-删除数据
    sleep    2
    click a point    300    300
    sleep    2
    公共-校验数据    ${pvs}    big_dianbo    ${table_pvs_dianbo}    1
    公共－关闭应用
    sleep    3
