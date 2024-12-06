*** Settings ***
Documentation       all the keywords needed to use the global search tab and find a contact

Resource            ..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***
Search Contact And Access Contact Page
    [Arguments]    ${email}

    Fill Text    ${globalSearchTab_research_input}    ${email}
    Press Keys    ${globalSearchTab_iconResearch_button}    Enter

    ${is_visible}=    Check If Element Is Visible And Warn If Not    ${globalSearchTab_multipleElements_table}
    IF    $is_visible == 'PASS'    Click    ${globalSearchTab_firstElement_link}
