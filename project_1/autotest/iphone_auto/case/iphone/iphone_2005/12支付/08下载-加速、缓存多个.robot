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

*** Test Cases ***
进入正在缓存
    首页-搜索
    搜索首页－输入搜索词    ${longfilm}
    搜索-点击搜索
    sleep    5
    搜索-点击播放
    sleep    5
    点播播放页-下载
    sleep    5
    下载播放视频
    公共－点击页面文本    查看缓存
    公共－点击页面文本    全部暂停

开通VIP加速入口
    公共-删除数据
    公共－点击页面文本    开通会员
    sleep    3
    公共-校验数据    ${vip}    xiazai_003    mpp_buy_data_iphone    1

order
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    xiazai_003    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_10    mpp_audit_xiadan_iphone    1

result
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${result1}    shikan_002    mpp_result_data_iphone    1

取消支付cance
    公共-校验数据    ${cancel}    cancel_10    mpp_audit_xiadan_iphone    1

同时缓存个数入口
    公共-删除数据
    公共－点击页面文本    同时缓存个数·1
    公共－点击页面文本    2个
    sleep    3
    公共-校验数据    ${vip}    xiazai_002    mpp_buy_data_iphone    1

同时缓存个数order
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    xiazai_002    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_10    mpp_audit_xiadan_iphone    1

*** Keywords ***
下载播放视频
    点击不可见文本    playlist-nowplay
