*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Finalize Order

    Wait For Elements State     ${shoppingBasketPage_finalize_your_order_button}   visible
    Click    ${shoppingBasketPage_finalize_your_order_button}
    sleep  1S

