*** Settings ***
Library    SeleniumLibrary
Resource    login_elements.robot

*** Keywords ***
Open Login Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${USERNAME_FIELD}   timeout=10
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}   timeout=10
    Input Text   ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify Error Message
    ${message}=     Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${message}    Epic sadface: Username and password do not match any user in this service


