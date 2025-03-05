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
${h264_1}         /var/containers/Bundle/Application/40DCD79A-CDD5-42D5-A7BF-B74C4C443E18/Sample.app/1111.ts
${h264_disp}      http://disp.titan.mgtv.com/vod.do?pm=Pf_tUEzuYym1OUlDDsCDAlqoU62t3kAqu9ijDBbj0bVcXkRYQ0uu8_b2kysUXsX1c72WiEw8GihIJBDx4kkE7UsMpnLGmXJ54TeiZ2jj1KUzMG8UEVkRl8gRazN7~GdOinE_wZyN4svLTnc4CP~R4t9KkhvpeyFDxBTwNYRs5VTVswWX0biBKF3p8sfYu4TTzvzAQ51w7kxUaBbEyaDXkZK5iF0m7VgFwe9YL5MdbQadU6hTNpCGZEjt5dBqHEFQD~OsjqkdEUS7vdpmqmKMG~45Ym387~7a_M9oL0KqBSA1RTcbT1dB9oSlMHfXF7sY4Y13myctuzxYlDD4zlkcKmQxI4gqIL39f~dCggT3SkSL4kMiNowVtLvl9qWIFyJTaGSMDQ--&fid=C50209E1EFBB2FAB7074D00B0E342818&svrip=
${h265_1}         http://10.200.8.78/upload/fmp4test/seg/b.m3u8
${h265_15s}       http://pcvideoaliyun.titan.mgtv.com/c1/2020/02/17_1/CED2FCC98DD76ACBF4CC894C52773300_20200217_2_1_323_mp4/8BB8969851D7DC0B9D7B0E142C9A3926.m3u8?arange=0&pm=fAHGWpYaSUNjVjmtNt05vKQjhk8OLH315Fot6zdwlangBXtOoXUNat65hjJfZwjy9W60InGybYCd_VAE5wLeBvzXGcnl1vOaHKJHf5ku9PAJWKEL6pEGPa4RiLU913VRdcN6W3UBvR6vRL1NN4V~wgCCeRTgihVc8TnhYQ7b78KTUhpx3yW_uRQcOpay2YZSgjPvNfiR_Mtx48PggF~hLcX745DZ1KBLNxFHShae7XmEVX0_rNZDIGhQSgrcNmhlARO1jJQ55eRlHugukJYEJgtHl_4ekiuL0kX_VXNzBuGFJvyrgvy7c4dZf03ivxjehbLb9K2DVhf7jrqjMOuK7IHn3LUgmfiga2SdSRCv1ivay7mSwb8eC~qqPQPzSREssIamxIgy9XiWdY3fOQqCtT~bHEysAdB7sn3xv4x_Gf7nUAL8is5btIrXqpXqVCkq4Y4U2ouU324VOqll&version=imgotv-iphone-6.5.6&uid=a35a3faa9147acfbf631b30e8478e72f&drmFlag=0&isTrial=0&vcdn=0&scid=25021
${https2}         https://lgtest-af060fd5-qing.hitv.com/nn_live/nn_x64/cz0wZDRmZDcyMWQwNzIyNjg5M2UzZmZhODg1NzRlYzJiNyZoPWxndGVzdC1hZjA2MGZkNS1xaW5nLmhpdHYuY29tJnV1aWQ9ZGNmZDJhMGFmZDI4YmU3NjYzOWQyMWY4MTAzYzI0ZWUtN2YwMDAwMDEmdj0yJmFzPTAmZXM9MTU4Mjg4NDUyNQ,,/hdzbyzm1.m3u8
${https}          https://phonews.qing.mgtv.com/nn_live/nn_x64/cz1kNTgwOWI1OGI0YTRhMzAxMGY3Njk4NTFkMjBkYzBlNSZlcz0xNjA5NDM0MDAwJnV1aWQ9ZWEzYzE5YTY1MGJlNDA2MzgwNjQxNzYwMmNkM2RjNWYtN2YwMDAwMDEmdj0yJmFzPTAmY2RuZXhfaWQ9d3NfcGhvbmUz/JYJSMPP360.m3u8
${pend}           {'act':'pend'}
${ppv}            {'act':'ppv'}
${pvv}            {'act':'pvv'}

*** Test Cases ***
h265-ppv
    公共-删除数据
    点击设置
    sleep    2
    进入播放源
    设置播放源-标清    ${h265_1}
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

h265-pvv
    公共-校验数据    ${pvv}    h265_pvv    mpp_pvv_iphone_sdk    1

h265-pend
    sleep    3
    公共-校验数据    ${pend}    h265_pend    mpp_pend_iphone_sdk    1

h265软解模式-pvv
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

h265软解模式-pend
    sleep    3
    公共-校验数据    ${pend}    ruanjie_pend    mpp_pend_iphone_sdk    1

h264-ppv
    #启动播放demo
    返回上一页
    公共-删除数据
    进入播放源
    设置播放源-标清    ${h264_1}
    更新播放源
    sleep    3
    返回上一页
    返回上一页
    点击自研播放器
    点击start
    sleep    5
    公共-校验数据    ${ppv}    ppv_sdk    mobile_ppv_ipad    1

软解模式h264-pvv
    公共-校验数据    ${pvv}    h264_pvv    mpp_pvv_iphone_sdk    1

软解模式h264-pend
    点击stop
    sleep    3
    公共-校验数据    ${pend}    h264_pend    mpp_pend_iphone_sdk    1

h264-pvv
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

h264-pend
    点击stop
    sleep    3
    公共-校验数据    ${pend}    h264_pend    mpp_pend_iphone_sdk    1

切换清晰度-pend
    点击start
    sleep    3
    切换清晰度
    公共-删除数据
    公共-校验数据    ${pend}    qingxidu_pend    mpp_pend_iphone_sdk    1

切换清晰度-ppv
    公共-校验数据    ${pvv}    h264_pvv    mpp_pvv_iphone_sdk    1

切换清晰度-pvv
    公共-校验数据    ${pvv}    h264_pvv    mpp_pvv_iphone_sdk    1

自动结束-pend
    公共-删除数据
    返回上一页
    点击自研播放器
    #删除二层地址
    点击start
    sleep    20
    公共-校验数据    ${pend}    autostop_pend    mpp_pend_iphone_sdk    1

还未开始就结束-ppv
    公共-校验数据    ${ppv}    ppv_sdk    mobile_ppv_ipad    1

还未开始就结束-pvv
    公共-校验数据    ${pvv}    h264_pvv    mpp_pvv_iphone_sdk    0

还未开始就结束-pend
    sleep    2
    公共-删除数据
    tap    name=Start    0    0
    tap    name=Stop    0    0
    sleep    2
    公共-校验数据    ${pend}    quickstop_pend    mpp_pend_iphone_sdk    1
