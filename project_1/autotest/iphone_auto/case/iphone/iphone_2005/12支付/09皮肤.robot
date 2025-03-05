*** Settings ***
Documentation     同时缓存个数->n个(会员尊享)30603、会员加速->正在缓存->开通会员30604
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
${vip_pifu}       会员酷黑皮肤

*** Test Cases ***
进入皮肤列表
    首页-我
    滚动到设置
    公共－点击页面文本    皮肤
    公共-删除数据
    sleep    5
    #皮肤列表点VIP换肤
    公共－xpath    //XCUIElementTypeStaticText[@name="${vip_pifu}"]/following-sibling::XCUIElementTypeButton[1]

皮肤列表VIP入口
    sleep    3
    公共-校验数据    ${vip}    xiazai_003    mpp_buy_data_iphone    1

皮肤列表会员order
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    xiazai_003    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_10    mpp_audit_xiadan_iphone    1

取消支付cance
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${cancel}    cancel_10    mpp_audit_xiadan_iphone    1

VIP皮肤详情页入口
    开通会员－返回
    公共－点击页面文本    ${vip_pifu}
    公共-删除数据
    公共－点击页面文本    立即使用
    sleep    5
    公共-校验数据    ${vip}    xiazai_002    mpp_buy_data_iphone    1

VIP皮肤详情页order
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    xiazai_002    mpp_order_data_iphone    1

VIP皮肤详情入口点购买click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_10    mpp_audit_xiadan_iphone    1

VIP皮肤详情入口取消支付cance
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${cancel}    cancel_10    mpp_audit_xiadan_iphone    1

*** Keywords ***
