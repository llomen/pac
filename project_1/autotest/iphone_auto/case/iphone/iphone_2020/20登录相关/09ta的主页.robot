*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${my}             {'act':'my'}
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone

*** Test Cases ***
ta的主页-粉丝fantuan
    首页-饭团
    comment    公共－点击页面文本    推荐
    上滑
    sleep    3
    饭团-动态-发布者
    公共-删除数据
    饭团-个人主页-粉丝
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_01    ${table_click}    1

ta的主页-ta的粉丝pvs
    公共-校验数据    ${pvs}    ft_zhuye_13    ${table_pvs}    1

ta的主页-ta的粉丝pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_13    ${table_pvs1}    1

ta的主页-粉丝关注fantuan
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="+ 关注"])[1]
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_27    ${table_click}    1

跳转登录页pvs
    公共-校验数据    ${pvs}    ft_zhuye_01    ${table_pvs}    1

跳转登录页pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_01    ${table_pvs1}    1

登录后跳转返回
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}
    sleep    2

登录后关注
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="+ 关注"])[1]
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_27    ${table_click}    1

ta的主页-粉丝取消关注fantuan
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="已关注"])[1]
    公共－点击页面文本    取消关注
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_28    ${table_click}    1

ta的粉丝返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_zhuye_02    ${table_pvs}    1

ta的粉丝返回pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_02    ${table_pvs1}    1

ta的主页-关注fantuan
    comment    公共－点击页面文本    CutScreen Close button
    公共-删除数据
    饭团-个人主页-关注
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_02    ${table_click}    1

ta的主页-ta的关注pvs
    公共-校验数据    ${pvs}    ft_zhuye_03    ${table_pvs}    1

ta的主页-ta的关注pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_03    ${table_pvs1}    1

ta的关注返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_zhuye_04    ${table_pvs}    1

ta的关注返回pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_04    ${table_pvs1}    1

ta的主页-饭团fantuan
    公共-删除数据
    饭团-个人主页-饭团
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_04    ${table_click}    1

ta的主页-ta的饭团pvs
    公共-校验数据    ${pvs}    ft_zhuye_05    ${table_pvs}    1

ta的饭团-加饭团fantuan
    公共-删除数据
    comment    饭团-ta的饭团-加入第一个
    ${aa}=    Run Keyword And Return Status    Page Should Contain Text    + 加入
    run keyword if    ${aa}    加入饭团
    ...    ELSE    获取已关注饭团
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_03    ${table_click}    1

ta的饭团-饭团主页pvs
    公共-删除数据
    公共－点击页面文本    ${ft_name}
    公共-校验数据    ${pvs}    ft_zhuye_06    ${table_pvs}    1

ta的饭团-饭团主页pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_06    ${table_pvs1}    1

ta的饭团-饭团主页fantuan
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_26    ${table_click}    1

返回ta的饭团pvs
    饭团-明星-退出饭团
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_zhuye_07    ${table_pvs}    1

返回ta的饭团pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_07    ${table_pvs1}    1

ta的饭团-ta的粉丝pvs
    公共-删除数据
    公共－点击页面文本    TA的粉丝
    公共-校验数据    ${pvs}    ft_zhuye_08    ${table_pvs}    1

ta的饭团-ta的粉丝pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_08    ${table_pvs1}    1

ta的粉丝-ta的关注pvs
    公共-删除数据
    公共－点击页面文本    TA的关注
    公共-校验数据    ${pvs}    ft_zhuye_09    ${table_pvs}    1

ta的关注-ta的饭团pvs
    公共-删除数据
    公共－点击页面文本    TA的饭团
    公共-校验数据    ${pvs}    ft_zhuye_10    ${table_pvs}    1

ta的饭团返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_zhuye_11    ${table_pvs}    1

ta的主页-点关注fantuan
    公共-删除数据
    判断后点击    已关注
    公共－点击页面文本    + 关注
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_27    ${table_click}    1

ta的主页-点已关注fantuan
    公共-删除数据
    公共－点击页面文本    已关注
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_28    ${table_click}    1

ta的主页-点更多fantuan
    公共－点击页面文本    + 关注
    公共-删除数据
    饭团-明星-更多
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_29    ${table_click}    1

ta的主页-点取消关注fantuan
    公共-删除数据
    公共－点击页面文本    取消关注
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_30    ${table_click}    1

退出ta的主页pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_zhuye_12    ${table_pvs}    1

退出ta的主页pvs1
    公共-校验数据    ${pvs1}    ft_zhuye_12    ${table_pvs1}    1

*** Keywords ***
加入饭团
    ${ft_name}    Get Element Attribute    xpath=//XCUIElementTypeButton[@name="+ 加入"][1]/preceding-sibling::XCUIElementTypeStaticText[1]    name
    Set Global Variable    ${ft_name}
    公共－xpath    //XCUIElementTypeButton[@name="+ 加入"][1]

获取已关注饭团
    ${ft_name}    Get Element Attribute    xpath=//XCUIElementTypeButton[@name="进入"][1]/preceding-sibling::XCUIElementTypeStaticText[1]    name
    Set Global Variable    ${ft_name}
