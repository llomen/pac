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

*** Test Cases ***
电影专栏
    首页-频道管理
    公共－点击页面文本    动漫

点关注跳登录页
    频道专栏-关注
    comment    公共－xpath    (//XCUIElementTypeButton[@name="+ 关注"])[1]
    公共-页面包含文本    登录
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}
    #登录跳转回来还是未关注

登录成功后再次关注
    频道专栏-关注
    sleep    3

取消关注
    频道专栏-取消关注
    sleep    3

点标题进入专栏播单页
    swipe    200    500    200    300
    sleep    3
    频道专栏-点图片
    sleep    5
    专栏播单页-关注
    公共-页面包含元素    已关注

专栏播单页取消关注
    sleep    3
    专栏播单页-取消关注
    公共-页面包含元素    + 关注

更多专栏跳转专栏列表页
    专栏H5-返回

滑动到看正片
    频道专栏-点头像

点播页返回专栏播单页
    饭团-个人主页-返回
    公共-页面包含元素    更多专栏

*** Keywords ***
判断分享框弹出
    公共－点击页面文本    复制链接
