*** Settings ***
Documentation     页面跳转（首页-片库页-播放页）
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${my}             {'act':'my'}
${msgc}           {'act':'msgc'}

*** Test Cases ***
个人动态pvs
    公共－用户登录    ${mail_account_vip}    ${mail_pwd_vip}
    首页-我
    sleep    2
    公共-删除数据
    公共－点击页面文本    ${mail_name_vip}
    公共-校验数据    ${pvs}    shezhi_011    ${table_pvs}    1

个人动态pvs1
    公共-校验数据    ${pvs1}    shezhi_011    ${table_pvs1}    1

播放记录播放pvs
    comment    饭团-我的头像-返回
    非播放页-返回
    comment    公共－点击页面文本    播放记录
    公共-删除数据
    comment    公共－点击页面文本    青云志 第1集 张小凡拜入青云大竹峰
    公共－xpath    //XCUIElementTypeStaticText[@name="播放记录"]/preceding-sibling::XCUIElementTypeStaticText[last()]
    sleep    3
    公共-校验数据    ${pvs}    bofangjilu_bofang_02    ${table_pvs_dianbo}    1

播放记录播放pvs1
    公共-校验数据    ${pvs1}    bofangjilu_bofang_02    ${table_pvs1}    1

播放记录播放返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    bofangjilu_back_list    ${table_pvs}    1

播放记录播放返回pvs1
    公共-校验数据    ${pvs1}    bofangjilu_back_list    ${table_pvs1}    1

会员中心pvs
    公共-删除数据
    comment    公共-滑动页面    我的收藏    消息中心
    我－会员中心
    sleep    4
    公共-校验数据    ${pvs}    huiyuanzhongxin_vip    ${table_pvs}    1

会员中心pvs1
    公共-校验数据    ${pvs1_H5}    huiyuanzhongxin_vip    ${table_pvs1}    1

开通会员pvs
    公共-删除数据
    公共－点击页面文本    立即续费
    公共-校验数据    ${pvs}    kaitonghuiyuan_001    ${table_pvs}    1

开通会员pvs1
    公共-校验数据    ${pvs1}    kaitonghuiyuan_001    ${table_pvs1}    1

开通会员返回pvs
    公共-删除数据
    开通会员－返回
    公共-校验数据    ${pvs}    kaitonghuiyuan_002    ${table_pvs}    1

开通会员返回pvs1
    公共-校验数据    ${pvs1_H5}    kaitonghuiyuan_002    ${table_pvs1}    1

我的观影劵pvs
    公共-删除数据
    公共－点击页面文本    观影券
    公共-校验数据    ${pvs}    wodeguanyingjuan_001    ${table_pvs}    1

我的观影劵pvs1
    公共-校验数据    ${pvs1}    wodeguanyingjuan_001    ${table_pvs1}    1

我的观影劵返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    wodeguanyingjuan_002    ${table_pvs}    1

我的观影劵返回pvs1
    公共-校验数据    ${pvs1}    wodeguanyingjuan_002    ${table_pvs1}    1

我的订单pvs
    公共-删除数据
    公共－点击页面文本    赠片
    公共-校验数据    ${pvs}    wodedingdan_001    ${table_pvs}    1

我的订单pvs1
    公共-校验数据    ${pvs1_H5}    wodedingdan_001    ${table_pvs1}    1

我的订单返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    wodedingdan_002    ${table_pvs}    1

我的订单返回pvs1
    公共-校验数据    ${pvs1}    wodedingdan_002    ${table_pvs1}    1

会员福利社pvs
    公共-删除数据
    公共－点击页面文本    会员福利社
    公共-校验数据    ${pvs}    huiyuanpianku_003    ${table_pvs}    1

会员福利社pvs1
    公共-校验数据    ${pvs1_H5}    huiyuanpianku_003    ${table_pvs1}    1

会员福利社返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    huiyuanpianku_004    ${table_pvs}    1

会员福利社返回pvs1
    公共-校验数据    ${pvs1}    huiyuanpianku_004    ${table_pvs1}    1

福利券pvs
    公共-删除数据
    公共－点击页面文本    福利券
    公共-校验数据    ${pvs}    huiyuanpianku_003    ${table_pvs}    1

福利券pvs1
    公共-校验数据    ${pvs1_H5}    huiyuanpianku_003    ${table_pvs1}    1

福利券返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    huiyuanpianku_004    ${table_pvs}    1

福利券返回pvs1
    公共-校验数据    ${pvs1}    huiyuanpianku_004    ${table_pvs1}    1

会员中心返回pvs
    公共-删除数据
    comment    非播放页-返回
    会员中心-VIP返回
    公共-校验数据    ${pvs}    huiyuanzhongxin_vip_fanhui    ${table_pvs}    1

会员中心返回pvs1
    公共-校验数据    ${pvs1}    huiyuanzhongxin_vip_fanhui    ${table_pvs1}    1

芒果账户登录-历史账户登录pvs
    公共－退出登录
    公共-删除数据
    我的-点击登录
    sleep    2
    公共-校验数据    ${pvs}    bu2_014    ${table_pvs}    1

芒果账户登录-历史账户登录pvs1
    公共-校验数据    ${pvs1}    bu2_014    ${table_pvs1}    0

历史账户登录cv
    公共-校验数据    ${cv}    login_00    ${table_cv}    1

历史账户登录-我pvs
    公共-删除数据
    公共－点击页面文本    登录上次账号
    sleep    3
    公共-校验数据    ${pvs}    bu2_015    ${table_pvs}    1

历史账户登录-我pvs1
    公共-校验数据    ${pvs1}    bu2_015    ${table_pvs1}    0

*** Keywords ***
点赞消息置顶
    公共－点击页面文本    消息置顶
    公共-校验数据    ${msgc}    msgc_dianzan_up    ${table_click}    1
    Set Global Variable    ${result}

点赞取消置顶
    公共－点击页面文本    取消置顶
    公共-校验数据    ${msgc}    msgc_dianzan_upcancel    ${table_click}    1
    Set Global Variable    ${result}
