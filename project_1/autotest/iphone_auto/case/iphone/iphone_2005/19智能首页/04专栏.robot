*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Test Cases ***
专栏曝光view
    滑动到专栏
    sleep    10
    公共-校验数据    {'event':'view','mdid':'94'}    view_04    mpp_ip_view    1

专栏点标题click
    公共-删除数据
    专栏-点标题
    sleep    3
    公共-校验数据    ${click}    click_31    ${table_channel_click}    1

进入专栏pvs
    公共-校验数据    ${pvs}    ai_zhuanlan_01    ${table_pvs_other}    1

进入专栏pvs1
    公共-校验数据    ${pvs1_H5}    ai_zhuanlan_01    ${table_pvs1}    1

进入专栏2pvs1
    公共-校验数据    ${pvs1_zl}    ai_zhuanlan_05_1    ${table_pvs1}    1

首页stay
    公共-校验数据    ${stay}    stay_30    ${table_stay}    1

专栏返回首页pvs
    公共-删除数据
    专栏H5-返回
    公共-校验数据    ${pvs}    ai_zhuanlan_02    ${table_pvs_other}    1

专栏返回首页pvs1
    公共-校验数据    ${pvs1}    ai_zhuanlan_02    ${table_pvs1}    1

专栏点图片click
    公共-删除数据
    专栏-点图片
    sleep    3
    公共-校验数据    ${click}    click_30    ${table_channel_click}    1

专栏返回
    专栏H5-返回

专栏点阅读量click
    公共-删除数据
    专栏-点阅读量
    sleep    3
    公共-校验数据    ${click}    click_33    ${table_channel_click}    1

专栏返回1
    专栏H5-返回

专栏点评论click
    公共-删除数据
    专栏-点评论
    sleep    3
    公共-校验数据    ${click}    click_32    ${table_channel_click}    1

专栏返回2
    专栏H5-返回

专栏点更多专栏click
    公共-删除数据
    专栏-点更多专栏
    公共-校验数据    ${click}    click_35    ${table_channel_click}    1

进入专栏专区pvs
    公共-校验数据    ${pvs}    ai_zhuanlan_05    ${table_pvs_other}    1

进入专栏专区pvs1
    公共-校验数据    ${pvs1}    ai_zhuanlan_05    ${table_pvs1}    1

专栏专区返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ai_zhuanlan_06    ${table_pvs_other}    1

专栏专区返回pvs1
    公共-校验数据    ${pvs1}    ai_zhuanlan_06    ${table_pvs1}    1

专栏点头像click
    公共-删除数据
    专栏-点头像
    公共-校验数据    ${click}    click_34    ${table_channel_click}    1

进入个人主页pvs
    公共-校验数据    ${pvs}    ai_zhuanlan_03    ${table_pvs_other}    1

进入个人主页pvs1
    公共-校验数据    ${pvs1}    ai_zhuanlan_03    ${table_pvs1}    1

个人主页作品-专栏曝光cv
    公共-校验数据    ${cv}    zhuye_02    ${table_cv}    1

个人主页作品专栏曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=26'}    show_zhuye_04    ${table_show}    1

点标题进专栏columnist
    公共-删除数据
    个人主页-作品-点专栏标题
    sleep    5
    公共-校验数据    ${columnist}    columnist_23    ${table_click}    1

作品-专栏pvs
    公共-校验数据    ${pvs}    ai_zhuanlan_07    ${table_pvs_other}    1

作品-专栏pvs1
    公共-校验数据    ${pvs1_H5}    ai_zhuanlan_07    ${table_pvs1}    1

作品-专栏2pvs1
    公共-校验数据    ${pvs1_zl}    ai_zhuanlan_07_1    ${table_pvs1}    1

专栏返回pvs
    公共-删除数据
    专栏H5-返回
    公共-校验数据    ${pvs}    ai_zhuanlan_08    ${table_pvs_other}    1

专栏返回pvs1
    公共-校验数据    ${pvs1}    ai_zhuanlan_08    ${table_pvs1}    1

关注up主fantuan
    公共-删除数据
    个人主页-关注
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_34    ${table_click}    1

关闭登录框
    登录页-关闭

上滑曝光导航条
    公共-删除数据
    上滑
    公共-校验数据    ${cv}    zhuye_03    ${table_cv}    1

导航条关注up主fantuan
    公共-删除数据
    个人主页-关注
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_33    ${table_click}    1

弹出登录框pv
    公共-校验数据    ${pvs}    login_001    ${table_pvs}    1

弹出登录框cv
    公共-校验数据    ${cv}    login_07    ${table_cv}    1

个人主页stay
    #作品页暂无stay
    公共-校验数据    ${stay}    stay_30    ${table_stay}    1

关闭登录框pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    login_001    ${table_pvs}    1

个人主页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ai_zhuanlan_04    ${table_pvs_other}    1

个人主页返回pvs1
    公共-校验数据    ${pvs1}    ai_zhuanlan_04    ${table_pvs1}    1
