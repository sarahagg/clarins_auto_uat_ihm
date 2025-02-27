*** Settings ***
Documentation       All the keywords to generate test data for the test case subscribeNewsletter

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Newsletter
    [Arguments]    ${email}    ${country}    ${creationSystem}   ${lastModificationSystem}

    Import FakerLibrary    ${country}

    ${generated_email}=    Generate Email    ${email}   ${country}
    ${current_date}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S

    Set To Dictionary    ${canonical_form_contact_link_files}    \${email}                     ${generated_email}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${country}                   ${country}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${creationSystem}            ${creationSystem}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${createDate}                ${current_date}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastModificationSystem}    ${lastModificationSystem}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastUpdateDate}      ${current_date}

