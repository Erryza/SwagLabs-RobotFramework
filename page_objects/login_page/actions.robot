*** Settings ***
Library    SeleniumLibrary
Resource    login_elements.robot
Library    JSONLibrary
Library    OperatingSystem
Library    Collections

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

Click Logout Button
    Click Button    ${HAMBURGER_BUTTON}
    Sleep    1s
    Click Element    ${LOGOUT_BUTTON}

Validate the URL 
    [Arguments]    ${expected_url}
    ${current_url}=    Get Location   
    Should Be Equal As Strings    ${current_url}    ${expected_url}

Verify Success Message
    [Arguments]    ${expected_message}
    ${success_msg}=     Get Text    ${TITLE_MESSAGE}
    Should Be Equal As Strings    ${success_msg}    ${expected_message}

Verify Error Message
    [Arguments]    ${expected_message}
    ${error_msg}=     Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${error_msg}    ${expected_message}

Read JSON File
    [Arguments]    ${file}
    ${json_data}=    Evaluate    json.loads(open('${file}').read())    modules=json
    [Return]    ${json_data}
    

