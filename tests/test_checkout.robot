*** Settings ***
Resource    ../page_objects/login_page/actions.robot
Resource    ../page_objects/products_page/actions.robot

*** Test Cases ***
Filtering All Products
    [Documentation]    Filtering All Products
    Open Login Page
    Maximize Browser Window
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Login Button
    
    # * Filter All Products
    Filter All Products    
    Sleep    5s
    Close Browser
    [Teardown]

Checkout the Products
    [Documentation]    Checkout the Products
    Open Login Page
    Maximize Browser Window
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












