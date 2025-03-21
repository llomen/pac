*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot

*** Test Cases ***
频道页播放记录入口
    首页-播放记录
    非播放页-返回

个人中心播放记录入口
    首页-我
    公共－点击页面文本    播放记录
    非播放页-返回

扫描入口
    判断登录-扫码入口

扫描入口-没有弹框
    首页-我
    设置-扫码入口
    非播放页-返回

手机账户修改密码
    公共－点击页面文本    点击登录
    登录-是否有历史页面
    公共－点击页面文本    帐号密码登录
    手机密码登录－输入手机号    18570393302
    手机密码登录－输入密码    h123456
    公共－点击页面文本    登录
    我的-设置
    公共－点击页面文本    账号与安全
    公共－点击页面文本    修改密码
    非播放页-返回
    非播放页-返回

修改密码
    公共－点击页面文本    修改密码
    公共-页面存在元素值    密码为6-20位，且仅限数字，字母或符号
    非播放页-返回

个人资料页面绑定手机显示
    公共－点击页面文本    绑定手机
    是否绑定手机号-显示
    非播放页-返回

设置页面返回
    非播放页-返回

邮箱账户修改密码
    首页-我
    公共－退出登录
    首页-我
    公共－点击页面文本    点击登录
    ${bb}    If Page Contain Text    检测到历史账号
    run keyword if    ${bb}==1    公共－点击页面文本    登录
    ...    ELSE    账号登录
    我的-设置
    公共－点击页面文本    账号与安全
    公共－点击页面文本    修改密码
    非播放页-返回
    非播放页-返回

关注关系展示
    公共－点击页面文本    sjidjidid
    公共-页面存在元素值    大家好，欢迎来到我的个人空间
    公共-页面存在元素值    7关注
    公共-页面存在元素值    0粉丝
    公共-页面存在元素值    2饭团

个人主页内容展示
    公共-页面存在元素值    动态
    公共-页面存在元素值    短视频
    公共-页面存在元素值    喜欢

个人主页内容展示-动态tab
    公共-页面存在元素值    我来也
    公共-页面存在元素值    02月21日
    公共-页面存在元素值    哈哈哈哈哈

个人主页内容展示-视频tab
    公共-页面存在元素值    你还未发布过短视频哦

个人主页内容展示-喜欢tab
    公共-页面存在元素值    279

皮肤入口
    滚动到设置
    公共－点击页面文本    皮肤

主题皮肤页面显示
    公共-页面存在元素值    官方芒果橙
    公共-页面存在元素值    使用中
    公共-页面存在元素值    会员酷黑皮肤
    公共-页面存在元素值    尊享酷视听，酷黑新主义！
    公共-页面存在元素值    VIP
    公共-页面存在元素值    立即使用

皮肤主题详情显示
    comment    公共－xpath    //XCUIElementTypeApplication[@name="芒果TV"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]
    进入芒果橙
    公共-页面存在元素值    Player Floor ShareNew
    公共-页面存在元素值    官方芒果橙皮肤，打造清新观赏体验！
    公共-页面存在元素值    使用中
    comment    //XCUIElementTypeButton[@name="Player Floor ShareNew"]
    皮肤详情页返回

VIP皮肤主题详情显示
    公共－点击页面文本    会员酷黑皮肤
    公共-页面存在元素值    Player Floor ShareNew
    公共-页面存在元素值    尊享酷视听，酷黑新主义！
    公共-页面存在元素值    立即使用！
    皮肤详情页返回

切换皮肤显示
    公共－xpath    (//XCUIElementTypeButton[@name="立即使用"])[2]
    Element Attribute Should Match    //XCUIElementTypeNavigationBar[@name="主题皮肤"]/../following-sibling::XCUIElementTypeCell[3]/XCUIElementTypeButton[2]    text    使用中

已登录非会员用户切换皮肤
    公共－xpath    (//XCUIElementTypeButton[@name="立即使用"])[1]
    公共-页面存在元素值    使用中
    皮肤列表页返回
    公共－点击页面文本    皮肤
    公共－xpath    (//XCUIElementTypeButton[@name="立即使用"])[1]
    公共-页面存在元素值    开通会员
    公共-页面存在元素值    确认支付
    皮肤开通会员页面关闭
    皮肤列表页返回

非会员退出登录皮肤显示
    我的-设置
    滚动到关于我们
    公共－点击页面文本    退出登录
    公共－点击页面文本    退出
    公共－点击页面文本    皮肤
    进入芒果橙
    公共-页面存在元素值    使用中
    皮肤详情页返回

未登录免费皮肤切换
    滚动到官方暗夜黑
    使用暗夜黑
    Element Attribute Should Match    //XCUIElementTypeStaticText[@name="官方暗夜黑"]/following-sibling::XCUIElementTypeButton[1]    text    使用中
    皮肤列表页返回

未登录VIP皮肤切换-非会员
    公共－点击页面文本    皮肤
    公共－xpath    (//XCUIElementTypeButton[@name="立即使用"])[2]
    ${bb}    If Page Contain Text    检测到历史账号
    run keyword if    ${bb}==1    公共－点击页面文本    登录
    ...    ELSE    账号登录
    公共－xpath    (//XCUIElementTypeButton[@name="立即使用"])[2]
    公共-页面存在元素值    开通会员
    公共-页面存在元素值    确认支付
    皮肤开通会员页面关闭

未登录VIP皮肤切换-会员
    公共－xpath    (//XCUIElementTypeButton[@name="立即使用"])[2]
    ${bb}    If Page Contain Text    检测到历史账号
    run keyword if    ${bb}==1    账号密码登录    18570393302    h123456
    ...    ELSE    公共－点击页面文本    登录
    公共－xpath    (//XCUIElementTypeButton[@name="立即使用"])[2]
    公共-页面存在元素值    使用中

已登录会员用户皮肤切换
    公共－点击页面文本    芒果星球
    公共－点击页面文本    立即使用
    公共-页面存在元素值    使用中
    皮肤详情页返回
    进入芒果橙
    公共－点击页面文本    立即使用
    公共-页面存在元素值    使用中
    皮肤详情页返回
