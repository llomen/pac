*** Settings ***
Suite Setup       公共－启动应用
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
首页vip入口
    首页-vip
    公共-删除数据
    公共－点击页面文本    立即开通
    sleep    5
    公共-校验数据    ${vip}    vip_pindao    mpp_buy_data_iphone    1

收银台展示show_store
    公共-校验数据    {'act':'show_store','osType':'iphone'}    show_03    mpp_audit_xiadan_iphone    1

收银台展示完成show_store_finish
    公共-校验数据    {'act':'show_store_finish'}    show_03    mpp_audit_xiadan_iphone    1

用户展示完成show_user_finish
    公共-校验数据    {'act':'show_user_finish'}    show_03    mpp_audit_xiadan_iphone    1

产品展示完成show_product_finish
    公共-校验数据    {'act':'show_product_finish'}    show_03    mpp_audit_xiadan_iphone    1

点确认支付跳登录pvs
    公共-删除数据
    开通会员－点击开通
    sleep    3
    公共-校验数据    ${pvs}    ft_tuijian_033    ${table_pvs}    1

点确认支付跳登录pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_033    ${table_pvs1}    1

未登录无order
    公共-校验数据    ${order}    vip_pindao    mpp_order_data_iphone    0

登录返回支付页pvs
    公共-删除数据
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}
    sleep    3
    公共-校验数据    ${pvs}    ft_tuijian_033    ${table_pvs}    1

登录返回支付页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_033    ${table_pvs1}    1

order
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    vip_pindao    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_03    mpp_audit_xiadan_iphone    1

取消支付cance
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${cancel}    cancel_03    mpp_audit_xiadan_iphone    1

切换金额
    公共－点击页面文本    连续包季

切换金额order
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    vip_pindao    mpp_order_data_iphone    1

切换金额购买click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_03    mpp_audit_xiadan_iphone    1

切换金额取消支付cance
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${cancel}    cancel_03    mpp_audit_xiadan_iphone    1

切换全屏影视会员
    公共－点击页面文本    全屏影视会员

切换会员类型order
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    vip_pindao    mpp_order_data_iphone    1

切换会员类型购买click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_03    mpp_audit_xiadan_iphone    1

切换会员类型取消支付cance
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${cancel}    cancel_03    mpp_audit_xiadan_iphone    1
