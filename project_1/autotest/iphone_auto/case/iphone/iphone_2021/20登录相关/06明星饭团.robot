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
${table}          mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${table_click}    mpp_jiaohu_iphone

*** Test Cases ***
加入饭团fantuan
    首页-饭团
    上滑
    饭团-动态-来自饭团
    饭团-明星-退出饭团
    公共-删除数据
    饭团-明星-加入饭团
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_01    ${table_click}    1

发布fantuan
    公共-删除数据
    饭团-发布
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_02    ${table_click}    1

饭团主页-发布页pvs
    公共-校验数据    ${pvs}    ft_mingxing_01    ${table_pvs}    1

饭团主页-发布页pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_01    ${table_pvs1}    1

发布页返回pvs
    公共-删除数据
    饭团-发布-取消
    公共-校验数据    ${pvs}    ft_mingxing_02    ${table_pvs}    1

发布页返回pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_02    ${table_pvs1}    1

签到fantuan
    公共-删除数据
    饭团-明星-签到
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_12    ${table_click}    1

打榜fantuan
    公共-删除数据
    饭团-明星-打榜
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_13    ${table_click}    1

打榜页面pvs
    公共-校验数据    ${pvs}    ft_mingxing_05    ${table_pvs}    1

打榜页面pvs1
    公共-校验数据    ${pvs1_H5}    ft_mingxing_05    ${table_pvs1}    1

关闭打榜页面pvs
    公共-删除数据
    饭团-关闭浮层
    公共-校验数据    ${pvs}    ft_mingxing_06    ${table_pvs}    1

关闭打榜页面pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_06    ${table_pvs1}    1

粉丝fantuan
    公共-删除数据
    饭团-明星-粉丝
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_14    ${table_click}    1

明星饭团成员pvs
    公共-校验数据    ${pvs}    ft_mingxing_07    ${table_pvs}    1

明星饭团成员pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_07    ${table_pvs1}    1

查看权益-小团长fantuan
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="查看权益"])[1]
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_17    ${table_click}    1

饭团成员-小团长权益pvs
    公共-校验数据    ${pvs}    ft_mingxing_09    ${table_pvs}    1

饭团成员-小团长权益pvs1
    公共-校验数据    ${pvs1_H5}    ft_mingxing_09    ${table_pvs1}    1

权益页返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_mingxing_10    ${table_pvs}    1

权益页返回pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_10    ${table_pvs1}    1

查看权益-创意板fantuan
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="查看权益"])[2]
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_18    ${table_click}    1

查看权益-饭团贡献榜fantuan
    非播放页-返回
    公共-删除数据
    公共－xpath    (//XCUIElementTypeButton[@name="查看权益"])[3]
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_19    ${table_click}    1

立即申请fantuan
    非播放页-返回
    公共-删除数据
    公共－点击页面文本    立即申请
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_20    ${table_click}    1

明星饭团成员返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_mingxing_08    ${table_pvs}    1

明星饭团成员返回pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_08    ${table_pvs1}    1

人气榜fantuan
    公共-删除数据
    饭团-明星-人气榜
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_15    ${table_click}    1

人气榜pvs
    公共-校验数据    ${pvs}    ft_mingxing_05    ${table_pvs}    1

人气榜pvs1
    公共-校验数据    ${pvs1_H5}    ft_mingxing_05    ${table_pvs1}    1

人气榜返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_mingxing_06    ${table_pvs}    1

人气榜返回pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_06    ${table_pvs1}    1

饭团头衔fantuan
    公共-删除数据
    饭团-明星-饭团头衔
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_16    ${table_click}    1

饭团头衔pvs
    公共-校验数据    ${pvs}    ft_mingxing_05    ${table_pvs}    1

饭团头衔pvs1
    公共-校验数据    ${pvs1_H5}    ft_mingxing_05    ${table_pvs1}    1

饭团头衔返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_mingxing_06    ${table_pvs}    1

饭团头衔返回pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_06    ${table_pvs1}    1

粉丝头衔fantuan
    公共-删除数据
    饭团-明星-动态头衔
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_23    ${table_click}    1

点击设置fantuan
    非播放页-返回
    公共-删除数据
    饭团-明星-更多
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_03    ${table_click}    1

分享框弹出share
    公共-校验数据    ${share}    fantuan_fantuanzhuye_21    ${table_click}    1

分享到朋友圈share
    公共-删除数据
    饭团-分享到    朋友圈
    公共-校验数据    ${share}    fantuan_fantuanzhuye_04    ${table_click}    1

退出饭团fantuan
    饭团-明星-更多
    公共-删除数据
    公共－点击页面文本    退出饭团
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_05    ${table_click}    1

全部动态-作品pvs
    公共-删除数据
    公共－点击页面文本    作品
    公共-校验数据    ${pvs}    ft_mingxing_03    ${table_pvs}    1

全部动态-作品pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_03    ${table_pvs1}    1

点作品进点播页pvs
    公共-删除数据
    点击不可见文本    密室大逃脱
    公共-校验数据    ${pvs}    ft_mingxing_13    ${table_pvs}    1

点作品进点播页pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_13    ${table_pvs1}    1

点播页返回作品pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    ft_mingxing_14    ${table_pvs}    1

点播页返回作品pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_14    ${table_pvs1}    1

作品-全部动态pvs
    公共-删除数据
    公共－点击页面文本    全部动态
    公共-校验数据    ${pvs}    ft_mingxing_04    ${table_pvs}    1

作品-全部动态pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_04    ${table_pvs1}    1

点击动态更多fantuan
    公共-删除数据
    饭团-动态-更多
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_06    ${table_click}    1

更多取消fantuan
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_07    ${table_click}    1

点赞fantuan
    公共-删除数据
    上滑
    饭团-动态-点赞
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_08    ${table_click}    1

取消点赞fantuan
    公共-删除数据
    饭团-动态-点赞
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_24    ${table_click}    1

评论fantuan
    公共-删除数据
    饭团-动态-评论
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_09    ${table_click}    1

动态详情pvs
    公共-校验数据    ${pvs}    ft_mingxing_11    ${table_pvs}    1

动态详情pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_11    ${table_pvs1}    1

动态详情返回pvs
    公共-删除数据
    非播放页-返回
    公共-校验数据    ${pvs}    ft_mingxing_12    ${table_pvs}    1

动态详情返回pvs1
    公共-校验数据    ${pvs1}    ft_mingxing_12    ${table_pvs1}    1

分享fantuan
    公共-删除数据
    饭团-动态-分享
    公共-校验数据    ${fantuan}    fantuan_fantuanzhuye_10    ${table_click}    1

分享到QQ空间share
    公共-删除数据
    公共－点击页面文本    QQ空间
    公共-校验数据    ${share}    fantuan_fantuanzhuye_11    ${table_click}    1

分享到QQ空间shareresult
    公共-删除数据
    分享到QQ空间
    公共-校验数据    ${shareresult}    fantuan_fantuanzhuye_22    ${table_click}    1
