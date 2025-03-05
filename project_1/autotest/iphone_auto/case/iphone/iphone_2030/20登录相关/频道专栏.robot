*** Settings ***
Suite Setup       公共－启动应用
Suite Teardown    公共－关闭应用
Resource          ../5.3对象库.robot


*** Variables ***
${table_pvs}      mpp_pv_5_5_iphone_sdk_qita
${table_pvs_dianbo}    mpp_pv_5_5_iphone_sdk_dianbo
${table_chzlshow}    mpp_ip_chzlshow
${table_chzlclick}    mpp_ip_chzlclick
${chzlshow}       {'act':'chzlshow'}
${chzlclick}      {'act':'chzlclick'}
${columnist}      {'act':'columnist'}

*** Test Cases ***
专栏show
    首页-频道管理
    公共-删除数据
    公共－点击页面文本    动漫
    sleep    2
    公共-校验数据    {'logtype':'show'}    show_zl_01    ${table_show}    1

进入频道chzlshow
    公共-校验数据    ${chzlshow}    chzlshow_002    ${table_chzlshow}    1

频道页点头像chzlclick
    公共-删除数据
    频道专栏-点头像
    sleep    2
    公共-校验数据    ${chzlclick}    chzlclick_005    ${table_chzlclick}    1

点头像columnist
    公共-校验数据    ${columnist}    columnist_02    ${table_click}    1

个人主页专栏tab页pvs
    公共-校验数据    ${pvs}    zhuanlan_001    ${table_pvs}    1

个人主页专栏tab页pvs1
    公共-校验数据    ${pvs1}    zhuanlan_001    ${table_pvs1}    1

个人主页专栏tab页返回pvs
    公共-删除数据
    饭团-个人主页-返回
    公共-校验数据    ${pvs}    zhuanlan_002    ${table_pvs}    1

个人主页专栏tab页返回pvs1
    公共-校验数据    ${pvs1}    zhuanlan_002    ${table_pvs1}    1

个人主页专栏tab页
    公共-校验数据    ${stay}    stay_19    ${table_stay}    1

未登录关注chzlclick
    公共-删除数据
    频道专栏-关注
    公共-校验数据    ${chzlclick}    chzlclick_002    ${table_chzlclick}    1

未登录关注columnist
    公共-校验数据    ${columnist}    columnist_03    ${table_click}    1

跳转登录页pvs
    公共-校验数据    ${pvs}    zhuanlan_005    ${table_pvs}    1

跳转登录页pvs1
    公共-校验数据    ${pvs1}    zhuanlan_005    ${table_pvs1}    1

登录后跳转回专栏频道
    直接登录    ${mail_account}    ${mail_pwd}    ${mail_name}

登录后关注chzlclick
    公共-删除数据
    频道专栏-关注
    公共-校验数据    ${chzlclick}    chzlclick_012    ${table_chzlclick}    1

登录后关注columnist
    公共-校验数据    ${columnist}    columnist_22    ${table_click}    1

取消关注chzlclick
    公共-删除数据
    频道专栏-取消关注
    公共-校验数据    ${chzlclick}    chzlclick_006    ${table_chzlclick}    1

取消关注columnist
    公共-校验数据    ${columnist}    columnist_04    ${table_click}    1

滑动专栏chzlshow
    公共-删除数据
    上滑
    公共-校验数据    ${chzlshow}    chzlshow_004    ${table_chzlshow}    1

滑动专栏show
    公共-校验数据    {'logtype':'show'}    show_zl_01    ${table_show}    1

点标题图片chzlclick
    频道专栏-点图片
    sleep    3
    公共-校验数据    ${chzlclick}    chzlclick_004    ${table_chzlclick}    1

点标题图片columnist
    公共-校验数据    ${columnist}    columnist_01    ${table_click}    1

进入专栏H5页pvs
    公共-校验数据    ${pvs}    zhuanlan_003    ${table_pvs}    1

进入专栏H5页pvs1
    公共-校验数据    ${pvs1}    zhuanlan_003    ${table_pvs1}    1

专栏H5页返回pvs
    公共-删除数据
    sleep    5
    专栏H5-返回
    公共-校验数据    ${pvs}    zhuanlan_004    ${table_pvs}    1

专栏H5页返回pvs1
    公共-校验数据    ${pvs1}    zhuanlan_004    ${table_pvs1}    1

专栏H5页stay
    公共-校验数据    ${stay}    stay_19    ${table_stay}    1
