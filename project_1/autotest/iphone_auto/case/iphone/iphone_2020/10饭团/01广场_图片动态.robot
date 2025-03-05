*** Settings ***
Documentation     实时播报、发布
Suite Setup       启动应用2
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
带图片动态曝光show
    首页-饭团
    上滑
    公共-删除数据
    sleep    1
    swipe    200    500    200    200
    sleep    2
    公共-校验数据    {'logtype':'show','smod':'1'}    square_07    ${table_show_ft}    1

图片曝光show
    公共-校验数据    {'logtype':'show','smod':'19'}    square_08    ${table_show_ft}    1

左滑第二张图片曝光show
    公共-删除数据
    sleep    1
    swipe    400    500    100    500
    sleep    2
    公共-校验数据    {'logtype':'show','smod':'19'}    square_08    ${table_show_ft}    1

点图片进入图片浏览页fantuan
    公共-删除数据
    饭团-点图片
    公共-校验数据    ${fantuan}    fantuan_tuijian_06    ${table_click}    1

进入图片预览页pvs
    公共-校验数据    ${pvs}    ft_tuijian_033    ${table_pvs}    1

进入图片预览页pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_033    ${table_pvs1}    1

图片预览点展开fantuan
    公共-删除数据
    饭团-图片浏览-展开
    公共-校验数据    ${fantuan}    fantuan_tuijian_21    ${table_click}    1

图片预览点内容fantuan
    公共-删除数据
    饭团-图片浏览-点内容
    公共-校验数据    ${fantuan}    fantuan_tuijian_23    ${table_click}    1

图片预览-饭团详情pvs
    公共-校验数据    ${pvs}    ft_tuijian_035    ${table_pvs}    1

图片预览-饭团详情pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_035    ${table_pvs1}    1

饭团详情-图片预览pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_tuijian_036    ${table_pvs}    1

饭团详情-图片预览pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_036    ${table_pvs1}    1

图片预览点赞fantuan
    公共-删除数据
    饭团-图片浏览-点赞
    公共-校验数据    ${fantuan}    fantuan_tuijian_24    ${table_click}    1

图片预览-登录页pvs
    公共-校验数据    ${pvs}    ft_tuijian_037    ${table_pvs}    1

登录页-图片预览pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_tuijian_038    ${table_pvs}    1

图片预览点评论fantuan
    公共-删除数据
    饭团-图片浏览-点评论
    公共-校验数据    ${fantuan}    fantuan_tuijian_25    ${table_click}    1

图片预览点下载fantuan
    非播放页-返回
    公共-删除数据
    饭团-图片浏览-点下载
    判断后点击    取消
    公共-校验数据    ${fantuan}    fantuan_tuijian_26    ${table_click}    1

图片预览点话题fantuan
    公共-删除数据
    饭团-图片浏览-点内容中的话题
    公共-校验数据    ${fantuan}    fantuan_tuijian_27    ${table_click}    1

图片预览-话题详情pvs
    公共-校验数据    ${pvs}    ft_tuijian_039    ${table_pvs}    1

图片预览-话题详情pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_039    ${table_pvs1}    1

话题详情-图片预览pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_tuijian_040    ${table_pvs}    1

话题详情-图片预览pvs1
    公共-校验数据    ${pvs1}    ft_tuijian_040    ${table_pvs1}    1

图片预览点收起fantuan
    公共-删除数据
    饭团-图片浏览-收起
    公共-校验数据    ${fantuan}    fantuan_tuijian_22    ${table_click}    1

图片预览点分享fantuan
    公共-删除数据
    饭团-图片浏览-点分享
    公共-校验数据    ${fantuan}    fantuan_tuijian_28    ${table_click}    1

图片预览分享弹出share
    公共-校验数据    ${share}    fantuan_share_09    ${table_click}    1

图片预览复制链接share
    公共-删除数据
    公共－点击页面文本    复制链接
    公共-校验数据    {'act':'share','pos':'8'}    fantuan_share_10    ${table_click}    1

图片预览点大图fantuan
    公共-删除数据
    饭团-图片浏览-点图片
    公共-校验数据    ${fantuan}    fantuan_tuijian_29    ${table_click}    1

退出图片预览pvs
    公共-校验数据    ${pvs}    ft_tuijian_034    ${table_pvs}    1

*** Keywords ***
