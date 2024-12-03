*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Go To Login Page
    Click    ${homePage_login_button}