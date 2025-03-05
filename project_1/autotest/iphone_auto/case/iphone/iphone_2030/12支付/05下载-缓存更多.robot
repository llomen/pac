*** Settings ***
Documentation     VIP下载、分集下载、分集试看
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
下载跳会员入口
    sleep    5
    首页-青云志
    sleep    15
    点播播放页-下载
    公共-删除数据
    公共－点击页面文本    确定
    sleep    5
    公共-校验数据    ${vip}    xiazai_001    mpp_buy_data_iphone    1

收银台展示show_store
    公共-校验数据    {'act':'show_store'}    show_09    mpp_audit_xiadan_iphone    1

下载跳会员order
    开通会员－点击开通
    sleep    5
    公共-校验数据    ${order}    xiazai_001    mpp_order_data_iphone    1

返回首页
    公共－点击页面文本    取消
    开通会员－返回
    点播播放页-返回

分集付费入口
    首页-缓存
    删除全部缓存
    非播放页-返回
    首页-搜索
    搜索首页－输入搜索词    古镜
    搜索-点击搜索
    sleep    3
    tap    nsp= name=="13" and visible==true    0    0
    公共-删除数据
    sleep    15
    公共-删除数据
    公共－点击页面文本    开通会员
    sleep    5
    公共-校验数据    ${vip}    dianbo_001    mpp_buy_data_iphone    1

分集付费order
    公共-删除数据
    开通会员－点击开通
    sleep    5
    公共-校验数据    ${order}    dianbo_001    mpp_order_data_iphone    1

退出支付
    sleep    10
    公共－点击页面文本    取消
    开通会员－返回

分集下载入口
    sleep    2
    点播播放页-下载
    #下载普通视频用于缓存更多
    公共－点击页面文本    1
    公共-删除数据
    click element    nsp= name=="13" and visible==true
    sleep    3
    公共－点击页面文本    立即开通
    sleep    5
    公共-校验数据    ${vip}    xiazai_001    mpp_buy_data_iphone    1

下载列表跳支付pvs
    公共-校验数据    {'act':'pvs','isdebug':'0','cpn':'50'}    xiazai_zhifu1    mpp_pv_5_5_iphone_sdk_qita    1

分集下载order
    开通会员－点击开通
    sleep    3
    公共-校验数据    ${order}    xiazai_001    mpp_order_data_iphone    1

点击购买按钮click_pay_button
    公共-校验数据    {'act':'click_pay_button'}    click_07    mpp_audit_xiadan_iphone    1

result
    sleep    10
    公共－点击页面文本    取消
    公共-校验数据    ${result1}    aphone_fenji_xiazai    mpp_result_data_iphone    1

取消支付cance
    公共-校验数据    ${cancel}    cancel_07    mpp_audit_xiadan_iphone    1

支付返回下载列表pvs
    公共-删除数据
    开通会员－返回
    sleep    2
    公共-校验数据    ${pvs}    xiazai_zhifu2    mpp_pv_5_5_iphone_sdk_qita    1

进入缓存剧集列表
    #点播播放页-退出下载
    点播播放页-返回
    搜索－取消
    首页-我
    我的-缓存
    公共－点击页面文本    古镜
    公共－点击页面文本    缓存更多
    上滑
    公共-删除数据
    公共－点击页面文本    第13集

缓存更多入口
    公共－点击页面文本    立即开通
    sleep    5
    公共-校验数据    ${vip}    xiazai_001    mpp_buy_data_iphone    1

缓存更多order
    开通会员－点击开通
    sleep    3
    公共-校验数据    ${order}    xiazai_001    mpp_order_data_iphone    1

缓存更多取消支付cance
    公共－点击页面文本    取消
    公共-校验数据    ${cancel}    cancel_07    mpp_audit_xiadan_iphone    1
