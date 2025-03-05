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
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${buffer}         {'act':'buffer'}
${hb_end}         {'act':'hb','ht':'2'}
${hb3}            {'act':'hb','ht':'0'}
${hb5}            {'act':'hb','ht':'1'}

*** Test Cases ***

*** Keywords ***
登录并关注
    公共－点击页面文本    登录
    公共-删除数据
    专栏播单页-关注
