*** Settings ***
Resource    ../page_objects/login_page/actions.robot
Resource    ../page_objects/products_page/actions.robot

*** Test Cases ***
Filtering All Products
    [Documentation]    Filtering All Products
    Open Login Page
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button
    
    # * Filter All Products
    Filter All Products    
    Sleep    5s
    Close Browser
    [Teardown]

Validate Menu Button
    [Documentation]
    Open Login Page
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button
    
    # * Click Menu Button
    Click Menu Button
    Sleep    2s
    Click Close Button
    Sleep    5s
    Close Browser
    [Teardown]

Checkout the Products
    [Documentation]    Checkout the Products
    Open Login Page
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button
    
    # TODO: "Added to cart"
    Add Products To Cart    Sauce Labs Bike Light
    Sleep    5s
    Click Shopping Cart Button
    Click Checkout Button

    # TODO: "Fill Address Information"
    Enter Checkout Your Information    Erryza    Nur Alif    19123
    Sleep    2s
    Click Continue Button
    Verify Checkout Overview
    Sleep    5s
    Close Browser
    [Teardown]

Delete the Products
    [Documentation]
    Open Login Page
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button
    
    # TODO: "Added to cart"
    Add Products To Cart    Sauce Labs Bike Light
    Sleep    5s
    Click Shopping Cart Button
    Sleep     5s
    Click Remove Button
    Sleep    5s
    Close Browser
    [Teardown]













