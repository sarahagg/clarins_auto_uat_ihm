*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Add Chosen Product To Cart
    Wait For Elements State    ${searchResult_doubleserum_div}    visible
    hover                      ${searchResult_doubleserum_div}
    Click                      ${searchResult_doubleserum_div}
    Wait For Elements State    ${searchResult_add_to_bag_button}    visible
    Click                      ${searchResult_add_to_bag_button}

