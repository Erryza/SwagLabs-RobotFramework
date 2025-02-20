*** Settings ***
Resource    ../page_objects/login_page/actions.robot
Library    Collections
Library    JSONLibrary
Library    OperatingSystem

*** Variables ***
${CREDENTIALS_FILE}    resources/user_crendentials.json

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
    Title Should Be    Swag Labs
    Enter Username    Jajang
    Enter Password    Ucup
    Click Login Button
    Verify Error Message    Epic sadface: Username and password do not match any user in this service
    Close Browser
    [Teardown]

Logout Account Test
    [Documentation]    Test for Logout Account
    Open Login Page
    Title Should Be    Swag Labs
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button
    Sleep    3s

    # TODO: Logout
    Click Logout Button
    Title Should Be    Swag Labs
    Validate the URL    https://www.saucedemo.com/
    Close Browser
    [Teardown]
    
Login With Multiple Credentials
    ${credentials}=    Read JSON File    ${CREDENTIALS_FILE}
    
    FOR    ${user}    IN    @{credentials['users']}
        ${username}=    Get From Dictionary    ${user}    username
        ${password}=    Get From Dictionary    ${user}    password
        ${expected_msg}=    Get From Dictionary    ${user}    expected_message

        Open Login Page
        Title Should Be    Swag Labs
        Enter Username    ${username}
        Enter Password    ${password}
        Click Login Button
        Run Keyword If    '${user["name"]}' == "Verify login with a valid username & password"    Verify Success Message    ${expected_msg}
        Run Keyword If    '${user["name"]}' != "Verify login with a valid username & password"    Verify Error Message    ${expected_msg}
        Sleep    1s
        Close Browser
    END

