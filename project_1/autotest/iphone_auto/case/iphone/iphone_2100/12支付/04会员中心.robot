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
会员中心入口vip
    #公共－用户登录    ${mail_account_vip}    ${mail_pwd_vip}
    首页-我
    公共-删除数据
    我－会员中心
    sleep    3
    公共－点击页面文本    立即续费
    sleep    5
    公共-校验数据    ${vip}    wo_vip_001    mpp_buy_data_iphone    1

收银台展示show_store
    公共-校验数据    {'act':'show_store'}    show_06    mpp_audit_xiadan_iphone    1

order
    开通会员－点击开通
    sleep    5
    公共-校验数据    ${order}    wo_001    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_06    mpp_audit_xiadan_iphone    1

result
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${result1}    wo_001    mpp_result_data_iphone    1

取消支付cance
    公共-校验数据    ${cancel}    cancel_06    mpp_audit_xiadan_iphone    1

观影券续费入口vip
    开通会员－返回
    公共－点击页面文本    观影券
    公共-删除数据
    公共－点击页面文本    续费
    公共-校验数据    ${vip}    wo_vip_002    mpp_buy_data_iphone    1

观影券续费order
    开通会员－点击开通
    sleep    5
    公共-校验数据    ${order}    wo_002    mpp_order_data_iphone    1
