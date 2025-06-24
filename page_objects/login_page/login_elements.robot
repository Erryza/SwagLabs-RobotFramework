*** Variables ***
# * Login Elements
${URL}    https://www.saucedemo.com/
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}    id=login-button
${ERROR_MESSAGE}  xpath=/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[3]/h3[1]
${TITLE_MESSAGE}    xpath=//span[@class='title']

# * Logout Elements
${LOGOUT_BUTTON}    xpath=(//a[normalize-space()='Logout'])[1]

# * Other Buttons
${MENU_BUTTON}    xpath=//button[@id='react-burger-menu-btn']
${CLOSE_BUTTON}    xpath=(//button[normalize-space()='Close Menu'])[1]





