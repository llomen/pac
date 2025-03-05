*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Test Cases ***
短视频曝光view
    滑动到短视频
    sleep    10
    公共-校验数据    {'event':'view','mdid':'110'}    view_06    mpp_ip_view    1

短视频点标题click
    公共-删除数据
    短视频-点标题
    sleep    3
    公共-校验数据    ${click}    click_41    ${table_channel_click}    1

首页stay
    公共-校验数据    ${stay}    stay_30    ${table_stay}    1

进入点播页pvs
    公共-校验数据    ${pvs}    ai_duanshipin_01    ${table_pvs_dianbo}    1

进入点播页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_01    ${table_pvs1}    1

关注up主pfc
    公共-删除数据
    公共－点击页面文本    关注
    公共-校验数据    ${pfc}    pfc-fol    ${table_click}    1

弹出登录框pv
    公共-校验数据    ${pvs}    pinglun_001    ${table_pvs}    1

弹出登录框cv
    公共-校验数据    ${cv}    login_02    ${table_cv}    1

点播页stay
    公共-校验数据    ${stay}    stay_30    ${table_stay}    1

关闭登录框pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    pinglun_002    ${table_pvs}    1

点播页点up主pfc
    公共-删除数据
    短视频-点头像
    sleep    3
    公共-校验数据    ${pfc}    pfc-touxiang    ${table_click}    1

点播页进入个人主页pvs
    公共-校验数据    ${pvs}    ai_duanshipin_02    ${table_pvs}    1

点播页进入个人主页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_02    ${table_pvs1}    1

个人主页作品-视频tab曝光cv
    公共-校验数据    ${cv}    zhuye_01    ${table_cv}    1

个人主页芒果崽曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=24'}    show_zhuye_01    ${table_show}    1

个人主页作品视频曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=25'}    show_zhuye_02    ${table_show}    1

个人主页作品播单曝光show
    公共-校验数据    {'logtype':'show','lob':'smod=27'}    show_zhuye_03    ${table_show}    1

点播单更多pfc
    公共-删除数据
    个人主页-作品-点打包看更多
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_31    ${table_click}    1

关闭播单列表
    个人主页-作品-关闭打包看

点播单视频进点沉浸式pvs
    公共-删除数据
    个人主页-作品-点播单视频
    公共-校验数据    ${pvs}    ai_duanshipin_03    ${table_pvs_dianbo}    1

点播单视频进点沉浸式pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_03    ${table_pvs1}    1

沉浸式返回个人主页pvs
    公共-删除数据
    沉浸式-返回
    公共-校验数据    ${pvs}    ai_duanshipin_04    ${table_pvs}    1

沉浸式返回个人主页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_04    ${table_pvs1}    1

点列表视频pfc
    公共-删除数据
    个人主页-作品-点列表视频
    公共-校验数据    ${fantuan}    fantuan_tadezhuye_32    ${table_click}    1

点列表视频进点沉浸式pvs1
    公共-校验数据    ${pvs}    ai_duanshipin_05    ${table_pvs_dianbo}    1

点列表视频进点沉浸式pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_05    ${table_pvs1}    1

返回个人主页
    沉浸式-返回

个人主页返回点播页pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    ai_duanshipin_06    ${table_pvs}    1

个人主页返回点播页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_06    ${table_pvs1}    1

点播页返回频道
    点播播放页-返回

短视频点图片click
    公共-删除数据
    短视频-点标题
    sleep    3
    公共-校验数据    ${click}    click_40    ${table_channel_click}    1

点播页返回频道
    点播播放页-返回

频道点头像
    公共-删除数据
    短视频-点头像
    公共-校验数据    ${click}    click_41    ${table_channel_click}    1

频道进入个人主页pvs
    公共-校验数据    ${pvs}    ai_duanshipin_07    ${table_pvs_other}    1

个人主页返回点播页pvs1
    公共-校验数据    ${pvs1}    ai_duanshipin_04    ${table_pvs1}    1
