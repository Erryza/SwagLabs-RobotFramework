*** Settings ***
Resource    ../page_objects/login_page/actions.robot
Library    Collections
Library    JSONLibrary
Library    OperatingSystem

*** Variables ***
${CREDENTIALS_FILE}    resources/user_crendentials.json

*** Test Cases ***
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