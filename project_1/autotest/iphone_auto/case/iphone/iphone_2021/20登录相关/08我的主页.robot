*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Force Tags        smoke
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
我的主页-粉丝fantuan
    首页-我
    我-点名字
    公共-删除数据
    饭团-个人主页-粉丝
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_01    ${table_click}    1

我的主页-粉丝pvs
    公共-校验数据    ${pvs}    ft_wodezhuye_01    ${table_pvs}    1

我的主页-粉丝pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_01    ${table_pvs1}    1

我的主页-关注fantuan
    comment    公共－点击页面文本    CutScreen Close button
    非播放页-返回
    公共-删除数据
    饭团-个人主页-关注
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_02    ${table_click}    1

我的主页-关注pvs
    公共-校验数据    ${pvs}    ft_wodezhuye_02    ${table_pvs}    1

我的主页-关注pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_02    ${table_pvs1}    1

我的主页-饭团fantuan
    非播放页-返回
    公共-删除数据
    饭团-个人主页-饭团
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_03    ${table_click}    1

我的主页-饭团pvs
    公共-校验数据    ${pvs}    ft_wodezhuye_03    ${table_pvs}    1

我的主页-饭团pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_03    ${table_pvs1}    1

我的主页-饭团-关注pvs
    公共-删除数据
    公共－点击页面文本    TA的关注
    公共-校验数据    ${pvs}    ft_wodezhuye_04    ${table_pvs}    1

我的主页-饭团-关注pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_04    ${table_pvs1}    1

我的主页-关注返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_wodezhuye_05    ${table_pvs}    1

我的主页-关注返回pvs1
    公共-校验数据    ${pvs}    ft_wodezhuye_05    ${table_pvs}    1

我的主页-编辑fantuan
    公共-删除数据
    公共－点击页面文本    编辑
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_04    ${table_click}    1

我的主页-我的信息pvs
    公共-校验数据    ${pvs}    ft_wodezhuye_06    ${table_pvs}    1

我的主页-我的信息pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_06    ${table_pvs1}    1

我的主页stay
    公共-校验数据    ${stay}    stay_11    ${table_stay}    1

我的主页-点所在地fantuan
    公共-删除数据
    点击不可见文本    所在地
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_05    ${table_click}    1

我的主页-设置所在地fantuan
    公共-删除数据
    公共－点击页面文本    确定
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_06    ${table_click}    1

我的主页-点个性签名fantuan
    公共-删除数据
    点击不可见文本    个性签名
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_07    ${table_click}    1

我的主页-跳转签名页面pvs
    公共-校验数据    ${pvs}    ft_wodezhuye_07    ${table_pvs}    1

我的主页-跳转签名页面pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_07    ${table_pvs1}    1

我的主页-保存个性签名fantuan
    公共-删除数据
    公共－点击页面文本    保存
    公共-校验数据    ${fantuan}    fantuan_wodezhuye_08    ${table_click}    1

我的主页-签名页面返回pvs
    公共-校验数据    ${pvs}    ft_wodezhuye_08    ${table_pvs}    1

我的主页-签名页面返回pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_08    ${table_pvs1}    1

我的主页-我的信息返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_wodezhuye_09    ${table_pvs}    1

我的主页-我的信息返回pvs1
    公共-校验数据    ${pvs1}    ft_wodezhuye_09    ${table_pvs1}    1
