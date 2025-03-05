*** Settings ***
Library           ../../../../../ios_auto/src/auto.py
Library           /Users/lottie/Downloads/autotest/ios_auto/src/mitmproxy_test1016_python3/src/RobotApi.py

*** Keywords ***
开启智能首页
    Update TestPile    0    108
    Update TestPile    0    109
    Update TestPile    1    110
    Update TestPile    1    111

开启普通首页
    Update TestPile    1    108
    Update TestPile    1    109
    Update TestPile    0    110
    Update TestPile    0    111

公共－删除cdn配置
    delete cdn
    sleep    2

公共－cdn配置
    [Arguments]    ${text}
    sleep    2
    Insert Cdn Config    ${text}
    sleep    2

公共-获取结果
    [Arguments]    ${field}    ${test_point}    ${field_table}    ${act_count}
    sleep    1
    ${result}    Check Result    ${field}    ${platform2}    ${test_point}    ${field_table}    ${act_count}
    [Return]    ${result}

公共-删除数据
    delete data    ${platform2}
    sleep    1

公共-校验
    [Arguments]    ${res}    ${text}
    ${passed} =    Evaluate    ${res}
    ${error} =    Set Variable If    ${passed}    ${EMPTY}    ${text}
    [Return]    ${passed}    ${error}

公共-校验结果
    [Arguments]    ${field}    ${test_point}    ${field_table}    ${act_count}=1
    ${result}    Check Result    ${field}    ${platform2}    ${test_point}    ${field_table}    ${act_count}
    ${count}    ${error1}=    公共-校验    ${result['count'][0]}==1    条数错误：${result['count'][1]}\n
    ${field}    ${error2}=    公共-校验    ${result['field'][0]} ==1    字段错误：${result['field'][1]}\n
    ${errdata}    ${error3}=    公共-校验    ${result['errdata'][0]}==1    字段值错误：${result['errdata'][1]}\n
    ${res}=    Evaluate    ${count}&${field}&${errdata}
    ${error}=    Catenate    SEPARATOR=    ${error1}    ${error2}    ${error3}
    should be true    ${res}    ${error}

公共-校验无结果
    [Arguments]    ${field}    ${test_point}    ${field_table}    ${act_count}=0
    ${result}    Check Result    ${field}    ${platform2}    ${test_point}    ${field_table}    ${act_count}
    ${count}    ${error1}=    公共-校验    ${result['count'][0]}==1    条数错误：${result['count'][1]}\n
    should be true    ${count}    ${error1}

公共-校验数据
    [Arguments]    ${field}    ${test_point}    ${field_table}    ${act_count}
    sleep    1
    run keyword if    ${act_count}==0    公共-校验无结果    ${field}    ${test_point}    ${field_table}
    ...    ELSE    公共-校验结果    ${field}    ${test_point}    ${field_table}    ${act_count}
