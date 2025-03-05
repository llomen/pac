*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Test Cases ***
vippvs
    sleep    2
    公共-删除数据
    首页-vip
    公共-校验数据    ${pvs}    vip_001    ${table_pvs}    1

vippvs1
    公共-校验数据    ${pvs1}    vip_001    ${table_pvs1}    1

会员首页pd
    公共-删除数据
    首页-vip
    公共-校验数据    ${pd}    pd_1    ${table_click}    1

搜索页pvs
    公共-删除数据
    vip-搜索
    公共-校验数据    ${pvs}    vip_004    ${table_pvs}    1

搜索页pvs1
    公共-校验数据    ${pvs1}    vip_004    ${table_pvs1}    1

搜索页返回pvs
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${pvs}    vip_005    ${table_pvs}    1

搜索页返回pvs1
    公共-校验数据    ${pvs1}    vip_005    ${table_pvs1}    1

开通会员pvs
    公共-删除数据
    公共－点击页面文本    立即开通
    sleep    2
    公共-校验数据    ${pvs}    vip_006    ${table_pvs}    1

开通会员pvs1
    公共-校验数据    ${pvs1}    vip_006    ${table_pvs1}    1

开通会员返回pvs
    公共-删除数据
    开通会员－返回
    公共-校验数据    ${pvs}    vip_007    ${table_pvs}    1

开通会员返回pvs1
    公共-校验数据    ${pvs1}    vip_007    ${table_pvs1}    1

会员首页-VIP俱乐部pvs
    公共-删除数据
    频道页-切换tab    VIP俱乐部
    公共-校验数据    ${pvs}    bu2_007    ${table_pvs}    1

会员首页-VIP俱乐部pvs1
    公共-校验数据    ${pvs1}    bu2_007    ${table_pvs1}    1

VIP俱乐部pd
    公共-校验数据    ${pd}    pd_2    ${table_click}    1

VIP俱乐部-芒果二次元pvs
    comment    按元素右滑    name=VIP俱乐部
    公共-删除数据
    频道页-切换tab    芒果二次元
    公共-校验数据    ${pvs}    bu2_008    ${table_pvs}    1

VIP俱乐部-芒果二次元pvs1
    公共-校验数据    ${pvs1}    bu2_008    ${table_pvs1}    1

芒果二次元-会员首页pvs
    公共-删除数据
    comment    按元素左滑    name=芒果二次元
    comment    按元素左滑    name=一周追剧指南
    sleep    2
    公共－xpath    //XCUIElementTypeStaticText[@name="精选"]
    公共-校验数据    ${pvs}    bu2_009    ${table_pvs}    1

芒果二次元-会员首页pvs1
    公共-校验数据    ${pvs1}    bu2_009    ${table_pvs1}    1

播放页pvs
    公共-删除数据
    公共－xpath    //XCUIElementTypeTable/XCUIElementTypeCell[1]
    Comment    公共－点击坐标点    100    480
    sleep    3
    公共-校验数据    ${pvs}    vip_008    ${table_pvs_dianbo}    1

播放页pvs1
    公共-校验数据    ${pvs1}    vip_008    ${table_pvs1}    1
