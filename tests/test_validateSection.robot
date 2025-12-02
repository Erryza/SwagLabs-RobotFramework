*** Settings ***
Resource    ../page_objects/login_page/actions.robot
Resource    ../page_objects/validate_section/action.robot

*** Test Cases ***
Validate All Section
    [Documentation]
    Open Login Page
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button

    # * Validate Header Section
    Validate Assert Title Section Header
    Sleep    3s
    Validate Function Section Header
    Sleep    3s
    # Validate Assert Title Section Footer
    # Sleep    3s
    # Validate Function Section Footer
    [Teardown]

