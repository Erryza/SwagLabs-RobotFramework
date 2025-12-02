*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    validate_elements.robot


*** Keywords ***
Validate Assert Title Section Header
    Title Should Be    Swag Labs
    
Validate Function Section Header
    Wait Until Element Is Visible        ${MENU_BUTTON}
    Click Element    ${MENU_BUTTON}
    Wait Until Element Is Visible        ${CLOSE_BUTTON}
    Click Element    ${CLOSE_BUTTON}
    Wait Until Element Is Visible        ${ICON_CART}
    Click Element    ${ICON_CART}
    Wait Until Element Is Visible        ${CONTINUE_SHOPPING_BUTTON}
    Click Element    ${CONTINUE_SHOPPING_BUTTON}

Validate Function Section Footer
    Click Element    ${ICON_TWITTER}
    Click Element    ${ICON_FACEBOOK}
    Click Element    ${ICON_LINKEDIN}

Validate Assert Title Section Footer
    Click Element    ${TITLE_FOOTER}



