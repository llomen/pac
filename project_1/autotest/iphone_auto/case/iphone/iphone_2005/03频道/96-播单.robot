*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${aplay}          {'act':'aplay'}
${heartbeat}      {'act':'heartbeat'}
${hb15}           {'act':'hb','ht':'3'}
${cdn1}           {'s':'1'}
${cdn3}           {'s':'3'}
${switch}         {'act':'switch'}
${cdn2}           {'s':'2'}
${r3}             {‘r’:'3'}
${r1}             {‘r’:'1'}
${bdrecommend_rel}    {'act':'bdrecommend_rel'}
${bdrelatepv}     {'act':'bdrelatepv'}

*** Test Cases ***
