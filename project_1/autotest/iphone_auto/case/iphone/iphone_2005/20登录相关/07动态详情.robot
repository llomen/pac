*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${share}          {'act':'share'}
${shareresult}    {'act':'shareresult'}
${comment}        {'act':'comment'}
${table}          mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${table_click}    mpp_jiaohu_iphone
${aplay}          {"act":"aplay"}
${buffer2}        {"act":"buffer"}
${hb3}            {'act':'hb','ht':'0'}
${hb5}            {'act':'hb','ht':'1'}
${hb_end}         {'act':'hb','ht':'2'}

*** Test Cases ***
