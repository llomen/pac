*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${show}           {'logtype':'show'}
${table_show}     mpp_show_5_iphone_sdk
${table_chzlshow}    mpp_ip_chzlshow
${table_chzlclick}    mpp_ip_chzlclick
${chzlshow}       {'act':'chzlshow'}
${chzlclick}      {'act':'chzlclick'}
${columnist}      {'act':'columnist'}
${share}          {'act':'share'}
${table_stay}     mpp_stay_iphone

*** Test Cases ***
融合饭团曝光show
    公共-删除数据
    上滑
    sleep    2
    频道上滑
    sleep    2
    点评论
    sleep    20

*** Keywords ***
点标题
    离婚后心情大好！贾乃亮帮员工清空双十二购物车

点发布人
    新金牌娱乐观察家

点+关注
    (//XCUIElementTypeButton[@name="editor follow button"])[1]

点全文

点评论
    click element    nsp =type =="XCUIElementTypeButton" and name=="1"

点阅读量
    2952

点换一换
    换一换

点更多专栏
    更多专栏
