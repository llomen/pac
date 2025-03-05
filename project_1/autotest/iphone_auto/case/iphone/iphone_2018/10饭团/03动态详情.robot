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
${shareresult}    {'act':'shareresult'}
${comment}        {'act':'comment'}
${table}          mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${table_click}    mpp_jiaohu_iphone
${aplay}          {"act":"aplay"}
${buffer2}        {"act":"buffer"}
${hb3}            {'act':'hb','ht':'0'}
${hb5}            {'act':'hb','ht':'1'}
${hb_end}         {'act':'hb','ht':'2'}

*** Test Cases ***
进入饭团主页pvs
    首页-饭团
    上滑
    饭团-动态-内容
    公共-删除数据
    饭团-详情页-饭团主页
    公共-校验数据    ${pvs}    ft_xiangqing_01    ${table_pvs}    1

饭团主页返回pvs
    公共-删除数据
    page should contain text    全部动态
    非播放页-返回
    公共-校验数据    ${pvs}    ft_xiangqing_02    ${table_pvs}    1

点击更多fantuan
    公共-删除数据
    饭团-动态-更多
    公共-校验数据    ${fantuan}    fantuan_xiangqing_02    ${table_click}    1

更多取消fantuan
    公共-删除数据
    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_xiangqing_03    ${table_click}    1

点赞fantuan
    公共-删除数据
    饭团-动态-点赞
    公共-校验数据    ${fantuan}    fantuan_xiangqing_04    ${table_click}    1

详情页跳登录页pvs
    公共-校验数据    ${pvs}    ft_xiangqing_03    ${table_pvs}    1

登录页返回pvs
    公共-删除数据
    登录页-关闭
    公共-校验数据    ${pvs}    ft_xiangqing_04    ${table_pvs}    1

评论fantuan
    公共-删除数据
    饭团-动态-评论
    公共-校验数据    ${fantuan}    fantuan_xiangqing_05    ${table_click}    1

分享fantuan
    非播放页-返回
    公共-删除数据
    饭团-动态-分享
    公共-校验数据    ${fantuan}    fantuan_xiangqing_06    ${table_click}    1

分享弹出share
    公共-校验数据    ${share}    fantuan_xiangqing_10    ${table_click}    1

分享到复制链接share
    公共-删除数据
    饭团-分享到    复制链接
    公共-校验数据    ${share}    fantuan_xiangqing_07    ${table_click}    1

点评论输入框comment
    公共-删除数据
    饭团-详情页-评论输入框
    非播放页-返回
    公共-校验数据    ${comment}    fantuan_xiangqing_08    ${table_click}    1

点视频fantuan
    公共-删除数据
    饭团-详情页-点视频
    公共-校验数据    ${fantuan}    fantuan_xiangqing_09    ${table_click}    1

视频动态详情页pvs
    公共-校验数据    ${pvs}    ft_xiangqing_05    ${table_pvs}    1

点击播放aplay
    sleep    6
    公共-校验数据    ${aplay}    fantuan_feed_01    ${table_vv}    1

点击播放buffer
    公共-校验数据    ${buffer}    fantuan_feed_01    mpp_buffer_5_iphone    1

点击播放hb3
    公共-校验数据    ${hb3}    fantuan_feed_01    mpp_hb_5_iphone    1

点击播放hb5
    公共-校验数据    ${hb5}    fantuan_feed_02    mpp_hb_5_iphone    1

进度控制页面pvs
    获取屏幕中心点
    公共-删除数据
    饭团-视频详情页-暂停视频
    公共-校验数据    ${pvs}    ft_xiangqing_07    ${table_pvs}    1

进度控制页面返回pvs
    公共-删除数据
    click a point    200    200
    sleep    2
    公共-校验数据    ${pvs}    ft_xiangqing_08    ${table_pvs}    1

点赞
    comment    饭团-视频详情页-点赞

继续播放
    饭团-视频详情页-暂停视频
    sleep    5

上滑播放下一个视频
    上滑

视频动态详情页返回pvs
    公共-删除数据
    点播播放页-返回
    公共-校验数据    ${pvs}    ft_xiangqing_06    ${table_pvs}    1
