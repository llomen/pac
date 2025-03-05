*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Variables ***
${msgc}           {'act':'msgc'}
${my}             {'act':'my'}

*** Test Cases ***
我pvs
    公共-删除数据
    首页-我
    公共-校验数据    ${pvs}    wo_001    ${table_pvs}    1

我pvs1
    公共-校验数据    ${pvs1}    wo_001    ${table_pvs1}    1

会员中心pvs
    公共-删除数据
    我－会员中心
    sleep    2
    公共-校验数据    ${pvs}    huiyuanzhongxin_001    ${table_pvs}    1

会员中心pvs1
    公共-校验数据    ${pvs1}    huiyuanzhongxin_001    ${table_pvs1}    1

VIP会员my
    公共-校验数据    ${my}    my_huiyuan    ${table_click}    1

VIP会员返回pvs
    公共-删除数据
    开通会员－返回
    公共-校验数据    ${pvs}    huiyuanzhongxin_002    ${table_pvs}    1

VIP会员返回pvs1
    公共-校验数据    ${pvs1}    huiyuanzhongxin_002    ${table_pvs1}    1

我的崽崽show
    公共-校验数据    ${show}    mgzai_01    ${table_show_ft}    1

登录pvs
    公共-删除数据
    我的-点击登录
    公共-校验数据    ${pvs}    denglu_001    ${table_pvs}    1

登录pvs1
    公共-校验数据    ${pvs1}    denglu_001    ${table_pvs1}    1

邮箱登录pvs
    登录-是否有历史页面
    公共-删除数据
    登录-切换邮箱登录
    sleep    2
    公共-校验数据    ${pvs}    loginmangguo_001    ${table_pvs}    1

邮箱登录pvs1
    公共-校验数据    ${pvs1}    loginmangguo_001    ${table_pvs1}    1

邮箱登录-忘记密码pvs
    公共-删除数据
    公共－点击页面文本    忘记密码？
    公共-校验数据    ${pvs}    bu2_010    ${table_pvs}    1

邮箱登录-忘记密码pvs1
    公共-校验数据    ${pvs1}    bu2_010    ${table_pvs1}    1

忘记密码-邮箱登录pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    bu2_011    ${table_pvs}    1

忘记密码-邮箱登录pvs1
    公共-校验数据    ${pvs1}    bu2_011    ${table_pvs1}    1

邮箱登录返回pvs
    公共-删除数据
    登录－后退
    sleep    1
    公共-校验数据    ${pvs}    loginmangguo_002    ${table_pvs}    1

邮箱登录返回pvs1
    公共-校验数据    ${pvs1}    loginmangguo_002    ${table_pvs1}    1

手机登录-历史登录pvs
    公共-删除数据
    登录－后退
    sleep    1
    公共-校验数据    ${pvs}    loginmangguo_002    ${table_pvs}    1

手机登录-历史登录pvs1
    公共-校验数据    ${pvs1}    loginmangguo_002    ${table_pvs1}    1

历史登录返回我的pvs
    公共-删除数据
    登录页-关闭
    sleep    1
    公共-校验数据    ${pvs}    loginmangguo_003    ${table_pvs}    1

历史登录返回我的pvs1
    公共-校验数据    ${pvs1}    loginmangguo_003    ${table_pvs1}    1

消息中心未登录pvs
    公共-删除数据
    sleep    2
    comment    公共－点击页面文本    我的消息
    我的-消息中心
    公共-校验数据    ${pvs}    xiaoxizhongxin_001    ${table_pvs}    1

消息中心未登录pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_001    ${table_pvs1}    1

我的消息my
    公共-校验数据    ${my}    my_xiaoxi_02    ${table_click}    1

我的消息msgc
    公共-校验数据    ${msgc}    msgc_xiaoxi_login_not    ${table_click}    1

消息中心-登录pvs
    公共-删除数据
    公共－点击页面文本    立即登录
    公共-校验数据    ${pvs}    xiaoxizhongxin_login    ${table_pvs}    1

消息中心-登录pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_login    ${table_pvs1}    0

消息中心-登录msgc
    公共-校验数据    ${msgc}    msgc_xiaoxi_clicklogin    ${table_click}    1

消息中心-登录cv
    公共-校验数据    ${cv}    login_09    ${table_cv}    1

登录-消息中心pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    xiaoxizhongxin_login_back    ${table_pvs}    1

登录-消息中心pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_login_back    ${table_pvs1}    0

消息中心返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    xiaoxizhongxin_005    ${table_pvs}    1

消息中心返回pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_005    ${table_pvs1}    1

离线缓存pvs
    公共-删除数据
    我的-缓存
    公共-校验数据    ${pvs}    lixianhuancun_001    ${table_pvs}    1

离线缓存pvs1
    公共-校验数据    ${pvs1}    lixianhuancun_001    ${table_pvs1}    1

离线缓存my
    公共-校验数据    ${my}    my_lixian    ${table_click}    1

离线缓存返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    lixianhuancun_002    ${table_pvs}    1

离线缓存返回pvs1
    公共-校验数据    ${pvs1}    lixianhuancun_002    ${table_pvs1}    1

我的服务pvs
    公共-删除数据
    滚动到设置
    公共－点击页面文本    更多
    公共-校验数据    ${pvs}    xiaoxizhongxin_006    ${table_pvs}    1

我的服务pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_006    ${table_pvs1}    1

我的服务my
    公共-校验数据    ${my}    my_service    ${table_click}    1

我的服务-活动中心pvs
    公共-删除数据
    公共－点击页面文本    活动中心
    公共-校验数据    ${pvs}    xiaoxizhongxin_008    ${table_pvs}    1

我的服务-活动中心pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_008    ${table_pvs1}    1

我的服务-活动中心my
    公共-校验数据    ${my}    my_service_shoucang    ${table_click}    1

活动中心-我的服务pvs
    公共-删除数据
    page should contain text    活动中心
    非播放页-返回
    公共-校验数据    ${pvs}    xiaoxizhongxin_009    ${table_pvs}    1

活动中心-我的服务pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_009    ${table_pvs1}    1

编辑my
    公共－点击页面文本    编辑
    我的服务-添加    活动中心
    我的服务-添加    皮肤
    run keyword and ignore error    公共－点击页面文本    牛奶盒子
    公共－点击页面文本    完成
    公共-校验数据    ${my}    my_service_bianji    ${table_click}    1

我的服务返回pvs
    公共-删除数据
    page should contain text    我的服务
    非播放页-返回
    公共-校验数据    ${pvs}    xiaoxizhongxin_007    ${table_pvs}    1

我的服务返回pvs1
    公共-校验数据    ${pvs1}    xiaoxizhongxin_007    ${table_pvs1}    1

活动中心pvs
    公共-删除数据
    公共－点击页面文本    活动中心
    公共-校验数据    ${pvs}    huodongzhongxin_001    ${table_pvs}    1

活动中心pvs1
    公共-校验数据    ${pvs1}    huodongzhongxin_001    ${table_pvs1}    1

活动中心my
    公共-校验数据    ${my}    my_wode_huodong    ${table_click}    1

活动中心返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    huodongzhongxin_002    ${table_pvs}    1

活动中心返回pvs1
    公共-校验数据    ${pvs1}    huodongzhongxin_002    ${table_pvs1}    1

帮助反馈pvs
    公共-删除数据
    公共－点击页面文本    帮助反馈
    公共-校验数据    ${pvs}    bangzhufankui_001    ${table_pvs}    1

帮助反馈pvs1
    公共-校验数据    ${pvs1}    bangzhufankui_001    ${table_pvs1}    1

帮助反馈my
    公共-校验数据    ${my}    my_wode_bangzhu    ${table_click}    1

帮助反馈返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    bangzhufankui_002    ${table_pvs}    1

帮助反馈返回pvs1
    公共-校验数据    ${pvs1}    bangzhufankui_002    ${table_pvs1}    1

设置pvs
    Comment    滚动到设置
    公共-删除数据
    公共－点击页面文本    设置
    公共-校验数据    ${pvs}    shezhi_001    ${table_pvs}    1

设置pvs1
    公共-校验数据    ${pvs1}    shezhi_001    ${table_pvs1}    1

设置my
    公共-校验数据    ${my}    my_wode_shezhi    ${table_click}    1

账号与安全pvs
    公共-删除数据
    设置-账号与安全
    公共-校验数据    ${pvs}    shezhi_012    ${table_pvs}    1

账号与安全pvs1
    公共-校验数据    ${pvs1}    shezhi_012    ${table_pvs1}    0

登录cv
    公共-校验数据    ${cv}    login_08    ${table_cv}    1

账号与安全返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    shezhi_013    ${table_pvs}    1

账号与安全返回pvs1
    公共-校验数据    ${pvs1}    shezhi_013    ${table_pvs1}    0

关于我们pvs
    公共-删除数据
    滚动到退出登录
    设置-关于我们
    sleep    3
    公共-校验数据    ${pvs}    shezhi_003    ${table_pvs}    1

关于我们pvs1
    公共-校验数据    ${pvs1}    shezhi_003    ${table_pvs1}    1

关于我们返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_004    ${table_pvs}    1

关于我们返回pvs1
    公共-校验数据    ${pvs1}    shezhi_004    ${table_pvs1}    1

设置返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    shezhi_002    ${table_pvs}    1

设置返回pvs1
    公共-校验数据    ${pvs1}    shezhi_002    ${table_pvs1}    1
