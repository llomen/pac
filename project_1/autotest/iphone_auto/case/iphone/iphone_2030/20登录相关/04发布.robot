*** Settings ***
Suite Setup       启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${pvs}            {'act':'pvs'}
${fantuan}        {'act':'fantuan'}
${stay}           {'logtype':'stay'}
${msgc}           {'act':'msgc'}
${my}             {'act':'my'}
${table}          mpp_pv_5_5_iphone_sdk_qita
${table_stay}     mpp_stay_iphone
${table_click}    mpp_jiaohu_iphone
${search_keyword}    刘涛
#${url}           https://m.mgtv.com/fantuan/3753d4bcd2edc95bc33f95e06bddcd14/list.html?feedid=1029185
${url}            我在这儿等你回来tttt

*** Test Cases ***
点击发布fantuan
    首页-饭团
    comment    公共－点击页面文本    推荐
    公共-删除数据
    饭团-发布
    公共-校验数据    ${fantuan}    fantuan_tuijian_20    ${table_click}    1

推荐页到发布页pvs
    公共-校验数据    ${pvs}    ft_tuijian_014    ${table}    1

点击选饭团fantuan
    公共-删除数据
    饭团-发布-选择饭团
    公共-校验数据    ${fantuan}    fantuan_fabu_01    ${table_click}    1

发布页-饭团选择页pvs
    公共-校验数据    ${pvs}    ft_tuijian_015    ${table}    1

发布页stay
    公共-校验数据    ${stay}    stay_09    ${table_stay}    1

点击搜索fantuan
    公共-删除数据
    饭团-搜索
    公共-校验数据    ${fantuan}    fantuan_fabu_08    ${table_click}    1

选择页-搜索页pvs
    公共-校验数据    ${pvs}    ft_tuijian_016    ${table}    1

饭团选择页stay
    公共-校验数据    ${stay}    stay_10    ${table_stay}    1

搜索页返回pvs
    公共-删除数据
    page should contain text    热门搜索
    公共－点击页面文本    取消
    公共-校验数据    ${pvs}    ft_tuijian_017    ${table}    1

取消选择饭团fantuan
    公共-删除数据
    page should contain text    选择饭团
    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_fabu_02    ${table_click}    1

选择一个饭团fantuan
    饭团-发布-选择饭团
    公共-删除数据
    公共－点击页面文本    ${search_keyword}
    公共-校验数据    ${fantuan}    fantuan_fabu_03    ${table_click}    1

选择页-发布页pvs
    公共-校验数据    ${pvs}    ft_tuijian_018    ${table}    1

上传图片fantuan
    公共-删除数据
    饭团-发布-选择图片
    run keyword and ignore error    公共－点击页面文本    不允许
    run keyword and ignore error    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_fabu_04    ${table_click}    1

上传视频fantuan
    公共-删除数据
    饭团-发布-选择视频
    run keyword and ignore error    公共－点击页面文本    不允许
    run keyword and ignore error    公共－点击页面文本    取消
    公共-校验数据    ${fantuan}    fantuan_fabu_05    ${table_click}    1

发布fantuan
    公共-删除数据
    ${letters}=    Evaluate    "".join(random.sample(string.letters+string.digits,30))    random,string
    饭团-发布-输入内容    ${letters}
    sleep    3
    饭团-发布-提交
    公共-校验数据    ${fantuan}    fantuan_fabu_06    ${table_click}    1

发布-推荐pvs
    公共-校验数据    ${pvs}    ft_tuijian_019    ${table}    1

取消发布fantuan
    饭团-发布
    公共-删除数据
    饭团-发布-取消
    公共-校验数据    ${fantuan}    fantuan_fabu_07    ${table_click}    1

取消发布pvs
    公共-校验数据    ${pvs}    ft_tuijian_020    ${table}    1

动态-更多fantuan
    饭团-我的头像
    公共－点击页面文本    动态
    公共-删除数据
    饭团-动态-更多
    公共-校验数据    ${fantuan}    fantuan_fabu_10    ${table_click}    1

删除动态fantuan
    公共-删除数据
    公共－点击页面文本    删除
    公共-校验数据    ${fantuan}    fantuan_fabu_11    ${table_click}    1
