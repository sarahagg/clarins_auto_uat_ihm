*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Transaction

    Set To Dictionary    ${canonical_form_transaction_link_files}       \${email}              ${canonical_form_contact_link_files.get('\${email}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${country}            ${canonical_form_contact_link_files.get('\${country}')}

