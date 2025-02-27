*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Go To Login Page
    Click    ${headerMenu_login_button}

Search For A Product
    Wait For Elements State    ${headerMenu_search_bar_button}   visible
    Fill Text    ${headerMenu_search_bar_button}    80103084
    Click    ${headerMenu_search_button}
    sleep  1S
view Cart
    hover    ${headerMenu_minibag_button}
    Click    ${headerMenu_minibag_button}
