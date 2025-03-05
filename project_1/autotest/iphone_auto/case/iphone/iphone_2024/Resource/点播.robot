*** Settings ***
Library           AppiumLibrary

*** Keywords ***
点播播放页－异常返回
    sleep    1
    Click Element    name=play backicon
    sleep    2

点播播放页－会员免广告
    sleep    1
    Click Element    name=会员免广告
    sleep    2

点播播放页－静音
    sleep    1
    tap    640    35
    sleep    2
    comment    xpath: //UIAApplication[1]/UIAWindow[1]/UIAImage[7]    640    35

点播播放页－下载
    sleep    1
    tap    vodinfo download    0    0
    Comment    Click Element    name=vodinfo download
    sleep    2

点播播放页－收藏
    sleep    1
    Click Element    name=vodinfo collection
    sleep    2

点播播放页－分享
    sleep    2
    Click Element    name=vodinfo share
    sleep    2

全屏播放页－分享
    tap    300    300
    sleep    1
    Click Element    name=icon share

直播播放页－分享
    click a point    200    200
    sleep    2
    Click Element    name=plyer share
    sleep    2

点播播放页－点击猜你喜欢
    sleep    1
    Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAStaticText[1]
    sleep    2

点播播放页－点击相关推荐
    sleep    1
    scroll to    xpath=//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIACollectionView[3]/UIACollectionCell[1]/UIAStaticText[2]
    Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIACollectionView[3]/UIACollectionCell[1]/UIAStaticText[2]
    sleep    2

点播播放页－立即开通
    click element    name=立即开通
    comment    xpath: //UIAApplication[1]/UIAWindow[2]/UIAButton[2]

点播播放－全屏
    click element    name=icon magnify

点播播放－立刻开通
    click element    name: 立刻开通
    comment    xpath: //UIAApplication[1]/UIAWindow[2]/UIAButton[2]

下载－关闭
    click element    name=close icon
    sleep    1

下载－下载第一个
    click element    xpath=//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]/UIAButton[1]

换一换
    click element    name=change

短片更多-关闭
    click element    name=vodInfo cancel

播单－看了还会看
    sleep    1
    tap    看了还会看    0    100
    sleep    2

点播－评论滑动
    swipe    600    700    -500    0
    swipe    600    700    -250    0

广告播放页－返回
    sleep    1
    tap    play backicon    20    10
    sleep    2

点播播放页－小窗
    sleep    2
    tap    player Smallwindow icon    20    10
    sleep    2
