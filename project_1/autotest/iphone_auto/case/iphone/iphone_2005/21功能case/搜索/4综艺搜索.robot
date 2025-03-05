*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot

*** Test Cases ***
搜索标签
    首页-搜索
    搜索首页－输入搜索词    快乐大本营
    搜索-点击搜索
    comment    公共-页面包含元素    独播
    公共-页面包含元素    播放源
    公共-页面包含元素    综艺 / 大陆/ 2018
    公共-页面包含元素    何炅 / 谢娜 / 李维嘉 / 杜海涛 / 吴昕

点进入饭团
    公共－点击页面文本    进入饭团
    公共-页面包含元素    快乐大本营
    公共-页面包含元素    全部动态
    公共-页面不包含元素    作品
    公共-页面包含元素    228.02万人加入
    饭团-个人主页-返回

点播放进点播页
    公共－点击页面文本    播放
    点播播放页-返回

点节目名进点播页
    公共－点击页面文本    2018-08-18 秦岚佘诗曼现场上演“宫斗”？
    点播播放页-返回

点全部进剧集列表
    公共－点击页面文本    全部
    公共-页面包含元素    选集

选集页点视频进点播页
    公共－点击页面文本    MIKE唱情歌大秀中文
    sleep    2
    公共-页面包含元素    快乐大本营 2018

返回搜索结果页
    点播播放页-返回
    公共-页面包含元素    选集
    非播放页-返回

相关嘉宾
    scroll    name=全部    name=最新看点
    公共-页面包含元素    彭昱畅
    公共-页面包含元素    武艺
    公共-页面包含元素    陈学冬
    公共-页面包含元素    胡一天张亮携神秘礼物来袭
    公共-页面包含元素    沈月于文文拍照大赛笑料不断

点嘉宾参与综艺
    公共－点击页面文本    胡一天张亮携神秘礼物来袭
    点播播放页-返回

点嘉宾查看更多
    公共－点击页面文本    查看更多
    公共-页面包含元素    嘉宾往期内容

点节目进点播页
    公共－点击页面文本    胡一天张亮携神秘礼物来袭
    点播播放页-返回

嘉宾往期内容切换嘉宾
    公共－点击页面文本    武艺
    公共-页面包含元素    李冰冰吴尊开启姐弟互坑模式
    非播放页-返回

搜索结果页切换嘉宾-少于3个
    公共－点击页面文本    王鹤棣

判断查看更多
    ${length}    元素个数    name=查看更多
    Should Be Equal As Integers    1    ${length}    num should be    1 ,acture ${length}

搜索结果页切换嘉宾-多于3个
    公共－点击页面文本    陈学冬

再次判断查看更多
    ${length}    元素个数    name=查看更多
    Should Be Equal As Integers    2    ${length}    num should be 2,acture ${length}

点最新看点视频
    公共－点击页面文本    陈学冬彭昱畅和平PK结果居然…
    点播播放页-返回

点最新看点查看更多
    scroll    name=最新看点    name=相同系列
    sleep    2
    公共－xpath    (//XCUIElementTypeStaticText[@name="查看更多"])[2]
    点播播放页-返回
