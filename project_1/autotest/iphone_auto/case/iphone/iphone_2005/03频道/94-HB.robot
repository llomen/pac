*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${hb3}            {'act':'hb','ht':'0'}
${hb5}            {'act':'hb','ht':'1'}
${hb15}           {'act':'hb','ht':'3'}
${hb45}           {'act':'hb','ht':'4'}
${hb60}           {'act':'hb','ht':'5'}
${hb180}          {'act':'hb','ht':'6'}
${hb_end}         {'act':'hb','ht':'2'}
${aplay}          {'act':'aplay'}
${buffer}         {'act':'buffer'}

*** Test Cases ***
