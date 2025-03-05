*** Settings ***
Suite Setup       启动应用2
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${my}             {'act':'my'}
${table}          mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${table_click}    mpp_jiaohu_iphone
${search_mingxing}    赵丽颖
${search_jiemu}    快乐大本营

*** Test Cases ***
点击搜索fantuan
    首页-饭团
    公共-删除数据
    饭团-搜索
    公共-校验数据    ${fantuan}    fantuan_tuijian_04    ${table_click}    1

推荐页-搜索页pvs
    公共-校验数据    ${pvs}    ft_tuijian_021    ${table_pvs}    1

推荐页-搜索页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_021    ${table_pvs1}    1

搜索页-搜索结果页pvs
    run keyword and ignore error    公共－点击页面文本    清空历史
    公共-删除数据
    饭团-搜索-输入    ${search_mingxing}
    公共-校验数据    ${pvs}    ft_tuijian_022    ${table_pvs}    1

搜索页-搜索结果页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_022    ${table_pvs1}    1

搜索fantuan
    公共-校验数据    ${fantuan}    fantuan_sousuo_06    ${table_click}    1

搜索页stay
    公共-校验数据    ${stay}    stay_07    ${table_stay}    1

取消搜索fantuan
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_sousuo_02    ${table_click}    1

搜索结果页-推荐页pvs
    公共-校验数据    ${pvs}    ft_tuijian_024    ${table_pvs}    1

搜索结果页-推荐页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_024    ${table_pvs1}    1

搜索结果页stay
    公共-校验数据    ${stay}    stay_08    ${table_stay}    1

搜索推荐fantuan
    饭团-搜索
    公共-删除数据
    公共－xpath    //XCUIElementTypeStaticText[@name="1"]/following-sibling::XCUIElementTypeButton[1]
    公共-校验数据    ${fantuan}    fantuan_sousuo_01    ${table_click}    1

搜索历史fantuan
    公共－点击页面文本    取消
    饭团-搜索
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="fantuan search delete"])[1]/preceding-sibling::XCUIElementTypeButton[1]
    公共-校验数据    ${fantuan}    fantuan_sousuo_03    ${table_click}    1

结果页点饭团头像fantuan
    公共-删除数据
    饭团-结果页-饭团主页
    公共-校验数据    ${fantuan}    fantuan_sousuo_04    ${table_click}    1

结果页-明星饭团主页pvs
    公共-校验数据    ${pvs}    ft_tuijian_025    ${table_pvs}    1

结果页-明星饭团主页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_025    ${table_pvs1}    1

饭团主页-结果页pvs
    饭团-明星-退出饭团
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_tuijian_026    ${table_pvs}    1

饭团主页-结果页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_026    ${table_pvs1}    1

结果页点加入fantuan
    公共-删除数据
    公共－点击页面文本    + 加入
    公共-校验数据    ${fantuan}    fantuan_sousuo_05    ${table_click}    1

结果页跳登录pvs
    公共-校验数据    ${pvs}    ft_sousuo_01    ${table_pvs}    1

结果页跳登录pvs1
    公共-校验数据    ${pvs1}    ft_sousuo_01    ${table_pvs1}    0

结果页登录弹出cv
    公共-校验数据    ${cv}    login_05    ${table_cv}    1

登录返回结果页pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_sousuo_02    ${table_pvs}    1

登录返回结果页pvs1
    公共-校验数据    ${pvs1}    ft_sousuo_02    ${table_pvs1}    0

结果页-节目饭团主页pvs
    Clear Text    name=search_textField
    饭团-搜索-输入    ${search_jiemu}
    公共-删除数据
    点击不可见文本    xpath=(//XCUIElementTypeStaticText[@name="${search_jiemu}"])[1]
    公共-校验数据    ${pvs}    ft_tuijian_027    ${table_pvs}    1

结果页-节目饭团主页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_027    ${table_pvs1}    1

节目饭团主页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_tuijian_028    ${table_pvs}    1

节目饭团主页返回pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_028    ${table_pvs1}    1

节目主页stay
    公共-校验数据    ${stay}    stay_12    ${table_stay}    1

点第一条动态头像fantuan
    公共-删除数据
    饭团-结果页-第一个发布者
    公共-校验数据    ${fantuan}    fantuan_sousuo_07    ${table_click}    1

结果页-个人主页pvs
    公共-校验数据    ${pvs}    ft_sousuo_03    ${table_pvs}    1

结果页-个人主页pvs1
    公共-校验数据    ${pvs1}    ft_sousuo_03    ${table_pvs1}    1

个人主页-结果页pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    ft_sousuo_04    ${table_pvs}    1

个人主页-结果页pvs1
    公共-校验数据    ${pvs1}    ft_sousuo_04    ${table_pvs1}    1
