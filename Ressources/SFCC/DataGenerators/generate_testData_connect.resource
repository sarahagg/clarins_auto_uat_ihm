*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data connection
    [Arguments]    ${email}

    Import FakerLibrary    ${country}
    ${generated_email}=             Generate Email               ${email}

    Set To Dictionary    ${canonical_form_contact_link_files}    \${email}                       ${generated_email}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${country}                     ${country}
