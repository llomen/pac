*** Settings ***
Suite Setup       启动应用
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
${zllist_title}    芒果台撑起18年综艺半边天 3部口碑爆灯节目你get到了吗
${zllist_title2}    回忆杀！从《哈利波特》到《神奇动物2》，魔法世界的20年
${zllist_content}    2018年可谓是中国电视的寒冬，不管是综艺还是电视剧口碑都收到了观众的质疑

*** Test Cases ***
专栏列表页
    首页-频道管理
    公共－点击页面文本    动漫
    频道专栏-滑动到图文
    频道专栏-滑动到横图
    频道专栏-点头像
    #显示顶部分享、退出、头像、背景图、用户描述等
    公共-页面包含元素    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_hengtu}"]/preceding-sibling::XCUIElementTypeImage[1]
    公共-页面包含元素    xpath=//XCUIElementTypeStaticText[@name="${zlbodan_user_hengtu}"]/preceding-sibling::XCUIElementTypeImage[2]
    公共-页面包含元素    ${zllist_title}

专栏列表页顶部分享
    公共－点击页面文本    ${zllist_share_top}
    判断分享框弹出

专栏列表页顶部返回
    专栏列表页-返回
    公共-页面包含元素    ${zlpindao_title}

点关注
    频道专栏-点头像
    专栏列表页-关注
    公共-页面包含元素    已关注

取消关注
    专栏列表页-取消关注
    公共-页面包含元素    + 关注

第一个专栏点赞
    公共－点击页面文本    7
    公共-页面包含元素    8

取消点赞
    公共－点击页面文本    8
    公共-页面包含元素    7

第一个专栏分享
    公共－点击页面文本    Discuss Share iCON
    判断分享框弹出

点专栏进播单页
    公共－点击页面文本    ${zllist_title}
    公共-页面包含元素    ${zllist_content}

博单页返回
    专栏播单页-返回
    公共-页面包含元素    ${zllist_title}

专栏列表页下滑
    scroll    name=${zllist_title}    name=2018-11-18
    公共-页面包含元素    ${zlbodan_share_top2}
    公共-页面包含元素    ${zlbodan_back2}

滑到下方后点顶部分享
    公共－点击页面文本    ${zlbodan_share_top2}
    判断分享框弹出

滑到下方后点顶部返回
    公共－点击页面文本    ${zlbodan_back2}
    公共-页面包含元素    ${zlpindao_title}

*** Keywords ***
判断分享框弹出
    公共－点击页面文本    复制链接
