*** Settings ***
Documentation     实时播报、发布
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
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

*** Test Cases ***
热门话题详情页show
    首页-饭团
    公共-删除数据
    饭团广场-热门话题第一个
    公共-校验数据    ${show}    show_fantuan_01    ${table_show}    1

切换tab页到明星来了pvs
    公共-删除数据
    热门话题-明星来了
    公共-校验数据    ${pvs}    ft_guangchang_21    ${table_pvs}    1

切换tab页到明星来了pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_21    ${table_pvs1}    1

热门互动tab页stay
    公共-校验数据    ${stay}    stay_01    ${table_stay}    1

明星来了tab页show
    公共-校验数据    ${show}    show_fantuan_01    ${table_show}    1

切换回热门互动tab页pvs
    公共-删除数据
    热门话题-热门互动
    公共-校验数据    ${pvs}    ft_guangchang_22    ${table_pvs}    1

切换回热门互动tab页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_22    ${table_pvs1}    1

明星来了tab页stay
    公共-校验数据    ${stay}    stay_01    ${table_stay}    1

切换tab不重复上报show
    公共-校验数据    ${show}    show_fantuan_01    ${table_show}    0

相关饭团-明星饭团pvs
    公共-删除数据
    热门话题-明星饭团
    公共-校验数据    ${pvs}    ft_guangchang_23    ${table_pvs}    1

相关饭团-明星饭团pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_23    ${table_pvs1}    1

点相关饭团-明星饭团fantuan
    公共-校验数据    ${fantuan}    fantuan_guangchang_12    ${table_click}    1

明星饭团show
    公共-校验数据    ${show}    show_fantuan_01    ${table_show}    1

明星饭团-话题详情页pvs
    公共-删除数据
    饭团-明星-返回
    公共-校验数据    ${pvs}    ft_guangchang_24    ${table_pvs}    1

明星饭团-话题详情页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_24    ${table_pvs1}    1

明星饭团stay
    公共-校验数据    ${stay}    stay_01    ${table_stay}    1

相关饭团-节目饭团pvs
    公共-删除数据
    热门话题-节目饭团
    公共-校验数据    ${pvs}    ft_guangchang_25    ${table_pvs}    1

相关饭团-节目饭团pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_25    ${table_pvs1}    1

点相关饭团-节目饭团fantuan
    公共-校验数据    ${fantuan}    fantuan_guangchang_12    ${table_click}    1

节目饭团show
    公共-校验数据    ${show}    show_fantuan_01    ${table_show}    1

节目饭团-话题详情页pvs
    公共-删除数据
    饭团-明星-返回
    公共-校验数据    ${pvs}    ft_guangchang_26    ${table_pvs}    1

节目饭团-话题详情页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_26    ${table_pvs1}    1

节目饭团stay
    公共-校验数据    ${stay}    stay_01    ${table_stay}    1

热门互动-点动态头像fantuan
    公共-删除数据
    热门互动-动态头像
    公共-校验数据    ${fantuan}    fantuan_guangchang_12    ${table_click}    1

热门互动-个人主页pvs
    公共-校验数据    ${pvs}    ft_guangchang_27    ${table_pvs}    1

热门互动-个人主页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_27    ${table_pvs1}    1

个人主页-热门互动pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    ft_guangchang_28    ${table_pvs}    1

个人主页-热门互动pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_28    ${table_pvs1}    1

点动态饭团fantuan
    公共-删除数据
    热门互动-动态的饭团
    公共-校验数据    ${fantuan}    fantuan_guangchang_13    ${table_click}    1

动态饭团-明星饭团pvs
    公共-校验数据    ${pvs}    ft_guangchang_23    ${table_pvs}    1

动态饭团-明星饭团pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_23    ${table_pvs1}    1

动态饭团返回
    饭团-明星-返回

点动态内容fantuan
    公共-删除数据
    热门互动-动态内容
    公共-校验数据    ${fantuan}    fantuan_guangchang_14    ${table_click}    1

动态详情pvs
    公共-校验数据    ${pvs}    ft_guangchang_29    ${table_pvs}    1

动态详情pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_29    ${table_pvs1}    1

动态详情show
    公共-校验数据    ${show}    show_fantuan_01    ${table_show}    1

动态详情返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_30    ${table_pvs}    1

动态详情返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_30    ${table_pvs1}    1

动态详情stay
    公共-校验数据    ${stay}    stay_01    ${table_stay}    1

动态点赞fantuan
    公共-删除数据
    热门互动-动态点赞
    公共-校验数据    ${fantuan}    fantuan_guangchang_15    ${table_click}    1

点赞跳登录页pvs
    公共-校验数据    ${pvs}    ft_guangchang_31    ${table_pvs}    1

点赞跳登录页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_31    ${table_pvs1}    1

登录页返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_guangchang_32    ${table_pvs}    1

登录页返回pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_32    ${table_pvs1}    1

点动态评论fantuan
    公共-删除数据
    热门互动-动态评论
    公共-校验数据    ${fantuan}    fantuan_guangchang_16    ${table_click}    1

点动态评论跳动态详情pvs
    公共-校验数据    ${pvs}    ft_guangchang_29    ${table_pvs}    1

点动态评论跳动态详情pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_29    ${table_pvs1}    1

动态详情返回2pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_guangchang_30    ${table_pvs}    1

动态详情返回2pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_30    ${table_pvs1}    1

点发布fantuan
    公共-删除数据
    饭团-发布
    公共-校验数据    ${fantuan}    fantuan_guangchang_17    ${table_click}    1

点发布登录页pvs
    公共-校验数据    ${pvs}    ft_guangchang_31    ${table_pvs}    1

点发布跳登录页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_31    ${table_pvs1}    1

登录页返回2pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_guangchang_32    ${table_pvs}    1

登录页返回2pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_32    ${table_pvs1}    1

动态点举报fantuan
    公共-删除数据
    热门互动-动态举报
    公共-校验数据    ${fantuan}    fantuan_guangchang_18    ${table_click}    1

动态取消举报fantuan
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_guangchang_19    ${table_click}    1

动态举报内容fantuan
    热门互动-动态举报
    公共－点击页面文本    举报
    公共-删除数据
    公共－点击页面文本    其他
    公共-校验数据    ${fantuan}    fantuan_guangchang_20    ${table_click}    1

明星来了-点动态头像fantuan
    热门话题-明星来了
    公共-删除数据
    热门互动-动态头像
    公共-校验数据    ${fantuan}    fantuan_guangchang_21    ${table_click}    1

明星来了-个人主页pvs
    公共-校验数据    ${pvs}    ft_guangchang_33    ${table_pvs}    1

明星来了-个人主页pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_33    ${table_pvs1}    1

明星来了-热门互动pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    ft_guangchang_34    ${table_pvs}    1

明星来了-热门互动pvs1
    公共-校验数据    ${pvs1}    ft_guangchang_34    ${table_pvs1}    1
