*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Force Tags        smoke
Resource          ../5.3对象库.robot


*** Variables ***
${phone_account}    18501760103
${phone_pwd}      3324156
${click}          {'act':'click'}
${verifyimgget}    {'act':'VerifyImgGet'}
${dologin}        {'act':'DoLogin'}
${logout}         {'act':'Logout'}

*** Test Cases ***
注册pvs
    首页-我
    我的-点击登录
    登录-是否有历史页面
    公共-删除数据
    公共－点击页面文本    注册
    公共-校验数据    ${pvs}    42_login01    ${table_pvs}    1

注册pvs1
    公共-校验数据    ${pvs1}    42_login01    ${table_pvs1}    1

图片验证码VerifyImgGet
    sleep    3
    公共-校验数据    ${verifyimgget}    login_img    ${table_click}_login    1

注册返回pvs
    公共-删除数据
    公共－点击页面文本    back icon
    公共-校验数据    ${pvs}    42_login02    ${table_pvs}    1

注册返回pvs1
    公共-校验数据    ${pvs1}    42_login02    ${table_pvs1}    1

邮箱登录pvs
    公共-删除数据
    登录-切换邮箱登录
    公共-校验数据    ${pvs}    42_login06    ${table_pvs}    1

邮箱登录pvs1
    公共-校验数据    ${pvs1}    42_login06    ${table_pvs1}    1

邮箱登录成功pvs
    公共-删除数据
    芒果登录－输入账号    ${mail_account}
    芒果登录－输入密码    ${mail_pwd}
    公共-校验数据    ${pvs}    42_login04    ${table_pvs}    1

邮箱登录成功pvs1
    公共-校验数据    ${pvs1}    42_login04    ${table_pvs1}    1

邮箱登录dologin
    公共-校验数据    ${dologin}    login_001    ${table_click}_login    1

退出登录pvs
    进入退出登录
    公共-删除数据
    sleep    2
    点击退出登录
    sleep    2
    公共-校验数据    ${pvs}    42_login05    ${table_pvs}    1

退出登录pvs1
    公共-校验数据    ${pvs1}    42_login05    ${table_pvs1}    1

退出登录click
    公共-校验数据    ${logout}    logout_001    ${table_click}_login    1

账号密码登录pvs
    我的-点击登录
    登录-是否有历史页面
    公共-删除数据
    sleep    2
    公共－点击页面文本    帐号密码登录
    公共-校验数据    ${pvs}    42_login03    ${table_pvs}    1

账号密码登录pvs1
    公共-校验数据    ${pvs1}    42_login03    ${table_pvs1}    1

手机号登录成功pvs
    公共-删除数据
    手机密码登录－输入手机号    ${phone_account}
    手机密码登录－输入密码    ${phone_pwd}
    放弃记录合并
    公共-校验数据    ${pvs}    42_login07    ${table_pvs}    1

手机号登录成功pvs1
    公共-校验数据    ${pvs1}    42_login07    ${table_pvs1}    1

手机号登录dologin
    公共-校验数据    ${dologin}    login_003    ${table_click}_login    1
