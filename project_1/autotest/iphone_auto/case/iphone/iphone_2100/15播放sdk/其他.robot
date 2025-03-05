*** Settings ***
Suite Setup       启动播放demo
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${show}           {'logtype':'show'}
${table_show}     mpp_show_5_iphone_sdk
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_pvs_dianbo}    mpp_pv_5_5_iphone_sdk_dianbo
${table_chzlshow}    mpp_ip_chzlshow
${table_chzlclick}    mpp_ip_chzlclick_2
${table_chzlclick_jubao}    mpp_ip_chzlclick_1
${chzlshow}       {'act':'chzlshow'}
${chzlclick}      {'act':'chzlclick'}
${columnist}      {'act':'columnist'}
${share}          {'act':'share'}
${stay}           {'act':'stay'}
${table_stay}     mpp_ip_chzlclick_1
${cdn1}           {'s':'1','type':'0'}
${cdn3}           {'s':'3','type':'2'}
${cdn2}           {'s':'2','type':'1'}
${r3}             {'r':'3'}
${r1}             {‘r’:'1'}
${https}          https://phonews.qing.mgtv.com/nn_live/nn_x64/cz1kNTgwOWI1OGI0YTRhMzAxMGY3Njk4NTFkMjBkYzBlNSZlcz0xNjA5NDM0MDAwJnV1aWQ9ZWEzYzE5YTY1MGJlNDA2MzgwNjQxNzYwMmNkM2RjNWYtN2YwMDAwMDEmdj0yJmFzPTAmY2RuZXhfaWQ9d3NfcGhvbmUz/JYJSMPP360.m3u8
${local}          /var/containers/Bundle/Application/40DCD79A-CDD5-42D5-A7BF-B74C4C443E18/Sample.app/1111.ts
${h264_disp}      http://disp.titan.mgtv.com/vod.do?pm=Pf_tUEzuYym1OUlDDsCDAlqoU62t3kAqu9ijDBbj0bVcXkRYQ0uu8_b2kysUXsX1c72WiEw8GihIJBDx4kkE7UsMpnLGmXJ54TeiZ2jj1KUzMG8UEVkRl8gRazN7~GdOinE_wZyN4svLTnc4CP~R4t9KkhvpeyFDxBTwNYRs5VTVswWX0biBKF3p8sfYu4TTzvzAQ51w7kxUaBbEyaDXkZK5iF0m7VgFwe9YL5MdbQadU6hTNpCGZEjt5dBqHEFQD~OsjqkdEUS7vdpmqmKMG~45Ym387~7a_M9oL0KqBSA1RTcbT1dB9oSlMHfXF7sY4Y13myctuzxYlDD4zlkcKmQxI4gqIL39f~dCggT3SkSL4kMiNowVtLvl9qWIFyJTaGSMDQ--&fid=C50209E1EFBB2FAB7074D00B0E342818&svrip=
${pend}           {'act':'pend'}
${ppv}            {'act':'ppv'}
${pvv}            {'act':'pvv'}

*** Test Cases ***
https-ppv
    公共-删除数据
    点击设置
    sleep    2
    进入播放源
    设置播放源-标清    ${https}
    更新播放源
    sleep    3
    返回上一页
    返回上一页
    点击自研播放器
    删除二层地址
    sleep    2
    点击start
    sleep    5
    点击stop
    公共-校验数据    ${ppv}    ppv_sdk    mobile_ppv_ipad    1

https-pvv
    公共-校验数据    ${pvv}    h265_pvv    mpp_pvv_iphone_sdk    1

https-pend
    sleep    3
    公共-校验数据    ${pend}    h265_pend    mpp_pend_iphone_sdk    1

https软解模式-pvv
    公共-删除数据
    返回上一页
    点击设置
    sleep    2
    打开软解模式
    返回上一页
    点击自研播放器
    删除二层地址
    点击start
    sleep    5
    点击stop
    公共-校验数据    ${pvv}    ruanjie_pvv    mpp_pvv_iphone_sdk    1

https软解模式-pend
    sleep    3
    公共-校验数据    ${pend}    ruanjie_pend    mpp_pend_iphone_sdk    1

本地视频软解模式-ppv
    #启动播放demo
    返回上一页
    公共-删除数据
    点击自研播放器
    删除二层地址
    设置二层地址    ${h264_disp}
    点击start
    sleep    5
    公共-校验数据    ${ppv}    ppv_sdk    mobile_ppv_ipad    1

本地视频软解模式-pvv
    公共-校验数据    ${pvv}    h264_pvv    mpp_pvv_iphone_sdk    1

本地视频软解模式-pend
    点击stop
    sleep    3
    公共-校验数据    ${pend}    h264_pend    mpp_pend_iphone_sdk    1

本地视频-pvv
    返回上一页
    公共-删除数据
    点击设置
    sleep    2
    关闭软解模式
    返回上一页
    点击自研播放器
    删除二层地址
    点击start
    sleep    5
    公共-校验数据    ${pvv}    h264_pvv    mpp_pvv_iphone_sdk    1

本地视频-pend
    点击stop
    sleep    3
    公共-校验数据    ${pend}    h264_pend    mpp_pend_iphone_sdk    1

二层地址播放ppv
    公共-删除数据
    返回上一页
    点击自研播放器
    删除二层地址
    设置二层地址    ${h264_disp}
    sleep    2
    点击start
    sleep    5
    点击stop
    公共-校验数据    ${ppv}    ppv_sdk    mobile_ppv_ipad    1

二层地址播放pvv
    公共-校验数据    ${pvv}    h265_pvv    mpp_pvv_iphone_sdk    1

二层地址播放pend
    sleep    3
    公共-校验数据    ${pend}    h265_pend    mpp_pend_iphone_sdk    1
