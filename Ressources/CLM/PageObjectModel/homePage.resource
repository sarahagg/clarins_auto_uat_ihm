*** Settings ***
Documentation       all the keywords needed to navigate on the home page

Resource            ..${/}Common${/}a_import_all_common_CLM.resource


*** Keywords ***
Search Account By Email
    [Arguments]    ${email}

    Click           ${homePage_advancedSearch_arrow}
    Fill text       ${homePage_email_input}    ${email}
    Click           ${homePage_search_button}
    Click           ${homePage_email_firstResultLine_value.replace('$EMAIL$', '${email}')}
