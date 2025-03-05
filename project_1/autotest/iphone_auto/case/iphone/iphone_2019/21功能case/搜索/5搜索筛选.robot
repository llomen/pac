*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../../5.3对象库.robot


*** Test Cases ***
搜索标签
    首页-搜索
    搜索首页－输入搜索词    快乐大本营
    搜索-点击搜索
    公共-页面包含元素    综合
    公共-页面包含元素    综艺
    公共-页面包含元素    电视剧

切换标签-综艺
    公共－点击页面文本    综艺
    公共-页面包含元素    2019-03-02 赖冠霖综艺首秀帅气热舞

切换标签-电视剧
    公共－点击页面文本    电视剧
    公共-页面包含元素    CP大重组！张翰郑爽再同框 杨洋遇上赵丽颖

切换标签后点结果
    公共－点击页面文本    CP大重组！张翰郑爽再同框 杨洋遇上赵丽颖
    点播播放页-返回

切换回默认标签
    公共－点击页面文本    综合

点筛选弹出筛选项
    公共－点击页面文本    筛选
    公共-页面包含元素    时长:
    公共-页面包含元素    发布时间:
    公共-页面包含元素    排序:

时长筛选
    公共－点击页面文本    10-30分钟
    公共-页面包含元素    吴昕生贺视频！2018年快乐大本营镜头集锦

发布时间筛选
    公共－点击页面文本    一周
    公共-页面包含元素    厉害了我的皮皮虾

排序筛选
    公共－点击页面文本    最新
    公共-页面包含元素    妻子的浪漫旅行第二季第1期看点：老公制定旅行路线，妻子团出游哭成泪人

筛选后点结果
    公共－点击页面文本    妻子的浪漫旅行第二季第1期看点：老公制定旅行路线，妻子团出游哭成泪人
    点播播放页-返回

收起筛选
    公共－点击页面文本    筛选
    Element Attribute Should Match    name=时长:    visible    false

更多历史记录
    公共－点击页面文本    取消
    首页-搜索

删除历史记录
    Click Element    xpath=//XCUIElementTypeButton[@name="search delete"]
    sleep    3
    公共-页面包含元素    确认要清空搜索历史吗？

取消删除
    Click Element    xpath=(//XCUIElementTypeButton[@name="取消"])[2]
    公共-页面包含元素    搜索历史

确定删除
    Click Element    xpath=//XCUIElementTypeButton[@name="search delete"]
    sleep    3
    公共-页面包含元素    确认要清空搜索历史吗？
    Click Element    xpath=//XCUIElementTypeButton[@name="确定"]
    sleep    2
    公共-页面不包含元素    搜索历史
