*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${buy}            {'act':'buy'}
${order}          {'act':'order'}
${result1}        {'act':'result'}
${vip}            {'act':'vip'}
${pvs}            {'act':'pvs'}
${cancel}         {'act':'cancel'}

*** Test Cases ***
直播入口pvs
    sleep    5
    上滑
    公共-删除数据
    sleep    3
    tap    多机位VIP直播测试    10    5
    sleep    10
    公共-校验数据    ${pvs}    zhibo_fufei1    mpp_pv_5_5_iphone_sdk_qita    1

切换机位pvs
    公共-删除数据
    公共－点击页面文本    机位
    sleep    5
    直播-点VIP机位
    公共-校验数据    ${pvs}    zhibo_qiehuan    mpp_pv_5_5_iphone_sdk_qita    1

直播vip机位入口
    公共-删除数据
    公共－点击页面文本    立即开通
    sleep    4
    公共-校验数据    ${vip}    zhibo_001    mpp_buy_data_iphone    1

收银台展示show_store
    公共-校验数据    {'act':'show_store'}    show_04    mpp_audit_xiadan_iphone    1

直播跳支付pvs
    公共-校验数据    ${pvs}    zhibo_fufei2    mpp_pv_5_5_iphone_sdk_qita    1

order
    开通会员－点击开通
    sleep    5
    公共-校验数据    ${order}    zhibo_001    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_04    mpp_audit_xiadan_iphone    1

取消支付cance
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${cancel}    cancel_04    mpp_audit_xiadan_iphone    1
