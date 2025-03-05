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
${aplay}          {'act':'aplay'}
${buffer}         {'act':'buffer'}
${hb}             {'act':'hb'}
${cancel}         {'act':'cancel'}

*** Test Cases ***
进入点播页-试看
    sleep    3
    首页-搜索
    搜索首页－输入搜索词    ${firm_vip_free}
    搜索-点击搜索
    sleep    5
    公共-删除数据
    搜索-点击播放

reachpv
    公共-校验数据    {'act':'reachpv'}    vip_001    mpp_audit_reachpv_iphone    1

sdkload
    公共-校验数据    {'act':'sdkload'}    dianbo_002    mpp_sdkload_iphone    1

试看视频buffer
    公共-校验数据    ${buffer}    dianbovip_001    mpp_buffer_5_iphone_sdk    1

试看视频hb
    sleep    15
    公共-校验数据    ${hb}    dianbovip_001    mpp_hb_5_iphone_sdk    1

播放中开通会员入口vip
    公共-删除数据
    公共－点击页面文本    立即开通
    sleep    3
    公共-校验数据    ${vip}    dianbo_001    mpp_buy_data_iphone    1

收银台展示show_store
    sleep    3
    公共-校验数据    {'act':'show_store'}    show_02    mpp_audit_xiadan_iphone    1

试看入口pvs
    公共-校验数据    ${pvs}    shikan_001    mpp_pv_5_5_iphone_sdk_qita    1

order
    开通会员－点击开通
    sleep    5
    公共-校验数据    ${order}    dianbo_001    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_02    mpp_audit_xiadan_iphone    1

result
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${result1}    aphone_shikan_weixin    mpp_result_data_iphone    1

取消支付cance
    公共-校验数据    ${cancel}    cancel_02    mpp_audit_xiadan_iphone    1

支付返回pvs
    公共-删除数据
    开通会员－返回
    sleep    2
    公共-校验数据    ${pvs}    shikan_002    mpp_pv_5_5_iphone_sdk_qita    1

播放完成开通会员入口vip
    sleep    300
    公共-删除数据
    #试看结束点立即开通
    公共－点击页面文本    立即开通
    sleep    2
    公共-校验数据    ${vip}    dianbo_002    mpp_buy_data_iphone    1

立即开通入口pvs
    公共-校验数据    ${pvs}    shikan_001    mpp_pv_5_5_iphone_sdk_qita    1

试看结束order
    开通会员－点击开通
    公共-校验数据    ${order}    dianbo_002    mpp_order_data_iphone    1

试看结束result
    sleep    8
    公共－点击页面文本    取消
    公共-校验数据    ${result1}    aphone_bofang_zhifubao1    mpp_result_data_iphone    1

播放完成购买入口vip
    开通会员－返回
    公共-删除数据
    #试看结束点6元购买本片
    公共－点击页面文本    6元购买本片
    sleep    2
    公共-校验数据    ${vip}    dianbo_003    mpp_buy_data_iphone    1

结束后购买order
    sleep    3
    公共-删除数据
    开通会员－点击开通
    公共-校验数据    ${order}    dianbo_003    mpp_order_data_iphone    1

取消支付
    sleep    8
    公共－点击页面文本    取消
