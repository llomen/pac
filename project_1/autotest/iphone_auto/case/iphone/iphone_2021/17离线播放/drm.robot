*** Settings ***
Documentation     正片、花絮、相关饭团、看了还会看
Force Tags        test1
Resource          ../5.3对象库.robot


*** Test Cases ***
printtext
    log    ${udid}
    log    ${platform2}
    log    ${platform3}
