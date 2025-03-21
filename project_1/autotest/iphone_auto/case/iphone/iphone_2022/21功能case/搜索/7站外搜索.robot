*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot


*** Test Cases ***
搜索外站资源
    首页-搜索
    搜索首页－输入搜索词    奔跑吧
    搜索-点击搜索
    公共-页面包含元素    综艺 / 大陆/ 2017
    公共-页面包含元素    邓超 / 鹿晗 / Angelababy / 迪丽热巴 / 陈赫 / 李晨 / 郑恺 / 王祖蓝
    公共-页面包含元素    播放源
    公共-页面包含元素    2017-06-30 第12期：baby热巴变公主
    公共-页面包含元素    2017-07-07 第13期幕后揭秘特辑：热巴鹿晗大爆料

点播放进入外站中间页
    公共－xpath    (//XCUIElementTypeStaticText[@name="播放"])[1]
    sleep    1
    公共-页面包含元素    相关视频
    公共-页面包含元素    奔跑吧，追光少年！
    公共-页面包含元素    发布时间：2015-10-27
    Comment    公共-页面包含元素    05:15
    公共-页面包含元素    看了还会看

点播放按钮
    公共－点击页面文本    follow_play_button
    公共-页面包含元素    快速播放
    公共-页面包含元素    网页播放
    公共-页面包含元素    取消

取消播放
    公共－点击页面文本    取消
    公共-页面不包含元素    网页播放
    公共-页面不包含元素    快速播放

网页播放
    公共－点击页面文本    follow_play_button
    公共－点击页面文本    网页播放
    sleep    2
    comment    公共-页面包含元素    empty_icon_homepage
    comment    公共-页面包含元素    无法连接到网络，点击重试

返回外站中间页
    非播放页-返回

点相关视频进点播页
    公共－点击页面文本    奔跑吧，追光少年！
    sleep    2
    公共-页面包含元素    品牌广告
    点播播放页-返回

点查看更多
    公共－点击页面文本    查看更多
    #未遮挡播放按钮
    comment    公共-元素可见    follow_play_button
    公共-元素不可见    奔跑吧

点浮层视频进点播页
    公共－点击页面文本    《奔跑吧兄弟》发布会 陈赫道歉成热搜
    公共-页面包含元素    娱乐急先锋 2015
    点播播放页-返回

关闭相关视频浮层
    公共－xpath    (//XCUIElementTypeStaticText[@name="相关视频"])[2]/following-sibling::XCUIElementTypeButton[1]
    comment    公共-元素可见    奔跑吧
    公共-元素可见    查看更多

下滑到看了还喜欢
    comment    scroll    name=奔跑吧    name=女儿们的恋爱
    comment    上滑
    swipe    156    538    -1    -368
    comment    公共-元素可见    女儿们的恋爱
    comment    公共-元素可见    任家萱|任容萱|沈梦辰|傅园慧|杜海涛

点看了还会看视频
    公共－xpath    //XCUIElementTypeStaticText[@name="女儿们的恋爱"]/following-sibling::XCUIElementTypeButton[1]
    comment    公共－点击页面文本    女儿们的恋爱
    sleep    2
    公共-页面包含元素    妻子的浪漫旅行 第二季
    点播播放页-返回

中间返回搜索结果页
    sleep    2
    站外中间页-返回
    公共-元素可见    2017-06-30 第12期：baby热巴变公主

搜索结果页点剧集
    公共－点击页面文本    2017-06-30 第12期：baby热巴变公主
    Comment    公共-元素可见    follow_play_button
    站外中间页-返回
    公共-元素可见    2017-06-30 第12期：baby热巴变公主

点全部进外站选集
    公共－xpath    (//XCUIElementTypeStaticText[@name="全部"])[1]
    sleep    2
    公共-页面包含元素    选集
    公共-页面包含元素    第13期幕后揭秘特辑：热巴鹿晗大爆料

外站选集点剧集
    公共－点击页面文本    第12期：baby热巴变公主
    sleep    2
    #进外站中间页
    Comment    公共-元素可见    follow_play_button

返回到选集页
    站外中间页-返回
    公共-元素可见    选集

选集返回搜索结果页
    非播放页-返回
    公共-元素可见    2017-06-30 第12期：baby热巴变公主
