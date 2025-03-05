*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${share}          {'act':'share'}
${table}          mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${table_click}    mpp_jiaohu_iphone

*** Test Cases ***
广场进入明星饭团pvs
    comment    公共－用户登录    ${mail_account}    ${mail_pwd}
    首页-饭团
    #切换明星饭团
    公共-删除数据
    公共－点击页面文本    刘涛
    公共-校验数据    {'act':'pvs','cpn':'7202'}    ft_wodefantuan_01    ${table_pvs}    1

我的饭团-明星饭团pvs
    公共-校验数据    {'act':'pvs','cpn':'7232'}    ft_wodefantuan_01    ${table_pvs}    1

广场进入明星饭团pvs1
    公共-校验数据    {'logtype':'pv','cntp':'fantuan_myfantuan'}    ft_wodefantuan_01    ${table_pvs1}    1

我的饭团-明星饭团pvs1
    公共-校验数据    {'logtype':'pv','cntp':'fantuan_mxzydt'}    ft_wodefantuan_01    ${table_pvs1}    1

切换到节目饭团pvs
    #切换节目饭团
    公共-删除数据
    公共－点击页面文本    快乐大本营
    公共-校验数据    {'act':'pvs','cpn':'7202'}    ft_wodefantuan_01    ${table_pvs}    1

我的饭团-节目饭团pvs
    公共-校验数据    {'act':'pvs','cpn':'7215'}    ft_wodefantuan_01    ${table_pvs}    1

切换到节目饭团pvs1
    公共-校验数据    {'logtype':'pv','cntp':'fantuan_myfantuan'}    ft_wodefantuan_01    ${table_pvs1}    1

我的饭团-节目饭团pvs1
    公共-校验数据    {'logtype':'pv','cntp':'fantuan_programpage'}    ft_wodefantuan_01    ${table_pvs1}    1

明星推荐页stay
    公共-校验数据    ${stay}    stay_14    ${table_stay}    1

切换回广场pvs
    公共-删除数据
    公共－点击页面文本    广场
    公共-校验数据    ${pvs}    ft_wodefantuan_01    ${table_pvs}    1

切换回广场pvs1
    公共-校验数据    ${pvs1}    ft_wodefantuan_01    ${table_pvs1}    1

节目饭团stay
    公共-校验数据    ${stay}    stay_15    ${table_stay}    1

添加一个饭团
    公共-删除数据
    饭团-搜索
    饭团-搜索-输入    赵丽颖
