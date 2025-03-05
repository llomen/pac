*** Settings ***
Library           AppiumLibrary

*** Variables ***
${zllist_share_top}    column share shadow
${zlbodan_share_top}    column share shadow
${zlbodan_back}    player back Shadow

*** Keywords ***
追剧-举报
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss More Gray"])[1]

追剧-点举报内容
    公共－点击页面文本    不想追了

追剧-点标题
    点击不可见文本    偶像大师灰姑娘女孩

追剧-点图片
    公共－xpath    //XCUIElementTypeStaticText[@name="偶像大师灰姑娘女孩"]/following-sibling::XCUIElementTypeButton[1]

频道专栏-关注
    公共－xpath    //XCUIElementTypeStaticText[@name="高能E蓓子"]/preceding-sibling::XCUIElementTypeButton[@name="+ 关注"]

频道专栏-取消关注
    公共－xpath    (//XCUIElementTypeButton[@name="已关注"])[1]

频道专栏-点头像
    公共－xpath    //XCUIElementTypeStaticText[@name="高能E蓓子"]/following-sibling::XCUIElementTypeButton[1]

频道专栏-点图片
    公共－xpath    //XCUIElementTypeStaticText[@name="高能E蓓子"]/following-sibling::XCUIElementTypeButton[2]

频道专栏-滑动到图文
    comment    scroll down    name=测试名字
    comment    scroll    name=偶像大师灰姑娘女孩    name=测试名字

频道专栏-滑动到电影
    comment    scroll    name=偶像大师灰姑娘女孩    name=豆瓣评分：

频道专栏-滑动到横图
    comment    scroll down    name=马栏山饲养员
    comment    scroll    name=测试名字    name=马栏山饲养员

频道专栏-滑动到大图带小图
    comment    scroll down    name=查看更多
    comment    scroll    name=测试名字    name=查看更多

专栏H5-返回
    公共－xpath    //XCUIElementTypeStaticText[@name=""]

频道专栏-精选专栏
    公共－点击页面文本    精选专栏

频道专栏-热门专栏
    公共－点击页面文本    热门专栏

专栏播单页-返回
    公共－点击页面文本    player back Shadow

专栏播单页-顶部专栏分享
    公共－点击页面文本    column share shadow

专栏列表页-顶栏分享
    公共－点击页面文本    column share shadow

专栏列表页-点专栏标题
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/preceding-sibling::XCUIElementTypeStaticText[last()]

专栏列表页-点专栏分享
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]

专栏列表页-点赞
    公共－xpath    (//XCUIElementTypeButton[@name="Discuss Share iCON"])[1]/preceding-sibling::XCUIElementTypeButton[1]

专栏列表页-取消点赞
    专栏列表页-点赞

专栏列表页-关注
    公共－点击页面文本    + 关注

专栏列表页-取消关注
    公共－点击页面文本    已关注
    公共－点击页面文本    取消关注

专栏列表页-返回
    公共－点击页面文本    player back Shadow
