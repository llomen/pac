*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot

*** Test Cases ***
进入新模板
    首页-搜索
    搜索首页－输入搜索词    tfboys
    搜索-点击搜索
    公共-删除数据

相关明星
    上滑
    上滑
    sleep    3
    公共－点击页面文本    王俊凯
    非播放页-返回

进专栏
    sleep    3
    公共－点击页面文本    【跨年演唱会特供】TFBOYS成长全记录
    sleep    3
    非播放页-返回
