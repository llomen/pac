*** Settings ***
Documentation     快捷icon、热门话题
Suite Setup       启动应用2
Suite Teardown    公共－关闭应用
Force Tags        smoke
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${my}             {'act':'my'}
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${pvs1_H5}        {'logtype':'pv','cntp':'qt_webview'}
${table_show_ft}    mpp_show_iphone_ft

*** Test Cases ***
饭团pvs
    公共-删除数据
    首页-饭团
    公共-校验数据    ${pvs}    ft_tuijian_001    ${table_pvs}    1

饭团pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_001    ${table_pvs1}    1

进入饭团show-banner
    sleep    5
    公共-校验数据    {'logtype':'show','smod':'5'}    square_01    ${table_show_ft}    1

进入饭团show-热门话题
    sleep    5
    公共-校验数据    {'logtype':'show','smod':'7'}    square_02    ${table_show_ft}    1

进入饭团show-人气榜
    sleep    5
    公共-校验数据    {'logtype':'show','smod':23}    square_04    ${table_show_ft}    1

进入饭团show-最佳饭贴
    sleep    5
    公共-校验数据    {'logtype':'show','smod':'70'}    square_03    ${table_show_ft}    1

消息中心pvs
    公共-删除数据
    饭团-消息
    公共-校验数据    ${pvs}    ft_tuijian_008    ${table_pvs}    1

消息中心pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_008    ${table_pvs1}    1

消息中心fantuan
    公共-校验数据    ${fantuan}    fantuan_tuijian_03    ${table_click}    1

消息中心msgc
    公共-校验数据    ${msgc}    msgc_tuijian    ${table_click}    1

广场stay
    公共-校验数据    ${stay}    stay_01    ${table_stay}    1

消息中心返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_tuijian_009    ${table_pvs}    1

消息中心返回pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_009    ${table_pvs1}    1

快捷icon-芒果人气榜pvs
    公共-删除数据
    饭团广场-快捷icon芒果人气榜
    公共-校验数据    ${pvs}    ft_guangchang_01    ${table_pvs}    1

快捷icon-芒果人气榜pvs1
    公共-校验数据    ${pvs1_H5}    ft_guangchang_01    ${table_pvs1}    1

快捷icon-芒果人气榜fantuan
    #上报2条，一条快捷icon114,一条人气榜137
    公共-校验数据    ${fantuan}    fantuan_guangchang_01    ${table_click}    1

芒果人气榜返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_02    ${table_pvs}    1

芒果人气榜返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_02    ${table_pvs1}    1

快捷icon-明星来了pvs
    公共-删除数据
    sleep    2
    饭团广场-快捷icon明星来了
    公共-校验数据    ${pvs}    ft_guangchang_03    ${table_pvs}    1

快捷icon-明星来了pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_03    ${table_pvs1}    1

快捷icon-明星来了fantuan
    公共-校验数据    ${fantuan}    fantuan_guangchang_02    ${table_click}    1

明星来了点详情fantuan
    公共-删除数据
    明星来了-查看详情
    公共-校验数据    ${fantuan}    fantuan_guangchang_04    ${table_click}    1

明星来了-明星说pvs
    公共-校验数据    ${pvs}    ft_guangchang_05    ${table_pvs}    1

明星来了-明星说pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_05    ${table_pvs1}    1

明星来了stay
    公共-校验数据    ${stay}    stay_22    ${table_stay}    1

明星说-明星来了pvs
    公共-删除数据
    饭团-明星-返回
    公共-校验数据    ${pvs}    ft_guangchang_06    ${table_pvs}    1

明星说-明星来了pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_06    ${table_pvs1}    1

明星来了返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_04    ${table_pvs}    1

明星来了返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_04    ${table_pvs1}    1

点热门话题标题fantuan
    公共-删除数据
    饭团广场-热门话题title
    公共-校验数据    ${fantuan}    fantuan_guangchang_06    ${table_click}    1

热门话题pvs
    公共-校验数据    ${pvs}    ft_guangchang_11    ${table_pvs}    1

热门话题pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_11    ${table_pvs1}    1

热门话题页点话题fantuan
    公共-删除数据
    饭团广场-热门话题第一个
    公共-校验数据    ${fantuan}    fantuan_guangchang_07    ${table_click}    1

热门话题-话题详情页pvs
    公共-校验数据    ${pvs}    ft_guangchang_13    ${table_pvs}    1

热门话题-话题详情页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_13    ${table_pvs1}    1

热门话题stay
    公共-校验数据    ${stay}    stay_23    ${table_stay}    1

话题详情页-热门话题pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_14    ${table_pvs}    1

话题详情页-热门话题pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_14    ${table_pvs1}    1

热门话题-广场pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_12    ${table_pvs}    1

热门话题-广场pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_12    ${table_pvs1}    1

广场点第一个话题fantuan
    公共-删除数据
    饭团广场-热门话题第一个
    公共-校验数据    ${fantuan}    fantuan_guangchang_08    ${table_click}    1

热门话题详情页pvs
    公共-校验数据    ${pvs}    ft_guangchang_15    ${table_pvs}    1

热门话题详情页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_15    ${table_pvs1}    1

热门话题详情页show
    公共-校验数据    ${show}    square_07    ${table_show_ft}    1

话题详情页-广场pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_16    ${table_pvs}    1

话题详情页-广场pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_16    ${table_pvs1}    1

话题详情页stay
    公共-校验数据    ${stay}    stay_27    ${table_stay}    1

点发布fantuan
    公共-删除数据
    饭团-发布
    公共-校验数据    ${fantuan}    fantuan_guangchang_09    ${table_click}    1

跳转登录页pvs
    公共-校验数据    ${pvs}    ft_guangchang_09    ${table_pvs}    1

跳转登录页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_09    ${table_pvs1}    0

登录页cv
    公共-校验数据    ${cv}    login_03    ${table_cv}    1

登录页返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_guangchang_10    ${table_pvs}    1

登录页返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_10    ${table_pvs1}    0

最佳饭贴标题fantuan
    公共-删除数据
    饭团广场-最佳饭贴标题
    公共-校验数据    ${fantuan}    fantuan_guangchang_25    ${table_click}    1

最佳饭贴pvs
    公共-校验数据    ${pvs}    ft_guangchang_07    ${table_pvs}    1

最佳饭贴pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_07    ${table_pvs1}    1

最佳饭贴返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_08    ${table_pvs}    1

最佳饭贴返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_08    ${table_pvs1}    1

最佳饭贴stay
    公共-校验数据    ${stay}    stay_26    ${table_stay}    1

点banner-fantuan
    公共-删除数据
    饭团广场-点banner
    公共-校验数据    ${fantuan}    fantuan_guangchang_26    ${table_click}    1

热门话题详情页2pvs
    公共-校验数据    ${pvs}    ft_guangchang_15    ${table_pvs}    1

热门话题详情页2pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_15    ${table_pvs1}    1

话题详情页-广场2pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_16    ${table_pvs}    1

话题详情页-广场2pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_16    ${table_pvs1}    1

点单个饭贴fantuan
    公共-删除数据
    饭团广场-点单个饭贴
    公共-校验数据    ${fantuan}    fantuan_guangchang_25    ${table_click}    1

最佳饭贴2pvs
    公共-校验数据    ${pvs}    ft_guangchang_07    ${table_pvs}    1

最佳饭贴2pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_07    ${table_pvs1}    1

最佳饭贴返回2pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_08    ${table_pvs}    1

最佳饭贴返回2pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_08    ${table_pvs1}    1

参与开通饭团show
    公共-删除数据
    Comment    上滑
    swipe    200    400    200    100
    公共-校验数据    {'logtype':'show','smod':'6'}    square_05    ${table_show_ft}    1

点参与开通fantuan
    公共-删除数据
    饭团广场-立即参与
    公共-校验数据    ${fantuan}    fantuan_guangchang_27    ${table_click}    1

开通饭团投票中pvs
    公共-校验数据    ${pvs}    ft_guangchang_41    ${table_pvs}    1

开通饭团投票中pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_41    ${table_pvs1}    1

切换tab投票成功pvs
    公共-删除数据
    饭团-投票成功tab
    公共-校验数据    ${pvs}    ft_guangchang_42    ${table_pvs}    1

切换tab投票成功pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_42    ${table_pvs1}    1

投票中stay
    公共-校验数据    ${stay}    stay_28    ${table_stay}    1

点开通饭团fantuan
    公共-删除数据
    饭团-开通饭团
    公共-校验数据    ${fantuan}    fantuan_guangchang_28    ${table_click}    1

开通饭团跳转登录页pvs
    公共-校验数据    ${pvs}    ft_guangchang_43    ${table_pvs}    1

开通饭团跳转登录页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_43    ${table_pvs1}    0

登录页2cv
    公共-校验数据    ${cv}    login_04    ${table_cv}    1

投票成功stay
    公共-校验数据    ${stay}    stay_29    ${table_stay}    1

登录页返回开通饭团pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_guangchang_44    ${table_pvs}    1

登录页返回开通饭团pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_44    ${table_pvs1}    0

投票成功返回广场pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_45    ${table_pvs}    1

投票成功返回广场pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_45    ${table_pvs1}    1
