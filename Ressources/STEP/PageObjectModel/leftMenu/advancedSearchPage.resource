*** Settings ***
Documentation       all the keywords needed to navigate on the left menu

Resource            ..${/}..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***
Email Attribute
    [Arguments]   ${email}

    Click        ${advancedSearchPage_attribut_tag}
    ${webloggin}=  Set Variable  Web login (webLogin)
    Click        ${advancedSearchPage_node_icon}
    Click        ${advancedSearchPage_SelectionnerNoeudPopup_Rechercher_Tab}
    Fill Text    ${advancedSearchPage_SelectionnerNoeudPopup_Rechercher_input}  ${webloggin}
    Click        ${advancedSearchPage_SelectionnerNoeudPopup_Rechercher_button}
    Click        ${advancedSearchPage_SelectionnerNoeudPopup_ok_button}
    Fill Text    ${advancedSearchPage_email_input}                              ${email}
    Press Keys   ${advancedSearchPage_email_input}                              Enter
    Click        ${advancedSearchPage_search_button}
    Click        ${advancedSearchPage_contact_ccid_value}

    ${is_visible}=    Check If Element Is Visible And Warn If Not    ${globalSearchTab_multipleElements_table}
    IF    $is_visible == 'PASS'    Click    ${globalSearchTab_firstElement_link}
