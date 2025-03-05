*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pfc}            {'act':'pfc'}
${dologin}        {'act':'DoLogin'}
${buffer}         {'act':'buffer'}
${hb}             {'act':'hb','ht':'2'}
${pjr}            {'act':'pjr'}
${share}          {'act':'share'}
${shareresult}    {'act':'shareresult'}

*** Test Cases ***
进入点播页pjr
    公共-删除数据
    首页-青云志
    sleep    18
    公共-校验结果    ${pjr}    pjr-xiafa    ${table_click}    1

放映厅曝光pjr
    点播播放页-暂停
    公共-删除数据
    sleep    5
    点播播放页-点屏幕
    公共-校验结果    ${pjr}    pjr-click2    ${table_click}    1

进入放映厅pjr
    公共-删除数据
    点播播放页-反映厅
    公共-校验结果    ${pjr}    pjr-click    ${table_click}    1

放映厅pvs
    公共-校验结果    ${pvs}    fangying_01    ${table_pvs}    1

放映厅pvs1
    公共-校验结果    ${pvs1}    fangying_01    ${table_pvs1}    1

跳转登录pvs
    公共-删除数据
    按坐标点击元素    登录
    sleep    2
    公共-校验结果    ${pvs}    fangying_02    ${table_pvs}    1

跳转登录pvs1
    公共-校验结果    ${pvs1}    fangying_02    ${table_pvs1}    1

登录dologin
    公共-删除数据
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}
    sleep    5
    公共-校验结果    ${dologin}    login_002    mpp_jiaohu_iphone_login    1

登录成功跳转pvs
    公共-校验结果    ${pvs}    fangying_03    ${table_pvs}    1

登录成功跳转pvs1
    公共-校验结果    ${pvs1}    fangying_03    ${table_pvs1}    1

邀请成员pjr
    判断后点击    知道了
    公共-删除数据
    sleep    1
    点加号
    sleep    1
    公共-校验结果    ${pjr}    pjr-yaoqing    ${table_click}    1

分享到微信share
    公共-删除数据
    公共－点击页面文本    微信
    公共－点击页面文本    确认
    公共-校验结果    ${share}    pjr-share-wechat    ${table_click}    1

分享到QQshare
    Comment    公共－点击页面文本    VideoHall_Invitation_Button
    Comment    公共-删除数据
    Comment    公共－点击页面文本    QQ
    Comment    公共－点击页面文本    确认
    公共-校验结果    ${share}    pjr-share-QQ    ${table_click}    1

复制链接share
    点加号
    公共-删除数据
    公共－点击页面文本    复制链接
    公共-校验结果    ${share}    pjr-share-copy    ${table_click}    1

复制链接shareresult
    公共-校验结果    ${shareresult}    pjr-shareresult-copy    ${table_click}    1

点击选集pjr
    点击屏幕右侧
    公共-删除数据
    公共－点击页面文本    选集
    公共-校验结果    ${pjr}    pjr-xuanji    ${table_click}    1

选集pvs
    公共-校验结果    ${pvs}    fangying_04    ${table_pvs}    1

选集pvs1
    公共-校验结果    ${pvs1}    fangying_04    ${table_pvs1}    0

选集浮层曝光cv
    公共-校验结果    ${cv}    room_04    ${table_cv}    1

选择下一集pvs
    公共-删除数据
    公共－点击页面文本    碧瑶张小凡街头初遇
    公共-校验结果    ${pvs}    fangying_05    ${table_pvs}    1

选择下一集pvs1
    公共-校验结果    ${pvs1}    fangying_05    ${table_pvs1}    1

点击搜索pjr
    comment    点击屏幕右侧
    公共-删除数据
    公共－点击页面文本    VideoHall Switchover
    公共-校验结果    ${pjr}    pjr-search    ${table_click}    1

搜索页pvs
    公共-校验结果    ${pvs}    fangying_06    ${table_pvs}    1

搜索页pvs1
    公共-校验结果    ${pvs1}    fangying_06    ${table_pvs1}    0

搜索页浮层曝光cv
    公共-校验结果    ${cv}    room_01    ${table_cv}    1

搜索结果页pvs
    公共-删除数据
    首页-搜索
    搜索－输入搜索词    快乐大本营
    搜索-点击搜索
    公共-校验结果    ${pvs}    fangying_07    ${table_pvs}    1

搜索结果页pvs1
    公共-校验结果    ${pvs1}    fangying_07    ${table_pvs1}    0

搜索结果页浮层曝光cv
    公共-校验结果    ${cv}    room_02    ${table_cv}    1

结果页-中间页pvs
    公共-删除数据
    公共－点击页面文本    全部
    公共-校验结果    ${pvs}    fangying_08    ${table_pvs}    1

结果页-中间页pvs1
    公共-校验结果    ${pvs1}    fangying_08    ${table_pvs1}    0

中间页浮层曝光cv
    公共-校验结果    ${cv}    room_03    ${table_cv}    1

中间页返回pvs
    公共-删除数据
    公共－点击页面文本    close icon
    公共-校验结果    ${pvs}    fangying_09    ${table_pvs}    1

中间页返回pvs1
    公共-校验结果    ${pvs1}    fangying_09    ${table_pvs1}    0

播放第一个pvs
    公共-删除数据
    搜索-点击播放
    公共-校验结果    ${pvs}    fangying_10    ${table_pvs}    1

播放第一个pvs1
    公共-校验结果    ${pvs1}    fangying_10    ${table_pvs1}    1

退出反映厅pvs
    公共-删除数据
    点播播放页-返回
    公共－点击页面文本－忽略错误    退出
    sleep    3
    公共-校验结果    ${pvs}    fangying_11    ${table_pvs}    1

退出反映厅pvs1
    公共-校验结果    ${pvs1}    fangying_11    ${table_pvs1}    1

*** Keywords ***
点击屏幕右侧
    click a point    280    160

点加号
    tap    VideoHall_Invitation_Button    15    15
