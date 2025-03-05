*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot


*** Variables ***
${zllist_share_top}    column share shadow
${zllist_back}    player back Shadow
${zlbodan_share_top}    column share shadow
${zlbodan_back}    player back Shadow
${zlbodan_share_top2}    Discuss ShareOrange iCON
${zlbodan_back2}    back icon
${zlbodan_user_hengtu}    马栏山饲养员
${zlbodan_user_dianying}    吃瓜少女99
${zlbodan_user_tuwen}    测试名字
${zlbodan_title}    嘴上说着喜欢吴亦凡，壁纸全是王一博，心里放不下王俊凯...
${zlpindao_title}    娱乐圈男友照妖镜！小编教你鉴渣8招

*** Test Cases ***
电影专栏
    首页-频道管理
    公共－点击页面文本    动漫
    频道专栏-滑动到图文
    #显示电影专栏的标题、简介、豆瓣评分
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_dianying}"]/following-sibling::XCUIElementTypeStaticText[1]    label    ●《找到你》五大策略逆袭
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_dianying}"]/following-sibling::XCUIElementTypeStaticText[2]    label    我们的丈夫原来就是我们的敌人！这一次我只想找到你o(╥﹏╥)o
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_dianying}"]/following-sibling::XCUIElementTypeStaticText[3]    label    豆瓣评分：
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_dianying}"]/following-sibling::XCUIElementTypeStaticText[4]    label    9

图文专栏
    #图文专栏无文本
    公共-页面不包含元素    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_tuwen}"]/following-sibling::XCUIElementTypeStaticText[1]

查询不到的专栏显示错误
    公共－点击页面文本    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_tuwen}"]/following-sibling::XCUIElementTypeButton[1]
    公共-页面包含元素    暂无内容
    公共－点击页面文本    ${zlbodan_back}

横图专栏
    频道专栏-滑动到横图
    #横图专栏有一个标题
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_hengtu}"]/preceding-sibling::XCUIElementTypeStaticText[1]    label    娱乐圈男友照妖镜！小编教你鉴渣8招

点关注跳登录页
    频道专栏-关注
    comment    公共－xpath    (//XCUIElementTypeButton[@name="+ 关注"])[1]
    公共-页面包含文本    登录
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}
    #登录跳转回来还是未关注
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_hengtu}"]/following-sibling::XCUIElementTypeButton[last()]    label    + 关注

登录成功后再次关注
    频道专栏-关注
    sleep    3
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_hengtu}"]/following-sibling::XCUIElementTypeButton[last()]    label    已关注

取消关注
    频道专栏-取消关注
    sleep    3
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_hengtu}"]/following-sibling::XCUIElementTypeButton[last()]    label    + 关注

点标题进入专栏播单页
    频道专栏-点图片
    #显示顶部分享、退出、用户名称、用户描述、标题等
    Element Attribute Should Match    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_hengtu}"]/following-sibling::XCUIElementTypeStaticText[1]    label    哎呀 活捉一只等投喂的小可爱

专栏播单页-顶部分享
    公共－点击页面文本    ${zlbodan_share_top}
    判断分享框弹出

专栏播单页-顶部返回
    公共－点击页面文本    ${zlbodan_back}

点图片进入专栏播单页
    comment    频道专栏-点标题
    公共－点击页面文本    ${zlpindao_title}
    公共-页面包含元素    ${zlbodan_title}

专栏播单页关注
    专栏播单页-关注
    公共-页面包含元素    已关注

专栏播单页取消关注
    sleep    3
    专栏播单页-取消关注
    公共-页面包含元素    + 关注

下滑到底部
    #滑到底部后顶部显示分享、返回、标题
    专栏播单页-滑到更多专栏
    公共-页面包含元素    微信好友
    公共-页面包含元素    新浪微博

更多专栏跳转专栏列表页
    专栏播单页-更多专栏
    专栏列表页-返回

滑动到看正片
    频道专栏-点头像

点看正片跳转

点播页返回专栏播单页
    点播播放页-返回
    公共-页面包含元素    更多专栏

播单滑到底后点顶部分享
    公共－点击页面文本    ${zlbodan_share_top2}
    判断分享框弹出

播单滑到底后点顶部返回
    公共－点击页面文本    ${zlbodan_back2}

*** Keywords ***
判断分享框弹出
    公共－点击页面文本    复制链接
