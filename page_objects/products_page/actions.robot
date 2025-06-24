*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    products_elements.robot

*** Keywords ***
Select Option By Value 
    [Arguments]    ${selid}    ${value}
    Click Element    //select[@class='${selid}']
    Click Element    //option[@value='${value}']

Filter All Products
    [Documentation]    Iterate through sorting options and apply each filter
    @{elements}=    Get WebElements    ${SORTING_PRODUCTS}
    ${count}=    Get Length    ${elements}
    
    FOR    ${index}    IN RANGE    ${count} 
        @{elements}=    Get WebElements    ${SORTING_PRODUCTS} 
        ${text}=    Get Text    ${elements}[${index}]
        Click Element    ${DROPDOWN_PRODUCTS}
        Sleep    1s
        Select From List By Label    ${DROPDOWN_PRODUCTS}    ${text}
    END

Add Products To Cart
    [Arguments]    ${fill_product}
    ${products}    Get WebElements    ${INVENTORY_LIST}
    ${buttons}    Get WebElements    ${ADD_CART_BUTTON}

    FOR    ${index}    IN RANGE    0    ${products.__len__()}
        ${product_name}    Get Text    ${products}[${index}]
        IF    '${product_name}' == '${fill_product}' 
            Click Button    ${buttons}[${index}]
            Exit For Loop
        END
    END

Click Shopping Cart Button
    Click Element    ${ICON_CART}

Click Remove Button
    Click Element    ${REMOVE_PRODUCT}

Click Checkout Button
    Click Button    ${CHECKOUT_BUTTON}

Enter Checkout Your Information
    [Arguments]    ${first_name}     ${last_name}     ${postal_code}
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}   timeout=10
    Input Text     ${FIRST_NAME_FIELD}    ${first_name}

    Wait Until Element Is Visible    ${LAST_NAME_FIELD}   timeout=10
    Input Text     ${LAST_NAME_FIELD}    ${last_name}

    Wait Until Element Is Visible    ${POSTAL_CODE_FIELD}   timeout=10
    Input Text    ${POSTAL_CODE_FIELD}     ${postal_code}

Click Continue Button
    Click Button    ${CONTINUE_BUTTON}

Verify Checkout Overview
    ${title}=     Get Text    ${TITLE_OVERVIEW}
    Should Be Equal As Strings    ${title}  Checkout: Overview

