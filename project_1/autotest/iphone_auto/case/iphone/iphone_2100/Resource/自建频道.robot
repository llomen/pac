*** Settings ***
Library           AppiumLibrary

*** Keywords ***
频道管理-创建频道
    公共－点击页面文本    创建

关闭频道管理
    公共－点击页面文本    All channels close ICON

创建频道-返回
    公共－点击页面文本    player back icon

创建频道-标签管理
    点击不可见文本    Edit_channel_My_label

创建频道-切换明星tab
    公共－点击页面文本    明星

创建频道-切换节目tab
    公共－点击页面文本    节目

创建频道-切换up主tab
    公共－点击页面文本    UP主内容

创建频道-进入频道
    点击不可见文本    进入频道

创建频道-搜索

创建频道-推荐tab点击
    公共－点击页面文本    以家人之名

创建频道-明星tab点击
    公共－点击页面文本    赵丽颖

创建频道-点搜索框

创建频道-搜索页添加
    公共－xpath    (//XCUIElementTypeButton[@name="Edit channel idolsearch tianji"])[1]
