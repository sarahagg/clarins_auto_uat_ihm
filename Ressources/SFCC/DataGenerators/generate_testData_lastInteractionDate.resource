*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Last Interaction Date
    [Arguments]          ${reason}

    Set To Dictionary    ${canonical_form_last_interaction_date_link_files}       \${email}              ${canonical_form_contact_link_files.get('\${email}')}
    Set To Dictionary    ${canonical_form_last_interaction_date_link_files}       \${country}            ${canonical_form_contact_link_files.get('\${country}')}
    ${current_date}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    Set To Dictionary    ${canonical_form_last_interaction_date_link_files}       \${lastInteractionDate}              ${current_date}
    Set To Dictionary    ${canonical_form_last_interaction_date_link_files}       \${reason}             ${reason}
