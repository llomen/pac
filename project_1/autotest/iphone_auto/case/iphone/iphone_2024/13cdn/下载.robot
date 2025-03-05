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
点播下载-cdn1-404－条数
    首页-搜索
    搜索首页－输入搜索词    活色生香
    搜索-点击搜索
    公共-删除数据
    公共－删除cdn配置
    播放第四集
    公共－cdn配置    404
    搜索－下载
    Click Element    name=35
    sleep    10
    公共-校验数据    ${cdn1-error}    ipad_dianbo_021    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn1-500－条数
    搜索－删除下载
    公共－删除cdn配置
    公共－cdn配置    500
    公共－清除数据
    Click Element    name=35
    sleep    10
    公共-校验数据    ${cdn1-error}    ipad_dianbo_022    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn1-解析错误－条数
    搜索－删除下载
    公共－删除cdn配置
    公共－cdn配置    parse_error
    公共－清除数据
    Click Element    name=35
    sleep    10
    公共-校验数据    ${cdn1-error}    ipad_dianbo_023    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn1-空－条数
    搜索－删除下载
    公共－删除cdn配置
    公共－cdn配置    nul
    公共－清除数据
    Click Element    name=35
    sleep    10
    公共-校验数据    ${cdn1-error}    ipad_dianbo_024    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn1-超时－条数
    搜索－删除下载
    公共－删除cdn配置
    公共－cdn配置    timeout
    公共－清除数据
    Click Element    name=35
    sleep    40
    公共-校验数据    ${cdn1-error}    ipad_dianbo_025    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn1-无版权－条数
    搜索－删除下载
    公共－删除cdn配置
    公共－cdn配置    no_copyright
    公共－清除数据
    Click Element    name=35
    sleep    10
    公共-校验数据    ${cdn1-error1}    ipad_dianbo_026    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn1-视频已下线－条数
    搜索－删除下载
    公共－删除cdn配置
    公共－cdn配置    off_line
    公共－清除数据
    Click Element    name=35
    sleep    10
    公共-校验数据    ${cdn1-error1}    ipad_dianbo_027    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn2-404－条数
    搜索－删除下载
    公共－删除cdn配置
    公共－cdn配置    cdn2_404
    公共－清除数据
    Click Element    name=8
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_028    mpp_cdn_5_ipad_xiazai    3

点播下载-cdn2-500－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－cdn配置    cdn2_500
    公共－清除数据
    Click Element    name=8
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_029    mpp_cdn_5_ipad_xiazai    3

点播下载-cdn2-解析错误－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－cdn配置    cdn2_parse_error
    公共－清除数据
    Click Element    name=8
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_030    mpp_cdn_5_ipad_xiazai    3

点播下载-cdn2-空－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－cdn配置    cdn2_nul
    公共－清除数据
    Click Element    name=8
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_031    mpp_cdn_5_ipad_xiazai    3

点播下载-cdn2-超时－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－cdn配置    cdn2_timeout
    公共－清除数据
    Click Element    name=8
    sleep    40
    公共-校验数据    ${cdn2-error}    ipad_dianbo_032    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn2-status!=ok－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－cdn配置    status_not_ok
    公共－清除数据
    Click Element    name=8
    sleep    10
    公共-校验数据    ${cdn2-error}    ipad_dianbo_033    mpp_cdn_5_ipad_xiazai    3

点播下载-cdn3-404－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－清除数据
    公共－cdn配置    cdn3_404
    Click Element    name=8
    sleep    10
    公共-校验数据    ${cdn3-error}    ipad_dianbo_034    mpp_cdn_5_ipad_xiazai    3

点播下载-cdn3-500－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－清除数据
    公共－cdn配置    cdn3_500
    Click Element    name=8
    sleep    10
    公共-校验数据    ${cdn3-error}    ipad_dianbo_035    mpp_cdn_5_ipad_xiazai    3

点播下载-cdn3-timeout－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－清除数据
    公共－cdn配置    cdn3_timeout
    Click Element    name=8
    sleep    60
    公共-校验数据    ${cdn3-error}    ipad_dianbo_037    mpp_cdn_5_ipad_xiazai    1

点播下载-cdn3-空－条数
    搜索－删除下载2
    公共－删除cdn配置
    公共－清除数据
    公共－cdn配置    cdn3_nul
    Click Element    name=8
    sleep    10
    #搜索－删除下载
    公共-校验数据    ${cdn3-error}    ipad_dianbo_036    mpp_cdn_5_ipad_xiazai    2

删除下载内容
    公共－删除cdn配置
    Click Element    name=close icon
    sleep    3
    搜索－取消
    首页－离线缓存
    Click Element    //XCUIElementTypeButton[@name=" 删除"]
    sleep    2
    Click Element    name=playlist delete icon
    sleep    2
    Click Element    name=确定
    sleep    2
