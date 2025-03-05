*** Settings ***
Resource          ./网络.robot
Resource          ./Variables.robot
Resource          ./公共事件.robot
Resource          ./公共操作.robot

*** Keywords ***
闪图-点第一个
    click a point    45    410

闪图-点第三个
    click a point    200    410

闪图-点大图
    click a point    220    200

点闪图下图标
    公共－点击页面文本    小说

芒果文学返回
    sleep    2
    公共－点击页面文本    giftListClose

猜你在追-点标题
    公共－xpath    //XCUIElementTypeStaticText[@name="麻雀"]

猜你在追-点举报
    tap    麻雀    132    25

点举报选项
    公共－点击页面文本    不想追了

点当季热播
    公共－点击页面文本    完美关系

点击活动窗口
    tap    芒果热议    10    -70

评论模块-点名字
    公共－点击页面文本    世界太好而我不值得

评论模块-点内容
    tap    世界太好而我不值得    0    50

评论模块-点视频
    公共－点击页面文本    时光与你都很甜 第31集

话题模块-点话题
    公共－点击页面文本    一眼就爱上的女主角

话题模块-点广场
    公共－点击页面文本    话题广场

滑动到即将上线
    上滑
    sleep    2
    公共-删除数据
    上滑
    上滑
    swipe    100    500    100    300

即将上线-点小图
    tap    向往的生活4    10    -50

即将上线-点大图
    公共－xpath    //XCUIElementTypeStaticText[@name="向往的生活4"]/following-sibling::XCUIElementTypeButton[1]

即将上线-点预约
    公共－xpath    (//XCUIElementTypeButton[@name="预约"])[2]

即将上线-点我的预约
    公共－点击页面文本    我的预约

滑动到专栏
    上滑
    sleep    2
    上滑
    上滑
    公共-删除数据
    上滑

专栏-点标题
    公共－点击页面文本    扎心了！106个明星为何炅庆生，只有1个明星为黄子韬庆生

专栏-点图片
    tap    扎心了！106个明星为何炅庆生，只有1个明星为黄子韬庆生    100    -100

专栏-点头像
    公共－点击页面文本    娱评人吴清功

专栏-点评论
    公共－点击页面文本    45

专栏-点阅读量
    公共－点击页面文本    5.9万

专栏-点更多专栏
    公共－点击页面文本    更多专栏

滑动到短视频
    上滑
    sleep    2
    上滑
    上滑
    公共-删除数据
    上滑
    上滑

短视频-点标题
    公共－点击页面文本    【王一博】最棒的少年

短视频-点图片
    tap    迪宝loveyou    0    -100

短视频-点头像
    公共－点击页面文本    甜甜的伊苏

个人主页-作品-点打包看更多
    公共－xpath    //XCUIElementTypeStaticText[@name="打包看"]/following-sibling::XCUIElementTypeButton[1]

个人主页-作品-关闭打包看
    点击不可见文本    personal_zp_arrow

个人主页-作品-点播单视频
    公共－点击页面文本    王一博视频

个人主页-作品-点列表视频
    公共－xpath    //XCUIElementTypeStaticText[@name="#圈粉投稿#王一博 我的微笑不是真的在笑"]

个人主页-作品-点专栏标题
    公共－点击页面文本    《乘风破浪的姐姐》出道选手参加《花儿与少年4》，芒果选秀重回巅峰

个人主页-关注
    sleep    2
    click element    nsp= name =="关注" and visible == true

滑动到猜你喜欢
    上滑
    sleep    2
    上滑
    上滑
    上滑
    上滑
    sleep    2
    上滑
    公共-删除数据
    上滑

滑动到猜你喜欢-短片
    上滑

猜你喜欢-点大图播放
    tap    开了50多年的合川粉店！    0    -200

猜你喜欢-点大图标题
    公共－点击页面文本    开了50多年的合川粉店！

猜你喜欢-点看正片
    公共－xpath    (//XCUIElementTypeStaticText[@name="看正片"])[1]

猜你喜欢-点小图标题
    按坐标点击元素    缠绵悱恻 初遇夫妇一吻动情

猜你喜欢-点小图图片
    tap    缠绵悱恻 初遇夫妇一吻动情    0    -100
