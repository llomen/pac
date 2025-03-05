*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${buy}            {'act':'buy'}
${order}          {'act':'order'}
${result1}        {'act':'result'}
${vip}            {'act':'vip'}
${pvs}            {'act':'pvs','isdebug':'0'}
${dialogpv}       {'act':'dialogpv'}
${touchpv}        {'act':'touchpv'}
${cancel}         {'act':'cancel'}

*** Test Cases ***
购买单片vip
    首页-搜索
    搜索首页－输入搜索词    ${firm_buy}
    搜索-点击搜索
    sleep    5
    搜索-点击播放
    sleep    10
    公共-删除数据
    公共－点击页面文本    购买本片
    sleep    3
    公共-校验数据    ${vip}    dianbo_001    mpp_buy_data_iphone    1

点支付dialogpv
    开通会员－单片购买
    公共-校验数据    ${dialogpv}    iphone_danpian    mpp_audit_dialogpv_iphone    1

登录后touchpv
    公共－点击页面文本    登录
    sleep    3
    公共-校验数据    ${touchpv}    iphone_danpian_002    mpp_audit_touchpv_iphone    1

order
    开通会员－单片购买
    sleep    7
    公共-校验数据    ${order}    dianbo_001    mpp_order_data_iphone    1

result
    Comment    公共－xpath    //UIAApplication[1]/UIAWindow[7]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[3]/UIAButton[1]
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${result1}    fufei_001    mpp_result_data_iphone    1

支付返回pvs
    公共-删除数据
    开通会员－返回
    sleep    2
    公共-校验数据    ${pvs}    fufei_002    mpp_pv_5_5_iphone_sdk_dianbo    1
