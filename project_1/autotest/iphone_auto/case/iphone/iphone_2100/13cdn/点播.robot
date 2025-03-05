*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${cdn1-error}     {'s':'1','f':'-1'}
${cdn2-error}     {'s':'2','f':'-1'}
${cdn1-error1}    {'s':'1','f':'0'}
${cdn3-error}     {'s':'3','f':'-1'}

*** Test Cases ***
点播-cdn1-404－条数
    sleep    5
    首页-搜索
    搜索首页－输入搜索词    活色生香
    搜索-点击搜索
    公共-删除数据
    公共－删除cdn配置
    #公共－cdn配置    404
    播放第四集
    sleep    15
    公共-校验数据    ${cdn1-error}    ipad_dianbo_003    mpp_cdn_5_iphone    1

点播-cdn1-500－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    500
    公共-删除数据
    播放第四集
    sleep    15
    公共-校验数据    ${cdn1-error}    ipad_dianbo_005    mpp_cdn_5_ipad    1

点播-cdn1-解析错误－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    parse_error
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    2
    公共-校验数据    ${cdn1-error}    ipad_dianbo_006    mpp_cdn_5_ipad    1

点播-cdn1-空－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    nul
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    2
    公共-校验数据    ${cdn1-error}    ipad_dianbo_007    mpp_cdn_5_ipad    1

点播-cdn1-超时－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    timeout
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    40
    公共-校验数据    ${cdn1-error}    ipad_dianbo_008    mpp_cdn_5_ipad    1

点播-cdn1-无版权－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    no_copyright
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    3
    公共-校验数据    ${cdn1-error1}    ipad_dianbo_009    mpp_cdn_5_ipad    1

点播-cdn1-视频已下线－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    off_line
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    3
    公共-校验数据    ${cdn1-error1}    ipad_dianbo_010    mpp_cdn_5_ipad    1

点播-cdn2-404－条数
    点播播放页-返回
    公共-删除数据
    公共－删除cdn配置
    公共－cdn配置    cdn2_404
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    5
    公共-校验数据    ${cdn2-error}    ipad_dianbo_011    mpp_cdn_5_ipad    1

点播-cdn2-500－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    cdn2_500
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_012    mpp_cdn_5_ipad    1

点播-cdn2-解析错误－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    cdn2_parse_error
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_013    mpp_cdn_5_ipad    1

点播-cdn2-空－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    cdn2_nul
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    15
    公共-校验数据    ${cdn2-error}    ipad_dianbo_014    mpp_cdn_5_ipad    1

点播-cdn2-超时－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    cdn2_timeout
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    40
    公共-校验数据    ${cdn2-error}    ipad_dianbo_015    mpp_cdn_5_ipad    1

点播-cdn2-status!=ok－条数
    点播播放页-返回
    公共－删除cdn配置
    公共－cdn配置    status_not_ok
    公共-删除数据
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_016    mpp_cdn_5_ipad    1

点播-cdn3-404－条数
    点播播放页-返回
    公共－删除cdn配置
    公共-删除数据
    公共－cdn配置    cdn3_404
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    15
    公共-校验数据    ${cdn3-error}    ipad_dianbo_017    mpp_cdn_5_ipad    4

播放器perr0
    公共-校验数据    {'act':'perr','retry':'0'}    mobile_01    mobile_perr_ipad    1

播放器perr1
    公共-校验数据    {'act':'perr','retry':'1'}    mobile_02    mobile_perr_ipad    1

播放器perr2
    公共-校验数据    {'act':'perr','retry':'2'}    mobile_03    mobile_perr_ipad    1

播放器perr3
    公共-校验数据    {'act':'perr','retry':'3'}    mobile_04    mobile_perr_ipad    1

点播-cdn3-500－条数
    点播播放页-返回
    公共－删除cdn配置
    公共-删除数据
    公共－cdn配置    cdn3_500
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    10
    公共-校验数据    ${cdn3-error}    ipad_dianbo_018    mpp_cdn_5_ipad    4

点播-cdn3-timeout－条数
    点播播放页-返回
    公共－删除cdn配置
    公共-删除数据
    公共－cdn配置    cdn3_timeout
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    60
    公共-校验数据    ${cdn3-error}    ipad_dianbo_020    mpp_cdn_5_ipad    1

点播-cdn3-空－条数
    点播播放页-返回
    公共－删除cdn配置
    公共-删除数据
    公共－cdn配置    cdn3_nul
    comment    tap    综合    422    316
    播放第四集
    Comment    Click Element    name=4
    sleep    10
    公共-校验数据    ${cdn3-error}    ipad_dianbo_019    mpp_cdn_5_ipad    4

*** Keywords ***
播放第四集
    Click Element    name=4
    comment    Click Element    xpath=(//XCUIElementTypeButton[@name="下载"])[1]/following-sibling::XCUIElementTypeButton[1]
