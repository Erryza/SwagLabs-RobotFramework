*** Settings ***
Resource    ../page_objects/login_page/actions.robot

*** Test Cases ***
Valid Login Test
    [Documentation]    Test for valid login
    Open Login Page
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button
    Close Browser
    [Teardown]

Invalid Login Test
    [Documentation]    Test for invalid login
    Open Login Page
    Enter Username    Jajang
    Enter Password    Ucup
    Click Login Button
    Verify Error Message
    Close Browser
    [Teardown]