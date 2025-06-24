*** Variables ***
${DROPDOWN_PRODUCTS}    xpath=//select[@class='product_sort_container']
${SORTING_PRODUCTS}    xpath=//select[1]/option
${INVENTORY_LIST}    xpath=//div[contains(@class, 'inventory_item_name')] 
${ADD_CART_BUTTON}   xpath=//button[text()='Add to cart']
${ICON_CART}    xpath=//a[@class='shopping_cart_link']
${CHECKOUT_BUTTON}    xpath=//button[@id='checkout']
${FIRST_NAME_FIELD}    xpath=//input[@id='first-name']
${LAST_NAME_FIELD}    xpath=//input[@id='last-name']
${POSTAL_CODE_FIELD}    xpath=//input[@id='postal-code']
${CONTINUE_BUTTON}    xpath=//input[@id='continue']
${TITLE_OVERVIEW}    xpath=//span[@class='title']
${REMOVE_PRODUCT}    xpath=(//button[normalize-space()='Remove'])[1]